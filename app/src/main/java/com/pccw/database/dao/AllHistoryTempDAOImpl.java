package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.pccw.database.entity.AllHistoryTemp;
import com.pccw.database.helper.DBHelper;
import java.util.ArrayList;
import java.util.Iterator;

public class AllHistoryTempDAOImpl implements GenericDAO<AllHistoryTemp, Integer> {
    protected String[] ALLHISTORYTEMP_TABLE_COLUMNS = {"_id", DBHelper.ALLHISTORY_KEY_CHATNUMBER, DBHelper.ALLHISTORY_KEY_TYPE, DBHelper.ALLHISTORY_KEY_DATE, "duration", DBHelper.ALLHISTORY_KEY_CACHED_NAME, DBHelper.ALLHISTORY_KEY_CACHED_NUMBER_TYPE, DBHelper.ALLHISTORY_KEY_CACHED_NUMBER_LABEL, DBHelper.ALLHISTORY_KEY_CONTACTNUMBER};
    protected String[] CHATLOG_VIEW_COLUMNS = {"_id", DBHelper.ALLHISTORY_KEY_CHATNUMBER, DBHelper.ALLHISTORY_KEY_TYPE, DBHelper.ALLHISTORY_KEY_DATE, "duration", DBHelper.ALLHISTORY_KEY_CACHED_NAME, DBHelper.ALLHISTORY_KEY_CACHED_NUMBER_TYPE, DBHelper.ALLHISTORY_KEY_CACHED_NUMBER_LABEL, DBHelper.ALLHISTORY_KEY_CONTACTNUMBER};
    public String LOG_TAG = "AllHistoryTempDAOImpl";
    protected SQLiteDatabase db = null;
    protected Context mContext;

    public AllHistoryTempDAOImpl(Context context) {
        this.mContext = context;
    }

    public void add(AllHistoryTemp allHistoryTemp) {
    }

    public void addList(ArrayList<AllHistoryTemp> arrayList) {
        try {
            open();
            this.db.beginTransaction();
            Iterator<AllHistoryTemp> it = arrayList.iterator();
            while (it.hasNext()) {
                AllHistoryTemp next = it.next();
                ContentValues contentValues = new ContentValues();
                contentValues.put(DBHelper.ALLHISTORY_KEY_CHATNUMBER, next.getChatnumber());
                contentValues.put(DBHelper.ALLHISTORY_KEY_TYPE, Integer.valueOf(next.getType()));
                contentValues.put(DBHelper.ALLHISTORY_KEY_DATE, next.getDate());
                contentValues.put("duration", next.getDuration());
                contentValues.put(DBHelper.ALLHISTORY_KEY_CACHED_NAME, next.getCached_name());
                contentValues.put(DBHelper.ALLHISTORY_KEY_CACHED_NUMBER_TYPE, next.getCached_number_type());
                contentValues.put(DBHelper.ALLHISTORY_KEY_CACHED_NUMBER_LABEL, next.getCached_number_label());
                contentValues.put(DBHelper.ALLHISTORY_KEY_CONTACTNUMBER, next.getContactNumber());
                this.db.insert(DBHelper.TABLE_ALLHISTORYTEMP, (String) null, contentValues);
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

    public void dropAllHistoryCombinedView() {
        try {
            open();
            this.db.execSQL("DROP VIEW IF EXISTS allchatview");
            Log.i(this.LOG_TAG, "AllHistoryTempDAOImpl, dropAllHistoryCombinedView completed");
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "AllHistoryTempDAOImpl, dropAllHistoryCombinedView exception=" + e.toString());
        } finally {
            close();
        }
    }

    public AllHistoryTemp find(Integer num) {
        return null;
    }

    public Cursor getCursor() {
        Cursor cursor = null;
        Log.i(this.LOG_TAG, "getCursor called");
        open();
        this.db.execSQL("CREATE VIEW allchatview AS " + ("SELECT chatcontact,senttime,C.messageid,textmessage,C.chatid,unreadcount,messagetype  FROM chatlist C LEFT OUTER JOIN ( SELECT messageid,textmessage,senttime,SUM(CASE isread WHEN 'N' THEN 1 ELSE 0 END) AS unreadcount,chatid,messagetype  FROM ( SELECT messageid,(CASE WHEN LENGTH(textmessage)>" + 30 + " THEN SUBSTR(textmessage,0," + 30 + ")||'...' ELSE textmessage END) AS textmessage,senttime,isread,chatid,messagetype  FROM messagestore ORDER BY messageid ASC ) GROUP BY chatid ) MSV ON C.chatid = MSV.chatid"));
        try {
            open();
            cursor = this.db.rawQuery("SELECT NULL AS _id,chatcontact,senttime,duration,calltype,callername,callertype,callerlabel,chatnumber,textmessage,chatid,entrytype,unreadcount,isimuser,messagetype  FROM ( SELECT chatcontact,senttime,'' AS duration,21 AS calltype,nickname AS callername,1 AS callertype,'CACHED_NUMBER_LABEL' AS callerlabel,chatcontact AS chatnumber,textmessage,chatid,'individual' AS entrytype,unreadcount,'Y' AS isimuser,messagetype  FROM allchatview LEFT OUTER JOIN (SELECT username,nickname FROM userinfo) ON username=chatcontact WHERE length(chatcontact) < 12 UNION ALL SELECT chatcontact,CASE WHEN senttime IS NULL THEN createdate ELSE senttime END AS senttime,'' AS duration,21 AS calltype,groupname,1 AS callertype,'CACHED_NUMBER_LABEL' AS callerlabel,chatcontact,textmessage,chatid,'group' AS entrytype,unreadcount,'Y' AS isimuser,messagetype  FROM allchatview INNER JOIN (SELECT groupid,groupname,createdate FROM groupinfo) ON groupid=chatcontact UNION ALL SELECT contactnumber,lastcall,duration,calltype,cachedname,cachednumtype,cachednumlabel,chatnumber,NULL AS textmessage,ACV.chatid,'individual' AS entrytype,unreadcount,CASE WHEN UIN.username IS NOT NULL THEN 'Y' ELSE 'N' END AS isimuser,'call' AS messagetype  FROM ( SELECT chatnumber,calltype,lastcall,duration,cachedname,cachednumtype,cachednumlabel,contactnumber FROM ( SELECT chatnumber,calltype,calldate as lastcall,duration,cachedname,cachednumtype,cachednumlabel,contactnumber FROM allhistorytemp ORDER BY lastcall ASC ) GROUP BY chatnumber ) calllogtable LEFT OUTER JOIN (SELECT username FROM userinfo) UIN ON calllogtable.chatnumber=UIN.username LEFT OUTER JOIN allchatview ACV ON calllogtable.chatnumber=ACV.chatcontact ORDER BY senttime ASC ) GROUP BY chatnumber ORDER BY senttime DESC", (String[]) null);
            cursor.moveToFirst();
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "UserInfoImpl, list, exception=" + e.toString());
        } finally {
            close();
        }
        return cursor;
    }

    public ArrayList<AllHistoryTemp> list() {
        Log.v(this.LOG_TAG, "AllHistoryTempDAOImpl, list, starts");
        ArrayList<AllHistoryTemp> arrayList = new ArrayList<>();
        try {
            open();
            Cursor query = this.db.query(DBHelper.TABLE_ALLHISTORYTEMP, this.ALLHISTORYTEMP_TABLE_COLUMNS, (String) null, (String[]) null, (String) null, (String) null, "calldate DESC");
            query.moveToFirst();
            Log.v(this.LOG_TAG, "AllHistoryTempDAOImpl, list, count=" + query.getCount());
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

    public void open() {
        this.db = DBHelper.getDBInstance(this.mContext);
    }

    /* access modifiers changed from: protected */
    public AllHistoryTemp parseModel(Cursor cursor) {
        return new AllHistoryTemp(cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.ALLHISTORY_KEY_CHATNUMBER)), cursor.getInt(cursor.getColumnIndexOrThrow(DBHelper.ALLHISTORY_KEY_TYPE)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.ALLHISTORY_KEY_DATE)), cursor.getString(cursor.getColumnIndexOrThrow("duration")), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.ALLHISTORY_KEY_CACHED_NAME)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.ALLHISTORY_KEY_CACHED_NUMBER_TYPE)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.ALLHISTORY_KEY_CACHED_NUMBER_LABEL)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.ALLHISTORY_KEY_CONTACTNUMBER)));
    }

    public void remove(AllHistoryTemp allHistoryTemp) {
    }

    public void removeAllFromCallLogTemp() {
        try {
            open();
            Log.i(this.LOG_TAG, "remove, removed number of row=" + this.db.delete(DBHelper.TABLE_ALLHISTORYTEMP, (String) null, (String[]) null));
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "remove, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public int update(AllHistoryTemp allHistoryTemp) {
        return 0;
    }
}
