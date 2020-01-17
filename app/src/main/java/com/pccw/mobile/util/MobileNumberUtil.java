package com.pccw.mobile.util;

public class MobileNumberUtil {
    public static boolean isHKMobileNumberStart(String str) {
        return (str.length() == 8 && str.startsWith("4")) || str.startsWith("7") || str.startsWith("5") || str.startsWith("6") || str.startsWith("8") || str.startsWith("9");
    }
}
