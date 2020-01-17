package com.pccw.sms.bean;

import java.util.Date;
import org.apache.commons.lang3.StringUtils;

public class MessageItem {
    private long chatId;
    private String content;
    private String filePath;
    private String isRead;
    private Date lastMsgTime;
    private int msgId;
    private String msgType;
    private int msg_direction;
    private String sender;
    private String sentStatus;

    public MessageItem(long j, String str, String str2, String str3, int i, Date date, String str4, String str5, String str6) {
        this.chatId = j;
        this.sender = str2;
        this.content = str3;
        this.msg_direction = i;
        this.filePath = str;
        this.lastMsgTime = date;
        this.msgType = str4;
        this.sentStatus = str5;
        this.isRead = str6;
    }

    public long getChatId() {
        return this.chatId;
    }

    public String getContent() {
        return this.content;
    }

    public int getDirection() {
        return this.msg_direction;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public String getIsRead() {
        return this.isRead;
    }

    public Date getLastMsgTime() {
        return this.lastMsgTime;
    }

    public int getMsgId() {
        return this.msgId;
    }

    public String getMsgType() {
        return this.msgType;
    }

    public String getSender() {
        return this.sender;
    }

    public String getSentStatus() {
        return this.sentStatus;
    }

    public void setChatId(long j) {
        this.chatId = j;
    }

    public void setDesc(String str) {
        this.content = str;
    }

    public void setFilePath(String str) {
        this.filePath = str;
    }

    public void setIsRead(String str) {
        this.isRead = str;
    }

    public void setLastMsgTime(Date date) {
        this.lastMsgTime = date;
    }

    public void setMsgId(int i) {
        this.msgId = i;
    }

    public void setMsgType(String str) {
        this.msgType = str;
    }

    public void setSender(String str) {
        this.sender = str;
    }

    public void setSentStatus(String str) {
        this.sentStatus = str;
    }

    public String toString() {
        return this.sender + StringUtils.LF + this.content;
    }
}
