package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.response.GetDnByIMSIResponse;
import com.pccw.mobile.server.xml.GetDnByIMSIXmlHandler;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;

public class GetDnByIMSIApi extends ApiServerConnection {
    private Context context;
    private String encryptedImsi;
    private GetDnByIMSIResponse response = new GetDnByIMSIResponse();

    public GetDnByIMSIApi(ApiResponseListener apiResponseListener, Context context2, String str) {
        super(new GetDnByIMSIXmlHandler());
        this.context = context2;
        this.encryptedImsi = str;
        this.apiResponseListener = apiResponseListener;
    }

    public String postToServer() {
        boolean z = true;
        String str = null;
        int i = 0;
        while (i < 2 && z && MobileSipService.getInstance().isNetworkAvailable(this.context)) {
            try {
                str = HttpUtils.post(Constants.GET_MSISDN_BY_IMSI_URL, "imsi", this.encryptedImsi);
                z = false;
            } catch (Exception e) {
                i++;
            }
        }
        return str;
    }
}
