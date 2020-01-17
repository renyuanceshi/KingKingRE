package com.pccw.mobile.sip.util;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

public class CryptoServices {
    public static final String ENCRYPTION_KEY = "77874a39558e0c4e2cc7137da464eca4";
    private static final String FACEBOOK_LINK_ENCRYPTION_KEY = "832a89d9687e86788c8687b7897d7997";
    public static final String GET_CALLEE_STATUS_ENCRYPTION_KEY = "3c4549745a47335e2756593746394065";

    public static String aesDecryptByCalleeStatusKey(String str) {
        return aesEncryptedByMasterKey(GET_CALLEE_STATUS_ENCRYPTION_KEY, str);
    }

    public static String aesDecryptByFacebookShareKey(String str) {
        return aesDecryptByMasterKey(FACEBOOK_LINK_ENCRYPTION_KEY, str);
    }

    public static String aesDecryptByFacebookShareKey(String str, String str2) {
        try {
            return decrypt(str2, new SecretKeySpec(hexStringToByteArray(new String(str)), "AES"));
        } catch (Exception e) {
            return null;
        }
    }

    public static String aesDecryptByMasterKey(String str) {
        return aesDecryptByMasterKey(ENCRYPTION_KEY, str);
    }

    public static String aesDecryptByMasterKey(String str, String str2) {
        try {
            return decrypt(str2, new SecretKeySpec(hexStringToByteArray(new String(str)), "AES"));
        } catch (Exception e) {
            return null;
        }
    }

    public static String aesEncryptedByFacebookShareKey(String str) {
        return aesEncryptedByMasterKey(FACEBOOK_LINK_ENCRYPTION_KEY, str);
    }

    public static String aesEncryptedByFacebookShareKey(String str, String str2) {
        try {
            return decrypt(str2, new SecretKeySpec(hexStringToByteArray(new String(str)), "AES"));
        } catch (Exception e) {
            return null;
        }
    }

    public static String aesEncryptedByMasterKey(String str) {
        return aesEncryptedByMasterKey(ENCRYPTION_KEY, str);
    }

    public static String aesEncryptedByMasterKey(String str, String str2) {
        try {
            return encrypt(str2, new SecretKeySpec(hexStringToByteArray(new String(str)), "AES"));
        } catch (Exception e) {
            return null;
        }
    }

    private static String asHexString(byte[] bArr) {
        StringBuffer stringBuffer = new StringBuffer(bArr.length * 2);
        for (int i = 0; i < bArr.length; i++) {
            if ((bArr[i] & 255) < 16) {
                stringBuffer.append("0");
            }
            stringBuffer.append(Long.toString((long) (bArr[i] & 255), 16));
        }
        return stringBuffer.toString();
    }

    private static String decrypt(String str, SecretKeySpec secretKeySpec) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        Cipher instance = Cipher.getInstance("AES");
        instance.init(2, secretKeySpec);
        return new String(instance.doFinal(hexStringToByteArray(str)));
    }

    private static String encrypt(String str, SecretKeySpec secretKeySpec) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
        Cipher instance = Cipher.getInstance("AES");
        instance.init(1, secretKeySpec);
        return asHexString(instance.doFinal(str.getBytes()));
    }

    private static byte[] hexStringToByteArray(String str) {
        int length = str.length();
        byte[] bArr = new byte[(length / 2)];
        for (int i = 0; i < length; i += 2) {
            bArr[i / 2] = (byte) ((byte) ((Character.digit(str.charAt(i), 16) << 4) + Character.digit(str.charAt(i + 1), 16)));
        }
        return bArr;
    }
}
