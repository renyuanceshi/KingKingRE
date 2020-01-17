package com.pccw.sms.bean;

import android.widget.Button;
import android.widget.ListView;
import android.widget.RelativeLayout;
import com.pccw.database.entity.GroupMember;
import com.pccw.sms.adapter.GroupInfoParticipantAdapter;

public class GroupInfoLayout {
    private GroupInfoParticipantAdapter<GroupMember> mAdapter = null;
    private RelativeLayout progressBar;
    private Button subscribeUserBtn;
    private ListView subscriptionListView;

    public GroupInfoLayout(ListView listView, Button button, RelativeLayout relativeLayout) {
        this.subscribeUserBtn = button;
        this.subscriptionListView = listView;
        this.progressBar = relativeLayout;
    }

    public GroupInfoParticipantAdapter<GroupMember> getListAdapter() {
        return this.mAdapter;
    }

    public RelativeLayout getProgressBar() {
        return this.progressBar;
    }

    public Button getSubscribeUserBtn() {
        return this.subscribeUserBtn;
    }

    public ListView getSubscriptionListView() {
        return this.subscriptionListView;
    }

    public void setListAdapter(GroupInfoParticipantAdapter<GroupMember> groupInfoParticipantAdapter) {
        this.mAdapter = groupInfoParticipantAdapter;
    }

    public void setProgressBar(RelativeLayout relativeLayout) {
        this.progressBar = relativeLayout;
    }

    public void setSubscribeUserBtn(Button button) {
        this.subscribeUserBtn = button;
    }

    public void setSubscriptionListView(ListView listView) {
        this.subscriptionListView = listView;
    }
}
