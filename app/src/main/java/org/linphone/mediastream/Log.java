package org.linphone.mediastream;

public final class Log {
    private static Log logger;

    private Log() {
    }

    @Deprecated
    public Log(String str, boolean z) {
    }

    private native void d(String str);

    public static void d(Object... objArr) {
        instance().d(toString(objArr));
    }

    private native void e(String str);

    public static void e(Object... objArr) {
        instance().e(toString(objArr));
    }

    private native void i(String str);

    public static void i(Object... objArr) {
        instance().i(toString(objArr));
    }

    private static Log instance() {
        if (logger == null) {
            logger = new Log();
        }
        return logger;
    }

    private static String toString(Object... objArr) {
        StringBuilder sb = new StringBuilder();
        for (Object append : objArr) {
            sb.append(append);
        }
        return sb.toString();
    }

    private native void w(String str);

    public static void w(Object... objArr) {
        instance().w(toString(objArr));
    }
}
