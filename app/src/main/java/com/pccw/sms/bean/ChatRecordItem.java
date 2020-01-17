package com.pccw.sms.bean;

import java.io.File;
import java.util.Date;

public class ChatRecordItem {
    private int chatId;
    private String imagePath = null;
    private boolean isUnread = false;
    private String lastMessage = "";
    private Date lastMessageTime;
    private String name;
    private String nickName;
    private String type;

    public ChatRecordItem(String str, String str2, String str3, Date date, String str4, String str5) {
        this.nickName = str;
        this.name = str2;
        this.lastMessage = str3;
        this.imagePath = str4;
        this.lastMessageTime = date;
        this.type = str5;
    }

    public int getChatId() {
        return this.chatId;
    }

    public String getImagePath() {
        if (this.imagePath != null) {
            File file = new File(this.imagePath);
            if (file.exists()) {
                return file.getAbsolutePath();
            }
        }
        return null;
    }

    public String getLastMessage() {
        return this.lastMessage;
    }

    public Date getLastMessageTime() {
        return this.lastMessageTime;
    }

    public String getName() {
        return this.name;
    }

    public String getNickName() {
        return this.nickName;
    }

    public String getType() {
        return this.type;
    }

    public boolean isUnread() {
        return this.isUnread;
    }

    public void setChatId(int i) {
        this.chatId = i;
    }

    public void setImagePath(String str) {
        this.imagePath = str;
    }

    public void setLastMessage(String str) {
        this.lastMessage = str;
    }

    public void setLastMessageTime(Date date) {
        this.lastMessageTime = date;
    }

    public void setName(String str) {
        this.name = str;
    }

    public void setNickName(String str) {
        this.nickName = str;
    }

    public void setType(String str) {
        this.type = str;
    }

    public void setUnread(boolean z) {
        this.isUnread = z;
    }
}
