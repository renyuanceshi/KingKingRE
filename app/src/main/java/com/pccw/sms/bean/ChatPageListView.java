package com.pccw.sms.bean;

import android.widget.ListView;
import com.pccw.sms.adapter.MessageAdapter;

public class ChatPageListView {
    private int currentPage;
    private ListView listView;
    private MessageAdapter messageAdapter;

    public ChatPageListView(ListView listView2, int i, MessageAdapter messageAdapter2) {
        this.listView = listView2;
        this.currentPage = i;
        this.messageAdapter = messageAdapter2;
    }

    public int getCurrentPage() {
        return this.currentPage;
    }

    public ListView getListView() {
        return this.listView;
    }

    public MessageAdapter getMessageAdapter() {
        return this.messageAdapter;
    }

    public void setCurrentPage(int i) {
        this.currentPage = i;
    }

    public void setListView(ListView listView2) {
        this.listView = listView2;
    }

    public void setMessageAdapter(MessageAdapter messageAdapter2) {
        this.messageAdapter = messageAdapter2;
    }
}
