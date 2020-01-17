package org.apache.commons.lang;

import android.support.v4.media.TransportMediator;
import android.support.v7.widget.ActivityChooserView;
import java.util.Random;

public class RandomStringUtils {
    private static final Random RANDOM = new Random();

    public static String random(int i) {
        return random(i, false, false);
    }

    public static String random(int i, int i2, int i3, boolean z, boolean z2) {
        return random(i, i2, i3, z, z2, (char[]) null, RANDOM);
    }

    public static String random(int i, int i2, int i3, boolean z, boolean z2, char[] cArr) {
        return random(i, i2, i3, z, z2, cArr, RANDOM);
    }

    public static String random(int i, int i2, int i3, boolean z, boolean z2, char[] cArr, Random random) {
        if (i == 0) {
            return "";
        }
        if (i < 0) {
            throw new IllegalArgumentException(new StringBuffer().append("Requested random string length ").append(i).append(" is less than 0.").toString());
        }
        if (i2 == 0 && i3 == 0) {
            i3 = 123;
            i2 = 32;
            if (!z && !z2) {
                i2 = 0;
                i3 = ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED;
            }
        }
        char[] cArr2 = new char[i];
        int i4 = i3 - i2;
        while (true) {
            int i5 = i - 1;
            if (i == 0) {
                return new String(cArr2);
            }
            char nextInt = cArr == null ? (char) (random.nextInt(i4) + i2) : cArr[random.nextInt(i4) + i2];
            if ((!z || !Character.isLetter(nextInt)) && ((!z2 || !Character.isDigit(nextInt)) && (z || z2))) {
                i5++;
            } else if (nextInt < 56320 || nextInt > 57343) {
                if (nextInt < 55296 || nextInt > 56191) {
                    if (nextInt < 56192 || nextInt > 56319) {
                        cArr2[i5] = nextInt;
                    } else {
                        i5++;
                    }
                } else if (i5 == 0) {
                    i5++;
                } else {
                    cArr2[i5] = (char) ((char) (random.nextInt(128) + 56320));
                    i5--;
                    cArr2[i5] = nextInt;
                }
            } else if (i5 == 0) {
                i5++;
            } else {
                cArr2[i5] = nextInt;
                i5--;
                cArr2[i5] = (char) ((char) (random.nextInt(128) + 55296));
            }
            i = i5;
        }
    }

    public static String random(int i, String str) {
        if (str != null) {
            return random(i, str.toCharArray());
        }
        return random(i, 0, 0, false, false, (char[]) null, RANDOM);
    }

    public static String random(int i, boolean z, boolean z2) {
        return random(i, 0, 0, z, z2);
    }

    public static String random(int i, char[] cArr) {
        if (cArr == null) {
            return random(i, 0, 0, false, false, (char[]) null, RANDOM);
        }
        return random(i, 0, cArr.length, false, false, cArr, RANDOM);
    }

    public static String randomAlphabetic(int i) {
        return random(i, true, false);
    }

    public static String randomAlphanumeric(int i) {
        return random(i, true, true);
    }

    public static String randomAscii(int i) {
        return random(i, 32, TransportMediator.KEYCODE_MEDIA_PAUSE, false, false);
    }

    public static String randomNumeric(int i) {
        return random(i, false, true);
    }
}
