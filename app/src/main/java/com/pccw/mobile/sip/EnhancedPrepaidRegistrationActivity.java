package com.pccw.mobile.sip;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.PhoneNumberUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.pccw.mobile.server.CheckNumberTypeApi;
import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.response.CheckNumberTypeResponse;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip02.R;
import com.pccw.mobile.util.ErrorMsgUtil;
import java.util.Locale;

public class EnhancedPrepaidRegistrationActivity extends BaseActivity implements View.OnClickListener {
    private static final int MIN_PHONE_NUMBER_LENGTH = 8;
    private final int CODE_2N_ESHOP = 4;
    private final int CODE_2N_FREE_TRIAL_AVAILABLE = 3;
    private final int CODE_2N_NOT_ALLOW = -13;
    private final int CODE_2N_PURCHASED_VIRTUAL_NUMBER = -8;
    private final int CODE_2N_VIRTUAL_NUMBER_SUCCESS = 3;
    private final int CODE_CSL_PREPAID_NOT_ALLOW = -15;
    private final int CODE_CSL_PREPAID_SUCCESS = 5;
    private final int CODE_EMPTY_PREPAID_NO = -1;
    private final int CODE_GETNUMBERTYPE_API_2N_MATCHING_ERROR = -12;
    private final int CODE_GETNUMBERTYPE_API_FAIL_TO_CALL = -11;
    private final int CODE_GETNUMBERTYPE_API_OTHER_ERROR = -99;
    private final int CODE_GETNUMBERTYPE_API_RETURNED_ERROR = -10;
    private final int CODE_HELLO_PREPAID_SUCCESS = 1;
    private final int CODE_INVALID_PREPAID_CARD_INACTIVE = -5;
    private final int CODE_INVALID_PREPAID_CARD_STATE = -6;
    private final int CODE_INVALID_VIRTUAL_NUMBER_INACTIVE = -7;
    private final int CODE_NETWORK_ERROR = -3;
    private final int CODE_NORMAL_PREPAID_SUCCESS = 0;
    private final int CODE_NO_WIFI = -4;
    private final int CODE_POSTPAID_SUCCESS = 2;
    private final int CODE_REAL_PREPAID_NOT_ALLOW = -14;
    private final int CODE_UNKNOWN_PREPAID_NOT_ALLOW = -16;
    /* access modifiers changed from: private */
    public CheckNumberTypeResponse checkNumberTypeResponse = null;
    private String getVirtualNumberUrl = "";
    private boolean isFreeTrialPromtionPeriod = false;
    private AlertDialog loadingDialog = null;
    private Button mCancel;
    /* access modifiers changed from: private */
    public EditText mPhone;
    /* access modifiers changed from: private */
    public Button mSubmit;
    public ServerMessageController messageController = null;
    private String msisdn = null;
    private int resultCode;
    private String resultMsg = null;

    private void afterApiRequest() {
        if (this.loadingDialog.isShowing()) {
            this.loadingDialog.dismiss();
        }
        if (this.resultCode == 0) {
            gotoConfirmRegistrationActivity(this.msisdn, false, 3);
        } else if (this.resultCode == 1) {
            gotoConfirmRegistrationActivity(this.msisdn, false, 4);
        } else if (this.resultCode == 5) {
            gotoConfirmRegistrationActivity(this.msisdn, false, 7);
        } else if (this.resultCode == 3) {
            gotoConfirmRegistrationActivity(this.msisdn, true, 3);
        } else if (this.resultCode != 4) {
            final String str = this.resultMsg;
            Log.i("chen", "errMsg = " + str);
            runOnUiThread(new Runnable() {
                public void run() {
                    AlertDialog.Builder builder = new AlertDialog.Builder(EnhancedPrepaidRegistrationActivity.this);
                    builder.setIcon(R.drawable.ic_logo).setTitle(R.string.app_name).setMessage(str);
                    builder.setNeutralButton(android.R.string.ok, (DialogInterface.OnClickListener) null);
                    builder.create().show();
                    EnhancedPrepaidRegistrationActivity.this.mPhone.setEnabled(true);
                    EnhancedPrepaidRegistrationActivity.this.mSubmit.setEnabled(true);
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void dealWithResponseFailed() {
        this.resultMsg = ErrorMsgUtil.getLocalErrorMsg("get_number_info_error_", this.checkNumberTypeResponse == null ? "99" : this.checkNumberTypeResponse.resultcode, getApplicationContext());
        this.resultCode = -10;
        afterApiRequest();
    }

    /* access modifiers changed from: private */
    public void dealWithResponseSuccessfully() {
        if (this.checkNumberTypeResponse.simType.equalsIgnoreCase(Constants.GET_NUMBER_INFO_SIMTYPE_POSTPAID)) {
            this.resultCode = 2;
            this.resultMsg = getString(R.string.prepaid_message_postpaid_number);
        }
        if (this.checkNumberTypeResponse.simType.equalsIgnoreCase(Constants.GET_NUMBER_INFO_SIMTYPE_PREPAID)) {
            if (!this.checkNumberTypeResponse.isFreeTrial.equalsIgnoreCase("true")) {
                this.resultCode = -14;
                this.resultMsg = getString(R.string.get_number_info_prepaid);
            } else if (!this.checkNumberTypeResponse.allowRS.equalsIgnoreCase("true")) {
                this.resultCode = -6;
                this.resultMsg = getString(R.string.get_number_info_not_allow_RS);
            } else if (!this.checkNumberTypeResponse.status.equalsIgnoreCase("active")) {
                this.resultCode = -5;
                if (this.checkNumberTypeResponse.status.equalsIgnoreCase(Constants.GET_NUMBER_INFO_STATUS_IDLE)) {
                    this.resultMsg = getString(R.string.get_number_info_prepaid_card_not_active);
                } else {
                    this.resultMsg = getString(R.string.get_number_info_prepaid_card_expired);
                }
            } else if (this.checkNumberTypeResponse.simClass.equalsIgnoreCase(Constants.GET_NUMBER_INFO_CLASS_HELLO_PREPAID)) {
                this.resultCode = 1;
                if (this.msisdn.startsWith("+852")) {
                    this.msisdn = this.msisdn.substring(4);
                }
            } else if (this.checkNumberTypeResponse.simClass.equalsIgnoreCase(Constants.GET_NUMBER_INFO_CLASS_NORMAL_PREPAID)) {
                this.resultCode = 0;
                if (this.msisdn.startsWith("+852")) {
                    this.msisdn = this.msisdn.substring(4);
                }
            } else if (this.checkNumberTypeResponse.simClass.equalsIgnoreCase("csl")) {
                this.resultCode = 5;
                if (this.msisdn.startsWith("+852")) {
                    this.msisdn = this.msisdn.substring(4);
                }
            } else {
                this.resultCode = -16;
                this.resultMsg = ErrorMsgUtil.getLocalErrorMsg("get_number_info_unknown_prepaid", "", getApplicationContext());
            }
        } else if (this.checkNumberTypeResponse.simType.equalsIgnoreCase(Constants.GET_NUMBER_INFO_SIMTYPE_2N)) {
            this.resultCode = -13;
            this.resultMsg = getString(R.string.prepaid_message_2n_number);
        }
        afterApiRequest();
    }

    private String getLang() {
        Locale locale = Locale.getDefault();
        return "zh".equals(locale.getLanguage()) ? ("HK".equals(locale.getCountry()) || "TW".equals(locale.getCountry())) ? Constants.GET_LANG_TRADITIONAL_CHINESE : Constants.GET_LANG_ENGLISH : Constants.GET_LANG_ENGLISH;
    }

    private void getNumberType() {
        this.msisdn = this.mPhone.getText().toString().trim();
        this.msisdn = PhoneNumberUtils.stripSeparators(this.msisdn);
        if (this.msisdn == null || !isValidInput(this.msisdn)) {
            this.resultCode = -1;
            this.resultMsg = getString(R.string.prepaid_message_empty_number);
        }
        new CheckNumberTypeApi(new ApiResponseListener() {
            public void onResponseFailed() {
                CheckNumberTypeResponse unused = EnhancedPrepaidRegistrationActivity.this.checkNumberTypeResponse = null;
                EnhancedPrepaidRegistrationActivity.this.dealWithResponseFailed();
            }

            public void onResponseSuccess(ApiResponse apiResponse) {
                CheckNumberTypeResponse unused = EnhancedPrepaidRegistrationActivity.this.checkNumberTypeResponse = (CheckNumberTypeResponse) apiResponse;
                if (EnhancedPrepaidRegistrationActivity.this.checkNumberTypeResponse == null || !EnhancedPrepaidRegistrationActivity.this.checkNumberTypeResponse.resultcode.equals("0")) {
                    EnhancedPrepaidRegistrationActivity.this.dealWithResponseFailed();
                } else {
                    EnhancedPrepaidRegistrationActivity.this.dealWithResponseSuccessfully();
                }
            }
        }, this, "", this.msisdn).execute(new String[]{""});
    }

    private void gotoConfirmRegistrationActivity(String str, boolean z, int i) {
        if (this.loadingDialog != null && this.loadingDialog.isShowing()) {
            this.loadingDialog.dismiss();
        }
        Intent intent = new Intent(getApplicationContext(), ConfirmRegistrationActivity.class);
        intent.putExtra("msisdn", str);
        intent.putExtra(Constants.CONFIRM_REG_IS_FREE_TRIAL_KEY, z);
        intent.putExtra(Constants.CONFIRM_NUMBER_TYPE, i);
        startActivity(intent);
        if (!isFinishing()) {
            finish();
        }
    }

    private boolean isValidInput(String str) {
        if (str.startsWith("+")) {
            str = str.substring(1);
        }
        return str.matches("^[0-9]*$") && str.length() >= 8;
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        Log.d("", "");
        return super.dispatchKeyEvent(keyEvent);
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.enhanced_prepaid_registration_submit_button /*2131624251*/:
                ((InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(this.mPhone.getWindowToken(), 0);
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle(getString(R.string.app_name));
                builder.setIcon(R.drawable.ic_logo);
                builder.setMessage(getString(R.string.loading));
                this.loadingDialog = builder.create();
                this.loadingDialog.setCancelable(false);
                this.loadingDialog.setCanceledOnTouchOutside(false);
                this.mPhone.setEnabled(false);
                this.mSubmit.setEnabled(false);
                this.loadingDialog.show();
                getNumberType();
                return;
            case R.id.enhanced_prepaid_registration_cancel_button /*2131624252*/:
                if (!isFinishing()) {
                    finish();
                    return;
                }
                return;
            default:
                return;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.enhanced_prepaid_registration);
        this.mPhone = (EditText) findViewById(R.id.enhanced_prepaid_registration_msisdn_input);
        this.mSubmit = (Button) findViewById(R.id.enhanced_prepaid_registration_submit_button);
        this.mSubmit.setOnClickListener(this);
        this.mCancel = (Button) findViewById(R.id.enhanced_prepaid_registration_cancel_button);
        this.mCancel.setOnClickListener(this);
        this.mCancel.setVisibility(View.GONE);
        this.messageController = MobileSipService.getInstance().messageController;
        this.mPhone.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
                if (i != 0 || keyEvent.getKeyCode() != 66) {
                    return false;
                }
                ((InputMethodManager) EnhancedPrepaidRegistrationActivity.this.getSystemService(Context.INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(EnhancedPrepaidRegistrationActivity.this.mPhone.getApplicationWindowToken(), 0);
                return true;
            }
        });
    }

    public void onPause() {
        super.onPause();
        if (this.loadingDialog != null && this.loadingDialog.isShowing()) {
            this.loadingDialog.dismiss();
        }
        ((InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(this.mPhone.getWindowToken(), 0);
    }

    public void onResume() {
        super.onResume();
        if (!CheckVersionActivity.canSkipCheckVersion(getApplicationContext())) {
            startActivity(new Intent(this, CheckVersionActivity.class));
            finish();
        }
    }
}
