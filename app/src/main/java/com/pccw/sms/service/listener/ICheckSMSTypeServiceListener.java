package com.pccw.sms.service.listener;

import com.pccw.mobile.sip.SMSType;
import java.util.List;

public interface ICheckSMSTypeServiceListener {
    void onCheckFail();

    void onCheckSuccess(List<SMSType> list);
}
