package org.linphone;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.media.ToneGenerator;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Vibrator;
import android.preference.PreferenceManager;
import android.provider.Settings;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v7.app.ActionBar;
import android.support.v7.app.ActionBarActivity;
import android.telephony.PhoneNumberFormattingTextWatcher;
import android.telephony.PhoneNumberUtils;
import android.text.Editable;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageButton;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.sip.AddCallActivity;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.NumberMappingUtil;
import com.pccw.mobile.ui.dialog.KKAlertDialogFragment;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;

public class DailPadActivityForAddCall extends Fragment implements View.OnClickListener, View.OnLongClickListener, View.OnKeyListener, KKAlertDialogFragment.KKDialogResponses {
    private static final int DIAL_TONE_STREAM_TYPE = 3;
    private static final String SHOW_IDD_CHARGE_MESSAGE = "SHOW_IDD_CHARGE_MESSAGE";
    private static final String TAG = "PCCW_MOBILE_SIP";
    private static final int TONE_LENGTH_MS = 150;
    private static final int TONE_RELATIVE_VOLUME = 80;
    private static final int VIBRATE_NO_REPEAT = -1;
    private static final int promptNoWifiDialog = 1;
    private static DailPadActivityForAddCall theDailPad;
    Activity activity;
    Context ctx;
    private String dialOutNumber = "";
    private FragmentManager fragmentManager;
    Handler handler = new Handler() {
        public void handleMessage(Message message) {
            synchronized (DailPadActivityForAddCall.this.mToneGeneratorLock) {
                if (DailPadActivityForAddCall.this.mToneGenerator != null) {
                    DailPadActivityForAddCall.this.mToneGenerator.stopTone();
                }
                removeMessages(0);
            }
        }
    };
    private boolean mDTMFToneEnabled;
    private ImageButton mDelete;
    private ImageButton mDialButton;
    private Drawable mDigitsBackground;
    private Drawable mDigitsEmptyBackground;
    private String mDisplayName;
    private SharedPreferences mPref;
    /* access modifiers changed from: private */
    public ToneGenerator mToneGenerator;
    /* access modifiers changed from: private */
    public Object mToneGeneratorLock = new Object();
    private boolean mVibrateOn;
    private long[] mVibratePattern;
    private Vibrator mVibrator;
    private AlertDialog m_AlertDlg;
    /* access modifiers changed from: private */
    public EditText sip_uri_box;
    View v;

    private boolean call(String str) {
        this.dialOutNumber = str;
        return MobileSipService.getInstance().addCall(str, this.ctx);
    }

    public static DailPadActivityForAddCall getDailPad() {
        if (theDailPad == null) {
            return null;
        }
        return theDailPad;
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
            java.lang.String r0 = android.provider.CallLog.Calls.getLastOutgoingCall(r0)
            goto L_0x0033
        L_0x0049:
            r0 = move-exception
            goto L_0x003c
        */
        throw new UnsupportedOperationException("Method not decompiled: org.linphone.DailPadActivityForAddCall.getlastCall():java.lang.String");
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

    private void keyPressed(int i) {
        vibrate();
        this.sip_uri_box.onKeyDown(i, new KeyEvent(0, i));
        afterTextChanged(this.sip_uri_box.getText());
    }

    @SuppressLint({"NewApi"})
    private void performCall() {
        if (this.sip_uri_box.getText().length() > 0) {
            String str = PhoneNumberUtils.stripSeparators(this.sip_uri_box.getText().toString()).toString();
            if (!MobileSipService.getInstance().startCallChecking(str, this.activity)) {
                return;
            }
            if (!NumberMappingUtil.hasIDDPrefix(str, this.ctx) || !PreferenceManager.getDefaultSharedPreferences(this.ctx).getBoolean(SHOW_IDD_CHARGE_MESSAGE, true)) {
                performCallWithAddress(this.sip_uri_box.getText().toString());
                return;
            }
            try {
                final CheckBox checkBox = new CheckBox(this.activity);
                checkBox.setChecked(false);
                checkBox.setText(R.string.do_not_show_this_again);
                new AlertDialog.Builder(this.activity).setIcon(R.drawable.ic_logo).setTitle(R.string.app_name).setMessage(R.string.idd_charge_message).setView(checkBox).setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.cancel();
                    }
                }).setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        if (checkBox.isChecked()) {
                            PreferenceManager.getDefaultSharedPreferences(DailPadActivityForAddCall.this.ctx).edit().putBoolean(DailPadActivityForAddCall.SHOW_IDD_CHARGE_MESSAGE, false).commit();
                        }
                        dialogInterface.cancel();
                        DailPadActivityForAddCall.this.performCallWithAddress(DailPadActivityForAddCall.this.sip_uri_box.getText().toString());
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
    public void performCallWithAddress(String str) {
        this.sip_uri_box.setText("");
        afterTextChanged(this.sip_uri_box.getText());
        this.dialOutNumber = str;
        MobileSipService.getInstance().addCall(str, this.ctx);
    }

    private void setDialer(Uri uri) {
        setFormattedDigits(uri.getSchemeSpecificPart());
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

    private void showDialog(int i) {
        switch (i) {
            case 1:
                KKAlertDialogFragment newInstance = KKAlertDialogFragment.newInstance(1);
                newInstance.setTargetFragment(this, 1);
                newInstance.setMessage(getString(R.string.ask_wifi));
                newInstance.setPositiveButton(getString(R.string.go_to_wifi_setting));
                newInstance.setNegativeButton(getString(android.R.string.cancel));
                newInstance.setCancelable(false);
                newInstance.show(this.fragmentManager, "dialog");
                return;
            default:
                throw new IllegalArgumentException("unkown dialog id " + i);
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
            case R.id.addcall_txt_callee:
                if (this.sip_uri_box.length() != 0) {
                    this.sip_uri_box.setCursorVisible(true);
                    return;
                }
                return;
            case R.id.addCallDeleteButton:
                keyPressed(67);
                return;
            case R.id.addCallVoiceCallBtn:
                performCall();
                return;
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
            default:
                return;
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.ctx = getActivity().getApplicationContext();
        this.activity = getActivity();
        this.fragmentManager = ((AddCallActivity) this.activity).getSupportFragmentManager();
        theDailPad = this;
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Log.v("KKUI", "DailPadActivityForAddCall-onCreateView");
        ActionBar supportActionBar = ((ActionBarActivity) getActivity()).getSupportActionBar();
        supportActionBar.setDisplayOptions(8, 12);
        supportActionBar.setTitle((CharSequence) getString(R.string.actionbar_tab_addcall_title_dial));
        supportActionBar.setHomeButtonEnabled(true);
        supportActionBar.setDisplayHomeAsUpEnabled(true);
        this.v = layoutInflater.inflate(R.layout.addcall_main_dial, viewGroup, false);
        try {
            Resources resources = getResources();
            this.mDigitsBackground = resources.getDrawable(R.drawable.btn_dial_textfield_active);
            this.mDigitsEmptyBackground = resources.getDrawable(R.drawable.btn_dial_textfield);
            this.sip_uri_box = (EditText) this.v.findViewById(R.id.addcall_txt_callee);
            this.sip_uri_box.setInputType(3);
            this.sip_uri_box.setOnClickListener(this);
            this.sip_uri_box.setOnKeyListener(this);
            this.sip_uri_box.setOnTouchListener(new View.OnTouchListener() {
                public boolean onTouch(View view, MotionEvent motionEvent) {
                    int inputType = DailPadActivityForAddCall.this.sip_uri_box.getInputType();
                    DailPadActivityForAddCall.this.sip_uri_box.setInputType(0);
                    DailPadActivityForAddCall.this.sip_uri_box.onTouchEvent(motionEvent);
                    DailPadActivityForAddCall.this.sip_uri_box.setInputType(inputType);
                    return true;
                }
            });
            if (this.v.findViewById(R.id.one) != null) {
                setupKeypad();
            }
            this.mDelete = (ImageButton) this.v.findViewById(R.id.addCallDeleteButton);
            this.mDelete.setOnClickListener(this);
            this.mDelete.setOnLongClickListener(this);
            this.mDialButton = (ImageButton) this.v.findViewById(R.id.addCallVoiceCallBtn);
            this.mDialButton.setOnClickListener(this);
            this.mPref = PreferenceManager.getDefaultSharedPreferences(this.ctx);
        } catch (NullPointerException e) {
        }
        return this.v;
    }

    public void onDestroy() {
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
            case R.id.addCallDeleteButton:
                text.clear();
                afterTextChanged(this.sip_uri_box.getText());
                this.mDelete.setPressed(false);
                return true;
            case R.id.zero:
                keyPressed(81);
                return true;
            default:
                return false;
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case 16908332:
                this.activity.finish();
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    public void onPause() {
        super.onPause();
    }

    public void onResume() {
        Uri andClearDialUri;
        boolean z = true;
        super.onResume();
        if (Settings.System.getInt(this.ctx.getContentResolver(), "dtmf_tone", 1) != 1) {
            z = false;
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
        if (this.activity != null && (this.activity instanceof AddCallActivity) && (andClearDialUri = ((AddCallActivity) this.activity).getAndClearDialUri()) != null && "tel".equals(andClearDialUri.getScheme())) {
            setDialer(andClearDialUri);
        }
    }

    /* access modifiers changed from: package-private */
    public void playTone(int i) {
        int ringerMode;
        if (this.mDTMFToneEnabled && (ringerMode = ((AudioManager) this.ctx.getSystemService(AUDIO_SERVICE)).getRingerMode()) != 0 && ringerMode != 1) {
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
