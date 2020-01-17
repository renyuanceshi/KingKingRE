package com.pccw.database.entity;

import java.util.Date;

public class GroupInfo {
    private Date createdate;
    private String groupId;
    private String groupName;

    public GroupInfo(String str, String str2, Date date) {
        this.groupId = str;
        this.groupName = str2;
        this.createdate = date;
    }

    public Date getCreatedate() {
        return this.createdate;
    }

    public String getGroupId() {
        return this.groupId;
    }

    public String getGroupName() {
        return this.groupName;
    }

    public void setCreatedate(Date date) {
        this.createdate = date;
    }

    public void setGroupId(String str) {
        this.groupId = str;
    }

    public void setGroupName(String str) {
        this.groupName = str;
    }
}
