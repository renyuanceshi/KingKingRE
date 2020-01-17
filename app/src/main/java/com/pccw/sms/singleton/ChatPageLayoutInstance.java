package com.pccw.sms.singleton;

import com.pccw.sms.bean.ChatPageListView;

public class ChatPageLayoutInstance {
    private static ChatPageLayoutInstance chatPageLayoutInstance;
    private ChatPageListView chatPageListView;

    public static ChatPageLayoutInstance getInstance() {
        ChatPageLayoutInstance chatPageLayoutInstance2;
        synchronized (ChatPageLayoutInstance.class) {
            try {
                if (chatPageLayoutInstance == null) {
                    chatPageLayoutInstance = new ChatPageLayoutInstance();
                }
                chatPageLayoutInstance2 = chatPageLayoutInstance;
            } catch (Throwable th) {
                Class<ChatPageLayoutInstance> cls = ChatPageLayoutInstance.class;
                throw th;
            }
        }
        return chatPageLayoutInstance2;
    }

    public void destroy() {
        this.chatPageListView = null;
    }

    public ChatPageListView getChatPageListView() {
        return this.chatPageListView;
    }

    public void init(ChatPageListView chatPageListView2) {
        this.chatPageListView = chatPageListView2;
    }
}
