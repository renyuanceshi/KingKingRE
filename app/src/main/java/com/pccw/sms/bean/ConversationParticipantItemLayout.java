package com.pccw.sms.bean;

import android.widget.ListView;

public class ConversationParticipantItemLayout {
    private ListView listview;

    public ConversationParticipantItemLayout(ListView listView) {
        this.listview = listView;
    }

    public ListView getListview() {
        return this.listview;
    }

    public void setListview(ListView listView) {
        this.listview = listView;
    }
}
