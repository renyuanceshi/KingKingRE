package com.pccw.database.dao;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.pccw.database.entity.ResendMessage;
import com.pccw.database.helper.DBHelper;
import java.util.ArrayList;

public class ResendPerformDAOImpl implements GenericDAO<ResendMessage, String> {
    int CHATID_COLUMN = 5;
    int ID_COLUMN = 0;
    int LOCALFILEPATH_COLUMN = 3;
    public String LOG_TAG = "ResendMessageDAOImpl";
    int MESSAGEID_COLUMN = 1;
    int MESSAGETYPE_COLUMN = 4;
    int RECIPIENT_COLUMN = 2;
    final String RESEND_VIEW = "resendmediaview";
    protected Context context;
    protected SQLiteDatabase db = null;

    public ResendPerformDAOImpl(Context context2) {
        this.context = context2;
    }

    public void add(ResendMessage resendMessage) {
    }

    public void close() {
    }

    /* JADX INFO: finally extract failed */
    public boolean deleteRecordInQueue(int i) {
        open();
        try {
            if (this.db.delete(DBHelper.TABLE_RESENDQUEUE, "MESSAGEID=?", new String[]{String.valueOf(i)}) > 0) {
                Log.d(this.LOG_TAG, "ResendEntry Delete Success messageId= " + i);
                close();
                return true;
            }
            Log.d(this.LOG_TAG, "ResendEntry Delete Failed");
            close();
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            close();
            return false;
        } catch (Throwable th) {
            close();
            throw th;
        }
    }

    public ResendMessage find(String str) {
        return null;
    }

    /* JADX INFO: finally extract failed */
    public ResendMessage getLastRecordInQueue() {
        open();
        try {
            Cursor rawQuery = this.db.rawQuery("SELECT * FROM resendqueue ORDER BY _id DESC LIMIT 1", (String[]) null);
            if (rawQuery == null || rawQuery.getCount() <= 0) {
                close();
                return null;
            }
            rawQuery.moveToFirst();
            ResendMessage resendMessage = new ResendMessage(rawQuery.getInt(this.MESSAGEID_COLUMN), rawQuery.getString(this.RECIPIENT_COLUMN), rawQuery.getString(this.LOCALFILEPATH_COLUMN), rawQuery.getString(this.MESSAGETYPE_COLUMN), rawQuery.getInt(this.CHATID_COLUMN));
            close();
            return resendMessage;
        } catch (Exception e) {
            e.printStackTrace();
            close();
            return null;
        } catch (Throwable th) {
            close();
            throw th;
        }
    }

    public ArrayList<ResendMessage> list() {
        return null;
    }

    public void open() {
        this.db = DBHelper.getDBInstance(this.context);
    }

    public void remove(ResendMessage resendMessage) {
    }

    public int update(ResendMessage resendMessage) {
        return 0;
    }
}
