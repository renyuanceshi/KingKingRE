package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.pccw.database.entity.CallLogTemp;
import com.pccw.database.entity.MessageStore;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.util.FormatUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import org.apache.commons.lang3.StringUtils

public class CallLogTempDAOImpl implements GenericDAO<CallLogTemp, Integer> {
    protected String[] CALLLOGTEMP_TABLE_COLUMNS = {DBHelper.CALLLOGTEMP_KEY_CHATNUMBER, DBHelper.CALLLOGTEMP_KEY_CALLDATE, DBHelper.CALLLOGTEMP_KEY_CALLTYPE, DBHelper.CALLLOGTEMP_KEY_DURATION, DBHelper.CALLLOGTEMP_KEY_CONTACTNUMBER};
    protected String[] CHATLOG_VIEW_COLUMNS = {"MESSAGEID", "CHATID", "SENDER", "RECIPIENT", "TEXTMESSAGE", "SENTTIME", "SENTSTATUS", "ISREAD", "LOCALFILEPATH", "SERVERURIPATH", "MESSAGETYPE", "CHATID"};
    public String LOG_TAG = "CallLogTempDAOImpl";
    protected SQLiteDatabase db = null;
    protected Context mContext;

    public CallLogTempDAOImpl(Context context) {
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

    public void add(CallLogTemp callLogTemp) {
    }

    public void addList(ArrayList<CallLogTemp> arrayList) {
        try {
            open();
            this.db.beginTransaction();
            Iterator<CallLogTemp> it = arrayList.iterator();
            while (it.hasNext()) {
                CallLogTemp next = it.next();
                ContentValues contentValues = new ContentValues();
                contentValues.put(DBHelper.CALLLOGTEMP_KEY_CHATNUMBER, next.getChatNumber());
                contentValues.put(DBHelper.CALLLOGTEMP_KEY_CALLDATE, FormatUtil.convertLongToStr(Long.parseLong(next.getCallDate())));
                contentValues.put(DBHelper.CALLLOGTEMP_KEY_CALLTYPE, next.getCallType());
                String convertDurationSecondsToTimeStr = FormatUtil.convertDurationSecondsToTimeStr(Long.parseLong(next.getDuration()));
                Log.v("KKIM", "Duration : " + next.getDuration() + "," + convertDurationSecondsToTimeStr);
                contentValues.put(DBHelper.CALLLOGTEMP_KEY_DURATION, convertDurationSecondsToTimeStr);
                contentValues.put(DBHelper.CALLLOGTEMP_KEY_CONTACTNUMBER, next.getContactNumber());
                this.db.insert(DBHelper.TABLE_CALLLOGTEMP, (String) null, contentValues);
            }
            this.db.setTransactionSuccessful();
        } catch (Exception e) {
        } finally {
            this.db.endTransaction();
            close();
        }
    }

    public void close() {
    }

    public void createChatLogView(String str, String str2) {
        try {
            Log.v(this.LOG_TAG, "createChatLogView chatNumber : " + str2);
            open();
            this.db.execSQL("CREATE VIEW chatlog AS SELECT messagetype,senttime,textmessage,messageid,sender,recipient,sentstatus,isread,localfilepath,serveruripath,chatid FROM MESSAGESTORE where chatid=" + str + " UNION select calltype,calldate,duration,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL from " + DBHelper.TABLE_CALLLOGTEMP + " where chatNumber=" + str2);
            Log.i(this.LOG_TAG, "createChatLogView completed");
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "createChatLogView, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public void dropChatLogView() {
        try {
            open();
            this.db.execSQL("DROP view IF EXISTS chatlog");
            Log.i(this.LOG_TAG, "CallLogTempDAOImpl, dropChatLogView completed");
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "CallLogTempDAOImpl, dropChatLogView, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public CallLogTemp find(Integer num) {
        return null;
    }

    public ArrayList<CallLogTemp> list() {
        Log.v(this.LOG_TAG, "CallLogTempDAOImpl, list, starts");
        ArrayList<CallLogTemp> arrayList = new ArrayList<>();
        try {
            open();
            Cursor query = this.db.query(DBHelper.TABLE_CALLLOGTEMP, this.CALLLOGTEMP_TABLE_COLUMNS, (String) null, (String[]) null, (String) null, (String) null, "CALLDATE ASC");
            query.moveToFirst();
            Log.v(this.LOG_TAG, "CallLogTempDAOImpl, list, count=" + query.getCount());
            while (!query.isAfterLast()) {
                try {
                    arrayList.add(parseModel(query));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "list, fail to add exception=" + e.toString());
                }
                query.moveToNext();
            }
            query.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "UserInfoImpl, list, exception=" + e2.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<MessageStore> listChatPageData() {
        Log.v(this.LOG_TAG, "CallLogTempDAOImpl, listChatPageData, starts");
        ArrayList<MessageStore> arrayList = new ArrayList<>();
        try {
            open();
            Cursor query = this.db.query(DBHelper.VIEW_CHATLOG, this.CHATLOG_VIEW_COLUMNS, (String) null, (String[]) null, (String) null, (String) null, "SENTTIME ASC");
            query.moveToFirst();
            Log.v(this.LOG_TAG, "CallLogTempDAOImpl, listChatPageData, count=" + query.getCount());
            addResultToMessageStoreList(arrayList, query);
            query.close();
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "CallLogTempDAOImpl, listChatPageData, exception=" + e.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public ArrayList<MessageStore> listChatPageDataWithPage(int i) {
        Log.v(this.LOG_TAG, "CallLogTempDAOImpl, listChatPageData, starts pageNo= " + i);
        ArrayList<MessageStore> arrayList = new ArrayList<>();
        String join = StringUtils.join((Object[]) this.CHATLOG_VIEW_COLUMNS, ",");
        String str = "select " + join + " from (select " + join + " from " + DBHelper.VIEW_CHATLOG + " order by " + "SENTTIME" + " desc limit " + ((i - 1) * 20) + " , " + 20 + ") order by " + "SENTTIME" + " asc";
        Log.d(this.LOG_TAG, "CallLogTempDAOImpl, query=" + str);
        try {
            open();
            Cursor rawQuery = this.db.rawQuery(str, (String[]) null);
            rawQuery.moveToFirst();
            Log.v(this.LOG_TAG, "CallLogTempDAOImpl, count=" + rawQuery.getCount());
            while (!rawQuery.isAfterLast()) {
                try {
                    arrayList.add(parseMessageStore(rawQuery));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "CallLogTempDAOImpl, fail to find scanGroupInfo exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "CallLogTempDAOImpl, exception=" + e2.toString());
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
        int i2 = cursor.getInt(cursor.getColumnIndexOrThrow("CHATID"));
        Log.v("KKIM", "chatlogView result : " + i + "," + string + "," + string2 + "," + string3 + "," + convertStrToDate + "," + string4 + "," + string5 + "," + string6 + "," + string7 + "," + string8 + "," + i2);
        MessageStore messageStore = new MessageStore(string, string2, string3, convertStrToDate, string4, string5, string6, string7, string8, i2);
        messageStore.setMessageId(i);
        return messageStore;
    }

    /* access modifiers changed from: protected */
    public CallLogTemp parseModel(Cursor cursor) {
        return new CallLogTemp(cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.CALLLOGTEMP_KEY_CHATNUMBER)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.CALLLOGTEMP_KEY_CALLDATE)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.CALLLOGTEMP_KEY_CALLTYPE)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.CALLLOGTEMP_KEY_DURATION)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.CALLLOGTEMP_KEY_CONTACTNUMBER)));
    }

    public void remove(CallLogTemp callLogTemp) {
    }

    public void removeAllFromCallLogTemp() {
        try {
            open();
            Log.i(this.LOG_TAG, "CallLogTempDAOImpl, remove, removed number of row=" + this.db.delete(DBHelper.TABLE_CALLLOGTEMP, (String) null, (String[]) null));
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "CallLogTempDAOImpl, remove, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public int update(CallLogTemp callLogTemp) {
        return 0;
    }
}
