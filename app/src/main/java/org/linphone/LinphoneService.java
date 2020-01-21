package org.linphone;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothHeadset;
import android.bluetooth.BluetoothProfile;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.RingtoneManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.PowerManager;
import android.os.Vibrator;
import android.preference.CheckBoxPreference;
import android.preference.PreferenceManager;
import android.util.Log;
import android.widget.Toast;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.provider.KingKingContentProvider;
import com.pccw.mobile.sip.AddCallActivity;
import com.pccw.mobile.sip.AddCallContactDetailsActivity;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.service.Codec;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.Contact;
import com.pccw.mobile.sip.util.ContactsUtils;
import com.pccw.mobile.sip02.R;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import org.apache.commons.lang3.StringUtils;
import org.linphone.core.CallDirection;
import org.linphone.core.Hacks;
import org.linphone.core.LinphoneAddress;
import org.linphone.core.LinphoneAuthInfo;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallStats;
import org.linphone.core.LinphoneChatMessage;
import org.linphone.core.LinphoneChatRoom;
import org.linphone.core.LinphoneContent;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.core.LinphoneCoreFactory;
import org.linphone.core.LinphoneCoreListener;
import org.linphone.core.LinphoneEvent;
import org.linphone.core.LinphoneFriend;
import org.linphone.core.LinphoneFriendList;
import org.linphone.core.LinphoneInfoMessage;
import org.linphone.core.LinphoneProxyConfig;
import org.linphone.core.PayloadType;
import org.linphone.core.PublishState;
import org.linphone.core.Reason;
import org.linphone.core.SubscriptionState;
import org.linphone.core.ToneID;
import org.linphone.mediastream.Version;
import org.linphone.mediastream.video.capture.hwconf.AndroidCameraConfiguration;

public class LinphoneService extends Service implements LinphoneCoreListener {
    public static final int IC_LEVEL_AVAILABLE = 0;
    public static final int IC_LEVEL_AWAY = 1;
    public static final int IC_LEVEL_IDLE = 2;
    public static final int IC_LEVEL_OFFLINE = 3;
    public static final int NOTIFICATION_MISSED_CALL = 0;
    public static final int NOTIFICATION_REGISTRATION_STATUS = 1;
    public static boolean ShowVideoSlidingTab = false;
    public static final String TAG = "PCCW_MOBILE_SIP";
    private static Codec[] codecs = {new Codec("AMR", 8000, R.string.pref_codec_amr_key), new Codec("speex", 32000, R.string.pref_codec_speex32_key), new Codec("speex", 16000, R.string.pref_codec_speex16_key), new Codec("speex", 8000, R.string.pref_codec_speex8_key), new Codec("iLBC", 8000, R.string.pref_codec_ilbc_key), new Codec("GSM", 8000, R.string.pref_codec_gsm_key), new Codec("PCMU", 8000, R.string.pref_codec_pcmu_key), new Codec("PCMA", 8000, R.string.pref_codec_pcma_key)};
    private static List<LinphoneSimpleListener> simpleListeners = new ArrayList();
    private static LinphoneService theLinphone;
    private BroadcastReceiver bluetoothReiceiver = new BluetoothManager();
    private String callWaitingToneSoundFile;
    private boolean echoCalibrationDone = false;
    public boolean isBluetoothScoConnected;
    public boolean isBluetoothScoStarted = false;
    private boolean isRinging;
    public boolean isUsingBluetoothAudioRoute;
    public sipState lastUpdatedSipStatus = new sipState();
    private String linphoneConfigFile;
    private String linphoneInitialConfigFile;
    private AudioManager mAudioManager;
    private BluetoothAdapter mBluetoothAdapter;
    /* access modifiers changed from: private */
    public BluetoothHeadset mBluetoothHeadset;
    LinphoneCall.State mCurrentCallState;
    private Handler mHandler = new Handler();
    private BroadcastReceiver mKeepAliveMgrReceiver = new KeepAliveManager();
    /* access modifiers changed from: private */
    public LinphoneCore mLinphoneCore;
    private BroadcastReceiver mOutgoingCallReceiver = null;
    private SharedPreferences mPref;
    private BluetoothProfile.ServiceListener mProfileListener;
    MediaPlayer mRingerPlayer;
    private Context mServiceContext;
    Timer mTimer = new Timer("Linphone scheduler");
    Vibrator mVibrator;
    private PowerManager.WakeLock mWakeLock;
    private String ringSoundFile;
    private String ringbackSoundFile;
    private LinphoneCall ringingCall;
    private String staticPicFile;

    public class sipState {
        public String domain = null;
        public String identity = null;
        public String proxy = null;
        public String regState = null;
        public String route = null;

        public sipState() {
        }
    }

    /* access modifiers changed from: private */
    public void callLog(LinphoneCall linphoneCall) {
        if (linphoneCall != null) {
            String phoneNumber = MobileSipService.getInstance().getPhoneNumber(linphoneCall);
            if (phoneNumber == null || StringUtils.isBlank(phoneNumber)) {
                phoneNumber = CallerInfo.UNKNOWN_NUMBER;
            } else if (phoneNumber.equals("anonymous")) {
                phoneNumber = CallerInfo.PRIVATE_NUMBER;
            } else if (phoneNumber.equals(CallerInfo.CONFERENCE_NUMBER)) {
                return;
            } else {
                if (MobileSipService.getInstance().shouldRestoreMapPhoneNumber(phoneNumber) != null) {
                    phoneNumber = MobileSipService.getInstance().shouldRestoreMapPhoneNumber(phoneNumber);
                }
            }
            int i = linphoneCall.getDirection() == CallDirection.Incoming ? ((long) linphoneCall.getDuration()) == 0 ? 3 : 1 : 2;
            ContentValues contentValues = new ContentValues();
            contentValues.put(DBHelper.NUMBER, phoneNumber);
            contentValues.put(DBHelper.DATE, Long.valueOf(System.currentTimeMillis()));
            contentValues.put("duration", 0);
            contentValues.put("type", Integer.valueOf(i));
            contentValues.put(DBHelper.NEW, 1);
            contentValues.put("name", "");
            contentValues.put(DBHelper.CACHED_NUMBER_TYPE, 0);
            contentValues.put(DBHelper.CACHED_NUMBER_LABEL, "");
            getContentResolver().insert(KingKingContentProvider.CALL_LOG_URI, contentValues);
            if (i == 3) {
                Contact contact = KingKingLinphoneUtil.getInstance().getContact();
                if (contact == null) {
                    contact = ContactsUtils.getInstance().queryByPhoneNumber(getApplicationContext(), phoneNumber);
                }
                if (contact != null && StringUtils.isNotBlank(contact.displayName)) {
                    phoneNumber = contact.displayName;
                } else if (phoneNumber.equals(CallerInfo.UNKNOWN_NUMBER)) {
                    phoneNumber = getString(R.string.unknown);
                } else if (phoneNumber.equals(CallerInfo.PRIVATE_NUMBER)) {
                    phoneNumber = getString(R.string.private_number);
                }
                makeNotification(this, 0, 0, phoneNumber);
            }
        }
    }

    public static void cancelNotification(Context context, int i) {
        ((NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE)).cancel(i);
    }

    private void copyAssetsFromPackage(Context context) throws IOException {
        copyIfNotExist(context, R.raw.oldphone_mono, this.ringSoundFile);
        copyIfNotExist(context, R.raw.ringback, this.ringbackSoundFile);
        copyIfNotExist(context, R.raw.staticpic, this.staticPicFile);
        copyIfNotExist(context, R.raw.cwt, this.callWaitingToneSoundFile);
        copyFromPackage(context, R.raw.linphonerc, new File(this.linphoneInitialConfigFile).getName());
    }

    private void copyFromPackage(Context context, int i, String str) throws IOException {
        FileOutputStream openFileOutput = context.openFileOutput(str, 0);
        InputStream openRawResource = context.getResources().openRawResource(i);
        byte[] bArr = new byte[8048];
        while (true) {
            int read = openRawResource.read(bArr);
            if (read != -1) {
                openFileOutput.write(bArr, 0, read);
            } else {
                openFileOutput.flush();
                openFileOutput.close();
                openRawResource.close();
                return;
            }
        }
    }

    private void copyIfNotExist(Context context, int i, String str) throws IOException {
        File file = new File(str);
        if (!file.exists()) {
            copyFromPackage(context, i, file.getName());
        }
    }

    @TargetApi(11)
    private void destroyBluetoothProfileProxy() {
        try {
            if (Version.sdkAboveOrEqual(11)) {
                this.mBluetoothAdapter.closeProfileProxy(1, this.mBluetoothHeadset);
            }
        } catch (Exception e) {
        }
    }

    private void enableDisableAudioCodec(String str, int i, int i2) throws LinphoneCoreException {
        PayloadType findPayloadType = this.mLinphoneCore.findPayloadType(str, i);
        if (findPayloadType != null) {
            boolean z = this.mPref.getBoolean(getString(i2), false);
            if ("PCMU".equals(str)) {
                z = this.mPref.getBoolean(getString(i2), true);
            }
            this.mLinphoneCore.enablePayloadType(findPayloadType, z);
        }
    }

    private void enableDisableAudioCodec(String str, int i, boolean z) throws LinphoneCoreException {
        PayloadType findPayloadType = this.mLinphoneCore.findPayloadType(str, i);
        if (findPayloadType != null) {
            this.mLinphoneCore.enablePayloadType(findPayloadType, z);
        }
    }

    private void enableDisableAudioCodec(String str, boolean z) throws LinphoneCoreException {
        PayloadType findPayloadType = this.mLinphoneCore.findPayloadType(str);
        if (findPayloadType != null) {
            this.mLinphoneCore.enablePayloadType(findPayloadType, z);
        }
    }

    private void enableDisableVideoCodecs(PayloadType payloadType) throws LinphoneCoreException {
        boolean z = true;
        String mime = payloadType.getMime();
        if (!"MP4V-ES".equals(mime) && !"H264".equals(mime)) {
            if ("H263-1998".equals(mime)) {
                z = false;
            } else if ("H263".equals(mime)) {
                z = false;
            } else {
                this.mLinphoneCore.enablePayloadType(payloadType, false);
                return;
            }
        }
        this.mLinphoneCore.enablePayloadType(payloadType, z);
    }

    /* access modifiers changed from: private */
    @SuppressLint("InvalidWakeLockTag")
    public void enterIncallMode(LinphoneCore linphoneCore) {
        if (this.mWakeLock == null) {
            this.mWakeLock = ((PowerManager) getSystemService(Context.POWER_SERVICE)).newWakeLock(268435462, "Linphone");
        }
        if (this.mWakeLock != null && !this.mWakeLock.isHeld()) {
            this.mWakeLock.acquire();
        }
    }

    /* access modifiers changed from: private */
    public void exitCallMode() {
        if (this.mWakeLock != null && this.mWakeLock.isHeld()) {
            this.mWakeLock.release();
        }
    }

    public static LinphoneCore getLc() {
        if (instanceOrNull() != null) {
            return instanceOrNull().getLinphoneCore();
        }
        return null;
    }

    private <T> List<T> getSimpleListeners(Class<T> cls) {
        ArrayList arrayList = new ArrayList();
        for (LinphoneSimpleListener next : simpleListeners) {
            if (cls.isInstance(next)) {
                arrayList.add(next);
            }
        }
        return arrayList;
    }

    public static LinphoneService instance() {
        if (theLinphone != null) {
            return theLinphone;
        }
        throw new RuntimeException("LinphoneService not instanciated yet");
    }

    public static LinphoneService instanceOrNull() {
        if (theLinphone == null) {
            return null;
        }
        return theLinphone;
    }

    public static boolean isready() {
        return theLinphone != null;
    }

    public static void makeNotification(Context context, int i, int i2, String str) {
        Notification notification = null;
        NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (i == 0) {
            Notification.Builder builder = new Notification.Builder(context);
            builder.setSmallIcon(android.R.drawable.sym_def_app_icon);//17301631
            builder.setDefaults(16);
            Intent intent = new Intent("android.intent.action.VIEW", (Uri) null);
            intent.setType("vnd.android.cursor.dir/calls");
            builder.setContentIntent(PendingIntent.getActivity(context, 0, intent, 0));
            builder.setContentTitle(context.getString(R.string.app_name));
            if (str == null || StringUtils.isEmpty(str)) {
                str = context.getString(R.string.unknown);
            }
            builder.setTicker(str);
            if (Build.VERSION.SDK_INT >= 16) {
                notification = builder.build();
            }
        } else if (i == 1) {
            Notification.Builder builder2 = new Notification.Builder(context);
            builder2.setSmallIcon(R.drawable.status_level, i2);
            builder2.setWhen(System.currentTimeMillis());
            builder2.setContentIntent(PendingIntent.getActivity(context, 0, new Intent(context, LinphoneActivity.class), 0));
            if (str == null) {
                switch (i2) {
                    case 0:
                        str = context.getString(R.string.regok);
                        break;
                    default:
                        str = context.getString(R.string.regfailed);
                        break;
                }
            }
            builder2.setContentText(str);
            builder2.setContentTitle(context.getString(R.string.app_name));
            builder2.setDefaults(34);
            if (Build.VERSION.SDK_INT >= 16) {
                notification = builder2.build();
            }
        }
        if (notification != null) {
            notificationManager.notify(i, notification);
        }
    }

    private void manageTunnelServer() {
        int i = 25060;
        int i2 = 443;
        if (this.mLinphoneCore != null) {
            String string = this.mPref.getString(getString(R.string.pref_tunnel_mode_key), getString(R.string.pref_tunnel_mode_production));
            boolean z = this.mPref.getBoolean(getString(R.string.pref_tunnel_enabled_key), false);
            if ((string.equals(getString(R.string.pref_tunnel_mode_production)) && z) || string.equals(getString(R.string.pref_tunnel_mode_autodetect))) {
                this.mLinphoneCore.tunnelCleanServers();
                String string2 = this.mPref.getString(getString(R.string.pref_tunnel_host_1_key), "");
                String string3 = this.mPref.getString(getString(R.string.pref_tunnel_host_2_key), "");
                try {
                    i2 = Integer.parseInt(this.mPref.getString(getString(R.string.pref_tunnel_port_key), "443"));
                } catch (Exception e) {
                }
                try {
                    i = Integer.parseInt(this.mPref.getString(getString(R.string.pref_mirror_port_key), "25060"));
                } catch (Exception e2) {
                }
                this.mLinphoneCore.tunnelAddServerAndMirror(string2, i2, i, 1000);
                this.mLinphoneCore.tunnelAddServerAndMirror(string3, i2, i, 1000);
                this.mLinphoneCore.tunnelAutoDetect();
            } else if (string.equals(getString(R.string.pref_tunnel_mode_always_on))) {
                this.mLinphoneCore.tunnelCleanServers();
                String string4 = this.mPref.getString(getString(R.string.pref_tunnel_host_1_key), "");
                String string5 = this.mPref.getString(getString(R.string.pref_tunnel_host_2_key), "");
                try {
                    i2 = Integer.parseInt(this.mPref.getString(getString(R.string.pref_tunnel_port_key), "443"));
                } catch (Exception e3) {
                }
                try {
                    i = Integer.parseInt(this.mPref.getString(getString(R.string.pref_mirror_port_key), "25060"));
                } catch (Exception e4) {
                }
                this.mLinphoneCore.tunnelAddServerAndMirror(string4, i2, i, 1000);
                this.mLinphoneCore.tunnelAddServerAndMirror(string5, i2, i, 1000);
                this.mLinphoneCore.tunnelEnable(true);
            } else {
                this.mLinphoneCore.tunnelEnable(false);
            }
        }
    }

    @TargetApi(8)
    private void routeAudioToSpeakerHelper(boolean z) {
        this.isUsingBluetoothAudioRoute = false;
        if (this.mAudioManager != null) {
            this.mAudioManager.setBluetoothScoOn(false);
        }
        if (!z) {
            this.mLinphoneCore.enableSpeaker(false);
        } else {
            this.mLinphoneCore.enableSpeaker(true);
        }
        for (LinphoneSimpleListener.LinphoneOnAudioChangedListener onAudioStateChanged : getSimpleListeners(LinphoneSimpleListener.LinphoneOnAudioChangedListener.class)) {
            onAudioStateChanged.onAudioStateChanged(z ? LinphoneSimpleListener.LinphoneOnAudioChangedListener.AudioState.SPEAKER : LinphoneSimpleListener.LinphoneOnAudioChangedListener.AudioState.EARPIECE);
        }
    }

    private void startRinging() {
        synchronized (this) {
            try {
                if (this.mAudioManager.shouldVibrate(0) && this.mVibrator != null) {
                    this.mVibrator.vibrate(new long[]{0, 1000, 1000}, 1);
                }
                if (this.mRingerPlayer == null) {
                    this.mRingerPlayer = new MediaPlayer();
                    this.mRingerPlayer.setAudioStreamType(2);
                    this.mRingerPlayer.setDataSource(getApplicationContext(), RingtoneManager.getDefaultUri(1));
                    this.mRingerPlayer.prepare();
                    this.mRingerPlayer.setLooping(true);
                    this.mRingerPlayer.start();
                }
            } catch (Exception e) {
            }
            this.isRinging = true;
        }
    }

    private void stopRinging() {
        synchronized (this) {
            if (this.mRingerPlayer != null) {
                this.mRingerPlayer.stop();
                this.mRingerPlayer.release();
                this.mRingerPlayer = null;
            }
            if (this.mVibrator != null) {
                this.mVibrator.cancel();
            }
            this.isRinging = false;
        }
    }

    public void adjustSoftwareVolume(int i) {
        int i2 = 0;
        int streamVolume = this.mAudioManager.getStreamVolume(0);
        int streamMaxVolume = this.mAudioManager.getStreamMaxVolume(0);
        int i3 = streamVolume + i;
        if (i3 > streamMaxVolume) {
            i3 = streamMaxVolume;
        }
        if (i3 >= 0) {
            i2 = i3;
        }
        Log.d("PCCW_MOBILE_SIP", "jam:adjustSoftwareVolume to" + i);
        this.mLinphoneCore.adjustSoftwareVolume((i2 - streamMaxVolume) * 4);
    }

    public void authInfoRequested(LinphoneCore linphoneCore, String str, String str2) {
    }

    public void authInfoRequested(LinphoneCore linphoneCore, String str, String str2, String str3) {
    }

    public void authenticationRequested(LinphoneCore linphoneCore, LinphoneAuthInfo linphoneAuthInfo, LinphoneCore.AuthMethod authMethod) {
    }

    public void byeReceived(LinphoneCore linphoneCore, String str) {
    }

    public void callEncryptionChanged(LinphoneCore linphoneCore, LinphoneCall linphoneCall, boolean z, String str) {
    }

    public void callState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state, String str) {
        if ((state == LinphoneCall.State.IncomingReceived || state == LinphoneCall.State.OutgoingInit) && BandwidthManager.isRoamSaveVideoEnable()) {
            int rearCameraOrientation = getRearCameraOrientation();
            if (MobileSipService.shouldUseOrientationMode(MobileSipService.getInstance().getPhoneNumber(linphoneCore.getCurrentCall())) == 1) {
                linphoneCore.setDeviceRotation((rearCameraOrientation - 90) % 360);
            } else {
                linphoneCore.setDeviceRotation(rearCameraOrientation % 360);
            }
        }
        if (state == LinphoneCall.State.CallUpdatedByRemote && BandwidthManager.isRoamSaveVideoEnable()) {
            boolean videoEnabled = linphoneCall.getRemoteParams().getVideoEnabled();
            boolean videoEnabled2 = linphoneCall.getCurrentParamsCopy().getVideoEnabled();
            if (videoEnabled && !videoEnabled2) {
                try {
                    getLc().deferCallUpdate(linphoneCall);
                } catch (LinphoneCoreException e) {
                    e.printStackTrace();
                }
            }
        }
        final LinphoneCall.State state2 = state;
        final String str2 = str;
        final LinphoneCore linphoneCore2 = linphoneCore;
        final LinphoneCall linphoneCall2 = linphoneCall;
        this.mHandler.post(new Runnable() {
            public void run() {
                if (state2 == LinphoneCall.State.OutgoingInit) {
                    LinphoneService.this.enterIncallMode(linphoneCore2);
                    KingKingLinphoneUtil.getInstance().setContact(ContactsUtils.getInstance().queryByPhoneNumber(LinphoneService.this, MobileSipService.getInstance().getPhoneNumber(linphoneCall2)));
                } else if (state2 == LinphoneCall.State.IncomingReceived) {
                    LinphoneService.this.enterIncallMode(linphoneCore2);
                    KingKingLinphoneUtil.getInstance().setContact(ContactsUtils.getInstance().queryByPhoneNumber(LinphoneService.this, MobileSipService.getInstance().getPhoneNumber(linphoneCall2)));
                    if (linphoneCall2.getRemoteParams().getVideoEnabled()) {
                        LinphoneService.ShowVideoSlidingTab = true;
                    } else {
                        LinphoneService.ShowVideoSlidingTab = false;
                    }
                } else if (state2 == LinphoneCall.State.Connected) {
                    if (Hacks.isGalaxyS()) {
                        LinphoneService.this.adjustSoftwareVolume(0);
                    }
                } else if (state2 == LinphoneCall.State.Error) {
                    if (InCallScreen.getDialer() == null) {
                        Toast.makeText(LinphoneService.this, String.format(LinphoneService.this.getString(R.string.call_error), new Object[]{str2}), Toast.LENGTH_LONG).show();
                    }
                    LinphoneService.this.callLog(linphoneCall2);
                    if (linphoneCore2.getCallsNb() < 1) {
                        LinphoneService.this.exitCallMode();
                        MobileSipService.getInstance().resetCallNumber();
                    }
                } else if (state2 == LinphoneCall.State.CallEnd) {
                    LinphoneService.this.callLog(linphoneCall2);
                    if (linphoneCore2.getCallsNb() < 1) {
                        LinphoneService.this.exitCallMode();
                        MobileSipService.getInstance().resetCallNumber();
                    }
                } else if (state2 == LinphoneCall.State.StreamsRunning) {
                }
                if (InCallScreen.getDialer() != null) {
                    InCallScreen.getDialer().callState(linphoneCore2, linphoneCall2, state2, str2);
                }
                if (DailPadActivity.getDailPad() != null) {
                    DailPadActivity.getDailPad().callState(linphoneCore2, linphoneCall2, state2, str2);
                }
                if (VideoCallActivity.getVideoCallScreen() != null) {
                    VideoCallActivity.getVideoCallScreen().callState(linphoneCore2, linphoneCall2, state2, str2);
                }
                if (AddCallActivity.getActivity() != null) {
                    AddCallActivity.getActivity().callState(linphoneCore2, linphoneCall2, state2, str2);
                }
                if (AddCallContactDetailsActivity.getActivity() != null) {
                    AddCallContactDetailsActivity.getActivity().callState(linphoneCore2, linphoneCall2, state2, str2);
                }
            }
        });
        if (state == LinphoneCall.State.IncomingReceived) {
            if (linphoneCore.getCallsNb() <= 1 || linphoneCore.getCurrentCall() == null || linphoneCore.getCurrentCall().getCurrentParamsCopy() == null || !linphoneCore.getCurrentCall().getCurrentParamsCopy().getVideoEnabled()) {
                Intent intent = new Intent();
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK );
                intent.setClass(this, InCallScreen.class);
                startActivity(intent);
                if (linphoneCore.getCallsNb() == 1) {
                    this.ringingCall = linphoneCall;
                    startRinging();
                }
            } else {
                linphoneCore.declineCall(linphoneCall, Reason.Busy);
            }
        } else if (linphoneCall == this.ringingCall && this.isRinging) {
            stopRinging();
        }
        if (this.mCurrentCallState == LinphoneCall.State.IncomingReceived) {
            stopRinging();
        }
        this.mCurrentCallState = state;
    }

    public void callStatsUpdated(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCallStats linphoneCallStats) {
    }

    public void configuringStatus(LinphoneCore linphoneCore, LinphoneCore.RemoteProvisioningState remoteProvisioningState, String str) {
    }

    public void displayMessage(LinphoneCore linphoneCore, String str) {
    }

    public void displayStatus(final LinphoneCore linphoneCore, final String str) {
        if (InCallScreen.getDialer() != null) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    if (InCallScreen.getDialer() != null) {
                        InCallScreen.getDialer().displayStatus(linphoneCore, str);
                    }
                }
            });
        }
    }

    public void displayWarning(LinphoneCore linphoneCore, String str) {
    }

    public void dtmfReceived(LinphoneCore linphoneCore, LinphoneCall linphoneCall, int i) {
    }

    public void ecCalibrationStatus(LinphoneCore linphoneCore, final LinphoneCore.EcCalibratorStatus ecCalibratorStatus, final int i, Object obj) {
        final CheckBoxPreference checkBoxPreference = (CheckBoxPreference) obj;
        if (checkBoxPreference != null) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    if (ecCalibratorStatus == LinphoneCore.EcCalibratorStatus.Done) {
                        checkBoxPreference.setSummary(String.format(LinphoneService.this.getString(R.string.ec_calibrated), new Object[]{String.valueOf(i)}));
                        checkBoxPreference.setChecked(true);
                    } else if (ecCalibratorStatus == LinphoneCore.EcCalibratorStatus.Failed) {
                        checkBoxPreference.setSummary(R.string.failed);
                        checkBoxPreference.setChecked(false);
                    }
                }
            });
        } else if (ecCalibratorStatus == LinphoneCore.EcCalibratorStatus.Done) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    Toast.makeText(LinphoneService.this, "Calibration done,delay_ms=" + i, Toast.LENGTH_SHORT).show();
                }
            });
            this.echoCalibrationDone = true;
        } else if (ecCalibratorStatus == LinphoneCore.EcCalibratorStatus.Failed) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    Toast.makeText(LinphoneService.this, "Calibration failed", Toast.LENGTH_SHORT).show();
                }
            });
        }
    }

    public void fileTransferProgressIndication(LinphoneCore linphoneCore, LinphoneChatMessage linphoneChatMessage, LinphoneContent linphoneContent, int i) {
    }

    public void fileTransferRecv(LinphoneCore linphoneCore, LinphoneChatMessage linphoneChatMessage, LinphoneContent linphoneContent, byte[] bArr, int i) {
    }

    public int fileTransferSend(LinphoneCore linphoneCore, LinphoneChatMessage linphoneChatMessage, LinphoneContent linphoneContent, ByteBuffer byteBuffer, int i) {
        return 0;
    }

    public void fixBluetoothMediaButton() {
        this.isBluetoothScoStarted = false;
        routeAudioToBluetooth();
    }

    public void friendListCreated(LinphoneCore linphoneCore, LinphoneFriendList linphoneFriendList) {
    }

    public void friendListRemoved(LinphoneCore linphoneCore, LinphoneFriendList linphoneFriendList) {
    }

    public LinphoneCore getLinphoneCore() {
        return this.mLinphoneCore;
    }

    public int getRearCameraOrientation() {
        AndroidCameraConfiguration.AndroidCamera[] retrieveCameras = AndroidCameraConfiguration.retrieveCameras();
        if (Hacks.isASUSPadFone2()) {
            for (AndroidCameraConfiguration.AndroidCamera androidCamera : retrieveCameras) {
                if (androidCamera.frontFacing) {
                    return androidCamera.orientation == 270 ? 90 : 0;
                }
            }
            return 90;
        }
        for (AndroidCameraConfiguration.AndroidCamera androidCamera2 : retrieveCameras) {
            if (!androidCamera2.frontFacing) {
                return androidCamera2.orientation;
            }
        }
        return 90;
    }

    public void globalState(final LinphoneCore linphoneCore, final LinphoneCore.GlobalState globalState, final String str) {
        if (globalState == LinphoneCore.GlobalState.GlobalOn) {
            if (InCallScreen.getDialer() != null) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        InCallScreen.getDialer().globalState(linphoneCore, globalState, str);
                    }
                });
            }
        } else if (globalState == LinphoneCore.GlobalState.GlobalOff) {
            cancelNotification(this, 1);
        }
    }

    public void infoReceived(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneInfoMessage linphoneInfoMessage) {
    }

    public void initFromConf() throws LinphoneConfigException, LinphoneException {
        manageTunnelServer();
        LinphoneCoreFactory.instance().setDebugMode(false, "LinphoneDebug");
        try {
            enableDisableAudioCodec("AMR", 8000, false);
            enableDisableAudioCodec("speex", 32000, false);
            enableDisableAudioCodec("speex", 16000, false);
            enableDisableAudioCodec("speex", 8000, false);
            enableDisableAudioCodec("iLBC", 8000, true);
            enableDisableAudioCodec("GSM", 8000, false);
            enableDisableAudioCodec("PCMU", 8000, true);
            enableDisableAudioCodec("PCMA", 8000, true);
            enableDisableAudioCodec("AMR-WB", 16000, false);
            enableDisableAudioCodec("SILK", 24000, false);
            enableDisableAudioCodec("SILK", 16000, false);
            enableDisableAudioCodec("SILK", 12000, false);
            enableDisableAudioCodec("SILK", 8000, false);
            enableDisableAudioCodec("opus", false);
            for (PayloadType enableDisableVideoCodecs : this.mLinphoneCore.getVideoCodecs()) {
                enableDisableVideoCodecs(enableDisableVideoCodecs);
            }
            if (!this.mPref.getString(getString(R.string.pref_handle_outcall_key), OutgoingCallReceiver.key_on_demand).equalsIgnoreCase(OutgoingCallReceiver.key_off)) {
                IntentFilter intentFilter = new IntentFilter("android.intent.action.SCREEN_ON");
                intentFilter.setPriority(0);
                intentFilter.addAction("android.intent.action.NEW_OUTGOING_CALL");
                if (this.mOutgoingCallReceiver == null) {
                    this.mOutgoingCallReceiver = new OutgoingCallReceiver();
                }
                registerReceiver(this.mOutgoingCallReceiver, intentFilter);
            } else if (this.mOutgoingCallReceiver != null) {
                unregisterReceiver(this.mOutgoingCallReceiver);
                this.mOutgoingCallReceiver = null;
            }
            this.mLinphoneCore.enableEchoCancellation(true);
            this.mLinphoneCore.enableVideo(true, true);
            String string = this.mPref.getString(getString(R.string.pref_username_key), (String) null);
            if (string == null || string.length() == 0) {
                throw new LinphoneConfigException(getString(R.string.wrong_username));
            }
            String string2 = this.mPref.getString(getString(R.string.pref_passwd_key), (String) null);
            if (string2 == null || string2.length() == 0) {
                throw new LinphoneConfigException(getString(R.string.wrong_passwd));
            }
            String string3 = this.mPref.getString(getString(R.string.pref_domain_key), (String) null);
            if (string3 == null || string3.length() == 0) {
                throw new LinphoneConfigException(getString(R.string.wrong_domain));
            }
            String string4 = this.mPref.getString(getString(R.string.pref_stun_server_key), (String) null);
            this.mLinphoneCore.setStunServer(string4);
            this.mLinphoneCore.setFirewallPolicy((string4 == null || string4.length() <= 0) ? LinphoneCore.FirewallPolicy.NoFirewall : LinphoneCore.FirewallPolicy.UseStun);
            String string5 = this.mPref.getString(getString(R.string.pref_userid_key), (String) null);
            LinphoneAuthInfo createAuthInfo = LinphoneCoreFactory.instance().createAuthInfo(string, string2, (String) null, (String) null);
            createAuthInfo.setUserId(string5);
            this.mLinphoneCore.addAuthInfo(createAuthInfo);
            String string6 = this.mPref.getString(getString(R.string.pref_proxy_key), (String) null);
            if (string6 == null || string6.length() == 0) {
                string6 = "sip:" + string3;
            }
            if (!string6.startsWith("sip:")) {
                string6 = "sip:" + string6;
            }
            LinphoneProxyConfig defaultProxyConfig = this.mLinphoneCore.getDefaultProxyConfig();
            String str = "sip:" + string + "@" + string3;
            if (defaultProxyConfig == null) {
                try {
                    LinphoneProxyConfig createProxyConfig = this.mLinphoneCore.createProxyConfig(str, string6, (String) null, true);
                    createProxyConfig.setExpires(3600);
                    this.mLinphoneCore.addProxyConfig(createProxyConfig);
                    this.mLinphoneCore.setDefaultProxyConfig(createProxyConfig);
                } catch (LinphoneCoreException e) {
                    throw new LinphoneConfigException(getString(R.string.wrong_settings), e);
                }
            } else {
                defaultProxyConfig.edit();
                defaultProxyConfig.setIdentity(str);
                defaultProxyConfig.setProxy(string6);
                defaultProxyConfig.enableRegister(true);
                defaultProxyConfig.done();
            }
            LinphoneProxyConfig defaultProxyConfig2 = this.mLinphoneCore.getDefaultProxyConfig();
            if (defaultProxyConfig2 != null) {
                String string7 = this.mPref.getString(getString(R.string.pref_prefix_key), (String) null);
                if (string7 != null) {
                    defaultProxyConfig2.setDialPrefix(string7);
                }
                defaultProxyConfig2.setDialEscapePlus(this.mPref.getBoolean(getString(R.string.pref_escape_plus_key), false));
                if (this.mPref.getBoolean(getString(R.string.pref_enable_outbound_proxy_key), true)) {
                    defaultProxyConfig2.setRoute(string6);
                } else {
                    defaultProxyConfig2.setRoute((String) null);
                }
            }
            ConnectivityManager connectivityManager = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
            this.mLinphoneCore.setNetworkReachable(connectivityManager.getActiveNetworkInfo() != null ? connectivityManager.getActiveNetworkInfo().getState() == NetworkInfo.State.CONNECTED : false);
            if (ClientStateManager.isPrepaid(getApplicationContext())) {
                this.mLinphoneCore.setMaxCalls(1);
            } else {
                this.mLinphoneCore.setMaxCalls(3);
            }
            this.mLinphoneCore.setTone(ToneID.CallWaiting, this.callWaitingToneSoundFile);
        } catch (LinphoneCoreException e2) {
            throw new LinphoneConfigException(getString(R.string.wrong_settings), e2);
        }
    }

    public void isComposingReceived(LinphoneCore linphoneCore, LinphoneChatRoom linphoneChatRoom) {
    }

    public boolean isEchoCalibrated() {
        return this.echoCalibrationDone;
    }

    public List<Codec> listAvailableCodecs() {
        ArrayList arrayList = new ArrayList(codecs.length);
        for (Codec codec : codecs) {
            if (this.mLinphoneCore.findPayloadType(codec.codecName, codec.rate) != null) {
                arrayList.add(codec);
            }
        }
        return arrayList;
    }

    public void messageReceived(LinphoneCore linphoneCore, LinphoneChatRoom linphoneChatRoom, LinphoneChatMessage linphoneChatMessage) {
    }

    public void messageReceivedUnableToDecrypted(LinphoneCore linphoneCore, LinphoneChatRoom linphoneChatRoom, LinphoneChatMessage linphoneChatMessage) {
    }

    public void networkReachableChanged(LinphoneCore linphoneCore, boolean z) {
    }

    public void newSubscriptionRequest(LinphoneCore linphoneCore, LinphoneFriend linphoneFriend, String str) {
    }

    public void notifyPresenceReceived(LinphoneCore linphoneCore, LinphoneFriend linphoneFriend) {
    }

    public void notifyReceived(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneAddress linphoneAddress, byte[] bArr) {
    }

    public void notifyReceived(LinphoneCore linphoneCore, LinphoneEvent linphoneEvent, String str, LinphoneContent linphoneContent) {
    }

    public IBinder onBind(Intent intent) {
        return null;
    }

    public void onCreate() {
        super.onCreate();
        theLinphone = this;
        this.mServiceContext = getApplicationContext();
        if (!MobileSipService.getInstance().isAutoStart(this)) {
            stopSelf();
        }
        Hacks.dumpDeviceInformation();
        cancelNotification(this, 1);
        this.mPref = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        this.mAudioManager = (AudioManager) getSystemService(AUDIO_SERVICE);
        this.mVibrator = (Vibrator) getSystemService(Context.VIBRATOR_SERVICE);
        try {
            String absolutePath = getFilesDir().getAbsolutePath();
            this.linphoneInitialConfigFile = absolutePath + "/linphonerc";
            this.linphoneConfigFile = absolutePath + "/.linphonerc";
            this.ringSoundFile = absolutePath + "/oldphone_mono.wav";
            this.ringbackSoundFile = absolutePath + "/ringback.wav";
            this.callWaitingToneSoundFile = absolutePath + "/cwt.wav";
            this.staticPicFile = absolutePath + "/staticpic.jpg";
            copyAssetsFromPackage(this);
            this.mLinphoneCore = LinphoneCoreFactory.instance().createLinphoneCore(this, this.linphoneConfigFile, this.linphoneInitialConfigFile, (Object) null, this.mServiceContext);
            this.mLinphoneCore.setContext(getApplicationContext());
            this.mLinphoneCore.enableKeepAlive(false);
            this.mLinphoneCore.setStaticPicture(this.staticPicFile);
            this.mLinphoneCore.setPlaybackGain(3.0f);
            this.mLinphoneCore.setRing((String) null);
            this.mLinphoneCore.setVideoPolicy(false, false);
            this.mLinphoneCore.setMaxCalls(3);
            this.mLinphoneCore.setCpuCount(Runtime.getRuntime().availableProcessors());
            this.mLinphoneCore.clearAuthInfos();
            this.mLinphoneCore.clearProxyConfigs();
            this.mTimer.scheduleAtFixedRate(new TimerTask() {
                private long lastLoopTime;

                public void run() {
                    try {
                        LinphoneService.this.mLinphoneCore.iterate();
                    } catch (RuntimeException e) {
                        LinphoneService.this.mTimer.cancel();
                    }
                }
            }, 0, 100);
            IntentFilter intentFilter = new IntentFilter("android.intent.action.SCREEN_ON");
            intentFilter.addAction("android.intent.action.SCREEN_OFF");
            registerReceiver(this.mKeepAliveMgrReceiver, intentFilter);
            startBluetooth();
        } catch (Exception e) {
        }
    }

    public void onDestroy() {
        super.onDestroy();
        this.mTimer.cancel();
        this.mLinphoneCore.tunnelCleanServers();
        this.mLinphoneCore.destroy();
        theLinphone = null;
        destroyBluetoothProfileProxy();
        this.lastUpdatedSipStatus.domain = null;
        this.lastUpdatedSipStatus.identity = null;
        this.lastUpdatedSipStatus.proxy = null;
        this.lastUpdatedSipStatus.route = null;
        this.lastUpdatedSipStatus.regState = null;
        unregisterReceiver(this.mKeepAliveMgrReceiver);
        if (this.mOutgoingCallReceiver != null) {
            unregisterReceiver(this.mOutgoingCallReceiver);
        }
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        if (intent != null && !intent.getBooleanExtra("do_init", false)) {
            return Service.START_NOT_STICKY;
        }
        try {
            initFromConf();
            return Service.START_NOT_STICKY;
        } catch (LinphoneException e) {
            return Service.START_NOT_STICKY;
        }
    }

    public void publishStateChanged(LinphoneCore linphoneCore, LinphoneEvent linphoneEvent, PublishState publishState) {
    }

    public void registrationState(LinphoneCore linphoneCore, LinphoneProxyConfig linphoneProxyConfig, LinphoneCore.RegistrationState registrationState, String str) {
        if (linphoneCore == null || linphoneCore.getDefaultProxyConfig() != null) {
        }
        this.lastUpdatedSipStatus.domain = linphoneProxyConfig.getDomain();
        this.lastUpdatedSipStatus.identity = linphoneProxyConfig.getIdentity();
        this.lastUpdatedSipStatus.proxy = linphoneProxyConfig.getProxy();
        this.lastUpdatedSipStatus.route = linphoneProxyConfig.getRoute();
        this.lastUpdatedSipStatus.regState = registrationState.toString();
        if (registrationState == LinphoneCore.RegistrationState.RegistrationOk && linphoneCore != null && linphoneCore.getDefaultProxyConfig() != null && linphoneCore.getDefaultProxyConfig().isRegistered() && MobileSipService.getInstance().loginStatus == 0) {
            makeNotification(this, 1, 0, (String) null);
            MobileSipService.getInstance().handleSipRegisterSuccess(this);
        }
        if (registrationState == LinphoneCore.RegistrationState.RegistrationFailed) {
            cancelNotification(this, 1);
            MobileSipService.getInstance().handleSipRegisterFailed(this, str);
        }
        final LinphoneCore linphoneCore2 = linphoneCore;
        final LinphoneProxyConfig linphoneProxyConfig2 = linphoneProxyConfig;
        final LinphoneCore.RegistrationState registrationState2 = registrationState;
        final String str2 = str;
        this.mHandler.post(new Runnable() {
            public void run() {
                if (InCallScreen.getDialer() != null) {
                    InCallScreen.getDialer().registrationState(linphoneCore2, linphoneProxyConfig2, registrationState2, str2);
                }
            }
        });
    }

    public void resetCameraFromPreferences() {
        int i = 0;
        for (AndroidCameraConfiguration.AndroidCamera androidCamera : AndroidCameraConfiguration.retrieveCameras()) {
            if (androidCamera.frontFacing) {
                i = androidCamera.id;
            }
        }
        getLc().setVideoDevice(i);
    }

    @TargetApi(11)
    public boolean routeAudioToBluetooth() {
        if (!BluetoothAdapter.getDefaultAdapter().isEnabled() || !this.mAudioManager.isBluetoothScoAvailableOffCall()) {
            return false;
        }
        this.mAudioManager.setBluetoothScoOn(true);
        startBluetoothSco();
        if (Version.sdkAboveOrEqual(11)) {
            this.isUsingBluetoothAudioRoute = false;
            if (this.mBluetoothHeadset != null) {
                for (BluetoothDevice connectionState : this.mBluetoothHeadset.getConnectedDevices()) {
                    this.isUsingBluetoothAudioRoute = (this.mBluetoothHeadset.getConnectionState(connectionState) == 2) | this.isUsingBluetoothAudioRoute;
                }
            }
            if (!this.isUsingBluetoothAudioRoute) {
                scoDisconnected();
            } else {
                for (LinphoneSimpleListener.LinphoneOnAudioChangedListener onAudioStateChanged : getSimpleListeners(LinphoneSimpleListener.LinphoneOnAudioChangedListener.class)) {
                    onAudioStateChanged.onAudioStateChanged(LinphoneSimpleListener.LinphoneOnAudioChangedListener.AudioState.SPEAKER);
                }
                if (InCallScreen.getDialer() != null) {
                    InCallScreen.getDialer().updateRoutingIcon();
                }
                if (VideoCallActivity.getVideoCallScreen() != null) {
                    VideoCallActivity.getVideoCallScreen().updateRoutingIcon();
                }
            }
        } else if (this.mAudioManager.isBluetoothScoOn()) {
            this.isUsingBluetoothAudioRoute = true;
            if (InCallScreen.getDialer() != null) {
                InCallScreen.getDialer().updateRoutingIcon();
            }
            if (VideoCallActivity.getVideoCallScreen() != null) {
                VideoCallActivity.getVideoCallScreen().updateRoutingIcon();
            }
        }
        return this.isUsingBluetoothAudioRoute;
    }

    public void routeAudioToReceiver() {
        routeAudioToSpeakerHelper(false);
        if (InCallScreen.getDialer() != null) {
            InCallScreen.getDialer().updateRoutingIcon();
        }
        if (VideoCallActivity.getVideoCallScreen() != null) {
            VideoCallActivity.getVideoCallScreen().updateRoutingIcon();
        }
    }

    public void routeAudioToSpeaker() {
        routeAudioToSpeakerHelper(true);
        if (InCallScreen.getDialer() != null) {
            InCallScreen.getDialer().updateRoutingIcon();
        }
        if (VideoCallActivity.getVideoCallScreen() != null) {
            VideoCallActivity.getVideoCallScreen().updateRoutingIcon();
        }
    }

    public void scoConnected() {
        this.isBluetoothScoConnected = true;
        if (!Version.sdkAboveOrEqual(11)) {
            if (InCallScreen.getDialer() != null) {
                InCallScreen.getDialer().refreshAudioRouteActions(false);
            }
            if (VideoCallActivity.getVideoCallScreen() != null) {
                VideoCallActivity.getVideoCallScreen().refreshAudioRouteActions(false);
            }
        }
    }

    @TargetApi(8)
    public void scoDisconnected() {
        this.isUsingBluetoothAudioRoute = false;
        this.isBluetoothScoConnected = false;
        if (this.mAudioManager != null) {
            stopBluetoothSco();
            this.mAudioManager.setBluetoothScoOn(false);
        }
        if (InCallScreen.getDialer() != null) {
            InCallScreen.getDialer().refreshAudioRouteActions(false);
        }
        if (VideoCallActivity.getVideoCallScreen() != null) {
            VideoCallActivity.getVideoCallScreen().refreshAudioRouteActions(false);
        }
    }

    public void show(LinphoneCore linphoneCore) {
    }

    @TargetApi(11)
    public void startBluetooth() {
        int i = 0;
        this.mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (!this.mBluetoothAdapter.isEnabled()) {
            this.isBluetoothScoConnected = false;
            scoDisconnected();
            routeAudioToReceiver();
        } else if (Version.sdkAboveOrEqual(11)) {
            this.mProfileListener = new BluetoothProfile.ServiceListener() {
                public void onServiceConnected(int i, BluetoothProfile bluetoothProfile) {
                    if (i == 1) {
                        BluetoothHeadset unused = LinphoneService.this.mBluetoothHeadset = (BluetoothHeadset) bluetoothProfile;
                        boolean z = false;
                        for (BluetoothDevice connectionState : LinphoneService.this.mBluetoothHeadset.getConnectedDevices()) {
                            z = (LinphoneService.this.mBluetoothHeadset.getConnectionState(connectionState) == 2) | z;
                        }
                        if (z) {
                            LinphoneService.this.isBluetoothScoConnected = true;
                        }
                    }
                }

                public void onServiceDisconnected(int i) {
                    if (i == 1) {
                        BluetoothHeadset unused = LinphoneService.this.mBluetoothHeadset = null;
                        LinphoneService.this.isBluetoothScoConnected = false;
                        if (LinphoneService.this.mLinphoneCore.isIncall()) {
                            LinphoneService.this.routeAudioToReceiver();
                        }
                    }
                }
            };
            this.mBluetoothAdapter.getProfileProxy(this.mServiceContext, this.mProfileListener, 1);
        } else {
            Intent registerReceiver = this.mServiceContext.registerReceiver(this.bluetoothReiceiver, new IntentFilter("android.media.SCO_AUDIO_STATE_CHANGED"));
            if (registerReceiver != null) {
                i = registerReceiver.getIntExtra("android.media.extra.SCO_AUDIO_STATE", 0);
            }
            if (i == 1) {
                this.isBluetoothScoConnected = true;
            }
        }
    }

    public void startBluetoothSco() {
        if (!this.isBluetoothScoStarted && this.isBluetoothScoConnected) {
            this.mAudioManager.startBluetoothSco();
            this.isBluetoothScoStarted = true;
        }
    }

    public void stopBluetoothSco() {
        this.mAudioManager.stopBluetoothSco();
        this.isBluetoothScoStarted = false;
    }

    public void subscriptionStateChanged(LinphoneCore linphoneCore, LinphoneEvent linphoneEvent, SubscriptionState subscriptionState) {
    }

    public void textReceived(LinphoneCore linphoneCore, LinphoneChatRoom linphoneChatRoom, LinphoneAddress linphoneAddress, String str) {
    }

    public void transferState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state) {
    }

    public boolean tunnelingEnabled() {
        if (isready() && this.mLinphoneCore != null) {
            return this.mLinphoneCore.isTunnelAvailable();
        }
        return false;
    }

    public void uploadProgressIndication(LinphoneCore linphoneCore, int i, int i2) {
    }

    public void uploadStateChanged(LinphoneCore linphoneCore, LinphoneCore.LogCollectionUploadState logCollectionUploadState, String str) {
    }
}
