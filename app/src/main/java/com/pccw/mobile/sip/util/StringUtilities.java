package com.pccw.mobile.sip.util;

import java.security.MessageDigest;

public class StringUtilities {
    public static String md5Hash(String str) {
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            char[] charArray = str.toCharArray();
            byte[] bArr = new byte[charArray.length];
            for (int i = 0; i < charArray.length; i++) {
                bArr[i] = (byte) ((byte) charArray[i]);
            }
            byte[] digest = instance.digest(bArr);
            StringBuffer stringBuffer = new StringBuffer();
            for (byte b : digest) {
                byte b2 = b & 255;
                if (b2 < 16) {
                    stringBuffer.append("0");
                }
                stringBuffer.append(Integer.toHexString(b2));
            }
            return stringBuffer.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
}
