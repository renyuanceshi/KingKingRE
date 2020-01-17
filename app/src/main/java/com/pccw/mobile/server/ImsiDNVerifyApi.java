package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.xml.ImsiDNVerifyXmlHandler;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.mobile.sip.util.NetworkUtils;

public class ImsiDNVerifyApi extends ApiServerConnection {
    private Context context;
    private String encImsi;
    private String encMsisdn;

    public ImsiDNVerifyApi(ApiResponseListener apiResponseListener, Context context2, String str, String str2) {
        super(new ImsiDNVerifyXmlHandler());
        this.context = context2;
        this.encImsi = str;
        this.encMsisdn = str2;
        this.apiResponseListener = apiResponseListener;
    }

    public String postToServer() {
        boolean z = true;
        String str = null;
        int i = 0;
        while (i < 2 && z && NetworkUtils.isWifiAvailable(this.context)) {
            try {
                str = HttpUtils.post(Constants.IM_IMSIDN_VERIFY_URL, "imsi", this.encImsi, "d", this.encMsisdn, "encrypted", "1");
                new ImsiDNVerifyXmlHandler();
                z = false;
            } catch (Exception e) {
                i++;
            }
        }
        return str;
    }
}
