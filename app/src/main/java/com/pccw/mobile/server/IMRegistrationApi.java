package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.xml.IMRegistrationXmlHandler;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;

public class IMRegistrationApi extends ApiServerConnection {
    private Context context;
    private String deviceID;
    private String encryptedImsi;
    private String msisdn;
    private String osVersion;
    private String otp;
    private String pnsToken;
    private String simType;

    public IMRegistrationApi(ApiResponseListener apiResponseListener, Context context2, String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        super(new IMRegistrationXmlHandler());
        this.context = context2;
        this.encryptedImsi = str;
        this.msisdn = str2;
        this.otp = str3;
        this.pnsToken = str4;
        this.osVersion = str5;
        this.simType = str6;
        this.deviceID = str7;
        this.apiResponseListener = apiResponseListener;
    }

    public String postToServer() {
        String str;
        String str2 = null;
        boolean z = true;
        int i = 0;
        while (i < 2 && z && MobileSipService.getInstance().isNetworkAvailable(this.context)) {
            try {
                if (this.msisdn == null || this.msisdn.length() == 0) {
                    str = HttpUtils.post(Constants.IM_REGISTRATION_URL, "imsi", this.encryptedImsi, "pnsToken", this.pnsToken, "os", "android", "osVersion", this.osVersion, "simType", this.simType, "deviceID", this.deviceID);
                } else {
                    str = HttpUtils.post(Constants.IM_REGISTRATION_URL, "msisdn", this.msisdn, "otp", this.otp, "pnsToken", this.pnsToken, "os", "android", "osVersion", this.osVersion, "simType", this.simType, "deviceID", this.deviceID);
                }
                z = false;
                str2 = str;
            } catch (Exception e) {
                i++;
            }
        }
        return str2;
    }
}
