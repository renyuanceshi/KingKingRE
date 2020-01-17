package com.pccw.pref;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import java.util.ArrayList;

public class SSIDList {
    public static final int SSIDListSize = 10;
    public static final int SSID_ADD_TO_LIST_SUCCESS = 0;
    public static final int SSID_ERROR_ALREADY_EXIST = -1;
    public static final int SSID_ERROR_FULL = -3;
    public static final int SSID_ERROR_NOT_EXIST = -2;
    public static final int SSID_ERROR_NULL = -4;
    private static final String SSID_LIST_PREF_NAME = "SSID_";

    public static int addSSID(Context context, String str) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        SharedPreferences.Editor edit = defaultSharedPreferences.edit();
        ArrayList arrayList = new ArrayList(10);
        for (int i = 0; i < 10; i++) {
            arrayList.add(defaultSharedPreferences.getString(SSID_LIST_PREF_NAME + i, ""));
        }
        if (arrayList.contains(str)) {
            return -1;
        }
        if (!arrayList.contains("")) {
            return -3;
        }
        edit.putString(SSID_LIST_PREF_NAME + arrayList.indexOf(""), str);
        edit.commit();
        return 0;
    }

    public static boolean containsSSID(Context context, String str) {
        if (str.equals("")) {
            return false;
        }
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        ArrayList arrayList = new ArrayList(10);
        for (int i = 0; i < 10; i++) {
            arrayList.add(defaultSharedPreferences.getString(SSID_LIST_PREF_NAME + i, ""));
        }
        return arrayList.contains(str);
    }

    public static ArrayList<String> getList(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        ArrayList<String> arrayList = new ArrayList<>(10);
        for (int i = 0; i < 10; i++) {
            arrayList.add(defaultSharedPreferences.getString(SSID_LIST_PREF_NAME + i, ""));
        }
        return arrayList;
    }

    public static String getSSID(Context context, int i) {
        return PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getString(SSID_LIST_PREF_NAME + i, "");
    }

    public static int getSize(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        int i = 0;
        for (int i2 = 0; i2 < 10; i2++) {
            if (!defaultSharedPreferences.getString(SSID_LIST_PREF_NAME + i2, "").equals("")) {
                i++;
            }
        }
        return i;
    }

    public static int removeSSID(Context context, String str) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        SharedPreferences.Editor edit = defaultSharedPreferences.edit();
        ArrayList arrayList = new ArrayList(10);
        for (int i = 0; i < 10; i++) {
            arrayList.add(defaultSharedPreferences.getString(SSID_LIST_PREF_NAME + i, ""));
        }
        if (!arrayList.contains(str)) {
            return -2;
        }
        edit.putString(SSID_LIST_PREF_NAME + arrayList.indexOf(str), "");
        edit.commit();
        return 0;
    }
}
