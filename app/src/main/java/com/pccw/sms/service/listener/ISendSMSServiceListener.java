package com.pccw.sms.service.listener;

public interface ISendSMSServiceListener {
    void onBeforeSend(int i);

    void onSendFail();

    void onSendSuccess(int i);

    void onSending(int i);
}
