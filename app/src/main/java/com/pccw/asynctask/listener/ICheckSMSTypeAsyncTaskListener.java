package com.pccw.asynctask.listener;

import com.pccw.mobile.sip.SMSType;
import java.util.List;

public interface ICheckSMSTypeAsyncTaskListener {
    void onCheckFail();

    void onCheckSuccess(List<SMSType> list);
}
