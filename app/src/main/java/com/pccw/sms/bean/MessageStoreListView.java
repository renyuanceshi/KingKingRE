package com.pccw.sms.bean;

import android.widget.ListView;

public class MessageStoreListView {
    private int chatId;
    private ListView listView;
    private String recipient;

    public MessageStoreListView(ListView listView2, int i, String str) {
        this.listView = listView2;
        this.chatId = i;
        setRecipient(str);
    }

    public int getChatId() {
        return this.chatId;
    }

    public ListView getListView() {
        return this.listView;
    }

    public String getRecipient() {
        return this.recipient;
    }

    public void setChatId(int i) {
        this.chatId = i;
    }

    public void setListView(ListView listView2) {
        this.listView = listView2;
    }

    public void setRecipient(String str) {
        this.recipient = str;
    }
}
