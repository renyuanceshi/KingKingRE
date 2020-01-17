package com.pccw.sms.service.listener;

public interface ICheckSMSDeliveryStatusServiceListener {
    void onCheckStatusFail();

    void onStatusUpdated();
}
