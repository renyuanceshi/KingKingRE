package com.pccw.database.entity;

public class ResendMessage {
    private int chatid;
    private String localfilepath;
    private int messageId;
    private String messagetype;
    private String recipient;

    public ResendMessage(int i, String str, String str2, String str3, int i2) {
        this.messageId = i;
        this.recipient = str;
        this.localfilepath = str2;
        this.messagetype = str3;
        this.chatid = i2;
    }

    public int getChatid() {
        return this.chatid;
    }

    public String getLocalfilepath() {
        return this.localfilepath;
    }

    public int getMessageId() {
        return this.messageId;
    }

    public String getMessagetype() {
        return this.messagetype;
    }

    public String getRecipient() {
        return this.recipient;
    }

    public void setChatid(int i) {
        this.chatid = i;
    }

    public void setLocalfilepath(String str) {
        this.localfilepath = str;
    }

    public void setMessageId(int i) {
        this.messageId = i;
    }

    public void setMessagetype(String str) {
        this.messagetype = str;
    }

    public void setRecipient(String str) {
        this.recipient = str;
    }
}
