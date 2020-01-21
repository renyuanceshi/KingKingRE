package com.pccw.mobile.sip.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;

public class NetworkUtils {
    private static final NetworkUtils instance = new NetworkUtils();

    private NetworkUtils() {
    }

    public static NetworkUtils getInstance() {
        return instance;
    }

    public static boolean isWifiAvailable(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE)).getActiveNetworkInfo();
        boolean z = activeNetworkInfo != null && activeNetworkInfo.getType() == 1;
        WifiInfo connectionInfo = ((WifiManager) context.getApplicationContext().getSystemService(Context.WIFI_SERVICE)).getConnectionInfo();
        return connectionInfo != null && Boolean.valueOf(z).booleanValue() && connectionInfo.getIpAddress() != 0 && (WifiInfo.getDetailedStateOf(connectionInfo.getSupplicantState()) == NetworkInfo.DetailedState.OBTAINING_IPADDR || WifiInfo.getDetailedStateOf(connectionInfo.getSupplicantState()) == NetworkInfo.DetailedState.CONNECTED);
    }
}
