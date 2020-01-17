package org.linphone.core;

public final class Log {
    public static final String TAG = "PCCW_MOBILE_SIP";
    private static final boolean useIsLoggable = false;

    public static void d(Throwable th, Object... objArr) {
        if (isLoggable(3)) {
        }
    }

    public static void d(Object... objArr) {
        if (isLoggable(3)) {
        }
    }

    public static void e(Throwable th, Object... objArr) {
        if (isLoggable(6)) {
        }
    }

    public static void e(Object... objArr) {
        if (isLoggable(6)) {
        }
    }

    public static void f(Throwable th, Object... objArr) {
        if (isLoggable(6)) {
            android.util.Log.e("PCCW_MOBILE_SIP", toString(objArr), th);
            throw new RuntimeException("Fatal error : " + toString(objArr), th);
        }
    }

    public static void f(Object... objArr) {
        if (isLoggable(6)) {
            android.util.Log.e("PCCW_MOBILE_SIP", toString(objArr));
            throw new RuntimeException("Fatal error : " + toString(objArr));
        }
    }

    public static void i(Throwable th, Object... objArr) {
        if (isLoggable(4)) {
        }
    }

    public static void i(Object... objArr) {
        if (isLoggable(4)) {
        }
    }

    private static boolean isLoggable(int i) {
        return true;
    }

    private static String toString(Object... objArr) {
        StringBuilder sb = new StringBuilder();
        for (Object append : objArr) {
            sb.append(append);
        }
        return sb.toString();
    }

    public static void w(Throwable th, Object... objArr) {
        if (isLoggable(5)) {
        }
    }

    public static void w(Object... objArr) {
        if (isLoggable(5)) {
        }
    }
}
