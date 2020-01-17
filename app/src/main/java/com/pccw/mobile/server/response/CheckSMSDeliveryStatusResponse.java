package com.pccw.mobile.server.response;

import com.pccw.mobile.server.api.ApiResponse;
import com.pccw.mobile.server.entity.SMSDeliveryStatus;
import java.util.List;

public class CheckSMSDeliveryStatusResponse extends ApiResponse {
    public static final String DELIVERED = "Delivered";
    public static final String FAILED = "Failed";
    public static final String NOT_FOUND = "NG";
    public static final String PENDING = "Pending";
    public String resultcode = "";
    public List<SMSDeliveryStatus> statusList;

    public String getResultcode() {
        return this.resultcode;
    }

    public List<SMSDeliveryStatus> getStatusList() {
        return this.statusList;
    }

    public void setResultcode(String str) {
        this.resultcode = str;
    }

    public void setStatusList(List<SMSDeliveryStatus> list) {
        this.statusList = list;
    }
}
