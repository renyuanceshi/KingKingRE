package com.pccw.sms.service.listener;

public interface IGetMsisdnByImsiListener {
    void onCallFail();

    void onCallSuccess(String str);
}
