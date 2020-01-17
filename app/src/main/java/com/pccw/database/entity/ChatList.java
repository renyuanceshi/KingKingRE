package com.pccw.database.entity;

public class ChatList {
    private String chatContact;
    private int chatId;
    private Integer messageId;

    public ChatList(String str, Integer num) {
        this.chatContact = str;
        this.messageId = num;
    }

    public String getChatContact() {
        return this.chatContact;
    }

    public int getChatId() {
        return this.chatId;
    }

    public Integer getMessageId() {
        return this.messageId;
    }

    public void setChatContact(String str) {
        this.chatContact = str;
    }

    public void setChatId(int i) {
        this.chatId = i;
    }

    public void setMessageId(Integer num) {
        this.messageId = num;
    }
}
