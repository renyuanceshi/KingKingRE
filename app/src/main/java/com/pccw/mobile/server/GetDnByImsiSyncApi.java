package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.api.SyncApiServerConnection;
import com.pccw.mobile.server.response.GetDnByIMSIResponse;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.ServerMessageController;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;

public class GetDnByImsiSyncApi extends SyncApiServerConnection {
    private Context context;
    private String encryptedImsi;
    private GetDnByIMSIResponse response = new GetDnByIMSIResponse();

    public GetDnByImsiSyncApi(Context context2, String str) {
        this.context = context2;
        this.encryptedImsi = str;
    }

    public void XmlElement(String str, StringBuilder sb) {
        if (sb != null) {
            if (ServerMessageController.ATTR_RESPONSE_RESULTCODE.equals(str)) {
                this.response.resultcode = sb.toString().trim();
            } else if ("dn".equals(str)) {
                this.response.msisdn = sb.toString().trim();
            } else if ("message".equals(str)) {
                this.response.message = sb.toString().trim();
            }
        }
    }

    public ApiResponse postToServer() {
        boolean z = true;
        int i = 0;
        while (i < 2 && z && MobileSipService.getInstance().isNetworkAvailable(this.context)) {
            try {
                apiResponseXmlHandler(HttpUtils.post(Constants.GET_MSISDN_BY_IMSI_URL, "imsi", this.encryptedImsi));
                try {
                    return this.response;
                } catch (Exception e) {
                    z = false;
                }
            } catch (Exception e2) {
                i++;
            }
        }
        return null;
    }
}
