package org.apache.commons.lang;

import org.apache.commons.lang3.StringUtils;

public class WordUtils {
    public static String abbreviate(String str, int i, int i2, String str2) {
        if (str == null) {
            return null;
        }
        if (str.length() == 0) {
            return "";
        }
        int length = i > str.length() ? str.length() : i;
        int length2 = (i2 == -1 || i2 > str.length()) ? str.length() : i2;
        if (length2 < length) {
            length2 = length;
        }
        StringBuffer stringBuffer = new StringBuffer();
        int indexOf = StringUtils.indexOf(str, StringUtils.SPACE, length);
        if (indexOf == -1) {
            stringBuffer.append(str.substring(0, length2));
            if (length2 != str.length()) {
                stringBuffer.append(StringUtils.defaultString(str2));
            }
        } else if (indexOf > length2) {
            stringBuffer.append(str.substring(0, length2));
            stringBuffer.append(StringUtils.defaultString(str2));
        } else {
            stringBuffer.append(str.substring(0, indexOf));
            stringBuffer.append(StringUtils.defaultString(str2));
        }
        return stringBuffer.toString();
    }

    public static String capitalize(String str) {
        return capitalize(str, (char[]) null);
    }

    public static String capitalize(String str, char[] cArr) {
        int length = cArr == null ? -1 : cArr.length;
        if (str == null || str.length() == 0 || length == 0) {
            return str;
        }
        int length2 = str.length();
        StringBuffer stringBuffer = new StringBuffer(length2);
        boolean z = true;
        for (int i = 0; i < length2; i++) {
            char charAt = str.charAt(i);
            if (isDelimiter(charAt, cArr)) {
                stringBuffer.append(charAt);
                z = true;
            } else if (z) {
                stringBuffer.append(Character.toTitleCase(charAt));
                z = false;
            } else {
                stringBuffer.append(charAt);
            }
        }
        return stringBuffer.toString();
    }

    public static String capitalizeFully(String str) {
        return capitalizeFully(str, (char[]) null);
    }

    public static String capitalizeFully(String str, char[] cArr) {
        return (str == null || str.length() == 0 || (cArr == null ? -1 : cArr.length) == 0) ? str : capitalize(str.toLowerCase(), cArr);
    }

    public static String initials(String str) {
        return initials(str, (char[]) null);
    }

    public static String initials(String str, char[] cArr) {
        boolean z;
        if (str == null || str.length() == 0) {
            return str;
        }
        if (cArr != null && cArr.length == 0) {
            return "";
        }
        int length = str.length();
        char[] cArr2 = new char[((length / 2) + 1)];
        int i = 0;
        int i2 = 0;
        boolean z2 = true;
        while (i2 < length) {
            char charAt = str.charAt(i2);
            if (isDelimiter(charAt, cArr)) {
                z = true;
            } else if (z2) {
                cArr2[i] = charAt;
                i++;
                z = false;
            } else {
                z = z2;
            }
            i2++;
            z2 = z;
        }
        return new String(cArr2, 0, i);
    }

    private static boolean isDelimiter(char c, char[] cArr) {
        if (cArr == null) {
            return Character.isWhitespace(c);
        }
        for (char c2 : cArr) {
            if (c == c2) {
                return true;
            }
        }
        return false;
    }

    public static String swapCase(String str) {
        int length;
        if (str == null || (length = str.length()) == 0) {
            return str;
        }
        StringBuffer stringBuffer = new StringBuffer(length);
        int i = 0;
        boolean z = true;
        while (i < length) {
            char charAt = str.charAt(i);
            stringBuffer.append(Character.isUpperCase(charAt) ? Character.toLowerCase(charAt) : Character.isTitleCase(charAt) ? Character.toLowerCase(charAt) : Character.isLowerCase(charAt) ? z ? Character.toTitleCase(charAt) : Character.toUpperCase(charAt) : charAt);
            i++;
            z = Character.isWhitespace(charAt);
        }
        return stringBuffer.toString();
    }

    public static String uncapitalize(String str) {
        return uncapitalize(str, (char[]) null);
    }

    public static String uncapitalize(String str, char[] cArr) {
        int length = cArr == null ? -1 : cArr.length;
        if (str == null || str.length() == 0 || length == 0) {
            return str;
        }
        int length2 = str.length();
        StringBuffer stringBuffer = new StringBuffer(length2);
        boolean z = true;
        for (int i = 0; i < length2; i++) {
            char charAt = str.charAt(i);
            if (isDelimiter(charAt, cArr)) {
                stringBuffer.append(charAt);
                z = true;
            } else if (z) {
                stringBuffer.append(Character.toLowerCase(charAt));
                z = false;
            } else {
                stringBuffer.append(charAt);
            }
        }
        return stringBuffer.toString();
    }

    public static String wrap(String str, int i) {
        return wrap(str, i, (String) null, false);
    }

    public static String wrap(String str, int i, String str2, boolean z) {
        if (str == null) {
            return null;
        }
        if (str2 == null) {
            str2 = SystemUtils.LINE_SEPARATOR;
        }
        if (i < 1) {
            i = 1;
        }
        int length = str.length();
        int i2 = 0;
        StringBuffer stringBuffer = new StringBuffer(length + 32);
        while (length - i2 > i) {
            if (str.charAt(i2) == ' ') {
                i2++;
            } else {
                int lastIndexOf = str.lastIndexOf(32, i + i2);
                if (lastIndexOf >= i2) {
                    stringBuffer.append(str.substring(i2, lastIndexOf));
                    stringBuffer.append(str2);
                    i2 = lastIndexOf + 1;
                } else if (z) {
                    stringBuffer.append(str.substring(i2, i + i2));
                    stringBuffer.append(str2);
                    i2 += i;
                } else {
                    int indexOf = str.indexOf(32, i + i2);
                    if (indexOf >= 0) {
                        stringBuffer.append(str.substring(i2, indexOf));
                        stringBuffer.append(str2);
                        i2 = indexOf + 1;
                    } else {
                        stringBuffer.append(str.substring(i2));
                        i2 = length;
                    }
                }
            }
        }
        stringBuffer.append(str.substring(i2));
        return stringBuffer.toString();
    }
}
