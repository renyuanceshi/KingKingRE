package com.pccwmobile.common.utilities;

public class Log {
    private static final int LOG_LEVEL = 2;
    public static boolean isSecretLogEnable = false;

    public static void d(String str, String str2) {
        android.util.Log.d(str, str2);
    }

    public static void e(String str, String str2) {
        android.util.Log.e(str, str2);
    }

    public static void e(String str, String str2, Throwable th) {
        android.util.Log.e(str, str2, th);
    }

    public static void i(String str, String str2) {
        android.util.Log.i(str, str2);
    }

    public static void v(String str, String str2) {
        android.util.Log.v(str, str2);
    }

    public static void w(String str, String str2) {
        android.util.Log.w(str, str2);
    }
}
