package com.pccw.mobile.server;

import android.content.Context;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.xml.CheckLocationXmlHandler;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;

public class CheckLocationApi extends ApiServerConnection {
    private Context context;

    public CheckLocationApi(ApiResponseListener apiResponseListener, Context context2) {
        super(new CheckLocationXmlHandler());
        this.context = context2;
        this.apiResponseListener = apiResponseListener;
    }

    public String postToServer() {
        String str = null;
        boolean z = true;
        int i = 0;
        while (z && i < 2) {
            try {
                String str2 = this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 0).versionName;
                if (MobileSipService.getInstance().isNetworkAvailable(this.context)) {
                    str = HttpUtils.post(Constants.CHECK_LOCATION_URL, "version", str2, "os", "Android");
                    z = false;
                } else {
                    z = false;
                }
            } catch (Exception e) {
                i++;
                z = true;
            }
        }
        if (z) {
        }
        return str;
    }
}
