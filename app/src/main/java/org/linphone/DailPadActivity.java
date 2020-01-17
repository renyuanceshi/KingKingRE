package org.linphone;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.media.ToneGenerator;
import android.net.Uri;
import android.net.wifi.WifiManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Vibrator;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.view.InputDeviceCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.telephony.PhoneNumberFormattingTextWatcher;
import android.telephony.PhoneNumberUtils;
import android.text.Editable;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.provider.KingKingContentProvider;
import com.pccw.mobile.server.CheckPrepaidBalanceApi;
import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.response.CheckPrepaidBalanceResponse;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.FacebookShareActivity;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.NumberMappingUtil;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.ui.dialog.KKAlertDialogFragment;
import com.pccw.mobile.util.PreCallQualityIndicator;
import com.pccw.sms.bean.SMSConstants;
import java.util.concurrent.ExecutionException;
import org.apache.commons.lang.StringUtils;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;
import org.linphone.mediastream.video.capture.hwconf.AndroidCameraConfiguration;

public class DailPadActivity extends Fragment implements View.OnClickListener, View.OnLongClickListener, View.OnKeyListener, KKAlertDialogFragment.KKDialogResponses {
    private static final int DIAL_TONE_STREAM_TYPE = 3;
    private static final String NEVER_FACEBOOK_SHARE = "neverShareToFacebook";
    private static final String SHARE_PREF_TAG = "FacebookShare";
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    private static final String TAG = "PCCW_MOBILE_SIP";
    private static final int TONE_LENGTH_MS = 150;
    private static final int TONE_RELATIVE_VOLUME = 80;
    private static final int VIBRATE_NO_REPEAT = -1;
    private static final int promptAddSSIDDialog = 2;
    private static final int promptNoWifiDialog = 1;
    private static final int promptReinviteWithAudioId = 0;
    public static boolean shouldCleanCallCount = false;
    public static boolean shouldRunFacebookShareChecking = false;
    public static boolean shouldShowReinviteWithAudioDialog = false;
    private static DailPadActivity theDailPad;
    Activity activity;
    Context ctx;
    /* access modifiers changed from: private */
    public String dialOutNumber = "";
    /* access modifiers changed from: private */
    public FragmentManager fragmentManager;
    Handler handler = new Handler() {
        public void handleMessage(Message message) {
            synchronized (DailPadActivity.this.mToneGeneratorLock) {
                if (DailPadActivity.this.mToneGenerator != null) {
                    DailPadActivity.this.mToneGenerator.stopTone();
                }
                removeMessages(0);
            }
        }
    };
    /* access modifiers changed from: private */
    public boolean isWaitingWifiFinish = false;
    /* access modifiers changed from: private */
    public TextView mBannerText;
    private ConnectionChangeReceiver mConnectionChangeReceiver = null;
    private boolean mDTMFToneEnabled;
    private ImageButton mDelete;
    private ImageButton mDialButton;
    private Drawable mDigitsBackground;
    private Drawable mDigitsEmptyBackground;
    private String mDisplayName;
    /* access modifiers changed from: private */
    public LinearLayout mPreCallQILayout;
    private TextView mPreCallQIStatus;
    private SharedPreferences mPref;
    private CheckBox mRoamSaveButton;
    private RoamSaveButtonListener mRoamSaveButtonListener;
    /* access modifiers changed from: private */
    public ToneGenerator mToneGenerator;
    /* access modifiers changed from: private */
    public Object mToneGeneratorLock = new Object();
    private boolean mVibrateOn;
    private long[] mVibratePattern;
    private Vibrator mVibrator;
    private ImageButton mVideocallButton;
    private ImageButton mVoicemailButton;
    private AlertDialog m_AlertDlg;
    private PreCallQualityIndicator preCallQI;
    Handler preCallQIHandler = new Handler(Looper.getMainLooper()) {
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1000:
                    DailPadActivity.this.updatePreCallQIStatus(message.obj.toString());
                    break;
            }
            super.handleMessage(message);
        }
    };
    /* access modifiers changed from: private */
    public AlertDialog prepaidTopUpReminder;
    /* access modifiers changed from: private */
    public EditText sip_uri_box;
    /* access modifiers changed from: private */
    public CountDownTimer timer;
    View v;
    /* access modifiers changed from: private */
    public Thread waitingWifiThr;

    private class ConnectionChangeReceiver extends BroadcastReceiver {
        private ConnectionChangeReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals(Constants.INTENT_ALERT_LOGIN_DISCONNECTED)) {
                DailPadActivity.this.activity.runOnUiThread(new Runnable() {
                    public void run() {
                        DailPadActivity.this.setRoamSaveButtonEnable(false);
                        DailPadActivity.this.setRoamSaveButtonClickable(true);
                        DailPadActivity.on(DailPadActivity.this.ctx, false);
                        DailPadActivity.this.stopPreCallQI();
                    }
                });
            } else if (intent.getAction().equals(Constants.INTENT_ALERT_LOGIN_DISCONNECTING)) {
                DailPadActivity.this.activity.runOnUiThread(new Runnable() {
                    public void run() {
                        DailPadActivity.this.setRoamSaveButtonEnable(false);
                        DailPadActivity.this.setRoamSaveButtonClickable(false);
                        DailPadActivity.on(DailPadActivity.this.ctx, false);
                    }
                });
            } else if (intent.getAction().equals(Constants.INTENT_ALERT_LOGIN_FINISHED)) {
                DailPadActivity.this.activity.runOnUiThread(new Runnable() {
                    public void run() {
                        if (MobileSipService.getInstance().loginStatus != 0) {
                            DailPadActivity.this.setRoamSaveButtonEnable(false);
                            DailPadActivity.this.setRoamSaveButtonClickable(true);
                            DailPadActivity.on(DailPadActivity.this.ctx, false);
                        }
                    }
                });
            } else if (intent.getAction().equals(Constants.INTENT_ALERT_CALLFORWARD_SUCCEED)) {
                DailPadActivity.this.activity.runOnUiThread(new Runnable() {
                    public void run() {
                        DailPadActivity.this.setRoamSaveButtonEnable(true);
                        DailPadActivity.this.setRoamSaveButtonClickable(true);
                        String phone = ClientStateManager.getPhone(DailPadActivity.this.ctx);
                        TextView access$1200 = DailPadActivity.this.mBannerText;
                        StringBuilder append = new StringBuilder().append(DailPadActivity.this.getString(R.string.banner_text));
                        if (phone == null || !StringUtils.isBlank(phone)) {
                        }
                        access$1200.setText(append.append("").toString());
                        if (ClientStateManager.isRegisteredPrepaid(DailPadActivity.this.ctx)) {
                            new PrepaidTopupReminderThread().execute(new Void[0]);
                        }
                        DailPadActivity.this.startPreCallQI();
                    }
                });
            } else if (intent.getAction().equals(Constants.INTENT_ALERT_RELOGIN_PROCESSING)) {
                DailPadActivity.this.activity.runOnUiThread(new Runnable() {
                    public void run() {
                        DailPadActivity.this.setRoamSaveButtonReAutoconnecting();
                        DailPadActivity.this.mBannerText.setText(DailPadActivity.this.getString(R.string.reg_reconnecting));
                        DailPadActivity.this.mBannerText.setVisibility(0);
                        DailPadActivity.this.stopPreCallQI();
                    }
                });
            } else if (intent.getAction().equals(Constants.INTENT_ALERT_AUTOLOGIN_PROCESSING)) {
                DailPadActivity.this.activity.runOnUiThread(new Runnable() {
                    public void run() {
                        DailPadActivity.this.setRoamSaveButtonReAutoconnecting();
                        DailPadActivity.this.mBannerText.setText(DailPadActivity.this.getString(R.string.reg_autoconnecting));
                        DailPadActivity.this.mBannerText.setVisibility(0);
                        DailPadActivity.this.stopPreCallQI();
                    }
                });
            }
        }
    }

    public class PrepaidTopupReminderThread extends AsyncTask<Void, Void, CheckPrepaidBalanceResponse> {
        CheckPrepaidBalanceResponse checkPrepaidBalanceResponse = null;

        public PrepaidTopupReminderThread() {
        }

        /* access modifiers changed from: protected */
        public CheckPrepaidBalanceResponse doInBackground(Void... voidArr) {
            try {
                new CheckPrepaidBalanceApi(new ApiResponseListener() {
                    public void onResponseFailed() {
                        PrepaidTopupReminderThread.this.checkPrepaidBalanceResponse = null;
                    }

                    public void onResponseSuccess(ApiResponse apiResponse) {
                        PrepaidTopupReminderThread.this.checkPrepaidBalanceResponse = (CheckPrepaidBalanceResponse) apiResponse;
                    }
                }, DailPadActivity.this.ctx).execute(new String[]{""}).get();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (ExecutionException e2) {
                e2.printStackTrace();
            }
            return this.checkPrepaidBalanceResponse;
        }

        public void onPostExecute(CheckPrepaidBalanceResponse checkPrepaidBalanceResponse2) {
            if (checkPrepaidBalanceResponse2 == null || !"0".equals(checkPrepaidBalanceResponse2.resultcode)) {
                if (checkPrepaidBalanceResponse2 == null || "0".equals(checkPrepaidBalanceResponse2.resultcode)) {
                }
            } else if ("true".equals(checkPrepaidBalanceResponse2.lower_than_threshold)) {
                showPrepaidTopUpReminderDialog(checkPrepaidBalanceResponse2);
                DailPadActivity.this.prepaidTopUpReminder.show();
            }
        }

        /* access modifiers changed from: protected */
        public void showPrepaidTopUpReminderDialog(CheckPrepaidBalanceResponse checkPrepaidBalanceResponse2) {
            if (DailPadActivity.this.prepaidTopUpReminder != null && DailPadActivity.this.prepaidTopUpReminder.isShowing()) {
                DailPadActivity.this.prepaidTopUpReminder.dismiss();
            }
            AlertDialog.Builder builder = new AlertDialog.Builder(DailPadActivity.this.activity);
            View inflate = LayoutInflater.from(DailPadActivity.this.ctx).inflate(R.layout.prepaid_topup_button_layout, (ViewGroup) null);
            String registeredNumber = ClientStateManager.getRegisteredNumber(DailPadActivity.this.ctx);
            String str = checkPrepaidBalanceResponse2.balance;
            builder.setMessage(DailPadActivity.this.getString(R.string.prepaid_topup_reminder_message).replaceAll("MSISDN_VALUE", registeredNumber).replaceAll("BALANCE_VALUE", "10"));
            builder.setIcon(R.drawable.ic_logo).setTitle(2131165290);
            builder.setView(inflate);
            Button button = (Button) inflate.findViewById(R.id.prepaid_topup_calling);
            if (ClientStateManager.isCSLPrepaid(DailPadActivity.this.ctx)) {
                button.setText(DailPadActivity.this.getString(R.string.prepaid_topup_button_text_calling_csl_prepaid));
            } else if (ClientStateManager.isHelloPrepaid(DailPadActivity.this.ctx)) {
                button.setText(DailPadActivity.this.getString(R.string.prepaid_topup_button_text_calling_hello_prepaid));
            } else {
                button.setText(DailPadActivity.this.getString(R.string.prepaid_topup_button_text_calling_normal_prepaid));
            }
            button.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (MobileSipService.getInstance().loginStatus != 0) {
                        Toast.makeText(DailPadActivity.this.ctx, DailPadActivity.this.ctx.getString(R.string.no_network), 1).show();
                    } else {
                        String str = "";
                        if (ClientStateManager.isHelloPrepaid(DailPadActivity.this.ctx)) {
                            str = Constants.HELLO_PREPAID_TOPUP_NUM;
                        } else if (ClientStateManager.isNormalPrepaid(DailPadActivity.this.ctx)) {
                            str = Constants.NORMAL_PREPAID_TOPUP_NUM;
                        } else if (ClientStateManager.isCSLPrepaid(DailPadActivity.this.ctx)) {
                            str = Constants.CSL_PREPAID_TOPUP_NUM;
                        }
                        MobileSipService.getInstance().call(str, DailPadActivity.this.ctx, false);
                    }
                    if (DailPadActivity.this.prepaidTopUpReminder != null && DailPadActivity.this.prepaidTopUpReminder.isShowing()) {
                        DailPadActivity.this.prepaidTopUpReminder.dismiss();
                    }
                }
            });
            ((Button) inflate.findViewById(R.id.prepaid_topup_cancel)).setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (DailPadActivity.this.prepaidTopUpReminder != null && DailPadActivity.this.prepaidTopUpReminder.isShowing()) {
                        DailPadActivity.this.prepaidTopUpReminder.dismiss();
                    }
                }
            });
            ((Button) inflate.findViewById(R.id.prepaid_topup_online)).setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (!MobileSipService.getInstance().isNetworkAvailable(DailPadActivity.this.ctx)) {
                        Toast.makeText(DailPadActivity.this.ctx, DailPadActivity.this.ctx.getString(R.string.ask_wifi), 1).show();
                    } else {
                        DailPadActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(MobileSipService.getInstance().generateTopupURL(DailPadActivity.this.ctx))));
                    }
                    if (DailPadActivity.this.prepaidTopUpReminder != null && DailPadActivity.this.prepaidTopUpReminder.isShowing()) {
                        DailPadActivity.this.prepaidTopUpReminder.dismiss();
                    }
                }
            });
            AlertDialog unused = DailPadActivity.this.prepaidTopUpReminder = builder.create();
            DailPadActivity.this.prepaidTopUpReminder.show();
        }
    }

    private class RoamSaveButtonListener implements CompoundButton.OnCheckedChangeListener, View.OnClickListener {
        private RoamSaveButtonListener() {
        }

        public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
            synchronized (this) {
            }
        }

        public void onClick(View view) {
            synchronized (this) {
                DailPadActivity.this.setRoamSaveButtonClickable(false);
                if (((CheckBox) view).isChecked()) {
                    WifiManager wifiManager = (WifiManager) DailPadActivity.this.getContext().getApplicationContext().getSystemService("wifi");
                    if (!wifiManager.isWifiEnabled()) {
                        wifiManager.setWifiEnabled(true);
                        DailPadActivity.this.mBannerText.setVisibility(0);
                        DailPadActivity.this.mBannerText.setText(DailPadActivity.this.ctx.getString(R.string.connecting) + "...");
                        Thread unused = DailPadActivity.this.waitingWifiThr = new Thread(new Runnable() {
                            public void run() {
                                int i = 0;
                                boolean unused = DailPadActivity.this.isWaitingWifiFinish = false;
                                while (!DailPadActivity.this.isWaitingWifiFinish) {
                                    if (MobileSipService.getInstance().isNetworkAvailable(DailPadActivity.this.ctx) || i >= 10) {
                                        DailPadActivity.this.activity.runOnUiThread(new Runnable() {
                                            public void run() {
                                                DailPadActivity.this.contTurnOnRS();
                                            }
                                        });
                                        boolean unused2 = DailPadActivity.this.isWaitingWifiFinish = true;
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
                        DailPadActivity.this.waitingWifiThr.start();
                    } else {
                        DailPadActivity.this.contTurnOnRS();
                    }
                } else {
                    DailPadActivity.this.mBannerText.setVisibility(4);
                    DailPadActivity.this.mPreCallQILayout.setVisibility(4);
                    DailPadActivity.on(DailPadActivity.this.ctx, false);
                    MobileSipService.getInstance().close(DailPadActivity.this.ctx);
                }
            }
        }
    }

    private boolean call(String str) {
        this.dialOutNumber = str;
        return MobileSipService.getInstance().call(str, this.ctx, false);
    }

    private void callVoicemail() {
        if (ClientStateManager.isCSL(this.ctx)) {
        }
        if (this.m_AlertDlg != null) {
            this.m_AlertDlg.cancel();
        }
        if (!MobileSipService.getInstance().isPhoneCallReady() || !LinphoneService.isready()) {
            new AlertDialog.Builder(this.activity).setMessage(R.string.notfast).setTitle(2131165290).setIcon(R.drawable.ic_logo).setPositiveButton(getString(17039370), (DialogInterface.OnClickListener) null).setCancelable(true).show();
        } else {
            call("*988");
        }
        this.sip_uri_box.setText("");
        afterTextChanged(this.sip_uri_box.getText());
    }

    public static DailPadActivity getDailPad() {
        if (theDailPad == null) {
            return null;
        }
        return theDailPad;
    }

    public static String getLastOutgoingCall(Context context) {
        Cursor cursor;
        String str;
        try {
            cursor = context.getContentResolver().query(KingKingContentProvider.CALL_LOG_URI, new String[]{DBHelper.NUMBER}, "type = 2", (String[]) null, "date DESC LIMIT 1");
            if (cursor != null) {
                try {
                    if (cursor.moveToFirst()) {
                        str = cursor.getString(0);
                        if (cursor != null) {
                            cursor.close();
                        }
                        return str;
                    }
                } catch (Throwable th) {
                    th = th;
                }
            }
            str = "";
            if (cursor != null) {
                cursor.close();
            }
            return str;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
        }
        if (cursor != null) {
            cursor.close();
        }
        throw th;
    }

    /* JADX WARNING: Removed duplicated region for block: B:11:0x0030  */
    /* JADX WARNING: Removed duplicated region for block: B:23:? A[RETURN, SYNTHETIC] */
    @android.annotation.SuppressLint({"NewApi"})
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private java.lang.String getlastCall() {
        /*
            r7 = this;
            r6 = 0
            java.lang.String r0 = android.os.Build.VERSION.SDK
            int r0 = java.lang.Integer.parseInt(r0)
            r1 = 8
            if (r0 >= r1) goto L_0x0042
            android.content.Context r0 = r7.ctx
            android.content.ContentResolver r0 = r0.getContentResolver()
            android.net.Uri r1 = com.pccw.mobile.provider.KingKingContentProvider.CALL_LOG_URI     // Catch:{ all -> 0x003a }
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch:{ all -> 0x003a }
            r3 = 0
            java.lang.String r4 = "number"
            r2[r3] = r4     // Catch:{ all -> 0x003a }
            java.lang.String r3 = "type = 2"
            r4 = 0
            java.lang.String r5 = "date DESC LIMIT 1"
            android.database.Cursor r1 = r0.query(r1, r2, r3, r4, r5)     // Catch:{ all -> 0x003a }
            if (r1 == 0) goto L_0x002c
            boolean r0 = r1.moveToFirst()     // Catch:{ all -> 0x0049 }
            if (r0 != 0) goto L_0x0034
        L_0x002c:
            java.lang.String r0 = ""
        L_0x002e:
            if (r1 == 0) goto L_0x0033
            r1.close()
        L_0x0033:
            return r0
        L_0x0034:
            r0 = 0
            java.lang.String r0 = r1.getString(r0)     // Catch:{ all -> 0x0049 }
            goto L_0x002e
        L_0x003a:
            r0 = move-exception
            r1 = r6
        L_0x003c:
            if (r1 == 0) goto L_0x0041
            r1.close()
        L_0x0041:
            throw r0
        L_0x0042:
            android.content.Context r0 = r7.ctx
            java.lang.String r0 = getLastOutgoingCall(r0)
            goto L_0x0033
        L_0x0049:
            r0 = move-exception
            goto L_0x003c
        */
        throw new UnsupportedOperationException("Method not decompiled: org.linphone.DailPadActivity.getlastCall():java.lang.String");
    }

    static boolean handleChars(Context context, String str) {
        return handleChars(context, str, false, (EditText) null);
    }

    static boolean handleChars(Context context, String str, EditText editText) {
        return handleChars(context, str, false, editText);
    }

    static boolean handleChars(Context context, String str, boolean z, EditText editText) {
        PhoneNumberUtils.stripSeparators(str);
        return false;
    }

    private void handleIntent(Intent intent) {
        Cursor query;
        String type = intent.getType();
        if (("vnd.android.cursor.item/person".equals(type) || "vnd.android.cursor.item/phone".equals(type)) && (query = this.ctx.getContentResolver().query(intent.getData(), new String[]{DBHelper.NUMBER}, (String) null, (String[]) null, (String) null)) != null) {
            if (query.moveToFirst()) {
                setFormattedDigits(query.getString(0));
            }
            query.close();
        }
    }

    /* access modifiers changed from: private */
    public boolean isWifiAvailable() {
        return MobileSipService.getInstance().isNetworkAvailable(this.ctx);
    }

    private void keyPressed(int i) {
        vibrate();
        this.sip_uri_box.onKeyDown(i, new KeyEvent(0, i));
        afterTextChanged(this.sip_uri_box.getText());
    }

    public static void on(Context context, boolean z) {
        SharedPreferences.Editor edit = PreferenceManager.getDefaultSharedPreferences(context).edit();
        edit.putBoolean("on", z);
        edit.commit();
        edit.putBoolean("PREF_AUTOSTART", z);
        edit.commit();
    }

    private void pausePreCallQI() {
        if (this.preCallQI != null) {
            this.preCallQI.stopChecking();
        }
    }

    @SuppressLint({"NewApi"})
    private void performCall(final boolean z) {
        if (this.sip_uri_box.getText().length() > 0) {
            String str = PhoneNumberUtils.stripSeparators(this.sip_uri_box.getText().toString()).toString();
            if (!MobileSipService.getInstance().startCallChecking(str, this.activity)) {
                return;
            }
            if (!NumberMappingUtil.hasIDDPrefix(str, this.ctx) || !PreferenceManager.getDefaultSharedPreferences(this.ctx).getBoolean(SHOW_IDD_CHARGE_MESSAGE, true)) {
                performCallWithAddress(this.sip_uri_box.getText().toString(), z);
                return;
            }
            try {
                final CheckBox checkBox = new CheckBox(this.activity);
                checkBox.setChecked(false);
                checkBox.setText(R.string.do_not_show_this_again);
                new AlertDialog.Builder(this.activity).setIcon(R.drawable.ic_logo).setTitle(2131165290).setMessage(R.string.idd_charge_message).setView(checkBox).setNegativeButton(17039360, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                }).setPositiveButton(17039370, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        if (checkBox.isChecked()) {
                            PreferenceManager.getDefaultSharedPreferences(DailPadActivity.this.ctx).edit().putBoolean(DailPadActivity.SHOW_IDD_CHARGE_MESSAGE, false).commit();
                        }
                        dialogInterface.cancel();
                        DailPadActivity.this.performCallWithAddress(DailPadActivity.this.sip_uri_box.getText().toString(), z);
                    }
                }).show();
            } catch (Exception e) {
            }
        } else {
            this.sip_uri_box.setText(getlastCall());
            this.sip_uri_box.setSelection(this.sip_uri_box.getText().length());
            afterTextChanged(this.sip_uri_box.getText());
        }
    }

    /* access modifiers changed from: private */
    public void performCallWithAddress(String str, boolean z) {
        this.sip_uri_box.setText("");
        afterTextChanged(this.sip_uri_box.getText());
        this.dialOutNumber = str;
        if (!MobileSipService.getInstance().call(str, this.ctx, z) && shouldShowReinviteWithAudioDialog) {
            shouldShowReinviteWithAudioDialog = false;
            this.handler.post(new Runnable() {
                public void run() {
                    DailPadActivity.this.showDialog(0);
                    CountDownTimer unused = DailPadActivity.this.timer = new CountDownTimer(SMSConstants.asyncTaskDownloadTimeLimit, 1000) {
                        public void onFinish() {
                            DailPadActivity.this.timer.cancel();
                        }

                        public void onTick(long j) {
                        }
                    }.start();
                }
            });
        }
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

    private void resumePreCallQI() {
        if (this.preCallQI != null) {
            this.preCallQI.startChecking();
        }
    }

    private void runFacebookShareChecking() {
        if (Build.VERSION.SDK_INT >= 9 && shouldRunFacebookShareChecking) {
            final FacebookShareActivity facebookShareActivity = new FacebookShareActivity();
            if (facebookShareActivity.runFacebookShareChecking(this.ctx, this.fragmentManager, shouldCleanCallCount)) {
                new AlertDialog.Builder(this.activity).setIcon(R.drawable.ic_logo).setTitle(2131165290).setMessage(R.string.facebook_dialog_message).setPositiveButton(R.string.facebook_dialog_button_ok, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        if (DailPadActivity.this.isWifiAvailable()) {
                            facebookShareActivity.promptShareToFacebookDialog(DailPadActivity.this.fragmentManager);
                        } else {
                            DailPadActivity.this.showDialog(1);
                        }
                    }
                }).setNegativeButton(R.string.facebook_dialog_button_never, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        DailPadActivity.this.ctx.getSharedPreferences(DailPadActivity.SHARE_PREF_TAG, 0).edit().putBoolean(DailPadActivity.NEVER_FACEBOOK_SHARE, true).commit();
                    }
                }).setNeutralButton(R.string.facebook_dialog_button_cancel, (DialogInterface.OnClickListener) null).create().show();
            }
        }
        shouldRunFacebookShareChecking = false;
    }

    private void setDialer(Uri uri) {
        setFormattedDigits(uri.getSchemeSpecificPart());
    }

    /* access modifiers changed from: private */
    public void setRoamSaveButtonClickable(boolean z) {
        this.mRoamSaveButton.setEnabled(z);
        this.mRoamSaveButton.setClickable(z);
        this.mRoamSaveButton.setSelected(false);
        this.mRoamSaveButton.setOnClickListener(z ? this.mRoamSaveButtonListener : null);
    }

    /* access modifiers changed from: private */
    public void setRoamSaveButtonEnable(boolean z) {
        this.mRoamSaveButton.setChecked(z);
        this.mBannerText.setVisibility(z ? 0 : 4);
    }

    /* access modifiers changed from: private */
    public void setRoamSaveButtonReAutoconnecting() {
        setRoamSaveButtonClickable(true);
        setRoamSaveButtonEnable(true);
        this.mRoamSaveButton.setSelected(true);
    }

    private void setupKeypad() {
        View findViewById = this.v.findViewById(R.id.one);
        findViewById.setOnClickListener(this);
        findViewById.setOnLongClickListener(this);
        this.v.findViewById(R.id.two).setOnClickListener(this);
        this.v.findViewById(R.id.three).setOnClickListener(this);
        this.v.findViewById(R.id.four).setOnClickListener(this);
        this.v.findViewById(R.id.five).setOnClickListener(this);
        this.v.findViewById(R.id.six).setOnClickListener(this);
        this.v.findViewById(R.id.seven).setOnClickListener(this);
        this.v.findViewById(R.id.eight).setOnClickListener(this);
        this.v.findViewById(R.id.nine).setOnClickListener(this);
        this.v.findViewById(R.id.star).setOnClickListener(this);
        View findViewById2 = this.v.findViewById(R.id.zero);
        findViewById2.setOnClickListener(this);
        findViewById2.setOnLongClickListener(this);
        this.v.findViewById(R.id.pound).setOnClickListener(this);
    }

    /* access modifiers changed from: private */
    public void showDialog(int i) {
        switch (i) {
            case 0:
                AlertDialog.Builder builder = new AlertDialog.Builder(this.activity);
                builder.setIcon(R.drawable.ic_logo).setTitle(2131165290);
                builder.setMessage(R.string.dynamic_reinvite_audio);
                builder.setNegativeButton(R.string.dynamic_reinvite_audio_cannel, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        DailPadActivity.this.timer.cancel();
                    }
                });
                builder.setPositiveButton(R.string.dynamic_reinvite_audio_ok, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        DailPadActivity.this.timer.cancel();
                        DailPadActivity.this.performCallWithAddress(DailPadActivity.this.dialOutNumber, false);
                    }
                });
                builder.setCancelable(false);
                builder.create().show();
                return;
            case 1:
                KKAlertDialogFragment newInstance = KKAlertDialogFragment.newInstance(1);
                newInstance.setTargetFragment(this, 1);
                newInstance.setMessage(getString(R.string.ask_wifi));
                newInstance.setPositiveButton(getString(R.string.go_to_wifi_setting));
                newInstance.setNegativeButton(getString(17039360));
                newInstance.setCancelable(false);
                newInstance.show(this.fragmentManager, "dialog");
                return;
            default:
                throw new IllegalArgumentException("unkown dialog id " + i);
        }
    }

    /* access modifiers changed from: private */
    public void startPreCallQI() {
        this.mPreCallQILayout.setVisibility(0);
        if (this.preCallQI != null) {
            this.preCallQI.startChecking();
        }
    }

    /* access modifiers changed from: private */
    public void stopPreCallQI() {
        this.preCallQI.stopChecking();
        this.mPreCallQILayout.setVisibility(4);
    }

    /* access modifiers changed from: private */
    public void updatePreCallQIStatus(String str) {
        if (!isAdded()) {
            return;
        }
        if (str.equals("GOOD")) {
            this.mPreCallQIStatus.setText(getString(R.string.pre_call_qi_status_good));
            this.mPreCallQIStatus.setTextColor(-16711936);
        } else if (str.equals("FAIR")) {
            this.mPreCallQIStatus.setText(getString(R.string.pre_call_qi_status_fair));
            this.mPreCallQIStatus.setTextColor(InputDeviceCompat.SOURCE_ANY);
        } else if (str.equals("BAD")) {
            this.mPreCallQIStatus.setText(getString(R.string.pre_call_qi_status_poor));
            this.mPreCallQIStatus.setTextColor(SupportMenu.CATEGORY_MASK);
        } else {
            this.mPreCallQIStatus.setText(getString(R.string.pre_call_qi_status_na));
            this.mPreCallQIStatus.setTextColor(ViewCompat.MEASURED_STATE_MASK);
        }
    }

    private void vibrate() {
        synchronized (this) {
            if (this.mVibrateOn) {
                if (this.mVibrator == null) {
                    this.mVibrator = (Vibrator) this.activity.getSystemService("vibrator");
                }
                this.mVibrator.vibrate(this.mVibratePattern, -1);
            }
        }
    }

    public void afterTextChanged(Editable editable) {
        if (handleChars(this.ctx, editable.toString(), this.sip_uri_box)) {
            this.sip_uri_box.getText().clear();
        }
    }

    public void callState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state, String str) {
        boolean z = false;
        if (state == LinphoneCall.State.Error) {
            if (str.contains("bearer capability not author")) {
                this.handler.post(new Runnable() {
                    public void run() {
                        DailPadActivity.this.showDialog(0);
                        CountDownTimer unused = DailPadActivity.this.timer = new CountDownTimer(SMSConstants.asyncTaskDownloadTimeLimit, 1000) {
                            public void onFinish() {
                                DailPadActivity.this.timer.cancel();
                            }

                            public void onTick(long j) {
                            }
                        }.start();
                    }
                });
            }
        } else if (state == LinphoneCall.State.CallEnd && !ClientStateManager.isCSL(this.ctx) && !this.ctx.getSharedPreferences(SHARE_PREF_TAG, 0).getBoolean(NEVER_FACEBOOK_SHARE, false)) {
            shouldRunFacebookShareChecking = true;
            if (linphoneCall.getDuration() < 60) {
                z = true;
            }
            shouldCleanCallCount = z;
        }
    }

    /* access modifiers changed from: package-private */
    public void call_menu() {
        String stripSeparators = PhoneNumberUtils.stripSeparators(this.sip_uri_box.getText().toString());
        if (this.m_AlertDlg != null) {
            this.m_AlertDlg.cancel();
        }
        if (call(stripSeparators)) {
            this.sip_uri_box.setText("");
            afterTextChanged(this.sip_uri_box.getText());
        }
    }

    public void contTurnOnRS() {
        if (!MobileSipService.getInstance().isNetworkAvailable(this.ctx)) {
            this.mBannerText.setVisibility(4);
            this.mBannerText.setText("");
            AlertDialog.Builder builder = new AlertDialog.Builder(this.activity);
            builder.setMessage(this.ctx.getString(R.string.ask_wifi)).setCancelable(false).setNegativeButton(this.ctx.getString(17039360), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    DailPadActivity.this.setRoamSaveButtonClickable(true);
                    DailPadActivity.this.setRoamSaveButtonEnable(false);
                    dialogInterface.cancel();
                }
            }).setNeutralButton(getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    DailPadActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                }
            });
            builder.create().show();
            return;
        }
        this.mBannerText.setVisibility(0);
        this.mBannerText.setText(this.ctx.getString(R.string.connecting) + "...");
        on(this.ctx, true);
        MobileSipService.getInstance().shouldRelogin = false;
        MobileSipService.getInstance().httpsLogin(this.ctx, new Handler(Looper.getMainLooper()));
    }

    public void doNegativeClick(int i) {
    }

    public void doNeutralClick(int i) {
    }

    public void doPositiveClick(int i) {
    }

    public void handIntent() {
        if (this.activity.isChild()) {
            handleIntent(this.activity.getParent().getIntent());
            return;
        }
        Intent intent = this.activity.getIntent();
        Uri data = intent.getData();
        if (data == null) {
            return;
        }
        if ("tel".equals(data.getScheme())) {
            setDialer(data);
        } else {
            handleIntent(intent);
        }
    }

    /* access modifiers changed from: protected */
    public void maybeAddNumberFormatting() {
        this.sip_uri_box.addTextChangedListener(new PhoneNumberFormattingTextWatcher());
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.one:
                playTone(1);
                keyPressed(8);
                return;
            case R.id.two:
                playTone(2);
                keyPressed(9);
                return;
            case R.id.three:
                playTone(3);
                keyPressed(10);
                return;
            case R.id.four:
                playTone(4);
                keyPressed(11);
                return;
            case R.id.five:
                playTone(5);
                keyPressed(12);
                return;
            case R.id.six:
                playTone(6);
                keyPressed(13);
                return;
            case R.id.seven:
                playTone(7);
                keyPressed(14);
                return;
            case R.id.eight:
                playTone(8);
                keyPressed(15);
                return;
            case R.id.nine:
                playTone(9);
                keyPressed(16);
                return;
            case R.id.star:
                playTone(10);
                keyPressed(17);
                return;
            case R.id.zero:
                playTone(0);
                keyPressed(7);
                return;
            case R.id.pound:
                playTone(11);
                keyPressed(18);
                return;
            case R.id.txt_callee:
                if (this.sip_uri_box.length() != 0) {
                    this.sip_uri_box.setCursorVisible(true);
                    return;
                }
                return;
            case R.id.deleteButton:
                keyPressed(67);
                return;
            case R.id.VideoCallBtn:
                performCall(true);
                return;
            case R.id.VoiceCallBtn:
                performCall(false);
                return;
            case R.id.VoiceMailBtn:
                callVoicemail();
                return;
            default:
                return;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.ctx = getActivity().getApplicationContext();
        this.activity = getActivity();
        this.fragmentManager = ((LinphoneActivity) this.activity).getSupportFragmentManager();
        theDailPad = this;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Log.v("KKUI", "DailPadActivity-onCreateView");
        ActionBar supportActionBar = ((ActionBarActivity) getActivity()).getSupportActionBar();
        supportActionBar.setDisplayOptions(16, 16);
        supportActionBar.setCustomView((int) R.layout.actionbar_dialer_custom_layout);
        supportActionBar.setHomeButtonEnabled(false);
        this.v = layoutInflater.inflate(R.layout.main_dial_new, viewGroup, false);
        try {
            Resources resources = getResources();
            this.mDigitsBackground = resources.getDrawable(R.drawable.btn_dial_textfield_active);
            this.mDigitsEmptyBackground = resources.getDrawable(R.drawable.btn_dial_textfield);
            this.sip_uri_box = (EditText) this.v.findViewById(R.id.txt_callee);
            this.sip_uri_box.setInputType(3);
            this.sip_uri_box.setOnClickListener(this);
            this.sip_uri_box.setOnKeyListener(this);
            this.sip_uri_box.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View view, MotionEvent motionEvent) {
                    int inputType = DailPadActivity.this.sip_uri_box.getInputType();
                    DailPadActivity.this.sip_uri_box.setInputType(0);
                    DailPadActivity.this.sip_uri_box.onTouchEvent(motionEvent);
                    DailPadActivity.this.sip_uri_box.setInputType(inputType);
                    return true;
                }
            });
            this.mBannerText = (TextView) supportActionBar.getCustomView().findViewById(R.id.dialpadBannerText);
            this.mPreCallQIStatus = (TextView) supportActionBar.getCustomView().findViewById(R.id.PreCallQIStatus);
            this.mPreCallQILayout = (LinearLayout) supportActionBar.getCustomView().findViewById(R.id.PreCallQILayout);
            this.mRoamSaveButton = (CheckBox) supportActionBar.getCustomView().findViewById(R.id.dialpadBannerOnOffButton);
            this.mRoamSaveButtonListener = new RoamSaveButtonListener();
            this.mRoamSaveButton.setOnClickListener(this.mRoamSaveButtonListener);
            if (this.v.findViewById(R.id.one) != null) {
                setupKeypad();
            }
            this.mDelete = (ImageButton) this.v.findViewById(R.id.deleteButton);
            this.mDelete.setOnClickListener(this);
            this.mDelete.setOnLongClickListener(this);
            this.mDialButton = (ImageButton) this.v.findViewById(R.id.VoiceCallBtn);
            this.mDialButton.setOnClickListener(this);
            this.mVideocallButton = (ImageButton) this.v.findViewById(R.id.VideoCallBtn);
            if (BandwidthManager.isRoamSaveVideoEnable()) {
                this.mVideocallButton.setOnClickListener(this);
            } else {
                this.mVideocallButton.setClickable(false);
                this.mVideocallButton.setImageResource(R.drawable.btn_video_call_disabled);
            }
            this.mVoicemailButton = (ImageButton) this.v.findViewById(R.id.VoiceMailBtn);
            this.mVoicemailButton.setOnClickListener(this);
            this.mPref = PreferenceManager.getDefaultSharedPreferences(this.ctx);
            this.preCallQI = new PreCallQualityIndicator(this.ctx, this.preCallQIHandler);
        } catch (NullPointerException e) {
        }
        return this.v;
    }

    public void onDestroy() {
        this.isWaitingWifiFinish = true;
        if (this.waitingWifiThr != null) {
            this.waitingWifiThr.interrupt();
            this.waitingWifiThr = null;
        }
        super.onDestroy();
        theDailPad = null;
    }

    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        switch (view.getId()) {
            case R.id.digits:
                if (i == 66) {
                    call_menu();
                    return true;
                }
                break;
        }
        return false;
    }

    public boolean onLongClick(View view) {
        Editable text = this.sip_uri_box.getText();
        switch (view.getId()) {
            case R.id.one:
                if (text.length() != 0) {
                    return false;
                }
                callVoicemail();
                return true;
            case R.id.zero:
                keyPressed(81);
                return true;
            case R.id.deleteButton:
                text.clear();
                afterTextChanged(this.sip_uri_box.getText());
                this.mDelete.setPressed(false);
                return true;
            default:
                return false;
        }
    }

    public void onPause() {
        super.onPause();
        pausePreCallQI();
        if (this.mConnectionChangeReceiver != null) {
            this.ctx.unregisterReceiver(this.mConnectionChangeReceiver);
            this.mConnectionChangeReceiver = null;
        }
    }

    public void onResume() {
        String str;
        Uri andClearDialUri;
        boolean z = false;
        super.onResume();
        if (Settings.System.getInt(this.ctx.getContentResolver(), "dtmf_tone", 1) == 1) {
            z = true;
        }
        this.mDTMFToneEnabled = z;
        synchronized (this.mToneGeneratorLock) {
            if (this.mToneGenerator == null) {
                try {
                    this.mToneGenerator = new ToneGenerator(3, 80);
                    this.activity.setVolumeControlStream(3);
                } catch (RuntimeException e) {
                    this.mToneGenerator = null;
                }
            }
        }
        if (this.activity != null && (this.activity instanceof LinphoneActivity) && (andClearDialUri = ((LinphoneActivity) this.activity).getAndClearDialUri()) != null && "tel".equals(andClearDialUri.getScheme())) {
            setDialer(andClearDialUri);
        }
        try {
            if (MobileSipService.getInstance().isReLoginRunning()) {
                setRoamSaveButtonReAutoconnecting();
                this.mBannerText.setText(getString(R.string.reg_reconnecting));
                this.mBannerText.setVisibility(0);
                this.mPreCallQILayout.setVisibility(4);
            } else if (MobileSipService.getInstance().isAutoLoginRunning()) {
                setRoamSaveButtonReAutoconnecting();
                this.mBannerText.setText(getString(R.string.reg_autoconnecting));
                this.mBannerText.setVisibility(0);
                this.mPreCallQILayout.setVisibility(4);
            } else if (MobileSipService.getInstance().isLoginRunning()) {
                this.mRoamSaveButton.setChecked(true);
                setRoamSaveButtonClickable(false);
                this.mBannerText.setText(getString(R.string.connecting) + "...");
                this.mBannerText.setVisibility(0);
                this.mPreCallQILayout.setVisibility(4);
            } else if (MobileSipService.getInstance().isDisconnecting()) {
                setRoamSaveButtonEnable(false);
                setRoamSaveButtonClickable(false);
            } else if (MobileSipService.getInstance().loginStatus == 0) {
                this.mRoamSaveButton.setChecked(true);
                setRoamSaveButtonClickable(MobileSipService.getInstance().isPhoneCallReady());
                String phone = ClientStateManager.getPhone(this.ctx);
                TextView textView = this.mBannerText;
                if (MobileSipService.getInstance().isPhoneCallReady()) {
                    StringBuilder append = new StringBuilder().append(getString(R.string.banner_text));
                    if (phone == null || !StringUtils.isBlank(phone)) {
                    }
                    str = append.append("").toString();
                } else {
                    str = getString(R.string.connecting) + "...";
                }
                textView.setText(str);
                this.mBannerText.setVisibility(0);
                this.mPreCallQILayout.setVisibility(0);
                resumePreCallQI();
            } else {
                setRoamSaveButtonEnable(false);
                setRoamSaveButtonClickable(true);
            }
            if (ClientStateManager.isRegisteredPrepaid(this.ctx)) {
                if (MobileSipService.getInstance().isNeedPrepaidTopUpReminderCheck()) {
                    new PrepaidTopupReminderThread().execute(new Void[0]);
                }
                MobileSipService.getInstance().setNeedPrepaidTopUpReminderCheck(false);
            }
        } catch (NullPointerException e2) {
        }
        this.mConnectionChangeReceiver = new ConnectionChangeReceiver();
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(Constants.INTENT_ALERT_LOGIN_DISCONNECTED);
        intentFilter.addAction(Constants.INTENT_ALERT_LOGIN_DISCONNECTING);
        intentFilter.addAction(Constants.INTENT_ALERT_CALLFORWARD_SUCCEED);
        intentFilter.addAction(Constants.INTENT_ALERT_LOGIN_FINISHED);
        intentFilter.addAction(Constants.INTENT_ALERT_RELOGIN_PROCESSING);
        intentFilter.addAction(Constants.INTENT_ALERT_AUTOLOGIN_PROCESSING);
        this.ctx.registerReceiver(this.mConnectionChangeReceiver, intentFilter);
        runFacebookShareChecking();
    }

    /* access modifiers changed from: package-private */
    public void playTone(int i) {
        int ringerMode;
        if (this.mDTMFToneEnabled && (ringerMode = ((AudioManager) this.ctx.getSystemService("audio")).getRingerMode()) != 0 && ringerMode != 1) {
            synchronized (this.mToneGeneratorLock) {
                if (this.mToneGenerator != null) {
                    this.mToneGenerator.startTone(i);
                    this.handler.removeMessages(0);
                    this.handler.sendEmptyMessageDelayed(0, 150);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void setFormattedDigits(String str) {
        String formatNumber = PhoneNumberUtils.formatNumber(PhoneNumberUtils.extractNetworkPortion(str));
        if (!TextUtils.isEmpty(formatNumber)) {
            Editable text = this.sip_uri_box.getText();
            text.replace(0, text.length(), formatNumber);
            afterTextChanged(text);
        }
    }
}
