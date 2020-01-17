package org.apache.commons.lang;

import android.support.v7.widget.ActivityChooserView;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

public class StringUtils {
    public static final String EMPTY = "";
    public static final int INDEX_NOT_FOUND = -1;
    private static final int PAD_LIMIT = 8192;

    public static String abbreviate(String str, int i) {
        return abbreviate(str, 0, i);
    }

    public static String abbreviate(String str, int i, int i2) {
        if (str == null) {
            return null;
        }
        if (i2 < 4) {
            throw new IllegalArgumentException("Minimum abbreviation width is 4");
        } else if (str.length() <= i2) {
            return str;
        } else {
            if (i > str.length()) {
                i = str.length();
            }
            if (str.length() - i < i2 - 3) {
                i = str.length() - (i2 - 3);
            }
            if (i <= 4) {
                return new StringBuffer().append(str.substring(0, i2 - 3)).append("...").toString();
            }
            if (i2 >= 7) {
                return (i2 + -3) + i < str.length() ? new StringBuffer().append("...").append(abbreviate(str.substring(i), i2 - 3)).toString() : new StringBuffer().append("...").append(str.substring(str.length() - (i2 - 3))).toString();
            }
            throw new IllegalArgumentException("Minimum abbreviation width with offset is 7");
        }
    }

    public static String abbreviateMiddle(String str, String str2, int i) {
        if (isEmpty(str) || isEmpty(str2) || i >= str.length() || i < str2.length() + 2) {
            return str;
        }
        int length = i - str2.length();
        StringBuffer stringBuffer = new StringBuffer(i);
        stringBuffer.append(str.substring(0, (length % 2) + (length / 2)));
        stringBuffer.append(str2);
        stringBuffer.append(str.substring(str.length() - (length / 2)));
        return stringBuffer.toString();
    }

    public static String capitalise(String str) {
        return capitalize(str);
    }

    public static String capitaliseAllWords(String str) {
        return WordUtils.capitalize(str);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:1:0x0002, code lost:
        r0 = r2.length();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.String capitalize(java.lang.String r2) {
        /*
            if (r2 == 0) goto L_0x0008
            int r0 = r2.length()
            if (r0 != 0) goto L_0x0009
        L_0x0008:
            return r2
        L_0x0009:
            java.lang.StringBuffer r1 = new java.lang.StringBuffer
            r1.<init>(r0)
            r0 = 0
            char r0 = r2.charAt(r0)
            char r0 = java.lang.Character.toTitleCase(r0)
            java.lang.StringBuffer r0 = r1.append(r0)
            r1 = 1
            java.lang.String r1 = r2.substring(r1)
            java.lang.StringBuffer r0 = r0.append(r1)
            java.lang.String r2 = r0.toString()
            goto L_0x0008
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.StringUtils.capitalize(java.lang.String):java.lang.String");
    }

    public static String center(String str, int i) {
        return center(str, i, ' ');
    }

    /* JADX WARNING: Code restructure failed: missing block: B:2:0x0005, code lost:
        r0 = r2.length();
        r1 = r3 - r0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.String center(java.lang.String r2, int r3, char r4) {
        /*
            if (r2 == 0) goto L_0x0004
            if (r3 > 0) goto L_0x0005
        L_0x0004:
            return r2
        L_0x0005:
            int r0 = r2.length()
            int r1 = r3 - r0
            if (r1 <= 0) goto L_0x0004
            int r1 = r1 / 2
            int r0 = r0 + r1
            java.lang.String r0 = leftPad((java.lang.String) r2, (int) r0, (char) r4)
            java.lang.String r2 = rightPad((java.lang.String) r0, (int) r3, (char) r4)
            goto L_0x0004
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.StringUtils.center(java.lang.String, int, char):java.lang.String");
    }

    public static String center(String str, int i, String str2) {
        if (str == null || i <= 0) {
            return str;
        }
        if (isEmpty(str2)) {
            str2 = org.apache.commons.lang3.StringUtils.SPACE;
        }
        int length = str.length();
        int i2 = i - length;
        return i2 > 0 ? rightPad(leftPad(str, length + (i2 / 2), str2), i, str2) : str;
    }

    public static String chomp(String str) {
        if (isEmpty(str)) {
            return str;
        }
        if (str.length() == 1) {
            char charAt = str.charAt(0);
            return (charAt == 13 || charAt == 10) ? "" : str;
        }
        int length = str.length() - 1;
        char charAt2 = str.charAt(length);
        if (charAt2 == 10) {
            if (str.charAt(length - 1) == 13) {
                length--;
            }
        } else if (charAt2 != 13) {
            length++;
        }
        return str.substring(0, length);
    }

    public static String chomp(String str, String str2) {
        return (isEmpty(str) || str2 == null || !str.endsWith(str2)) ? str : str.substring(0, str.length() - str2.length());
    }

    public static String chompLast(String str) {
        return chompLast(str, org.apache.commons.lang3.StringUtils.LF);
    }

    public static String chompLast(String str, String str2) {
        return (str.length() != 0 && str2.equals(str.substring(str.length() - str2.length()))) ? str.substring(0, str.length() - str2.length()) : str;
    }

    public static String chop(String str) {
        if (str == null) {
            return null;
        }
        int length = str.length();
        if (length < 2) {
            return "";
        }
        int i = length - 1;
        String substring = str.substring(0, i);
        return (str.charAt(i) == 10 && substring.charAt(i + -1) == 13) ? substring.substring(0, i - 1) : substring;
    }

    public static String chopNewline(String str) {
        int length = str.length() - 1;
        if (length <= 0) {
            return "";
        }
        if (str.charAt(length) != 10) {
            length++;
        } else if (str.charAt(length - 1) == 13) {
            length--;
        }
        return str.substring(0, length);
    }

    public static String clean(String str) {
        return str == null ? "" : str.trim();
    }

    public static String concatenate(Object[] objArr) {
        return join(objArr, (String) null);
    }

    public static boolean contains(String str, char c) {
        return !isEmpty(str) && str.indexOf(c) >= 0;
    }

    public static boolean contains(String str, String str2) {
        return (str == null || str2 == null || str.indexOf(str2) < 0) ? false : true;
    }

    public static boolean containsAny(String str, String str2) {
        if (str2 == null) {
            return false;
        }
        return containsAny(str, str2.toCharArray());
    }

    public static boolean containsAny(String str, char[] cArr) {
        if (str == null || str.length() == 0 || cArr == null || cArr.length == 0) {
            return false;
        }
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            for (char c : cArr) {
                if (c == charAt) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean containsIgnoreCase(String str, String str2) {
        if (str == null || str2 == null) {
            return false;
        }
        int length = str2.length();
        int length2 = str.length();
        for (int i = 0; i <= length2 - length; i++) {
            if (str.regionMatches(true, i, str2, 0, length)) {
                return true;
            }
        }
        return false;
    }

    public static boolean containsNone(String str, String str2) {
        if (str == null || str2 == null) {
            return true;
        }
        return containsNone(str, str2.toCharArray());
    }

    public static boolean containsNone(String str, char[] cArr) {
        if (str == null || cArr == null) {
            return true;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            for (char c : cArr) {
                if (c == charAt) {
                    return false;
                }
            }
        }
        return true;
    }

    public static boolean containsOnly(String str, String str2) {
        if (str == null || str2 == null) {
            return false;
        }
        return containsOnly(str, str2.toCharArray());
    }

    public static boolean containsOnly(String str, char[] cArr) {
        if (cArr == null || str == null) {
            return false;
        }
        return str.length() == 0 || (cArr.length != 0 && indexOfAnyBut(str, cArr) == -1);
    }

    public static int countMatches(String str, String str2) {
        int i = 0;
        if (isEmpty(str) || isEmpty(str2)) {
            return 0;
        }
        int i2 = 0;
        while (true) {
            int indexOf = str.indexOf(str2, i);
            if (indexOf == -1) {
                return i2;
            }
            i2++;
            i = indexOf + str2.length();
        }
    }

    public static String defaultIfEmpty(String str, String str2) {
        return isEmpty(str) ? str2 : str;
    }

    public static String defaultString(String str) {
        return str == null ? "" : str;
    }

    public static String defaultString(String str, String str2) {
        return str == null ? str2 : str;
    }

    public static String deleteSpaces(String str) {
        if (str == null) {
            return null;
        }
        return CharSetUtils.delete(str, " \t\r\n\b");
    }

    public static String deleteWhitespace(String str) {
        int i;
        if (isEmpty(str)) {
            return str;
        }
        int length = str.length();
        char[] cArr = new char[length];
        int i2 = 0;
        int i3 = 0;
        while (i3 < length) {
            if (!Character.isWhitespace(str.charAt(i3))) {
                i = i2 + 1;
                cArr[i2] = str.charAt(i3);
            } else {
                i = i2;
            }
            i3++;
            i2 = i;
        }
        return i2 != length ? new String(cArr, 0, i2) : str;
    }

    public static String difference(String str, String str2) {
        if (str == null) {
            return str2;
        }
        if (str2 == null) {
            return str;
        }
        int indexOfDifference = indexOfDifference(str, str2);
        return indexOfDifference == -1 ? "" : str2.substring(indexOfDifference);
    }

    public static boolean endsWith(String str, String str2) {
        return endsWith(str, str2, false);
    }

    private static boolean endsWith(String str, String str2, boolean z) {
        if (str == null || str2 == null) {
            return str == null && str2 == null;
        }
        if (str2.length() > str.length()) {
            return false;
        }
        return str.regionMatches(z, str.length() - str2.length(), str2, 0, str2.length());
    }

    public static boolean endsWithIgnoreCase(String str, String str2) {
        return endsWith(str, str2, true);
    }

    public static boolean equals(String str, String str2) {
        return str == null ? str2 == null : str.equals(str2);
    }

    public static boolean equalsIgnoreCase(String str, String str2) {
        return str == null ? str2 == null : str.equalsIgnoreCase(str2);
    }

    public static String escape(String str) {
        return StringEscapeUtils.escapeJava(str);
    }

    public static String getChomp(String str, String str2) {
        int lastIndexOf = str.lastIndexOf(str2);
        return lastIndexOf == str.length() - str2.length() ? str2 : lastIndexOf != -1 ? str.substring(lastIndexOf) : "";
    }

    public static String getCommonPrefix(String[] strArr) {
        if (strArr == null || strArr.length == 0) {
            return "";
        }
        int indexOfDifference = indexOfDifference(strArr);
        return indexOfDifference == -1 ? strArr[0] == null ? "" : strArr[0] : indexOfDifference == 0 ? "" : strArr[0].substring(0, indexOfDifference);
    }

    public static int getLevenshteinDistance(String str, String str2) {
        String str3;
        String str4;
        int i;
        if (str == null || str2 == null) {
            throw new IllegalArgumentException("Strings must not be null");
        }
        int length = str.length();
        int length2 = str2.length();
        if (length == 0) {
            return length2;
        }
        if (length2 == 0) {
            return length;
        }
        if (length > length2) {
            i = str.length();
            str3 = str;
            str4 = str2;
            length = length2;
        } else {
            str3 = str2;
            str4 = str;
            i = length2;
        }
        int[] iArr = new int[(length + 1)];
        int[] iArr2 = new int[(length + 1)];
        for (int i2 = 0; i2 <= length; i2++) {
            iArr[i2] = i2;
        }
        int i3 = 1;
        int[] iArr3 = iArr;
        while (i3 <= i) {
            char charAt = str3.charAt(i3 - 1);
            iArr2[0] = i3;
            for (int i4 = 1; i4 <= length; i4++) {
                iArr2[i4] = Math.min(Math.min(iArr2[i4 - 1] + 1, iArr3[i4] + 1), (str4.charAt(i4 + -1) == charAt ? 0 : 1) + iArr3[i4 - 1]);
            }
            i3++;
            int[] iArr4 = iArr2;
            iArr2 = iArr3;
            iArr3 = iArr4;
        }
        return iArr3[length];
    }

    public static String getNestedString(String str, String str2) {
        return substringBetween(str, str2, str2);
    }

    public static String getNestedString(String str, String str2, String str3) {
        return substringBetween(str, str2, str3);
    }

    public static String getPrechomp(String str, String str2) {
        int indexOf = str.indexOf(str2);
        return indexOf == -1 ? "" : str.substring(0, indexOf + str2.length());
    }

    public static int indexOf(String str, char c) {
        if (isEmpty(str)) {
            return -1;
        }
        return str.indexOf(c);
    }

    public static int indexOf(String str, char c, int i) {
        if (isEmpty(str)) {
            return -1;
        }
        return str.indexOf(c, i);
    }

    public static int indexOf(String str, String str2) {
        if (str == null || str2 == null) {
            return -1;
        }
        return str.indexOf(str2);
    }

    public static int indexOf(String str, String str2, int i) {
        if (str == null || str2 == null) {
            return -1;
        }
        return (str2.length() != 0 || i < str.length()) ? str.indexOf(str2, i) : str.length();
    }

    public static int indexOfAny(String str, String str2) {
        if (isEmpty(str) || isEmpty(str2)) {
            return -1;
        }
        return indexOfAny(str, str2.toCharArray());
    }

    public static int indexOfAny(String str, char[] cArr) {
        if (isEmpty(str) || ArrayUtils.isEmpty(cArr)) {
            return -1;
        }
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            for (char c : cArr) {
                if (c == charAt) {
                    return i;
                }
            }
        }
        return -1;
    }

    public static int indexOfAny(String str, String[] strArr) {
        int indexOf;
        if (str == null || strArr == null) {
            return -1;
        }
        int i = Integer.MAX_VALUE;
        for (String str2 : strArr) {
            if (!(str2 == null || (indexOf = str.indexOf(str2)) == -1 || indexOf >= i)) {
                i = indexOf;
            }
        }
        if (i != Integer.MAX_VALUE) {
            return i;
        }
        return -1;
    }

    public static int indexOfAnyBut(String str, String str2) {
        if (isEmpty(str) || isEmpty(str2)) {
            return -1;
        }
        for (int i = 0; i < str.length(); i++) {
            if (str2.indexOf(str.charAt(i)) < 0) {
                return i;
            }
        }
        return -1;
    }

    public static int indexOfAnyBut(String str, char[] cArr) {
        if (isEmpty(str) || ArrayUtils.isEmpty(cArr)) {
            return -1;
        }
        int i = 0;
        while (i < str.length()) {
            char charAt = str.charAt(i);
            int i2 = 0;
            while (i2 < cArr.length) {
                if (cArr[i2] == charAt) {
                    i++;
                } else {
                    i2++;
                }
            }
            return i;
        }
        return -1;
    }

    public static int indexOfDifference(String str, String str2) {
        int i = 0;
        if (str == str2) {
            return -1;
        }
        if (str == null || str2 == null) {
            return 0;
        }
        while (i < str.length() && i < str2.length() && str.charAt(i) == str2.charAt(i)) {
            i++;
        }
        if (i < str2.length() || i < str.length()) {
            return i;
        }
        return -1;
    }

    public static int indexOfDifference(String[] strArr) {
        int min;
        if (strArr == null || strArr.length <= 1) {
            return -1;
        }
        int length = strArr.length;
        int i = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
        int i2 = 0;
        boolean z = true;
        boolean z2 = false;
        int i3 = 0;
        while (i3 < length) {
            if (strArr[i3] == null) {
                min = 0;
                z2 = true;
            } else {
                min = Math.min(strArr[i3].length(), i);
                i2 = Math.max(strArr[i3].length(), i2);
                z = false;
            }
            i3++;
            i = min;
        }
        if (z || (i2 == 0 && !z2)) {
            return -1;
        }
        if (i == 0) {
            return 0;
        }
        int i4 = -1;
        for (int i5 = 0; i5 < i; i5++) {
            char charAt = strArr[0].charAt(i5);
            int i6 = 1;
            while (true) {
                if (i6 >= length) {
                    break;
                } else if (strArr[i6].charAt(i5) != charAt) {
                    i4 = i5;
                    break;
                } else {
                    i6++;
                }
            }
            if (i4 != -1) {
                break;
            }
        }
        int i7 = i4;
        return (i7 != -1 || i == i2) ? i7 : i;
    }

    public static int indexOfIgnoreCase(String str, String str2) {
        return indexOfIgnoreCase(str, str2, 0);
    }

    public static int indexOfIgnoreCase(String str, String str2, int i) {
        if (str == null || str2 == null) {
            return -1;
        }
        int i2 = i < 0 ? 0 : i;
        int length = (str.length() - str2.length()) + 1;
        if (i2 > length) {
            return -1;
        }
        if (str2.length() == 0) {
            return i2;
        }
        while (i2 < length) {
            if (str.regionMatches(true, i2, str2, 0, str2.length())) {
                return i2;
            }
            i2++;
        }
        return -1;
    }

    public static boolean isAllLowerCase(String str) {
        if (str == null || isEmpty(str)) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLowerCase(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAllUpperCase(String str) {
        if (str == null || isEmpty(str)) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isUpperCase(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAlpha(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLetter(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAlphaSpace(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLetter(str.charAt(i)) && str.charAt(i) != ' ') {
                return false;
            }
        }
        return true;
    }

    public static boolean isAlphanumeric(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLetterOrDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAlphanumericSpace(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLetterOrDigit(str.charAt(i)) && str.charAt(i) != ' ') {
                return false;
            }
        }
        return true;
    }

    public static boolean isAsciiPrintable(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!CharUtils.isAsciiPrintable(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isBlank(String str) {
        int length;
        if (str == null || (length = str.length()) == 0) {
            return true;
        }
        for (int i = 0; i < length; i++) {
            if (!Character.isWhitespace(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }

    public static boolean isNotBlank(String str) {
        return !isBlank(str);
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    public static boolean isNumeric(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isNumericSpace(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isDigit(str.charAt(i)) && str.charAt(i) != ' ') {
                return false;
            }
        }
        return true;
    }

    public static boolean isWhitespace(String str) {
        if (str == null) {
            return false;
        }
        int length = str.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isWhitespace(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static String join(Collection collection, char c) {
        if (collection == null) {
            return null;
        }
        return join(collection.iterator(), c);
    }

    public static String join(Collection collection, String str) {
        if (collection == null) {
            return null;
        }
        return join(collection.iterator(), str);
    }

    public static String join(Iterator it, char c) {
        if (it == null) {
            return null;
        }
        if (!it.hasNext()) {
            return "";
        }
        Object next = it.next();
        if (!it.hasNext()) {
            return ObjectUtils.toString(next);
        }
        StringBuffer stringBuffer = new StringBuffer(256);
        if (next != null) {
            stringBuffer.append(next);
        }
        while (it.hasNext()) {
            stringBuffer.append(c);
            Object next2 = it.next();
            if (next2 != null) {
                stringBuffer.append(next2);
            }
        }
        return stringBuffer.toString();
    }

    public static String join(Iterator it, String str) {
        if (it == null) {
            return null;
        }
        if (!it.hasNext()) {
            return "";
        }
        Object next = it.next();
        if (!it.hasNext()) {
            return ObjectUtils.toString(next);
        }
        StringBuffer stringBuffer = new StringBuffer(256);
        if (next != null) {
            stringBuffer.append(next);
        }
        while (it.hasNext()) {
            if (str != null) {
                stringBuffer.append(str);
            }
            Object next2 = it.next();
            if (next2 != null) {
                stringBuffer.append(next2);
            }
        }
        return stringBuffer.toString();
    }

    public static String join(Object[] objArr) {
        return join(objArr, (String) null);
    }

    public static String join(Object[] objArr, char c) {
        if (objArr == null) {
            return null;
        }
        return join(objArr, c, 0, objArr.length);
    }

    public static String join(Object[] objArr, char c, int i, int i2) {
        if (objArr == null) {
            return null;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuffer stringBuffer = new StringBuffer(((objArr[i] == null ? 16 : objArr[i].toString().length()) + 1) * i3);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                stringBuffer.append(c);
            }
            if (objArr[i4] != null) {
                stringBuffer.append(objArr[i4]);
            }
        }
        return stringBuffer.toString();
    }

    public static String join(Object[] objArr, String str) {
        if (objArr == null) {
            return null;
        }
        return join(objArr, str, 0, objArr.length);
    }

    public static String join(Object[] objArr, String str, int i, int i2) {
        if (objArr == null) {
            return null;
        }
        if (str == null) {
            str = "";
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuffer stringBuffer = new StringBuffer(((objArr[i] == null ? 16 : objArr[i].toString().length()) + str.length()) * i3);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                stringBuffer.append(str);
            }
            if (objArr[i4] != null) {
                stringBuffer.append(objArr[i4]);
            }
        }
        return stringBuffer.toString();
    }

    public static int lastIndexOf(String str, char c) {
        if (isEmpty(str)) {
            return -1;
        }
        return str.lastIndexOf(c);
    }

    public static int lastIndexOf(String str, char c, int i) {
        if (isEmpty(str)) {
            return -1;
        }
        return str.lastIndexOf(c, i);
    }

    public static int lastIndexOf(String str, String str2) {
        if (str == null || str2 == null) {
            return -1;
        }
        return str.lastIndexOf(str2);
    }

    public static int lastIndexOf(String str, String str2, int i) {
        if (str == null || str2 == null) {
            return -1;
        }
        return str.lastIndexOf(str2, i);
    }

    public static int lastIndexOfAny(String str, String[] strArr) {
        int lastIndexOf;
        int i = -1;
        if (!(str == null || strArr == null)) {
            for (String str2 : strArr) {
                if (str2 != null && (lastIndexOf = str.lastIndexOf(str2)) > i) {
                    i = lastIndexOf;
                }
            }
        }
        return i;
    }

    public static int lastIndexOfIgnoreCase(String str, String str2) {
        if (str == null || str2 == null) {
            return -1;
        }
        return lastIndexOfIgnoreCase(str, str2, str.length());
    }

    public static int lastIndexOfIgnoreCase(String str, String str2, int i) {
        if (str == null || str2 == null) {
            return -1;
        }
        int length = i > str.length() - str2.length() ? str.length() - str2.length() : i;
        if (length < 0) {
            return -1;
        }
        if (str2.length() == 0) {
            return length;
        }
        while (length >= 0) {
            if (str.regionMatches(true, length, str2, 0, str2.length())) {
                return length;
            }
            length--;
        }
        return -1;
    }

    public static int lastOrdinalIndexOf(String str, String str2, int i) {
        return ordinalIndexOf(str, str2, i, true);
    }

    public static String left(String str, int i) {
        if (str == null) {
            return null;
        }
        return i < 0 ? "" : str.length() > i ? str.substring(0, i) : str;
    }

    public static String leftPad(String str, int i) {
        return leftPad(str, i, ' ');
    }

    public static String leftPad(String str, int i, char c) {
        if (str == null) {
            return null;
        }
        int length = i - str.length();
        return length > 0 ? length > 8192 ? leftPad(str, i, String.valueOf(c)) : padding(length, c).concat(str) : str;
    }

    public static String leftPad(String str, int i, String str2) {
        if (str == null) {
            return null;
        }
        if (isEmpty(str2)) {
            str2 = org.apache.commons.lang3.StringUtils.SPACE;
        }
        int length = str2.length();
        int length2 = i - str.length();
        if (length2 <= 0) {
            return str;
        }
        if (length == 1 && length2 <= 8192) {
            return leftPad(str, i, str2.charAt(0));
        }
        if (length2 == length) {
            return str2.concat(str);
        }
        if (length2 < length) {
            return str2.substring(0, length2).concat(str);
        }
        char[] cArr = new char[length2];
        char[] charArray = str2.toCharArray();
        for (int i2 = 0; i2 < length2; i2++) {
            cArr[i2] = (char) charArray[i2 % length];
        }
        return new String(cArr).concat(str);
    }

    public static int length(String str) {
        if (str == null) {
            return 0;
        }
        return str.length();
    }

    public static String lowerCase(String str) {
        if (str == null) {
            return null;
        }
        return str.toLowerCase();
    }

    public static String lowerCase(String str, Locale locale) {
        if (str == null) {
            return null;
        }
        return str.toLowerCase(locale);
    }

    public static String mid(String str, int i, int i2) {
        if (str == null) {
            return null;
        }
        if (i2 < 0 || i > str.length()) {
            return "";
        }
        if (i < 0) {
            i = 0;
        }
        return str.length() <= i + i2 ? str.substring(i) : str.substring(i, i + i2);
    }

    public static int ordinalIndexOf(String str, String str2, int i) {
        return ordinalIndexOf(str, str2, i, false);
    }

    private static int ordinalIndexOf(String str, String str2, int i, boolean z) {
        int i2;
        int i3 = 0;
        int i4 = -1;
        if (str == null || str2 == null || i <= 0) {
            return -1;
        }
        if (str2.length() != 0) {
            if (z) {
                i4 = str.length();
            }
            do {
                i2 = z ? str.lastIndexOf(str2, i2 - 1) : str.indexOf(str2, i2 + 1);
                if (i2 < 0) {
                    return i2;
                }
                i3++;
            } while (i3 < i);
            return i2;
        } else if (z) {
            return str.length();
        } else {
            return 0;
        }
    }

    public static String overlay(String str, String str2, int i, int i2) {
        int i3;
        int i4;
        if (str == null) {
            return null;
        }
        if (str2 == null) {
            str2 = "";
        }
        int length = str.length();
        int i5 = i < 0 ? 0 : i;
        if (i5 > length) {
            i5 = length;
        }
        int i6 = i2 < 0 ? 0 : i2;
        if (i6 > length) {
            i6 = length;
        }
        if (i5 > i6) {
            i3 = i6;
            i4 = i5;
        } else {
            i3 = i5;
            i4 = i6;
        }
        return new StringBuffer(((length + i3) - i4) + str2.length() + 1).append(str.substring(0, i3)).append(str2).append(str.substring(i4)).toString();
    }

    public static String overlayString(String str, String str2, int i, int i2) {
        return new StringBuffer((((str2.length() + i) + str.length()) - i2) + 1).append(str.substring(0, i)).append(str2).append(str.substring(i2)).toString();
    }

    private static String padding(int i, char c) throws IndexOutOfBoundsException {
        if (i < 0) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("Cannot pad a negative amount: ").append(i).toString());
        }
        char[] cArr = new char[i];
        for (int i2 = 0; i2 < cArr.length; i2++) {
            cArr[i2] = (char) c;
        }
        return new String(cArr);
    }

    public static String prechomp(String str, String str2) {
        int indexOf = str.indexOf(str2);
        return indexOf == -1 ? str : str.substring(indexOf + str2.length());
    }

    public static String remove(String str, char c) {
        if (isEmpty(str) || str.indexOf(c) == -1) {
            return str;
        }
        char[] charArray = str.toCharArray();
        int i = 0;
        for (int i2 = 0; i2 < charArray.length; i2++) {
            if (charArray[i2] != c) {
                charArray[i] = (char) charArray[i2];
                i++;
            }
        }
        return new String(charArray, 0, i);
    }

    public static String remove(String str, String str2) {
        return (isEmpty(str) || isEmpty(str2)) ? str : replace(str, str2, "", -1);
    }

    public static String removeEnd(String str, String str2) {
        return (isEmpty(str) || isEmpty(str2) || !str.endsWith(str2)) ? str : str.substring(0, str.length() - str2.length());
    }

    public static String removeEndIgnoreCase(String str, String str2) {
        return (isEmpty(str) || isEmpty(str2) || !endsWithIgnoreCase(str, str2)) ? str : str.substring(0, str.length() - str2.length());
    }

    public static String removeStart(String str, String str2) {
        return (isEmpty(str) || isEmpty(str2) || !str.startsWith(str2)) ? str : str.substring(str2.length());
    }

    public static String removeStartIgnoreCase(String str, String str2) {
        return (isEmpty(str) || isEmpty(str2) || !startsWithIgnoreCase(str, str2)) ? str : str.substring(str2.length());
    }

    public static String repeat(String str, int i) {
        if (str == null) {
            return null;
        }
        if (i <= 0) {
            return "";
        }
        int length = str.length();
        if (i == 1 || length == 0) {
            return str;
        }
        if (length == 1 && i <= 8192) {
            return padding(i, str.charAt(0));
        }
        int i2 = length * i;
        switch (length) {
            case 1:
                char charAt = str.charAt(0);
                char[] cArr = new char[i2];
                for (int i3 = i - 1; i3 >= 0; i3--) {
                    cArr[i3] = (char) charAt;
                }
                return new String(cArr);
            case 2:
                char charAt2 = str.charAt(0);
                char charAt3 = str.charAt(1);
                char[] cArr2 = new char[i2];
                for (int i4 = (i * 2) - 2; i4 >= 0; i4 = (i4 - 1) - 1) {
                    cArr2[i4] = (char) charAt2;
                    cArr2[i4 + 1] = (char) charAt3;
                }
                return new String(cArr2);
            default:
                StringBuffer stringBuffer = new StringBuffer(i2);
                for (int i5 = 0; i5 < i; i5++) {
                    stringBuffer.append(str);
                }
                return stringBuffer.toString();
        }
    }

    public static String repeat(String str, String str2, int i) {
        return (str == null || str2 == null) ? repeat(str, i) : removeEnd(repeat(new StringBuffer().append(str).append(str2).toString(), i), str2);
    }

    public static String replace(String str, String str2, String str3) {
        return replace(str, str2, str3, -1);
    }

    public static String replace(String str, String str2, String str3, int i) {
        int indexOf;
        int i2 = 64;
        if (isEmpty(str) || isEmpty(str2) || str3 == null || i == 0 || (indexOf = str.indexOf(str2, 0)) == -1) {
            return str;
        }
        int length = str2.length();
        int length2 = str3.length() - length;
        if (length2 < 0) {
            length2 = 0;
        }
        if (i < 0) {
            i2 = 16;
        } else if (i <= 64) {
            i2 = i;
        }
        StringBuffer stringBuffer = new StringBuffer((i2 * length2) + str.length());
        int i3 = 0;
        while (indexOf != -1) {
            stringBuffer.append(str.substring(i3, indexOf)).append(str3);
            i3 = indexOf + length;
            i--;
            if (i == 0) {
                break;
            }
            indexOf = str.indexOf(str2, i3);
        }
        stringBuffer.append(str.substring(i3));
        return stringBuffer.toString();
    }

    public static String replaceChars(String str, char c, char c2) {
        if (str == null) {
            return null;
        }
        return str.replace(c, c2);
    }

    public static String replaceChars(String str, String str2, String str3) {
        if (isEmpty(str) || isEmpty(str2)) {
            return str;
        }
        if (str3 == null) {
            str3 = "";
        }
        int length = str3.length();
        int length2 = str.length();
        StringBuffer stringBuffer = new StringBuffer(length2);
        boolean z = false;
        for (int i = 0; i < length2; i++) {
            char charAt = str.charAt(i);
            int indexOf = str2.indexOf(charAt);
            if (indexOf >= 0) {
                z = true;
                if (indexOf < length) {
                    stringBuffer.append(str3.charAt(indexOf));
                }
            } else {
                stringBuffer.append(charAt);
            }
        }
        return z ? stringBuffer.toString() : str;
    }

    public static String replaceEach(String str, String[] strArr, String[] strArr2) {
        return replaceEach(str, strArr, strArr2, false, 0);
    }

    private static String replaceEach(String str, String[] strArr, String[] strArr2, boolean z, int i) {
        int length;
        if (str == null || str.length() == 0 || strArr == null || strArr.length == 0 || strArr2 == null || strArr2.length == 0) {
            return str;
        }
        if (i < 0) {
            throw new IllegalStateException(new StringBuffer().append("TimeToLive of ").append(i).append(" is less than 0: ").append(str).toString());
        }
        int length2 = strArr.length;
        int length3 = strArr2.length;
        if (length2 != length3) {
            throw new IllegalArgumentException(new StringBuffer().append("Search and Replace array lengths don't match: ").append(length2).append(" vs ").append(length3).toString());
        }
        boolean[] zArr = new boolean[length2];
        int i2 = -1;
        int i3 = -1;
        for (int i4 = 0; i4 < length2; i4++) {
            if (!(zArr[i4] || strArr[i4] == null || strArr[i4].length() == 0 || strArr2[i4] == null)) {
                int indexOf = str.indexOf(strArr[i4]);
                if (indexOf == -1) {
                    zArr[i4] = true;
                } else if (i3 == -1 || indexOf < i3) {
                    i3 = indexOf;
                    i2 = i4;
                }
            }
        }
        if (i3 == -1) {
            return str;
        }
        int i5 = 0;
        for (int i6 = 0; i6 < strArr.length; i6++) {
            if (!(strArr[i6] == null || strArr2[i6] == null || (length = strArr2[i6].length() - strArr[i6].length()) <= 0)) {
                i5 += length * 3;
            }
        }
        StringBuffer stringBuffer = new StringBuffer(Math.min(i5, str.length() / 5) + str.length());
        int i7 = 0;
        while (i3 != -1) {
            while (i7 < i3) {
                stringBuffer.append(str.charAt(i7));
                i7++;
            }
            stringBuffer.append(strArr2[i2]);
            int length4 = i3 + strArr[i2].length();
            i2 = -1;
            i3 = -1;
            for (int i8 = 0; i8 < length2; i8++) {
                if (!(zArr[i8] || strArr[i8] == null || strArr[i8].length() == 0 || strArr2[i8] == null)) {
                    int indexOf2 = str.indexOf(strArr[i8], length4);
                    if (indexOf2 == -1) {
                        zArr[i8] = true;
                    } else if (i3 == -1 || indexOf2 < i3) {
                        i3 = indexOf2;
                        i2 = i8;
                    }
                }
            }
            i7 = length4;
        }
        int length5 = str.length();
        for (int i9 = i7; i9 < length5; i9++) {
            stringBuffer.append(str.charAt(i9));
        }
        String stringBuffer2 = stringBuffer.toString();
        return z ? replaceEach(stringBuffer2, strArr, strArr2, z, i - 1) : stringBuffer2;
    }

    public static String replaceEachRepeatedly(String str, String[] strArr, String[] strArr2) {
        return replaceEach(str, strArr, strArr2, true, strArr == null ? 0 : strArr.length);
    }

    public static String replaceOnce(String str, String str2, String str3) {
        return replace(str, str2, str3, 1);
    }

    public static String reverse(String str) {
        if (str == null) {
            return null;
        }
        return new StringBuffer(str).reverse().toString();
    }

    public static String reverseDelimited(String str, char c) {
        if (str == null) {
            return null;
        }
        String[] split = split(str, c);
        ArrayUtils.reverse((Object[]) split);
        return join((Object[]) split, c);
    }

    public static String reverseDelimitedString(String str, String str2) {
        if (str == null) {
            return null;
        }
        String[] split = split(str, str2);
        ArrayUtils.reverse((Object[]) split);
        return str2 == null ? join((Object[]) split, ' ') : join((Object[]) split, str2);
    }

    public static String right(String str, int i) {
        if (str == null) {
            return null;
        }
        return i < 0 ? "" : str.length() > i ? str.substring(str.length() - i) : str;
    }

    public static String rightPad(String str, int i) {
        return rightPad(str, i, ' ');
    }

    public static String rightPad(String str, int i, char c) {
        if (str == null) {
            return null;
        }
        int length = i - str.length();
        return length > 0 ? length > 8192 ? rightPad(str, i, String.valueOf(c)) : str.concat(padding(length, c)) : str;
    }

    public static String rightPad(String str, int i, String str2) {
        if (str == null) {
            return null;
        }
        if (isEmpty(str2)) {
            str2 = org.apache.commons.lang3.StringUtils.SPACE;
        }
        int length = str2.length();
        int length2 = i - str.length();
        if (length2 <= 0) {
            return str;
        }
        if (length == 1 && length2 <= 8192) {
            return rightPad(str, i, str2.charAt(0));
        }
        if (length2 == length) {
            return str.concat(str2);
        }
        if (length2 < length) {
            return str.concat(str2.substring(0, length2));
        }
        char[] cArr = new char[length2];
        char[] charArray = str2.toCharArray();
        for (int i2 = 0; i2 < length2; i2++) {
            cArr[i2] = (char) charArray[i2 % length];
        }
        return str.concat(new String(cArr));
    }

    public static String[] split(String str) {
        return split(str, (String) null, -1);
    }

    public static String[] split(String str, char c) {
        return splitWorker(str, c, false);
    }

    public static String[] split(String str, String str2) {
        return splitWorker(str, str2, -1, false);
    }

    public static String[] split(String str, String str2, int i) {
        return splitWorker(str, str2, i, false);
    }

    public static String[] splitByCharacterType(String str) {
        return splitByCharacterType(str, false);
    }

    private static String[] splitByCharacterType(String str, boolean z) {
        int i = 0;
        if (str == null) {
            return null;
        }
        if (str.length() == 0) {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        char[] charArray = str.toCharArray();
        ArrayList arrayList = new ArrayList();
        int type = Character.getType(charArray[0]);
        for (int i2 = 1; i2 < charArray.length; i2++) {
            int type2 = Character.getType(charArray[i2]);
            if (type2 != type) {
                if (z && type2 == 2 && type == 1) {
                    int i3 = i2 - 1;
                    if (i3 != i) {
                        arrayList.add(new String(charArray, i, i3 - i));
                        i = i3;
                    }
                } else {
                    arrayList.add(new String(charArray, i, i2 - i));
                    i = i2;
                }
                type = type2;
            }
        }
        arrayList.add(new String(charArray, i, charArray.length - i));
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public static String[] splitByCharacterTypeCamelCase(String str) {
        return splitByCharacterType(str, true);
    }

    public static String[] splitByWholeSeparator(String str, String str2) {
        return splitByWholeSeparatorWorker(str, str2, -1, false);
    }

    public static String[] splitByWholeSeparator(String str, String str2, int i) {
        return splitByWholeSeparatorWorker(str, str2, i, false);
    }

    public static String[] splitByWholeSeparatorPreserveAllTokens(String str, String str2) {
        return splitByWholeSeparatorWorker(str, str2, -1, true);
    }

    public static String[] splitByWholeSeparatorPreserveAllTokens(String str, String str2, int i) {
        return splitByWholeSeparatorWorker(str, str2, i, true);
    }

    private static String[] splitByWholeSeparatorWorker(String str, String str2, int i, boolean z) {
        if (str == null) {
            return null;
        }
        int length = str.length();
        if (length == 0) {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        if (str2 == null || "".equals(str2)) {
            return splitWorker(str, (String) null, i, z);
        }
        int length2 = str2.length();
        ArrayList arrayList = new ArrayList();
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        while (i2 < length) {
            i2 = str.indexOf(str2, i3);
            if (i2 <= -1) {
                arrayList.add(str.substring(i3));
                i2 = length;
            } else if (i2 > i3) {
                i4++;
                if (i4 == i) {
                    arrayList.add(str.substring(i3));
                    i2 = length;
                } else {
                    arrayList.add(str.substring(i3, i2));
                    i3 = i2 + length2;
                }
            } else {
                if (z) {
                    i4++;
                    if (i4 == i) {
                        arrayList.add(str.substring(i3));
                        i2 = length;
                    } else {
                        arrayList.add("");
                    }
                }
                i3 = i2 + length2;
            }
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public static String[] splitPreserveAllTokens(String str) {
        return splitWorker(str, (String) null, -1, true);
    }

    public static String[] splitPreserveAllTokens(String str, char c) {
        return splitWorker(str, c, true);
    }

    public static String[] splitPreserveAllTokens(String str, String str2) {
        return splitWorker(str, str2, -1, true);
    }

    public static String[] splitPreserveAllTokens(String str, String str2, int i) {
        return splitWorker(str, str2, i, true);
    }

    private static String[] splitWorker(String str, char c, boolean z) {
        if (str == null) {
            return null;
        }
        int length = str.length();
        if (length == 0) {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        ArrayList arrayList = new ArrayList();
        boolean z2 = false;
        boolean z3 = false;
        int i = 0;
        int i2 = 0;
        while (i2 < length) {
            if (str.charAt(i2) == c) {
                if (z3 || z) {
                    arrayList.add(str.substring(i, i2));
                    z2 = true;
                    z3 = false;
                }
                int i3 = i2 + 1;
                i = i3;
                i2 = i3;
            } else {
                z2 = false;
                z3 = true;
                i2++;
            }
        }
        if (z3 || (z && z2)) {
            arrayList.add(str.substring(i, i2));
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    private static String[] splitWorker(String str, String str2, int i, boolean z) {
        boolean z2;
        boolean z3;
        int i2;
        int i3;
        int i4;
        boolean z4;
        boolean z5;
        boolean z6;
        int i5;
        boolean z7;
        boolean z8;
        if (str == null) {
            return null;
        }
        int length = str.length();
        if (length == 0) {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        ArrayList arrayList = new ArrayList();
        if (str2 == null) {
            z4 = false;
            int i6 = 1;
            z3 = false;
            int i7 = 0;
            int i8 = 0;
            while (i8 < length) {
                if (Character.isWhitespace(str.charAt(i8))) {
                    if (z3 || z) {
                        int i9 = i6 + 1;
                        if (i6 == i) {
                            z4 = false;
                            i8 = length;
                        } else {
                            z4 = true;
                        }
                        arrayList.add(str.substring(i7, i8));
                        i6 = i9;
                        z8 = false;
                    } else {
                        z8 = z3;
                    }
                    int i10 = i8 + 1;
                    z3 = z8;
                    i7 = i10;
                    i8 = i10;
                } else {
                    i8++;
                    z4 = false;
                    z3 = true;
                }
            }
            i3 = i7;
            i4 = i8;
        } else if (str2.length() == 1) {
            char charAt = str2.charAt(0);
            z3 = false;
            z2 = false;
            int i11 = 0;
            int i12 = 1;
            i2 = 0;
            while (i2 < length) {
                if (str.charAt(i2) == charAt) {
                    if (z3 || z) {
                        i5 = i12 + 1;
                        if (i12 == i) {
                            z7 = false;
                            i2 = length;
                        } else {
                            z7 = true;
                        }
                        arrayList.add(str.substring(i11, i2));
                        z3 = false;
                        z2 = z7;
                    } else {
                        i5 = i12;
                    }
                    int i13 = i2 + 1;
                    i11 = i13;
                    i12 = i5;
                    i2 = i13;
                } else {
                    i2++;
                    z3 = true;
                    z2 = false;
                }
            }
            i3 = i11;
            if (z3 || (z && z2)) {
                arrayList.add(str.substring(i3, i2));
            }
            return (String[]) arrayList.toArray(new String[arrayList.size()]);
        } else {
            int i14 = 1;
            z4 = false;
            boolean z9 = false;
            int i15 = 0;
            int i16 = 0;
            while (i16 < length) {
                if (str2.indexOf(str.charAt(i16)) >= 0) {
                    if (z3 || z) {
                        int i17 = i14 + 1;
                        if (i14 == i) {
                            z6 = false;
                            i16 = length;
                        } else {
                            z6 = true;
                        }
                        arrayList.add(str.substring(i15, i16));
                        i14 = i17;
                        z5 = false;
                    } else {
                        z5 = z3;
                    }
                    int i18 = i16 + 1;
                    z9 = z5;
                    i15 = i18;
                    i16 = i18;
                } else {
                    i16++;
                    z4 = false;
                    z9 = true;
                }
            }
            i3 = i15;
            i4 = i16;
        }
        z2 = z4;
        i2 = i4;
        arrayList.add(str.substring(i3, i2));
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public static boolean startsWith(String str, String str2) {
        return startsWith(str, str2, false);
    }

    private static boolean startsWith(String str, String str2, boolean z) {
        if (str == null || str2 == null) {
            return str == null && str2 == null;
        }
        if (str2.length() > str.length()) {
            return false;
        }
        return str.regionMatches(z, 0, str2, 0, str2.length());
    }

    public static boolean startsWithAny(String str, String[] strArr) {
        if (isEmpty(str) || ArrayUtils.isEmpty((Object[]) strArr)) {
            return false;
        }
        for (String startsWith : strArr) {
            if (startsWith(str, startsWith)) {
                return true;
            }
        }
        return false;
    }

    public static boolean startsWithIgnoreCase(String str, String str2) {
        return startsWith(str, str2, true);
    }

    public static String strip(String str) {
        return strip(str, (String) null);
    }

    public static String strip(String str, String str2) {
        return isEmpty(str) ? str : stripEnd(stripStart(str, str2), str2);
    }

    public static String[] stripAll(String[] strArr) {
        return stripAll(strArr, (String) null);
    }

    public static String[] stripAll(String[] strArr, String str) {
        int length;
        if (strArr == null || (length = strArr.length) == 0) {
            return strArr;
        }
        String[] strArr2 = new String[length];
        for (int i = 0; i < length; i++) {
            strArr2[i] = strip(strArr[i], str);
        }
        return strArr2;
    }

    public static String stripEnd(String str, String str2) {
        int length;
        if (str == null || (length = str.length()) == 0) {
            return str;
        }
        if (str2 == null) {
            while (length != 0 && Character.isWhitespace(str.charAt(length - 1))) {
                length--;
            }
        } else if (str2.length() == 0) {
            return str;
        } else {
            while (length != 0 && str2.indexOf(str.charAt(length - 1)) != -1) {
                length--;
            }
        }
        return str.substring(0, length);
    }

    public static String stripStart(String str, String str2) {
        int length;
        int i = 0;
        if (str == null || (length = str.length()) == 0) {
            return str;
        }
        if (str2 == null) {
            while (i != length && Character.isWhitespace(str.charAt(i))) {
                i++;
            }
        } else if (str2.length() == 0) {
            return str;
        } else {
            while (i != length && str2.indexOf(str.charAt(i)) != -1) {
                i++;
            }
        }
        return str.substring(i);
    }

    public static String stripToEmpty(String str) {
        return str == null ? "" : strip(str, (String) null);
    }

    public static String stripToNull(String str) {
        if (str == null) {
            return null;
        }
        String strip = strip(str, (String) null);
        if (strip.length() != 0) {
            return strip;
        }
        return null;
    }

    public static String substring(String str, int i) {
        if (str == null) {
            return null;
        }
        int length = i < 0 ? str.length() + i : i;
        if (length < 0) {
            length = 0;
        }
        return length > str.length() ? "" : str.substring(length);
    }

    public static String substring(String str, int i, int i2) {
        int i3 = 0;
        if (str == null) {
            return null;
        }
        int length = i2 < 0 ? str.length() + i2 : i2;
        if (i < 0) {
            i += str.length();
        }
        if (length > str.length()) {
            length = str.length();
        }
        if (i > length) {
            return "";
        }
        if (i < 0) {
            i = 0;
        }
        if (length >= 0) {
            i3 = length;
        }
        return str.substring(i, i3);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:4:0x000c, code lost:
        r0 = r2.indexOf(r3);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.String substringAfter(java.lang.String r2, java.lang.String r3) {
        /*
            boolean r0 = isEmpty(r2)
            if (r0 == 0) goto L_0x0007
        L_0x0006:
            return r2
        L_0x0007:
            if (r3 != 0) goto L_0x000c
            java.lang.String r2 = ""
            goto L_0x0006
        L_0x000c:
            int r0 = r2.indexOf(r3)
            r1 = -1
            if (r0 != r1) goto L_0x0016
            java.lang.String r2 = ""
            goto L_0x0006
        L_0x0016:
            int r1 = r3.length()
            int r0 = r0 + r1
            java.lang.String r2 = r2.substring(r0)
            goto L_0x0006
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.StringUtils.substringAfter(java.lang.String, java.lang.String):java.lang.String");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:5:0x0010, code lost:
        r0 = r3.lastIndexOf(r4);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.String substringAfterLast(java.lang.String r3, java.lang.String r4) {
        /*
            boolean r0 = isEmpty(r3)
            if (r0 == 0) goto L_0x0007
        L_0x0006:
            return r3
        L_0x0007:
            boolean r0 = isEmpty(r4)
            if (r0 == 0) goto L_0x0010
            java.lang.String r3 = ""
            goto L_0x0006
        L_0x0010:
            int r0 = r3.lastIndexOf(r4)
            r1 = -1
            if (r0 == r1) goto L_0x0022
            int r1 = r3.length()
            int r2 = r4.length()
            int r1 = r1 - r2
            if (r0 != r1) goto L_0x0025
        L_0x0022:
            java.lang.String r3 = ""
            goto L_0x0006
        L_0x0025:
            int r1 = r4.length()
            int r0 = r0 + r1
            java.lang.String r3 = r3.substring(r0)
            goto L_0x0006
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.StringUtils.substringAfterLast(java.lang.String, java.lang.String):java.lang.String");
    }

    public static String substringBefore(String str, String str2) {
        if (isEmpty(str) || str2 == null) {
            return str;
        }
        if (str2.length() == 0) {
            return "";
        }
        int indexOf = str.indexOf(str2);
        return indexOf != -1 ? str.substring(0, indexOf) : str;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:4:0x000d, code lost:
        r0 = r2.lastIndexOf(r3);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.String substringBeforeLast(java.lang.String r2, java.lang.String r3) {
        /*
            boolean r0 = isEmpty(r2)
            if (r0 != 0) goto L_0x000c
            boolean r0 = isEmpty(r3)
            if (r0 == 0) goto L_0x000d
        L_0x000c:
            return r2
        L_0x000d:
            int r0 = r2.lastIndexOf(r3)
            r1 = -1
            if (r0 == r1) goto L_0x000c
            r1 = 0
            java.lang.String r2 = r2.substring(r1, r0)
            goto L_0x000c
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.StringUtils.substringBeforeLast(java.lang.String, java.lang.String):java.lang.String");
    }

    public static String substringBetween(String str, String str2) {
        return substringBetween(str, str2, str2);
    }

    public static String substringBetween(String str, String str2, String str3) {
        int indexOf;
        int indexOf2;
        if (str == null || str2 == null || str3 == null || (indexOf = str.indexOf(str2)) == -1 || (indexOf2 = str.indexOf(str3, str2.length() + indexOf)) == -1) {
            return null;
        }
        return str.substring(str2.length() + indexOf, indexOf2);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0044, code lost:
        r1 = r1 + r4;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.String[] substringsBetween(java.lang.String r7, java.lang.String r8, java.lang.String r9) {
        /*
            r0 = 0
            if (r7 == 0) goto L_0x000f
            boolean r1 = isEmpty(r8)
            if (r1 != 0) goto L_0x000f
            boolean r1 = isEmpty(r9)
            if (r1 == 0) goto L_0x0010
        L_0x000f:
            return r0
        L_0x0010:
            int r2 = r7.length()
            if (r2 != 0) goto L_0x0019
            java.lang.String[] r0 = org.apache.commons.lang.ArrayUtils.EMPTY_STRING_ARRAY
            goto L_0x000f
        L_0x0019:
            int r3 = r9.length()
            int r4 = r8.length()
            java.util.ArrayList r5 = new java.util.ArrayList
            r5.<init>()
            r1 = 0
        L_0x0027:
            int r6 = r2 - r3
            if (r1 >= r6) goto L_0x0031
            int r1 = r7.indexOf(r8, r1)
            if (r1 >= 0) goto L_0x0044
        L_0x0031:
            boolean r1 = r5.isEmpty()
            if (r1 != 0) goto L_0x000f
            int r0 = r5.size()
            java.lang.String[] r0 = new java.lang.String[r0]
            java.lang.Object[] r0 = r5.toArray(r0)
            java.lang.String[] r0 = (java.lang.String[]) r0
            goto L_0x000f
        L_0x0044:
            int r1 = r1 + r4
            int r6 = r7.indexOf(r9, r1)
            if (r6 < 0) goto L_0x0031
            java.lang.String r1 = r7.substring(r1, r6)
            r5.add(r1)
            int r1 = r6 + r3
            goto L_0x0027
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.StringUtils.substringsBetween(java.lang.String, java.lang.String, java.lang.String):java.lang.String[]");
    }

    public static String swapCase(String str) {
        int length;
        if (str == null || (length = str.length()) == 0) {
            return str;
        }
        StringBuffer stringBuffer = new StringBuffer(length);
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (Character.isUpperCase(charAt)) {
                charAt = Character.toLowerCase(charAt);
            } else if (Character.isTitleCase(charAt)) {
                charAt = Character.toLowerCase(charAt);
            } else if (Character.isLowerCase(charAt)) {
                charAt = Character.toUpperCase(charAt);
            }
            stringBuffer.append(charAt);
        }
        return stringBuffer.toString();
    }

    public static String trim(String str) {
        if (str == null) {
            return null;
        }
        return str.trim();
    }

    public static String trimToEmpty(String str) {
        return str == null ? "" : str.trim();
    }

    public static String trimToNull(String str) {
        String trim = trim(str);
        if (isEmpty(trim)) {
            return null;
        }
        return trim;
    }

    public static String uncapitalise(String str) {
        return uncapitalize(str);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:1:0x0002, code lost:
        r0 = r2.length();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static java.lang.String uncapitalize(java.lang.String r2) {
        /*
            if (r2 == 0) goto L_0x0008
            int r0 = r2.length()
            if (r0 != 0) goto L_0x0009
        L_0x0008:
            return r2
        L_0x0009:
            java.lang.StringBuffer r1 = new java.lang.StringBuffer
            r1.<init>(r0)
            r0 = 0
            char r0 = r2.charAt(r0)
            char r0 = java.lang.Character.toLowerCase(r0)
            java.lang.StringBuffer r0 = r1.append(r0)
            r1 = 1
            java.lang.String r1 = r2.substring(r1)
            java.lang.StringBuffer r0 = r0.append(r1)
            java.lang.String r2 = r0.toString()
            goto L_0x0008
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang.StringUtils.uncapitalize(java.lang.String):java.lang.String");
    }

    public static String upperCase(String str) {
        if (str == null) {
            return null;
        }
        return str.toUpperCase();
    }

    public static String upperCase(String str, Locale locale) {
        if (str == null) {
            return null;
        }
        return str.toUpperCase(locale);
    }
}
