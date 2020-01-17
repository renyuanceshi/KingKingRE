package de.timroes.base64;

import java.util.HashMap;
import org.apache.commons.lang3.StringUtils;

public class Base64 {
    private static final char[] code = "=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray();
    private static final HashMap<Character, Byte> map = new HashMap<>();

    static {
        for (int i = 0; i < code.length; i++) {
            map.put(Character.valueOf(code[i]), Byte.valueOf((byte) i));
        }
    }

    public static byte[] decode(String str) {
        String replaceAll = str.replaceAll("\\r|\\n", "");
        if (replaceAll.length() % 4 != 0) {
            throw new IllegalArgumentException("The length of the input string must be a multiple of four.");
        } else if (!replaceAll.matches("^[A-Za-z0-9+/]*[=]{0,3}$")) {
            throw new IllegalArgumentException("The argument contains illegal characters.");
        } else {
            byte[] bArr = new byte[((replaceAll.length() * 3) / 4)];
            char[] charArray = replaceAll.toCharArray();
            int i = 0;
            for (int i2 = 0; i2 < charArray.length; i2 += 4) {
                byte byteValue = map.get(Character.valueOf(charArray[i2])).byteValue();
                int byteValue2 = map.get(Character.valueOf(charArray[i2 + 1])).byteValue() - 1;
                int byteValue3 = map.get(Character.valueOf(charArray[i2 + 2])).byteValue() - 1;
                byte byteValue4 = map.get(Character.valueOf(charArray[i2 + 3])).byteValue();
                int i3 = i + 1;
                bArr[i] = (byte) ((byte) (((byteValue - 1) << 2) | (byteValue2 >>> 4)));
                int i4 = i3 + 1;
                bArr[i3] = (byte) ((byte) (((byteValue2 & 15) << 4) | (byteValue3 >>> 2)));
                bArr[i4] = (byte) ((byte) (((byteValue4 - 1) & 63) | ((byteValue3 & 3) << 6)));
                i = i4 + 1;
            }
            if (!replaceAll.endsWith("=")) {
                return bArr;
            }
            byte[] bArr2 = new byte[(bArr.length - (replaceAll.length() - replaceAll.indexOf("=")))];
            System.arraycopy(bArr, 0, bArr2, 0, bArr2.length);
            return bArr2;
        }
    }

    public static String decodeAsString(String str) {
        return new String(decode(str));
    }

    public static String encode(String str) {
        return encode(str.getBytes());
    }

    public static String encode(byte[] bArr) {
        StringBuilder sb = new StringBuilder(((bArr.length + 2) / 3) * 4);
        byte[] encodeAsBytes = encodeAsBytes(bArr);
        for (int i = 0; i < encodeAsBytes.length; i++) {
            sb.append(code[encodeAsBytes[i] + 1]);
            if (i % 72 == 71) {
                sb.append(StringUtils.LF);
            }
        }
        return sb.toString();
    }

    public static String encode(Byte[] bArr) {
        byte[] bArr2 = new byte[bArr.length];
        for (int i = 0; i < bArr2.length; i++) {
            bArr2[i] = bArr[i].byteValue();
        }
        return encode(bArr2);
    }

    public static byte[] encodeAsBytes(String str) {
        return encodeAsBytes(str.getBytes());
    }

    public static byte[] encodeAsBytes(byte[] bArr) {
        int i = 0;
        byte[] bArr2 = new byte[(((bArr.length + 2) / 3) * 4)];
        byte[] bArr3 = new byte[(((bArr.length + 2) / 3) * 3)];
        System.arraycopy(bArr, 0, bArr3, 0, bArr.length);
        int i2 = 0;
        while (true) {
            int i3 = i;
            if (i2 >= bArr3.length) {
                break;
            }
            int i4 = i3 + 1;
            bArr2[i3] = (byte) ((byte) ((bArr3[i2] & 255) >>> 2));
            int i5 = i4 + 1;
            bArr2[i4] = (byte) ((byte) (((bArr3[i2] & 3) << 4) | ((bArr3[i2 + 1] & 255) >>> 4)));
            int i6 = i5 + 1;
            bArr2[i5] = (byte) ((byte) (((bArr3[i2 + 1] & 15) << 2) | ((bArr3[i2 + 2] & 255) >>> 6)));
            i = i6 + 1;
            bArr2[i6] = (byte) ((byte) (bArr3[i2 + 2] & 63));
            i2 += 3;
        }
        for (int length = bArr3.length - bArr.length; length > 0; length--) {
            bArr2[bArr2.length - length] = (byte) -1;
        }
        return bArr2;
    }
}
