package com.pccw.database.entity;

import java.util.Date;

public class ChatListUserInfo {
    private String chatContact;
    private int chatId;
    private int messageId;
    private String nickName;
    private String photo;
    private Date sentTime;
    private String status;
    private String textMessage;
    private String type;

    public String getChatContact() {
        return this.chatContact;
    }

    public int getChatId() {
        return this.chatId;
    }

    public int getMessageId() {
        return this.messageId;
    }

    public String getNickName() {
        return this.nickName;
    }

    public String getPhoto() {
        return this.photo;
    }

    public Date getSentTime() {
        return this.sentTime;
    }

    public String getStatus() {
        return this.status;
    }

    public String getTextMessage() {
        return this.textMessage;
    }

    public String getType() {
        return this.type;
    }

    public void setChatContact(String str) {
        this.chatContact = str;
    }

    public void setChatId(int i) {
        this.chatId = i;
    }

    public void setMessageId(int i) {
        this.messageId = i;
    }

    public void setNickName(String str) {
        this.nickName = str;
    }

    public void setPhoto(String str) {
        this.photo = str;
    }

    public void setSentTime(Date date) {
        this.sentTime = date;
    }

    public void setStatus(String str) {
        this.status = str;
    }

    public void setTextMessage(String str) {
        this.textMessage = str;
    }

    public void setType(String str) {
        this.type = str;
    }
}
