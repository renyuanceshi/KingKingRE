package com.pccw.mobile.sip;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.provider.ContactsContract;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckedTextView;
import android.widget.TextView;

import com.pccw.mobile.fragment.AutoLoginListFragment;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip02.R;

import org.apache.commons.lang3.StringUtils;

public class MoreActivity extends Fragment implements View.OnClickListener {
    public static final boolean DEFAULT_SCREEN = false;
    private static AlertDialog DlgAbout = null;
    public static final String PREF_SCREEN = "PREF_SCREEN";
    private static AlertDialog noWiFiDialog;
    private TextView aboutTextView;
    private TextView accountBalanceTextView;
    FragmentActivity activity;
    private TextView autoLoginTextView;
    private TextView checkBalanceNotic;
    private View checkBalanceNoticBar;
    Context ctx;
    private TextView facebookLogoutTextView;
    private View facebookShareBar;
    private TextView facebookShareTextView;
    private TextView faqTextView;
    private View ilbcCodecsBar;
    private CheckedTextView ilbcCodecsCheckedTextView;
    private boolean isRunningCheckBalanceTread;
    private TextView mobileNumberTextView;
    private CheckedTextView screenCheckedTextView;
    private View smsInviteBar;
    private TextView smsInviteTextView;
    private Button switchAccountButton;
    private TextView topupByCallingTextView;
    private TextView topupOnlineTextView;
    private TextView updateTimeTextView;
    private TextView userGuideTextView;

    private static String getVersion(Context context) {
        if (context == null) {
            //return AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN;
            return new String();
        }
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
//            return AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN;
            return new String();
        }
    }

    private void showAlertDialog(String str) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this.activity);
        builder.setIcon(R.drawable.ic_logo).setTitle(R.string.app_name);
        builder.setMessage(str).setCancelable(false).setNeutralButton(this.ctx.getString(android.R.string.ok), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }
        });
        builder.create().show();
    }

    public void onClick(View view) {
        boolean z = false;
        if (view == this.aboutTextView) {
            if (DlgAbout != null) {
                DlgAbout.cancel();
            }
            View inflate = LayoutInflater.from(this.ctx).inflate(R.layout.morefragment_about_dialog, (ViewGroup) null);
            DlgAbout = new AlertDialog.Builder(this.activity).setView(inflate).setTitle(getString(R.string.menu_about)).setPositiveButton(getString(android.R.string.ok), (DialogInterface.OnClickListener) null).setCancelable(true).show();
            ((TextView) inflate.findViewById(R.id.current_version)).setText(getString(R.string.about).replace("\\n", StringUtils.LF).replace("${VERSION}", getVersion(this.ctx)));
        } else if (view == this.userGuideTextView) {
            if (noWiFiDialog != null && noWiFiDialog.isShowing()) {
                noWiFiDialog.cancel();
            }
            if (MobileSipService.getInstance().isNetworkAvailable(this.ctx)) {
                Intent intent = new Intent(this.ctx, WebViewActivity.class);
                intent.putExtra(WebViewActivity.TYPE, 0);
                startActivity(intent);
            } else if (noWiFiDialog != null) {
                noWiFiDialog.show();
            } else {
                noWiFiDialog = (AlertDialog) onCreateNoWiFiDialog();
                noWiFiDialog.show();
            }
        } else if (view == this.faqTextView) {
            if (noWiFiDialog != null && noWiFiDialog.isShowing()) {
                noWiFiDialog.cancel();
            }
            if (MobileSipService.getInstance().isNetworkAvailable(this.ctx)) {
                Intent intent2 = new Intent(this.ctx, WebViewActivity.class);
                intent2.putExtra(WebViewActivity.TYPE, 1);
                startActivity(intent2);
            } else if (noWiFiDialog != null) {
                noWiFiDialog.show();
            } else {
                noWiFiDialog = (AlertDialog) onCreateNoWiFiDialog();
                noWiFiDialog.show();
            }
        }
        else if (view == this.screenCheckedTextView) {
            this.screenCheckedTextView.toggle();
            PreferenceManager.getDefaultSharedPreferences(this.ctx).edit().putBoolean(PREF_SCREEN, this.screenCheckedTextView.isChecked()).commit();
        } else if (view == this.ilbcCodecsCheckedTextView) {
            this.ilbcCodecsCheckedTextView.toggle();
            MobileSipService.getInstance().enableDisableAudioCodec(this.ctx, R.string.pref_codec_ilbc_key, this.ilbcCodecsCheckedTextView.isChecked());
            MobileSipService instance = MobileSipService.getInstance();
            Context context = this.ctx;
            if (!this.ilbcCodecsCheckedTextView.isChecked()) {
                z = true;
            }
            instance.enableDisableAudioCodec(context, R.string.pref_codec_pcmu_key, z);
        } else if (view == this.switchAccountButton) {
            new AlertDialog.Builder(this.ctx).setIcon(R.drawable.ic_logo).setTitle(R.string.app_name).setMessage(R.string.confirm_switch_account).setCancelable(true).setPositiveButton(R.string.yes, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.dismiss();
                    if (MobileSipService.getInstance().loginStatus == 0) {
                        MobileSipService.getInstance().close(MoreActivity.this.ctx);
                    }
                    ClientStateManager.setJustSwitchAccount(MoreActivity.this.ctx);
                    MoreActivity.this.startActivity(new Intent(MoreActivity.this.ctx, TAndCActivity.class));
                    MoreActivity.this.activity.finish();
                }
            }).setNegativeButton(R.string.no, new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    dialogInterface.dismiss();
                }
            }).show();
        }
//        else if (view == this.facebookShareTextView) {
//            if (noWiFiDialog != null && noWiFiDialog.isShowing()) {
//                noWiFiDialog.cancel();
//            }
//            if (MobileSipService.getInstance().isNetworkAvailable(this.ctx)) {
//                new FacebookShareActivity().promptShareToFacebookDialog(this.activity.getSupportFragmentManager());
//            } else if (noWiFiDialog != null) {
//                noWiFiDialog.show();
//            } else {
//                noWiFiDialog = (AlertDialog) onCreateNoWiFiDialog();
//                noWiFiDialog.show();
//            }
//        } else if (view == this.facebookLogoutTextView) {
//        }
        else {
            if (view == this.smsInviteTextView) {
                if (noWiFiDialog != null && noWiFiDialog.isShowing()) {
                    noWiFiDialog.cancel();
                }
                if (!MobileSipService.getInstance().isNetworkAvailable(this.ctx)) {
                    if (noWiFiDialog != null) {
                        noWiFiDialog.show();
                        return;
                    }
                    noWiFiDialog = (AlertDialog) onCreateNoWiFiDialog();
                    noWiFiDialog.show();
                } else if (this.activity.managedQuery(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, (String[]) null, (String) null, (String[]) null, (String) null).getCount() != 0) {
                    SMSInviteActivity.newInstance(1).show(this.activity.getSupportFragmentManager(), "smssharedialog");
                } else {
                    showAlertDialog(getString(R.string.sms_notice_nocontacts));
                }
            } else if (view == this.autoLoginTextView) {
                AutoLoginListFragment.newInstance(1).show(this.activity.getSupportFragmentManager(), "autologindialog");
            } else if (view == this.topupOnlineTextView) {
                if (!MobileSipService.getInstance().isNetworkAvailable(this.ctx)) {
                    onCreateNoWiFiDialog();
                } else if (MobileSipService.getInstance().loginStatus != 0) {
                    showAlertDialog(getString(R.string.no_network));
                } else {
                    startActivity(new Intent("android.intent.action.VIEW", Uri.parse(MobileSipService.getInstance().generateTopupURL(this.ctx))));
                }
            } else if (view != this.topupByCallingTextView) {
            } else {
                if (!MobileSipService.getInstance().isNetworkAvailable(this.ctx)) {
                    onCreateNoWiFiDialog();
                } else if (MobileSipService.getInstance().loginStatus != 0) {
                    showAlertDialog(getString(R.string.no_network));
                } else {
                    String str = "";
                    if (ClientStateManager.isHelloPrepaid(this.ctx)) {
                        str = Constants.HELLO_PREPAID_TOPUP_NUM;
                    } else if (ClientStateManager.isNormalPrepaid(this.ctx)) {
                        str = Constants.NORMAL_PREPAID_TOPUP_NUM;
                    } else if (ClientStateManager.isCSLPrepaid(this.ctx)) {
                        str = Constants.CSL_PREPAID_TOPUP_NUM;
                    }
                    MobileSipService.getInstance().call(str, this.ctx, false);
                }
            }
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.ctx = getActivity().getApplicationContext();
        this.activity = getActivity();
    }

    /* access modifiers changed from: protected */
    public Dialog onCreateNoContactDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this.activity);
        builder.setMessage(R.string.sms_notice_nocontacts).setCancelable(false).setNeutralButton(this.ctx.getString(android.R.string.ok), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }
        });
        return builder.create();
    }

    /* access modifiers changed from: protected */
    public Dialog onCreateNoWiFiDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this.activity);
        builder.setMessage(this.ctx.getString(R.string.ask_wifi)).setCancelable(false).setNeutralButton(this.ctx.getString(android.R.string.cancel), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }
        }).setPositiveButton(getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                MoreActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
            }
        });
        return builder.create();
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ActionBar supportActionBar = ((AppCompatActivity) getActivity()).getSupportActionBar();
        supportActionBar.setDisplayOptions(8, 24);
        supportActionBar.setTitle((CharSequence) getString(R.string.actionbar_tab_title_more));
        View inflate = ClientStateManager.isRegisteredPrepaid(this.ctx) ? layoutInflater.inflate(R.layout.more_msip_prepaid, viewGroup, false) : layoutInflater.inflate(R.layout.more_msip_postpaid, viewGroup, false);
        this.aboutTextView = (TextView) inflate.findViewById(R.id.menu_about);
        this.aboutTextView.setOnClickListener(this);
        this.userGuideTextView = (TextView) inflate.findViewById(R.id.menu_user_guide);
        this.userGuideTextView.setOnClickListener(this);
        this.faqTextView = (TextView) inflate.findViewById(R.id.menu_faq);
        this.faqTextView.setOnClickListener(this);
        this.screenCheckedTextView = (CheckedTextView) inflate.findViewById(R.id.menu_screen);
        this.screenCheckedTextView.setOnClickListener(this);
        this.ilbcCodecsCheckedTextView = (CheckedTextView) inflate.findViewById(R.id.menu_codec_ilbc);
        this.ilbcCodecsCheckedTextView.setOnClickListener(this);
        this.ilbcCodecsBar = inflate.findViewById(R.id.menu_codec_ilbc_bar);
        this.switchAccountButton = (Button) inflate.findViewById(R.id.menu_switch_account);
        this.switchAccountButton.setOnClickListener(this);
        this.facebookShareTextView = (TextView) inflate.findViewById(R.id.menu_facebook_share);
        this.facebookShareBar = inflate.findViewById(R.id.menu_facebook_share_bar);
        this.facebookLogoutTextView = (TextView) inflate.findViewById(R.id.menu_facebook_logout);
        this.facebookLogoutTextView.setOnClickListener(this);
        this.smsInviteTextView = (TextView) inflate.findViewById(R.id.menu_sms_invite);
        this.smsInviteBar = inflate.findViewById(R.id.menu_sms_invite_bar);
        this.autoLoginTextView = (TextView) inflate.findViewById(R.id.menu_auto_login);
        this.autoLoginTextView.setOnClickListener(this);
        if (ClientStateManager.isRegisteredPrepaid(this.ctx)) {
            this.mobileNumberTextView = (TextView) inflate.findViewById(R.id.menu_mobile_number);
            this.accountBalanceTextView = (TextView) inflate.findViewById(R.id.menu_balance);
            this.updateTimeTextView = (TextView) inflate.findViewById(R.id.menu_update_time);
            this.checkBalanceNotic = (TextView) inflate.findViewById(R.id.menu_check_balance_notic);
            this.checkBalanceNoticBar = inflate.findViewById(R.id.menu_check_balance_notic_bar);
            this.topupOnlineTextView = (TextView) inflate.findViewById(R.id.menu_topup_online);
            this.topupOnlineTextView.setOnClickListener(this);
            this.topupByCallingTextView = (TextView) inflate.findViewById(R.id.menu_topup_by_calling);
            if (ClientStateManager.isHelloPrepaid(this.ctx)) {
                this.topupByCallingTextView.setText(R.string.account_hello_prepaid_topup_call_text);
            } else if (ClientStateManager.isNormalPrepaid(this.ctx)) {
                this.topupByCallingTextView.setText(R.string.account_normal_prepaid_topup_call_text);
            } else if (ClientStateManager.isCSLPrepaid(this.ctx)) {
                this.topupByCallingTextView.setText(R.string.account_csl_prepaid_topup_call_text);
            }
            this.topupByCallingTextView.setOnClickListener(this);
        }
        if (ClientStateManager.isCSL(this.ctx)) {
            this.facebookShareTextView.setVisibility(View.GONE);
            this.smsInviteTextView.setVisibility(View.GONE);
            this.facebookShareBar.setVisibility(View.GONE);
            this.smsInviteBar.setVisibility(View.GONE);
        } else {
            this.facebookShareTextView.setOnClickListener(this);
            this.smsInviteTextView.setOnClickListener(this);
        }
        this.isRunningCheckBalanceTread = false;
        return inflate;
    }

    public void onResume() {
        super.onResume();
        this.facebookLogoutTextView.setVisibility(View.GONE);
        this.screenCheckedTextView.setChecked(PreferenceManager.getDefaultSharedPreferences(this.ctx).getBoolean(PREF_SCREEN, false));
        this.ilbcCodecsCheckedTextView.setChecked(PreferenceManager.getDefaultSharedPreferences(this.ctx).getBoolean(getString(R.string.pref_codec_ilbc_key), false));
        if (MobileSipService.getInstance().isAutoCodecSelection()) {
            this.ilbcCodecsCheckedTextView.setVisibility(View.GONE);
            this.ilbcCodecsBar.setVisibility(View.GONE);
        } else {
            this.ilbcCodecsCheckedTextView.setVisibility(View.VISIBLE);
            this.ilbcCodecsBar.setVisibility(View.VISIBLE);
        }
        if (MobileSipService.getInstance().isLoginRunning() || MobileSipService.getInstance().isDisconnecting() || MobileSipService.getInstance().loginStatus != -100) {
            this.ilbcCodecsCheckedTextView.setEnabled(false);
            this.ilbcCodecsCheckedTextView.setClickable(false);
        } else {
            this.ilbcCodecsCheckedTextView.setEnabled(true);
            this.ilbcCodecsCheckedTextView.setClickable(true);
        }
        this.switchAccountButton.setVisibility(View.GONE);
        if (ClientStateManager.isRegisteredPrepaid(this.ctx)) {
            this.mobileNumberTextView.setText(ClientStateManager.getRegisteredNumber(this.ctx));
        }
    }
}
