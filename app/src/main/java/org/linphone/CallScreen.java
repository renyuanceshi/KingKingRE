package org.linphone;

import android.app.KeyguardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import com.pccw.mobile.sip.BaseFragmentActivity;
import org.linphone.mediastream.Version;

public class CallScreen extends BaseFragmentActivity implements DialogInterface.OnClickListener {
    public static final int ANSWER_MENU_ITEM = 9;
    public static final int BLUETOOTH_MENU_ITEM = 10;
    public static final int FIRST_MENU_ID = 1;
    public static final int HANG_UP_MENU_ITEM = 2;
    public static final int HOLD_MENU_ITEM = 3;
    public static final int MUTE_MENU_ITEM = 4;
    public static final int SPEAKER_MENU_ITEM = 7;
    public static final int TRANSFER_MENU_ITEM = 8;
    public static final int VIDEO_MENU_ITEM = 6;
    private static EditText transferText;
    boolean enabled;
    long enabletime;
    Intent intent;
    Context mContext = this;
    Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            CallScreen.this.onResume();
        }
    };
    KeyguardManager.KeyguardLock mKeyguardLock;
    KeyguardManager mKeyguardManager;

    private void transfer() {
    }

    /* access modifiers changed from: package-private */
    public void disableKeyguard() {
        if (this.mKeyguardManager == null) {
            this.mKeyguardManager = (KeyguardManager) getSystemService("keyguard");
            this.mKeyguardLock = this.mKeyguardManager.newKeyguardLock("RoamSave");
            this.enabled = true;
        }
        if (this.enabled) {
            this.mKeyguardLock.disableKeyguard();
            this.enabled = false;
            this.enabletime = SystemClock.elapsedRealtime();
        }
    }

    public void onClick(DialogInterface dialogInterface, int i) {
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        getWindow().addFlags(AccessibilityEventCompat.TYPE_WINDOWS_CHANGED);
        getWindow().addFlags(524288);
        super.onCreate(bundle);
    }

    public boolean onCreateOptionsMenu(Menu menu) {
        return false;
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        return super.onOptionsItemSelected(menuItem);
    }

    public void onPause() {
        super.onPause();
        if (Version.sdkStrictlyBelow(13)) {
            reenableKeyguard();
        }
    }

    public boolean onPrepareOptionsMenu(Menu menu) {
        return super.onPrepareOptionsMenu(menu);
    }

    public void onResume() {
        super.onResume();
        if (Integer.parseInt(Build.VERSION.SDK) >= 5 && Integer.parseInt(Build.VERSION.SDK) <= 7) {
            disableKeyguard();
        }
    }

    public void onStart() {
        super.onStart();
        if (Version.sdkStrictlyBelow(13)) {
            disableKeyguard();
        }
    }

    public void onStop() {
        super.onStop();
        if (Version.sdkStrictlyBelow(13)) {
            reenableKeyguard();
        }
    }

    /* access modifiers changed from: package-private */
    public void reenableKeyguard() {
        if (!this.enabled) {
            try {
                if (Integer.parseInt(Build.VERSION.SDK) < 5) {
                    Thread.sleep(1000);
                }
            } catch (InterruptedException e) {
            }
            this.mKeyguardLock.reenableKeyguard();
            this.enabled = true;
        }
    }
}
