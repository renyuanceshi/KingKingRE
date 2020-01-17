package com.pccw.database.entity;

public class CallLogTemp {
    private String callDate;
    private String callType;
    private String chatNumber;
    private String contactNumber;
    private String duration;

    public CallLogTemp(String str, String str2, String str3, String str4, String str5) {
        this.chatNumber = str;
        this.callType = str2;
        this.callDate = str3;
        this.duration = str4;
        this.contactNumber = str5;
    }

    public String getCallDate() {
        return this.callDate;
    }

    public String getCallType() {
        return this.callType;
    }

    public String getChatNumber() {
        return this.chatNumber;
    }

    public String getContactNumber() {
        return this.contactNumber;
    }

    public String getDuration() {
        return this.duration;
    }

    public void setCallDate(String str) {
        this.callDate = str;
    }

    public void setCallType(String str) {
        this.callType = str;
    }

    public void setChatNumber(String str) {
        this.chatNumber = str;
    }

    public void setContactNumber(String str) {
        this.contactNumber = str;
    }

    public void setDuration(String str) {
        this.duration = str;
    }
}
