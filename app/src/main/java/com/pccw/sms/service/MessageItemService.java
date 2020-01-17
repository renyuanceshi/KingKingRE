package com.pccw.sms.service;

import android.content.Context;
import android.util.Log;
import com.pccw.database.dao.MessageStoreDAOImpl;
import com.pccw.database.dao.UserInfoDAOImpl;
import com.pccw.database.entity.ChatPageInfo;
import com.pccw.database.entity.MessageStore;
import com.pccw.mobile.sip02.R;
import com.pccw.sms.bean.MessageItem;
import com.pccw.sms.bean.SMSConstants;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

public class MessageItemService {
    private String LOG_TAG = "MessageItemService";
    protected Context context;
    protected MessageStoreDAOImpl messageStoreImpl;

    public MessageItemService(Context context2) {
        this.context = context2;
        this.messageStoreImpl = new MessageStoreDAOImpl(context2);
    }

    private String getParsedSystemMessage(String str, String str2, String[] strArr, UserInfoDAOImpl userInfoDAOImpl) {
        String str3;
        String formatPhoneNumber;
        String str4 = "";
        if (strArr.length == 2) {
            String string = str.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_ADD) ? (!str2.equals(strArr[0]) || !strArr[0].equals(strArr[1])) ? this.context.getResources().getString(R.string.group_chat_system_add_member) : this.context.getResources().getString(R.string.group_chat_system_you_have_joined) : str2.equals(strArr[0]) ? strArr[0].equals(strArr[1]) ? this.context.getResources().getString(R.string.group_chat_system_you_have_left) : this.context.getResources().getString(R.string.group_chat_system_remove_member) : strArr[0].equals(strArr[1]) ? this.context.getResources().getString(R.string.group_chat_system_member_left) : this.context.getResources().getString(R.string.group_chat_system_remove_member);
            String str5 = strArr[0];
            String str6 = strArr[1];
            UserInfoDAOImpl.ContactDetail findUserContactDetail = userInfoDAOImpl.findUserContactDetail(str5);
            if (!strArr[0].equals(strArr[1])) {
                String string2 = str5.equals(str2) ? this.context.getResources().getString(R.string.group_chat_system_you) : ("".equals(findUserContactDetail.nickname) || findUserContactDetail.nickname == null) ? SMSConstants.formatPhoneNumber(str5) : findUserContactDetail.nickname;
                UserInfoDAOImpl.ContactDetail findUserContactDetail2 = userInfoDAOImpl.findUserContactDetail(strArr[1]);
                str3 = "" + string;
                if (str6.equals(str2)) {
                    str4 = string2;
                    formatPhoneNumber = this.context.getResources().getString(R.string.group_chat_system_you);
                } else {
                    String formatPhoneNumber2 = ("".equals(findUserContactDetail2.nickname) || findUserContactDetail2.nickname == null) ? SMSConstants.formatPhoneNumber(str6) : findUserContactDetail2.nickname;
                    str4 = string2;
                    formatPhoneNumber = formatPhoneNumber2;
                }
            } else {
                formatPhoneNumber = "";
                if (str6.equals(str2)) {
                    str3 = string;
                    str4 = this.context.getResources().getString(R.string.group_chat_system_you);
                } else {
                    String formatPhoneNumber3 = ("".equals(findUserContactDetail.nickname) || findUserContactDetail.nickname == null) ? SMSConstants.formatPhoneNumber(str6) : findUserContactDetail.nickname;
                    userInfoDAOImpl.findUserContactDetail(strArr[1]);
                    str3 = string;
                    str4 = formatPhoneNumber3;
                }
            }
        } else {
            String string3 = str.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_ADD) ? this.context.getResources().getString(R.string.group_chat_system_add_member) : this.context.getResources().getString(R.string.group_chat_system_remove_member);
            UserInfoDAOImpl.ContactDetail findUserContactDetail3 = userInfoDAOImpl.findUserContactDetail(strArr[0]);
            str3 = string3;
            formatPhoneNumber = ("".equals(findUserContactDetail3.nickname) || findUserContactDetail3.nickname == null) ? SMSConstants.formatPhoneNumber(strArr[0]) : findUserContactDetail3.nickname;
        }
        return str4 + str3 + formatPhoneNumber;
    }

    public void addMessageItem(String str, String str2, MessageItem messageItem) {
        String str3;
        String str4;
        if (messageItem != null) {
            Log.i(this.LOG_TAG, "dir=" + messageItem.getDirection() + ";receipt=" + str2 + ";owner=" + str);
            if (messageItem.getDirection() == 0) {
                str3 = str2;
                str4 = str;
            } else {
                str3 = str;
                str4 = str2;
            }
            this.messageStoreImpl.add(new MessageStore(str3, str4, messageItem.getContent(), messageItem.getLastMsgTime(), messageItem.getSentStatus(), messageItem.getIsRead(), messageItem.getFilePath(), "", messageItem.getMsgType(), (int) messageItem.getChatId()));
        }
    }

    public int deleteChatByChatId(String str) {
        return this.messageStoreImpl.deleteChatByChatId(str);
    }

    public int deleteMessageByMsgId(String str) {
        return this.messageStoreImpl.deleteMessageByMsgId(str);
    }

    public ArrayList<MessageStore> getAllSentMessageWithChatId(String str) {
        return this.messageStoreImpl.getAllSentMessageWithChatId(str);
    }

    public int getFirstUnreadMessageId(String str) {
        return this.messageStoreImpl.getFirstUnreadMessageId(str);
    }

    public MessageStore getLastMessage(int i) {
        return this.messageStoreImpl.getLatestMessageStoreByChatId(i);
    }

    public ArrayList<MessageItem> getMessageItem(ChatPageInfo chatPageInfo, int i) {
        ArrayList<MessageItem> arrayList = new ArrayList<>();
        Iterator<MessageStore> it = this.messageStoreImpl.findByChatIDWithPage(chatPageInfo.getChatId(), i).iterator();
        while (it.hasNext()) {
            MessageStore next = it.next();
            long chatid = (long) next.getChatid();
            Log.i(this.LOG_TAG, "->sender:" + next.getSender() + " ;recipient:" + next.getRecipient() + " ;r=" + chatPageInfo.getRecipient() + " ;owner=" + chatPageInfo.getOwner());
            int i2 = next.getRecipient().equals(chatPageInfo.getOwner()) ? 0 : 1;
            String sender = next.getSender();
            String str = null;
            String messagetype = next.getMessagetype();
            UserInfoDAOImpl userInfoDAOImpl = new UserInfoDAOImpl(this.context);
            if (messagetype.equals(SMSConstants.MESSAGE_TYPE_TEXT)) {
                str = next.getTextMessage();
            } else if (messagetype.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_ADD) || messagetype.equals(SMSConstants.MESSAGE_TYPE_SYSTEM_DELETE)) {
                str = getParsedSystemMessage(messagetype, chatPageInfo.getOwner(), next.getTextMessage().split(SMSConstants.MESSAGE_SYSTEM_SEPARATOR), userInfoDAOImpl);
            }
            Date sentTime = next.getSentTime();
            String sentStatus = next.getSentStatus();
            String isRead = next.getIsRead();
            Log.i(this.LOG_TAG, "from=" + next.getSender() + " ;filePath=" + null + " ;msgType=" + messagetype + ";sentStatus=" + sentStatus + " ;direction=" + i2 + " ;content=" + str + " ;isRead=" + isRead);
            MessageItem messageItem = new MessageItem(chatid, (String) null, sender, str, i2, sentTime, messagetype, sentStatus, isRead);
            messageItem.setMsgId(next.getMessageId());
            arrayList.add(messageItem);
        }
        return arrayList;
    }

    public MessageStore getMessageStoreByMsgId(int i) {
        return this.messageStoreImpl.find(Integer.valueOf(i));
    }

    public void updateIsRead(String str, String str2) {
        this.messageStoreImpl.updateIsRead(str, "Y");
    }

    public void updateSentStatus(int i, String str) {
        this.messageStoreImpl.updateSentStatus(i, str);
    }

    public void updateSentStatusByServerMessageId(String str, String str2) {
        this.messageStoreImpl.updateSentStatusByServerMessageId(str, str2);
    }

    public void updateServerMessageId(int i, String str) {
        this.messageStoreImpl.updateServerMessageId(i, str);
    }
}
