package com.pccwmobile.common.utilities;

import com.pccw.mobile.sip.Constants;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;
import javax.crypto.spec.IvParameterSpec;

public class CryptoUtilities {
    public static void tripleDesCbcNoPaddingEncryption(String str, String str2, String str3) {
        byte[] hexStringToByteArray = HexUtilities.hexStringToByteArray(str);
        byte[] hexStringToByteArray2 = HexUtilities.hexStringToByteArray(str2);
        byte[] hexStringToByteArray3 = HexUtilities.hexStringToByteArray(str3);
        try {
            SecretKey generateSecret = SecretKeyFactory.getInstance("DESede").generateSecret(new DESedeKeySpec(hexStringToByteArray));
            Cipher instance = Cipher.getInstance("DESede/CBC/NoPadding");
            instance.init(1, generateSecret, new IvParameterSpec(hexStringToByteArray2));
            Log.v(Constants.LOG_TAG_DEV, "result=" + HexUtilities.byteArrayToHexString(instance.doFinal(hexStringToByteArray3)));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
