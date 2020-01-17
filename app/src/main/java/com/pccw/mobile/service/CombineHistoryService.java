package com.pccw.mobile.service;

import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.util.Log;
import com.pccw.database.entity.ChatList;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.sip.Constants;
import com.pccw.sms.bean.ChatRecordItem;
import com.pccw.sms.service.ChatRecordService;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

public class CombineHistoryService {
    public static String CHAT_ID = "chatid";
    public static int CHAT_ID_COLUMN_INDEX = 8;
    public static String CHAT_NAME = "chatname";
    public static int CHAT_NAME_COLUMN_INDEX = 10;
    public static String CHAT_TYPE = "chattype";
    public static int CHAT_TYPE_COLUMN_INDEX = 9;
    static final String[] HISTORY_PROJECTION = {"_id", DBHelper.NUMBER, DBHelper.DATE, "duration", "type", "name", DBHelper.CACHED_NUMBER_TYPE, DBHelper.CACHED_NUMBER_LABEL, CHAT_ID, CHAT_TYPE, CHAT_NAME, LAST_MESSAGE, MESSAGE_TYPE, UNREAD_MSG_COUNT};
    public static final int IMMESSAGE_TYPE = 21;
    public static String LAST_MESSAGE = "lastmessage";
    public static int LAST_MESSAGE_COLUMN_INDEX = 11;
    public static String LAST_MESSAGE_TIME = DBHelper.DATE;
    public static int LAST_MESSAGE_TIME_COLUMN_INDEX = 2;
    public static String MESSAGE_ID = "messageid";
    public static int MESSAGE_ID_COLUMN_INDEX = 6;
    public static String MESSAGE_TYPE = "type";
    public static int MESSAGE_TYPE_COLUMN_INDEX = 12;
    public static String UNREAD_MSG_COUNT = "unreadMsgCount";
    Context context;

    public CombineHistoryService(Context context2) {
        this.context = context2;
    }

    public Cursor getChatRecordCursor() {
        MatrixCursor matrixCursor = new MatrixCursor(HISTORY_PROJECTION);
        ChatRecordService chatRecordService = new ChatRecordService(this.context);
        Iterator<ChatRecordItem> it = chatRecordService.getChatRecordItem().iterator();
        int i = 0;
        while (it.hasNext()) {
            ChatRecordItem next = it.next();
            String replace = next.getName().replace("@" + Constants.domainName, "");
            int unreadMsgCount = chatRecordService.getUnreadMsgCount(next.getName(), next.getChatId() + "");
            Log.v("KKIM", "CombineHistory, chatname=" + replace + " ;unreadMsg=" + unreadMsgCount + " ;chatId=" + next.getChatId());
            matrixCursor.addRow(new Object[]{Integer.valueOf(i), replace, Long.valueOf(next.getLastMessageTime() != null ? next.getLastMessageTime().getTime() : new Date().getTime()), "", 21, next.getNickName(), 1, "CACHED_NUMBER_LABEL", Integer.valueOf(next.getChatId()), next.getType(), next.getName(), next.getLastMessage(), next.getType(), Integer.valueOf(unreadMsgCount)});
            i++;
        }
        Iterator<ChatList> it2 = chatRecordService.listAll().iterator();
        while (it2.hasNext()) {
            ChatList next2 = it2.next();
            Log.i("KKIM", "->chatcontact=" + next2.getChatContact() + " ;msgId=" + next2.getMessageId());
        }
        return matrixCursor;
    }

    public String[] getChatRecordStringArray() {
        ArrayList arrayList = new ArrayList();
        Iterator<ChatRecordItem> it = new ChatRecordService(this.context).getChatRecordItem().iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().getName().replace("@" + Constants.domainName, ""));
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }
}
