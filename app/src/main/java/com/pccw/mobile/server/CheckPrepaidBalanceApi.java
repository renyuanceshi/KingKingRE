package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.xml.CheckPrepaidBalanceXmlHandler;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;
import com.pccw.mobile.sip.util.NetworkException;
import org.apache.commons.lang.StringUtils;

public class CheckPrepaidBalanceApi extends ApiServerConnection {
    private Context context;

    public CheckPrepaidBalanceApi(ApiResponseListener apiResponseListener, Context context2) {
        super(new CheckPrepaidBalanceXmlHandler());
        this.context = context2;
        this.apiResponseListener = apiResponseListener;
    }

    public String postToServer() {
        String registeredNumber;
        String registeredPrepaidNumberPassword;
        if (!MobileSipService.getInstance().isNetworkAvailable(this.context) || (registeredNumber = ClientStateManager.getRegisteredNumber(this.context)) == null || registeredNumber.length() == 0 || (registeredPrepaidNumberPassword = ClientStateManager.getRegisteredPrepaidNumberPassword(this.context)) == null || registeredPrepaidNumberPassword.length() == 0) {
            return null;
        }
        boolean z = true;
        int i = 0;
        while (z && i < 2) {
            try {
                String post = HttpUtils.post(Constants.CHECK_PREPAID_BALANCE_URL, "msisdn", registeredNumber, "password", registeredPrepaidNumberPassword);
                if (StringUtils.isNotBlank(post)) {
                    z = false;
                } else {
                    i++;
                }
                if (!z && StringUtils.isNotBlank(post)) {
                    return post;
                }
            } catch (NetworkException | Exception e) {
                return null;
            }
        }
        return null;
    }
}
