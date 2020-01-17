package com.pccw.mobile.sip;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.widget.FrameLayout;
import com.pccw.android.common.widget.ActionBarUtils;
import com.pccw.mobile.sip02.R;
import org.apache.commons.lang.StringUtils;
import org.linphone.DailPadActivityForAddCall;
import org.linphone.LinphoneService;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCore;

public class AddCallActivity extends BaseActionBarActivity {
    private static final String BAR_TAG_CONTACT = "CONTACT";
    private static final String BAR_TAG_DAILPAD = "DAILPAD";
    private static final String BAR_TAG_HISTORY = "HISTORY";
    private static AddCallActivity activity;
    ActionBar actionBar;
    private Uri mDialUri;
    private FrameLayout mMainFrame;

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
                if (obj.equals(AddCallActivity.BAR_TAG_DAILPAD)) {
                    tab.setIcon(bool.booleanValue() ? R.drawable.ic_tab_keypad_pressed : R.drawable.ic_tab_keypad);
                } else if (obj.equals(AddCallActivity.BAR_TAG_CONTACT)) {
                    tab.setIcon(bool.booleanValue() ? R.drawable.ic_tab_contact_pressed : R.drawable.ic_tab_contact);
                } else if (obj.equals(AddCallActivity.BAR_TAG_HISTORY)) {
                    tab.setIcon(bool.booleanValue() ? R.drawable.ic_tab_history_pressed : R.drawable.ic_tab_history);
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

    public static AddCallActivity getActivity() {
        if (activity == null) {
            return null;
        }
        return activity;
    }

    private void setCurrentTagByIntent(Intent intent) {
        if (Constants.INTENT_DIAL_ACTION.equals(intent.getAction()) && intent.getData() != null && StringUtils.isNotBlank(intent.getData().toString().substring("tel:".length()))) {
            setupDialUri(intent);
            this.actionBar.setSelectedNavigationItem(0);
        }
    }

    private void setupDialUri(Intent intent) {
        if ((intent.getFlags() & 1048576) == 0) {
            this.mDialUri = intent.getData();
        }
    }

    public void callState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state, String str) {
        try {
            if (LinphoneService.instance().getLinphoneCore().getCallsNb() != 1) {
                finish();
            }
        } catch (Exception e) {
            finish();
        }
    }

    public Uri getAndClearDialUri() {
        Uri uri = this.mDialUri;
        this.mDialUri = null;
        return uri;
    }

    public void onBackPressed() {
        finish();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView((int) R.layout.main_tab);
        this.mMainFrame = (FrameLayout) findViewById(R.id.main_frame);
        this.actionBar = getSupportActionBar();
        this.actionBar.setNavigationMode(2);
        this.actionBar.setDisplayShowTitleEnabled(true);
        ActionBarUtils.setHasEmbeddedTabs(this.actionBar, false);
        this.actionBar.addTab(this.actionBar.newTab().setIcon((int) R.drawable.ic_tab_keypad).setTag(BAR_TAG_DAILPAD).setTabListener(new TabListener(this, BAR_TAG_DAILPAD, DailPadActivityForAddCall.class)));
        this.actionBar.addTab(this.actionBar.newTab().setIcon((int) R.drawable.ic_tab_contact).setTag(BAR_TAG_CONTACT).setTabListener(new TabListener(this, BAR_TAG_CONTACT, AddCallContactFragment.class)));
        this.actionBar.addTab(this.actionBar.newTab().setIcon((int) R.drawable.ic_tab_history).setTag(BAR_TAG_HISTORY).setTabListener(new TabListener(this, BAR_TAG_HISTORY, AddCallCallLogFragment.class)));
        if (bundle != null) {
            this.actionBar.setSelectedNavigationItem(bundle.getInt("tab", 0));
        }
        activity = this;
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        activity = null;
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
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        try {
            if (LinphoneService.instance().getLinphoneCore().getCallsNb() != 1) {
                finish();
            }
        } catch (Exception e) {
            finish();
        }
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt("tab", getSupportActionBar().getSelectedNavigationIndex());
    }

    /* access modifiers changed from: protected */
    public void onStop() {
        super.onStop();
    }
}
