package org.linphone.core;

import android.content.Context;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import org.linphone.mediastream.MediastreamerAndroidContext;
import org.linphone.mediastream.Version;
import org.linphone.tools.OpenH264DownloadHelper;

public class LinphoneCoreFactoryImpl extends LinphoneCoreFactory {
    static {
        System.loadLibrary("c++_shared");
        loadOptionalLibrary("ffmpeg-linphone");
        System.loadLibrary("bctoolbox");
        System.loadLibrary("ortp");
        System.loadLibrary("mediastreamer_base");
        System.loadLibrary("mediastreamer_voip");
        System.loadLibrary("linphone");
        Version.dumpCapabilities();
    }

    private native Object _createTunnelConfig();

    private native void _setLogHandler(Object obj);

    private native long createErrorInfoNative();

    private native DialPlan[] getAllDialPlanNative();

    public static boolean isArmv7() {
        return System.getProperty("os.arch").contains("armv7");
    }

    private static boolean loadOptionalLibrary(String str) {
        try {
            System.loadLibrary(str);
            return true;
        } catch (Throwable th) {
            Log.w("LinphoneCoreFactoryImpl", "Unable to load optional library " + str + ": " + th.getMessage());
            return false;
        }
    }

    private boolean loadingDownloadedOpenH264(Context context) {
        if (!new File(context.getApplicationInfo().nativeLibraryDir + "/libmsopenh264.so").exists()) {
            org.linphone.mediastream.Log.i("LinphoneCoreFactoryImpl", " libmsopenh264 not found, we disable the download of Openh264");
            return false;
        }
        OpenH264DownloadHelper openH264DownloadHelper = new OpenH264DownloadHelper(context);
        if (openH264DownloadHelper.isCodecFound()) {
            org.linphone.mediastream.Log.i("LinphoneCoreFactoryImpl", " Loading OpenH264 downloaded plugin:" + openH264DownloadHelper.getFullPathLib());
            System.load(openH264DownloadHelper.getFullPathLib());
        } else {
            org.linphone.mediastream.Log.i("LinphoneCoreFactoryImpl", " Cannot load OpenH264 downloaded plugin");
        }
        return true;
    }

    private void setSpeaker(LinphoneCore linphoneCore) {
        boolean speakerphoneAlwaysOn = MediastreamerAndroidContext.getSpeakerphoneAlwaysOn(linphoneCore.getMSFactory());
        linphoneCore.setSpeakerphoneAlwaysOn(speakerphoneAlwaysOn);
        linphoneCore.enableSpeaker(speakerphoneAlwaysOn);
    }

    public LinphoneAccountCreator createAccountCreator(LinphoneCore linphoneCore, String str) {
        return new LinphoneAccountCreatorImpl(linphoneCore, str);
    }

    public LinphoneAuthInfo createAuthInfo(String str, String str2, String str3, String str4) {
        return new LinphoneAuthInfoImpl(str, str2, str3, str4);
    }

    public LinphoneAuthInfo createAuthInfo(String str, String str2, String str3, String str4, String str5, String str6) {
        return new LinphoneAuthInfoImpl(str, str2, str3, str4, str5, str6);
    }

    public ErrorInfo createErrorInfo() {
        return new ErrorInfoImpl(createErrorInfoNative(), true);
    }

    public LinphoneAddress createLinphoneAddress(String str) throws LinphoneCoreException {
        return new LinphoneAddressImpl(str);
    }

    public LinphoneAddress createLinphoneAddress(String str, String str2, String str3) {
        return new LinphoneAddressImpl(str, str2, str3);
    }

    public LinphoneContent createLinphoneContent(String str, String str2, String str3) {
        return new LinphoneContentImpl(str, str2, str3 == null ? null : str3.getBytes(), (String) null);
    }

    public LinphoneContent createLinphoneContent(String str, String str2, byte[] bArr, String str3) {
        return new LinphoneContentImpl(str, str2, bArr, str3);
    }

    public LinphoneCore createLinphoneCore(LinphoneCoreListener linphoneCoreListener, Object obj) throws LinphoneCoreException {
        try {
            this.fcontext = (Context) obj;
            boolean z = false;
            if (obj != null) {
                z = loadingDownloadedOpenH264(this.fcontext);
            }
            MediastreamerAndroidContext.setContext(obj);
            LinphoneCoreImpl linphoneCoreImpl = new LinphoneCoreImpl(linphoneCoreListener, obj);
            setSpeaker(linphoneCoreImpl);
            linphoneCoreImpl.enableDownloadOpenH264(z);
            return linphoneCoreImpl;
        } catch (IOException e) {
            throw new LinphoneCoreException("Cannot create LinphoneCore", e);
        }
    }

    public LinphoneCore createLinphoneCore(LinphoneCoreListener linphoneCoreListener, String str, String str2, Object obj, Object obj2) throws LinphoneCoreException {
        File file = null;
        try {
            this.fcontext = (Context) obj2;
            boolean loadingDownloadedOpenH264 = obj2 != null ? loadingDownloadedOpenH264(this.fcontext) : false;
            MediastreamerAndroidContext.setContext(obj2);
            File file2 = str == null ? null : new File(str);
            if (str2 != null) {
                file = new File(str2);
            }
            LinphoneCoreImpl linphoneCoreImpl = new LinphoneCoreImpl(linphoneCoreListener, file2, file, obj, obj2);
            setSpeaker(linphoneCoreImpl);
            linphoneCoreImpl.enableDownloadOpenH264(loadingDownloadedOpenH264);
            return linphoneCoreImpl;
        } catch (IOException e) {
            throw new LinphoneCoreException("Cannot create LinphoneCore", e);
        }
    }

    @Deprecated
    public LinphoneFriend createLinphoneFriend() {
        return createLinphoneFriend((String) null);
    }

    @Deprecated
    public LinphoneFriend createLinphoneFriend(String str) {
        return new LinphoneFriendImpl(str);
    }

    public LpConfig createLpConfig(String str) {
        return LpConfigImpl.fromFile(str);
    }

    public LpConfig createLpConfigFromString(String str) {
        return LpConfigImpl.fromBuffer(str);
    }

    public OpenH264DownloadHelper createOpenH264DownloadHelper() {
        if (this.fcontext != null) {
            return new OpenH264DownloadHelper(this.fcontext);
        }
        new LinphoneCoreException("Cannot create OpenH264DownloadHelper");
        return null;
    }

    public PresenceActivity createPresenceActivity(PresenceActivityType presenceActivityType, String str) {
        return new PresenceActivityImpl(presenceActivityType, str);
    }

    public PresenceModel createPresenceModel() {
        return new PresenceModelImpl();
    }

    public PresenceModel createPresenceModel(PresenceActivityType presenceActivityType, String str) {
        return new PresenceModelImpl(presenceActivityType, str);
    }

    public PresenceModel createPresenceModel(PresenceActivityType presenceActivityType, String str, String str2, String str3) {
        return new PresenceModelImpl(presenceActivityType, str, str2, str3);
    }

    public PresenceService createPresenceService(String str, PresenceBasicStatus presenceBasicStatus, String str2) {
        return new PresenceServiceImpl(str, presenceBasicStatus, str2);
    }

    public TunnelConfig createTunnelConfig() {
        return (TunnelConfig) _createTunnelConfig();
    }

    public native void enableLogCollection(boolean z);

    public DialPlan[] getAllDialPlan() {
        return getAllDialPlanNative();
    }

    public native void setDebugMode(boolean z, String str);

    public native void setLogCollectionPath(String str);

    public void setLogHandler(LinphoneLogHandler linphoneLogHandler) {
        _setLogHandler(linphoneLogHandler);
    }
}
