package com.pccw.sms.service;

import android.content.Context;
import com.pccw.database.dao.ChatListDAOImpl;
import com.pccw.database.entity.ChatList;

public class ChatListService {
    ChatListDAOImpl chatListImpl;
    Context ctx;

    public ChatListService(Context context) {
        this.ctx = context;
        this.chatListImpl = new ChatListDAOImpl(context);
    }

    public ChatList getChatListByUserName(String str) {
        return this.chatListImpl.findByChatContact(str);
    }

    public String getUserNameByChatId(int i) {
        return this.chatListImpl.findByChatId(i).getChatContact();
    }
}
