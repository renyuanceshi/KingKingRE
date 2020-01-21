package com.pccw.mobile.sip.service;

import android.annotation.SuppressLint;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.RingtoneManager;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.widget.Toast;
import com.pccw.mobile.server.response.CheckNumberTypeResponse;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.HeartBeatAlarmReceiver;
import com.pccw.mobile.sip.RetryAlarmReceiver;
import com.pccw.mobile.sip.ServerMessageController;
import com.pccw.mobile.sip.util.CryptoServices;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.mobile.sip.util.NetworkException;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.mobile.sip.util.NumberMappingUtil;
import com.pccw.mobile.sip.util.StringUtilities;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.ErrorMsgUtil;
import com.pccw.mobile.util.MobileNumberUtil;
import com.pccw.mobile.util.SSIDUtil;
import com.pccw.mobile.util.SetEchoServerHost;
import com.pccw.pref.SSIDList;
import java.io.StringReader;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.TimerTask;
import javax.xml.parsers.SAXParserFactory;
import org.apache.commons.lang3.StringUtils;
import org.linphone.CallManager;
import org.linphone.CallerInfo;
import org.linphone.DailPadActivity;
import org.linphone.InCallScreen;
import org.linphone.LinphoneActivity;
import org.linphone.LinphoneConfigException;
import org.linphone.LinphoneException;
import org.linphone.LinphoneService;
import org.linphone.OutgoingCallReceiver;
import org.linphone.VideoCallActivity;
import org.linphone.core.CallDirection;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.mediastream.video.capture.hwconf.AndroidCameraConfiguration;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

public class MobileSipService {
    public static final int CALL_FORWARDING_ACTIVATED = 0;
    public static final int CALL_FORWARDING_ACTIVATING = 2;
    public static final int CALL_FORWARDING_DEACTIVATED = 1;
    public static final int CALL_FORWARDING_DEACTIVATING = 3;
    public static final int CALL_FORWARDING_FORWARDALREADY = 4;
    public static final int CALL_FORWARDING_UNKNOWN = -1;
    private static final boolean DEFAULT_AUTOSTART = false;
    private static final String FW_NUMBER = "-fw_number-";
    public static final String HEARTBEAT_SESSION_EXPIRED_VALUE = "1";
    public static final String HEARTBEAT_SUCCESS_VALUE = "0";
    protected static final int NEW_VERSION_NOTIFY_ID = 10022;
    public static final String OS = ("android_" + Build.VERSION.SDK_INT);
    private static final String PREF_AUTOSTART = "PREF_AUTOSTART";
    private static final String PREF_FIRST_RUN = "PREF_FIRST_RUN";
    public static final int STATUS_2N_DEVICE_ID_ERROR = -8;
    public static final int STATUS_2N_REGISTERED_ELSEWHERE_ERROR = -9;
    public static final int STATUS_2N_REGISTRATION_ERROR = -7;
    public static final int STATUS_LOGIN_FAILED_SERVER_ERROR = -3;
    public static final int STATUS_LOGIN_NETWORK_ERROR = -6;
    public static final int STATUS_LOGIN_NO_AVAILABLE_NETWORK = -5;
    public static final int STATUS_LOGIN_OTHER_ERROR = -10;
    public static final int STATUS_LOGIN_SUCCEED = 0;
    public static final int STATUS_NOT_LOGINED = -100;
    public static final int STATUS_SIM_NOT_READY = -4;
    /* access modifiers changed from: private */
    public static PowerManager.WakeLock brightWakeLock = null;
    /* access modifiers changed from: private */
    public static String encryptedPccwPrepaidImsi = "";
    private static int heartBeatRetryCount = 0;
    private static final MobileSipService instance = new MobileSipService();
    /* access modifiers changed from: private */
    public static PowerManager.WakeLock wakeLock = null;
    /* access modifiers changed from: private */
    public static WifiManager.WifiLock wifiLock = null;
    public Handler backendHandler;
    /* access modifiers changed from: private */
    public int callForwardingState = 1;
    /* access modifiers changed from: private */
    public CheckNumberTypeResponse checkNumberTypeResponse = null;
    /* access modifiers changed from: private */
    public String currentCodec = null;
    public String currentRegisterCallId;
    public boolean dayPassAlertOKClicked = false;
    private HashMap<String, String> getCalleeoriginalNumber;
    /* access modifiers changed from: private */
    public boolean isAutoLoginRunning = false;
    /* access modifiers changed from: private */
    public boolean isDisconnecting = false;
    public boolean isFirstAlertOfCONNECTIVITY_ACTION = true;
    /* access modifiers changed from: private */
    public boolean isFirstSipRegisterSuccessHanled;
    private boolean isInHK = false;
    /* access modifiers changed from: private */
    public boolean isLoginRunning = false;
    /* access modifiers changed from: private */
    public boolean isReLoginRunning = false;
    /* access modifiers changed from: private */
    public boolean isSuccess = false;
    /* access modifiers changed from: private */
    public CallForwardResponse lastCallForwardResponse = null;
    private GetCalleeStatusResponse lastGetCalleeStatusResponse = null;
    private int lastWifiSleepPolicy = -1;
    private String loginErrorMsg = "";
    public int loginRetryCount = 0;
    public int loginStatus = -100;
    public ServerMessageController messageController = null;
    private boolean needPrepaidTopUpReminderCheck = false;
    private HashMap<String, String> originalNumber;
    protected String sessionId;
    public boolean shouldAutologin = false;
    public boolean shouldRelogin = false;
    protected boolean shouldShowOverseaErrorMSG = false;
    private int sipRegistrationFailCount = 0;

    private class HttpsLoginTask extends TimerTask {
        private Context ctx;
        private Handler handler;

        public HttpsLoginTask(Context context, Handler handler2) {
            this.ctx = context;
            this.handler = handler2;
        }

        public void run() {
            MobileSipService.this.doHttpsLogin(this.handler, this.ctx);
        }
    }

    protected MobileSipService() {
    }

    /* access modifiers changed from: private */
    public void alertCallForwardSucceed(Context context) {
        Intent intent = new Intent();
        intent.setAction(Constants.INTENT_ALERT_CALLFORWARD_SUCCEED);
        context.sendBroadcast(intent);
    }

    private void alertDaypass(Context context) {
        Intent intent = new Intent();
        intent.setAction(Constants.INTERT_ALERT_DAYPASS);
        context.sendBroadcast(intent);
    }

    /* access modifiers changed from: private */
    public void alertLoginDisconnected(Context context) {
        Intent intent = new Intent();
        intent.setAction(Constants.INTENT_ALERT_LOGIN_DISCONNECTED);
        intent.putExtra(Constants.INTENT_ALERT_LOGIN_DISCONNECTED_EXTRA_NEED_SHOW_MESSAGE, this.isSuccess);
        context.sendBroadcast(intent);
    }

    /* access modifiers changed from: private */
    public void alertLoginDisconnecting(Context context) {
        Intent intent = new Intent();
        intent.setAction(Constants.INTENT_ALERT_LOGIN_DISCONNECTING);
        context.sendBroadcast(intent);
    }

    /* access modifiers changed from: private */
    public void alertLoginError(Context context, String str) {
        Intent intent = new Intent();
        intent.setAction(Constants.INTENT_ALERT_LOGIN_ERROR);
        intent.putExtra(ServerMessageController.MESSAGE_INTENT_MESSAGE, str);
        intent.putExtra(ServerMessageController.MESSAGE_INTENT_OVERSEA_BOOLEAN, this.shouldShowOverseaErrorMSG);
        this.shouldShowOverseaErrorMSG = false;
        context.sendBroadcast(intent);
        LinphoneService.cancelNotification(context, 1);
    }

    private void alertLoginFinished(Context context) {
        Intent intent = new Intent();
        intent.setAction(Constants.INTENT_ALERT_LOGIN_FINISHED);
        context.sendBroadcast(intent);
    }

    private void alertLoginPasswordError(Context context, String str) {
        Intent intent = new Intent();
        intent.setAction(Constants.INTENT_ALERT_LOGIN_PASSWORD_ERROR);
        intent.putExtra(ServerMessageController.MESSAGE_INTENT_MESSAGE, str);
        context.sendBroadcast(intent);
        LinphoneService.cancelNotification(context, 1);
    }

    private void alertLoginWarning(Context context, String str) {
        Intent intent = new Intent();
        intent.setAction(Constants.INTENT_ALERT_LOGIN_WARNING);
        intent.putExtra(ServerMessageController.MESSAGE_INTENT_MESSAGE, str);
        context.sendBroadcast(intent);
    }

    private boolean authGetImsi_prepaid(Context context) {
        String registeredNumber = ClientStateManager.getRegisteredNumber(context);
        if (registeredNumber == null || registeredNumber.length() == 0) {
            this.loginStatus = -10;
            alertLoginError(context, context.getString(R.string.error_not_registered));
            return false;
        }
        String registeredPrepaidNumberPassword = ClientStateManager.getRegisteredPrepaidNumberPassword(context);
        if (registeredPrepaidNumberPassword == null || registeredPrepaidNumberPassword.length() == 0) {
            this.loginStatus = -10;
            alertLoginError(context, context.getString(R.string.error_not_registered));
            return false;
        }
        String encryptedDeviceId = ClientStateManager.getEncryptedDeviceId(context);
        if (encryptedDeviceId == null || encryptedDeviceId.length() == 0) {
            this.loginStatus = -10;
            alertLoginError(context, context.getString(R.string.error_no_deviceid));
            return false;
        }
        try {
            String post = HttpUtils.post(Constants.AUTH_GET_IMSI_URL, "msisdn", registeredNumber, "password", registeredPrepaidNumberPassword, "encUdid", encryptedDeviceId);
            if (post == null || !StringUtils.isNotBlank(post)) {
                this.loginStatus = -3;
                alertLoginError(context, this.messageController.obtainMessage(ServerMessageController.MESSAGE_TYPE_GET_IMSI_PREPAID, "99"));
                return false;
            }
            try {
                XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
                AuthGetImsiXmlHandler authGetImsiXmlHandler = new AuthGetImsiXmlHandler();
                xMLReader.setContentHandler(authGetImsiXmlHandler);
                xMLReader.parse(new InputSource(new StringReader(post)));
                AuthGetImsiResponse authGetImsiResponse = authGetImsiXmlHandler.res;
                if (!authGetImsiResponse.resultcode.equals("0")) {
                    String obtainMessage = this.messageController.obtainMessage(ServerMessageController.MESSAGE_TYPE_GET_IMSI_PREPAID, authGetImsiResponse.resultcode);
                    if (obtainMessage == null) {
                        this.loginStatus = -3;
                        obtainMessage = this.messageController.obtainMessage(ServerMessageController.MESSAGE_TYPE_GET_IMSI_PREPAID, "99");
                    } else {
                        this.loginStatus = -10;
                    }
                    alertLoginError(context, obtainMessage);
                    return false;
                } else if (authGetImsiResponse.encryptedImsi == null) {
                    this.loginStatus = -3;
                    alertLoginError(context, context.getString(R.string.getAuthIMSI_99));
                    return false;
                } else {
                    encryptedPccwPrepaidImsi = authGetImsiResponse.encryptedImsi;
                    return true;
                }
            } catch (Exception e) {
                this.loginStatus = -3;
                alertLoginError(context, this.messageController.obtainMessage(ServerMessageController.MESSAGE_TYPE_GET_IMSI_PREPAID, "99"));
                return false;
            }
        } catch (NetworkException e2) {
            this.loginStatus = -6;
            alertLoginError(context, context.getString(R.string.network_error));
            return false;
        } catch (Exception e3) {
            this.loginStatus = -3;
            alertLoginError(context, context.getString(R.string.network_error));
            return false;
        }
    }

    private void checkCodecsSupport(Context context) {
        if (!LinphoneService.isready()) {
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setClass(context, LinphoneService.class);
            intent.putExtra("do_init", false);
            context.startService(intent);
            setCodecs(context);
            context.stopService(intent);
            return;
        }
        setCodecs(context);
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:191:0x04c4  */
    /* JADX WARNING: Removed duplicated region for block: B:192:0x04c9  */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:90:0x0280=Splitter:B:90:0x0280, B:74:0x0221=Splitter:B:74:0x0221, B:10:0x0095=Splitter:B:10:0x0095} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void doHttpsLogin(android.os.Handler r10, android.content.Context r11) {
        /*
            r9 = this;
            r8 = -3
            r3 = 1
            r2 = 0
            int r0 = r9.loginStatus
            r1 = -100
            if (r0 == r1) goto L_0x000d
            r9.loginTaskCompleted(r11)
        L_0x000c:
            return
        L_0x000d:
            r9.checkCodecsSupport(r11)
            android.content.Context r0 = r11.getApplicationContext()
            android.content.SharedPreferences r0 = android.preference.PreferenceManager.getDefaultSharedPreferences(r0)
            android.content.SharedPreferences$Editor r0 = r0.edit()
            r1 = 2131165784(0x7f070258, float:1.7945795E38)
            java.lang.String r1 = r11.getString(r1)
            android.content.SharedPreferences$Editor r0 = r0.putBoolean(r1, r2)
            r0.commit()
            android.content.Context r0 = r11.getApplicationContext()
            android.content.SharedPreferences r0 = android.preference.PreferenceManager.getDefaultSharedPreferences(r0)
            android.content.SharedPreferences$Editor r0 = r0.edit()
            r1 = 2131165811(0x7f070273, float:1.794585E38)
            java.lang.String r1 = r11.getString(r1)
            r2 = 2131165812(0x7f070274, float:1.7945852E38)
            java.lang.String r2 = r11.getString(r2)
            android.content.SharedPreferences$Editor r0 = r0.putString(r1, r2)
            r0.commit()
            r9.callForwardingState = r3
            r1 = 0
            boolean r0 = com.pccw.mobile.sip.ClientStateManager.isRegisteredPrepaid(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0229
            java.lang.String r0 = com.pccw.mobile.sip.ClientStateManager.getRegisteredNumber(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            com.pccw.mobile.sip.ClientStateManager.getRegisteredPrepaidNumberPassword(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            com.pccw.mobile.sip.service.MobileSipService$1 r2 = new com.pccw.mobile.sip.service.MobileSipService$1     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r2.<init>()     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.io.PrintStream r3 = java.lang.System.out     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            java.lang.String r4 = "!!!!!!!  check API  "
            r3.println(r4)     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            java.io.PrintStream r3 = java.lang.System.out     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            r4.<init>()     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            java.lang.String r5 = "!!!!  registered misidn:"
            java.lang.StringBuilder r4 = r4.append(r5)     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            java.lang.StringBuilder r4 = r4.append(r0)     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            java.lang.String r4 = r4.toString()     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            r3.println(r4)     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            com.pccw.mobile.server.CheckNumberTypeApi r3 = new com.pccw.mobile.server.CheckNumberTypeApi     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            java.lang.String r4 = ""
            r3.<init>(r2, r11, r4, r0)     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            r0 = 1
            java.lang.String[] r0 = new java.lang.String[r0]     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            r2 = 0
            java.lang.String r4 = ""
            r0[r2] = r4     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            android.os.AsyncTask r0 = r3.execute(r0)     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
            r0.get()     // Catch:{ InterruptedException -> 0x00d0, ExecutionException -> 0x00f2 }
        L_0x0095:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x00a5
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.resultcode     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = "0"
            boolean r0 = r0.equals(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x011e
        L_0x00a5:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0100
            boolean r0 = r9.shouldRelogin     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x00f7
            r9.startReLogin(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x00b2:
            r0 = move-exception
            boolean r0 = r9.shouldRelogin
            if (r0 != 0) goto L_0x03dd
            boolean r0 = r9.shouldAutologin
            if (r0 != 0) goto L_0x03dd
            r0 = -6
            r9.loginStatus = r0
            r0 = 2131165621(0x7f0701b5, float:1.7945464E38)
            java.lang.String r0 = r11.getString(r0)
            r9.alertLoginError(r11, r0)
            r9.loginTaskCompleted(r11)
            r9.close(r11)
            goto L_0x000c
        L_0x00d0:
            r0 = move-exception
            r0.printStackTrace()     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x0095
        L_0x00d5:
            r0 = move-exception
            boolean r0 = r9.shouldRelogin
            if (r0 != 0) goto L_0x03eb
            boolean r0 = r9.shouldAutologin
            if (r0 != 0) goto L_0x03eb
            r9.loginStatus = r8
            r0 = 2131165621(0x7f0701b5, float:1.7945464E38)
            java.lang.String r0 = r11.getString(r0)
            r9.alertLoginError(r11, r0)
            r9.loginTaskCompleted(r11)
            r9.close(r11)
            goto L_0x000c
        L_0x00f2:
            r0 = move-exception
            r0.printStackTrace()     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x0095
        L_0x00f7:
            boolean r0 = r9.shouldAutologin     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0100
            r9.startAutoLogin(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x0100:
            com.pccw.mobile.sip.ServerMessageController r2 = r9.messageController     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0119
            java.lang.String r0 = "99"
        L_0x0108:
            java.lang.String r3 = "get_number_info_prepaid"
            java.lang.String r0 = r2.obtainMessage(r3, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x0119:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.resultcode     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x0108
        L_0x011e:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.simType     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = "prepaid"
            boolean r0 = r0.equalsIgnoreCase(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0148
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.allowRS     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = "true"
            boolean r0 = r0.equalsIgnoreCase(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0148
            r0 = 2131165520(0x7f070150, float:1.794526E38)
            java.lang.String r0 = r11.getString(r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x0148:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.simType     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = "prepaid"
            boolean r0 = r0.equalsIgnoreCase(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0172
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.status     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = "active"
            boolean r0 = r0.equalsIgnoreCase(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0172
            r0 = 2131165528(0x7f070158, float:1.7945276E38)
            java.lang.String r0 = r11.getString(r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x0172:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.resultcode     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = "0"
            boolean r0 = r0.equals(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x019c
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.simType     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = "prepaid"
            boolean r0 = r0.equalsIgnoreCase(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x019c
            r0 = 2131165517(0x7f07014d, float:1.7945253E38)
            java.lang.String r0 = r11.getString(r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x019c:
            boolean r0 = r9.authGetImsi_prepaid(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0221
            java.lang.String r0 = encryptedPccwPrepaidImsi     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = ""
            boolean r0 = r0.equals(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0221
            java.lang.String r0 = r9.fetchAppVersion(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r2 = com.pccw.mobile.sip.ClientStateManager.getEncryptedDeviceId(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "https://sip.pccwmobile.com/voip02/login.do"
            r4 = 10
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r5 = 0
            java.lang.String r6 = "imsi"
            r4[r5] = r6     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r5 = 1
            java.lang.String r6 = encryptedPccwPrepaidImsi     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r4[r5] = r6     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r5 = 2
            java.lang.String r6 = "version"
            r4[r5] = r6     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r5 = 3
            r4[r5] = r0     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 4
            java.lang.String r5 = "os"
            r4[r0] = r5     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 5
            java.lang.String r5 = OS     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r4[r0] = r5     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 6
            java.lang.String r5 = "deviceID"
            r4[r0] = r5     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 7
            r4[r0] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 8
            java.lang.String r2 = "encrypted"
            r4[r0] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 9
            java.lang.String r2 = "1"
            r4[r0] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = com.pccw.mobile.sip.util.HttpUtils.post(r3, r4)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
        L_0x01ee:
            if (r0 == 0) goto L_0x0465
            boolean r1 = org.apache.commons.lang.StringUtils.isNotBlank(r0)
            if (r1 == 0) goto L_0x0465
            javax.xml.parsers.SAXParserFactory r1 = javax.xml.parsers.SAXParserFactory.newInstance()     // Catch:{ Exception -> 0x03fb }
            javax.xml.parsers.SAXParser r1 = r1.newSAXParser()     // Catch:{ Exception -> 0x03fb }
            org.xml.sax.XMLReader r1 = r1.getXMLReader()     // Catch:{ Exception -> 0x03fb }
            com.pccw.mobile.sip.service.LoginXmlHandler r2 = new com.pccw.mobile.sip.service.LoginXmlHandler     // Catch:{ Exception -> 0x03fb }
            r2.<init>()     // Catch:{ Exception -> 0x03fb }
            r1.setContentHandler(r2)     // Catch:{ Exception -> 0x03fb }
            org.xml.sax.InputSource r3 = new org.xml.sax.InputSource     // Catch:{ Exception -> 0x03fb }
            java.io.StringReader r4 = new java.io.StringReader     // Catch:{ Exception -> 0x03fb }
            r4.<init>(r0)     // Catch:{ Exception -> 0x03fb }
            r3.<init>(r4)     // Catch:{ Exception -> 0x03fb }
            r1.parse(r3)     // Catch:{ Exception -> 0x03fb }
            com.pccw.mobile.sip.service.LoginResponse r0 = r2.res     // Catch:{ Exception -> 0x03fb }
            r9.handleLoginResponse(r10, r11, r0)     // Catch:{ Exception -> 0x03fb }
        L_0x021c:
            r9.loginTaskCompleted(r11)
            goto L_0x000c
        L_0x0221:
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x0229:
            java.lang.String r2 = r9.fetchEncryptedIMSI(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            boolean r0 = org.apache.commons.lang.StringUtils.isBlank(r2)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x023f
            boolean r0 = com.pccw.mobile.sip.ClientStateManager.isOperatorPccw(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0265
            boolean r0 = com.pccw.mobile.sip.ClientStateManager.isOperatorCSL(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0265
        L_0x023f:
            r0 = -4
            r9.loginStatus = r0     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            boolean r0 = com.pccw.mobile.sip.ClientStateManager.isSecondOperatorSim(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x025a
            r0 = 2131165468(0x7f07011c, float:1.7945154E38)
            java.lang.String r0 = r11.getString(r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
        L_0x0252:
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x025a:
            r0 = 2131165639(0x7f0701c7, float:1.79455E38)
            java.lang.String r0 = r11.getString(r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x0252
        L_0x0265:
            com.pccw.mobile.sip.service.MobileSipService$2 r0 = new com.pccw.mobile.sip.service.MobileSipService$2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0.<init>()     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            com.pccw.mobile.server.CheckNumberTypeApi r3 = new com.pccw.mobile.server.CheckNumberTypeApi     // Catch:{ InterruptedException -> 0x029d, ExecutionException -> 0x02a2 }
            java.lang.String r4 = ""
            r3.<init>(r0, r11, r2, r4)     // Catch:{ InterruptedException -> 0x029d, ExecutionException -> 0x02a2 }
            r0 = 1
            java.lang.String[] r0 = new java.lang.String[r0]     // Catch:{ InterruptedException -> 0x029d, ExecutionException -> 0x02a2 }
            r4 = 0
            java.lang.String r5 = ""
            r0[r4] = r5     // Catch:{ InterruptedException -> 0x029d, ExecutionException -> 0x02a2 }
            android.os.AsyncTask r0 = r3.execute(r0)     // Catch:{ InterruptedException -> 0x029d, ExecutionException -> 0x02a2 }
            r0.get()     // Catch:{ InterruptedException -> 0x029d, ExecutionException -> 0x02a2 }
        L_0x0280:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0290
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.resultcode     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "0"
            boolean r0 = r0.equals(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0301
        L_0x0290:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x02b0
            boolean r0 = r9.shouldRelogin     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x02a7
            r9.startReLogin(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x029d:
            r0 = move-exception
            r0.printStackTrace()     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x0280
        L_0x02a2:
            r0 = move-exception
            r0.printStackTrace()     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x0280
        L_0x02a7:
            boolean r0 = r9.shouldAutologin     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x02b0
            r9.startAutoLogin(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x02b0:
            boolean r0 = com.pccw.mobile.sip.ClientStateManager.isPrepaid(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x02d4
            com.pccw.mobile.sip.ServerMessageController r2 = r9.messageController     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x02cf
            java.lang.String r0 = "99"
        L_0x02be:
            java.lang.String r3 = "get_number_info_prepaid"
            java.lang.String r0 = r2.obtainMessage(r3, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
        L_0x02c4:
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x02cf:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.resultcode     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x02be
        L_0x02d4:
            com.pccw.mobile.sip.ServerMessageController r2 = r9.messageController     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x02f7
            java.lang.String r0 = "99"
        L_0x02dc:
            java.lang.String r3 = "get_number_info"
            java.lang.String r0 = r2.obtainMessage(r3, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            boolean r2 = com.pccw.mobile.util.ErrorMsgUtil.shouldShowOverseaXmlErrorMsg(r0, r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r2 == 0) goto L_0x02c4
            com.pccw.mobile.sip.ServerMessageController r2 = r9.messageController     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x02fc
            java.lang.String r0 = "99"
        L_0x02f0:
            java.lang.String r3 = "get_number_info_oversea"
            java.lang.String r0 = r2.obtainMessage(r3, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x02c4
        L_0x02f7:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.resultcode     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x02dc
        L_0x02fc:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.resultcode     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x02f0
        L_0x0301:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.simType     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "prepaid"
            boolean r0 = r0.equalsIgnoreCase(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0361
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.simType     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "prepaid"
            boolean r0 = r0.equalsIgnoreCase(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0337
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.allowRS     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "true"
            boolean r0 = r0.equalsIgnoreCase(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0337
            r0 = 2131165520(0x7f070150, float:1.794526E38)
            java.lang.String r0 = r11.getString(r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x0337:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.simType     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "prepaid"
            boolean r0 = r0.equalsIgnoreCase(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0398
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.status     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "active"
            boolean r0 = r0.equalsIgnoreCase(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 != 0) goto L_0x0398
            r0 = 2131165528(0x7f070158, float:1.7945276E38)
            java.lang.String r0 = r11.getString(r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x0361:
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.simType     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "postpaid"
            boolean r0 = r0.equalsIgnoreCase(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0398
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.operator     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "csl"
            boolean r0 = r0.equalsIgnoreCase(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0398
            com.pccw.mobile.server.response.CheckNumberTypeResponse r0 = r9.checkNumberTypeResponse     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r0.allowkk     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = "false"
            boolean r0 = r0.equalsIgnoreCase(r3)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            if (r0 == 0) goto L_0x0398
            java.lang.String r0 = "get_number_info_not_allow_csl_postpaid"
            java.lang.String r2 = ""
            java.lang.String r0 = com.pccw.mobile.util.ErrorMsgUtil.getLocalErrorMsg(r0, r2, r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.alertLoginError(r11, r0)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.loginTaskCompleted(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r9.close(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x000c
        L_0x0398:
            r9.getLang()     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = r9.fetchAppVersion(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r3 = com.pccw.mobile.sip.ClientStateManager.getEncryptedDeviceId(r11)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r4 = "https://sip.pccwmobile.com/voip02/login.do"
            r5 = 10
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r6 = 0
            java.lang.String r7 = "imsi"
            r5[r6] = r7     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r6 = 1
            r5[r6] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r2 = 2
            java.lang.String r6 = "version"
            r5[r2] = r6     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r2 = 3
            r5[r2] = r0     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 4
            java.lang.String r2 = "os"
            r5[r0] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 5
            java.lang.String r2 = OS     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r5[r0] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 6
            java.lang.String r2 = "deviceID"
            r5[r0] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 7
            r5[r0] = r3     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 8
            java.lang.String r2 = "encrypted"
            r5[r0] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            r0 = 9
            java.lang.String r2 = "1"
            r5[r0] = r2     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            java.lang.String r0 = com.pccw.mobile.sip.util.HttpUtils.post(r4, r5)     // Catch:{ NetworkException -> 0x00b2, Exception -> 0x00d5 }
            goto L_0x01ee
        L_0x03dd:
            boolean r0 = r9.shouldRelogin
            if (r0 == 0) goto L_0x03e6
            r9.startReLogin(r11)
            goto L_0x000c
        L_0x03e6:
            r9.startAutoLogin(r11)
            goto L_0x000c
        L_0x03eb:
            boolean r0 = r9.shouldRelogin
            if (r0 == 0) goto L_0x03f5
            r9.startReLogin(r11)
            r0 = r1
            goto L_0x01ee
        L_0x03f5:
            r9.startAutoLogin(r11)
            r0 = r1
            goto L_0x01ee
        L_0x03fb:
            r0 = move-exception
            boolean r0 = r9.shouldRelogin
            if (r0 != 0) goto L_0x0457
            boolean r0 = r9.shouldAutologin
            if (r0 != 0) goto L_0x0457
            r9.loginStatus = r8
            boolean r0 = com.pccw.mobile.sip.ClientStateManager.isPrepaid(r11)
            if (r0 == 0) goto L_0x0422
            com.pccw.mobile.sip.ServerMessageController r0 = r9.messageController
            java.lang.String r1 = "login_prepaid"
            java.lang.String r2 = "99"
            java.lang.String r0 = r0.obtainMessage(r1, r2)
            r9.loginErrorMsg = r0
        L_0x0418:
            java.lang.String r0 = r9.loginErrorMsg
            r9.alertLoginError(r11, r0)
            r9.close(r11)
            goto L_0x021c
        L_0x0422:
            com.pccw.mobile.sip.ServerMessageController r0 = r9.messageController
            java.lang.String r1 = "login"
            java.lang.String r2 = "99"
            java.lang.String r0 = r0.obtainMessage(r1, r2)
            r9.loginErrorMsg = r0
            int[] r0 = com.pccw.mobile.sip.service.MobileSipService.AnonymousClass8.$SwitchMap$com$pccw$mobile$util$ErrorMsgUtil$CheckOverseaResult
            java.lang.String r1 = r9.loginErrorMsg
            com.pccw.mobile.util.ErrorMsgUtil$CheckOverseaResult r1 = com.pccw.mobile.util.ErrorMsgUtil.shouldShowOverseaXmlErrorMsgWithFailCase(r1, r11)
            int r1 = r1.ordinal()
            r0 = r0[r1]
            switch(r0) {
                case 1: goto L_0x0418;
                case 2: goto L_0x0440;
                case 3: goto L_0x044d;
                default: goto L_0x043f;
            }
        L_0x043f:
            goto L_0x0418
        L_0x0440:
            com.pccw.mobile.sip.ServerMessageController r0 = r9.messageController
            java.lang.String r1 = "login_oversea"
            java.lang.String r2 = "99"
            java.lang.String r0 = r0.obtainMessage(r1, r2)
            r9.loginErrorMsg = r0
            goto L_0x0418
        L_0x044d:
            r0 = 2131165549(0x7f07016d, float:1.7945318E38)
            java.lang.String r0 = r11.getString(r0)
            r9.loginErrorMsg = r0
            goto L_0x0418
        L_0x0457:
            boolean r0 = r9.shouldRelogin
            if (r0 == 0) goto L_0x0460
            r9.startReLogin(r11)
            goto L_0x021c
        L_0x0460:
            r9.startAutoLogin(r11)
            goto L_0x021c
        L_0x0465:
            boolean r0 = r9.shouldRelogin
            if (r0 != 0) goto L_0x04c0
            boolean r0 = r9.shouldAutologin
            if (r0 != 0) goto L_0x04c0
            r9.loginStatus = r8
            boolean r0 = com.pccw.mobile.sip.ClientStateManager.isPrepaid(r11)
            if (r0 == 0) goto L_0x048b
            com.pccw.mobile.sip.ServerMessageController r0 = r9.messageController
            java.lang.String r1 = "login_prepaid"
            java.lang.String r2 = "99"
            java.lang.String r0 = r0.obtainMessage(r1, r2)
            r9.loginErrorMsg = r0
        L_0x0481:
            java.lang.String r0 = r9.loginErrorMsg
            r9.alertLoginError(r11, r0)
            r9.close(r11)
            goto L_0x021c
        L_0x048b:
            com.pccw.mobile.sip.ServerMessageController r0 = r9.messageController
            java.lang.String r1 = "login"
            java.lang.String r2 = "99"
            java.lang.String r0 = r0.obtainMessage(r1, r2)
            r9.loginErrorMsg = r0
            int[] r0 = com.pccw.mobile.sip.service.MobileSipService.AnonymousClass8.$SwitchMap$com$pccw$mobile$util$ErrorMsgUtil$CheckOverseaResult
            java.lang.String r1 = r9.loginErrorMsg
            com.pccw.mobile.util.ErrorMsgUtil$CheckOverseaResult r1 = com.pccw.mobile.util.ErrorMsgUtil.shouldShowOverseaXmlErrorMsgWithFailCase(r1, r11)
            int r1 = r1.ordinal()
            r0 = r0[r1]
            switch(r0) {
                case 1: goto L_0x0481;
                case 2: goto L_0x04a9;
                case 3: goto L_0x04b6;
                default: goto L_0x04a8;
            }
        L_0x04a8:
            goto L_0x0481
        L_0x04a9:
            com.pccw.mobile.sip.ServerMessageController r0 = r9.messageController
            java.lang.String r1 = "login_oversea"
            java.lang.String r2 = "99"
            java.lang.String r0 = r0.obtainMessage(r1, r2)
            r9.loginErrorMsg = r0
            goto L_0x0481
        L_0x04b6:
            r0 = 2131165549(0x7f07016d, float:1.7945318E38)
            java.lang.String r0 = r11.getString(r0)
            r9.loginErrorMsg = r0
            goto L_0x0481
        L_0x04c0:
            boolean r0 = r9.shouldRelogin
            if (r0 == 0) goto L_0x04c9
            r9.startReLogin(r11)
            goto L_0x021c
        L_0x04c9:
            r9.startAutoLogin(r11)
            goto L_0x021c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.sip.service.MobileSipService.doHttpsLogin(android.os.Handler, android.content.Context):void");
    }

    private String fetchAppVersion(Context context) throws PackageManager.NameNotFoundException {
        return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
    }

    public static MobileSipService getInstance() {
        return instance;
    }

    /* access modifiers changed from: private */
    public String getLang() {
        Locale locale = Locale.getDefault();
        return "zh".equals(locale.getLanguage()) ? ("HK".equals(locale.getCountry()) || "TW".equals(locale.getCountry())) ? Constants.GET_LANG_TRADITIONAL_CHINESE : Constants.GET_LANG_ENGLISH : Constants.GET_LANG_ENGLISH;
    }

    /* JADX WARNING: Removed duplicated region for block: B:14:0x0068  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private java.lang.String getSipNumber(java.lang.String r11, android.content.Context r12) {
        /*
            r10 = this;
            r9 = 2
            r3 = 0
            r4 = 1
            int r0 = r11.length()
            r1 = 8
            if (r0 == r1) goto L_0x000c
        L_0x000b:
            return r11
        L_0x000c:
            r2 = r4
            r0 = r3
        L_0x000e:
            if (r2 == 0) goto L_0x00c9
            if (r0 >= r9) goto L_0x00c9
            r5 = 0
            java.text.SimpleDateFormat r1 = new java.text.SimpleDateFormat     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r2 = "yyyyMMddHHmmss"
            java.util.Locale r6 = java.util.Locale.US     // Catch:{ Exception -> 0x00b3 }
            r1.<init>(r2, r6)     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r2 = "UTC"
            java.util.TimeZone r2 = java.util.TimeZone.getTimeZone(r2)     // Catch:{ Exception -> 0x00b3 }
            r1.setTimeZone(r2)     // Catch:{ Exception -> 0x00b3 }
            java.util.Date r2 = new java.util.Date     // Catch:{ Exception -> 0x00b3 }
            r2.<init>()     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r1 = r1.format(r2)     // Catch:{ Exception -> 0x00b3 }
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x00b3 }
            r2.<init>()     // Catch:{ Exception -> 0x00b3 }
            java.lang.StringBuilder r2 = r2.append(r11)     // Catch:{ Exception -> 0x00b3 }
            java.lang.StringBuilder r1 = r2.append(r1)     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r1 = r1.toString()     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r1 = com.pccw.mobile.sip.util.CryptoServices.aesDecryptByCalleeStatusKey(r1)     // Catch:{ Exception -> 0x00b3 }
            boolean r2 = org.apache.commons.lang.StringUtils.isNotBlank(r1)     // Catch:{ Exception -> 0x00b3 }
            if (r2 == 0) goto L_0x00d0
            com.pccw.mobile.sip.service.MobileSipService r2 = getInstance()     // Catch:{ Exception -> 0x00b3 }
            boolean r2 = r2.isNetworkAvailable(r12)     // Catch:{ Exception -> 0x00b3 }
            if (r2 == 0) goto L_0x00d0
            java.lang.String r2 = "https://sip.pccwmobile.com/voip02/getCalleeStatus.do"
            r6 = 2
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ Exception -> 0x00b3 }
            r7 = 0
            java.lang.String r8 = "m"
            r6[r7] = r8     // Catch:{ Exception -> 0x00b3 }
            r7 = 1
            r6[r7] = r1     // Catch:{ Exception -> 0x00b3 }
            java.lang.String r5 = com.pccw.mobile.sip.util.HttpUtils.post(r2, r6)     // Catch:{ Exception -> 0x00b3 }
            r1 = r0
            r2 = r3
        L_0x0066:
            if (r2 != 0) goto L_0x00cd
            boolean r0 = org.apache.commons.lang.StringUtils.isNotBlank(r5)
            if (r0 == 0) goto L_0x00c3
            javax.xml.parsers.SAXParserFactory r0 = javax.xml.parsers.SAXParserFactory.newInstance()     // Catch:{ Exception -> 0x00b9 }
            javax.xml.parsers.SAXParser r0 = r0.newSAXParser()     // Catch:{ Exception -> 0x00b9 }
            org.xml.sax.XMLReader r0 = r0.getXMLReader()     // Catch:{ Exception -> 0x00b9 }
            com.pccw.mobile.sip.service.GetCalleeStatusXmlHandler r6 = new com.pccw.mobile.sip.service.GetCalleeStatusXmlHandler     // Catch:{ Exception -> 0x00b9 }
            r6.<init>()     // Catch:{ Exception -> 0x00b9 }
            r0.setContentHandler(r6)     // Catch:{ Exception -> 0x00b9 }
            org.xml.sax.InputSource r7 = new org.xml.sax.InputSource     // Catch:{ Exception -> 0x00b9 }
            java.io.StringReader r8 = new java.io.StringReader     // Catch:{ Exception -> 0x00b9 }
            r8.<init>(r5)     // Catch:{ Exception -> 0x00b9 }
            r7.<init>(r8)     // Catch:{ Exception -> 0x00b9 }
            r0.parse(r7)     // Catch:{ Exception -> 0x00b9 }
            com.pccw.mobile.sip.service.GetCalleeStatusResponse r0 = r6.response()     // Catch:{ Exception -> 0x00b9 }
            r10.lastGetCalleeStatusResponse = r0     // Catch:{ Exception -> 0x00b9 }
            if (r0 == 0) goto L_0x00cd
            java.lang.String r5 = r0.resultCode     // Catch:{ Exception -> 0x00b9 }
            if (r5 == 0) goto L_0x00cd
            java.lang.String r5 = r0.resultCode     // Catch:{ Exception -> 0x00b9 }
            java.lang.String r6 = "0"
            boolean r5 = r5.equals(r6)     // Catch:{ Exception -> 0x00b9 }
            if (r5 == 0) goto L_0x00cd
            java.lang.String r5 = r0.status     // Catch:{ Exception -> 0x00b9 }
            java.lang.String r6 = "1"
            boolean r5 = r5.equals(r6)     // Catch:{ Exception -> 0x00b9 }
            if (r5 == 0) goto L_0x00cd
            java.lang.String r11 = r0.sip_number     // Catch:{ Exception -> 0x00b9 }
            goto L_0x000b
        L_0x00b3:
            r1 = move-exception
            int r0 = r0 + 1
            r1 = r0
            r2 = r4
            goto L_0x0066
        L_0x00b9:
            r0 = move-exception
            int r1 = r1 + 1
            r0.printStackTrace()
            r2 = r4
            r0 = r1
            goto L_0x000e
        L_0x00c3:
            int r1 = r1 + 1
            r2 = r4
            r0 = r1
            goto L_0x000e
        L_0x00c9:
            if (r2 == 0) goto L_0x000b
            goto L_0x000b
        L_0x00cd:
            r0 = r1
            goto L_0x000e
        L_0x00d0:
            r1 = r0
            r2 = r3
            goto L_0x0066
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.sip.service.MobileSipService.getSipNumber(java.lang.String, android.content.Context):java.lang.String");
    }

    private void handleLoginResponse(Handler handler, Context context, LoginResponse loginResponse) {
        boolean z = false;
        if ("0".equals(loginResponse.resultcode)) {
            handleSuccesLoginResponse(handler, context, loginResponse);
            return;
        }
        if (ClientStateManager.isPrepaid(context)) {
            this.loginErrorMsg = this.messageController.obtainMessage(ServerMessageController.MESSAGE_TYPE_LOGIN_PREPAID, loginResponse.resultcode);
        } else {
            this.loginErrorMsg = this.messageController.obtainMessage(ServerMessageController.MESSAGE_TYPE_LOGIN, loginResponse.resultcode);
            if (ErrorMsgUtil.shouldShowOverseaXmlErrorMsg(this.loginErrorMsg, context)) {
                this.loginErrorMsg = this.messageController.obtainMessage(ServerMessageController.MESSAGE_TYPE_LOGIN_OVERSEA, loginResponse.resultcode);
            }
        }
        if (this.loginErrorMsg == null) {
            boolean z2 = loginResponse.message != null;
            if (loginResponse.message.length() > 0) {
                z = true;
            }
            if (z2 && z) {
                this.loginErrorMsg = loginResponse.message;
            } else {
                this.loginErrorMsg = context.getString(R.string.server_error);
            }
        }
        this.loginStatus = Integer.valueOf(loginResponse.resultcode).intValue();
        alertLoginError(context, this.loginErrorMsg);
        close(context);
    }

    private void handleSuccesLoginResponse(Handler handler, final Context context, LoginResponse loginResponse) {
        String trim = ClientStateManager.getPhone(context).trim();
        if (trim.length() <= 0 || trim.equals(loginResponse.dn)) {
            ClientStateManager.changeNumber(context, loginResponse.dn);
        } else {
            ClientStateManager.changeNumber(context, loginResponse.dn);
        }
        this.isInHK = loginResponse.is_hk;
        if (!PreferenceManager.getDefaultSharedPreferences(context).getBoolean(Constants.SHOW_DAYPASS_MESSAGE, true) || !loginResponse.is_daypass_sub || this.dayPassAlertOKClicked) {
            this.dayPassAlertOKClicked = false;
            SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
            boolean z = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getBoolean(context.getString(R.string.pref_codec_ilbc_key), false);
            if (!z) {
                enableDisableAudioCodec(context, R.string.pref_codec_pcmu_key, true);
            }
            if (defaultSharedPreferences.getString(context.getString(R.string.pref_tunnel_mode), context.getString(R.string.pref_tunnel_mode_production)).equals(context.getString(R.string.pref_tunnel_mode_production))) {
                defaultSharedPreferences.edit().putString(context.getString(R.string.pref_userid_key), loginResponse.sip_number).putString(context.getString(R.string.pref_passwd_key), loginResponse.pwd).putString(context.getString(R.string.pref_proxy_key), (z ? loginResponse.sip_server_ilbc : loginResponse.sip_server) + ":" + (z ? loginResponse.sip_port_ilbc : loginResponse.sip_port)).putString(context.getString(R.string.pref_domain_key), loginResponse.sip_domain).putString(context.getString(R.string.pref_username_key), loginResponse.sip_number.replace("s", "")).putString(context.getString(R.string.pref_tunnel_host_1_key), loginResponse.tunnel_host_1).putString(context.getString(R.string.pref_tunnel_host_2_key), loginResponse.tunnel_host_2).putString(context.getString(R.string.pref_tunnel_port_key), loginResponse.tunnel_port).putBoolean(context.getString(R.string.pref_tunnel_enabled_key), loginResponse.tunnel_enable).putString(context.getString(R.string.pref_mirror_port_key), loginResponse.sip_server_ilbc).putString(Constants.echoServerHost, loginResponse.echo_server).commit();
            } else {
                defaultSharedPreferences.edit().putString(context.getString(R.string.pref_userid_key), loginResponse.sip_number).putString(context.getString(R.string.pref_passwd_key), loginResponse.pwd).putString(context.getString(R.string.pref_proxy_key), (z ? loginResponse.sip_server_ilbc : loginResponse.sip_server) + ":" + (z ? loginResponse.sip_port_ilbc : loginResponse.sip_port)).putString(context.getString(R.string.pref_domain_key), loginResponse.sip_domain).putString(context.getString(R.string.pref_username_key), loginResponse.sip_number.replace("s", "")).putString(context.getString(R.string.pref_mirror_port_key), loginResponse.sip_server_ilbc).putString(Constants.echoServerHost, loginResponse.echo_server).commit();
                if (StringUtils.isBlank(defaultSharedPreferences.getString(context.getString(R.string.pref_tunnel_host_1_key), ""))) {
                    defaultSharedPreferences.edit().putString(context.getString(R.string.pref_tunnel_host_1_key), loginResponse.tunnel_host_1);
                }
                if (StringUtils.isBlank(defaultSharedPreferences.getString(context.getString(R.string.pref_tunnel_host_2_key), ""))) {
                    defaultSharedPreferences.edit().putString(context.getString(R.string.pref_tunnel_host_2_key), loginResponse.tunnel_host_2);
                }
                if (StringUtils.isBlank(defaultSharedPreferences.getString(context.getString(R.string.pref_tunnel_port_key), ""))) {
                    defaultSharedPreferences.edit().putString(context.getString(R.string.pref_tunnel_port_key), loginResponse.tunnel_port);
                }
            }
            SetEchoServerHost.setEchoServerHost(context);
            this.loginStatus = 0;
            this.sessionId = loginResponse.session_id;
            handler.post(new Runnable() {
                public void run() {
                    MobileSipService.this.restartEngine(context);
                }
            });
            return;
        }
        alertDaypass(context);
    }

    private void loginTaskCompleted(Context context) {
        synchronized (this) {
            this.isLoginRunning = false;
            this.isReLoginRunning = false;
            this.isAutoLoginRunning = false;
            alertLoginFinished(context);
        }
    }

    private void planAutologin(Context context) {
        long j = this.loginRetryCount == 0 ? 5000 : 30000;
        AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 100, new Intent(context, RetryAlarmReceiver.class), 0);
        alarmManager.cancel(broadcast);
        alarmManager.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, j + SystemClock.elapsedRealtime(), broadcast);
    }

    private void planHeartBeat(Context context, long j) {
        AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 0, new Intent(context, HeartBeatAlarmReceiver.class), 0);
        alarmManager.cancel(broadcast);
        alarmManager.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, SystemClock.elapsedRealtime() + j, broadcast);
    }

    private void planRelogin(Context context) {
        long j = this.loginRetryCount == 0 ? 5000 : 30000;
        AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        PendingIntent broadcast = PendingIntent.getBroadcast(context, 100, new Intent(context, RetryAlarmReceiver.class), 0);
        alarmManager.cancel(broadcast);
        alarmManager.set(AlarmManager.ELAPSED_REALTIME_WAKEUP, j + SystemClock.elapsedRealtime(), broadcast);
    }

    private void resetCameraFromPreferences() {
        int i = 0;
        for (AndroidCameraConfiguration.AndroidCamera androidCamera : AndroidCameraConfiguration.retrieveCameras()) {
            if (androidCamera.frontFacing) {
                i = androidCamera.id;
            }
        }
        LinphoneService.getLc().setVideoDevice(i);
    }

    /* access modifiers changed from: private */
    public void restartEngine(Context context) {
        DailPadActivity.on(context, true);
        if (LinphoneService.isready()) {
            try {
                LinphoneService.instance().initFromConf();
            } catch (LinphoneException e) {
            }
        } else {
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setClass(context, LinphoneService.class);
            intent.putExtra("do_init", true);
            context.startService(intent);
        }
    }

    private void setCodecs(Context context) {
        while (true) {
            if (LinphoneService.isready() && LinphoneService.instance().getLinphoneCore() != null) {
                break;
            }
            try {
                Thread.sleep(100);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (LinphoneService.isready()) {
            boolean z = LinphoneService.instance().getLinphoneCore().findPayloadType("iLBC", 8000) != null;
            this.currentCodec = z ? "ilbc" : "g.711";
            enableDisableAudioCodec(context, R.string.pref_codec_ilbc_key, z);
            enableDisableAudioCodec(context, R.string.pref_codec_pcmu_key, !z);
        }
    }

    public static boolean shouldEnableVideoButton(String str) {
        String replaceAll = str.replaceAll("-", "");
        if (replaceAll.startsWith("+852")) {
            replaceAll = replaceAll.substring(4);
        } else if (replaceAll.startsWith("133")) {
            replaceAll = replaceAll.substring(3);
        } else {
            if (!replaceAll.startsWith("anonymous")) {
                if (replaceAll.startsWith("1357")) {
                    replaceAll = replaceAll.substring(4);
                }
            }
            return false;
        }
        if (MobileNumberUtil.isHKMobileNumberStart(replaceAll)) {
            return true;
        }
        return false;
    }

    private boolean shouldGetCalleeState(String str, Context context) {
        if (ClientStateManager.isPrepaid(context)) {
            return false;
        }
        String replaceAll = str.replaceAll("-", "");
        if (replaceAll.startsWith("+852")) {
            replaceAll = replaceAll.substring(4);
        } else if (replaceAll.startsWith("133")) {
            replaceAll = replaceAll.substring(3);
        } else {
            if (!replaceAll.startsWith("anonymous")) {
                if (replaceAll.startsWith("1357")) {
                    replaceAll = replaceAll.substring(4);
                }
            }
            return false;
        }
        if (MobileNumberUtil.isHKMobileNumberStart(replaceAll)) {
            return true;
        }
        return false;
    }

    public static int shouldUseOrientationMode(String str) {
        String replaceAll = str.replaceAll("-", "");
        if (replaceAll.startsWith("+852")) {
            replaceAll = replaceAll.substring(4);
        } else if (replaceAll.startsWith("133")) {
            replaceAll = replaceAll.substring(3);
        } else if (replaceAll.startsWith("anonymous")) {
            return 1;
        } else {
            if (replaceAll.startsWith("1357")) {
                replaceAll = replaceAll.substring(4);
            }
        }
        return MobileNumberUtil.isHKMobileNumberStart(replaceAll) ? 1 : 0;
    }

    private void stopAutoLogin(Context context) {
        this.isAutoLoginRunning = false;
        this.shouldAutologin = false;
        close(context);
        ((AlarmManager) context.getSystemService(Context.ALARM_SERVICE)).cancel(PendingIntent.getBroadcast(context, 100, new Intent(context, RetryAlarmReceiver.class), 0));
    }

    /* access modifiers changed from: private */
    public void stopEngine(Context context) {
        Intent intent = new Intent("android.intent.action.MAIN");
        intent.setClass(context, LinphoneService.class);
        context.stopService(intent);
    }

    /* access modifiers changed from: private */
    public void stopHeartbeat(Context context) {
        ((AlarmManager) context.getSystemService(Context.ALARM_SERVICE)).cancel(PendingIntent.getBroadcast(context, 0, new Intent(context, HeartBeatAlarmReceiver.class), 0));
    }

    /* access modifiers changed from: private */
    public void stopReLogin(Context context) {
        ((AlarmManager) context.getSystemService(Context.ALARM_SERVICE)).cancel(PendingIntent.getBroadcast(context, 100, new Intent(context, RetryAlarmReceiver.class), 0));
    }

    public void activateCallForward(final boolean z, final Context context) {
        new Thread() {
            /* JADX WARNING: Removed duplicated region for block: B:22:0x007c  */
            /* JADX WARNING: Removed duplicated region for block: B:42:0x00e6 A[ADDED_TO_REGION] */
            /* Code decompiled incorrectly, please refer to instructions dump. */
            public void run() {
                /*
                    r12 = this;
                    r4 = 0
                    r8 = 0
                    r2 = -1
                    r1 = 2
                    r3 = 1
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.this
                    boolean r0 = r2
                    if (r0 == 0) goto L_0x00f4
                    r0 = r1
                L_0x000c:
                    int unused = r5.callForwardingState = r0
                    r7 = r3
                    r6 = r8
                L_0x0011:
                    if (r7 == 0) goto L_0x029e
                    if (r6 >= r1) goto L_0x029e
                    android.content.Context r0 = r3     // Catch:{ Exception -> 0x0105 }
                    boolean r0 = com.pccw.mobile.sip.ClientStateManager.isRegisteredPrepaid(r0)     // Catch:{ Exception -> 0x0105 }
                    if (r0 == 0) goto L_0x00f7
                    java.lang.String r0 = com.pccw.mobile.sip.service.MobileSipService.encryptedPccwPrepaidImsi     // Catch:{ Exception -> 0x0105 }
                L_0x0021:
                    boolean r5 = org.apache.commons.lang.StringUtils.isNotBlank(r0)     // Catch:{ Exception -> 0x0105 }
                    if (r5 == 0) goto L_0x02e3
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.getInstance()     // Catch:{ Exception -> 0x0105 }
                    android.content.Context r7 = r3     // Catch:{ Exception -> 0x0105 }
                    boolean r5 = r5.isNetworkAvailable(r7)     // Catch:{ Exception -> 0x0105 }
                    if (r5 == 0) goto L_0x02e3
                    boolean r5 = r2     // Catch:{ Exception -> 0x0105 }
                    if (r5 == 0) goto L_0x0101
                    java.lang.String r5 = "activate"
                L_0x0039:
                    java.lang.String r7 = "https://sip.pccwmobile.com/voip02/callforward.do"
                    r9 = 10
                    java.lang.Object[] r9 = new java.lang.Object[r9]     // Catch:{ Exception -> 0x0105 }
                    r10 = 0
                    java.lang.String r11 = "imsi"
                    r9[r10] = r11     // Catch:{ Exception -> 0x0105 }
                    r10 = 1
                    r9[r10] = r0     // Catch:{ Exception -> 0x0105 }
                    r0 = 2
                    java.lang.String r10 = "action"
                    r9[r0] = r10     // Catch:{ Exception -> 0x0105 }
                    r0 = 3
                    r9[r0] = r5     // Catch:{ Exception -> 0x0105 }
                    r0 = 4
                    java.lang.String r5 = "lang"
                    r9[r0] = r5     // Catch:{ Exception -> 0x0105 }
                    r0 = 5
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0105 }
                    java.lang.String r5 = r5.getLang()     // Catch:{ Exception -> 0x0105 }
                    r9[r0] = r5     // Catch:{ Exception -> 0x0105 }
                    r0 = 6
                    java.lang.String r5 = "session_id"
                    r9[r0] = r5     // Catch:{ Exception -> 0x0105 }
                    r0 = 7
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0105 }
                    java.lang.String r5 = r5.sessionId     // Catch:{ Exception -> 0x0105 }
                    r9[r0] = r5     // Catch:{ Exception -> 0x0105 }
                    r0 = 8
                    java.lang.String r5 = "encrypted"
                    r9[r0] = r5     // Catch:{ Exception -> 0x0105 }
                    r0 = 9
                    java.lang.String r5 = "1"
                    r9[r0] = r5     // Catch:{ Exception -> 0x0105 }
                    java.lang.String r0 = com.pccw.mobile.sip.util.HttpUtils.post(r7, r9)     // Catch:{ Exception -> 0x0105 }
                    r7 = r8
                L_0x007a:
                    if (r7 != 0) goto L_0x02d4
                    boolean r5 = org.apache.commons.lang.StringUtils.isNotBlank(r0)
                    if (r5 == 0) goto L_0x0299
                    javax.xml.parsers.SAXParserFactory r5 = javax.xml.parsers.SAXParserFactory.newInstance()     // Catch:{ Exception -> 0x0113 }
                    javax.xml.parsers.SAXParser r5 = r5.newSAXParser()     // Catch:{ Exception -> 0x0113 }
                    org.xml.sax.XMLReader r5 = r5.getXMLReader()     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.service.CallForwardXmlHandler r9 = new com.pccw.mobile.sip.service.CallForwardXmlHandler     // Catch:{ Exception -> 0x0113 }
                    r9.<init>()     // Catch:{ Exception -> 0x0113 }
                    r5.setContentHandler(r9)     // Catch:{ Exception -> 0x0113 }
                    org.xml.sax.InputSource r10 = new org.xml.sax.InputSource     // Catch:{ Exception -> 0x0113 }
                    java.io.StringReader r11 = new java.io.StringReader     // Catch:{ Exception -> 0x0113 }
                    r11.<init>(r0)     // Catch:{ Exception -> 0x0113 }
                    r10.<init>(r11)     // Catch:{ Exception -> 0x0113 }
                    r5.parse(r10)     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.service.CallForwardResponse r9 = r9.response()     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.service.CallForwardResponse unused = r0.lastCallForwardResponse = r9     // Catch:{ Exception -> 0x0113 }
                    boolean r0 = r2     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x01cb
                    if (r9 == 0) goto L_0x01b3
                    java.lang.String r0 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x01b3
                    java.lang.String r0 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "0"
                    boolean r0 = r0.equals(r5)     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x011c
                    java.lang.String r0 = r9.fw_status     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x010c
                    java.lang.String r0 = r9.fw_status     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "A"
                    boolean r0 = r0.equals(r5)     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x010c
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = 0
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                L_0x00d4:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    int r0 = r0.callForwardingState     // Catch:{ Exception -> 0x0113 }
                    if (r0 != r2) goto L_0x01bb
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    android.content.Context r5 = r3     // Catch:{ Exception -> 0x0113 }
                    r0.close(r5)     // Catch:{ Exception -> 0x0113 }
                    r0 = r6
                L_0x00e4:
                    if (r7 == 0) goto L_0x02e0
                    if (r0 >= r1) goto L_0x02e0
                    r10 = 200(0xc8, double:9.9E-322)
                    java.lang.Thread.sleep(r10)     // Catch:{ Exception -> 0x00f0 }
                    r6 = r0
                    goto L_0x0011
                L_0x00f0:
                    r5 = move-exception
                    r6 = r0
                    goto L_0x0011
                L_0x00f4:
                    r0 = 3
                    goto L_0x000c
                L_0x00f7:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0105 }
                    android.content.Context r5 = r3     // Catch:{ Exception -> 0x0105 }
                    java.lang.String r0 = r0.fetchEncryptedIMSI(r5)     // Catch:{ Exception -> 0x0105 }
                    goto L_0x0021
                L_0x0101:
                    java.lang.String r5 = "deactivate"
                    goto L_0x0039
                L_0x0105:
                    r0 = move-exception
                    int r6 = r6 + 1
                    r7 = r3
                    r0 = r4
                    goto L_0x007a
                L_0x010c:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = -1
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    goto L_0x00d4
                L_0x0113:
                    r0 = move-exception
                    int r5 = r6 + 1
                    r0.printStackTrace()
                    r0 = r5
                    r7 = r3
                    goto L_0x00e4
                L_0x011c:
                    java.lang.String r0 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "2"
                    boolean r0 = r0.equals(r5)     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x014e
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = 4
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "callforward"
                    java.lang.String r10 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r0 = r0.obtainMessage(r5, r10)     // Catch:{ Exception -> 0x0113 }
                    if (r0 != 0) goto L_0x02dd
                    java.lang.String r0 = r9.message     // Catch:{ Exception -> 0x0113 }
                    r5 = r0
                L_0x013d:
                    if (r5 == 0) goto L_0x00d4
                    java.lang.String r0 = r9.fw_number     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x014b
                    java.lang.String r0 = r9.fw_number     // Catch:{ Exception -> 0x0113 }
                L_0x0145:
                    java.lang.String r9 = "-fw_number-"
                    r5.replace(r9, r0)     // Catch:{ Exception -> 0x0113 }
                    goto L_0x00d4
                L_0x014b:
                    java.lang.String r0 = "Unknown"
                    goto L_0x0145
                L_0x014e:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = -1
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x02da
                    android.content.Context r0 = r3     // Catch:{ Exception -> 0x0113 }
                    boolean r0 = com.pccw.mobile.sip.ClientStateManager.isPrepaid(r0)     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x0192
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "callforward_prepaid"
                    java.lang.String r10 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r0 = r0.obtainMessage(r5, r10)     // Catch:{ Exception -> 0x0113 }
                L_0x016e:
                    if (r0 != 0) goto L_0x0172
                    java.lang.String r0 = r9.message     // Catch:{ Exception -> 0x0113 }
                L_0x0172:
                    if (r0 == 0) goto L_0x00d4
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r5 = r5.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r9 = "callforward"
                    r10 = 2
                    java.lang.String r10 = java.lang.String.valueOf(r10)     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = r5.obtainMessage(r9, r10)     // Catch:{ Exception -> 0x0113 }
                    boolean r5 = r5.equals(r0)     // Catch:{ Exception -> 0x0113 }
                    if (r5 != 0) goto L_0x00d4
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    android.content.Context r9 = r3     // Catch:{ Exception -> 0x0113 }
                    r5.alertLoginError(r9, r0)     // Catch:{ Exception -> 0x0113 }
                    goto L_0x00d4
                L_0x0192:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "callforward"
                    java.lang.String r10 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r0 = r0.obtainMessage(r5, r10)     // Catch:{ Exception -> 0x0113 }
                    android.content.Context r5 = r3     // Catch:{ Exception -> 0x0113 }
                    boolean r5 = com.pccw.mobile.util.ErrorMsgUtil.shouldShowOverseaXmlErrorMsg(r0, r5)     // Catch:{ Exception -> 0x0113 }
                    if (r5 == 0) goto L_0x016e
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "callforward_oversea"
                    java.lang.String r10 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r0 = r0.obtainMessage(r5, r10)     // Catch:{ Exception -> 0x0113 }
                    goto L_0x016e
                L_0x01b3:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = -1
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    goto L_0x00d4
                L_0x01bb:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = 1
                    boolean unused = r0.isSuccess = r5     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    android.content.Context r5 = r3     // Catch:{ Exception -> 0x0113 }
                    r0.alertCallForwardSucceed(r5)     // Catch:{ Exception -> 0x0113 }
                    r0 = r6
                    goto L_0x00e4
                L_0x01cb:
                    if (r9 == 0) goto L_0x0290
                    java.lang.String r0 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x0290
                    java.lang.String r0 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "0"
                    boolean r0 = r0.equals(r5)     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x01fb
                    java.lang.String r0 = r9.fw_status     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x01f2
                    java.lang.String r0 = r9.fw_status     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "I"
                    boolean r0 = r0.equals(r5)     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x01f2
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = 1
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    r0 = r6
                    goto L_0x00e4
                L_0x01f2:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = 1
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    r0 = r6
                    goto L_0x00e4
                L_0x01fb:
                    java.lang.String r0 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "4"
                    boolean r0 = r0.equals(r5)     // Catch:{ Exception -> 0x0113 }
                    if (r0 != 0) goto L_0x020f
                    java.lang.String r0 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "5"
                    boolean r0 = r0.equals(r5)     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x0218
                L_0x020f:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = 1
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    r0 = r6
                    goto L_0x00e4
                L_0x0218:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = 1
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x02d7
                    android.content.Context r0 = r3     // Catch:{ Exception -> 0x0113 }
                    boolean r0 = com.pccw.mobile.sip.ClientStateManager.isPrepaid(r0)     // Catch:{ Exception -> 0x0113 }
                    if (r0 == 0) goto L_0x026f
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "callforward_prepaid"
                    java.lang.String r10 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r0 = r0.obtainMessage(r5, r10)     // Catch:{ Exception -> 0x0113 }
                L_0x0238:
                    if (r0 != 0) goto L_0x023c
                    java.lang.String r0 = r9.message     // Catch:{ Exception -> 0x0113 }
                L_0x023c:
                    if (r0 == 0) goto L_0x02d4
                    java.lang.String r5 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r9 = "8"
                    boolean r5 = r5.equals(r9)     // Catch:{ Exception -> 0x0113 }
                    if (r5 == 0) goto L_0x0250
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.getInstance()     // Catch:{ Exception -> 0x0113 }
                    int r5 = r5.loginStatus     // Catch:{ Exception -> 0x0113 }
                    if (r5 != 0) goto L_0x02d4
                L_0x0250:
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r5 = r5.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r9 = "callforward"
                    r10 = 2
                    java.lang.String r10 = java.lang.String.valueOf(r10)     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = r5.obtainMessage(r9, r10)     // Catch:{ Exception -> 0x0113 }
                    boolean r5 = r5.equals(r0)     // Catch:{ Exception -> 0x0113 }
                    if (r5 != 0) goto L_0x02d4
                    com.pccw.mobile.sip.service.MobileSipService r5 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    android.content.Context r9 = r3     // Catch:{ Exception -> 0x0113 }
                    r5.alertLoginError(r9, r0)     // Catch:{ Exception -> 0x0113 }
                    r0 = r6
                    goto L_0x00e4
                L_0x026f:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "callforward"
                    java.lang.String r10 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r0 = r0.obtainMessage(r5, r10)     // Catch:{ Exception -> 0x0113 }
                    android.content.Context r5 = r3     // Catch:{ Exception -> 0x0113 }
                    boolean r5 = com.pccw.mobile.util.ErrorMsgUtil.shouldShowOverseaXmlErrorMsg(r0, r5)     // Catch:{ Exception -> 0x0113 }
                    if (r5 == 0) goto L_0x0238
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    com.pccw.mobile.sip.ServerMessageController r0 = r0.messageController     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r5 = "callforward_oversea"
                    java.lang.String r10 = r9.resultCode     // Catch:{ Exception -> 0x0113 }
                    java.lang.String r0 = r0.obtainMessage(r5, r10)     // Catch:{ Exception -> 0x0113 }
                    goto L_0x0238
                L_0x0290:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this     // Catch:{ Exception -> 0x0113 }
                    r5 = 1
                    int unused = r0.callForwardingState = r5     // Catch:{ Exception -> 0x0113 }
                    r0 = r6
                    goto L_0x00e4
                L_0x0299:
                    int r0 = r6 + 1
                    r7 = r3
                    goto L_0x00e4
                L_0x029e:
                    if (r7 == 0) goto L_0x02bb
                    com.pccw.mobile.sip.service.MobileSipService r1 = com.pccw.mobile.sip.service.MobileSipService.this
                    boolean r0 = r2
                    if (r0 == 0) goto L_0x02bc
                    r0 = r2
                L_0x02a7:
                    int unused = r1.callForwardingState = r0
                    boolean r0 = r2
                    if (r0 == 0) goto L_0x02bb
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this
                    boolean r0 = r0.shouldRelogin
                    if (r0 == 0) goto L_0x02be
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this
                    android.content.Context r1 = r3
                    r0.startReLogin(r1)
                L_0x02bb:
                    return
                L_0x02bc:
                    r0 = r3
                    goto L_0x02a7
                L_0x02be:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this
                    boolean r0 = r0.shouldAutologin
                    if (r0 == 0) goto L_0x02cc
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this
                    android.content.Context r1 = r3
                    r0.startAutoLogin(r1)
                    goto L_0x02bb
                L_0x02cc:
                    com.pccw.mobile.sip.service.MobileSipService r0 = com.pccw.mobile.sip.service.MobileSipService.this
                    android.content.Context r1 = r3
                    r0.close(r1)
                    goto L_0x02bb
                L_0x02d4:
                    r0 = r6
                    goto L_0x00e4
                L_0x02d7:
                    r0 = r4
                    goto L_0x0238
                L_0x02da:
                    r0 = r4
                    goto L_0x016e
                L_0x02dd:
                    r5 = r0
                    goto L_0x013d
                L_0x02e0:
                    r6 = r0
                    goto L_0x0011
                L_0x02e3:
                    r7 = r8
                    r0 = r4
                    goto L_0x007a
                */
                throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.sip.service.MobileSipService.AnonymousClass4.run():void");
            }
        }.start();
    }

    public boolean addCall(String str, Context context) {
        String str2 = null;
        String mapPhoneNumber = NumberMappingUtil.mapPhoneNumber(str, context);
        if (mapPhoneNumber != null) {
            str2 = getDisplayNumber(str);
            str = mapPhoneNumber;
        }
        String convertToPrefixHandledSipNumber = getInstance().convertToPrefixHandledSipNumber(str.replaceAll("-", ""), context);
        if (this.originalNumber == null) {
            this.originalNumber = new HashMap<>();
        }
        if (this.getCalleeoriginalNumber == null) {
            this.getCalleeoriginalNumber = new HashMap<>();
        }
        this.originalNumber.put(convertToPrefixHandledSipNumber, str2);
        this.getCalleeoriginalNumber.put(convertToPrefixHandledSipNumber, str);
        return newOutgoingCall(convertToPrefixHandledSipNumber, context, false);
    }

    public boolean call(String str, Context context, boolean z) {
        String str2;
        String str3 = null;
        if (this.originalNumber == null) {
            this.originalNumber = new HashMap<>();
        } else {
            this.originalNumber.clear();
        }
        if (this.getCalleeoriginalNumber == null) {
            this.getCalleeoriginalNumber = new HashMap<>();
        } else {
            this.getCalleeoriginalNumber.clear();
        }
        String mapPhoneNumber = NumberMappingUtil.mapPhoneNumber(str, context);
        if (mapPhoneNumber != null) {
            str3 = getDisplayNumber(str);
            str = mapPhoneNumber;
        }
        if (!z || (!"999".equals(str) && !"112".equals(str))) {
            if (shouldGetCalleeState(str, context)) {
                String convertToPrefixHandledSipNumber = getInstance().convertToPrefixHandledSipNumber(str.replaceAll("-", ""), context);
                if (!convertToPrefixHandledSipNumber.equals(this.getCalleeoriginalNumber)) {
                    str2 = convertToPrefixHandledSipNumber;
                } else if (!z) {
                    this.originalNumber.put(convertToPrefixHandledSipNumber, str3);
                    this.getCalleeoriginalNumber.put(convertToPrefixHandledSipNumber, str);
                    return newOutgoingCall(convertToPrefixHandledSipNumber, context, z);
                } else {
                    DailPadActivity.shouldShowReinviteWithAudioDialog = true;
                    return false;
                }
            } else {
                str2 = str.replaceAll("-", "");
            }
            this.originalNumber.put(str2, str3);
            this.getCalleeoriginalNumber.put(str2, str);
            return newOutgoingCall(str2, context, z);
        }
        DailPadActivity.shouldShowReinviteWithAudioDialog = true;
        return false;
    }

    public void changeToAutoLoginSession() {
        if (this.loginStatus == 0) {
            this.shouldAutologin = true;
            this.shouldRelogin = false;
        }
    }

    public void close(final Context context) {
        this.shouldRelogin = false;
        this.shouldAutologin = false;
        getBackendHandler().post(new Runnable() {
            public void run() {
                if (!MobileSipService.this.isDisconnecting) {
                    boolean unused = MobileSipService.this.isDisconnecting = true;
                    try {
                        MobileSipService.this.alertLoginDisconnecting(context);
                        LinphoneService.cancelNotification(context, 1);
                        if (MobileSipService.this.isSuccess) {
                            Uri defaultUri = RingtoneManager.getDefaultUri(2);
                            MediaPlayer mediaPlayer = new MediaPlayer();
                            Context applicationContext = context.getApplicationContext();
                            try {
                                mediaPlayer.setDataSource(applicationContext, defaultUri);
                                if (((AudioManager) applicationContext.getSystemService(Context.AUDIO_SERVICE)).getStreamVolume(2) != 0) {
                                    mediaPlayer.setAudioStreamType(2);
                                    mediaPlayer.setLooping(false);
                                    mediaPlayer.prepare();
                                    mediaPlayer.start();
                                }
                            } catch (Exception e) {
                            }
                            Toast.makeText(applicationContext, applicationContext.getString(R.string.disconnected), Toast.LENGTH_LONG).show();
                        }
                        DailPadActivity.on(context, false);
                        if (MobileSipService.this.callForwardingState == 0) {
                            MobileSipService.this.activateCallForward(false, context);
                        }
                        if (MobileSipService.this.loginStatus == 0 && MobileSipService.this.isFirstSipRegisterSuccessHanled) {
                            try {
                                MobileSipService.this.stopHeartbeat(context);
                                MobileSipService.this.stopReLogin(context);
                                while (LinphoneService.isready() && LinphoneService.getLc().isIncall()) {
                                    LinphoneCall currentCall = LinphoneService.getLc().getCurrentCall();
                                    if (currentCall != null) {
                                        LinphoneService.getLc().terminateCall(currentCall);
                                    }
                                    try {
                                        Thread.sleep(200);
                                    } catch (InterruptedException e2) {
                                        e2.printStackTrace();
                                    }
                                }
                            } catch (Exception e3) {
                            }
                            if (LinphoneService.isready()) {
                                LinphoneService.getLc().clearAuthInfos();
                                LinphoneService.getLc().clearProxyConfigs();
                            }
                        }
                        MobileSipService.getInstance().resetLoginStatus(context);
                        MobileSipService.getInstance().resetLoginRetryCount();
                        String unused2 = MobileSipService.this.currentCodec = null;
                        MobileSipService.this.isFirstAlertOfCONNECTIVITY_ACTION = true;
                        boolean unused3 = MobileSipService.this.isLoginRunning = false;
                        boolean unused4 = MobileSipService.this.isReLoginRunning = false;
                        boolean unused5 = MobileSipService.this.isAutoLoginRunning = false;
                        MobileSipService.this.shouldRelogin = false;
                        MobileSipService.this.stopEngine(context);
                        if (MobileSipService.wifiLock != null && MobileSipService.wifiLock.isHeld()) {
                            MobileSipService.wifiLock.release();
                        }
                        if (MobileSipService.wakeLock != null && MobileSipService.wakeLock.isHeld()) {
                            MobileSipService.wakeLock.release();
                        }
                        if (MobileSipService.brightWakeLock != null && MobileSipService.brightWakeLock.isHeld()) {
                            MobileSipService.brightWakeLock.release();
                        }
                    } catch (Exception e4) {
                    }
                    MobileSipService.this.alertLoginDisconnected(context);
                    boolean unused6 = MobileSipService.this.isSuccess = false;
                    boolean unused7 = MobileSipService.this.isDisconnecting = false;
                }
            }
        });
    }

    public String convertToPrefixHandledSipNumber(String str, Context context) {
        return str.startsWith("1964") ? "1964" + getSipNumber(str.substring(4), context) : str.startsWith("19156") ? "19156" + getSipNumber(str.substring(5), context) : str.startsWith("133") ? "133" + getSipNumber(str.substring(3), context) : str.startsWith("1357") ? "1357" + getSipNumber(str.substring(4), context) : str.startsWith("+852") ? getSipNumber(str.substring(4), context) : getSipNumber(str, context);
    }

    public void doAutologin(Context context) {
        if (isNetworkAvailable(context)) {
            getInstance().httpsLogin(context, new Handler(Looper.getMainLooper()));
        } else if (!this.shouldAutologin || this.shouldRelogin) {
            close(context);
        } else {
            planAutologin(context);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x0043  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x008a  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void doHeartBeat(final android.content.Context r12) {
        /*
            r11 = this;
            r2 = 100
            r10 = 2
            r4 = 1
            r9 = 0
            r0 = 30000(0x7530, float:4.2039E-41)
            boolean r1 = org.linphone.LinphoneService.isready()
            if (r1 == 0) goto L_0x00a2
            int r1 = r11.loginStatus
            if (r1 != 0) goto L_0x00a2
            long r4 = java.lang.System.currentTimeMillis()
            boolean r1 = r11.isNetworkAvailable(r12)     // Catch:{ Exception -> 0x0074 }
            if (r1 == 0) goto L_0x0083
            boolean r1 = r11.isConnected()     // Catch:{ Exception -> 0x0074 }
            if (r1 == 0) goto L_0x0083
            java.lang.String r1 = "https://sip.pccwmobile.com/voip02/heartbeat.do"
            r6 = 2
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ Exception -> 0x0074 }
            r7 = 0
            java.lang.String r8 = "session_id"
            r6[r7] = r8     // Catch:{ Exception -> 0x0074 }
            r7 = 1
            java.lang.String r8 = r11.sessionId     // Catch:{ Exception -> 0x0074 }
            r6[r7] = r8     // Catch:{ Exception -> 0x0074 }
            java.lang.String r1 = com.pccw.mobile.sip.util.HttpUtils.post(r1, r6)     // Catch:{ Exception -> 0x0074 }
            java.lang.String r6 = "0"
            boolean r6 = r6.equals(r1)     // Catch:{ Exception -> 0x0074 }
            if (r6 == 0) goto L_0x0057
            r1 = 0
            heartBeatRetryCount = r1     // Catch:{ Exception -> 0x0074 }
        L_0x003f:
            int r1 = heartBeatRetryCount
            if (r1 <= r10) goto L_0x008a
            android.os.Handler r0 = new android.os.Handler
            android.os.Looper r1 = android.os.Looper.getMainLooper()
            r0.<init>(r1)
            com.pccw.mobile.sip.service.MobileSipService$6 r1 = new com.pccw.mobile.sip.service.MobileSipService$6
            r1.<init>(r12)
            r0.post(r1)
            heartBeatRetryCount = r9
        L_0x0056:
            return
        L_0x0057:
            java.lang.String r6 = "1"
            boolean r1 = r6.equals(r1)     // Catch:{ Exception -> 0x0074 }
            if (r1 == 0) goto L_0x007c
            android.os.Handler r1 = new android.os.Handler     // Catch:{ Exception -> 0x0074 }
            android.os.Looper r6 = android.os.Looper.getMainLooper()     // Catch:{ Exception -> 0x0074 }
            r1.<init>(r6)     // Catch:{ Exception -> 0x0074 }
            com.pccw.mobile.sip.service.MobileSipService$5 r6 = new com.pccw.mobile.sip.service.MobileSipService$5     // Catch:{ Exception -> 0x0074 }
            r6.<init>(r12)     // Catch:{ Exception -> 0x0074 }
            r1.post(r6)     // Catch:{ Exception -> 0x0074 }
            r1 = 0
            heartBeatRetryCount = r1     // Catch:{ Exception -> 0x0074 }
            goto L_0x0056
        L_0x0074:
            r1 = move-exception
            int r1 = heartBeatRetryCount
            int r1 = r1 + 1
            heartBeatRetryCount = r1
            goto L_0x003f
        L_0x007c:
            int r1 = heartBeatRetryCount     // Catch:{ Exception -> 0x0074 }
            int r1 = r1 + 1
            heartBeatRetryCount = r1     // Catch:{ Exception -> 0x0074 }
            goto L_0x003f
        L_0x0083:
            int r1 = heartBeatRetryCount     // Catch:{ Exception -> 0x0074 }
            int r1 = r1 + 1
            heartBeatRetryCount = r1     // Catch:{ Exception -> 0x0074 }
            goto L_0x003f
        L_0x008a:
            int r1 = heartBeatRetryCount
            if (r1 <= 0) goto L_0x0090
            r0 = 10000(0x2710, float:1.4013E-41)
        L_0x0090:
            long r6 = java.lang.System.currentTimeMillis()
            long r0 = (long) r0
            long r4 = r6 - r4
            long r0 = r0 - r4
            int r4 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r4 <= 0) goto L_0x00a0
        L_0x009c:
            r11.planHeartBeat(r12, r0)
            goto L_0x0056
        L_0x00a0:
            r0 = r2
            goto L_0x009c
        L_0x00a2:
            r11.resetLoginStatus(r12)
            org.linphone.LinphoneService.cancelNotification(r12, r4)
            goto L_0x0056
        */
        throw new UnsupportedOperationException("Method not decompiled: com.pccw.mobile.sip.service.MobileSipService.doHeartBeat(android.content.Context):void");
    }

    public void doRelogin(Context context) {
        if (isNetworkAvailable(context)) {
            getInstance().httpsLogin(context, new Handler(Looper.getMainLooper()));
        } else if (!this.shouldRelogin || this.shouldAutologin) {
            close(context);
        } else {
            planRelogin(context);
        }
    }

    public void enableDisableAudioCodec(Context context, int i, boolean z) {
        PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).edit().putBoolean(context.getString(i), z).commit();
    }

    public String fetchEncryptedIMSI(Context context) {
        return ClientStateManager.getEncryptedPccwImsi(context);
    }

    public String generateTopupURL(Context context) {
        if (!ClientStateManager.isRegisteredPrepaid(context)) {
            return null;
        }
        String md5Hash = StringUtilities.md5Hash(this.sessionId);
        String registeredNumber = ClientStateManager.getRegisteredNumber(context);
        String aesEncryptedByMasterKey = CryptoServices.aesEncryptedByMasterKey(md5Hash, ClientStateManager.getRegisteredPrepaidNumberPassword(context) + this.sessionId);
        return Constants.PREPAID_TOPUP_URL.replaceAll("MSISDN_VALUE", registeredNumber).replaceAll("R_VALUE", aesEncryptedByMasterKey) + "&" + context.getString(R.string.prepaid_topup_online_lang_parameter);
    }

    public Handler getBackendHandler() {
        Handler handler;
        synchronized (this) {
            if (this.backendHandler == null) {
                HandlerThread handlerThread = new HandlerThread("backendHandler_thread", 10);
                handlerThread.start();
                this.backendHandler = new Handler(handlerThread.getLooper());
            }
            handler = this.backendHandler;
        }
        return handler;
    }

    public int getCallForwardingState() {
        return this.callForwardingState;
    }

    public String getDisplayNumber(String str) {
        return str.startsWith("+852") ? str.substring(4) : str;
    }

    public boolean getIsInHK() {
        return this.isInHK;
    }

    public CallForwardResponse getLastCallForwardResponse() {
        return this.lastCallForwardResponse;
    }

    public GetCalleeStatusResponse getLastGetCalleeStatusResponse() {
        return this.lastGetCalleeStatusResponse;
    }

    public String getLoginErrorMsg(Context context) {
        if (StringUtils.isBlank(this.loginErrorMsg)) {
            switch (this.loginStatus) {
                case STATUS_LOGIN_NETWORK_ERROR /*-6*/:
                    this.loginErrorMsg = context.getResources().getString(R.string.network_error);
                    break;
                case STATUS_LOGIN_NO_AVAILABLE_NETWORK /*-5*/:
                    this.loginErrorMsg = context.getResources().getString(R.string.no_network);
                    break;
                case -4:
                    this.loginErrorMsg = context.getResources().getString(R.string.no_sim);
                    break;
                case -3:
                    this.loginErrorMsg = context.getResources().getString(R.string.server_error);
                    break;
            }
        }
        return context.getResources().getString(R.string.regfailed) + org.apache.commons.lang3.StringUtils.LF + this.loginErrorMsg;
    }

    public String getPhoneNumber(LinphoneCall linphoneCall) {
        return (isPhoneCallReady() && linphoneCall != null) ? (linphoneCall.getRemoteAddress() == null || !linphoneCall.getRemoteAddress().asString().contains(Constants.CONFERENCE_ROOM_CALLER_PREFIX)) ? linphoneCall.getDirection().equals(CallDirection.Incoming) ? linphoneCall.getRemoteAddress() != null ? linphoneCall.getRemoteAddress().getUserName() : CallerInfo.UNKNOWN_NUMBER : (this.originalNumber == null || linphoneCall.getRemoteAddress() == null || this.originalNumber.get(linphoneCall.getRemoteAddress().getUserName()) == null) ? (this.getCalleeoriginalNumber == null || linphoneCall.getRemoteAddress() == null || this.getCalleeoriginalNumber.get(linphoneCall.getRemoteAddress().getUserName()) == null) ? CallerInfo.UNKNOWN_NUMBER : this.getCalleeoriginalNumber.get(linphoneCall.getRemoteAddress().getUserName()) : this.originalNumber.get(linphoneCall.getRemoteAddress().getUserName()) : CallerInfo.CONFERENCE_NUMBER : CallerInfo.UNKNOWN_NUMBER;
    }

    public void handleSipRegisterFailed(Context context, String str) {
        if (!this.isDisconnecting) {
            if (this.sipRegistrationFailCount < 1) {
                this.sipRegistrationFailCount++;
            } else if (this.shouldRelogin) {
                startReLogin(context);
            } else if (this.shouldAutologin) {
                startAutoLogin(context);
            } else {
                close(context);
            }
            if ("no response timeout".equals(str)) {
            }
            if (LinphoneService.isready()) {
            }
        }
    }

    @SuppressLint("InvalidWakeLockTag")
    public void handleSipRegisterSuccess(Context context) {
        this.sipRegistrationFailCount = 0;
        if (!this.isFirstSipRegisterSuccessHanled && this.loginStatus == 0 && !this.isDisconnecting) {
            this.shouldRelogin = !this.shouldAutologin;
            if (this.shouldAutologin && !LinphoneActivity.isInstanced()) {
                Intent intent = new Intent(context, LinphoneActivity.class);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            }
            this.isAutoLoginRunning = false;
            activateCallForward(true, context);
            startHeartbeat(context);
            updateWifiSleepPolicyToNever(context);
            resetLoginRetryCount();
            this.isFirstSipRegisterSuccessHanled = true;
            if (wifiLock == null) {
                wifiLock = ((WifiManager) context.getSystemService(Context.WIFI_SERVICE)).createWifiLock("RoamSaveOn");
            }
            if (!wifiLock.isHeld()) {
                wifiLock.acquire();
            }
            if (wakeLock == null) {
                wakeLock = ((PowerManager) context.getSystemService(Context.POWER_SERVICE)).newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "RoamSaveOn");
            }
            if (!wakeLock.isHeld()) {
                wakeLock.acquire();
            }
            if (brightWakeLock == null) {
                brightWakeLock = ((PowerManager) context.getSystemService(Context.POWER_SERVICE)).newWakeLock(268435482, "RoamSaveFullWake");
            }
            if (!brightWakeLock.isHeld()) {
                brightWakeLock.acquire(10000);
            }
        }
    }

    public void httpsLogin(Context context, Handler handler) {
        synchronized (this) {
            if (!isNetworkAvailable(context)) {
                if (this.shouldRelogin) {
                    startReLogin(context);
                } else if (this.shouldAutologin) {
                    startAutoLogin(context);
                }
            } else if (!this.isLoginRunning) {
                this.isLoginRunning = true;
                this.backendHandler = getBackendHandler();
                this.backendHandler.post(new HttpsLoginTask(context, handler));
            }
        }
    }

    public boolean isAutoCodecSelection() {
        return true;
    }

    public boolean isAutoLoginRunning() {
        return this.isAutoLoginRunning;
    }

    public boolean isAutoStart(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getBoolean(PREF_AUTOSTART, false);
    }

    public boolean isConnected() {
        return this.isFirstSipRegisterSuccessHanled;
    }

    public boolean isDisconnecting() {
        return this.isDisconnecting;
    }

    public boolean isFirstRun(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getBoolean(PREF_FIRST_RUN, true);
    }

    public boolean isLoginRetryAble(Context context) {
        return this.loginStatus < 0;
    }

    public boolean isLoginRunning() {
        return this.isLoginRunning;
    }

    public boolean isLoginSuccress() {
        return this.loginStatus == 0;
    }

    public boolean isNeedPrepaidTopUpReminderCheck() {
        return this.needPrepaidTopUpReminderCheck;
    }

    public boolean isNetworkAvailable(Context context) {
        return isRoaming(context) && NetworkUtils.isWifiAvailable(context);
    }

    public boolean isPhoneCallReady() {
        return this.loginStatus == 0 && this.isFirstSipRegisterSuccessHanled && (this.callForwardingState == 0 || this.callForwardingState == 4) && !this.isDisconnecting;
    }

    public boolean isReLoginRunning() {
        return this.isReLoginRunning;
    }

    public boolean isRoaming(Context context) {
        return true;
    }

    public List<Codec> listAvailableCodecs(Context context) {
        if (!LinphoneService.isready()) {
            return null;
        }
        return LinphoneService.instance().listAvailableCodecs();
    }

    public boolean newOutgoingCall(String str, Context context, boolean z) {
        boolean z2 = false;
        synchronized (this) {
            String replace = str.contains(OutgoingCallReceiver.TAG) ? str.replace(OutgoingCallReceiver.TAG, "") : str;
            LinphoneCore linphoneCore = LinphoneService.instance().getLinphoneCore();
            if (linphoneCore.getCallsNb() > 1) {
                Toast.makeText(context, context.getString(R.string.warning_already_incall), Toast.LENGTH_LONG).show();
            } else {
                try {
                    CallManager.getInstance().inviteAddress(linphoneCore.interpretUrl(replace), z);
                    getInstance().openIncallScreen(context);
                    z2 = true;
                } catch (LinphoneCoreException e) {
                    Toast.makeText(context, context.getString(R.string.error_cannot_get_call_parameters), Toast.LENGTH_LONG).show();
                }
            }
        }
        return z2;
    }

    public void openIncallScreen(Context context) {
        Intent intent = new Intent();
        intent.setClass(context, InCallScreen.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK );
        context.startActivity(intent);
    }

    public void openIncallScreen(Context context, String str) {
        Intent intent = new Intent();
        intent.setClass(context, InCallScreen.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK );//268435456
        intent.putExtra("message", str);
        context.startActivity(intent);
    }

    public void openVideoCallScreen(Context context) {
        Intent intent = new Intent();
        intent.setClass(context, VideoCallActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK );
        context.startActivity(intent);
    }

    public void resetCallNumber() {
        this.originalNumber = null;
    }

    public void resetLoginRetryCount() {
        this.loginRetryCount = 0;
    }

    public void resetLoginStatus(Context context) {
        this.loginStatus = -100;
        this.isFirstSipRegisterSuccessHanled = false;
        this.currentRegisterCallId = null;
        this.loginErrorMsg = "";
        this.sipRegistrationFailCount = 0;
        heartBeatRetryCount = 0;
    }

    public void resetgetCalleeoriginalNumber() {
        this.getCalleeoriginalNumber = null;
    }

    public void setFirstRun(Context context, boolean z) {
        PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).edit().putBoolean(PREF_FIRST_RUN, z).commit();
    }

    public void setNeedPrepaidTopUpReminderCheck(boolean z) {
        this.needPrepaidTopUpReminderCheck = z;
    }

    public String shouldRestoreMapPhoneNumber(String str) {
        if (this.originalNumber == null || this.originalNumber.get(str) == null) {
            return null;
        }
        return this.originalNumber.get(str);
    }

    public String sipStatus(Context context) {
        String str;
        if (!LinphoneService.isready()) {
            return "Not login";
        }
        String string = PreferenceManager.getDefaultSharedPreferences(context).getString(context.getString(R.string.pref_tunnel_mode_key), context.getString(R.string.pref_tunnel_mode_production));
        StringBuilder append = new StringBuilder().append((((("Domain: " + LinphoneService.instance().lastUpdatedSipStatus.domain + org.apache.commons.lang3.StringUtils.LF) + "Identiy: " + LinphoneService.instance().lastUpdatedSipStatus.identity + org.apache.commons.lang3.StringUtils.LF) + "Proxy: " + LinphoneService.instance().lastUpdatedSipStatus.proxy + org.apache.commons.lang3.StringUtils.LF) + "Route: " + LinphoneService.instance().lastUpdatedSipStatus.route + org.apache.commons.lang3.StringUtils.LF) + "Registration state: " + LinphoneService.instance().lastUpdatedSipStatus.regState + org.apache.commons.lang3.StringUtils.LF).append("Tunnel is enabled/mode: ").append(LinphoneService.instance().tunnelingEnabled()).append("/").append(string);
        if (string.equals(context.getString(R.string.pref_tunnel_mode_production))) {
            str = "(" + (PreferenceManager.getDefaultSharedPreferences(context).getBoolean(context.getString(R.string.pref_tunnel_enabled_key), false) ? "on" : "off") + ")";
        } else {
            str = "";
        }
        return append.append(str).append(org.apache.commons.lang3.StringUtils.LF).toString() + "Codecs: " + this.currentCodec;
    }

    public String specialPhoneName(Context context, String str) {
        if (ClientStateManager.isCSL(context)) {
            if ("*988".equals(str)) {
                return context.getString(R.string.voice_mail);
            }
        } else if ("*988".equals(str) || "*90".equals(str) || "*92".equals(str)) {
            return context.getString(R.string.voice_mail);
        }
        return null;
    }

    public void startAutoLogin(Context context) {
        synchronized (this) {
            stopEngine(context);
            WifiManager wifiManager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
            if (!SSIDList.containsSSID(context, SSIDUtil.getCurrentSSID(context)) || !wifiManager.isWifiEnabled()) {
                stopAutoLogin(context);
            } else {
                this.isLoginRunning = false;
                this.isReLoginRunning = false;
                this.isAutoLoginRunning = true;
                resetLoginStatus(context);
                LinphoneService.cancelNotification(context, 1);
                Intent intent = new Intent();
                intent.setAction(Constants.INTENT_ALERT_AUTOLOGIN_PROCESSING);
                context.sendBroadcast(intent);
                planAutologin(context);
            }
        }
    }

    public boolean startCallChecking(String str, Context context) {
        if (str.length() == 0) {
            new AlertDialog.Builder(context).setMessage(R.string.empty).setTitle(R.string.app_name).setIcon(R.drawable.logo).setPositiveButton(android.R.string.ok, (DialogInterface.OnClickListener) null).setCancelable(true).show();
            return false;
        } else if (NumberMappingUtil.shouldBarPhoneNumber(str, context)) {
            Toast.makeText(context, context.getResources().getString(R.string.bar_phone_no), Toast.LENGTH_SHORT).show();
            return false;
        } else if (isPhoneCallReady() && LinphoneService.isready()) {
            return true;
        } else {
            new AlertDialog.Builder(context).setMessage(R.string.notfast).setTitle(R.string.app_name).setIcon(R.drawable.logo).setPositiveButton(android.R.string.ok, (DialogInterface.OnClickListener) null).setCancelable(true).show();
            return false;
        }
    }

    public void startHeartbeat(Context context) {
        synchronized (this) {
            planHeartBeat(context, 1000);
        }
    }

    public void startReLogin(Context context) {
        synchronized (this) {
            stopEngine(context);
            this.isLoginRunning = false;
            this.isAutoLoginRunning = false;
            this.isReLoginRunning = true;
            resetLoginStatus(context);
            LinphoneService.cancelNotification(context, 1);
            Intent intent = new Intent();
            intent.setAction(Constants.INTENT_ALERT_RELOGIN_PROCESSING);
            context.sendBroadcast(intent);
            planRelogin(context);
        }
    }

    public void updateWifiSleepPolicyToNever(Context context) {
        ContentResolver contentResolver = context.getContentResolver();
        this.lastWifiSleepPolicy = Settings.System.getInt(contentResolver, "wifi_sleep_policy", -1);
        Settings.System.putInt(contentResolver, "wifi_sleep_policy", 2);
    }

    public boolean useSoftvolume(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getBoolean(context.getString(R.string.pref_audio_soft_volume_key), false);
    }
}
