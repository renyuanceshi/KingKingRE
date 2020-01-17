package org.linphone;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.preference.PreferenceManager;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.pccw.android.common.widget.ActionBarUtils;
import com.pccw.mobile.sip.BaseActionBarActivity;
import com.pccw.mobile.sip.CallLogFragment;
import com.pccw.mobile.sip.CheckVersionActivity;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.ContactFragment;
import com.pccw.mobile.sip.MoreActivity;
import com.pccw.mobile.sip.ServerMessageController;
import com.pccw.mobile.sip.TAndCActivity;
import com.pccw.mobile.sip.service.Codec;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip02.R;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.linphone.core.LinphoneCall;

public class LinphoneActivity extends BaseActionBarActivity {
    private static final String BAR_TAG_CONTACT = "CONTACT";
    private static final String BAR_TAG_DAILPAD = "DAILPAD";
    private static final String BAR_TAG_HISTORY = "HISTORY";
    private static final String BAR_TAG_MORE = "MORE";
    private static final int CONFIGURE_MENU_ITEM = 1;
    public static String DIALER_TAB = "dialer";
    private static final int EXIT_MENU_ITEM = 0;
    private static String SCREEN_IS_HIDDEN = "screen_is_hidden";
    private static String SHOW_IN_HK_MESSAGE = "SHOW_IN_HK_MESSAGE";
    private static boolean isPhoneBookSyncRunning = false;
    private static boolean isUpdateGroupListRunning = false;
    private static SensorEventListener mSensorEventListener;
    private static LinphoneActivity theLinphoneActivity;
    ActionBar actionBar;
    public ServiceConnection conn = new ServiceConnection() {
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            boolean unused = LinphoneActivity.this.mBound = true;
        }

        public void onServiceDisconnected(ComponentName componentName) {
            boolean unused = LinphoneActivity.this.mBound = false;
        }
    };
    private LoginErrorWarningReceiver loginErrorWarningReceiver = null;
    private AudioManager mAudioManager;
    /* access modifiers changed from: private */
    public boolean mBound = false;
    private Uri mDialUri;
    private FrameLayout mMainFrame;
    private SensorManager mSensorManager;
    private BroadcastReceiver receiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if ("android.intent.action.CONFIGURATION_CHANGED".equals(intent.getAction())) {
            }
        }
    };

    private class LoginErrorWarningReceiver extends BroadcastReceiver {
        /* access modifiers changed from: private */
        public Activity activeActivity = LinphoneActivity.this;

        public LoginErrorWarningReceiver(Activity activity) {
            this.activeActivity = activity;
        }

        public void onReceive(final Context context, final Intent intent) {
            if (this.activeActivity != null) {
                this.activeActivity.runOnUiThread(new Runnable() {
                    public void run() {
                        if (Constants.INTENT_ALERT_LOGIN_ERROR.equals(intent.getAction())) {
                            String string = intent.getExtras().getString(ServerMessageController.MESSAGE_INTENT_MESSAGE);
                            boolean z = intent.getExtras().getBoolean(ServerMessageController.MESSAGE_INTENT_OVERSEA_BOOLEAN);
                            AlertDialog.Builder builder = new AlertDialog.Builder(LinphoneActivity.this);
                            if (string == null || string.equals(context.getResources().getString(R.string.network_error))) {
                                String string2 = LoginErrorWarningReceiver.this.activeActivity.getString(R.string.check_wifi);
                                builder.setPositiveButton(LinphoneActivity.this.getString(R.string.go_to_wifi_setting), new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        LinphoneActivity.this.startActivity(new Intent("android.settings.WIFI_SETTINGS"));
                                    }
                                });
                                builder.setNeutralButton(17039360, (DialogInterface.OnClickListener) null);
                                try {
                                    builder.setTitle(R.string.regfailed).setIcon(R.drawable.ic_logo).setMessage(string2).setCancelable(true).show();
                                } catch (Exception e) {
                                }
                            } else if (string.equals(context.getResources().getString(R.string.error_not_pccw_sim))) {
                                builder.setPositiveButton(LinphoneActivity.this.getString(R.string.button_text_enter), new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        LinphoneActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://www.pccw-hkt.com/kk")));
                                    }
                                });
                                builder.setNegativeButton(LinphoneActivity.this.getString(17039360), (DialogInterface.OnClickListener) null);
                                try {
                                    builder.setTitle(R.string.regfailed).setIcon(R.drawable.ic_logo).setMessage(string).setCancelable(true).show();
                                } catch (Exception e2) {
                                }
                            } else if (!z) {
                                builder.setNeutralButton(17039370, (DialogInterface.OnClickListener) null);
                                try {
                                    builder.setTitle(R.string.regfailed).setIcon(R.drawable.ic_logo).setMessage(string).setCancelable(true).show();
                                } catch (Exception e3) {
                                }
                            } else {
                                builder.setNegativeButton(17039360, (DialogInterface.OnClickListener) null);
                                builder.setPositiveButton(LinphoneActivity.this.getString(R.string.oversea_message_dialog_callnow_button), (DialogInterface.OnClickListener) null);
                                builder.setNeutralButton(LinphoneActivity.this.getString(R.string.oversea_message_dialog_dialing_fixedline_button), (DialogInterface.OnClickListener) null);
                                final AlertDialog create = builder.setTitle(R.string.regfailed).setIcon(R.drawable.ic_logo).setMessage(string).setCancelable(true).create();
                                create.setOnShowListener(new DialogInterface.OnShowListener() {
                                    public void onShow(DialogInterface dialogInterface) {
                                        create.getButton(-1).setOnClickListener(new View.OnClickListener() {
                                            public void onClick(View view) {
                                                LinphoneActivity.this.showCallTollFreeDialog();
                                            }
                                        });
                                        create.getButton(-3).setOnClickListener(new View.OnClickListener() {
                                            public void onClick(View view) {
                                                LinphoneActivity.this.showOverseaHotlineWebViewDialog();
                                            }
                                        });
                                    }
                                });
                                create.show();
                                Button button = create.getButton(-1);
                                Button button2 = create.getButton(-3);
                                Button button3 = create.getButton(-2);
                                button.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
                                button2.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
                                button3.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
                                ((LinearLayout) button.getParent()).setOrientation(1);
                            }
                        } else if (Constants.INTENT_ALERT_LOGIN_WARNING.equals(intent.getAction())) {
                            String string3 = intent.getExtras().getString(ServerMessageController.MESSAGE_INTENT_MESSAGE);
                            if (string3 != null) {
                                try {
                                    new AlertDialog.Builder(LinphoneActivity.this).setTitle(2131165290).setIcon(R.drawable.ic_logo).setMessage(string3).setCancelable(true).setNeutralButton(17039370, (DialogInterface.OnClickListener) null).show();
                                } catch (Exception e4) {
                                }
                            }
                        } else if (Constants.INTENT_ALERT_LOGIN_DISCONNECTED.equals(intent.getAction())) {
                            if (intent.getBooleanExtra(Constants.INTENT_ALERT_LOGIN_DISCONNECTED_EXTRA_NEED_SHOW_MESSAGE, true)) {
                                try {
                                    AlertDialog.Builder builder2 = new AlertDialog.Builder(LinphoneActivity.this);
                                    builder2.setMessage(LinphoneActivity.this.getString(R.string.disconnected)).setCancelable(true).setNeutralButton(LinphoneActivity.this.getString(17039370), (DialogInterface.OnClickListener) null);
                                    builder2.create().show();
                                } catch (Exception e5) {
                                }
                            }
                        } else if (!Constants.INTENT_ALERT_CALLFORWARD_SUCCEED.equals(intent.getAction()) && Constants.INTERT_ALERT_DAYPASS.equals(intent.getAction())) {
                            try {
                                View inflate = LinphoneActivity.this.getLayoutInflater().inflate(R.layout.do_not_show_again_checkbox, (ViewGroup) null);
                                final CheckBox checkBox = (CheckBox) inflate.findViewById(R.id.cb_do_not_show);
                                checkBox.setChecked(false);
                                if (Build.VERSION.SDK_INT <= 11) {
                                    checkBox.setTextColor(LinphoneActivity.this.getResources().getColor(R.color.bg_white));
                                }
                                new AlertDialog.Builder(LinphoneActivity.this).setTitle(2131165290).setIcon(R.drawable.ic_logo).setCancelable(true).setView(inflate).setPositiveButton(17039370, new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialogInterface, int i) {
                                        if (checkBox.isChecked()) {
                                            PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(Constants.SHOW_DAYPASS_MESSAGE, false).commit();
                                        }
                                        MobileSipService.getInstance().dayPassAlertOKClicked = true;
                                        DailPadActivity.getDailPad().contTurnOnRS();
                                    }
                                }).setNeutralButton(17039360, (DialogInterface.OnClickListener) null).show();
                            } catch (Exception e6) {
                            }
                        }
                    }
                });
            }
        }
    }

    public static class TabListener<T extends Fragment> implements ActionBar.TabListener {
        private final Activity mActivity;
        private final Class<T> mClass;
        private Fragment mFragment;
        private final String mTag;

        public TabListener(Activity activity, String str, Class<T> cls) {
            this.mActivity = activity;
            this.mTag = str;
            this.mClass = cls;
        }

        private void setIconSelected(ActionBar.Tab tab, Boolean bool) {
            if (tab.getTag() != null) {
                String obj = tab.getTag().toString();
                if (obj.equals(LinphoneActivity.BAR_TAG_DAILPAD)) {
                    tab.setIcon(bool.booleanValue() ? R.drawable.ic_tab_keypad_pressed : R.drawable.ic_tab_keypad);
                } else if (obj.equals(LinphoneActivity.BAR_TAG_CONTACT)) {
                    tab.setIcon(bool.booleanValue() ? R.drawable.ic_tab_contact_pressed : R.drawable.ic_tab_contact);
                } else if (obj.equals(LinphoneActivity.BAR_TAG_HISTORY)) {
                    tab.setIcon(bool.booleanValue() ? R.drawable.ic_tab_history_pressed : R.drawable.ic_tab_history);
                } else if (obj.equals(LinphoneActivity.BAR_TAG_MORE)) {
                    tab.setIcon(bool.booleanValue() ? R.drawable.ic_tab_settings_pressed : R.drawable.ic_tab_settings);
                }
            }
        }

        public void onTabReselected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {
        }

        public void onTabSelected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {
            setIconSelected(tab, true);
            if (this.mFragment == null) {
                this.mFragment = Fragment.instantiate(this.mActivity, this.mClass.getName());
                fragmentTransaction.replace(16908290, this.mFragment, this.mTag);
                return;
            }
            fragmentTransaction.attach(this.mFragment);
        }

        public void onTabUnselected(ActionBar.Tab tab, FragmentTransaction fragmentTransaction) {
            setIconSelected(tab, false);
            if (this.mFragment != null) {
                fragmentTransaction.detach(this.mFragment);
            }
        }
    }

    private void doListAvailableCodecs() {
        for (Codec next : MobileSipService.getInstance().listAvailableCodecs(this)) {
        }
    }

    protected static LinphoneActivity instance() {
        if (theLinphoneActivity != null) {
            return theLinphoneActivity;
        }
        throw new RuntimeException("LinphoneActivity not instanciated yet");
    }

    public static boolean isInstanced() {
        return theLinphoneActivity != null;
    }

    public static Boolean isPhoneBookSyncRunning() {
        return Boolean.valueOf(isPhoneBookSyncRunning);
    }

    public static Boolean isUpdateGroupListRunning() {
        return Boolean.valueOf(isUpdateGroupListRunning);
    }

    private void setCurrentTagByIntent(Intent intent) {
        if (Constants.INTENT_DIAL_ACTION.equals(intent.getAction()) && intent.getData() != null) {
            if (StringUtils.isNotBlank(intent.getData().toString().substring("tel:".length()))) {
                setupDialUri(intent);
                this.actionBar.setSelectedNavigationItem(0);
                return;
            }
            this.actionBar.setSelectedNavigationItem(0);
        }
    }

    public static void setPhoneBookSyncRunning(boolean z) {
        isPhoneBookSyncRunning = z;
    }

    public static void setUpdateGroupListRunning(boolean z) {
        isUpdateGroupListRunning = z;
    }

    private void setupDialUri(Intent intent) {
        if ((intent.getFlags() & 1048576) == 0) {
            this.mDialUri = intent.getData();
        }
    }

    private void showCallHotlineDialog(final String str) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage("Do you want to call the following number: " + str.substring(4)).setCancelable(true).setNegativeButton(getString(17039360), (DialogInterface.OnClickListener) null).setPositiveButton(getString(17039370), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                try {
                    Intent intent = new Intent("android.intent.action.CALL");
                    intent.setData(Uri.parse(str));
                    LinphoneActivity.this.startActivity(intent);
                } catch (ActivityNotFoundException e) {
                }
            }
        });
        builder.create().show();
    }

    /* access modifiers changed from: private */
    public void showCallTollFreeDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(getString(R.string.toll_free_dialog_message)).setCancelable(true).setNegativeButton(getString(17039360), (DialogInterface.OnClickListener) null).setPositiveButton(getString(R.string.toll_free_dialog_ok_button), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                try {
                    Intent intent = new Intent("android.intent.action.CALL");
                    intent.setData(Uri.parse("tel:+85228888333"));
                    LinphoneActivity.this.startActivity(intent);
                } catch (ActivityNotFoundException e) {
                }
            }
        });
        builder.create().show();
    }

    /* access modifiers changed from: private */
    public void showOverseaHotlineWebViewDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(R.string.fixed_line_webview_title);
        WebView webView = new WebView(this);
        webView.loadUrl(getString(R.string.system_current_language).equals("zh") ? Constants.HKT_HOTLINE_HTML_URL_CH : Constants.HKT_HOTLINE_HTML_URL_EN);
        builder.setView(webView);
        builder.setNegativeButton(17039360, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
            }
        });
        builder.show();
    }

    public Uri getAndClearDialUri() {
        Uri uri = this.mDialUri;
        this.mDialUri = null;
        return uri;
    }

    /* access modifiers changed from: protected */
    public void hideScreen(boolean z) {
        if (InCallScreen.getDialer() != null) {
            InCallScreen.getDialer().hiddenScreen(z);
        }
    }

    public void initFromConf() throws LinphoneException {
        try {
            if (LinphoneService.isready()) {
                LinphoneService.instance().initFromConf();
            }
        } catch (LinphoneConfigException e) {
        }
    }

    public void onAccuracyChanged(Sensor sensor, int i) {
    }

    public void onBackPressed() {
        moveTaskToBack(true);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView((int) R.layout.main_tab);
        this.mSensorManager = (SensorManager) getSystemService("sensor");
        theLinphoneActivity = this;
        this.mMainFrame = (FrameLayout) findViewById(R.id.main_frame);
        this.mAudioManager = (AudioManager) getSystemService("audio");
        this.actionBar = getSupportActionBar();
        this.actionBar.setNavigationMode(2);
        this.actionBar.setDisplayShowTitleEnabled(false);
        ActionBarUtils.setHasEmbeddedTabs(this.actionBar, false);
        this.actionBar.addTab(this.actionBar.newTab().setIcon((int) R.drawable.ic_tab_keypad).setTag(BAR_TAG_DAILPAD).setTabListener(new TabListener(this, BAR_TAG_DAILPAD, DailPadActivity.class)));
        this.actionBar.addTab(this.actionBar.newTab().setIcon((int) R.drawable.ic_tab_contact).setTag(BAR_TAG_CONTACT).setTabListener(new TabListener(this, BAR_TAG_CONTACT, ContactFragment.class)));
        this.actionBar.addTab(this.actionBar.newTab().setIcon((int) R.drawable.ic_tab_history).setTag(BAR_TAG_HISTORY).setTabListener(new TabListener(this, BAR_TAG_HISTORY, CallLogFragment.class)));
        this.actionBar.addTab(this.actionBar.newTab().setIcon((int) R.drawable.ic_tab_settings).setTag(BAR_TAG_MORE).setTabListener(new TabListener(this, BAR_TAG_MORE, MoreActivity.class)));
        if (bundle != null) {
            this.actionBar.setSelectedNavigationItem(bundle.getInt("tab", 0));
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
        registerReceiver(this.receiver, intentFilter);
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        if (this.mBound) {
            unbindService(this.conn);
            this.mBound = false;
        }
        unregisterReceiver(this.receiver);
    }

    /* access modifiers changed from: protected */
    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
        setCurrentTagByIntent(intent);
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        if (this.loginErrorWarningReceiver != null) {
            unregisterReceiver(this.loginErrorWarningReceiver);
        }
        this.loginErrorWarningReceiver = null;
        if (isFinishing()) {
            if (Integer.parseInt(Build.VERSION.SDK) <= 4) {
                this.mAudioManager.setMode(0);
                this.mAudioManager.setRouting(0, 2, -1);
            } else {
                this.mAudioManager.setSpeakerphoneOn(false);
            }
            stopProxymitySensor();
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
        if (ClientStateManager.checkSimState(getApplicationContext(), false) != 0) {
            if (MobileSipService.getInstance().loginStatus == 0) {
                MobileSipService.getInstance().close(this);
            }
            startActivity(new Intent(getApplicationContext(), TAndCActivity.class));
            if (!isFinishing()) {
                finish();
            }
        }
        if (LinphoneService.isready() && LinphoneService.instance().getLinphoneCore().getCallsNb() > 0) {
            LinphoneCall currentCall = LinphoneService.getLc().getCurrentCall();
            if (currentCall == null || currentCall.getCurrentParamsCopy() == null || !currentCall.getCurrentParamsCopy().getVideoEnabled()) {
                MobileSipService.getInstance().openIncallScreen(this);
            } else {
                MobileSipService.getInstance().openVideoCallScreen(this);
            }
        }
        if (this.loginErrorWarningReceiver == null) {
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction(Constants.INTENT_ALERT_LOGIN_ERROR);
            intentFilter.addAction(Constants.INTENT_ALERT_LOGIN_DISCONNECTED);
            intentFilter.addAction(Constants.INTENT_ALERT_LOGIN_WARNING);
            intentFilter.addAction(Constants.INTENT_ALERT_CALLFORWARD_SUCCEED);
            intentFilter.addAction(Constants.INTERT_ALERT_DAYPASS);
            this.loginErrorWarningReceiver = new LoginErrorWarningReceiver(this);
            if (this.loginErrorWarningReceiver != null) {
                registerReceiver(this.loginErrorWarningReceiver, intentFilter);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (this.mMainFrame.getVisibility() == 4) {
            bundle.putBoolean(SCREEN_IS_HIDDEN, true);
        } else {
            bundle.putBoolean(SCREEN_IS_HIDDEN, false);
        }
        bundle.putInt("tab", getSupportActionBar().getSelectedNavigationIndex());
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
    }

    /* access modifiers changed from: protected */
    public void startProxymitySensor() {
        synchronized (this) {
            if (mSensorEventListener == null) {
                List<Sensor> sensorList = this.mSensorManager.getSensorList(8);
                mSensorEventListener = new SensorEventListener() {
                    public void onAccuracyChanged(Sensor sensor, int i) {
                    }

                    public void onSensorChanged(SensorEvent sensorEvent) {
                        if (sensorEvent.timestamp != 0) {
                            float f = sensorEvent.values[0];
                            if (((double) f) < 0.0d || f >= 5.0f || f >= sensorEvent.sensor.getMaximumRange()) {
                                LinphoneActivity.instance().hideScreen(false);
                            } else {
                                LinphoneActivity.instance().hideScreen(true);
                            }
                        }
                    }
                };
                if (sensorList.size() > 0) {
                    this.mSensorManager.registerListener(mSensorEventListener, sensorList.get(0), 2);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void startprefActivity() {
    }

    /* access modifiers changed from: protected */
    public void stopProxymitySensor() {
        synchronized (this) {
            if (this.mSensorManager != null) {
                this.mSensorManager.unregisterListener(mSensorEventListener);
                mSensorEventListener = null;
            }
            hideScreen(false);
        }
    }
}
