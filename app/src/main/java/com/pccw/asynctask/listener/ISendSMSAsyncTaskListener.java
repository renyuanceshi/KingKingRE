package com.pccw.asynctask.listener;

public interface ISendSMSAsyncTaskListener {
    void onBeforeSend(int i);

    void onSendFail();

    void onSendSuccess(int i);

    void onSending(int i);
}
