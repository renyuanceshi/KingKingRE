package com.pccw.mobile.server.entity;

public class SMSDeliveryStatus {
    String messageId;
    String status;

    public String getMessageId() {
        return this.messageId;
    }

    public String getStatus() {
        return this.status;
    }

    public void setMessageId(String str) {
        this.messageId = str;
    }

    public void setStatus(String str) {
        this.status = str;
    }
}
