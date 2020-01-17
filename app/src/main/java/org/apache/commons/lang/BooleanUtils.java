package org.apache.commons.lang;

import org.apache.commons.lang.math.NumberUtils;

public class BooleanUtils {
    public static boolean isFalse(Boolean bool) {
        return bool != null && !bool.booleanValue();
    }

    public static boolean isNotFalse(Boolean bool) {
        return !isFalse(bool);
    }

    public static boolean isNotTrue(Boolean bool) {
        return !isTrue(bool);
    }

    public static boolean isTrue(Boolean bool) {
        return bool != null && bool.booleanValue();
    }

    public static Boolean negate(Boolean bool) {
        if (bool == null) {
            return null;
        }
        return bool.booleanValue() ? Boolean.FALSE : Boolean.TRUE;
    }

    public static boolean toBoolean(int i) {
        return i != 0;
    }

    public static boolean toBoolean(int i, int i2, int i3) {
        if (i == i2) {
            return true;
        }
        if (i == i3) {
            return false;
        }
        throw new IllegalArgumentException("The Integer did not match either specified value");
    }

    public static boolean toBoolean(Boolean bool) {
        return bool != null && bool.booleanValue();
    }

    public static boolean toBoolean(Integer num, Integer num2, Integer num3) {
        if (num == null) {
            if (num2 != null) {
                if (num3 == null) {
                    return false;
                }
                throw new IllegalArgumentException("The Integer did not match either specified value");
            }
        } else if (!num.equals(num2)) {
            if (num.equals(num3)) {
                return false;
            }
            throw new IllegalArgumentException("The Integer did not match either specified value");
        }
        return true;
    }

    public static boolean toBoolean(String str) {
        if (str == "true") {
            return true;
        }
        if (str == null) {
            return false;
        }
        switch (str.length()) {
            case 2:
                char charAt = str.charAt(0);
                char charAt2 = str.charAt(1);
                return (charAt == 'o' || charAt == 'O') && (charAt2 == 'n' || charAt2 == 'N');
            case 3:
                char charAt3 = str.charAt(0);
                if (charAt3 == 'y') {
                    return (str.charAt(1) == 'e' || str.charAt(1) == 'E') && (str.charAt(2) == 's' || str.charAt(2) == 'S');
                }
                if (charAt3 == 'Y') {
                    return (str.charAt(1) == 'E' || str.charAt(1) == 'e') && (str.charAt(2) == 'S' || str.charAt(2) == 's');
                }
                return false;
            case 4:
                char charAt4 = str.charAt(0);
                if (charAt4 == 't') {
                    return (str.charAt(1) == 'r' || str.charAt(1) == 'R') && (str.charAt(2) == 'u' || str.charAt(2) == 'U') && (str.charAt(3) == 'e' || str.charAt(3) == 'E');
                }
                if (charAt4 == 'T') {
                    return (str.charAt(1) == 'R' || str.charAt(1) == 'r') && (str.charAt(2) == 'U' || str.charAt(2) == 'u') && (str.charAt(3) == 'E' || str.charAt(3) == 'e');
                }
                break;
        }
        return false;
    }

    public static boolean toBoolean(String str, String str2, String str3) {
        if (str == null) {
            if (str2 != null) {
                if (str3 == null) {
                    return false;
                }
                throw new IllegalArgumentException("The String did not match either specified value");
            }
        } else if (!str.equals(str2)) {
            if (str.equals(str3)) {
                return false;
            }
            throw new IllegalArgumentException("The String did not match either specified value");
        }
        return true;
    }

    public static boolean toBooleanDefaultIfNull(Boolean bool, boolean z) {
        return bool == null ? z : bool.booleanValue();
    }

    public static Boolean toBooleanObject(int i) {
        return i == 0 ? Boolean.FALSE : Boolean.TRUE;
    }

    public static Boolean toBooleanObject(int i, int i2, int i3, int i4) {
        if (i == i2) {
            return Boolean.TRUE;
        }
        if (i == i3) {
            return Boolean.FALSE;
        }
        if (i == i4) {
            return null;
        }
        throw new IllegalArgumentException("The Integer did not match any specified value");
    }

    public static Boolean toBooleanObject(Integer num) {
        if (num == null) {
            return null;
        }
        return num.intValue() == 0 ? Boolean.FALSE : Boolean.TRUE;
    }

    public static Boolean toBooleanObject(Integer num, Integer num2, Integer num3, Integer num4) {
        if (num == null) {
            if (num2 == null) {
                return Boolean.TRUE;
            }
            if (num3 == null) {
                return Boolean.FALSE;
            }
            if (num4 == null) {
                return null;
            }
        } else if (num.equals(num2)) {
            return Boolean.TRUE;
        } else {
            if (num.equals(num3)) {
                return Boolean.FALSE;
            }
            if (num.equals(num4)) {
                return null;
            }
        }
        throw new IllegalArgumentException("The Integer did not match any specified value");
    }

    public static Boolean toBooleanObject(String str) {
        if ("true".equalsIgnoreCase(str)) {
            return Boolean.TRUE;
        }
        if ("false".equalsIgnoreCase(str)) {
            return Boolean.FALSE;
        }
        if ("on".equalsIgnoreCase(str)) {
            return Boolean.TRUE;
        }
        if ("off".equalsIgnoreCase(str)) {
            return Boolean.FALSE;
        }
        if ("yes".equalsIgnoreCase(str)) {
            return Boolean.TRUE;
        }
        if ("no".equalsIgnoreCase(str)) {
            return Boolean.FALSE;
        }
        return null;
    }

    public static Boolean toBooleanObject(String str, String str2, String str3, String str4) {
        if (str == null) {
            if (str2 == null) {
                return Boolean.TRUE;
            }
            if (str3 == null) {
                return Boolean.FALSE;
            }
            if (str4 == null) {
                return null;
            }
        } else if (str.equals(str2)) {
            return Boolean.TRUE;
        } else {
            if (str.equals(str3)) {
                return Boolean.FALSE;
            }
            if (str.equals(str4)) {
                return null;
            }
        }
        throw new IllegalArgumentException("The String did not match any specified value");
    }

    public static Boolean toBooleanObject(boolean z) {
        return z ? Boolean.TRUE : Boolean.FALSE;
    }

    public static int toInteger(Boolean bool, int i, int i2, int i3) {
        return bool == null ? i3 : bool.booleanValue() ? i : i2;
    }

    public static int toInteger(boolean z) {
        return z ? 1 : 0;
    }

    public static int toInteger(boolean z, int i, int i2) {
        return z ? i : i2;
    }

    public static Integer toIntegerObject(Boolean bool) {
        if (bool == null) {
            return null;
        }
        return bool.booleanValue() ? NumberUtils.INTEGER_ONE : NumberUtils.INTEGER_ZERO;
    }

    public static Integer toIntegerObject(Boolean bool, Integer num, Integer num2, Integer num3) {
        return bool == null ? num3 : bool.booleanValue() ? num : num2;
    }

    public static Integer toIntegerObject(boolean z) {
        return z ? NumberUtils.INTEGER_ONE : NumberUtils.INTEGER_ZERO;
    }

    public static Integer toIntegerObject(boolean z, Integer num, Integer num2) {
        return z ? num : num2;
    }

    public static String toString(Boolean bool, String str, String str2, String str3) {
        return bool == null ? str3 : bool.booleanValue() ? str : str2;
    }

    public static String toString(boolean z, String str, String str2) {
        return z ? str : str2;
    }

    public static String toStringOnOff(Boolean bool) {
        return toString(bool, "on", "off", (String) null);
    }

    public static String toStringOnOff(boolean z) {
        return toString(z, "on", "off");
    }

    public static String toStringTrueFalse(Boolean bool) {
        return toString(bool, "true", "false", (String) null);
    }

    public static String toStringTrueFalse(boolean z) {
        return toString(z, "true", "false");
    }

    public static String toStringYesNo(Boolean bool) {
        return toString(bool, "yes", "no", (String) null);
    }

    public static String toStringYesNo(boolean z) {
        return toString(z, "yes", "no");
    }

    public static Boolean xor(Boolean[] boolArr) {
        if (boolArr == null) {
            throw new IllegalArgumentException("The Array must not be null");
        } else if (boolArr.length == 0) {
            throw new IllegalArgumentException("Array is empty");
        } else {
            try {
                return xor(ArrayUtils.toPrimitive(boolArr)) ? Boolean.TRUE : Boolean.FALSE;
            } catch (NullPointerException e) {
                throw new IllegalArgumentException("The array must not contain any null elements");
            }
        }
    }

    public static boolean xor(boolean[] zArr) {
        if (zArr == null) {
            throw new IllegalArgumentException("The Array must not be null");
        } else if (zArr.length == 0) {
            throw new IllegalArgumentException("Array is empty");
        } else {
            int i = 0;
            for (boolean z : zArr) {
                if (z) {
                    if (i >= 1) {
                        return false;
                    }
                    i++;
                }
            }
            return i == 1;
        }
    }
}
