package com.pccw.sms.service;

import android.content.Context;
import android.database.ContentObserver;
import android.database.Cursor;
import android.os.Handler;
import android.preference.PreferenceManager;
import android.provider.ContactsContract;
import android.support.v7.widget.ActivityChooserView;
import com.pccw.mobile.sip.util.NetworkUtils;
import org.linphone.LinphoneActivity;

public class ContactChangeContentObserver extends ContentObserver {
    static final String LAST_CONTACT_HASH_CODE = "LAST_CONTACT_HASH_CODE";
    static ContactChangeContentObserver contactChangeContentObserver;
    static long nextCallTime = 0;
    static int queueCount = 0;
    final String LOG_TAG = "ContactChangeContentObserver";
    Context context;
    final long thresholdTime = 1000;

    public static class CompareContactCursorDifference {
        Cursor cCursor = null;
        Context context;

        public CompareContactCursorDifference(Context context2) {
            this.context = context2;
        }

        public Cursor getCursor() {
            this.cCursor = this.context.getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[]{"data1"}, (String) null, (String[]) null, "data1 ASC");
            return this.cCursor;
        }

        public int getHashCode() {
            Cursor cursor = getCursor();
            if (cursor == null || cursor.getCount() == 0) {
                return -1;
            }
            int i = 13;
            cursor.moveToFirst();
            do {
                int i2 = 9;
                for (char c : cursor.getString(0).toCharArray()) {
                    i2 = ((i2 * 101) + c) % ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
                }
                i = ((i * 17) + i2) % ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
            } while (cursor.moveToNext());
            cursor.close();
            return i;
        }
    }

    public ContactChangeContentObserver(Context context2) {
        super((Handler) null);
        this.context = context2;
    }

    public static ContactChangeContentObserver getInstance(Context context2) {
        return contactChangeContentObserver == null ? new ContactChangeContentObserver(context2) : contactChangeContentObserver;
    }

    public static int getLastContactHashCode(Context context2) {
        return PreferenceManager.getDefaultSharedPreferences(context2).getInt(LAST_CONTACT_HASH_CODE, -1);
    }

    public static void setLastContactHashCode(int i, Context context2) {
        PreferenceManager.getDefaultSharedPreferences(context2).edit().putInt(LAST_CONTACT_HASH_CODE, i).commit();
    }

    public void onChange(boolean z) {
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis >= nextCallTime) {
            nextCallTime = currentTimeMillis + 1000;
            new Thread(new Runnable() {
                public void run() {
                    CompareContactCursorDifference compareContactCursorDifference = new CompareContactCursorDifference(ContactChangeContentObserver.this.context);
                    int lastContactHashCode = ContactChangeContentObserver.getLastContactHashCode(ContactChangeContentObserver.this.context);
                    int hashCode = compareContactCursorDifference.getHashCode();
                    if (hashCode != lastContactHashCode || lastContactHashCode == -1) {
                        ContactChangeContentObserver.queueCount++;
                        if (ContactChangeContentObserver.queueCount == 1) {
                            ContactChangeContentObserver.this.startSyncIMUserThread(hashCode);
                        }
                    }
                }
            }).start();
            super.onChange(z);
        }
    }

    public void startSyncIMUserThread(int i) {
        new Thread(new Runnable() {
            public void run() {
                while (ContactChangeContentObserver.queueCount > 0) {
                    if (NetworkUtils.isWifiAvailable(ContactChangeContentObserver.this.context) && !LinphoneActivity.isPhoneBookSyncRunning().booleanValue()) {
                        LinphoneActivity.setPhoneBookSyncRunning(true);
                    }
                    ContactChangeContentObserver.queueCount--;
                }
            }
        }).start();
    }
}
