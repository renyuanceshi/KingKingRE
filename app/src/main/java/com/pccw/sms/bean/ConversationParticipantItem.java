package com.pccw.sms.bean;

public class ConversationParticipantItem {
    private String nickName;
    private String profileImagePath;
    private String userId;

    public ConversationParticipantItem(String str, String str2, String str3) {
        this.userId = str;
        this.nickName = str2;
        this.profileImagePath = str3;
    }

    public String getNickName() {
        return this.nickName;
    }

    public String getProfileImagePath() {
        return this.profileImagePath;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setNickName(String str) {
        this.nickName = str;
    }

    public void setProfileImagePath(String str) {
        this.profileImagePath = str;
    }

    public void setUserId(String str) {
        this.userId = str;
    }

    public String toString() {
        return this.userId;
    }
}
