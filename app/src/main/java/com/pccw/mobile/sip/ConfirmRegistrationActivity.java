package com.pccw.mobile.sip;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.telephony.PhoneNumberUtils;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.pccw.mobile.server.ConfirmRegistrationApi;
import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.response.ConfirmRegistrationResponse;
import com.pccw.mobile.server.response.IMRegistrationResponse;
import com.pccw.mobile.sip02.R;

public class ConfirmRegistrationActivity extends BaseActivity implements View.OnClickListener {
    private final int CODE_COMFIRM_REGISTRATION_INACTIVE_PREPAID_CARD = 3;
    private final int CODE_COMFIRM_REGISTRATION_PASSWORD_DEVICEID_AUTH_FAIL = 1;
    private final int CODE_COMFIRM_REGISTRATION_PREPAID_ACTIVATION_FAIL = 4;
    private final int CODE_COMNFIRM_REGISTRATION_API_RETURNED_ERROR = -99;
    private final int CODE_EMPTY_PASSWORD = -2;
    private final int CODE_NETWORK_ERROR = -3;
    private final int CODE_SUCCESS = 0;
    private String activateFirstTime = null;
    private AlertDialog activationDialog = null;
    ConfirmRegistrationResponse confirmRegistrationResponse;
    IMRegistrationResponse imRegResponse = null;
    private String inputMsisdn;
    private AlertDialog loadingDialog = null;
    /* access modifiers changed from: private */
    public Button mCancel;
    /* access modifiers changed from: private */
    public EditText mPassword;
    private TextView mRemindGetPWTV;
    /* access modifiers changed from: private */
    public Button mSubmit;
    private TextView mTextView;
    private String msisdn = null;
    private int numType = 3;
    private String password = null;
    private int resultCode;
    private String resultMsg = null;

    private void afterApiRequest() {
        if (this.loadingDialog.isShowing()) {
            this.loadingDialog.dismiss();
        }
        if (this.resultCode == 0) {
            savePrepaidClientAccountInfo();
            ClientStateManager.setPostpaidPrepaidMode(this, this.numType);
            if (this.activateFirstTime == null || !this.activateFirstTime.equalsIgnoreCase(Constants.CONFIRM_REG_ACTIVATION_FIRST_TIME)) {
                gotoNextActivity();
                return;
            }
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setMessage(getApplicationContext().getString(R.string.confirm_registration_first_time_activation_success)).setCancelable(false).setNeutralButton(getApplicationContext().getString(android.R.string.ok), new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    ConfirmRegistrationActivity.this.gotoNextActivity();
                    dialogInterface.cancel();
                }
            });
            this.activationDialog = builder.create();
            this.activationDialog.show();
            return;
        }
        final String str = this.resultMsg;
        runOnUiThread(new Runnable() {
            public void run() {
                AlertDialog.Builder builder = new AlertDialog.Builder(ConfirmRegistrationActivity.this);
                builder.setIcon(R.drawable.ic_logo).setTitle(R.string.app_name).setMessage(str);
                AlertDialog create = builder.create();
                ConfirmRegistrationActivity.this.mPassword.setEnabled(true);
                ConfirmRegistrationActivity.this.mSubmit.setEnabled(true);
                ConfirmRegistrationActivity.this.mCancel.setEnabled(true);
                create.show();
            }
        });
    }

    /* access modifiers changed from: private */
    public void dealWithResponseFailed() {
        if (this.confirmRegistrationResponse == null) {
            this.resultCode = -3;
            this.resultMsg = getString(R.string.network_error);
        }
        afterApiRequest();
    }

    /* access modifiers changed from: private */
    public void dealWithResponseSuccessfully() {
        if (this.confirmRegistrationResponse.resultcode.equals("1")) {
            this.resultCode = 1;
            this.resultMsg = getString(R.string.confirm_registration_error_1);
        }
        if (this.confirmRegistrationResponse.resultcode.equals("3")) {
            this.resultCode = 3;
            this.resultMsg = getString(R.string.confirm_registration_error_3);
        }
        if (this.confirmRegistrationResponse.resultcode.equals("4")) {
            this.resultCode = 4;
            this.resultMsg = getString(R.string.confirm_registration_error_4);
        }
        if (!this.confirmRegistrationResponse.resultcode.equals("0")) {
            this.resultCode = -99;
            this.resultMsg = getString(R.string.confirm_registration_error_99);
        } else {
            this.resultCode = 0;
            if (this.confirmRegistrationResponse.activateFirstTime != null) {
                this.activateFirstTime = this.confirmRegistrationResponse.activateFirstTime;
            }
        }
        afterApiRequest();
    }

    /* access modifiers changed from: private */
    public void gotoNextActivity() {
        if (this.loadingDialog != null && this.loadingDialog.isShowing()) {
            this.loadingDialog.dismiss();
        }
        startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
        if (!isFinishing()) {
            finish();
        }
    }

    private void prepaidRegistrationSubmit() {
        this.msisdn = this.inputMsisdn;
        this.password = this.mPassword.getText().toString().trim();
        this.msisdn = PhoneNumberUtils.stripSeparators(this.msisdn);
        if (this.password == null || this.password.length() == 0) {
            this.resultCode = -2;
            this.resultMsg = getString(R.string.confirm_registration_empty_password);
        }
        new ConfirmRegistrationApi(new ApiResponseListener() {
            public void onResponseFailed() {
                ConfirmRegistrationActivity.this.confirmRegistrationResponse = null;
                ConfirmRegistrationActivity.this.dealWithResponseFailed();
            }

            public void onResponseSuccess(ApiResponse apiResponse) {
                ConfirmRegistrationActivity.this.confirmRegistrationResponse = (ConfirmRegistrationResponse) apiResponse;
                if (ConfirmRegistrationActivity.this.confirmRegistrationResponse == null) {
                    ConfirmRegistrationActivity.this.dealWithResponseFailed();
                } else {
                    ConfirmRegistrationActivity.this.dealWithResponseSuccessfully();
                }
            }
        }, this, this.msisdn, this.password).execute(new String[]{""});
    }

    private void savePrepaidClientAccountInfo() {
        ClientStateManager.setRegisteredPrepaid(this);
        ClientStateManager.setRegisteredNumber(this, this.msisdn);
        ClientStateManager.setRegisteredPrepaidNumberPassword(this, this.password);
        if (ClientStateManager.isGoingToResetPrepaidAccount(getApplicationContext())) {
            ClientStateManager.setIsGoingToResetPrepaidAccount(getApplicationContext(), false);
        }
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.confirm_registration_submit_button /*2131624210*/:
                Log.v(Constants.LOG_TAG_DEV, "Submit btn clicked");
                ((InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(this.mPassword.getWindowToken(), 0);
                AlertDialog.Builder builder = new AlertDialog.Builder(this);
                builder.setTitle(getString(R.string.app_name));
                builder.setIcon(R.drawable.ic_logo);
                builder.setMessage(getString(R.string.loading));
                this.loadingDialog = builder.create();
                this.loadingDialog.setCancelable(false);
                this.loadingDialog.setCanceledOnTouchOutside(false);
                this.mPassword.setEnabled(false);
                this.mSubmit.setEnabled(false);
                this.mCancel.setEnabled(false);
                this.loadingDialog.show();
                prepaidRegistrationSubmit();
                return;
            case R.id.confirm_registration_cancel_button /*2131624211*/:
                Log.v(Constants.LOG_TAG_DEV, "Back btn clicked, go back to registration activity");
                startActivity(new Intent(getApplicationContext(), EnhancedPrepaidRegistrationActivity.class));
                finish();
                return;
            default:
                return;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle extras = getIntent().getExtras();
        this.inputMsisdn = extras.getString("msisdn");
        boolean z = extras.getBoolean(Constants.CONFIRM_REG_IS_FREE_TRIAL_KEY, false);
        this.numType = extras.getInt(Constants.CONFIRM_NUMBER_TYPE, 3);
        String replaceAll = z ? getString(R.string.confirm_registration_free_trial_notice).replaceAll("MSISDN_VALUE", this.inputMsisdn) : getString(R.string.confirm_registration_prepaid_notice);
        setContentView(R.layout.confirm_registration);
        this.mTextView = (TextView) findViewById(R.id.confirm_registration_notice_textview);
        this.mTextView.setText(replaceAll);
        this.mRemindGetPWTV = (TextView) findViewById(R.id.confirm_registration_get_password_remind);
        this.mRemindGetPWTV.setVisibility(z ? View.GONE : View.VISIBLE);
        this.mPassword = (EditText) findViewById(R.id.confirm_registration_password_edittext);
        this.mSubmit = (Button) findViewById(R.id.confirm_registration_submit_button);
        this.mSubmit.setOnClickListener(this);
        this.mCancel = (Button) findViewById(R.id.confirm_registration_cancel_button);
        this.mCancel.setOnClickListener(this);
    }

    public void onPause() {
        super.onPause();
        if (this.loadingDialog != null && this.loadingDialog.isShowing()) {
            this.loadingDialog.dismiss();
        }
        if (this.activationDialog != null && this.activationDialog.isShowing()) {
            this.activationDialog.dismiss();
            this.mPassword.setText("");
            this.mPassword.clearFocus();
            this.mPassword.setEnabled(true);
            this.mSubmit.setEnabled(true);
            this.mCancel.setEnabled(true);
        }
    }

    public void onResume() {
        super.onResume();
        if (ClientStateManager.isRegisteredPrepaid(this)) {
            gotoNextActivity();
        }
    }
}
