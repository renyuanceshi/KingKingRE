package com.pccw.mobile.util;

import android.content.Context;
import android.net.wifi.WifiManager;
import android.os.Build;

public class SSIDUtil {
    public static String getCurrentSSID(Context context) {
        String ssid = ((WifiManager) context.getSystemService("wifi")).getConnectionInfo().getSSID();
        return ssid == null ? "" : removeQuotationsInCurrentSSIDForJellyBean(ssid);
    }

    public static String removeQuotationsInCurrentSSIDForJellyBean(String str) {
        return (Build.VERSION.SDK_INT < 16 || !str.startsWith("\"") || !str.endsWith("\"")) ? str : str.substring(1, str.length() - 1);
    }
}
