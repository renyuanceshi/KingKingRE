package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.xml.ConfirmRegistrationXmlHandler;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;

public class ConfirmRegistrationApi extends ApiServerConnection {
    private Context context;
    private String msisdn;
    private String password;

    public ConfirmRegistrationApi(ApiResponseListener apiResponseListener, Context context2, String str, String str2) {
        super(new ConfirmRegistrationXmlHandler());
        this.context = context2;
        this.msisdn = str;
        this.password = str2;
        this.apiResponseListener = apiResponseListener;
    }

    public String postToServer() {
        String str = null;
        int i = 0;
        while (i < 2 && MobileSipService.getInstance().isNetworkAvailable(this.context)) {
            try {
                str = HttpUtils.post(Constants.CONFIRM_REGISTRATION_URL, "msisdn", this.msisdn, "password", this.password, "deviceID", ClientStateManager.getEncryptedDeviceId(this.context)).trim();
                break;
            } catch (Exception e) {
                i++;
                try {
                    Thread.sleep(500);
                } catch (Exception e2) {
                }
            }
        }
        return str;
    }
}
