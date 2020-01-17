package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.xml.CheckSMSDeliveryStatusXmlHandler;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.sms.util.SMSFormatUtil;
import java.util.List;

public class CheckSMSDeliveryStatusApi extends ApiServerConnection {
    private Context context;
    private List<String> serverMessageId;

    public CheckSMSDeliveryStatusApi(ApiResponseListener apiResponseListener, Context context2, List<String> list) {
        super(new CheckSMSDeliveryStatusXmlHandler());
        this.context = context2;
        this.apiResponseListener = apiResponseListener;
        this.serverMessageId = list;
    }

    private String getSender() {
        return ClientStateManager.getPhoneWithHKCountryCode(this.context);
    }

    public String postToServer() {
        String str = null;
        String sender = getSender();
        int i = 0;
        while (i < 2 && MobileSipService.getInstance().isNetworkAvailable(this.context)) {
            try {
                str = HttpUtils.post(Constants.CHECK_SMS_DELIVERY_STATUS_URL, "msgid", SMSFormatUtil.convertListToSortedSplittingString(this.serverMessageId), "sender", sender, "operator", ClientStateManager.isCSL(this.context) ? "CSL" : ClientStateManager.isHKT(this.context) ? "HKT" : "UNKNOWN").trim();
                break;
            } catch (Exception e) {
                int i2 = i + 1;
                try {
                    Thread.sleep(500);
                    i = i2;
                } catch (Exception e2) {
                    i = i2;
                }
            }
        }
        return str;
    }
}
