package org.apache.commons.lang;

import java.math.BigDecimal;
import java.math.BigInteger;

public final class NumberUtils {
    public static int compare(double d, double d2) {
        if (d >= d2) {
            if (d > d2) {
                return 1;
            }
            long doubleToLongBits = Double.doubleToLongBits(d);
            long doubleToLongBits2 = Double.doubleToLongBits(d2);
            if (doubleToLongBits == doubleToLongBits2) {
                return 0;
            }
            if (doubleToLongBits >= doubleToLongBits2) {
                return 1;
            }
        }
        return -1;
    }

    public static int compare(float f, float f2) {
        if (f >= f2) {
            if (f > f2) {
                return 1;
            }
            int floatToIntBits = Float.floatToIntBits(f);
            int floatToIntBits2 = Float.floatToIntBits(f2);
            if (floatToIntBits == floatToIntBits2) {
                return 0;
            }
            if (floatToIntBits >= floatToIntBits2) {
                return 1;
            }
        }
        return -1;
    }

    public static BigDecimal createBigDecimal(String str) {
        return new BigDecimal(str);
    }

    public static BigInteger createBigInteger(String str) {
        return new BigInteger(str);
    }

    public static Double createDouble(String str) {
        return Double.valueOf(str);
    }

    public static Float createFloat(String str) {
        return Float.valueOf(str);
    }

    public static Integer createInteger(String str) {
        return Integer.decode(str);
    }

    public static Long createLong(String str) {
        return Long.valueOf(str);
    }

    public static Number createNumber(String str) throws NumberFormatException {
        String substring;
        String str2;
        String str3 = null;
        if (str == null) {
            return null;
        }
        if (str.length() == 0) {
            throw new NumberFormatException("\"\" is not a valid number.");
        } else if (str.length() == 1 && !Character.isDigit(str.charAt(0))) {
            throw new NumberFormatException(new StringBuffer().append(str).append(" is not a valid number.").toString());
        } else if (str.startsWith("--")) {
            return null;
        } else {
            if (str.startsWith("0x") || str.startsWith("-0x")) {
                return createInteger(str);
            }
            char charAt = str.charAt(str.length() - 1);
            int indexOf = str.indexOf(46);
            int indexOf2 = str.indexOf(101) + str.indexOf(69) + 1;
            if (indexOf > -1) {
                if (indexOf2 <= -1) {
                    str2 = str.substring(indexOf + 1);
                } else if (indexOf2 < indexOf) {
                    throw new NumberFormatException(new StringBuffer().append(str).append(" is not a valid number.").toString());
                } else {
                    str2 = str.substring(indexOf + 1, indexOf2);
                }
                substring = str.substring(0, indexOf);
            } else {
                substring = indexOf2 > -1 ? str.substring(0, indexOf2) : str;
                str2 = null;
            }
            if (!Character.isDigit(charAt)) {
                if (indexOf2 > -1 && indexOf2 < str.length() - 1) {
                    str3 = str.substring(indexOf2 + 1, str.length() - 1);
                }
                String substring2 = str.substring(0, str.length() - 1);
                boolean z = isAllZeros(substring) && isAllZeros(str3);
                switch (charAt) {
                    case 'D':
                    case 'd':
                        break;
                    case 'F':
                    case 'f':
                        try {
                            Float createFloat = createFloat(substring2);
                            if (!createFloat.isInfinite() && (createFloat.floatValue() != 0.0f || z)) {
                                return createFloat;
                            }
                        } catch (NumberFormatException e) {
                            break;
                        }
                    case 'L':
                    case 'l':
                        if (str2 == null && str3 == null && ((substring2.charAt(0) == '-' && isDigits(substring2.substring(1))) || isDigits(substring2))) {
                            try {
                                return createLong(substring2);
                            } catch (NumberFormatException e2) {
                                return createBigInteger(substring2);
                            }
                        } else {
                            throw new NumberFormatException(new StringBuffer().append(str).append(" is not a valid number.").toString());
                        }
                }
                try {
                    Double createDouble = createDouble(substring2);
                    if (!createDouble.isInfinite() && (((double) createDouble.floatValue()) != 0.0d || z)) {
                        return createDouble;
                    }
                } catch (NumberFormatException e3) {
                }
                try {
                    return createBigDecimal(substring2);
                } catch (NumberFormatException e4) {
                }
            } else {
                if (indexOf2 > -1 && indexOf2 < str.length() - 1) {
                    str3 = str.substring(indexOf2 + 1, str.length());
                }
                if (str2 == null && str3 == null) {
                    try {
                        return createInteger(str);
                    } catch (NumberFormatException e5) {
                        try {
                            return createLong(str);
                        } catch (NumberFormatException e6) {
                            return createBigInteger(str);
                        }
                    }
                } else {
                    boolean z2 = isAllZeros(substring) && isAllZeros(str3);
                    try {
                        Float createFloat2 = createFloat(str);
                        if (!createFloat2.isInfinite() && (createFloat2.floatValue() != 0.0f || z2)) {
                            return createFloat2;
                        }
                    } catch (NumberFormatException e7) {
                    }
                    try {
                        Double createDouble2 = createDouble(str);
                        if (!createDouble2.isInfinite() && (createDouble2.doubleValue() != 0.0d || z2)) {
                            return createDouble2;
                        }
                    } catch (NumberFormatException e8) {
                    }
                    return createBigDecimal(str);
                }
            }
        }
        throw new NumberFormatException(new StringBuffer().append(str).append(" is not a valid number.").toString());
    }

    private static boolean isAllZeros(String str) {
        if (str != null) {
            for (int length = str.length() - 1; length >= 0; length--) {
                if (str.charAt(length) != '0') {
                    return false;
                }
            }
            if (str.length() <= 0) {
                return false;
            }
        }
        return true;
    }

    public static boolean isDigits(String str) {
        if (str == null || str.length() == 0) {
            return false;
        }
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static boolean isNumber(String str) {
        if (StringUtils.isEmpty(str)) {
            return false;
        }
        char[] charArray = str.toCharArray();
        int length = charArray.length;
        int i = charArray[0] == '-' ? 1 : 0;
        if (length > i + 1 && charArray[i] == '0' && charArray[i + 1] == 'x') {
            int i2 = i + 2;
            if (i2 == length) {
                return false;
            }
            while (i2 < charArray.length) {
                if ((charArray[i2] < '0' || charArray[i2] > '9') && ((charArray[i2] < 'a' || charArray[i2] > 'f') && (charArray[i2] < 'A' || charArray[i2] > 'F'))) {
                    return false;
                }
                i2++;
            }
            return true;
        }
        int i3 = length - 1;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        while (true) {
            if (i < i3 || (i < i3 + 1 && z && !z2)) {
                if (charArray[i] >= '0' && charArray[i] <= '9') {
                    z = false;
                    z2 = true;
                } else if (charArray[i] == '.') {
                    if (z3 || z4) {
                        return false;
                    }
                    z3 = true;
                } else if (charArray[i] == 'e' || charArray[i] == 'E') {
                    if (z4 || !z2) {
                        return false;
                    }
                    z = true;
                    z4 = true;
                } else if ((charArray[i] != '+' && charArray[i] != '-') || !z) {
                    return false;
                } else {
                    z = false;
                    z2 = false;
                }
                i++;
            }
        }
        if (i >= charArray.length) {
            return !z && z2;
        }
        if (charArray[i] >= '0' && charArray[i] <= '9') {
            return true;
        }
        if (charArray[i] == 'e' || charArray[i] == 'E') {
            return false;
        }
        return (z || !(charArray[i] == 'd' || charArray[i] == 'D' || charArray[i] == 'f' || charArray[i] == 'F')) ? (charArray[i] == 'l' || charArray[i] == 'L') && z2 && !z4 : z2;
    }

    public static int maximum(int i, int i2, int i3) {
        int i4 = i2 > i ? i2 : i;
        return i3 > i4 ? i3 : i4;
    }

    public static long maximum(long j, long j2, long j3) {
        long j4 = j2 > j ? j2 : j;
        return j3 > j4 ? j3 : j4;
    }

    public static int minimum(int i, int i2, int i3) {
        int i4 = i2 < i ? i2 : i;
        return i3 < i4 ? i3 : i4;
    }

    public static long minimum(long j, long j2, long j3) {
        long j4 = j2 < j ? j2 : j;
        return j3 < j4 ? j3 : j4;
    }

    public static int stringToInt(String str) {
        return stringToInt(str, 0);
    }

    public static int stringToInt(String str, int i) {
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return i;
        }
    }
}
