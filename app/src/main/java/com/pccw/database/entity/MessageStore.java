package com.pccw.database.entity;

import java.util.Date;

public class MessageStore {
    private int chatid;
    private String isRead;
    private String localfilepath;
    private int messageId;
    private String messagetype;
    private String recipient;
    private String sender;
    private String sentStatus;
    private Date sentTime;
    private String serverMessageId;
    private String serveruripath;
    private String textMessage;

    public MessageStore(String str, String str2, String str3, Date date, String str4, String str5, String str6, String str7, String str8, int i) {
        this.sender = str;
        this.recipient = str2;
        this.textMessage = str3;
        this.sentTime = date;
        this.sentStatus = str4;
        this.isRead = str5;
        this.localfilepath = str6;
        this.serveruripath = str7;
        this.messagetype = str8;
        this.chatid = i;
    }

    public int getChatid() {
        return this.chatid;
    }

    public String getIsRead() {
        return this.isRead;
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

    public String getSender() {
        return this.sender;
    }

    public String getSentStatus() {
        return this.sentStatus;
    }

    public Date getSentTime() {
        return this.sentTime;
    }

    public String getServerMessageId() {
        return this.serverMessageId;
    }

    public String getServeruripath() {
        return this.serveruripath;
    }

    public String getTextMessage() {
        return this.textMessage;
    }

    public void setChatid(int i) {
        this.chatid = i;
    }

    public void setIsRead(String str) {
        this.isRead = str;
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

    public void setSender(String str) {
        this.sender = str;
    }

    public void setSentStatus(String str) {
        this.sentStatus = str;
    }

    public void setSentTime(Date date) {
        this.sentTime = date;
    }

    public void setServerMessageId(String str) {
        this.serverMessageId = str;
    }

    public void setServeruripath(String str) {
        this.serveruripath = str;
    }

    public void setTextMessage(String str) {
        this.textMessage = str;
    }
}
