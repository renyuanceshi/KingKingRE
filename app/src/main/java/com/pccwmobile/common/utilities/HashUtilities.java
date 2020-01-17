package com.pccwmobile.common.utilities;

import com.pccw.mobile.sip.Constants;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashUtilities {
    public static String md5Hash(String str) {
        int i = 0;
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            char[] charArray = str.toCharArray();
            byte[] bArr = new byte[charArray.length];
            for (int i2 = 0; i2 < charArray.length; i2++) {
                bArr[i2] = (byte) ((byte) charArray[i2]);
            }
            byte[] digest = instance.digest(bArr);
            StringBuffer stringBuffer = new StringBuffer();
            while (i < digest.length) {
                try {
                    byte b = digest[i] & 255;
                    if (b < 16) {
                        stringBuffer.append("0");
                    }
                    stringBuffer.append(Integer.toHexString(b));
                    i++;
                } catch (Exception e) {
                    e = e;
                    try {
                        e.printStackTrace();
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
            return stringBuffer.toString();
        } catch (Exception e2) {
            e = e2;
            e.printStackTrace();
            return null;
        }
    }

    public static byte[] sha1(String str) {
        Log.v(Constants.LOG_TAG_DEV, "FSFSDFSDFSF");
        if (str == null) {
            return null;
        }
        try {
            MessageDigest instance = MessageDigest.getInstance("SHA-1");
            byte[] bArr = new byte[40];
            try {
                instance.update(str.getBytes("iso-8859-1"), 0, str.length());
                return instance.digest();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                return null;
            }
        } catch (NoSuchAlgorithmException e2) {
            e2.printStackTrace();
            return null;
        }
    }

    public static String sha1String(String str) {
        return HexUtilities.byteArrayToHexString(sha1(str));
    }
}
