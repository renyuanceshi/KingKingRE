package com.pccw.database.entity;

public class GroupMember {
    private String groupId;
    private int memberId;
    private String memberUserName;
    private String nickName;
    private String profileImagePath;

    public GroupMember(String str, String str2) {
        setGroupId(str);
        setMemberUserName(str2);
    }

    public GroupMember(String str, String str2, String str3, String str4) {
        setGroupId(str);
        setMemberUserName(str2);
        setNickName(str3);
        setProfileImagePath(str4);
    }

    public String getGroupId() {
        return this.groupId;
    }

    public int getMemberId() {
        return this.memberId;
    }

    public String getMemberUserName() {
        return this.memberUserName;
    }

    public String getNickName() {
        return this.nickName;
    }

    public String getProfileImagePath() {
        return this.profileImagePath;
    }

    public void setGroupId(String str) {
        this.groupId = str;
    }

    public void setMemberId(int i) {
        this.memberId = i;
    }

    public void setMemberUserName(String str) {
        this.memberUserName = str;
    }

    public void setNickName(String str) {
        this.nickName = str;
    }

    public void setProfileImagePath(String str) {
        this.profileImagePath = str;
    }
}
