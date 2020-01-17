package com.pccw.asynctask;

import android.content.Context;
import android.os.AsyncTask;
import com.pccw.asynctask.listener.ICheckSMSTypeAsyncTaskListener;
import com.pccw.exception.NoNetworkException;
import com.pccw.mobile.sip.SMSType;
import com.pccw.mobile.sip.service.SMSTypeService;
import com.pccw.mobile.sip.util.NetworkUtils;
import java.util.ArrayList;
import java.util.List;

public class CheckSMSTypeAsyncTask extends AsyncTask<String, Void, List<SMSType>> {
    ICheckSMSTypeAsyncTaskListener checkSMSTypeAsyncTaskListener;
    Context ctx;
    String sender;

    public CheckSMSTypeAsyncTask(Context context, ICheckSMSTypeAsyncTaskListener iCheckSMSTypeAsyncTaskListener) {
        this.ctx = context;
        this.checkSMSTypeAsyncTaskListener = iCheckSMSTypeAsyncTaskListener;
    }

    public void checkSMSType(String str) throws NoNetworkException {
        if (!NetworkUtils.isWifiAvailable(this.ctx)) {
            throw new NoNetworkException("Error:No Network");
        }
        execute(new String[]{str});
    }

    /* access modifiers changed from: protected */
    public List<SMSType> doInBackground(String... strArr) {
        SMSTypeService sMSTypeService = new SMSTypeService(this.ctx);
        new ArrayList();
        List<SMSType> sMSTypeList = sMSTypeService.getSMSTypeList(strArr[0]);
        if (sMSTypeList.isEmpty()) {
            return null;
        }
        return sMSTypeList;
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(List<SMSType> list) {
        if (list != null) {
            this.checkSMSTypeAsyncTaskListener.onCheckSuccess(list);
        } else {
            this.checkSMSTypeAsyncTaskListener.onCheckFail();
        }
    }
}
