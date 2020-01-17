package com.pccw.database.entity;

public class UserInfo {
    private String nickName;
    private String photo;
    private String userName;

    public UserInfo(String str, String str2, String str3) {
        this.userName = str;
        this.nickName = str2;
        this.photo = str3;
    }

    public String getNickName() {
        return this.nickName;
    }

    public String getPhoto() {
        return this.photo;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setNickName(String str) {
        this.nickName = str;
    }

    public void setPhoto(String str) {
        this.photo = str;
    }

    public void setUserName(String str) {
        this.userName = str;
    }
}
