package com.pccw.mobile.sip;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.preference.PreferenceManager;
import android.support.v4.app.ActivityCompat;
import android.telephony.TelephonyManager;
import android.text.TextUtils;

import com.pccw.mobile.sip.util.CryptoServices;

import org.apache.commons.lang3.StringUtils;

public class ClientStateManager {
    private static final String CLIENT_CSL_PREPAID_TNC_KEY = "CLIENT_CSL_PREPAID_TNC_KEY";
    private static final String CLIENT_CSL_TNC_KEY = "CLIENT_STATE_CSL_TNC_KEY";
    private static final int CLIENT_MODE_MASK_JUST_SWITCH_ACCOUNT = 32;
    private static final int CLIENT_MODE_MASK_JUST_SWITCH_ACCOUNT_TC_ACCEPTED = 64;
    private static final int CLIENT_MODE_MASK_KNOWNMODE = 1;
    private static final int CLIENT_MODE_MASK_REGISTRATION_ACCEPTED = 16;
    private static final int CLIENT_MODE_MASK_REGISTRATION_SUBMITTED = 8;
    private static final int CLIENT_MODE_MASK_TC_ACCEPTED = 4;
    private static final String CLIENT_POSTPAID_TNC_KEY = "CLIENT_STATE_POSTPAID_TNC_KEY";
    private static final String CLIENT_PREPAID_TNC_KEY = "CLIENT_STATE_PREPAID_TNC_KEY";
    private static final String CLIENT_STATE_ENCRYPTED_OTP_KEY = "CLIENT_STATE_ENCRYPTED_OTP_KEY";
    private static final String CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY = "CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY";
    private static final String CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY = "CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY";
    private static final String CLIENT_STATE_ENCRYPTED_PHONE_KEY = "CLIENT_STATE_ENCRYPTED_PHONE_KEY";
    private static final String CLIENT_STATE_MODE_KEY = "CLIENT_STATE_MODE_KEY";
    private static final String IM_LOGIN_ID_KEY = "IM_LOGIN_ID";
    private static final String IM_PASSWORD_KEY = "IM_PASSWORD";
    private static final String IM_XMPP_DOMAIN_KEY = "IM_XMPP_DOMAIN";
    private static final String NOT_SHOW_SMS_CONSUME_WARMING_CHECKBOX_KEY = "NOT_SHOW_SMS_CONSUME_WARMING_CHECKBOX_KEY";
    private static final String POSTPAID_PREPAID_MODE_PREFERENCE_KEY = "PREF_POSTPAID_PREPAID_MODE_PREFERENCE_KEY";
    private static final String PREPAID_IS_REGISTERED_PREFENENCE_KEY = "PREF_IS_REGISTERED_PREPAID";
    private static final String PREPAID_REGISTERED_NUMBER_PASSWORD_PREFENENCE_KEY = "PREF_PREPAID_REGISTERED_NUMBER_PASSWORD";
    private static final String PREPAID_REGISTERED_NUMBER_PREFENENCE_KEY = "PREF_PREPAID_REGISTERED_NUMBER";
    private static final String PUSH_NOTI_REGID = "PUSH_NOTI_REGID";
    private static final String PUSH_NOTI_REG_VERSION = "PUSH_NOTI_REG_VERSION";
    private static final String REGISTERED_NUMBER_PREFENENCE_KEY = "PREF_REGISTERED_NUMBER_PREFENENCE_KEY";
    public static final int STATE_CHANGE = 1;
    public static final int STATE_CSL_1010_POSTPAID = 6;
    public static final int STATE_CSL_ONE2FREE_POSTPAID = 5;
    public static final int STATE_CSL_PREPAID = 7;
    public static final int STATE_HKT_HELLO_PREPAID = 4;
    public static final int STATE_HKT_NORMAL_PREPAID = 3;
    public static final int STATE_HKT_POSTPAID = 2;
    public static final int STATE_UNCHANGE = 0;
    public static final int STATE_UNKNOWN = 99;
    private static final String USE_FIRST_SIM_SLOT_PREFENENCE_KEY = "PREF_USE_FIRST_SIM_SLOT";
    private static String encryptedDeviceId = "";
    private static String encryptedPccwImsi = "";
    private static String encryptedPccwImsi2 = "";
    private static boolean isGoingToResetPrepaidAccount = false;
    private static boolean isInit = false;
    private static int mode = 0;
    private static String otp = "";
    private static String phone = "";
    private static int postpaid_prepaid_mode = 3;
    private static boolean useFirstSim = true;

    public static void changeNumber(Context context, String str) {
        if (!isInit) {
            readLastState(context);
        }
        phone = str == null ? "" : str.trim();
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString(CLIENT_STATE_ENCRYPTED_PHONE_KEY, CryptoServices.aesEncryptedByMasterKey(phone)).commit();
    }

    public static int checkPostpaidPrepaidMode(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return postpaid_prepaid_mode;
    }

    public static int checkSimState(Context context, boolean z) {
        if (!isInit) {
            readLastState(context);
        }
        if (isRegisteredPrepaid(context)) {
            return 0;
        }
        String str = "";
        String str2 = "";
        String obtainFirstImsi = obtainFirstImsi(context);
        String obtainSecondImsi = obtainSecondImsi(context);
        if (obtainFirstImsi != null && !StringUtils.isBlank(obtainFirstImsi)) {
            str = CryptoServices.aesEncryptedByMasterKey(obtainFirstImsi);
        }
        if (obtainSecondImsi != null && !StringUtils.isBlank(obtainSecondImsi)) {
            str2 = CryptoServices.aesEncryptedByMasterKey(obtainSecondImsi);
        }
        if (str.equals(encryptedPccwImsi) && str2.equals(encryptedPccwImsi2)) {
            return 0;
        }
        if (!z) {
            return 1;
        }
        detectAndUpdateSimSlot(context);
        isInit = true;
        return 1;
    }

    private static void detectAndUpdateSimSlot(Context context) {
        boolean z = true;
        String obtainFirstImsi = obtainFirstImsi(context);
        String obtainSecondImsi = obtainSecondImsi(context);
        if (("".equals(obtainFirstImsi) || (!isFirstOperatorPccw(context) && !isFirstOperatorCSL(context))) && !"".equals(obtainSecondImsi) && (isSecondOperatorPccw(context) || isSecondOperatorCSL(context))) {
            z = false;
        }
        if (obtainFirstImsi == null || StringUtils.isBlank(obtainFirstImsi)) {
            encryptedPccwImsi = "";
        } else {
            encryptedPccwImsi = CryptoServices.aesEncryptedByMasterKey(obtainFirstImsi);
        }
        if (obtainSecondImsi == null || StringUtils.isBlank(obtainSecondImsi)) {
            encryptedPccwImsi2 = "";
        } else {
            encryptedPccwImsi2 = CryptoServices.aesEncryptedByMasterKey(obtainSecondImsi);
        }
        useFirstSim = z;
        phone = "";
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString(CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY, encryptedPccwImsi).putString(CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY, encryptedPccwImsi2).putString(CLIENT_STATE_ENCRYPTED_PHONE_KEY, phone).putBoolean(USE_FIRST_SIM_SLOT_PREFENENCE_KEY, useFirstSim).commit();
    }

    public static String getEncryptedDeviceId(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return encryptedDeviceId;
    }

    public static String getEncryptedPccwImsi(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return useFirstSim ? encryptedPccwImsi : encryptedPccwImsi2;
    }

    private static String getInfoBySlot(TelephonyManager telephonyManager, String str, int i) throws Exception {
        try {
            Object invoke = Class.forName(telephonyManager.getClass().getName()).getMethod(str, new Class[]{Integer.TYPE}).invoke(telephonyManager, new Object[]{Integer.valueOf(i)});
            if (invoke != null) {
                return invoke.toString();
            }
            return null;
        } catch (Exception e) {
            throw new Exception(str);
        }
    }

    public static String getOtp(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return otp;
    }

    public static String getPhone(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return phone;
    }

    public static String getPhoneWithHKCountryCode(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return TextUtils.isEmpty(phone) ? "" : "852" + phone;
    }

    public static String getPushNotificationRegId(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getString(PUSH_NOTI_REGID, "");
    }

    public static int getPushNotificationRegVersion(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(PUSH_NOTI_REG_VERSION, Integer.MIN_VALUE);
    }

    public static String getRegisteredNumber(Context context) {
        String string = PreferenceManager.getDefaultSharedPreferences(context).getString(REGISTERED_NUMBER_PREFENENCE_KEY, "");
        if (!isRegisteredPrepaid(context) || !TextUtils.isEmpty(string)) {
            return string;
        }
        String registeredPrepaidNumber = getRegisteredPrepaidNumber(context);
        setRegisteredNumber(context, registeredPrepaidNumber);
        return registeredPrepaidNumber;
    }

    public static String getRegisteredNumberWithHKCountryCode(Context context) {
        String registeredNumber = getRegisteredNumber(context);
        return TextUtils.isEmpty(registeredNumber) ? "" : "852" + registeredNumber;
    }

    private static String getRegisteredPrepaidNumber(Context context) {
        return isRegisteredPrepaid(context) ? PreferenceManager.getDefaultSharedPreferences(context).getString(PREPAID_REGISTERED_NUMBER_PREFENENCE_KEY, "") : "";
    }

    public static String getRegisteredPrepaidNumberPassword(Context context) {
        return isRegisteredPrepaid(context) ? PreferenceManager.getDefaultSharedPreferences(context).getString(PREPAID_REGISTERED_NUMBER_PASSWORD_PREFENENCE_KEY, "") : "";
    }

    private static String getSecondImsi(TelephonyManager telephonyManager) {
        try {
            return getInfoBySlot(telephonyManager, "getSubscriberIdGemini", 1);
        } catch (Exception e) {
            try {
                return getInfoBySlot(telephonyManager, "getSubscriberId", 1);
            } catch (Exception e2) {
                return null;
            }
        }
    }

    private static String getSecondSimOperator(TelephonyManager telephonyManager) {
        String str = null;
        try {
            str = getInfoBySlot(telephonyManager, "getSimOperatorGemini", 1);
        } catch (Exception e) {
            try {
                str = getInfoBySlot(telephonyManager, "getSimOperator", 1);
            } catch (Exception e2) {
            }
        }
        return str == null ? "" : str;
    }

    public static boolean hasRegisterNumber(Context context) {
        return !TextUtils.isEmpty(PreferenceManager.getDefaultSharedPreferences(context).getString(REGISTERED_NUMBER_PREFENENCE_KEY, ""));
    }

    public static boolean isCSL(Context context) {
        return isCSLPostpaid(context) || isCSLPrepaid(context);
    }

    public static boolean isCSL1010Postpaid(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(POSTPAID_PREPAID_MODE_PREFERENCE_KEY, 0) == 6;
    }

    public static boolean isCSLOne2freePostpaid(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(POSTPAID_PREPAID_MODE_PREFERENCE_KEY, 0) == 5;
    }

    public static boolean isCSLPostpaid(Context context) {
        return isCSLOne2freePostpaid(context) || isCSL1010Postpaid(context);
    }

    public static boolean isCSLPostpaidTCAccepted(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(CLIENT_CSL_TNC_KEY, false);
    }

    public static boolean isCSLPrepaid(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(POSTPAID_PREPAID_MODE_PREFERENCE_KEY, 0) == 7;
    }

    public static boolean isCSLPrepaidTCAccepted(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(CLIENT_CSL_PREPAID_TNC_KEY, false);
    }

    public static boolean isClientStateRegistered(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(POSTPAID_PREPAID_MODE_PREFERENCE_KEY, -1) != -1;
    }

    public static boolean isFirstOperatorCSL(Context context) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
            if (telephonyManager == null || telephonyManager.getSimState() != 5) {
                return false;
            }
            String trim = telephonyManager.getSimOperator().trim();
            return trim.equals("45400") || trim.equals("45402") || trim.equals("45410") || trim.equals("45418");
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isFirstOperatorPccw(Context context) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
            if (telephonyManager == null || telephonyManager.getSimState() != 5) {
                return false;
            }
            String trim = telephonyManager.getSimOperator().trim();
            return trim.equals("45416") || trim.equals("45419");
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isGoingToResetPrepaidAccount(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return isGoingToResetPrepaidAccount;
    }

    public static boolean isHKT(Context context) {
        return isNormalPrepaid(context) || isHelloPrepaid(context) || isHKTPostpaid(context);
    }

    public static boolean isHKTPostpaid(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(POSTPAID_PREPAID_MODE_PREFERENCE_KEY, 0) == 2;
    }

    public static boolean isHKTPostpaidTCAccepted(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(CLIENT_POSTPAID_TNC_KEY, false);
    }

    public static boolean isHKTPrepaid(Context context) {
        return isNormalPrepaid(context) || isHelloPrepaid(context);
    }

    public static boolean isHKTPrepaidTCAccepted(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(CLIENT_PREPAID_TNC_KEY, false);
    }

    public static boolean isHelloPrepaid(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(POSTPAID_PREPAID_MODE_PREFERENCE_KEY, 0) == 4;
    }

    public static boolean isNormalPrepaid(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(POSTPAID_PREPAID_MODE_PREFERENCE_KEY, 0) == 3;
    }

    public static boolean isNotShowSMSConsumeWarmingCheckBox(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(NOT_SHOW_SMS_CONSUME_WARMING_CHECKBOX_KEY, false);
    }

    public static boolean isOperatorCSL(Context context) {
        return useFirstSim ? isFirstOperatorCSL(context) : isSecondOperatorCSL(context);
    }

    public static boolean isOperatorPccw(Context context) {
        return useFirstSim ? isFirstOperatorPccw(context) : isSecondOperatorPccw(context);
    }

    public static boolean isPostpaid(Context context) {
        return isHKTPostpaid(context) || isCSLPostpaid(context);
    }

    public static boolean isPrepaid(Context context) {
        return isNormalPrepaid(context) || isHelloPrepaid(context) || isCSLPrepaid(context);
    }

    public static boolean isRegisteredPrepaid(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(PREPAID_IS_REGISTERED_PREFENENCE_KEY, false);
    }

    public static boolean isSecondOperatorCSL(Context context) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
            if (telephonyManager == null || telephonyManager.getSimState() != 5) {
                return false;
            }
            String trim = getSecondSimOperator(telephonyManager).trim();
            return trim.equals("45400") || trim.equals("45402") || trim.equals("45410") || trim.equals("45418");
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isSecondOperatorPccw(Context context) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
            if (telephonyManager == null || telephonyManager.getSimState() != 5) {
                return false;
            }
            String trim = getSecondSimOperator(telephonyManager).trim();
            return trim.equals("45416") || trim.equals("45419");
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isSecondOperatorSim(Context context) {
        return !(isOperatorPccw(context) | isOperatorCSL(context));
    }

    public static boolean isSupportSMS(Context context) {
        return isPostpaid(context);
    }

    public static boolean isUnknownMode(Context context) {
        if (!isInit) {
            readLastState(context);
        }
        return (mode & 1) == 0;
    }

    @SuppressLint("MissingPermission")
    public static String obtainFirstImsi(Context context) {
        String str;
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        if (telephonyManager == null) {
            return "";
        }
        if (telephonyManager.getSimState() == 5) {
            try {
                str = telephonyManager.getSubscriberId();
            } catch (Exception e) {
                str = null;
            }
        } else {
            str = null;
        }
        if (str == null) {
            return "";
        }
        String trim = str.trim();
        return trim.length() != 15 ? "" : trim;
    }

    public static String obtainImsi(Context context) {
        return useFirstSim ? obtainFirstImsi(context) : obtainSecondImsi(context);
    }

    public static String obtainSecondImsi(Context context) {
        String str;
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        if (telephonyManager == null) {
            return "";
        }
        if (telephonyManager.getSimState() == 5) {
            try {
                str = getSecondImsi(telephonyManager);
            } catch (Exception e) {
                str = null;
            }
        } else {
            str = null;
        }
        if (str == null) {
            return "";
        }
        String trim = str.trim();
        return trim.length() != 15 ? "" : trim;
    }

    private static void readLastState(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        encryptedPccwImsi = defaultSharedPreferences.getString(CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY, "");
        encryptedPccwImsi2 = defaultSharedPreferences.getString(CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY, "");
        useFirstSim = defaultSharedPreferences.getBoolean(USE_FIRST_SIM_SLOT_PREFENENCE_KEY, true);
        phone = defaultSharedPreferences.getString(CLIENT_STATE_ENCRYPTED_PHONE_KEY, "");
        if (phone.length() > 0) {
            phone = CryptoServices.aesDecryptByMasterKey(phone);
        }
        TelephonyManager telephonyManager = (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
        if (telephonyManager != null) {
            try {
                if (ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_PHONE_STATE) != PackageManager.PERMISSION_GRANTED) {
                    // TODO: Consider calling
                    //    ActivityCompat#requestPermissions
                    // here to request the missing permissions, and then overriding
                    //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                    //                                          int[] grantResults)
                    // to handle the case where the user grants the permission. See the documentation
                    // for ActivityCompat#requestPermissions for more details.
                    return;
                }
                encryptedDeviceId = telephonyManager.getDeviceId();
                if (encryptedDeviceId != null) {
                    encryptedDeviceId = CryptoServices.aesEncryptedByMasterKey(encryptedDeviceId.trim());
                } else {
                    encryptedDeviceId = "Unknown Device";
                }
            } catch (Exception e) {
                encryptedDeviceId = "Unknown Device";
            }
        } else {
            encryptedDeviceId = "Unknown Device";
        }
        isInit = true;
    }

    public static void reset(Context context) {
        isInit = false;
    }

    public static boolean resetRegisteredPrepaid(Context context) {
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(PREPAID_IS_REGISTERED_PREFENENCE_KEY, false).commit();
        return true;
    }

    public static boolean setCSLPostpaidTcAccepted(Context context, boolean z) {
        if (!isInit) {
            readLastState(context);
        }
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(CLIENT_CSL_TNC_KEY, z).commit();
        return true;
    }

    public static boolean setCSLPrepaidTcAccepted(Context context, boolean z) {
        if (!isInit) {
            readLastState(context);
        }
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(CLIENT_CSL_PREPAID_TNC_KEY, z).commit();
        return true;
    }

    public static boolean setIsGoingToResetPrepaidAccount(Context context, boolean z) {
        if (!isInit) {
            readLastState(context);
        }
        isGoingToResetPrepaidAccount = z;
        return true;
    }

    public static boolean setJustSwitchAccount(Context context) {
        if (isInit) {
            return true;
        }
        readLastState(context);
        return true;
    }

    public static boolean setPostpaidPrepaidMode(Context context, int i) {
        if (!isInit) {
            readLastState(context);
        }
        if (i != 2 && i != 3 && i != 4 && i != 5 && i != 6 && i != 7 && i != 99) {
            return true;
        }
        postpaid_prepaid_mode = i;
        if (i == 99) {
            return true;
        }
        PreferenceManager.getDefaultSharedPreferences(context).edit().putInt(POSTPAID_PREPAID_MODE_PREFERENCE_KEY, i).commit();
        return true;
    }

    public static boolean setPostpaidTcAccepted(Context context, boolean z) {
        if (!isInit) {
            readLastState(context);
        }
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(CLIENT_POSTPAID_TNC_KEY, z).commit();
        return true;
    }

    public static boolean setPrepaidTcAccepted(Context context, boolean z) {
        if (!isInit) {
            readLastState(context);
        }
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(CLIENT_PREPAID_TNC_KEY, z).commit();
        return true;
    }

    public static boolean setPushNotificationRegId(Context context, String str) {
        try {
            PreferenceManager.getDefaultSharedPreferences(context).edit().putString(PUSH_NOTI_REGID, str).commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean setPushNotificationRegVersion(Context context, int i) {
        try {
            PreferenceManager.getDefaultSharedPreferences(context).edit().putInt(PUSH_NOTI_REG_VERSION, i).commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean setRegisteredNumber(Context context, String str) {
        try {
            PreferenceManager.getDefaultSharedPreferences(context).edit().putString(REGISTERED_NUMBER_PREFENENCE_KEY, str).commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean setRegisteredPrepaid(Context context) {
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(PREPAID_IS_REGISTERED_PREFENENCE_KEY, true).commit();
        return true;
    }

    public static boolean setRegisteredPrepaidNumberPassword(Context context, String str) {
        try {
            PreferenceManager.getDefaultSharedPreferences(context).edit().putString(PREPAID_REGISTERED_NUMBER_PASSWORD_PREFENENCE_KEY, str).commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean setSMSConsumeWarmingCheckBoxStatus(Context context) {
        try {
            PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(NOT_SHOW_SMS_CONSUME_WARMING_CHECKBOX_KEY, true).commit();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean updatePccwImsi(Context context, String str) {
        if (!isInit) {
            readLastState(context);
        }
        if (str == null) {
            str = "";
        }
        encryptedPccwImsi = str;
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString(CLIENT_STATE_ENCRYPTED_PCCW_IMSI_KEY, encryptedPccwImsi).putString(CLIENT_STATE_ENCRYPTED_PCCW_IMSI2_KEY, "").putBoolean(USE_FIRST_SIM_SLOT_PREFENENCE_KEY, true).commit();
        return true;
    }

    public static void updatePrefForSimChange(Context context) {
        detectAndUpdateSimSlot(context);
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString(CLIENT_STATE_ENCRYPTED_PHONE_KEY, "").putBoolean(CLIENT_POSTPAID_TNC_KEY, false).putBoolean(CLIENT_PREPAID_TNC_KEY, false).putBoolean(CLIENT_CSL_TNC_KEY, false).putBoolean(CLIENT_CSL_PREPAID_TNC_KEY, false).commit();
    }
}
