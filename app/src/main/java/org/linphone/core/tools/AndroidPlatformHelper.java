package org.linphone.core.tools;

import android.content.Context;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.PowerManager;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.List;
import org.linphone.core.BuildConfig;
import org.linphone.mediastream.Log;
import org.linphone.mediastream.MediastreamerAndroidContext;

public class AndroidPlatformHelper {
    private ConnectivityManager mConnectivityManager;
    private Context mContext;
    private String mErrorToneFile;
    private String mGrammarCpimFile;
    private String mGrammarVcardFile;
    private String mLinphoneRootCaFile;
    private WifiManager.MulticastLock mMcastLock;
    private String mPauseSoundFile;
    private PowerManager mPowerManager;
    private Resources mResources = this.mContext.getResources();
    private String mRingSoundFile;
    private String mRingbackSoundFile;
    private String mUserCertificatePath;
    private PowerManager.WakeLock mWakeLock;
    private WifiManager.WifiLock mWifiLock;

    public AndroidPlatformHelper(Object obj) {
        this.mContext = (Context) obj;
        MediastreamerAndroidContext.setContext(this.mContext);
        WifiManager wifiManager = (WifiManager) this.mContext.getSystemService("wifi");
        this.mPowerManager = (PowerManager) this.mContext.getSystemService("power");
        this.mConnectivityManager = (ConnectivityManager) this.mContext.getSystemService("connectivity");
        this.mWakeLock = this.mPowerManager.newWakeLock(1, "AndroidPlatformHelper");
        this.mWakeLock.setReferenceCounted(true);
        this.mMcastLock = wifiManager.createMulticastLock("AndroidPlatformHelper");
        this.mMcastLock.setReferenceCounted(true);
        this.mWifiLock = wifiManager.createWifiLock(3, "AndroidPlatformHelper");
        this.mWifiLock.setReferenceCounted(true);
        String absolutePath = this.mContext.getFilesDir().getAbsolutePath();
        this.mLinphoneRootCaFile = absolutePath + "/share/linphone/rootca.pem";
        this.mRingSoundFile = absolutePath + "/share/sounds/linphone/rings/notes_of_the_optimistic.mkv";
        this.mRingbackSoundFile = absolutePath + "/share/sounds/linphone/ringback.wav";
        this.mPauseSoundFile = absolutePath + "/share/sounds/linphone/rings/dont_wait_too_long.mkv";
        this.mErrorToneFile = absolutePath + "/share/sounds/linphone/incoming_chat.wav";
        this.mGrammarCpimFile = absolutePath + "/share/belr/grammars/cpim_grammar";
        this.mGrammarVcardFile = absolutePath + "/share/belr/grammars/vcard_grammar";
        this.mUserCertificatePath = absolutePath;
        try {
            copyAssetsFromPackage();
        } catch (IOException e) {
            Log.e("AndroidPlatformHelper(): failed to install some resources.");
        }
    }

    private void copyAssetsFromPackage() throws IOException {
        Log.i("Starting copy from assets to application files directory");
        copyAssetsFromPackage(this.mContext, BuildConfig.APPLICATION_ID, ".");
        Log.i("Copy from assets done");
        Log.i("Starting copy from legacy  resources to application files directory");
        copyEvenIfExists(getResourceIdentifierFromName("cpim_grammar"), this.mGrammarCpimFile);
        copyEvenIfExists(getResourceIdentifierFromName("vcard_grammar"), this.mGrammarVcardFile);
        copyEvenIfExists(getResourceIdentifierFromName("rootca"), this.mLinphoneRootCaFile);
        copyEvenIfExists(getResourceIdentifierFromName("notes_of_the_optimistic"), this.mRingSoundFile);
        copyEvenIfExists(getResourceIdentifierFromName("ringback"), this.mRingbackSoundFile);
        copyEvenIfExists(getResourceIdentifierFromName("hold"), this.mPauseSoundFile);
        copyEvenIfExists(getResourceIdentifierFromName("incoming_chat"), this.mErrorToneFile);
        Log.i("Copy from legacy resources done");
    }

    public static void copyAssetsFromPackage(Context context, String str, String str2) throws IOException {
        new File(context.getFilesDir().getPath() + "/" + str2).mkdir();
        for (String str3 : context.getAssets().list(str)) {
            String str4 = str + "/" + str3;
            String str5 = str2 + "/" + str3;
            try {
                InputStream open = context.getAssets().open(str4);
                FileOutputStream fileOutputStream = new FileOutputStream(new File(context.getFilesDir().getPath() + "/" + str5));
                byte[] bArr = new byte[8048];
                while (true) {
                    int read = open.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    fileOutputStream.write(bArr, 0, read);
                }
                fileOutputStream.flush();
                fileOutputStream.close();
                open.close();
            } catch (IOException e) {
                copyAssetsFromPackage(context, str4, str5);
            }
        }
    }

    private int getResourceIdentifierFromName(String str) {
        int identifier = this.mResources.getIdentifier(str, "raw", this.mContext.getPackageName());
        if (identifier == 0) {
            Log.d("App doesn't seem to embed resource " + str + "in it's res/raw/ directory, use linphone's instead");
            identifier = this.mResources.getIdentifier(str, "raw", "org.linphone");
            if (identifier == 0) {
                Log.i("App doesn't seem to embed resource " + str + "in it's res/raw/ directory. Make sure this file is either brought as an asset or a resource");
            }
        }
        return identifier;
    }

    public void acquireCpuLock() {
        Log.i("acquireCpuLock()");
        this.mWakeLock.acquire();
    }

    public void acquireMcastLock() {
        Log.i("acquireMcastLock()");
        this.mMcastLock.acquire();
    }

    public void acquireWifiLock() {
        Log.i("acquireWifiLock()");
        this.mWifiLock.acquire();
    }

    public void copyEvenIfExists(int i, String str) throws IOException {
        copyFromPackage(i, new File(str));
    }

    public void copyFromPackage(int i, File file) throws IOException {
        if (i == 0) {
            Log.i("Resource identifier null for target [" + file.getName() + "]");
            return;
        }
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        InputStream openRawResource = this.mResources.openRawResource(i);
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        byte[] bArr = new byte[8048];
        while (true) {
            int read = openRawResource.read(bArr);
            if (read != -1) {
                fileOutputStream.write(bArr, 0, read);
            } else {
                fileOutputStream.flush();
                fileOutputStream.close();
                openRawResource.close();
                return;
            }
        }
    }

    public void copyIfNotExist(int i, String str) throws IOException {
        File file = new File(str);
        if (!file.exists()) {
            copyFromPackage(i, file);
        }
    }

    public String getCachePath() {
        return this.mContext.getCacheDir().getAbsolutePath();
    }

    public String getConfigPath() {
        return this.mContext.getFilesDir().getAbsolutePath();
    }

    public String getDataPath() {
        return this.mContext.getFilesDir().getAbsolutePath();
    }

    public String[] getDnsServers() {
        if (this.mConnectivityManager == null || Build.VERSION.SDK_INT < 23 || this.mConnectivityManager.getActiveNetwork() == null || this.mConnectivityManager.getLinkProperties(this.mConnectivityManager.getActiveNetwork()) == null) {
            return null;
        }
        List<InetAddress> dnsServers = this.mConnectivityManager.getLinkProperties(this.mConnectivityManager.getActiveNetwork()).getDnsServers();
        String[] strArr = new String[dnsServers.size()];
        int i = 0;
        for (InetAddress hostAddress : dnsServers) {
            strArr[i] = hostAddress.getHostAddress();
            i++;
        }
        Log.i("getDnsServers() returning");
        return strArr;
    }

    public String getNativeLibraryDir() {
        return this.mContext.getApplicationInfo().nativeLibraryDir;
    }

    public Object getPowerManager() {
        return this.mPowerManager;
    }

    public void releaseCpuLock() {
        Log.i("releaseCpuLock()");
        this.mWakeLock.release();
    }

    public void releaseMcastLock() {
        Log.i("releaseMcastLock()");
        this.mMcastLock.release();
    }

    public void releaseWifiLock() {
        Log.i("releaseWifiLock()");
        this.mWifiLock.release();
    }
}
