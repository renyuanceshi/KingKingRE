package com.pccw.mobile.util;

import java.util.regex.Pattern;
import org.apache.commons.lang.StringEscapeUtils;

public class StringUtil {
    public static final char[] hexChar = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    public static boolean isContainChinese(String str) {
        return str.getBytes().length != str.length();
    }

    public static final boolean isNotEmpty(String str) {
        return str != null && str.length() > 0;
    }

    public static boolean isNumeric(String str) {
        return Pattern.compile("[0-9]*").matcher(str).matches();
    }

    public static String unicodeEscape(String str) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if ((charAt >> 7) > 0) {
                sb.append("\\u");
                sb.append(hexChar[(charAt >> 12) & 15]);
                sb.append(hexChar[(charAt >> 8) & 15]);
                sb.append(hexChar[(charAt >> 4) & 15]);
                sb.append(hexChar[charAt & 15]);
            } else if (charAt == '&') {
                sb.append("\\u0026");
            } else if (charAt == '%') {
                sb.append("\\u0025");
            } else if (charAt == '+') {
                sb.append("\\u002B");
            } else if (charAt == '\\') {
                sb.append("\\u005C");
            } else {
                sb.append(charAt);
            }
        }
        return sb.toString();
    }

    public static String unicodeUnescape(String str) {
        return StringEscapeUtils.unescapeJava(str);
    }
}
