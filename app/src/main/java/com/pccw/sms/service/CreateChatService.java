package com.pccw.sms.service;

import android.content.Context;
import com.pccw.database.entity.ChatList;
import com.pccw.sms.bean.ConversationParticipantItem;
import com.pccw.sms.util.SMSFormatUtil;
import java.util.ArrayList;
import java.util.Date;

public class CreateChatService {
    private static final String TAG = "CreateChatService";
    Context ctx;

    public CreateChatService(Context context) {
        this.ctx = context;
    }

    private void addGroupMember(String str, ArrayList<String> arrayList) {
        GroupMemberService groupMemberService = new GroupMemberService(this.ctx);
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < arrayList.size()) {
                groupMemberService.addGroupMember(str, arrayList.get(i2));
                i = i2 + 1;
            } else {
                return;
            }
        }
    }

    private void addNewChatList(String str) {
        new ChatRecordService(this.ctx).addChatList(new ChatList(str, -1));
    }

    private void addNewGroupInfo(String str, String str2) {
        new GroupInfoService(this.ctx).addGroupInfo(str, str2, getCurrentDate());
    }

    private void addRecipientInfo(String str) {
        new ConversationParticipantItemService(this.ctx).addConversationParticipant(new ConversationParticipantItem(str, (String) null, (String) null));
    }

    private int getChatId(String str) {
        return new ChatRecordService(this.ctx).getChatListByUserName(str).getChatId();
    }

    private Date getCurrentDate() {
        return new Date();
    }

    private boolean isChatExist(String str) {
        return new ChatRecordService(this.ctx).getChatListByUserName(str) != null;
    }

    private boolean isRecipientExist(String str) {
        return new ConversationParticipantItemService(this.ctx).isDuplicatedUsername(str);
    }

    public int createMultipleChat(ArrayList<String> arrayList) {
        String groupIdString = SMSFormatUtil.getGroupIdString(arrayList);
        if (isChatExist(groupIdString)) {
            return getChatId(groupIdString);
        }
        addNewGroupInfo(groupIdString, groupIdString);
        addGroupMember(groupIdString, arrayList);
        addNewChatList(groupIdString);
        return getChatId(groupIdString);
    }

    public int createSingleChat(String str) {
        if (!isRecipientExist(str)) {
            addRecipientInfo(str);
        }
        if (isChatExist(str)) {
            return getChatId(str);
        }
        addNewChatList(str);
        return getChatId(str);
    }
}
