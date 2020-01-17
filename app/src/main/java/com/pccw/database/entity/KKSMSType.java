package com.pccw.database.entity;

public class KKSMSType {
    private String msisdn;
    private String smsType;
    private String updateTime;

    public KKSMSType() {
    }

    public KKSMSType(String str, String str2, String str3) {
        this.msisdn = str;
        this.smsType = str2;
        this.updateTime = str3;
    }

    public String getMsisdn() {
        return this.msisdn;
    }

    public String getSmsType() {
        return this.smsType;
    }

    public String getUpdateTime() {
        return this.updateTime;
    }

    public void setMsisdn(String str) {
        this.msisdn = str;
    }

    public void setSmsType(String str) {
        this.smsType = str;
    }

    public void setUpdateTime(String str) {
        this.updateTime = str;
    }
}
