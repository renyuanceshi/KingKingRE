package com.facebook.internal;

public class InternalSettings {
    private static volatile String mCustomUserAgent;

    public static String getCustomUserAgent() {
        return mCustomUserAgent;
    }

    public static void setCustomUserAgent(String str) {
        mCustomUserAgent = str;
    }
}
