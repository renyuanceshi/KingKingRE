package org.linphone.tools;

import org.linphone.core.LpConfig;
import org.linphone.mediastream.Log;

public class Lpc2Xml {
    private static boolean mAvailable;
    private long internalPtr = 0;

    private enum LogLevel {
        DEBUG,
        MESSAGE,
        WARNING,
        ERROR
    }

    static {
        try {
            System.loadLibrary("xml2");
            mAvailable = true;
        } catch (Throwable th) {
            mAvailable = false;
        }
    }

    public Lpc2Xml() {
        init();
    }

    private native void destroy();

    private native void init();

    static boolean isAvailable() {
        return mAvailable;
    }

    public native int convertFile(String str);

    public native int convertString(StringBuffer stringBuffer);

    public void finalize() {
        destroy();
    }

    public void printLog(int i, String str) {
        if (i > 0 && i < LogLevel.values().length) {
            switch (LogLevel.values()[i]) {
                case DEBUG:
                    Log.d(str);
                    return;
                case MESSAGE:
                    Log.i(str);
                    return;
                case WARNING:
                    Log.w(str);
                    return;
                case ERROR:
                    Log.e(str);
                    return;
                default:
                    return;
            }
        }
    }

    public native int setLpc(LpConfig lpConfig);
}
