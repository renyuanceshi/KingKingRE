package com.pccw.mobile.sip.util;

import android.content.Context;
import com.pccw.mobile.sip.ClientStateManager;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class NumberMappingUtil {
    private static String[] BAR_PHONE_NUMBERS = {"*", "#"};
    private static String[] CSL_IDD_PREFIX = {"+", "001", "0060", "1678", "1718", "1513"};
    private static String[] CSL_PREPAID_IDD_PREFIX = {"+", "001", "0060", "1718"};
    private static String[] PCCW_IDD_PREFIX = {"+", "001", "0060", "1678", "1718"};
    private static String[] PCCW_PREPAID_IDD_PREFIX = {"+", "001", "0060", "1718"};
    private static final String TAG = "NumberMappingUtil";
    private static final Map<String, String> cslNumMapPrefix = new HashMap();
    private static final Map<String, String> cslNumMapWhole = new HashMap();
    private static final Map<String, String> cslPrepaidNumMapPrefix = new HashMap();
    private static final Map<String, String> cslPrepaidNumMapWhole = new HashMap();
    private static final Map<String, String> pccwNumMapPrefix = new HashMap();
    private static final Map<String, String> pccwNumMapWhole = new HashMap();
    private static final Map<String, String> pccwPrepaidNumMapPrefix = new HashMap();
    private static final Map<String, String> pccwPrepaidNumMapWhole = new HashMap();

    static {
        pccwNumMapPrefix.put("+", "1964");
        pccwNumMapPrefix.put("001", "1964");
        pccwNumMapPrefix.put("0060", "19155");
        pccwNumMapPrefix.put("1330060", "13319155");
        pccwNumMapPrefix.put("13570060", "135719155");
        pccwNumMapPrefix.put("1678", "19775");
        pccwNumMapPrefix.put("1331678", "13319775");
        pccwNumMapPrefix.put("13571678", "135719775");
        pccwNumMapPrefix.put("1718", "19776");
        pccwNumMapPrefix.put("1331718", "13319776");
        pccwNumMapPrefix.put("13571718", "135719776");
        pccwNumMapWhole.put("*90", "1761290");
        pccwNumMapWhole.put("*92", "1761292");
        pccwNumMapWhole.put("*988", "1761292");
        pccwNumMapWhole.put("112", "999");
        pccwPrepaidNumMapPrefix.put("+", "1964");
        pccwPrepaidNumMapPrefix.put("001", "1964");
        pccwPrepaidNumMapPrefix.put("1718", "19776");
        pccwPrepaidNumMapPrefix.put("1331718", "13319776");
        pccwPrepaidNumMapPrefix.put("13571718", "135719776");
        pccwPrepaidNumMapWhole.put("*90", "1761290");
        pccwPrepaidNumMapWhole.put("*92", "1761292");
        pccwPrepaidNumMapWhole.put("*988", "1761292");
        pccwPrepaidNumMapWhole.put("112", "999");
        cslNumMapPrefix.put("+", "19770");
        cslNumMapPrefix.put("133+", "13319770");
        cslNumMapPrefix.put("1357+", "135719770");
        cslNumMapPrefix.put("001", "19770");
        cslNumMapPrefix.put("133001", "13319770");
        cslNumMapPrefix.put("1357001", "135719770");
        cslNumMapPrefix.put("1718", "19771");
        cslNumMapPrefix.put("1331718", "13319771");
        cslNumMapPrefix.put("13571718", "135719771");
        cslNumMapPrefix.put("0060", "19155");
        cslNumMapPrefix.put("1330060", "13319155");
        cslNumMapPrefix.put("13570060", "135719155");
        cslNumMapWhole.put("*988", "98866622");
        cslNumMapWhole.put("112", "999");
        cslPrepaidNumMapPrefix.put("+", "19770");
        cslPrepaidNumMapPrefix.put("133+", "13319770");
        cslPrepaidNumMapPrefix.put("1357+", "135719770");
        cslPrepaidNumMapPrefix.put("001", "19770");
        cslPrepaidNumMapPrefix.put("133001", "13319770");
        cslPrepaidNumMapPrefix.put("1357001", "135719770");
        cslPrepaidNumMapPrefix.put("1718", "19771");
        cslPrepaidNumMapPrefix.put("1331718", "13319771");
        cslPrepaidNumMapPrefix.put("13571718", "135719771");
        cslPrepaidNumMapPrefix.put("0060", "19155");
        cslPrepaidNumMapPrefix.put("1330060", "13319155");
        cslPrepaidNumMapPrefix.put("13570060", "135719155");
        cslPrepaidNumMapWhole.put("*988", "98866622");
        cslPrepaidNumMapWhole.put("112", "999");
        Arrays.sort(BAR_PHONE_NUMBERS);
        Arrays.sort(PCCW_IDD_PREFIX);
        Arrays.sort(PCCW_PREPAID_IDD_PREFIX);
        Arrays.sort(CSL_IDD_PREFIX);
        Arrays.sort(CSL_PREPAID_IDD_PREFIX);
    }

    public static boolean hasIDDPrefix(String str, Context context) {
        if (str.startsWith("+852")) {
            return false;
        }
        if (ClientStateManager.isCSLPostpaid(context)) {
            for (String startsWith : CSL_IDD_PREFIX) {
                if (str.startsWith(startsWith)) {
                    return true;
                }
            }
            return false;
        } else if (ClientStateManager.isCSLPrepaid(context)) {
            for (String startsWith2 : CSL_PREPAID_IDD_PREFIX) {
                if (str.startsWith(startsWith2)) {
                    return true;
                }
            }
            return false;
        } else if (ClientStateManager.isHKTPostpaid(context)) {
            for (String startsWith3 : PCCW_IDD_PREFIX) {
                if (str.startsWith(startsWith3)) {
                    return true;
                }
            }
            return false;
        } else if (!ClientStateManager.isHKTPrepaid(context)) {
            return false;
        } else {
            for (String startsWith4 : PCCW_PREPAID_IDD_PREFIX) {
                if (str.startsWith(startsWith4)) {
                    return true;
                }
            }
            return false;
        }
    }

    public static String mapPhoneNumber(String str, Context context) {
        if (str == null) {
            return null;
        }
        if (str.startsWith("+852")) {
            return str.substring(4);
        }
        if (ClientStateManager.isCSL(context)) {
            if (ClientStateManager.isCSLPrepaid(context)) {
                if (cslPrepaidNumMapWhole.containsKey(str)) {
                    return cslPrepaidNumMapWhole.get(str);
                }
                for (Map.Entry next : cslPrepaidNumMapPrefix.entrySet()) {
                    if (str != null && str.startsWith((String) next.getKey())) {
                        return ((String) next.getValue()) + str.substring(((String) next.getKey()).length());
                    }
                }
            } else if (ClientStateManager.isCSLPostpaid(context)) {
                if (cslNumMapWhole.containsKey(str)) {
                    return cslNumMapWhole.get(str);
                }
                for (Map.Entry next2 : cslNumMapPrefix.entrySet()) {
                    if (str != null && str.startsWith((String) next2.getKey())) {
                        return ((String) next2.getValue()) + str.substring(((String) next2.getKey()).length());
                    }
                }
            }
        } else if (ClientStateManager.isHKT(context)) {
            if (ClientStateManager.isHKTPrepaid(context)) {
                if (pccwPrepaidNumMapWhole.containsKey(str)) {
                    return pccwPrepaidNumMapWhole.get(str);
                }
                for (Map.Entry next3 : pccwPrepaidNumMapPrefix.entrySet()) {
                    if (str != null && str.startsWith((String) next3.getKey())) {
                        return ((String) next3.getValue()) + str.substring(((String) next3.getKey()).length());
                    }
                }
            } else if (pccwNumMapWhole.containsKey(str)) {
                return pccwNumMapWhole.get(str);
            } else {
                for (Map.Entry next4 : pccwNumMapPrefix.entrySet()) {
                    if (str != null && str.startsWith((String) next4.getKey())) {
                        return ((String) next4.getValue()) + str.substring(((String) next4.getKey()).length());
                    }
                }
            }
        }
        return null;
    }

    public static boolean shouldBarPhoneNumber(String str, Context context) {
        if (str == null) {
            return false;
        }
        if (ClientStateManager.isCSL(context)) {
            if ("*988".equals(str)) {
                return false;
            }
        } else if (ClientStateManager.isHKT(context) && ("*92".equals(str) || "*90".equals(str) || "*988".equals(str))) {
            return false;
        }
        if (str.startsWith("19")) {
            return true;
        }
        if (str.startsWith("900")) {
            return true;
        }
        return shouldIgnoreVoipCall(str) || (str != null && str.length() >= 1 && Arrays.binarySearch(BAR_PHONE_NUMBERS, str.substring(0, 1)) >= 0);
    }

    public static boolean shouldIgnoreVoipCall(String str) {
        return str != null && (str.startsWith("**21*") || str.startsWith("##21#"));
    }
}
