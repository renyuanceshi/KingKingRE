package com.pccw.sms.service;

import android.content.Context;
import com.pccw.database.dao.GroupMemberDAOImpl;
import com.pccw.database.entity.GroupMember;
import java.util.ArrayList;

public class GroupMemberService {
    protected Context context;
    protected GroupMemberDAOImpl groupMemberDAOImpl;

    public GroupMemberService(Context context2) {
        this.context = context2;
        this.groupMemberDAOImpl = new GroupMemberDAOImpl(context2);
    }

    public void addGroupMember(String str, String str2) {
        this.groupMemberDAOImpl.add(new GroupMember(str, str2));
    }

    public ArrayList<GroupMember> getGroupMemberByGroupId(String str) {
        return this.groupMemberDAOImpl.getGroupMemberByGroupId(str);
    }

    public void removeByGroupId(String str) {
        this.groupMemberDAOImpl.removeByGroupId(str);
    }
}
