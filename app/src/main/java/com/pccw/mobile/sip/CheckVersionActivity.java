package com.pccw.mobile.sip;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.pccw.exception.NoNetworkException;
import com.pccw.mobile.server.response.CheckNumberTypeResponse;
import com.pccw.mobile.server.response.IMRegistrationResponse;
import com.pccw.mobile.server.xml.CheckNumberTypeXmlHandler;
import com.pccw.mobile.sip.ServerMessageController;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.mobile.sip.util.VersionUtils;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.ErrorMsgUtil;
import com.pccw.mobile.util.PermissionUtils;
import com.pccw.sms.service.GetMsisdnByImsiService;
import com.pccw.sms.service.listener.IGetMsisdnByImsiListener;
import java.io.IOException;
import java.io.StringReader;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import org.apache.commons.lang.StringUtils;
import org.linphone.LinphoneActivity;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

public class CheckVersionActivity extends BaseActivity {
    private static final String OS_TYPE = "android_default";
    private static final int PLAY_SERVICES_RESOLUTION_REQUEST = 9000;
    private static CheckVersionResponse lastSuccessfulCheckVersionResponse = null;
    IMRegistrationResponse imRegResponse = null;
    /* access modifiers changed from: private */
    public boolean isWaitingWifiFinish = false;
    /* access modifiers changed from: private */
    public MessageDownloader messageDownloader = null;
    String regid;
    private RetrieveVersionInfo retrieveVersionInfo = null;
    /* access modifiers changed from: private */
    public long splashScreenStartTime = 0;
    private SplashScreenTimerTask splashScreenTimerTask = null;
    private Thread waitingWifiThr;
    private WifiManager wifiManager;

    private class MessageDownloader extends AsyncTask<String, Void, Boolean> {
        private MessageDownloader() {
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(String... strArr) {
            if (strArr.length < 3) {
                return false;
            }
            return MobileSipService.getInstance().messageController.loadNewVersion(strArr[0], strArr[1], strArr[2]);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Boolean bool) {
            if (isCancelled()) {
                return;
            }
            if (bool == null || !bool.booleanValue()) {
                AlertDialog.Builder builder = new AlertDialog.Builder(CheckVersionActivity.this);
                builder.setIcon(R.drawable.ic_logo);
                builder.setTitle(2131165290);
                builder.setMessage(R.string.ask_wifi);
                builder.setNeutralButton(CheckVersionActivity.this.getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        CheckVersionActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                    }
                });
                AlertDialog create = builder.create();
                create.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    public void onDismiss(DialogInterface dialogInterface) {
                        if (!CheckVersionActivity.this.isFinishing()) {
                            CheckVersionActivity.this.finish();
                        }
                    }
                });
                create.show();
                return;
            }
            CheckVersionActivity.this.gotoNextActivity();
        }
    }

    private class RetrieveVersionInfo extends AsyncTask<Void, Void, CheckVersionResponse> {
        private static final int errorGetNum = 10;
        private static final int errorNoWifi = 0;
        private static final int errorPostpaidBrandInvalid = 8;
        private static final int errorSimExpired = 5;
        private static final int errorSimIdle = 4;
        private static final int errorSimNotAllowKKCSLPostpaid = 6;
        private static final int errorSimNotAllowKKCSLPrepaid = 7;
        private static final int errorSimNotAllowKKPrepaid = 3;
        private final String TAG;
        private CheckNumberTypeResponse checkNumberTypeResponse;
        private CheckNumberTypeXmlHandler checkNumberTypeXmlHandler;
        private int errorCodeGetNum;
        private int errorMessageType;

        private RetrieveVersionInfo() {
            this.TAG = RetrieveVersionInfo.class.getSimpleName();
            this.checkNumberTypeXmlHandler = new CheckNumberTypeXmlHandler();
        }

        private void CheckAndUpdateMessageVersion(CheckVersionResponse checkVersionResponse) {
            ServerMessageController.MessageListType messageListType;
            String str;
            String str2;
            if (checkVersionResponse.msg_version == null || checkVersionResponse.msg_url == null) {
                CheckVersionActivity.this.gotoNextActivity();
                return;
            }
            if (ClientStateManager.isCSLOne2freePostpaid(CheckVersionActivity.this.getApplicationContext())) {
                messageListType = ServerMessageController.MessageListType.TYPE_CSL_ONE2FREE;
                str = checkVersionResponse.msg_version_one2free;
                str2 = checkVersionResponse.msg_url_one2free;
            } else if (ClientStateManager.isCSL1010Postpaid(CheckVersionActivity.this.getApplicationContext())) {
                messageListType = ServerMessageController.MessageListType.TYPE_CSL_1010;
                str = checkVersionResponse.msg_version_1010;
                str2 = checkVersionResponse.msg_url_1010;
            } else if (ClientStateManager.isCSLPrepaid(CheckVersionActivity.this.getApplicationContext())) {
                messageListType = ServerMessageController.MessageListType.TYPE_CSL_PREPAID;
                str = checkVersionResponse.msg_version_csl_prepaid;
                str2 = checkVersionResponse.msg_url_csl_prepaid;
            } else if (ClientStateManager.isHKT(CheckVersionActivity.this.getApplicationContext())) {
                messageListType = ServerMessageController.MessageListType.TYPE_PCCW;
                str = checkVersionResponse.msg_version;
                str2 = checkVersionResponse.msg_url;
            } else {
                CheckVersionActivity.this.gotoNextActivity();
                return;
            }
            if (MobileSipService.getInstance().messageController.needUpdateErrorMessageList(str, messageListType)) {
                MessageDownloader unused = CheckVersionActivity.this.messageDownloader = new MessageDownloader();
                CheckVersionActivity.this.messageDownloader.execute(new String[]{str2, str, messageListType.toString()});
                return;
            }
            CheckVersionActivity.this.gotoNextActivity();
        }

        private void apiResponseXmlHandler(String str) {
            try {
                XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
                xMLReader.setContentHandler(this.checkNumberTypeXmlHandler);
                xMLReader.parse(new InputSource(new StringReader(str)));
            } catch (IOException | ParserConfigurationException | SAXException e) {
                e.printStackTrace();
            }
        }

        /* access modifiers changed from: private */
        public void checkNewTAndCVersion(CheckVersionResponse checkVersionResponse) {
            int i = TAndCActivity.T_AND_C_NEW_VERSION_NOT_AVAILABLE;
            TAndCActivity.checkTAndCVersion(checkVersionResponse, CheckVersionActivity.this);
            CheckAndUpdateMessageVersion(checkVersionResponse);
        }

        private CheckNumberTypeResponse checkNumberType(String str, String str2) {
            boolean z;
            String str3 = null;
            if (MobileSipService.getInstance().isNetworkAvailable(CheckVersionActivity.this)) {
                boolean z2 = true;
                int i = 0;
                str3 = null;
                while (i < 2 && z2) {
                    Log.d(this.TAG, "postToServer: ");
                    try {
                        if (str2.length() == 0) {
                            str3 = HttpUtils.post(Constants.GET_NUMBER_TYPE_URL, "imsi", str, "encrypted", "1");
                        } else {
                            String[] strArr = new String[8];
                            strArr[0] = "000";
                            strArr[1] = "001";
                            strArr[2] = "010";
                            strArr[3] = "011";
                            strArr[4] = "100";
                            strArr[5] = "101";
                            strArr[6] = "110";
                            strArr[7] = "111";
                            int length = strArr.length;
                            int i2 = 0;
                            while (true) {
                                if (i2 >= length) {
                                    z = false;
                                    break;
                                } else if (strArr[i2].equals(str2)) {
                                    z = true;
                                    break;
                                } else {
                                    i2++;
                                }
                            }
                            if (z) {
                                str3 = HttpUtils.post("http://202.4.201.24/voip/test/2Nprepaid/2Nprepaid" + str2 + ".xml", new Object[0]);
                            } else {
                                str3 = HttpUtils.post(Constants.GET_NUMBER_TYPE_URL, "msisdn", str2);
                            }
                        }
                        z2 = false;
                    } catch (Exception e) {
                        i++;
                    }
                }
            }
            if (!TextUtils.isEmpty(str3)) {
                apiResponseXmlHandler(str3);
            }
            return (CheckNumberTypeResponse) this.checkNumberTypeXmlHandler.getResponse();
        }

        /* access modifiers changed from: protected */
        public CheckVersionResponse doInBackground(Void... voidArr) {
            if (MobileSipService.getInstance().isNetworkAvailable(CheckVersionActivity.this)) {
                if (!ClientStateManager.isRegisteredPrepaid(CheckVersionActivity.this)) {
                    if (ClientStateManager.checkSimState(CheckVersionActivity.this, true) == 1) {
                        ClientStateManager.updatePrefForSimChange(CheckVersionActivity.this);
                        if (MobileSipService.getInstance().loginStatus == 0) {
                            MobileSipService.getInstance().close(CheckVersionActivity.this);
                        }
                    }
                    if (ClientStateManager.isOperatorPccw(CheckVersionActivity.this) || ClientStateManager.isOperatorCSL(CheckVersionActivity.this)) {
                        String encryptedPccwImsi = ClientStateManager.getEncryptedPccwImsi(CheckVersionActivity.this);
                        if (encryptedPccwImsi == null || encryptedPccwImsi.length() == 0) {
                            return null;
                        }
                        this.checkNumberTypeResponse = checkNumberType(encryptedPccwImsi, "");
                        Log.v("APITT", "check CheckNumberTypeResponse");
                        if (this.checkNumberTypeResponse == null) {
                            this.errorMessageType = 10;
                            this.errorCodeGetNum = 99;
                            return null;
                        } else if (this.checkNumberTypeResponse.simType.equalsIgnoreCase(Constants.GET_NUMBER_INFO_SIMTYPE_POSTPAID)) {
                            if (this.checkNumberTypeResponse.operator.equalsIgnoreCase(Constants.GET_NUMBER_INFO_OPERATOR_PCCW)) {
                                ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 2);
                            } else if (this.checkNumberTypeResponse.allowkk.equalsIgnoreCase("false")) {
                                this.errorMessageType = 6;
                                return null;
                            } else if (this.checkNumberTypeResponse.brand.equalsIgnoreCase(Constants.GET_NUMBER_INFO_BRAND_ONE2FREE)) {
                                ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 5);
                            } else if (this.checkNumberTypeResponse.brand.equalsIgnoreCase(Constants.GET_NUMBER_INFO_BRAND_1010)) {
                                ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 6);
                            } else {
                                this.errorMessageType = 8;
                                return null;
                            }
                        } else if (!this.checkNumberTypeResponse.simType.equalsIgnoreCase(Constants.GET_NUMBER_INFO_SIMTYPE_PREPAID)) {
                            this.errorMessageType = 10;
                            if (TextUtils.isEmpty(this.checkNumberTypeResponse.resultcode)) {
                                this.errorCodeGetNum = 99;
                                return null;
                            }
                            this.errorCodeGetNum = Integer.parseInt(this.checkNumberTypeResponse.resultcode);
                            return null;
                        } else if (!this.checkNumberTypeResponse.allowRS.equalsIgnoreCase("true")) {
                            this.errorMessageType = 3;
                            return null;
                        } else if (!this.checkNumberTypeResponse.status.equalsIgnoreCase("active")) {
                            if (this.checkNumberTypeResponse.status.equalsIgnoreCase(Constants.GET_NUMBER_INFO_STATUS_IDLE)) {
                                this.errorMessageType = 4;
                                return null;
                            }
                            this.errorMessageType = 5;
                            return null;
                        } else if (this.checkNumberTypeResponse.simClass.equalsIgnoreCase(Constants.GET_NUMBER_INFO_CLASS_HELLO_PREPAID)) {
                            ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 4);
                        } else if (this.checkNumberTypeResponse.simClass.equalsIgnoreCase(Constants.GET_NUMBER_INFO_CLASS_NORMAL_PREPAID)) {
                            ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 3);
                        } else if (this.checkNumberTypeResponse.simClass.equalsIgnoreCase("csl")) {
                            ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 7);
                        } else {
                            ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 99);
                        }
                    } else if (ClientStateManager.isSecondOperatorSim(CheckVersionActivity.this)) {
                        ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 99);
                    } else {
                        ClientStateManager.setPostpaidPrepaidMode(CheckVersionActivity.this, 99);
                    }
                }
                CheckVersionResponse access$300 = CheckVersionActivity.callCheckVersionApi(Constants.FORCE_CHECK_VERSION_TIME, CheckVersionActivity.this);
                if (access$300 != null) {
                    return access$300;
                }
                this.errorMessageType = 10;
                this.errorCodeGetNum = 99;
                return null;
            }
            this.errorMessageType = 0;
            return null;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(final CheckVersionResponse checkVersionResponse) {
            if (isCancelled()) {
                return;
            }
            if (checkVersionResponse != null && checkVersionResponse.resultcode.equals("0")) {
                String str = "0.0.0";
                try {
                    str = CheckVersionActivity.this.getPackageManager().getPackageInfo(CheckVersionActivity.this.getPackageName(), 0).versionName;
                } catch (Exception e) {
                }
                String str2 = checkVersionResponse.app_version;
                if (str2 == null) {
                    str2 = str;
                }
                if (VersionUtils.isNewerMajorVersion(str, str2)) {
                    new AlertDialog.Builder(CheckVersionActivity.this).setIcon(17301543).setTitle(R.string.new_version_alert_title).setMessage(R.string.new_version_alert).setCancelable(false).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            if (MobileSipService.getInstance().loginStatus == 0) {
                                MobileSipService.getInstance().close(CheckVersionActivity.this);
                            }
                            CheckVersionActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(checkVersionResponse.app_link)));
                            dialogInterface.dismiss();
                            CheckVersionActivity.this.finish();
                        }
                    }).setNegativeButton(R.string.no, new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            if (MobileSipService.getInstance().loginStatus == 0) {
                                MobileSipService.getInstance().close(CheckVersionActivity.this);
                            }
                            dialogInterface.dismiss();
                            CheckVersionActivity.this.finish();
                        }
                    }).show();
                } else if (VersionUtils.isNewerMinorVersion(str, str2)) {
                    new AlertDialog.Builder(CheckVersionActivity.this).setIcon(17301543).setTitle(R.string.new_version_alert_title).setMessage(R.string.new_version_alert).setCancelable(true).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            if (MobileSipService.getInstance().loginStatus == 0) {
                                MobileSipService.getInstance().close(CheckVersionActivity.this);
                            }
                            CheckVersionActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(checkVersionResponse.app_link)));
                            dialogInterface.dismiss();
                            CheckVersionActivity.this.finish();
                        }
                    }).setNegativeButton(R.string.no, new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            dialogInterface.dismiss();
                            RetrieveVersionInfo.this.checkNewTAndCVersion(checkVersionResponse);
                        }
                    }).show();
                } else {
                    checkNewTAndCVersion(checkVersionResponse);
                }
            } else if (checkVersionResponse != null) {
                String localErrorMsg = ErrorMsgUtil.getLocalErrorMsg("check_version_error_", checkVersionResponse.resultcode, CheckVersionActivity.this.getApplicationContext());
                AlertDialog.Builder builder = new AlertDialog.Builder(CheckVersionActivity.this);
                builder.setTitle(CheckVersionActivity.this.getString(2131165290));
                builder.setIcon(R.drawable.ic_logo);
                builder.setMessage(localErrorMsg);
                builder.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                AlertDialog create = builder.create();
                create.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    public void onDismiss(DialogInterface dialogInterface) {
                        if (!CheckVersionActivity.this.isFinishing()) {
                            CheckVersionActivity.this.finish();
                        }
                    }
                });
                create.show();
            } else {
                AlertDialog.Builder builder2 = new AlertDialog.Builder(CheckVersionActivity.this);
                builder2.setTitle(CheckVersionActivity.this.getString(2131165290));
                builder2.setIcon(R.drawable.ic_logo);
                switch (this.errorMessageType) {
                    case 3:
                        builder2.setMessage(R.string.get_number_info_not_allow_RS);
                        builder2.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                        break;
                    case 4:
                        builder2.setMessage(R.string.get_number_info_prepaid_card_not_active);
                        builder2.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                        break;
                    case 5:
                        builder2.setMessage(R.string.get_number_info_prepaid_card_expired);
                        builder2.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                        break;
                    case 6:
                        builder2.setMessage(ErrorMsgUtil.getLocalErrorMsg("get_number_info_not_allow_csl_postpaid", "", CheckVersionActivity.this.getApplicationContext()));
                        builder2.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                        break;
                    case 7:
                        builder2.setMessage(ErrorMsgUtil.getLocalErrorMsg("get_number_info_not_allow_csl_prepaid", "", CheckVersionActivity.this.getApplicationContext()));
                        builder2.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                        break;
                    case 8:
                        builder2.setMessage(ErrorMsgUtil.getLocalErrorMsg("get_number_info_brand_invalid", "", CheckVersionActivity.this.getApplicationContext()));
                        builder2.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                        break;
                    case 10:
                        builder2.setMessage(ErrorMsgUtil.getLocalErrorMsg("get_number_info_error_", Integer.toString(this.errorCodeGetNum), CheckVersionActivity.this.getApplicationContext()));
                        builder2.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                        break;
                    default:
                        builder2.setMessage(R.string.check_wifi);
                        builder2.setNeutralButton(CheckVersionActivity.this.getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                            public void onClick(DialogInterface dialogInterface, int i) {
                                CheckVersionActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                            }
                        });
                        break;
                }
                AlertDialog create2 = builder2.create();
                create2.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    public void onDismiss(DialogInterface dialogInterface) {
                        if (!CheckVersionActivity.this.isFinishing()) {
                            CheckVersionActivity.this.finish();
                        }
                    }
                });
                create2.show();
            }
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            super.onPreExecute();
        }
    }

    private class SplashScreenTimerTask extends AsyncTask<Void, Void, Void> {
        private SplashScreenTimerTask() {
        }

        /* access modifiers changed from: protected */
        public Void doInBackground(Void... voidArr) {
            long elapsedRealtime = SystemClock.elapsedRealtime();
            long access$900 = CheckVersionActivity.this.splashScreenStartTime;
            while (true) {
                long j = elapsedRealtime - access$900;
                if (j >= 1000) {
                    return null;
                }
                try {
                    Thread.sleep(1000 - j);
                } catch (Exception e) {
                }
                elapsedRealtime = SystemClock.elapsedRealtime();
                access$900 = CheckVersionActivity.this.splashScreenStartTime;
            }
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Void voidR) {
            if (!isCancelled() && !CheckVersionActivity.this.isFinishing()) {
                CheckVersionActivity.this.gotoNextActivityTask();
            }
        }
    }

    /* access modifiers changed from: private */
    public static CheckVersionResponse callCheckVersionApi(long j, Context context) {
        boolean z = true;
        if (lastSuccessfulCheckVersionResponse != null && SystemClock.elapsedRealtime() - lastSuccessfulCheckVersionResponse.timestamp < j) {
            return lastSuccessfulCheckVersionResponse;
        }
        int i = 0;
        while (i < 2 && z && MobileSipService.getInstance().isNetworkAvailable(context)) {
            try {
                String post = HttpUtils.post(Constants.CHECK_VERSION_URL, "os", OS_TYPE);
                XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
                CheckVersionXmlHandler checkVersionXmlHandler = new CheckVersionXmlHandler();
                xMLReader.setContentHandler(checkVersionXmlHandler);
                xMLReader.parse(new InputSource(new StringReader(post)));
                CheckVersionResponse checkVersionResponse = checkVersionXmlHandler.res;
                try {
                    checkVersionResponse.timestamp = SystemClock.elapsedRealtime();
                    if (!"0".equals(checkVersionResponse.resultcode) || !StringUtils.isNotBlank(checkVersionResponse.app_version)) {
                        return checkVersionResponse;
                    }
                    lastSuccessfulCheckVersionResponse = checkVersionResponse;
                    return checkVersionResponse;
                } catch (Exception e) {
                    z = false;
                    i++;
                }
            } catch (Exception e2) {
                i++;
            }
        }
        return null;
    }

    public static boolean canSkipCheckVersion(Context context) {
        String str = null;
        try {
            str = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Exception e) {
        }
        if (lastSuccessfulCheckVersionResponse == null) {
            return false;
        }
        return (MobileSipService.getInstance().messageController.lastMessageDownloadSuccess() || !ClientStateManager.isClientStateRegistered(context)) && !(((SystemClock.elapsedRealtime() - lastSuccessfulCheckVersionResponse.timestamp) > Constants.FORCE_CHECK_VERSION_TIME ? 1 : ((SystemClock.elapsedRealtime() - lastSuccessfulCheckVersionResponse.timestamp) == Constants.FORCE_CHECK_VERSION_TIME ? 0 : -1)) > 0) && !VersionUtils.isNewerMajorVersion(str, lastSuccessfulCheckVersionResponse.app_version) && !(ClientStateManager.checkSimState(context, false) == 1);
    }

    private void checkBattery() {
        if (Build.VERSION.SDK_INT >= 23 && !((PowerManager) getSystemService("power")).isIgnoringBatteryOptimizations(getPackageName())) {
            Intent intent = new Intent();
            intent.setAction("android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS");
            intent.setData(Uri.parse("package:" + getPackageName()));
            startActivity(intent);
        }
    }

    private static boolean checkPlayServices(Context context) {
        return GooglePlayServicesUtil.isGooglePlayServicesAvailable(context) == 0;
    }

    public static void clearLastSuccessfulCheckResponse() {
        lastSuccessfulCheckVersionResponse = null;
    }

    /* access modifiers changed from: private */
    public void contResume() {
        if (!canSkipCheckVersion(this) || lastSuccessfulCheckVersionResponse == null) {
            this.splashScreenStartTime = SystemClock.elapsedRealtime();
            if (!MobileSipService.getInstance().isNetworkAvailable(this)) {
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle(getString(2131165290));
                builder.setIcon(R.drawable.ic_logo);
                builder.setMessage(getString(R.string.ask_wifi));
                builder.setNeutralButton(getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        CheckVersionActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                    }
                });
                AlertDialog create = builder.create();
                create.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    public void onDismiss(DialogInterface dialogInterface) {
                        CheckVersionActivity.this.finish();
                    }
                });
                create.show();
                return;
            }
            this.retrieveVersionInfo = new RetrieveVersionInfo();
            this.retrieveVersionInfo.execute(new Void[0]);
            return;
        }
        gotoNextActivity();
        this.splashScreenStartTime = SystemClock.elapsedRealtime() - 1000;
    }

    private void getDnFromServerAndStroeToPreference() {
        try {
            new GetMsisdnByImsiService(new IGetMsisdnByImsiListener() {
                public void onCallFail() {
                    CheckVersionActivity.this.runOnUiThread(new Runnable() {
                        public void run() {
                            Toast.makeText(CheckVersionActivity.this.getApplicationContext(), "Get MSISDN fail", 1).show();
                        }
                    });
                }

                public void onCallSuccess(final String str) {
                    CheckVersionActivity.this.runOnUiThread(new Runnable() {
                        public void run() {
                            Toast.makeText(CheckVersionActivity.this.getApplicationContext(), "Get MSISDN success:" + str, 1).show();
                        }
                    });
                }
            }, getApplicationContext()).callApiAndStoreDnToPreference(ClientStateManager.getEncryptedPccwImsi(getApplicationContext()));
        } catch (NoNetworkException e) {
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: private */
    public void gotoNextActivity() {
        if (this.splashScreenTimerTask != null && !this.splashScreenTimerTask.isCancelled()) {
            this.splashScreenTimerTask.cancel(false);
        }
        if (!isFinishing()) {
            this.splashScreenTimerTask = new SplashScreenTimerTask();
            this.splashScreenTimerTask.execute(new Void[0]);
        }
    }

    /* access modifiers changed from: private */
    public void gotoNextActivityTask() {
        if (ClientStateManager.checkSimState(getApplicationContext(), false) != 0 && MobileSipService.getInstance().loginStatus == 0) {
            MobileSipService.getInstance().close(this);
        }
        if (ClientStateManager.checkPostpaidPrepaidMode(this) == 99 && !ClientStateManager.isRegisteredPrepaid(this)) {
            startActivity(new Intent(getApplicationContext(), EnhancedPrepaidRegistrationActivity.class));
        } else if (ClientStateManager.checkPostpaidPrepaidMode(this) == 3 && !ClientStateManager.isRegisteredPrepaid(this)) {
            if (ClientStateManager.isGoingToResetPrepaidAccount(getApplicationContext())) {
                ClientStateManager.setIsGoingToResetPrepaidAccount(getApplicationContext(), false);
            }
            startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
        } else if (ClientStateManager.checkPostpaidPrepaidMode(this) == 4 && !ClientStateManager.isRegisteredPrepaid(this)) {
            if (ClientStateManager.isGoingToResetPrepaidAccount(getApplicationContext())) {
                ClientStateManager.setIsGoingToResetPrepaidAccount(getApplicationContext(), false);
            }
            startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
        } else if (ClientStateManager.checkPostpaidPrepaidMode(this) == 7 && !ClientStateManager.isRegisteredPrepaid(this)) {
            if (ClientStateManager.isGoingToResetPrepaidAccount(getApplicationContext())) {
                ClientStateManager.setIsGoingToResetPrepaidAccount(getApplicationContext(), false);
            }
            startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
        } else if (ClientStateManager.isHKTPostpaid(getApplicationContext()) && !TAndCActivity.isHKTPostpaidTAndCRead(getApplicationContext())) {
            startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
        } else if (ClientStateManager.isCSLPostpaid(getApplicationContext()) && !TAndCActivity.isCSLPostpaidTAndCRead(getApplicationContext())) {
            startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
        } else if (ClientStateManager.isHKTPrepaid(getApplicationContext()) && !TAndCActivity.isHKTPrepaidTAndCRead(getApplicationContext())) {
            startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
        } else if (!ClientStateManager.isCSLPrepaid(getApplicationContext()) || TAndCActivity.isCSLPrepaidTAndCRead(getApplicationContext())) {
            startActivity(new Intent(getApplicationContext(), LinphoneActivity.class));
        } else {
            startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
        }
        if (!isFinishing()) {
            finish();
        }
    }

    private void showCannotGetMsisdnAndQuitAppDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(getString(2131165290));
        builder.setIcon(R.drawable.ic_logo);
        builder.setMessage("Cannot get nubmer");
        builder.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
        AlertDialog create = builder.create();
        create.setOnDismissListener(new DialogInterface.OnDismissListener() {
            public void onDismiss(DialogInterface dialogInterface) {
                if (!CheckVersionActivity.this.isFinishing()) {
                    CheckVersionActivity.this.finish();
                }
            }
        });
        create.show();
    }

    private void showNoWifiAndQuitAppDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(getString(2131165290));
        builder.setIcon(R.drawable.ic_logo);
        builder.setMessage(getString(R.string.ask_wifi));
        builder.setNeutralButton(getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                CheckVersionActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
            }
        });
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (Build.VERSION.SDK_INT >= 23) {
            PermissionUtils.checkAndRequestMorePermissions(this, new String[]{"android.permission.READ_CONTACTS", "android.permission.WRITE_CONTACTS", "android.permission.CAMERA", "android.permission.RECORD_AUDIO", "android.permission.ACCESS_FINE_LOCATION", "android.permission.ACCESS_COARSE_LOCATION", "android.permission.WRITE_EXTERNAL_STORAGE", "android.permission.READ_PHONE_STATE"}, 1000);
        }
        if (MobileSipService.getInstance().messageController == null) {
            MobileSipService.getInstance().messageController = new ServerMessageController(this);
        }
        checkBattery();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        this.isWaitingWifiFinish = true;
        if (this.waitingWifiThr != null) {
            this.waitingWifiThr.interrupt();
            this.waitingWifiThr = null;
        }
        super.onDestroy();
    }

    public void onPause() {
        super.onPause();
        if (this.retrieveVersionInfo != null && !this.retrieveVersionInfo.isCancelled()) {
            this.retrieveVersionInfo.cancel(false);
        }
        if (this.messageDownloader != null && !this.messageDownloader.isCancelled()) {
            this.messageDownloader.cancel(false);
        }
        if (this.splashScreenTimerTask != null && !this.splashScreenTimerTask.isCancelled()) {
            this.splashScreenTimerTask.cancel(false);
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        setContentView(R.layout.splash_screen);
        this.wifiManager = (WifiManager) getApplicationContext().getSystemService("wifi");
        if (!this.wifiManager.isWifiEnabled()) {
            this.wifiManager.setWifiEnabled(true);
            this.waitingWifiThr = new Thread(new Runnable() {
                public void run() {
                    int i = 0;
                    boolean unused = CheckVersionActivity.this.isWaitingWifiFinish = false;
                    while (!CheckVersionActivity.this.isWaitingWifiFinish) {
                        if (MobileSipService.getInstance().isNetworkAvailable(CheckVersionActivity.this) || i >= 10) {
                            CheckVersionActivity.this.runOnUiThread(new Runnable() {
                                public void run() {
                                    CheckVersionActivity.this.contResume();
                                }
                            });
                            boolean unused2 = CheckVersionActivity.this.isWaitingWifiFinish = true;
                        }
                        i++;
                        try {
                            Thread.sleep(1000);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            });
            this.waitingWifiThr.start();
            return;
        }
        contResume();
    }
}
