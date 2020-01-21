package com.pccw.mobile.server;

import android.content.Context;
import android.util.Log;
import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.api.SyncApiServerConnection;
import com.pccw.mobile.server.response.SendSMSResponse;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.ServerMessageController;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.CryptoServices;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.mobile.sip.util.M5DUtils;
import com.pccw.sms.util.SMSFormatUtil;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.apache.commons.lang3.StringUtils

public class SendSMSSyncApi extends SyncApiServerConnection {
    private Context context;
    private String message;
    private ArrayList<String> recipientlist;
    private SendSMSResponse response = new SendSMSResponse();

    public SendSMSSyncApi(Context context2, String str, String str2) {
        this.context = context2;
        this.recipientlist = getArrayListForOneRecipient(str);
        this.message = str2;
    }

    public SendSMSSyncApi(Context context2, ArrayList<String> arrayList, String str) {
        this.context = context2;
        this.recipientlist = arrayList;
        this.message = str;
    }

    private String getAESResult(String str, String str2) {
        try {
            return CryptoServices.aesEncryptedByMasterKey(M5DUtils.ecodeByMD5(str2 + "KingKing"), str + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date(System.currentTimeMillis())));
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private String getSender() {
        return ClientStateManager.getPhoneWithHKCountryCode(this.context);
    }

    public void XmlElement(String str, StringBuilder sb) {
        if (ServerMessageController.ATTR_RESPONSE_RESULTCODE.equals(str)) {
            this.response.resultCode = sb.toString().trim();
        } else if ("message".equals(str)) {
            this.response.message = sb.toString().trim();
        } else if ("msgid".equals(str)) {
            this.response.serverMessageId = sb.toString().trim();
        }
    }

    public ArrayList<String> getArrayListForOneRecipient(String str) {
        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add(str);
        return arrayList;
    }

    public ApiResponse postToServer() {
        int i;
        String str;
        String sender = getSender();
        String convertListToSortedSplittingString = SMSFormatUtil.convertListToSortedSplittingString(this.recipientlist);
        String aESResult = getAESResult(sender, convertListToSortedSplittingString);
        boolean z = true;
        int i2 = 0;
        while (z && i2 < 2) {
            try {
                if (MobileSipService.getInstance().isNetworkAvailable(this.context)) {
                    Log.i("KKSMS", "sender=" + sender + " rec=" + convertListToSortedSplittingString + " msg=" + this.message + " r=" + aESResult);
                    str = HttpUtils.post(Constants.SEND_SMS_URL, "sender", sender, "recipientlist", convertListToSortedSplittingString, "msg", this.message, "r", aESResult);
                    i = i2;
                    z = false;
                } else {
                    i = i2;
                    z = false;
                    str = null;
                }
            } catch (Exception e) {
                i = i2 + 1;
                z = true;
                str = null;
            }
            if (!z) {
                if (StringUtils.isNotBlank(str)) {
                    try {
                        apiResponseXmlHandler(str);
                        if (this.response != null && this.response.resultCode.equals("0")) {
                            return this.response;
                        }
                    } catch (Exception e2) {
                        e2.printStackTrace();
                        z = true;
                        i2 = i + 1;
                    }
                } else {
                    z = true;
                    i2 = i + 1;
                }
            }
            i2 = i;
        }
        if (z) {
        }
        return null;
    }
}
