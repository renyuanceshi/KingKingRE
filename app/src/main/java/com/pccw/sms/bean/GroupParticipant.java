package com.pccw.sms.bean;

public class GroupParticipant {
    private String groupId;
    private String participant;
    private String role;

    public GroupParticipant(String str, String str2, String str3) {
        this.groupId = str;
        this.participant = str2;
        this.role = str3;
    }

    public String getGroupId() {
        return this.groupId;
    }

    public String getParticipant() {
        return this.participant;
    }

    public String getRole() {
        return this.role;
    }

    public void setGroupId(String str) {
        this.groupId = str;
    }

    public void setParticipant(String str) {
        this.participant = str;
    }

    public void setRole(String str) {
        this.role = str;
    }
}
