package com.pccwmobile.common.utilities;

import java.math.BigInteger;

public class HexUtilities {
    public static String byteArrayToHexString(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (byte b : bArr) {
            String hexString = Integer.toHexString(b & 255);
            if (hexString.length() == 1) {
                sb.append('0');
            }
            sb.append(hexString);
        }
        return sb.toString();
    }

    public static BigInteger convertHexToBigIntegerDec(String str) {
        return new BigInteger(str, 16);
    }

    public static int convertHexToDec(String str) {
        return Integer.parseInt(str, 16);
    }

    public static Integer countLengthOfHexStringInByte(String str) {
        if (str == null || str.length() % 2 != 0) {
            return null;
        }
        return Integer.valueOf(str.length() / 2);
    }

    public static byte[] hexStringToByteArray(String str) {
        byte[] bArr = null;
        if (str != null && isHex(str) && str.length() % 2 == 0) {
            int length = str.length();
            bArr = new byte[(length / 2)];
            for (int i = 0; i < length; i += 2) {
                bArr[i / 2] = (byte) ((byte) ((Character.digit(str.charAt(i), 16) << 4) + Character.digit(str.charAt(i + 1), 16)));
            }
        }
        return bArr;
    }

    public static String intToOneByteHexString(int i) {
        if (i <= 255) {
            return Integer.toHexString(i & 255).length() == 1 ? "0" + Integer.toHexString(i & 255) : Integer.toHexString(i & 255);
        }
        return null;
    }

    public static boolean isHex(String str) {
        return str.matches("^[0-9A-Fa-f]+$");
    }
}
