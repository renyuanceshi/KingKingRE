package com.pccw.sms.service;

import android.content.Context;
import com.pccw.asynctask.ResendSMSAsyncTask;
import com.pccw.asynctask.SendSMSAsyncTask;
import com.pccw.asynctask.listener.ISendSMSAsyncTaskListener;
import com.pccw.exception.NoNetworkException;
import com.pccw.mobile.sip.util.NetworkUtils;
import com.pccw.sms.service.listener.ISendSMSServiceListener;
import java.util.ArrayList;
import java.util.List;

public class SendSMSService {
    private static SendSMSService _instance;
    int chatId;
    Context ctx;
    List<ISendSMSServiceListener> listenerList = new ArrayList();
    MessageItemService messageItemService;
    ArrayList<String> recipientsList;
    ISendSMSAsyncTaskListener sendSMSAsyncTaskListener = new ISendSMSAsyncTaskListener() {
        public void onBeforeSend(int i) {
            for (ISendSMSServiceListener onBeforeSend : SendSMSService.this.listenerList) {
                onBeforeSend.onBeforeSend(i);
            }
        }

        public void onSendFail() {
            for (ISendSMSServiceListener onSendFail : SendSMSService.this.listenerList) {
                onSendFail.onSendFail();
            }
        }

        public void onSendSuccess(int i) {
            for (ISendSMSServiceListener onSendSuccess : SendSMSService.this.listenerList) {
                onSendSuccess.onSendSuccess(i);
            }
        }

        public void onSending(int i) {
            for (ISendSMSServiceListener onSending : SendSMSService.this.listenerList) {
                onSending.onSending(i);
            }
        }
    };

    private SendSMSService() {
    }

    public static SendSMSService getInstance() {
        if (_instance == null) {
            _instance = new SendSMSService();
        }
        return _instance;
    }

    public void addListener(ISendSMSServiceListener iSendSMSServiceListener) {
        this.listenerList.add(iSendSMSServiceListener);
    }

    public void removeListener(ISendSMSServiceListener iSendSMSServiceListener) {
        if (this.listenerList.indexOf(iSendSMSServiceListener) >= 0) {
            this.listenerList.remove(iSendSMSServiceListener);
        }
    }

    public void resendMessageWithId(int i, int i2, Context context) throws NoNetworkException {
        if (!NetworkUtils.isWifiAvailable(context)) {
            throw new NoNetworkException("Error:No Network");
        }
        new ResendSMSAsyncTask(i2, this.sendSMSAsyncTaskListener, context).resendMessageWithMessageId(i);
    }

    public void sendMessage(String str, int i, Context context) throws NoNetworkException {
        if (!NetworkUtils.isWifiAvailable(context)) {
            throw new NoNetworkException("Error:No Network");
        }
        new SendSMSAsyncTask(i, this.sendSMSAsyncTaskListener, context).sendMessage(str);
    }
}
