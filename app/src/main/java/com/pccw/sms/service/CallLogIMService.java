package com.pccw.sms.service;

import android.content.Context;
import android.database.Cursor;
import android.util.Log;
import com.pccw.database.dao.CallLogTempDAOImpl;
import com.pccw.database.entity.CallLogTemp;
import com.pccw.database.entity.ChatPageInfo;
import com.pccw.database.entity.MessageStore;
import com.pccw.sms.bean.MessageItem;
import com.pccw.sms.bean.SMSConstants;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

public class CallLogIMService {
    private String LOG_TAG = "CallLogIMService";
    protected CallLogTempDAOImpl callLogTempImpl;
    protected Context context;

    public CallLogIMService(Context context2) {
        this.context = context2;
        this.callLogTempImpl = new CallLogTempDAOImpl(context2);
    }

    private boolean isCallType(MessageStore messageStore) {
        return SMSConstants.MESSAGE_TYPE_INCOMING_CALL.equals(messageStore.getMessagetype()) || SMSConstants.MESSAGE_TYPE_OUTGOING_CALL.equals(messageStore.getMessagetype()) || SMSConstants.MESSAGE_TYPE_MISSING_CALL.equals(messageStore.getMessagetype()) || SMSConstants.MESSAGE_TYPE_OTHERS_CALL.equals(messageStore.getMessagetype());
    }

    public void addCallLogAll(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        if (cursor != null) {
            while (cursor.moveToNext()) {
                String string = cursor.getString(4);
                String string2 = cursor.getString(1);
                String string3 = cursor.getString(2);
                String str = SMSConstants.MESSAGE_TYPE_OTHERS_CALL;
                switch (cursor.getInt(3)) {
                    case 1:
                        str = SMSConstants.MESSAGE_TYPE_INCOMING_CALL;
                        break;
                    case 2:
                        str = SMSConstants.MESSAGE_TYPE_OUTGOING_CALL;
                        break;
                    case 3:
                        str = SMSConstants.MESSAGE_TYPE_MISSING_CALL;
                        break;
                }
                String normalizeContactNumber = PhoneListService.normalizeContactNumber(string);
                Log.v("KKIM", "adding record to callLogTemp table: [" + string + "," + normalizeContactNumber + "," + string2 + "," + string3 + "," + str + "]");
                arrayList.add(new CallLogTemp(normalizeContactNumber, str, string2, string3, string));
            }
        }
        this.callLogTempImpl.addList(arrayList);
    }

    public void clearCallLogAll() {
        this.callLogTempImpl.removeAllFromCallLogTemp();
    }

    public ArrayList<CallLogTemp> getAllCallLogTemp() {
        Log.v("KKIM", "getAllCallLogTemp start");
        return this.callLogTempImpl.list();
    }

    public ArrayList<MessageItem> getChatPageData(ChatPageInfo chatPageInfo, int i) {
        int i2;
        this.callLogTempImpl.dropChatLogView();
        this.callLogTempImpl.createChatLogView(Integer.toString(chatPageInfo.getChatId()), chatPageInfo.getRecipient());
        ArrayList<MessageStore> listChatPageDataWithPage = this.callLogTempImpl.listChatPageDataWithPage(i);
        ArrayList<MessageItem> arrayList = new ArrayList<>();
        Iterator<MessageStore> it = listChatPageDataWithPage.iterator();
        while (it.hasNext()) {
            MessageStore next = it.next();
            long chatid = (long) next.getChatid();
            Log.i(this.LOG_TAG, "->sender:" + next.getSender() + " ;recipient:" + next.getRecipient() + " ;r=" + chatPageInfo.getRecipient() + " ;owner=" + chatPageInfo.getOwner());
            if (isCallType(next)) {
                Log.i(this.LOG_TAG, "Call record found");
                if (SMSConstants.MESSAGE_TYPE_INCOMING_CALL.equals(next.getMessagetype()) || SMSConstants.MESSAGE_TYPE_MISSING_CALL.equals(next.getMessagetype())) {
                    i2 = 0;
                } else if (SMSConstants.MESSAGE_TYPE_OUTGOING_CALL.equals(next.getMessagetype())) {
                    i2 = 1;
                } else {
                    Log.i(this.LOG_TAG, "invalid call type is found [" + next.getMessagetype() + "] - Skipping this record");
                }
            } else {
                i2 = next.getRecipient().equals(chatPageInfo.getOwner()) ? 0 : 1;
            }
            String sender = next.getSender();
            String messagetype = next.getMessagetype();
            String textMessage = next.getTextMessage();
            Date sentTime = next.getSentTime();
            String sentStatus = next.getSentStatus();
            String isRead = next.getIsRead();
            Log.i(this.LOG_TAG, "from=" + next.getSender() + " ;filePath=" + null + " ;msgType=" + messagetype + ";sentStatus=" + sentStatus + " ;direction=" + i2 + " ;content=" + textMessage + " ;isRead=" + isRead);
            MessageItem messageItem = new MessageItem(chatid, (String) null, sender, textMessage, i2, sentTime, messagetype, sentStatus, isRead);
            messageItem.setMsgId(next.getMessageId());
            arrayList.add(messageItem);
        }
        return arrayList;
    }
}
