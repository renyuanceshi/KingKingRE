package com.pccw.sms.service;

import android.content.Context;
import android.util.Log;
import com.pccw.database.dao.ChatListDAOImpl;
import com.pccw.database.dao.GroupInfoDAOImpl;
import com.pccw.database.dao.GroupMemberDAOImpl;
import com.pccw.database.dao.MessageStoreDAOImpl;
import com.pccw.database.entity.GroupInfo;
import java.util.ArrayList;

public class ClearGroupService {
    private String LOG_TAG = "ClearGroupService";
    protected ChatListDAOImpl chatListImpl;
    protected Context context;
    protected GroupInfoDAOImpl groupInfoImpl;
    protected GroupMemberDAOImpl groupMemberDAOImpl;
    protected MessageStoreDAOImpl messageStoreDAOImpl;

    public ClearGroupService(Context context2) {
        this.context = context2;
        this.groupInfoImpl = new GroupInfoDAOImpl(context2);
        this.chatListImpl = new ChatListDAOImpl(context2);
        this.messageStoreDAOImpl = new MessageStoreDAOImpl(context2);
        this.groupMemberDAOImpl = new GroupMemberDAOImpl(context2);
    }

    public void clearGroupInfo(String str) {
        String num = Integer.toString(this.chatListImpl.findByChatContact(str).getChatId());
        Log.v(this.LOG_TAG, "before groupID:" + str + " memberlist size: " + this.groupMemberDAOImpl.getGroupMemberByGroupId(str).size());
        this.groupMemberDAOImpl.removeByGroupId(str);
        this.groupMemberDAOImpl.getGroupMemberByGroupId(str);
        Log.v(this.LOG_TAG, "removing messagestore record by chatID : " + num);
        this.messageStoreDAOImpl.removeMessageByChatID(num);
        Log.v(this.LOG_TAG, "removing groupinfo record by groupId : " + str);
        this.groupInfoImpl.removeByGroupId(str);
        this.chatListImpl.removeChatRecord(num);
    }

    public GroupInfo getGroupInfo(String str) {
        return this.groupInfoImpl.find(str);
    }

    public ArrayList<GroupInfo> getGroupInfo() {
        return this.groupInfoImpl.list();
    }

    public void removeGroupInfoByGroupId(String str) {
        this.groupInfoImpl.removeByGroupId(str);
    }
}
