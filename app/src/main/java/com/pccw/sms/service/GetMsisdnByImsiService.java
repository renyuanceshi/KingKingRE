package com.pccw.sms.service;

import android.content.Context;
import com.pccw.exception.NoNetworkException;
import com.pccw.mobile.server.GetDnByIMSIApi;
import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.response.GetDnByIMSIResponse;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.sms.service.listener.IGetMsisdnByImsiListener;

public class GetMsisdnByImsiService {
    Context ctx;
    IGetMsisdnByImsiListener getMsisdnByImsilistener;

    public GetMsisdnByImsiService(IGetMsisdnByImsiListener iGetMsisdnByImsiListener, Context context) {
        this.getMsisdnByImsilistener = iGetMsisdnByImsiListener;
        this.ctx = context;
    }

    public void callApiAndStoreDnToPreference(String str) throws NoNetworkException {
        if (!NetworkUtils.isWifiAvailable(this.ctx)) {
            throw new NoNetworkException("Error:No Network");
        }
        new GetDnByIMSIApi(new ApiResponseListener() {
            public void onResponseFailed() {
                GetMsisdnByImsiService.this.getMsisdnByImsilistener.onCallFail();
            }

            public void onResponseSuccess(ApiResponse apiResponse) {
                GetDnByIMSIResponse getDnByIMSIResponse = (GetDnByIMSIResponse) apiResponse;
                ClientStateManager.setRegisteredNumber(GetMsisdnByImsiService.this.ctx, getDnByIMSIResponse.msisdn);
                GetMsisdnByImsiService.this.getMsisdnByImsilistener.onCallSuccess(getDnByIMSIResponse.msisdn);
            }
        }, this.ctx, str).execute(new String[]{""});
    }
}
