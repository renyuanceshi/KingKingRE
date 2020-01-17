package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import android.util.Log;
import com.pccw.database.entity.MessageStore;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.util.FormatUtil;
import com.pccw.sms.bean.SMSConstants;
import java.util.ArrayList;
import java.util.Date;

public class MessageStoreDAOImpl implements GenericDAO<MessageStore, Integer> {
    public String LOG_TAG = "MessageStoreDAOImpl";
    protected String[] MESSAGESTORE_TABLE_COLUMNS = {"MESSAGEID", "SENDER", "RECIPIENT", "TEXTMESSAGE", "SENTTIME", "SENTSTATUS", "ISREAD", "LOCALFILEPATH", "SERVERURIPATH", "MESSAGETYPE", "CHATID", DBHelper.MESSAGESTORE_KEY_SERVERMESSAGEID};
    protected SQLiteDatabase db = null;
    protected Context mContext;

    public MessageStoreDAOImpl(Context context) {
        this.mContext = context;
    }

    private void addResultToMessageStoreList(ArrayList<MessageStore> arrayList, Cursor cursor) {
        cursor.moveToFirst();
        while (!cursor.isAfterLast()) {
            try {
                arrayList.add(parseMessageStore(cursor));
            } catch (Exception e) {
                Log.e(this.LOG_TAG, "MessageStoreImpl, fail to add MessageStore exception=" + e.toString());
            }
            cursor.moveToNext();
        }
    }

    public void add(MessageStore messageStore) {
        ContentValues contentValues = new ContentValues();
        Log.i(this.LOG_TAG, "insert db; from=" + messageStore.getSender() + " recipient=" + messageStore.getRecipient() + " ;file path=" + messageStore.getLocalfilepath() + ";textmsg=" + messageStore.getTextMessage());
        Log.i(this.LOG_TAG, "  Time Save: " + FormatUtil.convertDateToStr(messageStore.getSentTime(), "yyyy-MM-dd HH:mm:ss:SSS"));
        contentValues.put("SENDER", messageStore.getSender());
        contentValues.put("RECIPIENT", messageStore.getRecipient());
        contentValues.put("TEXTMESSAGE", messageStore.getTextMessage());
        contentValues.put("SENTTIME", FormatUtil.convertDateToStr(messageStore.getSentTime(), "yyyy-MM-dd HH:mm:ss:SSS"));
        contentValues.put("SENTSTATUS", messageStore.getSentStatus());
        contentValues.put("ISREAD", messageStore.getIsRead());
        contentValues.put("LOCALFILEPATH", messageStore.getLocalfilepath());
        contentValues.put("SERVERURIPATH", messageStore.getServeruripath());
        contentValues.put("MESSAGETYPE", messageStore.getMessagetype());
        contentValues.put("CHATID", Integer.valueOf(messageStore.getChatid()));
        contentValues.put(DBHelper.MESSAGESTORE_KEY_SERVERMESSAGEID, messageStore.getServerMessageId());
        try {
            open();
            Log.i(this.LOG_TAG, "MessageImpl, add, added Message with ID=" + this.db.insert(DBHelper.TABLE_MESSAGESTORE, (String) null, contentValues));
        } catch (Exception e) {
        } finally {
            close();
        }
    }

    public void close() {
    }

    public int deleteChatByChatId(String str) {
        try {
            open();
            int delete = this.db.delete(DBHelper.TABLE_MESSAGESTORE, "CHATID=?", new String[]{str});
            Log.i(this.LOG_TAG, "MessageImpl, deleteChatByChatId, removed number of row=" + delete);
            return delete;
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageImpl, deleteChatByChatId, exception=" + e.toString());
            return -1;
        } finally {
            close();
        }
    }

    public int deleteMessageByMsgId(String str) {
        try {
            open();
            int delete = this.db.delete(DBHelper.TABLE_MESSAGESTORE, "MESSAGEID=?", new String[]{str});
            Log.i(this.LOG_TAG, "MessageImpl, deleteChatByChatId, removed number of row=" + delete);
            return delete;
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageImpl, deleteChatByChatId, exception=" + e.toString());
            return -1;
        } finally {
            close();
        }
    }

    public MessageStore find(Integer num) {
        MessageStore messageStore = null;
        Log.v(this.LOG_TAG, "MessageStoreImpl, findByMsgId, key= " + num);
        Log.d(this.LOG_TAG, "MessageStoreImpl, findByMsgId, query=" + "select * from messagestore where MESSAGEID=?");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("select * from messagestore where MESSAGEID=?", new String[]{String.valueOf(num)});
            rawQuery.moveToFirst();
            Log.v(this.LOG_TAG, "MessageStoreImpl, findByMsgId, count=" + rawQuery.getCount());
            if (!rawQuery.isAfterLast()) {
                try {
                    messageStore = parseMessageStore(rawQuery);
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "MessageStoreImpl, findByMsgId, fail to add MessageStore exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "MessageImpl, findByMsgId, exception=" + e2.toString());
        } finally {
            close();
        }
        return messageStore;
    }

    public ArrayList<MessageStore> findByChatID(int i) {
        Log.v(this.LOG_TAG, "MessageImpl, findByChatID, starts");
        ArrayList<MessageStore> arrayList = new ArrayList<>();
        Log.d(this.LOG_TAG, "MessageStoreImpl, findByChatID, query=" + "SELECT * FROM messagestore where CHATID = ? order by SENTTIME asc");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT * FROM messagestore where CHATID = ? order by SENTTIME asc", new String[]{String.valueOf(i)});
            Log.v(this.LOG_TAG, "MessageStoreImpl, findByChatID, count=" + rawQuery.getCount());
            addResultToMessageStoreList(arrayList, rawQuery);
            rawQuery.close();
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageImpl, findByChatID, exception=" + e.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<MessageStore> findByChatIDWithPage(int i, int i2) {
        Log.v(this.LOG_TAG, "MessageImpl, findByChatIDWithPage, starts");
        ArrayList<MessageStore> arrayList = new ArrayList<>();
        Log.d(this.LOG_TAG, "MessageStoreImpl, findByChatID, query=" + "SELECT * FROM (SELECT * FROM messagestore where CHATID = ? order by MESSAGEID desc limit ?, ?) order by MESSAGEID asc");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT * FROM (SELECT * FROM messagestore where CHATID = ? order by MESSAGEID desc limit ?, ?) order by MESSAGEID asc", new String[]{String.valueOf(i), String.valueOf((i2 - 1) * 20), String.valueOf(20)});
            Log.v(this.LOG_TAG, "MessageStoreImpl, findByChatID, count=" + rawQuery.getCount());
            addResultToMessageStoreList(arrayList, rawQuery);
            rawQuery.close();
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageImpl, findByChatID, exception=" + e.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<MessageStore> getAllSentMessageWithChatId(String str) {
        Log.d(this.LOG_TAG, "MessageStoreImpl, getSentMessageWithChatId, chatId=" + str);
        ArrayList<MessageStore> arrayList = new ArrayList<>();
        String str2 = "SELECT * FROM messagestore WHERE CHATID=? AND SENTSTATUS='" + SMSConstants.MESSAGE_STATUS_SENT + "' AND " + DBHelper.MESSAGESTORE_KEY_SERVERMESSAGEID + " IS NOT NULL";
        Log.d(this.LOG_TAG, "MessageStoreImpl, getSendingMessageWithChatId, query=" + str2);
        try {
            open();
            Cursor rawQuery = this.db.rawQuery(str2, new String[]{String.valueOf(str)});
            rawQuery.moveToFirst();
            Log.v(this.LOG_TAG, "MessageStoreImpl, findByMsgId, count=" + rawQuery.getCount());
            while (!rawQuery.isAfterLast()) {
                try {
                    arrayList.add(parseMessageStore(rawQuery));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "MessageStoreImpl, findByMsgId, fail to add MessageStore exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "MessageImpl, findByMsgId, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public int getFirstUnreadMessageId(String str) {
        int i = -1;
        Log.d(this.LOG_TAG, "MessageStoreImpl, getLastUnreadMessageId, query=" + "SELECT MESSAGEID FROM messagestore WHERE ISREAD='N' AND CHATID=? ORDER BY SENTTIME ASC LIMIT 1");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT MESSAGEID FROM messagestore WHERE ISREAD='N' AND CHATID=? ORDER BY SENTTIME ASC LIMIT 1", new String[]{String.valueOf(str)});
            rawQuery.moveToFirst();
            if (!rawQuery.isAfterLast()) {
                try {
                    i = rawQuery.getInt(rawQuery.getColumnIndexOrThrow("MESSAGEID"));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "MessageStoreImpl, getLastUnreadMessageId, fail to find last unread messageID=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "MessageImpl, getLastUnreadMessageId, exception=" + e2.toString());
        } finally {
            close();
        }
        return i;
    }

    public MessageStore getLatestMessageStoreByChatId(int i) {
        MessageStore messageStore = null;
        Log.v(this.LOG_TAG, "MessageImpl, findByChatId, starts" + i);
        Log.d(this.LOG_TAG, "MessageStoreImpl, findByChatID, query=" + "select * from messagestore where CHATID=? order by MESSAGEID desc limit 1 ");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("select * from messagestore where CHATID=? order by MESSAGEID desc limit 1 ", new String[]{String.valueOf(i)});
            rawQuery.moveToFirst();
            Log.v(this.LOG_TAG, "MessageStoreImpl, findByChatID, count=" + rawQuery.getCount());
            if (!rawQuery.isAfterLast()) {
                try {
                    messageStore = parseMessageStore(rawQuery);
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "MessageStoreImpl, findByChatID, fail to add MessageStore exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "MessageImpl, findByChatID, exception=" + e2.toString());
        } finally {
            close();
        }
        return messageStore;
    }

    public int getMsgCount(int i) {
        int i2 = 0;
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("select * from messagestore where CHATID='" + Integer.toString(i) + "'", (String[]) null);
            i2 = rawQuery.getCount();
            rawQuery.close();
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageImpl, getUnreadMsgCount, exception=" + e.toString());
        } finally {
            close();
        }
        return i2;
    }

    public int getUnreadMsgCount(String str, String str2) {
        Log.i(this.LOG_TAG, "get unread participants: " + str);
        int i = 0;
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("select * from messagestore where ISREAD='N' and CHATID='" + str2 + "'", (String[]) null);
            i = rawQuery.getCount();
            rawQuery.close();
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageImpl, getUnreadMsgCount, exception=" + e.toString());
        } finally {
            close();
        }
        return i;
    }

    public ArrayList<MessageStore> list() {
        Log.v(this.LOG_TAG, "MessageImpl, list, starts");
        ArrayList<MessageStore> arrayList = new ArrayList<>();
        try {
            open();
            Cursor query = this.db.query(DBHelper.TABLE_MESSAGESTORE, this.MESSAGESTORE_TABLE_COLUMNS, (String) null, (String[]) null, (String) null, (String) null, "CHATID ASC");
            Log.v(this.LOG_TAG, "MessageImpl, list, count=" + query.getCount());
            addResultToMessageStoreList(arrayList, query);
            query.close();
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageImpl, list, exception=" + e.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public void open() {
        this.db = DBHelper.getDBInstance(this.mContext);
    }

    /* access modifiers changed from: protected */
    public MessageStore parseMessageStore(Cursor cursor) {
        int i = cursor.getInt(cursor.getColumnIndexOrThrow("MESSAGEID"));
        String string = cursor.getString(cursor.getColumnIndexOrThrow("SENDER"));
        String string2 = cursor.getString(cursor.getColumnIndexOrThrow("RECIPIENT"));
        String string3 = cursor.getString(cursor.getColumnIndexOrThrow("TEXTMESSAGE"));
        Date convertStrToDate = FormatUtil.convertStrToDate(cursor.getString(cursor.getColumnIndexOrThrow("SENTTIME")));
        String string4 = cursor.getString(cursor.getColumnIndexOrThrow("SENTSTATUS"));
        String string5 = cursor.getString(cursor.getColumnIndexOrThrow("ISREAD"));
        String string6 = cursor.getString(cursor.getColumnIndexOrThrow("LOCALFILEPATH"));
        String string7 = cursor.getString(cursor.getColumnIndexOrThrow("SERVERURIPATH"));
        String string8 = cursor.getString(cursor.getColumnIndexOrThrow("MESSAGETYPE"));
        String string9 = cursor.getString(cursor.getColumnIndex(DBHelper.MESSAGESTORE_KEY_SERVERMESSAGEID));
        MessageStore messageStore = new MessageStore(string, string2, string3, convertStrToDate, string4, string5, string6, string7, string8, cursor.getInt(cursor.getColumnIndexOrThrow("CHATID")));
        messageStore.setMessageId(i);
        messageStore.setServerMessageId(string9);
        return messageStore;
    }

    public void remove(MessageStore messageStore) {
        Log.v(this.LOG_TAG, "MessageImpl, remove, starts");
        if (messageStore.getMessageId() > 0) {
            try {
                open();
                Log.i(this.LOG_TAG, "MessageImpl, remove, removed number of row=" + this.db.delete(DBHelper.TABLE_MESSAGESTORE, "MESSAGEID=?", new String[]{String.valueOf(messageStore.getMessageId())}));
            } catch (Exception e) {
                Log.e(this.LOG_TAG, "MessageImpl, remove, exception=" + e.toString());
            } finally {
                close();
            }
        } else {
            Log.e(this.LOG_TAG, "MessageImpl, remove, fail: id is " + messageStore.getMessageId());
        }
    }

    public void removeMessageByChatID(String str) {
        Log.v(this.LOG_TAG, "MessageImpl, remove, starts");
        if (str == null || "".equals(str)) {
            Log.e(this.LOG_TAG, "removeMessageByContactID chatID is null or empty");
            return;
        }
        try {
            open();
            Log.i(this.LOG_TAG, "MessageImpl, removeMessageByChatID, removed number of row=" + this.db.delete(DBHelper.TABLE_MESSAGESTORE, "CHATID=?", new String[]{str}));
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageImpl, removeMessageByChatID, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public int update(MessageStore messageStore) {
        return 0;
    }

    public void updateIsRead(String str, String str2) {
        Log.v(this.LOG_TAG, "MessageStoreDAOImpl, update message store, sender = " + str + " ;isRead=" + str2);
        try {
            open();
            ContentValues contentValues = new ContentValues();
            contentValues.put("ISREAD", str2);
            Log.i(this.LOG_TAG, "MessageStoreDAOImpl, updated number of row=" + this.db.update(DBHelper.TABLE_MESSAGESTORE, contentValues, "ISREAD='N' and CHATID=?", new String[]{String.valueOf(str)}));
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "MessageStoreDAOImpl, update message store, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public int updateSentStatus(int i, String str) {
        int i2 = 0;
        Log.v(this.LOG_TAG, "MessageStoreDAOImpl, update message store, messageId = " + i);
        if (i > 0) {
            try {
                open();
                ContentValues contentValues = new ContentValues();
                contentValues.put("SENTSTATUS", str);
                i2 = this.db.update(DBHelper.TABLE_MESSAGESTORE, contentValues, "MESSAGEID=?", new String[]{String.valueOf(i)});
                Log.i(this.LOG_TAG, "MessageStoreDAOImpl, updated number of row=" + i2);
            } catch (Exception e) {
                Log.e(this.LOG_TAG, "MessageStoreDAOImpl, update message store, exception=" + e.toString());
            } finally {
                close();
            }
        } else {
            Log.e(this.LOG_TAG, "MessageStoreDAOImpl, fail: msgId is " + i);
        }
        Log.v(this.LOG_TAG, "MessageStoreDAOImpl, no of row=" + i2);
        return i2;
    }

    public int updateSentStatusByServerMessageId(String str, String str2) {
        int i = 0;
        Log.v(this.LOG_TAG, "MessageStoreDAOImpl, update message store, serverMessageId = " + str);
        if (!TextUtils.isEmpty(str)) {
            try {
                open();
                ContentValues contentValues = new ContentValues();
                contentValues.put("SENTSTATUS", str2);
                i = this.db.update(DBHelper.TABLE_MESSAGESTORE, contentValues, "SERVERMESSAGEID=?", new String[]{str});
                Log.i(this.LOG_TAG, "MessageStoreDAOImpl, updated number of row=" + i);
            } catch (Exception e) {
                Log.e(this.LOG_TAG, "MessageStoreDAOImpl, update message store, exception=" + e.toString());
            } finally {
                close();
            }
        } else {
            Log.e(this.LOG_TAG, "MessageStoreDAOImpl, fail: serverMessageId is " + str);
        }
        Log.v(this.LOG_TAG, "MessageStoreDAOImpl, no of row=" + i);
        return i;
    }

    public int updateServerMessageId(int i, String str) {
        int i2 = 0;
        Log.v(this.LOG_TAG, "MessageStoreDAOImpl, update message store, msgId = " + i + " ;serverMessageId=" + str);
        if (i > 0) {
            try {
                open();
                ContentValues contentValues = new ContentValues();
                contentValues.put(DBHelper.MESSAGESTORE_KEY_SERVERMESSAGEID, str);
                i2 = this.db.update(DBHelper.TABLE_MESSAGESTORE, contentValues, "MESSAGEID=?", new String[]{String.valueOf(i)});
                Log.i(this.LOG_TAG, "MessageStoreDAOImpl, updated number of row=" + i2);
            } catch (Exception e) {
                Log.e(this.LOG_TAG, "MessageStoreDAOImpl, update message store, exception=" + e.toString());
            } finally {
                close();
            }
        } else {
            Log.e(this.LOG_TAG, "MessageStoreDAOImpl, fail: msgId is " + i);
        }
        Log.v(this.LOG_TAG, "MessageStoreDAOImpl, no of row=" + i2);
        return i2;
    }
}
