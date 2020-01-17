package com.pccw.pref;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import java.util.ArrayList;

public class IgnoreSSIDList {
    private static final String IGNORE_SSID_LIST_PREF_NAME = "IGNORE_SSID_";
    public static final int IgnoreSSIDListSize = 50;
    public static final int SSID_ADD_TO_LIST_SUCCESS = 0;
    public static final int SSID_ERROR_ALREADY_EXIST = -1;
    public static final int SSID_ERROR_FULL = -3;
    public static final int SSID_ERROR_NOT_EXIST = -2;
    public static final int SSID_ERROR_NULL = -4;

    public static int addSSID(Context context, String str) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        SharedPreferences.Editor edit = defaultSharedPreferences.edit();
        ArrayList arrayList = new ArrayList(50);
        for (int i = 0; i < 50; i++) {
            arrayList.add(defaultSharedPreferences.getString(IGNORE_SSID_LIST_PREF_NAME + i, ""));
        }
        if (arrayList.contains(str)) {
            return -1;
        }
        if (!arrayList.contains("")) {
            for (int i2 = 0; i2 < 49; i2++) {
                edit.putString(IGNORE_SSID_LIST_PREF_NAME + i2, (String) arrayList.get(i2 + 1));
                edit.commit();
            }
            edit.putString("IGNORE_SSID_49", str);
            edit.commit();
            return 0;
        }
        edit.putString(IGNORE_SSID_LIST_PREF_NAME + arrayList.indexOf(""), str);
        edit.commit();
        return 0;
    }

    public static boolean containsSSID(Context context, String str) {
        if (str.equals("")) {
            return false;
        }
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        ArrayList arrayList = new ArrayList(50);
        for (int i = 0; i < 50; i++) {
            arrayList.add(defaultSharedPreferences.getString(IGNORE_SSID_LIST_PREF_NAME + i, ""));
        }
        return arrayList.contains(str);
    }

    public static ArrayList<String> getList(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        ArrayList<String> arrayList = new ArrayList<>(50);
        for (int i = 0; i < 50; i++) {
            arrayList.add(defaultSharedPreferences.getString(IGNORE_SSID_LIST_PREF_NAME + i, ""));
        }
        return arrayList;
    }

    public static String getSSID(Context context, int i) {
        return PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext()).getString(IGNORE_SSID_LIST_PREF_NAME + i, "");
    }

    public static int getSize(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        int i = 0;
        for (int i2 = 0; i2 < 50; i2++) {
            if (!defaultSharedPreferences.getString(IGNORE_SSID_LIST_PREF_NAME + i2, "").equals("")) {
                i++;
            }
        }
        return i;
    }

    public static int removeSSID(Context context, String str) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context.getApplicationContext());
        SharedPreferences.Editor edit = defaultSharedPreferences.edit();
        ArrayList arrayList = new ArrayList(50);
        for (int i = 0; i < 50; i++) {
            arrayList.add(defaultSharedPreferences.getString(IGNORE_SSID_LIST_PREF_NAME + i, ""));
        }
        if (!arrayList.contains(str)) {
            return -2;
        }
        edit.putString(IGNORE_SSID_LIST_PREF_NAME + arrayList.indexOf(str), "");
        edit.commit();
        return 0;
    }
}
