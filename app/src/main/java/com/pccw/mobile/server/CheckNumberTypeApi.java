package com.pccw.mobile.server;

import android.content.Context;
import android.util.Log;
import com.pccw.mobile.server.api.ApiResponseListener;
import com.pccw.mobile.server.api.ApiServerConnection;
import com.pccw.mobile.server.xml.CheckNumberTypeXmlHandler;
import com.pccw.mobile.sip.Constants;
import com.pccw.mobile.sip.service.MobileSipService;
import com.pccw.mobile.sip.util.HttpUtils;

public class CheckNumberTypeApi extends ApiServerConnection {
    public static final String TAG = CheckNumberTypeApi.class.getSimpleName();
    private Context context;
    private String encryptedImsi;
    private String msisdn;

    public CheckNumberTypeApi(ApiResponseListener apiResponseListener, Context context2, String str, String str2) {
        super(new CheckNumberTypeXmlHandler());
        this.context = context2;
        this.encryptedImsi = str;
        this.msisdn = str2;
        this.apiResponseListener = apiResponseListener;
    }

    public String postToServer() {
        boolean z;
        String str = null;
        if (MobileSipService.getInstance().isNetworkAvailable(this.context)) {
            boolean z2 = true;
            int i = 0;
            str = null;
            while (i < 2 && z2) {
                Log.d(TAG, "postToServer: ");
                try {
                    if (this.msisdn.length() == 0 || this.msisdn == null) {
                        str = HttpUtils.post(Constants.GET_NUMBER_TYPE_URL, "imsi", this.encryptedImsi, "encrypted", "1");
                    } else {
                        String[] strArr = new String[8];
                        strArr[0] = "000";
                        strArr[1] = "001";
                        strArr[2] = "010";
                        strArr[3] = "011";
                        strArr[4] = "100";
                        strArr[5] = "101";
                        strArr[6] = "110";
                        strArr[7] = "111";
                        int length = strArr.length;
                        int i2 = 0;
                        while (true) {
                            if (i2 >= length) {
                                z = false;
                                break;
                            } else if (strArr[i2].equals(this.msisdn)) {
                                z = true;
                                break;
                            } else {
                                i2++;
                            }
                        }
                        if (z) {
                            str = HttpUtils.post("http://202.4.201.24/voip/test/2Nprepaid/2Nprepaid" + this.msisdn + ".xml", new Object[0]);
                        } else {
                            str = HttpUtils.post(Constants.GET_NUMBER_TYPE_URL, "msisdn", this.msisdn);
                        }
                    }
                    z2 = false;
                } catch (Exception e) {
                    i++;
                }
            }
        }
        return str;
    }
}
