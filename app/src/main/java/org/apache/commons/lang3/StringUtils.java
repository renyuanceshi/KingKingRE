package org.apache.commons.lang3;

import android.support.v7.widget.ActivityChooserView;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import java.util.regex.Pattern;

public class StringUtils {
    public static final String CR = "\r";
    public static final String EMPTY = "";
    public static final int INDEX_NOT_FOUND = -1;
    public static final String LF = "\n";
    private static final int PAD_LIMIT = 8192;
    public static final String SPACE = " ";
    private static final Pattern WHITESPACE_PATTERN = Pattern.compile("(?: |\\u00A0|\\s|[\\s&&[^ ]])\\s*");

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
                return str.substring(0, i2 - 3) + "...";
            }
            if (i2 >= 7) {
                return (i + i2) + -3 < str.length() ? "..." + abbreviate(str.substring(i), i2 - 3) : "..." + str.substring(str.length() - (i2 - 3));
            }
            throw new IllegalArgumentException("Minimum abbreviation width with offset is 7");
        }
    }

    public static String abbreviateMiddle(String str, String str2, int i) {
        if (isEmpty(str) || isEmpty(str2) || i >= str.length() || i < str2.length() + 2) {
            return str;
        }
        int length = i - str2.length();
        StringBuilder sb = new StringBuilder(i);
        sb.append(str.substring(0, (length % 2) + (length / 2)));
        sb.append(str2);
        sb.append(str.substring(str.length() - (length / 2)));
        return sb.toString();
    }

    private static String appendIfMissing(String str, CharSequence charSequence, boolean z, CharSequence... charSequenceArr) {
        if (str == null || isEmpty(charSequence) || endsWith(str, charSequence, z)) {
            return str;
        }
        if (charSequenceArr != null && charSequenceArr.length > 0) {
            for (CharSequence endsWith : charSequenceArr) {
                if (endsWith(str, endsWith, z)) {
                    return str;
                }
            }
        }
        return str + charSequence.toString();
    }

    public static String appendIfMissing(String str, CharSequence charSequence, CharSequence... charSequenceArr) {
        return appendIfMissing(str, charSequence, false, charSequenceArr);
    }

    public static String appendIfMissingIgnoreCase(String str, CharSequence charSequence, CharSequence... charSequenceArr) {
        return appendIfMissing(str, charSequence, true, charSequenceArr);
    }

    public static String capitalize(String str) {
        int length;
        if (str == null || (length = str.length()) == 0) {
            return str;
        }
        char charAt = str.charAt(0);
        return !Character.isTitleCase(charAt) ? new StringBuilder(length).append(Character.toTitleCase(charAt)).append(str.substring(1)).toString() : str;
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
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.StringUtils.center(java.lang.String, int, char):java.lang.String");
    }

    public static String center(String str, int i, String str2) {
        if (str == null || i <= 0) {
            return str;
        }
        if (isEmpty(str2)) {
            str2 = SPACE;
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

    @Deprecated
    public static String chomp(String str, String str2) {
        return removeEnd(str, str2);
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

    public static boolean contains(CharSequence charSequence, int i) {
        return !isEmpty(charSequence) && CharSequenceUtils.indexOf(charSequence, i, 0) >= 0;
    }

    public static boolean contains(CharSequence charSequence, CharSequence charSequence2) {
        return (charSequence == null || charSequence2 == null || CharSequenceUtils.indexOf(charSequence, charSequence2, 0) < 0) ? false : true;
    }

    public static boolean containsAny(CharSequence charSequence, CharSequence charSequence2) {
        if (charSequence2 == null) {
            return false;
        }
        return containsAny(charSequence, CharSequenceUtils.toCharArray(charSequence2));
    }

    public static boolean containsAny(CharSequence charSequence, char... cArr) {
        if (isEmpty(charSequence) || ArrayUtils.isEmpty(cArr)) {
            return false;
        }
        int length = charSequence.length();
        int length2 = cArr.length;
        for (int i = 0; i < length; i++) {
            char charAt = charSequence.charAt(i);
            for (int i2 = 0; i2 < length2; i2++) {
                if (cArr[i2] == charAt) {
                    if (!Character.isHighSurrogate(charAt) || i2 == length2 - 1) {
                        return true;
                    }
                    if (i < length - 1 && cArr[i2 + 1] == charSequence.charAt(i + 1)) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    public static boolean containsIgnoreCase(CharSequence charSequence, CharSequence charSequence2) {
        if (charSequence == null || charSequence2 == null) {
            return false;
        }
        int length = charSequence2.length();
        int length2 = charSequence.length();
        for (int i = 0; i <= length2 - length; i++) {
            if (CharSequenceUtils.regionMatches(charSequence, true, i, charSequence2, 0, length)) {
                return true;
            }
        }
        return false;
    }

    public static boolean containsNone(CharSequence charSequence, String str) {
        if (charSequence == null || str == null) {
            return true;
        }
        return containsNone(charSequence, str.toCharArray());
    }

    public static boolean containsNone(CharSequence charSequence, char... cArr) {
        if (charSequence == null || cArr == null) {
            return true;
        }
        int length = charSequence.length();
        int length2 = cArr.length;
        for (int i = 0; i < length; i++) {
            char charAt = charSequence.charAt(i);
            for (int i2 = 0; i2 < length2; i2++) {
                if (cArr[i2] == charAt) {
                    if (!Character.isHighSurrogate(charAt) || i2 == length2 - 1) {
                        return false;
                    }
                    if (i < length - 1 && cArr[i2 + 1] == charSequence.charAt(i + 1)) {
                        return false;
                    }
                }
            }
        }
        return true;
    }

    public static boolean containsOnly(CharSequence charSequence, String str) {
        if (charSequence == null || str == null) {
            return false;
        }
        return containsOnly(charSequence, str.toCharArray());
    }

    public static boolean containsOnly(CharSequence charSequence, char... cArr) {
        if (cArr == null || charSequence == null) {
            return false;
        }
        return charSequence.length() == 0 || (cArr.length != 0 && indexOfAnyBut(charSequence, cArr) == -1);
    }

    public static boolean containsWhitespace(CharSequence charSequence) {
        if (isEmpty(charSequence)) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (Character.isWhitespace(charSequence.charAt(i))) {
                return true;
            }
        }
        return false;
    }

    public static int countMatches(CharSequence charSequence, CharSequence charSequence2) {
        int i = 0;
        if (isEmpty(charSequence) || isEmpty(charSequence2)) {
            return 0;
        }
        int i2 = 0;
        while (true) {
            int indexOf = CharSequenceUtils.indexOf(charSequence, charSequence2, i);
            if (indexOf == -1) {
                return i2;
            }
            i2++;
            i = indexOf + charSequence2.length();
        }
    }

    public static <T extends CharSequence> T defaultIfBlank(T t, T t2) {
        return isBlank(t) ? t2 : t;
    }

    public static <T extends CharSequence> T defaultIfEmpty(T t, T t2) {
        return isEmpty(t) ? t2 : t;
    }

    public static String defaultString(String str) {
        return str == null ? "" : str;
    }

    public static String defaultString(String str, String str2) {
        return str == null ? str2 : str;
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

    public static boolean endsWith(CharSequence charSequence, CharSequence charSequence2) {
        return endsWith(charSequence, charSequence2, false);
    }

    private static boolean endsWith(CharSequence charSequence, CharSequence charSequence2, boolean z) {
        if (charSequence == null || charSequence2 == null) {
            return charSequence == null && charSequence2 == null;
        }
        if (charSequence2.length() > charSequence.length()) {
            return false;
        }
        return CharSequenceUtils.regionMatches(charSequence, z, charSequence.length() - charSequence2.length(), charSequence2, 0, charSequence2.length());
    }

    public static boolean endsWithAny(CharSequence charSequence, CharSequence... charSequenceArr) {
        if (isEmpty(charSequence) || ArrayUtils.isEmpty((Object[]) charSequenceArr)) {
            return false;
        }
        for (CharSequence endsWith : charSequenceArr) {
            if (endsWith(charSequence, endsWith)) {
                return true;
            }
        }
        return false;
    }

    public static boolean endsWithIgnoreCase(CharSequence charSequence, CharSequence charSequence2) {
        return endsWith(charSequence, charSequence2, true);
    }

    public static boolean equals(CharSequence charSequence, CharSequence charSequence2) {
        if (charSequence == charSequence2) {
            return true;
        }
        if (charSequence == null || charSequence2 == null) {
            return false;
        }
        if ((charSequence instanceof String) && (charSequence2 instanceof String)) {
            return charSequence.equals(charSequence2);
        }
        return CharSequenceUtils.regionMatches(charSequence, false, 0, charSequence2, 0, Math.max(charSequence.length(), charSequence2.length()));
    }

    public static boolean equalsIgnoreCase(CharSequence charSequence, CharSequence charSequence2) {
        if (charSequence == null || charSequence2 == null) {
            if (charSequence != charSequence2) {
                return false;
            }
        } else if (charSequence != charSequence2) {
            if (charSequence.length() != charSequence2.length()) {
                return false;
            }
            return CharSequenceUtils.regionMatches(charSequence, true, 0, charSequence2, 0, charSequence.length());
        }
        return true;
    }

    public static String getCommonPrefix(String... strArr) {
        if (strArr == null || strArr.length == 0) {
            return "";
        }
        int indexOfDifference = indexOfDifference(strArr);
        return indexOfDifference == -1 ? strArr[0] == null ? "" : strArr[0] : indexOfDifference == 0 ? "" : strArr[0].substring(0, indexOfDifference);
    }

    public static int getLevenshteinDistance(CharSequence charSequence, CharSequence charSequence2) {
        CharSequence charSequence3;
        CharSequence charSequence4;
        int i;
        if (charSequence == null || charSequence2 == null) {
            throw new IllegalArgumentException("Strings must not be null");
        }
        int length = charSequence.length();
        int length2 = charSequence2.length();
        if (length == 0) {
            return length2;
        }
        if (length2 == 0) {
            return length;
        }
        if (length > length2) {
            i = charSequence.length();
            charSequence3 = charSequence;
            charSequence4 = charSequence2;
            length = length2;
        } else {
            charSequence3 = charSequence2;
            charSequence4 = charSequence;
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
            char charAt = charSequence3.charAt(i3 - 1);
            iArr2[0] = i3;
            for (int i4 = 1; i4 <= length; i4++) {
                iArr2[i4] = Math.min(Math.min(iArr2[i4 - 1] + 1, iArr3[i4] + 1), (charSequence4.charAt(i4 + -1) == charAt ? 0 : 1) + iArr3[i4 - 1]);
            }
            i3++;
            int[] iArr4 = iArr2;
            iArr2 = iArr3;
            iArr3 = iArr4;
        }
        return iArr3[length];
    }

    public static int getLevenshteinDistance(CharSequence charSequence, CharSequence charSequence2, int i) {
        CharSequence charSequence3;
        CharSequence charSequence4;
        int i2;
        if (charSequence == null || charSequence2 == null) {
            throw new IllegalArgumentException("Strings must not be null");
        } else if (i < 0) {
            throw new IllegalArgumentException("Threshold must not be negative");
        } else {
            int length = charSequence.length();
            int length2 = charSequence2.length();
            if (length == 0) {
                if (length2 <= i) {
                    return length2;
                }
                return -1;
            } else if (length2 != 0) {
                if (length > length2) {
                    i2 = charSequence.length();
                    charSequence3 = charSequence;
                    charSequence4 = charSequence2;
                    length = length2;
                } else {
                    charSequence3 = charSequence2;
                    charSequence4 = charSequence;
                    i2 = length2;
                }
                int[] iArr = new int[(length + 1)];
                int[] iArr2 = new int[(length + 1)];
                int min = Math.min(length, i) + 1;
                for (int i3 = 0; i3 < min; i3++) {
                    iArr[i3] = i3;
                }
                Arrays.fill(iArr, min, iArr.length, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
                Arrays.fill(iArr2, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
                int i4 = 1;
                while (i4 <= i2) {
                    char charAt = charSequence3.charAt(i4 - 1);
                    iArr2[0] = i4;
                    int max = Math.max(1, i4 - i);
                    int min2 = Math.min(length, i4 + i);
                    if (max > min2) {
                        return -1;
                    }
                    if (max > 1) {
                        iArr2[max - 1] = Integer.MAX_VALUE;
                    }
                    while (max <= min2) {
                        if (charSequence4.charAt(max - 1) == charAt) {
                            iArr2[max] = iArr[max - 1];
                        } else {
                            iArr2[max] = Math.min(Math.min(iArr2[max - 1], iArr[max]), iArr[max - 1]) + 1;
                        }
                        max++;
                    }
                    i4++;
                    int[] iArr3 = iArr2;
                    iArr2 = iArr;
                    iArr = iArr3;
                }
                if (iArr[length] <= i) {
                    return iArr[length];
                }
                return -1;
            } else if (length <= i) {
                return length;
            } else {
                return -1;
            }
        }
    }

    public static int indexOf(CharSequence charSequence, int i) {
        if (isEmpty(charSequence)) {
            return -1;
        }
        return CharSequenceUtils.indexOf(charSequence, i, 0);
    }

    public static int indexOf(CharSequence charSequence, int i, int i2) {
        if (isEmpty(charSequence)) {
            return -1;
        }
        return CharSequenceUtils.indexOf(charSequence, i, i2);
    }

    public static int indexOf(CharSequence charSequence, CharSequence charSequence2) {
        if (charSequence == null || charSequence2 == null) {
            return -1;
        }
        return CharSequenceUtils.indexOf(charSequence, charSequence2, 0);
    }

    public static int indexOf(CharSequence charSequence, CharSequence charSequence2, int i) {
        if (charSequence == null || charSequence2 == null) {
            return -1;
        }
        return CharSequenceUtils.indexOf(charSequence, charSequence2, i);
    }

    public static int indexOfAny(CharSequence charSequence, String str) {
        if (isEmpty(charSequence) || isEmpty(str)) {
            return -1;
        }
        return indexOfAny(charSequence, str.toCharArray());
    }

    public static int indexOfAny(CharSequence charSequence, char... cArr) {
        if (isEmpty(charSequence) || ArrayUtils.isEmpty(cArr)) {
            return -1;
        }
        int length = charSequence.length();
        int length2 = cArr.length;
        int i = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            for (int i2 = 0; i2 < length2; i2++) {
                if (cArr[i2] == charAt && (i >= length - 1 || i2 >= length2 - 1 || !Character.isHighSurrogate(charAt) || cArr[i2 + 1] == charSequence.charAt(i + 1))) {
                    return i;
                }
            }
            i++;
        }
        return -1;
    }

    public static int indexOfAny(CharSequence charSequence, CharSequence... charSequenceArr) {
        int indexOf;
        if (charSequence == null || charSequenceArr == null) {
            return -1;
        }
        int i = Integer.MAX_VALUE;
        for (CharSequence charSequence2 : charSequenceArr) {
            if (!(charSequence2 == null || (indexOf = CharSequenceUtils.indexOf(charSequence, charSequence2, 0)) == -1 || indexOf >= i)) {
                i = indexOf;
            }
        }
        if (i != Integer.MAX_VALUE) {
            return i;
        }
        return -1;
    }

    public static int indexOfAnyBut(CharSequence charSequence, CharSequence charSequence2) {
        if (isEmpty(charSequence) || isEmpty(charSequence2)) {
            return -1;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            char charAt = charSequence.charAt(i);
            boolean z = CharSequenceUtils.indexOf(charSequence2, (int) charAt, 0) >= 0;
            if (i + 1 < length && Character.isHighSurrogate(charAt)) {
                char charAt2 = charSequence.charAt(i + 1);
                if (z && CharSequenceUtils.indexOf(charSequence2, (int) charAt2, 0) < 0) {
                    return i;
                }
            } else if (!z) {
                return i;
            }
        }
        return -1;
    }

    public static int indexOfAnyBut(CharSequence charSequence, char... cArr) {
        if (isEmpty(charSequence) || ArrayUtils.isEmpty(cArr)) {
            return -1;
        }
        int length = charSequence.length();
        int length2 = cArr.length;
        int i = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            int i2 = 0;
            while (i2 < length2) {
                if (cArr[i2] != charAt || (i < length - 1 && i2 < length2 - 1 && Character.isHighSurrogate(charAt) && cArr[i2 + 1] != charSequence.charAt(i + 1))) {
                    i2++;
                } else {
                    i++;
                }
            }
            return i;
        }
        return -1;
    }

    public static int indexOfDifference(CharSequence charSequence, CharSequence charSequence2) {
        int i = 0;
        if (charSequence == charSequence2) {
            return -1;
        }
        if (charSequence == null || charSequence2 == null) {
            return 0;
        }
        while (i < charSequence.length() && i < charSequence2.length() && charSequence.charAt(i) == charSequence2.charAt(i)) {
            i++;
        }
        if (i < charSequence2.length() || i < charSequence.length()) {
            return i;
        }
        return -1;
    }

    public static int indexOfDifference(CharSequence... charSequenceArr) {
        int min;
        if (charSequenceArr == null || charSequenceArr.length <= 1) {
            return -1;
        }
        int length = charSequenceArr.length;
        int i = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
        int i2 = 0;
        boolean z = true;
        boolean z2 = false;
        int i3 = 0;
        while (i3 < length) {
            if (charSequenceArr[i3] == null) {
                min = 0;
                z2 = true;
            } else {
                min = Math.min(charSequenceArr[i3].length(), i);
                i2 = Math.max(charSequenceArr[i3].length(), i2);
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
            char charAt = charSequenceArr[0].charAt(i5);
            int i6 = 1;
            while (true) {
                if (i6 >= length) {
                    break;
                } else if (charSequenceArr[i6].charAt(i5) != charAt) {
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

    public static int indexOfIgnoreCase(CharSequence charSequence, CharSequence charSequence2) {
        return indexOfIgnoreCase(charSequence, charSequence2, 0);
    }

    public static int indexOfIgnoreCase(CharSequence charSequence, CharSequence charSequence2, int i) {
        if (charSequence == null || charSequence2 == null) {
            return -1;
        }
        int i2 = i < 0 ? 0 : i;
        int length = (charSequence.length() - charSequence2.length()) + 1;
        if (i2 > length) {
            return -1;
        }
        if (charSequence2.length() == 0) {
            return i2;
        }
        while (i2 < length) {
            if (CharSequenceUtils.regionMatches(charSequence, true, i2, charSequence2, 0, charSequence2.length())) {
                return i2;
            }
            i2++;
        }
        return -1;
    }

    public static boolean isAllLowerCase(CharSequence charSequence) {
        if (charSequence == null || isEmpty(charSequence)) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLowerCase(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAllUpperCase(CharSequence charSequence) {
        if (charSequence == null || isEmpty(charSequence)) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isUpperCase(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAlpha(CharSequence charSequence) {
        if (isEmpty(charSequence)) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLetter(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAlphaSpace(CharSequence charSequence) {
        if (charSequence == null) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLetter(charSequence.charAt(i)) && charSequence.charAt(i) != ' ') {
                return false;
            }
        }
        return true;
    }

    public static boolean isAlphanumeric(CharSequence charSequence) {
        if (isEmpty(charSequence)) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLetterOrDigit(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAlphanumericSpace(CharSequence charSequence) {
        if (charSequence == null) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isLetterOrDigit(charSequence.charAt(i)) && charSequence.charAt(i) != ' ') {
                return false;
            }
        }
        return true;
    }

    public static boolean isAnyBlank(CharSequence... charSequenceArr) {
        if (ArrayUtils.isEmpty((Object[]) charSequenceArr)) {
            return true;
        }
        for (CharSequence isBlank : charSequenceArr) {
            if (isBlank(isBlank)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isAnyEmpty(CharSequence... charSequenceArr) {
        if (ArrayUtils.isEmpty((Object[]) charSequenceArr)) {
            return true;
        }
        for (CharSequence isEmpty : charSequenceArr) {
            if (isEmpty(isEmpty)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isAsciiPrintable(CharSequence charSequence) {
        if (charSequence == null) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!CharUtils.isAsciiPrintable(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isBlank(CharSequence charSequence) {
        int length;
        if (charSequence == null || (length = charSequence.length()) == 0) {
            return true;
        }
        for (int i = 0; i < length; i++) {
            if (!Character.isWhitespace(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isEmpty(CharSequence charSequence) {
        return charSequence == null || charSequence.length() == 0;
    }

    public static boolean isNoneBlank(CharSequence... charSequenceArr) {
        return !isAnyBlank(charSequenceArr);
    }

    public static boolean isNoneEmpty(CharSequence... charSequenceArr) {
        return !isAnyEmpty(charSequenceArr);
    }

    public static boolean isNotBlank(CharSequence charSequence) {
        return !isBlank(charSequence);
    }

    public static boolean isNotEmpty(CharSequence charSequence) {
        return !isEmpty(charSequence);
    }

    public static boolean isNumeric(CharSequence charSequence) {
        if (isEmpty(charSequence)) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isDigit(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isNumericSpace(CharSequence charSequence) {
        if (charSequence == null) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isDigit(charSequence.charAt(i)) && charSequence.charAt(i) != ' ') {
                return false;
            }
        }
        return true;
    }

    public static boolean isWhitespace(CharSequence charSequence) {
        if (charSequence == null) {
            return false;
        }
        int length = charSequence.length();
        for (int i = 0; i < length; i++) {
            if (!Character.isWhitespace(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static String join(Iterable<?> iterable, char c) {
        if (iterable == null) {
            return null;
        }
        return join(iterable.iterator(), c);
    }

    public static String join(Iterable<?> iterable, String str) {
        if (iterable == null) {
            return null;
        }
        return join(iterable.iterator(), str);
    }

    public static String join(Iterator<?> it, char c) {
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
        StringBuilder sb = new StringBuilder(256);
        if (next != null) {
            sb.append(next);
        }
        while (it.hasNext()) {
            sb.append(c);
            Object next2 = it.next();
            if (next2 != null) {
                sb.append(next2);
            }
        }
        return sb.toString();
    }

    public static String join(Iterator<?> it, String str) {
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
        StringBuilder sb = new StringBuilder(256);
        if (next != null) {
            sb.append(next);
        }
        while (it.hasNext()) {
            if (str != null) {
                sb.append(str);
            }
            Object next2 = it.next();
            if (next2 != null) {
                sb.append(next2);
            }
        }
        return sb.toString();
    }

    public static String join(byte[] bArr, char c) {
        if (bArr == null) {
            return null;
        }
        return join(bArr, c, 0, bArr.length);
    }

    public static String join(byte[] bArr, char c, int i, int i2) {
        if (bArr == null) {
            return null;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(c);
            }
            sb.append(bArr[i4]);
        }
        return sb.toString();
    }

    public static String join(char[] cArr, char c) {
        if (cArr == null) {
            return null;
        }
        return join(cArr, c, 0, cArr.length);
    }

    public static String join(char[] cArr, char c, int i, int i2) {
        if (cArr == null) {
            return null;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(c);
            }
            sb.append(cArr[i4]);
        }
        return sb.toString();
    }

    public static String join(double[] dArr, char c) {
        if (dArr == null) {
            return null;
        }
        return join(dArr, c, 0, dArr.length);
    }

    public static String join(double[] dArr, char c, int i, int i2) {
        if (dArr == null) {
            return null;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(c);
            }
            sb.append(dArr[i4]);
        }
        return sb.toString();
    }

    public static String join(float[] fArr, char c) {
        if (fArr == null) {
            return null;
        }
        return join(fArr, c, 0, fArr.length);
    }

    public static String join(float[] fArr, char c, int i, int i2) {
        if (fArr == null) {
            return null;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(c);
            }
            sb.append(fArr[i4]);
        }
        return sb.toString();
    }

    public static String join(int[] iArr, char c) {
        if (iArr == null) {
            return null;
        }
        return join(iArr, c, 0, iArr.length);
    }

    public static String join(int[] iArr, char c, int i, int i2) {
        if (iArr == null) {
            return null;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(c);
            }
            sb.append(iArr[i4]);
        }
        return sb.toString();
    }

    public static String join(long[] jArr, char c) {
        if (jArr == null) {
            return null;
        }
        return join(jArr, c, 0, jArr.length);
    }

    public static String join(long[] jArr, char c, int i, int i2) {
        if (jArr == null) {
            return null;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(c);
            }
            sb.append(jArr[i4]);
        }
        return sb.toString();
    }

    public static <T> String join(T... tArr) {
        return join((Object[]) tArr, (String) null);
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
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(c);
            }
            if (objArr[i4] != null) {
                sb.append(objArr[i4]);
            }
        }
        return sb.toString();
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
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(str);
            }
            if (objArr[i4] != null) {
                sb.append(objArr[i4]);
            }
        }
        return sb.toString();
    }

    public static String join(short[] sArr, char c) {
        if (sArr == null) {
            return null;
        }
        return join(sArr, c, 0, sArr.length);
    }

    public static String join(short[] sArr, char c, int i, int i2) {
        if (sArr == null) {
            return null;
        }
        int i3 = i2 - i;
        if (i3 <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder(i3 * 16);
        for (int i4 = i; i4 < i2; i4++) {
            if (i4 > i) {
                sb.append(c);
            }
            sb.append(sArr[i4]);
        }
        return sb.toString();
    }

    public static int lastIndexOf(CharSequence charSequence, int i) {
        if (isEmpty(charSequence)) {
            return -1;
        }
        return CharSequenceUtils.lastIndexOf(charSequence, i, charSequence.length());
    }

    public static int lastIndexOf(CharSequence charSequence, int i, int i2) {
        if (isEmpty(charSequence)) {
            return -1;
        }
        return CharSequenceUtils.lastIndexOf(charSequence, i, i2);
    }

    public static int lastIndexOf(CharSequence charSequence, CharSequence charSequence2) {
        if (charSequence == null || charSequence2 == null) {
            return -1;
        }
        return CharSequenceUtils.lastIndexOf(charSequence, charSequence2, charSequence.length());
    }

    public static int lastIndexOf(CharSequence charSequence, CharSequence charSequence2, int i) {
        if (charSequence == null || charSequence2 == null) {
            return -1;
        }
        return CharSequenceUtils.lastIndexOf(charSequence, charSequence2, i);
    }

    public static int lastIndexOfAny(CharSequence charSequence, CharSequence... charSequenceArr) {
        int lastIndexOf;
        int i = -1;
        if (!(charSequence == null || charSequenceArr == null)) {
            for (CharSequence charSequence2 : charSequenceArr) {
                if (charSequence2 != null && (lastIndexOf = CharSequenceUtils.lastIndexOf(charSequence, charSequence2, charSequence.length())) > i) {
                    i = lastIndexOf;
                }
            }
        }
        return i;
    }

    public static int lastIndexOfIgnoreCase(CharSequence charSequence, CharSequence charSequence2) {
        if (charSequence == null || charSequence2 == null) {
            return -1;
        }
        return lastIndexOfIgnoreCase(charSequence, charSequence2, charSequence.length());
    }

    public static int lastIndexOfIgnoreCase(CharSequence charSequence, CharSequence charSequence2, int i) {
        if (charSequence == null || charSequence2 == null) {
            return -1;
        }
        int length = i > charSequence.length() - charSequence2.length() ? charSequence.length() - charSequence2.length() : i;
        if (length < 0) {
            return -1;
        }
        if (charSequence2.length() == 0) {
            return length;
        }
        while (length >= 0) {
            if (CharSequenceUtils.regionMatches(charSequence, true, length, charSequence2, 0, charSequence2.length())) {
                return length;
            }
            length--;
        }
        return -1;
    }

    public static int lastOrdinalIndexOf(CharSequence charSequence, CharSequence charSequence2, int i) {
        return ordinalIndexOf(charSequence, charSequence2, i, true);
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
        return length > 0 ? length > 8192 ? leftPad(str, i, String.valueOf(c)) : repeat(c, length).concat(str) : str;
    }

    public static String leftPad(String str, int i, String str2) {
        if (str == null) {
            return null;
        }
        if (isEmpty(str2)) {
            str2 = SPACE;
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

    public static int length(CharSequence charSequence) {
        if (charSequence == null) {
            return 0;
        }
        return charSequence.length();
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

    public static String normalizeSpace(String str) {
        if (str == null) {
            return null;
        }
        return WHITESPACE_PATTERN.matcher(trim(str)).replaceAll(SPACE);
    }

    public static int ordinalIndexOf(CharSequence charSequence, CharSequence charSequence2, int i) {
        return ordinalIndexOf(charSequence, charSequence2, i, false);
    }

    private static int ordinalIndexOf(CharSequence charSequence, CharSequence charSequence2, int i, boolean z) {
        int i2;
        int i3 = 0;
        int i4 = -1;
        if (charSequence == null || charSequence2 == null || i <= 0) {
            return -1;
        }
        if (charSequence2.length() != 0) {
            if (z) {
                i4 = charSequence.length();
            }
            do {
                i2 = z ? CharSequenceUtils.lastIndexOf(charSequence, charSequence2, i2 - 1) : CharSequenceUtils.indexOf(charSequence, charSequence2, i2 + 1);
                if (i2 < 0) {
                    return i2;
                }
                i3++;
            } while (i3 < i);
            return i2;
        } else if (z) {
            return charSequence.length();
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
        return new StringBuilder(((length + i3) - i4) + str2.length() + 1).append(str.substring(0, i3)).append(str2).append(str.substring(i4)).toString();
    }

    private static String prependIfMissing(String str, CharSequence charSequence, boolean z, CharSequence... charSequenceArr) {
        if (str == null || isEmpty(charSequence) || startsWith(str, charSequence, z)) {
            return str;
        }
        if (charSequenceArr != null && charSequenceArr.length > 0) {
            for (CharSequence startsWith : charSequenceArr) {
                if (startsWith(str, startsWith, z)) {
                    return str;
                }
            }
        }
        return charSequence.toString() + str;
    }

    public static String prependIfMissing(String str, CharSequence charSequence, CharSequence... charSequenceArr) {
        return prependIfMissing(str, charSequence, false, charSequenceArr);
    }

    public static String prependIfMissingIgnoreCase(String str, CharSequence charSequence, CharSequence... charSequenceArr) {
        return prependIfMissing(str, charSequence, true, charSequenceArr);
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

    public static String removePattern(String str, String str2) {
        return replacePattern(str, str2, "");
    }

    public static String removeStart(String str, String str2) {
        return (isEmpty(str) || isEmpty(str2) || !str.startsWith(str2)) ? str : str.substring(str2.length());
    }

    public static String removeStartIgnoreCase(String str, String str2) {
        return (isEmpty(str) || isEmpty(str2) || !startsWithIgnoreCase(str, str2)) ? str : str.substring(str2.length());
    }

    public static String repeat(char c, int i) {
        char[] cArr = new char[i];
        for (int i2 = i - 1; i2 >= 0; i2--) {
            cArr[i2] = (char) c;
        }
        return new String(cArr);
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
            return repeat(str.charAt(0), i);
        }
        int i2 = length * i;
        switch (length) {
            case 1:
                return repeat(str.charAt(0), i);
            case 2:
                char charAt = str.charAt(0);
                char charAt2 = str.charAt(1);
                char[] cArr = new char[i2];
                for (int i3 = (i * 2) - 2; i3 >= 0; i3 = (i3 - 1) - 1) {
                    cArr[i3] = (char) charAt;
                    cArr[i3 + 1] = (char) charAt2;
                }
                return new String(cArr);
            default:
                StringBuilder sb = new StringBuilder(i2);
                for (int i4 = 0; i4 < i; i4++) {
                    sb.append(str);
                }
                return sb.toString();
        }
    }

    public static String repeat(String str, String str2, int i) {
        return (str == null || str2 == null) ? repeat(str, i) : removeEnd(repeat(str + str2, i), str2);
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
        StringBuilder sb = new StringBuilder((i2 * length2) + str.length());
        int i3 = 0;
        while (indexOf != -1) {
            sb.append(str.substring(i3, indexOf)).append(str3);
            i3 = indexOf + length;
            i--;
            if (i == 0) {
                break;
            }
            indexOf = str.indexOf(str2, i3);
        }
        sb.append(str.substring(i3));
        return sb.toString();
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
        StringBuilder sb = new StringBuilder(length2);
        boolean z = false;
        for (int i = 0; i < length2; i++) {
            char charAt = str.charAt(i);
            int indexOf = str2.indexOf(charAt);
            if (indexOf >= 0) {
                z = true;
                if (indexOf < length) {
                    sb.append(str3.charAt(indexOf));
                }
            } else {
                sb.append(charAt);
            }
        }
        return z ? sb.toString() : str;
    }

    public static String replaceEach(String str, String[] strArr, String[] strArr2) {
        return replaceEach(str, strArr, strArr2, false, 0);
    }

    private static String replaceEach(String str, String[] strArr, String[] strArr2, boolean z, int i) {
        int length;
        if (str == null || str.isEmpty() || strArr == null || strArr.length == 0 || strArr2 == null || strArr2.length == 0) {
            return str;
        }
        if (i < 0) {
            throw new IllegalStateException("Aborting to protect against StackOverflowError - output of one loop is the input of another");
        }
        int length2 = strArr.length;
        int length3 = strArr2.length;
        if (length2 != length3) {
            throw new IllegalArgumentException("Search and Replace array lengths don't match: " + length2 + " vs " + length3);
        }
        boolean[] zArr = new boolean[length2];
        int i2 = -1;
        int i3 = -1;
        for (int i4 = 0; i4 < length2; i4++) {
            if (!zArr[i4] && strArr[i4] != null && !strArr[i4].isEmpty() && strArr2[i4] != null) {
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
        StringBuilder sb = new StringBuilder(Math.min(i5, str.length() / 5) + str.length());
        int i7 = 0;
        while (i3 != -1) {
            while (i7 < i3) {
                sb.append(str.charAt(i7));
                i7++;
            }
            sb.append(strArr2[i2]);
            int length4 = i3 + strArr[i2].length();
            i2 = -1;
            i3 = -1;
            for (int i8 = 0; i8 < length2; i8++) {
                if (!zArr[i8] && strArr[i8] != null && !strArr[i8].isEmpty() && strArr2[i8] != null) {
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
            sb.append(str.charAt(i9));
        }
        String sb2 = sb.toString();
        return z ? replaceEach(sb2, strArr, strArr2, z, i - 1) : sb2;
    }

    public static String replaceEachRepeatedly(String str, String[] strArr, String[] strArr2) {
        return replaceEach(str, strArr, strArr2, true, strArr == null ? 0 : strArr.length);
    }

    public static String replaceOnce(String str, String str2, String str3) {
        return replace(str, str2, str3, 1);
    }

    public static String replacePattern(String str, String str2, String str3) {
        return Pattern.compile(str2, 32).matcher(str).replaceAll(str3);
    }

    public static String reverse(String str) {
        if (str == null) {
            return null;
        }
        return new StringBuilder(str).reverse().toString();
    }

    public static String reverseDelimited(String str, char c) {
        if (str == null) {
            return null;
        }
        String[] split = split(str, c);
        ArrayUtils.reverse((Object[]) split);
        return join((Object[]) split, c);
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
        return length > 0 ? length > 8192 ? rightPad(str, i, String.valueOf(c)) : str.concat(repeat(c, length)) : str;
    }

    public static String rightPad(String str, int i, String str2) {
        if (str == null) {
            return null;
        }
        if (isEmpty(str2)) {
            str2 = SPACE;
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
        if (str.isEmpty()) {
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
        int i2;
        boolean z3;
        int i3;
        boolean z4;
        boolean z5;
        boolean z6;
        boolean z7;
        boolean z8;
        boolean z9;
        if (str == null) {
            return null;
        }
        int length = str.length();
        if (length == 0) {
            return ArrayUtils.EMPTY_STRING_ARRAY;
        }
        ArrayList arrayList = new ArrayList();
        if (str2 == null) {
            z5 = false;
            int i4 = 1;
            z4 = false;
            int i5 = 0;
            i2 = 0;
            while (i2 < length) {
                if (Character.isWhitespace(str.charAt(i2))) {
                    if (z4 || z) {
                        int i6 = i4 + 1;
                        if (i4 == i) {
                            z5 = false;
                            i2 = length;
                        } else {
                            z5 = true;
                        }
                        arrayList.add(str.substring(i5, i2));
                        i4 = i6;
                        z9 = false;
                    } else {
                        z9 = z4;
                    }
                    int i7 = i2 + 1;
                    z4 = z9;
                    i5 = i7;
                    i2 = i7;
                } else {
                    i2++;
                    z5 = false;
                    z4 = true;
                }
            }
            i3 = i5;
        } else if (str2.length() == 1) {
            char charAt = str2.charAt(0);
            int i8 = 0;
            boolean z10 = false;
            boolean z11 = false;
            int i9 = 1;
            int i10 = 0;
            while (i2 < length) {
                if (str.charAt(i2) == charAt) {
                    if (z11 || z) {
                        int i11 = i9 + 1;
                        if (i9 == i) {
                            z8 = false;
                            i2 = length;
                        } else {
                            z8 = true;
                        }
                        arrayList.add(str.substring(i8, i2));
                        z7 = false;
                        z10 = z8;
                        i9 = i11;
                    } else {
                        z7 = z11;
                    }
                    int i12 = i2 + 1;
                    i8 = i12;
                    z11 = z7;
                    i10 = i12;
                } else {
                    i10 = i2 + 1;
                    z10 = false;
                    z11 = true;
                }
            }
            i3 = i8;
            z3 = z10;
            z2 = z11;
            if (z2 || (z && z3)) {
                arrayList.add(str.substring(i3, i2));
            }
            return (String[]) arrayList.toArray(new String[arrayList.size()]);
        } else {
            z4 = false;
            z5 = false;
            int i13 = 1;
            int i14 = 0;
            int i15 = 0;
            while (i2 < length) {
                if (str2.indexOf(str.charAt(i2)) >= 0) {
                    if (z4 || z) {
                        int i16 = i13 + 1;
                        if (i13 == i) {
                            z6 = false;
                            i2 = length;
                        } else {
                            z6 = true;
                        }
                        arrayList.add(str.substring(i14, i2));
                        z4 = false;
                        i13 = i16;
                    }
                    int i17 = i2 + 1;
                    i14 = i17;
                    i15 = i17;
                } else {
                    i15 = i2 + 1;
                    z4 = true;
                    z5 = false;
                }
            }
            i3 = i14;
        }
        z3 = z5;
        z2 = z4;
        arrayList.add(str.substring(i3, i2));
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public static boolean startsWith(CharSequence charSequence, CharSequence charSequence2) {
        return startsWith(charSequence, charSequence2, false);
    }

    private static boolean startsWith(CharSequence charSequence, CharSequence charSequence2, boolean z) {
        if (charSequence == null || charSequence2 == null) {
            return charSequence == null && charSequence2 == null;
        }
        if (charSequence2.length() > charSequence.length()) {
            return false;
        }
        return CharSequenceUtils.regionMatches(charSequence, z, 0, charSequence2, 0, charSequence2.length());
    }

    public static boolean startsWithAny(CharSequence charSequence, CharSequence... charSequenceArr) {
        if (isEmpty(charSequence) || ArrayUtils.isEmpty((Object[]) charSequenceArr)) {
            return false;
        }
        for (CharSequence startsWith : charSequenceArr) {
            if (startsWith(charSequence, startsWith)) {
                return true;
            }
        }
        return false;
    }

    public static boolean startsWithIgnoreCase(CharSequence charSequence, CharSequence charSequence2) {
        return startsWith(charSequence, charSequence2, true);
    }

    public static String strip(String str) {
        return strip(str, (String) null);
    }

    public static String strip(String str, String str2) {
        return isEmpty(str) ? str : stripEnd(stripStart(str, str2), str2);
    }

    public static String stripAccents(String str) {
        if (str == null) {
            return null;
        }
        return Pattern.compile("\\p{InCombiningDiacriticalMarks}+").matcher(Normalizer.normalize(str, Normalizer.Form.NFD)).replaceAll("");
    }

    public static String[] stripAll(String... strArr) {
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
        } else if (str2.isEmpty()) {
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
        } else if (str2.isEmpty()) {
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
        if (!strip.isEmpty()) {
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
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.StringUtils.substringAfter(java.lang.String, java.lang.String):java.lang.String");
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
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.StringUtils.substringAfterLast(java.lang.String, java.lang.String):java.lang.String");
    }

    public static String substringBefore(String str, String str2) {
        if (isEmpty(str) || str2 == null) {
            return str;
        }
        if (str2.isEmpty()) {
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
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.StringUtils.substringBeforeLast(java.lang.String, java.lang.String):java.lang.String");
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
            java.lang.String[] r0 = org.apache.commons.lang3.ArrayUtils.EMPTY_STRING_ARRAY
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
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.lang3.StringUtils.substringsBetween(java.lang.String, java.lang.String, java.lang.String):java.lang.String[]");
    }

    public static String swapCase(String str) {
        if (isEmpty(str)) {
            return str;
        }
        char[] charArray = str.toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            char c = charArray[i];
            if (Character.isUpperCase(c)) {
                charArray[i] = Character.toLowerCase(c);
            } else if (Character.isTitleCase(c)) {
                charArray[i] = Character.toLowerCase(c);
            } else if (Character.isLowerCase(c)) {
                charArray[i] = Character.toUpperCase(c);
            }
        }
        return new String(charArray);
    }

    public static String toEncodedString(byte[] bArr, Charset charset) throws UnsupportedEncodingException {
        if (charset == null) {
            charset = Charset.defaultCharset();
        }
        return new String(bArr, charset);
    }

    @Deprecated
    public static String toString(byte[] bArr, String str) throws UnsupportedEncodingException {
        return str != null ? new String(bArr, str) : new String(bArr, Charset.defaultCharset());
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

    public static String uncapitalize(String str) {
        int length;
        if (str == null || (length = str.length()) == 0) {
            return str;
        }
        char charAt = str.charAt(0);
        return !Character.isLowerCase(charAt) ? new StringBuilder(length).append(Character.toLowerCase(charAt)).append(str.substring(1)).toString() : str;
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
