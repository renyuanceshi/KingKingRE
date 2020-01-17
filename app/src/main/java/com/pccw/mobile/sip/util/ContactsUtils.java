package com.pccw.mobile.sip.util;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.os.Build;

public abstract class ContactsUtils {
    public static int currentApi = 0;
    public static ContactsUtils instance;

    public static int getApiLevel() {
        if (currentApi > 0) {
            return currentApi;
        }
        if (Build.VERSION.SDK.equalsIgnoreCase("3")) {
            currentApi = 3;
        } else {
            try {
                currentApi = ((Integer) Build.VERSION.class.getDeclaredField("SDK_INT").get((Object) null)).intValue();
            } catch (Exception e) {
                return 0;
            }
        }
        return currentApi;
    }

    public static ContactsUtils getInstance() {
        return instance != null ? instance : getApiLevel() >= 5 ? new ContactsUtils5() : new ContactsUtils3();
    }

    public abstract Contact queryByPhoneNumber(Context context, String str);

    public abstract Cursor queryPhoneList(ContentResolver contentResolver);
}
