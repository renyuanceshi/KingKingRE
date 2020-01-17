package com.pccw.sms.service;

import android.content.Context;
import com.pccw.database.dao.GroupInfoDAOImpl;
import com.pccw.database.entity.GroupInfo;
import java.util.ArrayList;
import java.util.Date;

public class GroupInfoService {
    protected Context context;
    protected GroupInfoDAOImpl groupInfoImpl;

    public GroupInfoService(Context context2) {
        this.context = context2;
        this.groupInfoImpl = new GroupInfoDAOImpl(context2);
    }

    public void addGroupInfo(String str, String str2, Date date) {
        this.groupInfoImpl.add(new GroupInfo(str, str2, date));
    }

    public GroupInfo getGroupInfo(String str) {
        return this.groupInfoImpl.find(str);
    }

    public ArrayList<GroupInfo> getGroupInfo() {
        return this.groupInfoImpl.list();
    }

    public void removeByGroupId(String str) {
        this.groupInfoImpl.removeByGroupId(str);
    }

    public void updateGroupInfo(String str, String str2, Date date) {
        GroupInfo groupInfo = new GroupInfo(str, str2, date);
        if (this.groupInfoImpl.find(str) != null) {
            this.groupInfoImpl.updateGroupNameAndDate(str, str2, date);
        } else {
            this.groupInfoImpl.add(groupInfo);
        }
    }

    public void updateGroupNameAndDate(String str, String str2, Date date) {
        this.groupInfoImpl.updateGroupNameAndDate(str, str2, date);
    }
}
