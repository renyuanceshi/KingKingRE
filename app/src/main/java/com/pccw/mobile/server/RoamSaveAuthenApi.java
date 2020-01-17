package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.xml.RoamSaveAuthenXmlHandler;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.mobile.sip.util.NetworkUtils;

public class RoamSaveAuthenApi extends ApiServerConnection {
    private Context context;
    private String msisdn;

    public RoamSaveAuthenApi(ApiResponseListener apiResponseListener, Context context2, String str) {
        super(new RoamSaveAuthenXmlHandler());
        this.context = context2;
        this.msisdn = str;
        this.apiResponseListener = apiResponseListener;
    }

    public String postToServer() {
        boolean z = true;
        int i = 0;
        String str = null;
        while (i < 2 && z) {
            if (!NetworkUtils.isWifiAvailable(this.context)) {
                return null;
            }
            try {
                str = HttpUtils.post(Constants.ROAM_SAVE_AUTHEN_URL, "msisdn", this.msisdn, "deviceID", ClientStateManager.getEncryptedDeviceId(this.context), "xmlResponse", "1").trim();
                z = false;
            } catch (Exception e) {
                i++;
                z = true;
            }
            try {
                Thread.sleep(500);
            } catch (Exception e2) {
            }
        }
        return str;
    }
}
