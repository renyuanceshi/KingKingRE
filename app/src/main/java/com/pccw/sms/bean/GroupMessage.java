package com.pccw.sms.bean;

public class GroupMessage {
    private String content;
    private String groupId;
    private String msgId;
    private String receiver;
    private String sender;
    private String subject;
    private String time;

    public GroupMessage(String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        this.msgId = str;
        this.groupId = str2;
        this.sender = str3;
        this.receiver = str4;
        this.content = str5;
        this.time = str6;
        this.subject = str7;
    }

    public String getContent() {
        return this.content;
    }

    public String getGroupId() {
        return this.groupId;
    }

    public String getMsgId() {
        return this.msgId;
    }

    public String getReceiver() {
        return this.receiver;
    }

    public String getSender() {
        return this.sender;
    }

    public String getSubject() {
        return this.subject;
    }

    public String getTime() {
        return this.time;
    }

    public void setContent(String str) {
        this.content = str;
    }

    public void setGroupId(String str) {
        this.groupId = str;
    }

    public void setMsgId(String str) {
        this.msgId = str;
    }

    public void setReceiver(String str) {
        this.receiver = str;
    }

    public void setSender(String str) {
        this.sender = str;
    }

    public void setSubject(String str) {
        this.subject = str;
    }

    public void setTime(String str) {
        this.time = str;
    }
}
