package org.apache.commons.lang3;

public class CharSequenceUtils {
    static int indexOf(CharSequence charSequence, int i, int i2) {
        if (charSequence instanceof String) {
            return ((String) charSequence).indexOf(i, i2);
        }
        int length = charSequence.length();
        if (i2 < 0) {
            i2 = 0;
        }
        for (int i3 = i2; i3 < length; i3++) {
            if (charSequence.charAt(i3) == i) {
                return i3;
            }
        }
        return -1;
    }

    static int indexOf(CharSequence charSequence, CharSequence charSequence2, int i) {
        return charSequence.toString().indexOf(charSequence2.toString(), i);
    }

    static int lastIndexOf(CharSequence charSequence, int i, int i2) {
        if (charSequence instanceof String) {
            return ((String) charSequence).lastIndexOf(i, i2);
        }
        int length = charSequence.length();
        if (i2 < 0) {
            return -1;
        }
        for (int i3 = i2 >= length ? length - 1 : i2; i3 >= 0; i3--) {
            if (charSequence.charAt(i3) == i) {
                return i3;
            }
        }
        return -1;
    }

    static int lastIndexOf(CharSequence charSequence, CharSequence charSequence2, int i) {
        return charSequence.toString().lastIndexOf(charSequence2.toString(), i);
    }

    static boolean regionMatches(CharSequence charSequence, boolean z, int i, CharSequence charSequence2, int i2, int i3) {
        if (!(charSequence instanceof String) || !(charSequence2 instanceof String)) {
            while (true) {
                int i4 = i3 - 1;
                if (i3 <= 0) {
                    return true;
                }
                int i5 = i + 1;
                char charAt = charSequence.charAt(i);
                int i6 = i2 + 1;
                char charAt2 = charSequence2.charAt(i2);
                if (charAt == charAt2) {
                    i3 = i4;
                    i = i5;
                    i2 = i6;
                } else if (!z) {
                    return false;
                } else {
                    if (Character.toUpperCase(charAt) != Character.toUpperCase(charAt2) && Character.toLowerCase(charAt) != Character.toLowerCase(charAt2)) {
                        return false;
                    }
                    i3 = i4;
                    i = i5;
                    i2 = i6;
                }
            }
        } else {
            return ((String) charSequence).regionMatches(z, i, (String) charSequence2, i2, i3);
        }
    }

    public static CharSequence subSequence(CharSequence charSequence, int i) {
        if (charSequence == null) {
            return null;
        }
        return charSequence.subSequence(i, charSequence.length());
    }

    static char[] toCharArray(CharSequence charSequence) {
        if (charSequence instanceof String) {
            return ((String) charSequence).toCharArray();
        }
        int length = charSequence.length();
        char[] cArr = new char[charSequence.length()];
        for (int i = 0; i < length; i++) {
            cArr[i] = charSequence.charAt(i);
        }
        return cArr;
    }
}
