package com.pccw.mobile.sip;

import android.content.Context;
import android.preference.PreferenceManager;
import android.util.Log;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.mobile.sip.util.VersionUtils;

import java.io.StringReader;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

public class ServerMessageController {
    public static final String ATTR_RESPONSE_FUNCTION = "function";
    public static final String ATTR_RESPONSE_RESULTCODE = "resultcode";
    public static final int LANG_CHI = 1;
    public static final int LANG_ENG = 0;
    public static final int LANG_UNKNOWN = -1;
    public static final String MESSAGE_INTENT_MESSAGE = "MESSAGE";
    public static final String MESSAGE_INTENT_OVERSEA_BOOLEAN = "IS_OVERSEA";
    private static final String MESSAGE_LAST_DOWNLOAD_SUCCESS = "MESSAGE_LAST_DOWNLOAD_SUCCESS";
    private static final String MESSAGE_LIST = "MESSAGE_LIST";
    private static final String MESSAGE_LIST_TYPE = "MESSAGE_LIST_TYPE";
    public static final String MESSAGE_TYPE_ACCEPTTANDC = "acceptTandC";
    public static final String MESSAGE_TYPE_CALLFORWARD = "callforward";
    public static final String MESSAGE_TYPE_CALLFORWARD_OVERSEA = "callforward_oversea";
    public static final String MESSAGE_TYPE_CALLFORWARD_PREPAID = "callforward_prepaid";
    public static final String MESSAGE_TYPE_CHECK_BALANCE = "check_balance";
    public static final String MESSAGE_TYPE_GET_IMSI = "get_imsi";
    public static final String MESSAGE_TYPE_GET_IMSI_OVERSEA = "get_imsi_oversea";
    public static final String MESSAGE_TYPE_GET_IMSI_PREPAID = "get_imsi_prepaid";
    public static final String MESSAGE_TYPE_GET_NUMBER_INFO = "get_number_info";
    public static final String MESSAGE_TYPE_GET_NUMBER_INFO_OVERSEA = "get_number_info_oversea";
    public static final String MESSAGE_TYPE_GET_NUMBER_INFO_PREPAID = "get_number_info_prepaid";
    public static final String MESSAGE_TYPE_HEARTBEAT = "heartbeat";
    public static final String MESSAGE_TYPE_LOGIN = "login";
    public static final String MESSAGE_TYPE_LOGIN_OVERSEA = "login_oversea";
    public static final String MESSAGE_TYPE_LOGIN_PREPAID = "login_prepaid";
    public static final String MESSAGE_TYPE_MESSAGE = "message";
    public static final String MESSAGE_TYPE_VERSION = "version";
    private static final String MESSAGE_VERSION = "MESSAGE_VERSION";
    public static final String TAG_MESSAGE_CH = "message_ch";
    public static final String TAG_MESSAGE_EN = "message_en";
    public static final String TAG_RESPONSE = "response";
    public static final String TAG_ROAMSAVEMESSAGE = "roamsavemessage";
    private Context appContext = null;
    private HashMap<String, HashMap<String, HashMap<Integer, String>>> serverMessageList = new HashMap<>();

    public enum MessageListType {
        TYPE_PCCW,
        TYPE_CSL_ONE2FREE,
        TYPE_CSL_1010,
        TYPE_CSL_NWM,
        TYPE_CSL_PREPAID
    }

    public ServerMessageController(Context context) {
        this.appContext = context.getApplicationContext();
        init();
    }

    private void combineMessageList(HashMap<String, HashMap<String, HashMap<Integer, String>>> hashMap) {
        for (Map.Entry next : hashMap.entrySet()) {
            String str = (String) next.getKey();
            for (Map.Entry entry : ((HashMap) next.getValue()).entrySet()) {
                String str2 = (String) entry.getKey();
                for (Map.Entry entry2 : ((HashMap) entry.getValue()).entrySet()) {
                    int intValue = ((Integer) entry2.getKey()).intValue();
                    String str3 = (String) entry2.getValue();
                    if (str3 != null) {
                        if (!this.serverMessageList.containsKey(str)) {
                            this.serverMessageList.put(str, new HashMap());
                        }
                        if (!this.serverMessageList.get(str).containsKey(str2)) {
                            this.serverMessageList.get(str).put(str2, new HashMap());
                        }
                        ((HashMap) this.serverMessageList.get(str).get(str2)).put(Integer.valueOf(intValue), str3);
                    }
                }
            }
        }
    }

    private boolean parse(InputSource inputSource, ServerMessageXmlHandler serverMessageXmlHandler) {
        try {
            XMLReader xMLReader = SAXParserFactory.newInstance().newSAXParser().getXMLReader();
            xMLReader.setContentHandler(serverMessageXmlHandler);
            xMLReader.parse(inputSource);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String asString() {
        String str = "" + "<roamsavemessage>\n";
        for (Map.Entry next : this.serverMessageList.entrySet()) {
            String str2 = (String) next.getKey();
            String str3 = str;
            for (Map.Entry entry : ((HashMap) next.getValue()).entrySet()) {
                String str4 = str3 + "<response function=\"" + str2 + "\" " + ATTR_RESPONSE_RESULTCODE + "=\"" + ((String) entry.getKey()) + "\">\n";
                for (Map.Entry entry2 : ((HashMap) entry.getValue()).entrySet()) {
                    int intValue = ((Integer) entry2.getKey()).intValue();
                    String str5 = (String) entry2.getValue();
                    if (str5 != null) {
                        if (intValue == 0) {
                            str4 = str4 + "<message_en>" + str5 + "</" + TAG_MESSAGE_EN + ">\n";
                        } else if (intValue == 1) {
                            str4 = str4 + "<message_ch>" + str5 + "</" + TAG_MESSAGE_CH + ">\n";
                        }
                    }
                }
                str3 = str4 + "</response>\n";
            }
            str = str3;
        }
        return str + "</roamsavemessage>\n";
    }

    public void init() {
        String string = PreferenceManager.getDefaultSharedPreferences(this.appContext).getString(MESSAGE_LIST, (String) null);
        if (string != null) {
            HashMap<String, HashMap<String, HashMap<Integer, String>>> hashMap = new HashMap<>();
            if (parse(new InputSource(new StringReader(string)), new ServerMessageXmlHandler(hashMap))) {
                this.serverMessageList = hashMap;
            } else {
                parse(new InputSource(this.appContext.getResources().openRawResource(R.raw.default_messages)), new ServerMessageXmlHandler(this.serverMessageList));
            }
        } else {
            parse(new InputSource(this.appContext.getResources().openRawResource(R.raw.default_messages)), new ServerMessageXmlHandler(this.serverMessageList));
        }
    }

    public boolean lastMessageDownloadSuccess() {
        return PreferenceManager.getDefaultSharedPreferences(this.appContext).getBoolean(MESSAGE_LAST_DOWNLOAD_SUCCESS, false);
    }

    public boolean loadNewVersion(String str, String str2, String str3) {
        int i = 0;
        while (i < 2 && MobileSipService.getInstance().isNetworkAvailable(this.appContext)) {
            try {
                String post = HttpUtils.post(str, "os", MobileSipService.OS);
                if (post == null || post.length() == 0) {
                    i++;
                } else {
                    HashMap hashMap = new HashMap();
                    if (parse(new InputSource(new StringReader(post)), new ServerMessageXmlHandler(hashMap))) {
                        combineMessageList(hashMap);
                        PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putString(MESSAGE_LIST, asString()).commit();
                        PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putString(MESSAGE_VERSION, str2).commit();
                        PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putString(MESSAGE_LIST_TYPE, str3).commit();
                        PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putBoolean(MESSAGE_LAST_DOWNLOAD_SUCCESS, true).commit();
                        return true;
                    }
                    i++;
                }
            } catch (Exception e) {
                i++;
            }
        }
        PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putBoolean(MESSAGE_LAST_DOWNLOAD_SUCCESS, false).commit();
        return false;
    }

    public boolean needUpdateErrorMessageList(String str, MessageListType messageListType) {
        String str2;
        if (!messageListType.toString().equalsIgnoreCase(PreferenceManager.getDefaultSharedPreferences(this.appContext).getString(MESSAGE_LIST_TYPE, ""))) {
            return true;
        }
        String trim = PreferenceManager.getDefaultSharedPreferences(this.appContext).getString(MESSAGE_VERSION, "0.0.0").trim();
        try {
            str2 = str.trim();
        } catch (Exception e) {
            str2 = trim;
        }
        if (!VersionUtils.isNewerVersion(trim, str2)) {
            PreferenceManager.getDefaultSharedPreferences(this.appContext).edit().putBoolean(MESSAGE_LAST_DOWNLOAD_SUCCESS, true).commit();
        }
        return VersionUtils.isNewerVersion(trim, str2);
    }

    public String obtainMessage(String str, String str2) {
        int i = Locale.getDefault().getLanguage().equals("zh") ? 1 : 0;
        if (!this.serverMessageList.containsKey(str) || !this.serverMessageList.get(str).containsKey(str2) || !((HashMap) this.serverMessageList.get(str).get(str2)).containsKey(Integer.valueOf(i))) {
            Log.e(Constants.LOG_TAG_DEV, "code: " + str2 + "     null");
            return null;
        }
        Log.e(Constants.LOG_TAG_DEV, "code: " + str2 + "     " + ((String) ((HashMap) this.serverMessageList.get(str).get(str2)).get(Integer.valueOf(i))));
        return (String) ((HashMap) this.serverMessageList.get(str).get(str2)).get(Integer.valueOf(i));
    }

    public void printToLog(int i) {
        Log.println(i, "PCCW_MOBILE_SIP", "serverMessageList.size() = " + this.serverMessageList.size());
        for (Map.Entry next : this.serverMessageList.entrySet()) {
            Log.println(i, "PCCW_MOBILE_SIP", "\ttype = " + ((String) next.getKey()) + ", size() = " + ((HashMap) next.getValue()).size());
            for (Map.Entry entry : ((HashMap) next.getValue()).entrySet()) {
                Log.println(i, "PCCW_MOBILE_SIP", "\t\tresultcode = " + ((String) entry.getKey()) + ", size() = " + ((HashMap) entry.getValue()).size());
                for (Map.Entry entry2 : ((HashMap) entry.getValue()).entrySet()) {
                    Log.println(i, "PCCW_MOBILE_SIP", "\t\t\tlanguage = " + (((Integer) entry2.getKey()).intValue() == 0 ? "EN" : "CH") + ": " + ((String) entry2.getValue()));
                }
            }
        }
    }
}
