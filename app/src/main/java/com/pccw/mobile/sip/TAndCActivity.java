package com.pccw.mobile.sip;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.mobile.sip.util.VersionUtils;

import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import javax.xml.parsers.SAXParserFactory;
import org.linphone.LinphoneActivity;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

public class TAndCActivity extends BaseActivity {
    public static int T_AND_C_NEW_VERSION_AVAILABLE = 1;
    public static int T_AND_C_NEW_VERSION_ERROR = -1;
    public static int T_AND_C_NEW_VERSION_NOT_AVAILABLE = 0;
    private static final String T_AND_C_VERSION_1010_POSTPAID = "T_AND_C_VERSION_1010_POSTPAID_STRING";
    private static final String T_AND_C_VERSION_CSL_PREPAID = "T_AND_C_VERSION_CSL_PREPAID_STRING";
    private static final String T_AND_C_VERSION_DEFAULT = "0.0.0";
    private static final String T_AND_C_VERSION_HKT_POSTPAID = "T_AND_C_VERSION_POSTPAID_STRING";
    private static final String T_AND_C_VERSION_HKT_PREPAID = "T_AND_C_VERSION_PREPAID_STRING";
    private static final String T_AND_C_VERSION_ONE2FREE_POSTPAID = "T_AND_C_VERSION_ONE2FREE_POSTPAID_STRING";
    /* access modifiers changed from: private */
    public static String new1010TAndCVersion = T_AND_C_VERSION_DEFAULT;
    /* access modifiers changed from: private */
    public static String newCSLPrepaidTAndCVersion = T_AND_C_VERSION_DEFAULT;
    /* access modifiers changed from: private */
    public static String newHKTPostpaidTAndCVersion = T_AND_C_VERSION_DEFAULT;
    /* access modifiers changed from: private */
    public static String newHKTPrepaidTAndCVersion = T_AND_C_VERSION_DEFAULT;
    /* access modifiers changed from: private */
    public static String newOne2FreeTAndCVersion = T_AND_C_VERSION_DEFAULT;
    /* access modifiers changed from: private */
    public static String tcURLChi1010 = null;
    /* access modifiers changed from: private */
    public static String tcURLChiCSLPrepaid = null;
    /* access modifiers changed from: private */
    public static String tcURLChiHKTPostpaid = null;
    /* access modifiers changed from: private */
    public static String tcURLChiHKTPrepaid = null;
    /* access modifiers changed from: private */
    public static String tcURLChiOne2Free = null;
    /* access modifiers changed from: private */
    public static String tcURLEng1010 = null;
    /* access modifiers changed from: private */
    public static String tcURLEngCSLPrepaid = null;
    /* access modifiers changed from: private */
    public static String tcURLEngHKTPostpaid = null;
    /* access modifiers changed from: private */
    public static String tcURLEngHKTPrepaid = null;
    /* access modifiers changed from: private */
    public static String tcURLEngOne2Free = null;
    /* access modifiers changed from: private */
    public Button acceptButton;
    /* access modifiers changed from: private */
    public ServerTCAcceptRecorder acceptRecorder = null;
    /* access modifiers changed from: private */
    public Button declineButton;
    /* access modifiers changed from: private */
    public String destinationURL = null;
    /* access modifiers changed from: private */
    public boolean loadTAndCError = false;
    /* access modifiers changed from: private */
    public AlertDialog loadingDialog = null;
    private PageChecker pageChecker = null;
    /* access modifiers changed from: private */
    public WebView tcWebView;

    private class PageChecker extends AsyncTask<Void, Void, Boolean> {
        /* access modifiers changed from: private */
        public Activity activity;
        private Context appContext;
        private AlertDialog errorDialog = null;

        PageChecker(Activity activity2) {
            this.activity = activity2;
            this.appContext = activity2.getApplicationContext();
        }

        public Boolean doInBackground(Void... voidArr) {
            HttpURLConnection httpURLConnection;
            boolean z = false;
            boolean followRedirects = HttpURLConnection.getFollowRedirects();
            HttpURLConnection.setFollowRedirects(false);
            try {
                if (ClientStateManager.isCSLOne2freePostpaid(this.appContext)) {
                    String unused = TAndCActivity.this.destinationURL = Locale.getDefault().getLanguage().equals("zh") ? TAndCActivity.tcURLChiOne2Free : TAndCActivity.tcURLEngOne2Free;
                } else if (ClientStateManager.isCSL1010Postpaid(this.appContext)) {
                    String unused2 = TAndCActivity.this.destinationURL = Locale.getDefault().getLanguage().equals("zh") ? TAndCActivity.tcURLChi1010 : TAndCActivity.tcURLEng1010;
                } else if (ClientStateManager.isCSLPrepaid(this.appContext)) {
                    String unused3 = TAndCActivity.this.destinationURL = Locale.getDefault().getLanguage().equals("zh") ? TAndCActivity.tcURLChiCSLPrepaid : TAndCActivity.tcURLEngCSLPrepaid;
                } else if (ClientStateManager.isHKTPrepaid(this.appContext)) {
                    String unused4 = TAndCActivity.this.destinationURL = Locale.getDefault().getLanguage().equals("zh") ? TAndCActivity.tcURLChiHKTPrepaid : TAndCActivity.tcURLEngHKTPrepaid;
                } else {
                    String unused5 = TAndCActivity.this.destinationURL = Locale.getDefault().getLanguage().equals("zh") ? TAndCActivity.tcURLChiHKTPostpaid : TAndCActivity.tcURLEngHKTPostpaid;
                }
                if (TAndCActivity.this.destinationURL == null) {
                    return false;
                }
                httpURLConnection = (HttpURLConnection) new URL(TAndCActivity.this.destinationURL).openConnection();
                httpURLConnection.setRequestMethod("HEAD");
                httpURLConnection.connect();
                if (httpURLConnection.getResponseCode() == 200) {
                    z = true;
                }
                httpURLConnection.disconnect();
                HttpURLConnection.setFollowRedirects(followRedirects);
                return new Boolean(z);
            } catch (Exception e) {
                httpURLConnection.disconnect();
            } catch (Exception e2) {
            } catch (Throwable th) {
                httpURLConnection.disconnect();
                throw th;
            }
        }

        public void errorDialogCleanUp() {
            if (this.errorDialog != null && this.errorDialog.isShowing()) {
                this.errorDialog.dismiss();
                this.errorDialog = null;
            }
        }

        public void onPostExecute(Boolean bool) {
            if (isCancelled()) {
                return;
            }
            if (!bool.booleanValue() || TAndCActivity.this.destinationURL == null) {
                if (TAndCActivity.this.destinationURL == null) {
                    CheckVersionActivity.clearLastSuccessfulCheckResponse();
                }
                AlertDialog.Builder builder = new AlertDialog.Builder(this.activity);
                builder.setTitle(this.appContext.getString(R.string.app_name));
                builder.setIcon(R.drawable.ic_logo);
                builder.setMessage(this.appContext.getString(R.string.t_and_c_error_message));
                builder.setNeutralButton(TAndCActivity.this.getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        TAndCActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                    }
                });
                this.errorDialog = builder.create();
                this.errorDialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    public void onDismiss(DialogInterface dialogInterface) {
                        if (MobileSipService.getInstance().loginStatus == 0) {
                            MobileSipService.getInstance().close(TAndCActivity.this);
                        }
                        if (!PageChecker.this.activity.isFinishing()) {
                            PageChecker.this.activity.finish();
                        }
                    }
                });
                this.errorDialog.show();
                return;
            }
            TAndCActivity.this.tcWebView.loadUrl(TAndCActivity.this.destinationURL);
        }
    }

    private class ServerTCAcceptRecorder extends AsyncTask<Void, Void, Integer> {
        private static final int T_AND_C_SERVER_RECORD_FAIL_RESPONSE_ERROR = 3;
        private static final int T_AND_C_SERVER_RECORD_IMSI_ERROR = 1;
        private static final int T_AND_C_SERVER_RECORD_IMSI_SECOND_OPERATOR_ERROR = 5;
        private static final int T_AND_C_SERVER_RECORD_NOWIFI_ERROR = 2;
        private static final int T_AND_C_SERVER_RECORD_OK = 0;
        private static final int T_AND_C_SERVER_RECORD_OTHER_ERROR = 4;
        /* access modifiers changed from: private */
        public Activity activity;
        private Context appContext;
        private AlertDialog errorDialog = null;
        /* access modifiers changed from: private */
        public String resultCode = null;

        private class ServerTCResponseXmlHandler extends DefaultHandler {
            private StringBuilder sb;

            private ServerTCResponseXmlHandler() {
            }

            public void characters(char[] cArr, int i, int i2) throws SAXException {
                if (this.sb == null) {
                    this.sb = new StringBuilder(20);
                }
                this.sb.append(cArr, i, i2);
            }

            public void endElement(String str, String str2, String str3) throws SAXException {
                if (this.sb != null) {
                    if (ServerMessageController.ATTR_RESPONSE_RESULTCODE.equals(str2)) {
                        String unused = ServerTCAcceptRecorder.this.resultCode = this.sb.toString().trim();
                    }
                    this.sb = null;
                }
            }

            public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
                super.startElement(str, str2, str3, attributes);
                this.sb = null;
            }
        }

        public ServerTCAcceptRecorder(Activity activity2) {
            this.activity = activity2;
            this.appContext = activity2.getApplicationContext();
        }

        /* access modifiers changed from: protected */
        public Integer doInBackground(Void... voidArr) {
            String str;
            String access$2200;
            int i = 0;
            boolean z = true;
            String encryptedPccwImsi = ClientStateManager.getEncryptedPccwImsi(TAndCActivity.this.getApplicationContext());
            String encryptedDeviceId = ClientStateManager.getEncryptedDeviceId(TAndCActivity.this.getApplicationContext());
            if (!ClientStateManager.isRegisteredPrepaid(TAndCActivity.this.getApplicationContext()) && (encryptedPccwImsi == null || encryptedPccwImsi.length() == 0)) {
                return new Integer(1);
            }
            while (true) {
                int i2 = i;
                if (i2 < 2 && z) {
                    z = false;
                    if (!MobileSipService.getInstance().isNetworkAvailable(TAndCActivity.this)) {
                        return new Integer(2);
                    }
                    String str2 = null;
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmm", Locale.US);
                    simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
                    String format = simpleDateFormat.format(new Date());
                    try {
                        if (ClientStateManager.isNormalPrepaid(TAndCActivity.this.getApplicationContext())) {
                            str = "HKT_NORMAL_PREPAID";
                            access$2200 = TAndCActivity.newHKTPrepaidTAndCVersion;
                        } else if (ClientStateManager.isHelloPrepaid(TAndCActivity.this.getApplicationContext())) {
                            str = "HKT_HELLO_PREPAID";
                            access$2200 = TAndCActivity.newHKTPrepaidTAndCVersion;
                        } else if (ClientStateManager.isCSLPrepaid(TAndCActivity.this.getApplicationContext())) {
                            str = "CSL_PREPAID";
                            access$2200 = TAndCActivity.newCSLPrepaidTAndCVersion;
                        } else if (ClientStateManager.isCSL1010Postpaid(TAndCActivity.this.getApplicationContext())) {
                            str = "CSL_1010_POSTPAID";
                            access$2200 = TAndCActivity.new1010TAndCVersion;
                        } else if (ClientStateManager.isCSLOne2freePostpaid(TAndCActivity.this.getApplicationContext())) {
                            str = "CSL_O2F_POSTPAID";
                            access$2200 = TAndCActivity.newOne2FreeTAndCVersion;
                        } else if (!ClientStateManager.isHKTPostpaid(TAndCActivity.this.getApplicationContext())) {
                            return new Integer(4);
                        } else {
                            str = "HKT_POSTPAID";
                            access$2200 = TAndCActivity.newHKTPostpaidTAndCVersion;
                        }
                        if (ClientStateManager.isRegisteredPrepaid(TAndCActivity.this.getApplicationContext())) {
                            str2 = HttpUtils.post(Constants.T_AND_C_RECORD_ACCEPT_URL, "deviceID", encryptedDeviceId, "version", access$2200, "timestamp", format, "simType", str);
                            i = i2;
                        } else {
                            str2 = HttpUtils.post(Constants.T_AND_C_RECORD_ACCEPT_URL, "imsi", encryptedPccwImsi, "version", access$2200, "timestamp", format, "encrypted", "1", "simType", str);
                            i = i2;
                        }
                    } catch (Exception e) {
                        i = i2 + 1;
                        z = true;
                    }
                    if (!z) {
                        if (str2 == null || str2.length() == 0) {
                            i++;
                            z = true;
                        } else {
                            try {
                                XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
                                xMLReader.setContentHandler(new ServerTCResponseXmlHandler());
                                xMLReader.parse(new InputSource(new StringReader(str2)));
                            } catch (Exception e2) {
                                this.resultCode = null;
                            }
                            if (this.resultCode != null) {
                                return !this.resultCode.equals("0") ? new Integer(3) : new Integer(0);
                            }
                            i++;
                            z = true;
                        }
                    }
                    try {
                        Thread.sleep(500);
                    } catch (Exception e3) {
                    }
                }
            }
            return new Integer(4);
        }

        public void errorDialogCleanUp() {
            if (this.errorDialog != null && this.errorDialog.isShowing()) {
                this.errorDialog.dismiss();
                this.errorDialog = null;
            }
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            if (isCancelled()) {
                return;
            }
            if (num == null || num.intValue() != 0) {
                String string = TAndCActivity.this.getString(R.string.t_and_c_error_message);
                AlertDialog.Builder builder = new AlertDialog.Builder(TAndCActivity.this);
                if (num == null) {
                    string = TAndCActivity.this.getString(R.string.t_and_c_error_message);
                    builder.setNeutralButton(TAndCActivity.this.getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            TAndCActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                        }
                    });
                } else if (num.intValue() == 1) {
                    string = TAndCActivity.this.getString(R.string.no_sim);
                } else if (num.intValue() == 5) {
                    string = TAndCActivity.this.getString(R.string.error_not_pccw_sim);
                    builder.setPositiveButton(TAndCActivity.this.getString(R.string.button_text_enter), new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            TAndCActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://www.pccw-hkt.com/kk")));
                        }
                    });
                    builder.setNegativeButton(TAndCActivity.this.getString(android.R.string.cancel), (DialogInterface.OnClickListener) null);
                } else if (num.intValue() == 2 || num.intValue() == 3 || num.intValue() == 4) {
                    string = TAndCActivity.this.getString(R.string.check_wifi);
                    builder.setNeutralButton(TAndCActivity.this.getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            TAndCActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                        }
                    });
                }
                builder.setTitle(this.appContext.getString(R.string.app_name));
                builder.setIcon(R.drawable.ic_logo);
                builder.setMessage(string);
                this.errorDialog = builder.create();
                this.errorDialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    public void onDismiss(DialogInterface dialogInterface) {
                        if (!ServerTCAcceptRecorder.this.activity.isFinishing()) {
                            ServerTCAcceptRecorder.this.activity.finish();
                        }
                    }
                });
                this.errorDialog.show();
                return;
            }
            if (ClientStateManager.isHKTPrepaid(this.appContext)) {
                ClientStateManager.setPrepaidTcAccepted(TAndCActivity.this, true);
            } else if (ClientStateManager.isCSLPostpaid(this.appContext)) {
                ClientStateManager.setCSLPostpaidTcAccepted(TAndCActivity.this, true);
            } else if (ClientStateManager.isCSLPrepaid(this.appContext)) {
                ClientStateManager.setCSLPrepaidTcAccepted(TAndCActivity.this, true);
            } else {
                ClientStateManager.setPostpaidTcAccepted(TAndCActivity.this, true);
            }
            if (TAndCActivity.newHKTPostpaidTAndCVersion != null) {
                PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putString(TAndCActivity.T_AND_C_VERSION_HKT_POSTPAID, TAndCActivity.newHKTPostpaidTAndCVersion).commit();
            }
            if (TAndCActivity.newHKTPrepaidTAndCVersion != null) {
                PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putString(TAndCActivity.T_AND_C_VERSION_HKT_PREPAID, TAndCActivity.newHKTPrepaidTAndCVersion).commit();
            }
            if (TAndCActivity.newOne2FreeTAndCVersion != null) {
                PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putString(TAndCActivity.T_AND_C_VERSION_ONE2FREE_POSTPAID, TAndCActivity.newOne2FreeTAndCVersion).commit();
            }
            if (TAndCActivity.new1010TAndCVersion != null) {
                PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putString(TAndCActivity.T_AND_C_VERSION_1010_POSTPAID, TAndCActivity.new1010TAndCVersion).commit();
            }
            if (TAndCActivity.newCSLPrepaidTAndCVersion != null) {
                PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putString(TAndCActivity.T_AND_C_VERSION_CSL_PREPAID, TAndCActivity.newCSLPrepaidTAndCVersion).commit();
            }
            TAndCActivity.this.gotoNextActivity(true);
        }
    }

    public static int checkTAndCVersion(CheckVersionResponse checkVersionResponse, Context context) {
        boolean z = false;
        boolean z2 = ClientStateManager.isHKTPostpaidTCAccepted(context.getApplicationContext()) || ClientStateManager.isHKTPrepaidTCAccepted(context.getApplicationContext()) || ClientStateManager.isCSLPostpaidTCAccepted(context.getApplicationContext()) || ClientStateManager.isCSLPrepaidTCAccepted(context.getApplicationContext());
        String string = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getString(T_AND_C_VERSION_HKT_PREPAID, T_AND_C_VERSION_DEFAULT);
        String string2 = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getString(T_AND_C_VERSION_HKT_POSTPAID, T_AND_C_VERSION_DEFAULT);
        String string3 = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getString(T_AND_C_VERSION_ONE2FREE_POSTPAID, T_AND_C_VERSION_DEFAULT);
        String string4 = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getString(T_AND_C_VERSION_1010_POSTPAID, T_AND_C_VERSION_DEFAULT);
        String string5 = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getString(T_AND_C_VERSION_CSL_PREPAID, T_AND_C_VERSION_DEFAULT);
        tcURLChiHKTPrepaid = checkVersionResponse.t_and_c_url_c_prepaid;
        tcURLEngHKTPrepaid = checkVersionResponse.t_and_c_url_e_prepaid;
        tcURLChiHKTPostpaid = checkVersionResponse.t_and_c_url_c;
        tcURLEngHKTPostpaid = checkVersionResponse.t_and_c_url_e;
        tcURLChiOne2Free = checkVersionResponse.t_and_c_url_c_one2free;
        tcURLEngOne2Free = checkVersionResponse.t_and_c_url_e_one2free;
        tcURLChi1010 = checkVersionResponse.t_and_c_url_c_1010;
        tcURLEng1010 = checkVersionResponse.t_and_c_url_e_1010;
        tcURLChiCSLPrepaid = checkVersionResponse.t_and_c_url_c_csl_prepaid;
        tcURLEngCSLPrepaid = checkVersionResponse.t_and_c_url_e_csl_prepaid;
        try {
            if (checkVersionResponse.t_and_c_version == null || checkVersionResponse.t_and_c_version_prepaid == null) {
                newHKTPrepaidTAndCVersion = string.trim();
                newHKTPostpaidTAndCVersion = string2.trim();
                newOne2FreeTAndCVersion = string3.trim();
                new1010TAndCVersion = string4.trim();
                newCSLPrepaidTAndCVersion = string5.trim();
                return T_AND_C_NEW_VERSION_ERROR;
            }
            newHKTPrepaidTAndCVersion = checkVersionResponse.t_and_c_version_prepaid.trim();
            newHKTPostpaidTAndCVersion = checkVersionResponse.t_and_c_version.trim();
            newOne2FreeTAndCVersion = checkVersionResponse.t_and_c_version_one2free.trim();
            new1010TAndCVersion = checkVersionResponse.t_and_c_version_1010.trim();
            newCSLPrepaidTAndCVersion = checkVersionResponse.t_and_c_version_csl_prepaid.trim();
            if (VersionUtils.isNewerVersion(string, newHKTPrepaidTAndCVersion)) {
                ClientStateManager.setPrepaidTcAccepted(context, false);
                z2 = false;
            }
            if (VersionUtils.isNewerVersion(string2, newHKTPostpaidTAndCVersion)) {
                ClientStateManager.setPostpaidTcAccepted(context, false);
                z2 = false;
            }
            if (VersionUtils.isNewerVersion(string3, newOne2FreeTAndCVersion)) {
                ClientStateManager.setCSLPostpaidTcAccepted(context, false);
                z2 = false;
            }
            if (VersionUtils.isNewerVersion(string4, new1010TAndCVersion)) {
                ClientStateManager.setCSLPostpaidTcAccepted(context, false);
                z2 = false;
            }
            if (VersionUtils.isNewerVersion(string5, newCSLPrepaidTAndCVersion)) {
                ClientStateManager.setCSLPrepaidTcAccepted(context, false);
            } else {
                z = z2;
            }
            return (checkVersionResponse.t_and_c_url_c_prepaid == null || checkVersionResponse.t_and_c_url_e_prepaid == null || checkVersionResponse.t_and_c_url_c == null || checkVersionResponse.t_and_c_url_e == null || checkVersionResponse.t_and_c_url_c_one2free == null || checkVersionResponse.t_and_c_url_e_one2free == null || checkVersionResponse.t_and_c_url_c_1010 == null || checkVersionResponse.t_and_c_url_e_1010 == null || checkVersionResponse.t_and_c_url_c_csl_prepaid == null || checkVersionResponse.t_and_c_url_e_csl_prepaid == null) ? T_AND_C_NEW_VERSION_ERROR : !z ? T_AND_C_NEW_VERSION_AVAILABLE : T_AND_C_NEW_VERSION_NOT_AVAILABLE;
        } catch (Exception e) {
            newHKTPrepaidTAndCVersion = string.trim();
            newHKTPostpaidTAndCVersion = string2.trim();
            newOne2FreeTAndCVersion = string3.trim();
            new1010TAndCVersion = string4.trim();
            newCSLPrepaidTAndCVersion = string5.trim();
            e.printStackTrace();
        }
    }

    /* access modifiers changed from: private */
    public void gotoNextActivity(boolean z) {
        startActivity(new Intent(getApplicationContext(), z ? UserGuidePager.class : LinphoneActivity.class));
        if (!isFinishing()) {
            finish();
        }
    }

    public static boolean isCSLPostpaidTAndCRead(Context context) {
        if (context != null) {
            return ClientStateManager.isCSLPostpaidTCAccepted(context);
        }
        return false;
    }

    public static boolean isCSLPrepaidTAndCRead(Context context) {
        if (context != null) {
            return ClientStateManager.isCSLPrepaidTCAccepted(context);
        }
        return false;
    }

    public static boolean isHKTPostpaidTAndCRead(Context context) {
        if (context != null) {
            return ClientStateManager.isHKTPostpaidTCAccepted(context);
        }
        return false;
    }

    public static boolean isHKTPrepaidTAndCRead(Context context) {
        if (context != null) {
            return ClientStateManager.isHKTPrepaidTCAccepted(context);
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().setFlags(1024, 1024);
        if (MobileSipService.getInstance().messageController == null) {
            MobileSipService.getInstance().messageController = new ServerMessageController(this);
        }
    }

    public void onPause() {
        super.onPause();
        if (this.pageChecker != null && !this.pageChecker.isCancelled()) {
            this.pageChecker.errorDialogCleanUp();
            this.pageChecker.cancel(false);
        }
        if (this.acceptRecorder != null && !this.acceptRecorder.isCancelled()) {
            this.acceptRecorder.errorDialogCleanUp();
            this.acceptRecorder.cancel(false);
        }
        if (this.loadingDialog != null && this.loadingDialog.isShowing()) {
            this.loadingDialog.dismiss();
            this.loadingDialog = null;
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        if (!CheckVersionActivity.canSkipCheckVersion(getApplicationContext())) {
            startActivity(new Intent(this, CheckVersionActivity.class));
            finish();
            return;
        }
        Log.v("ABC", "123");
        if (ClientStateManager.checkSimState(getApplicationContext(), false) != 0 && MobileSipService.getInstance().loginStatus == 0) {
            MobileSipService.getInstance().close(this);
        }
        if (ClientStateManager.isNormalPrepaid(this) || ClientStateManager.isHelloPrepaid(this)) {
            if (isHKTPrepaidTAndCRead(this)) {
                gotoNextActivity(false);
                return;
            }
        } else if (ClientStateManager.isCSLPostpaid(this)) {
            if (isCSLPostpaidTAndCRead(this)) {
                gotoNextActivity(false);
                return;
            }
        } else if (ClientStateManager.isCSLPrepaid(this)) {
            if (isCSLPrepaidTAndCRead(this)) {
                gotoNextActivity(false);
                return;
            }
        } else if (isHKTPostpaidTAndCRead(this)) {
            gotoNextActivity(false);
            return;
        }
        Log.v("ABC", "456");
        setContentView(R.layout.t_and_c);
        this.tcWebView = (WebView) findViewById(R.id.tc_content);
        this.acceptButton = (Button) findViewById(R.id.accept_button);
        this.declineButton = (Button) findViewById(R.id.decline_button);
        this.loadTAndCError = false;
        if (!MobileSipService.getInstance().isNetworkAvailable(this)) {
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setTitle(getString(R.string.app_name));
            builder.setIcon(R.drawable.ic_logo);
            builder.setMessage(getString(R.string.ask_wifi));
            builder.setNeutralButton(getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    TAndCActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                }
            });
            AlertDialog create = builder.create();
            create.setOnDismissListener(new DialogInterface.OnDismissListener() {
                public void onDismiss(DialogInterface dialogInterface) {
                    if (!TAndCActivity.this.isFinishing()) {
                        TAndCActivity.this.finish();
                    }
                }
            });
            create.show();
            return;
        }
        AlertDialog.Builder builder2 = new AlertDialog.Builder(this);
        builder2.setTitle(getString(R.string.app_name));
        builder2.setIcon(R.drawable.ic_logo);
        builder2.setMessage(getString(R.string.loading));
        this.loadingDialog = builder2.create();
        this.loadingDialog.setCancelable(false);
        this.loadingDialog.setCanceledOnTouchOutside(false);
        this.loadingDialog.show();
        this.pageChecker = new PageChecker(this);
        this.pageChecker.execute(new Void[0]);
        this.acceptButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (view == TAndCActivity.this.acceptButton) {
                    TAndCActivity.this.acceptButton.setClickable(false);
                    TAndCActivity.this.acceptButton.setEnabled(false);
                    TAndCActivity.this.declineButton.setClickable(false);
                    TAndCActivity.this.declineButton.setEnabled(false);
                    ServerTCAcceptRecorder unused = TAndCActivity.this.acceptRecorder = new ServerTCAcceptRecorder(TAndCActivity.this);
                    TAndCActivity.this.acceptRecorder.execute(new Void[0]);
                }
            }
        });
        this.declineButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
                if (view == TAndCActivity.this.declineButton) {
                    new Handler(Looper.getMainLooper()).post(new Runnable() {
                        public void run() {
                            if (MobileSipService.getInstance().loginStatus == 0) {
                                MobileSipService.getInstance().close(TAndCActivity.this);
                            }
                        }
                    });
                    if (!TAndCActivity.this.isFinishing()) {
                        TAndCActivity.this.finish();
                    }
                }
            }
        });
        this.tcWebView.setWebViewClient(new WebViewClient() {
            public void onPageFinished(WebView webView, String str) {
                try {
                    if (TAndCActivity.this.loadingDialog != null && TAndCActivity.this.loadingDialog.isShowing()) {
                        TAndCActivity.this.loadingDialog.dismiss();
                        AlertDialog unused = TAndCActivity.this.loadingDialog = null;
                    }
                    if (webView == TAndCActivity.this.tcWebView && new URL(str).sameFile(new URL(TAndCActivity.this.destinationURL)) && !TAndCActivity.this.loadTAndCError) {
                        TAndCActivity.this.acceptButton.setEnabled(true);
                        TAndCActivity.this.declineButton.setEnabled(true);
                    }
                } catch (Exception e) {
                }
            }

            public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
                super.onPageStarted(webView, str, bitmap);
            }

            public void onReceivedError(WebView webView, int i, String str, String str2) {
                if (TAndCActivity.this.loadingDialog != null && TAndCActivity.this.loadingDialog.isShowing()) {
                    TAndCActivity.this.loadingDialog.dismiss();
                    AlertDialog unused = TAndCActivity.this.loadingDialog = null;
                }
                if (webView == TAndCActivity.this.tcWebView) {
                    boolean unused2 = TAndCActivity.this.loadTAndCError = true;
                    AlertDialog.Builder builder = new AlertDialog.Builder(TAndCActivity.this);
                    builder.setTitle(TAndCActivity.this.getString(R.string.app_name));
                    builder.setIcon(R.drawable.ic_logo);
                    builder.setMessage(TAndCActivity.this.getString(R.string.t_and_c_error_message));
                    builder.setNeutralButton(TAndCActivity.this.getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int i) {
                            TAndCActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                        }
                    });
                    AlertDialog create = builder.create();
                    create.setOnDismissListener(new DialogInterface.OnDismissListener() {
                        public void onDismiss(DialogInterface dialogInterface) {
                            if (MobileSipService.getInstance().loginStatus == 0) {
                                MobileSipService.getInstance().close(TAndCActivity.this);
                            }
                            if (!TAndCActivity.this.isFinishing()) {
                                TAndCActivity.this.finish();
                            }
                        }
                    });
                    create.show();
                }
            }

            public boolean shouldOverrideUrlLoading(WebView webView, String str) {
                return false;
            }
        });
    }
}
