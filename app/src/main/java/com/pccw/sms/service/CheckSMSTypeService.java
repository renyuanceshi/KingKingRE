package com.pccw.sms.service;

import android.content.Context;
import com.pccw.asynctask.CheckSMSTypeAsyncTask;
import com.pccw.asynctask.listener.ICheckSMSTypeAsyncTaskListener;
import com.pccw.exception.NoNetworkException;
import com.pccw.mobile.sip.SMSType;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.sms.service.listener.ICheckSMSTypeServiceListener;
import java.util.ArrayList;
import java.util.List;

public class CheckSMSTypeService {
    int chatId;
    ICheckSMSTypeServiceListener checkSMSServiceListener;
    ICheckSMSTypeAsyncTaskListener checkSMSTypeAsyncTaskListener = new ICheckSMSTypeAsyncTaskListener() {
        public void onCheckFail() {
            CheckSMSTypeService.this.checkSMSServiceListener.onCheckFail();
        }

        public void onCheckSuccess(List<SMSType> list) {
            CheckSMSTypeService.this.checkSMSServiceListener.onCheckSuccess(list);
        }
    };
    Context ctx;
    ArrayList<String> recipientsList;

    public CheckSMSTypeService(ICheckSMSTypeServiceListener iCheckSMSTypeServiceListener, Context context) {
        this.checkSMSServiceListener = iCheckSMSTypeServiceListener;
        this.ctx = context;
    }

    public void checkSMSType(String str) throws NoNetworkException {
        if (!NetworkUtils.isWifiAvailable(this.ctx)) {
            throw new NoNetworkException("Error:No Network");
        }
        new CheckSMSTypeAsyncTask(this.ctx, this.checkSMSTypeAsyncTaskListener).checkSMSType(str);
    }
}
