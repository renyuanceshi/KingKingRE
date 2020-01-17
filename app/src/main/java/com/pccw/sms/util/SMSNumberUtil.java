package com.pccw.sms.util;

import com.pccw.mobile.util.MobileNumberUtil;
import com.pccw.mobile.util.StringUtil;
import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.util.TextUtils;

public class SMSNumberUtil {
    public static final int MAX_NUMBER_LENGTH = 25;
    private static final String[] hkPrefix = {"+852", "001852"};
    private static final String[] iddPrefix = {"+"};

    public static String formatNumber(String str) {
        String trimSymbol = trimSymbol(str);
        for (String str2 : hkPrefix) {
            if (trimSymbol.startsWith(str2)) {
                return trimSymbol.substring(str2.length());
            }
        }
        return trimSymbol;
    }

    public static boolean isHKLandlineNumber(String str) {
        if (str == null) {
            return false;
        }
        String trimSymbol = trimSymbol(str);
        if (TextUtils.isEmpty(trimSymbol)) {
            return false;
        }
        String[] strArr = hkPrefix;
        int length = strArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            String str2 = strArr[i];
            if (trimSymbol.startsWith(str2)) {
                trimSymbol = trimSymbol.substring(str2.length());
                break;
            }
            i++;
        }
        if (StringUtil.isNumeric(trimSymbol)) {
            return MobileNumberUtil.isHKMobileNumberStart(trimSymbol);
        }
        return false;
    }

    public static boolean isHKMobileNumber(String str) {
        if (str == null) {
            return false;
        }
        String trimSymbol = trimSymbol(str);
        if (TextUtils.isEmpty(trimSymbol)) {
            return false;
        }
        String[] strArr = hkPrefix;
        int length = strArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            String str2 = strArr[i];
            if (trimSymbol.startsWith(str2)) {
                trimSymbol = trimSymbol.substring(str2.length());
                break;
            }
            i++;
        }
        if (StringUtil.isNumeric(trimSymbol)) {
            return MobileNumberUtil.isHKMobileNumberStart(trimSymbol);
        }
        return false;
    }

    public static boolean isInternationalNumber(String str) {
        if (str == null) {
            return false;
        }
        String trimSymbol = trimSymbol(str);
        if (TextUtils.isEmpty(trimSymbol)) {
            return false;
        }
        for (String startsWith : hkPrefix) {
            if (trimSymbol.startsWith(startsWith)) {
                return false;
            }
        }
        for (String str2 : iddPrefix) {
            if (trimSymbol.startsWith(str2) && StringUtil.isNumeric(trimSymbol.substring(str2.length()))) {
                return true;
            }
        }
        return false;
    }

    public static boolean isValidRecipient(String str) {
        if (str == null) {
            return false;
        }
        String trimSymbol = trimSymbol(str);
        if (TextUtils.isEmpty(trimSymbol) || trimSymbol.length() > 25) {
            return false;
        }
        for (String str2 : hkPrefix) {
            if (trimSymbol.startsWith(str2)) {
                return (StringUtil.isNumeric(trimSymbol.substring(str2.length())) && trimSymbol.substring(str2.length()).length() == 8) || trimSymbol.substring(str2.length()).equals("992");
            }
        }
        for (String str3 : iddPrefix) {
            if (trimSymbol.startsWith(str3)) {
                return StringUtil.isNumeric(trimSymbol.substring(str3.length()));
            }
        }
        return (StringUtil.isNumeric(trimSymbol) && trimSymbol.length() == 8) || trimSymbol.equals("992");
    }

    public static String trimSpace(String str) {
        return str.replace(StringUtils.SPACE, "");
    }

    public static String trimSymbol(String str) {
        return str.replace(StringUtils.SPACE, "").replace("(", "").replace(")", "").replace("-", "").replace(StringEscapeUtils.unescapeJava("\\u00A0"), "");
    }
}
