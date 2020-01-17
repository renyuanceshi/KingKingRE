package com.pccwmobile.common.utilities;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

public class ConnectionManagerUtilities {
    public static Boolean isRoaming(Context context) {
        NetworkInfo networkInfo;
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivityManager == null || (networkInfo = connectivityManager.getNetworkInfo(0)) == null) {
            return null;
        }
        return networkInfo.isRoaming();
    }

    public static Boolean isUsingMobileData(Context context) {
        NetworkInfo networkInfo;
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivityManager == null || (networkInfo = connectivityManager.getNetworkInfo(0)) == null) {
            return null;
        }
        return networkInfo.isConnected();
    }

    public static Boolean isUsingWifi(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        if (connectivityManager != null) {
            return connectivityManager.getNetworkInfo(1).isConnected();
        }
        return null;
    }
}
