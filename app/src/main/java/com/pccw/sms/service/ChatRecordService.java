package com.pccw.sms.service;

import android.content.Context;
import android.database.Cursor;
import android.util.Log;
import com.pccw.database.dao.ChatListDAOImpl;
import com.pccw.database.dao.MessageStoreDAOImpl;
import com.pccw.database.entity.ChatList;
import com.pccw.database.entity.ChatListUserInfo;
import com.pccw.sms.bean.ChatRecordItem;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Set;

public class ChatRecordService {
    private String LOG_TAG = "ChatRecordService";
    protected ChatListDAOImpl chatListImpl;
    protected Context context;
    protected MessageStoreDAOImpl messageStoreDAOImpl;

    public ChatRecordService(Context context2) {
        this.context = context2;
        this.chatListImpl = new ChatListDAOImpl(context2);
        this.messageStoreDAOImpl = new MessageStoreDAOImpl(context2);
    }

    public void addChatList(ChatList chatList) {
        if (chatList != null) {
            Log.i(this.LOG_TAG, "chatId=" + chatList.getChatContact());
            this.chatListImpl.add(chatList);
        }
    }

    public String convertSetToString(Set<String> set) {
        StringBuilder sb = new StringBuilder();
        for (String str : set) {
            sb.append(str + ";");
        }
        return sb.toString();
    }

    public void deleteChatByChatId(String str) {
        this.chatListImpl.removeChatRecord(str);
    }

    public Cursor getAllChatRecordCursor() {
        return this.chatListImpl.getAllChatRecordCursor();
    }

    public ChatList getChatListByUserName(String str) {
        return this.chatListImpl.findByChatContact(str);
    }

    public ChatListUserInfo getChatListDetailByChatcontact(String str) {
        return this.chatListImpl.getChatListDetailByChatcontact(str);
    }

    public ArrayList<ChatRecordItem> getChatRecordItem() {
        ArrayList<ChatRecordItem> arrayList = new ArrayList<>();
        Iterator<ChatListUserInfo> it = this.chatListImpl.getChatListUserInfo().iterator();
        while (it.hasNext()) {
            ChatListUserInfo next = it.next();
            int chatId = next.getChatId();
            String nickName = next.getNickName();
            String chatContact = next.getChatContact();
            String textMessage = next.getTextMessage();
            int messageId = next.getMessageId();
            Date sentTime = next.getSentTime();
            String photo = next.getPhoto();
            String type = next.getType();
            Log.i(this.LOG_TAG, "chatId=" + chatId + " ;name=" + chatContact + ", nickName=" + nickName + " ;lastMessageTime=" + sentTime + ";type=" + type + " ;mesasageId=" + messageId);
            ChatRecordItem chatRecordItem = new ChatRecordItem(nickName, chatContact, textMessage, sentTime, photo, type);
            chatRecordItem.setChatId(chatId);
            arrayList.add(chatRecordItem);
        }
        return arrayList;
    }

    public int getMsgCount(int i) {
        return this.messageStoreDAOImpl.getMsgCount(i);
    }

    public int getUnreadMsgCount(String str, String str2) {
        return this.messageStoreDAOImpl.getUnreadMsgCount(str, str2);
    }

    public ArrayList<ChatList> listAll() {
        return this.chatListImpl.list();
    }

    public void removeChatList(ChatList chatList) {
        this.chatListImpl.remove(chatList);
    }

    public void updateMessageIdForChatList(int i, int i2) {
        this.chatListImpl.updateMessageIdForChatList(i, i2);
    }
}
