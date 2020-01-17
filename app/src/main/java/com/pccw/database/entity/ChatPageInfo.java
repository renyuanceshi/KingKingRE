package com.pccw.database.entity;

import android.graphics.Bitmap;

public class ChatPageInfo {
    int chatId;
    String chatType;
    String owner;
    Bitmap photo;
    String recipient;
    String title;

    public ChatPageInfo(String str, String str2, String str3, String str4, int i, Bitmap bitmap) {
        this.owner = str;
        this.recipient = str2;
        this.chatType = str3;
        this.title = str4;
        this.chatId = i;
        this.photo = bitmap;
    }

    public int getChatId() {
        return this.chatId;
    }

    public String getChatType() {
        return this.chatType;
    }

    public String getOwner() {
        return this.owner;
    }

    public Bitmap getPhoto() {
        return this.photo;
    }

    public String getRecipient() {
        return this.recipient;
    }

    public String getTitle() {
        return this.title;
    }

    public boolean hasPhoto() {
        return this.photo != null;
    }

    public boolean isAvaiableOnBD() {
        return this.chatId != -1;
    }

    public boolean isGroupChat() {
        return "group".equals(this.chatType);
    }

    public boolean isIndividualChat() {
        return "individual".equals(this.chatType);
    }

    public void setChatId(int i) {
        this.chatId = i;
    }

    public void setChatType(String str) {
        this.chatType = str;
    }

    public void setOwner(String str) {
        this.owner = str;
    }

    public void setPhoto(Bitmap bitmap) {
        this.photo = bitmap;
    }

    public void setRecipient(String str) {
        this.recipient = str;
    }

    public void setTitle(String str) {
        this.title = str;
    }
}
