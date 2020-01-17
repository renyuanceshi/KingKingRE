package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.pccw.database.entity.ResendMessage;
import com.pccw.database.helper.DBHelper;
import java.util.ArrayList;

public class ResendAddQueueDAOImpl implements GenericDAO<ResendMessage, String> {
    int CHATID_COLUMN = 4;
    int ID_COLUMN = 0;
    int LOCALFILEPATH_COLUMN = 2;
    public String LOG_TAG = "ResendMessageDAOImpl";
    int MESSAGEID_COLUMN = 0;
    int MESSAGETYPE_COLUMN = 3;
    int RECIPIENT_COLUMN = 1;
    final String RESEND_VIEW = "resendmediaview";
    protected Context context;
    protected SQLiteDatabase db = null;

    public ResendAddQueueDAOImpl(Context context2) {
        this.context = context2;
    }

    public void add(ResendMessage resendMessage) {
        if (isMessageInQueue(resendMessage.getMessageId())) {
            Log.i(this.LOG_TAG, "Add Message to resend queue duplicated, ignore: msgid=" + resendMessage.getMessageId());
            return;
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("MESSAGEID", Integer.valueOf(resendMessage.getMessageId()));
        contentValues.put("RECIPIENT", resendMessage.getRecipient());
        contentValues.put("LOCALFILEPATH", resendMessage.getLocalfilepath());
        contentValues.put("MESSAGETYPE", resendMessage.getMessagetype());
        contentValues.put("CHATID", Integer.valueOf(resendMessage.getChatid()));
        try {
            open();
            Log.i(this.LOG_TAG, "ResendMessageDAOImpl, add, added ID=" + this.db.insertWithOnConflict(DBHelper.TABLE_RESENDQUEUE, (String) null, contentValues, 4));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void addQueueCursorToResendQueue(Cursor cursor) {
        cursor.moveToFirst();
        if (cursor != null && cursor.getCount() > 0) {
            do {
                add(new ResendMessage(cursor.getInt(this.MESSAGEID_COLUMN), cursor.getString(this.RECIPIENT_COLUMN), cursor.getString(this.LOCALFILEPATH_COLUMN), cursor.getString(this.MESSAGETYPE_COLUMN), cursor.getInt(this.CHATID_COLUMN)));
            } while (cursor.moveToNext());
            cursor.close();
        }
    }

    public void close() {
    }

    /* JADX INFO: finally extract failed */
    public boolean createResendViewFromMessagestore(String str, String str2, int i, int i2) {
        if (!dropCurrentResendView()) {
            return false;
        }
        String str3 = "";
        if (str != null && !str.equals("")) {
            str3 = " AND senttime>='" + str + "'";
        }
        String str4 = "";
        if (str2 != null && !str2.equals("")) {
            str4 = " AND senttime<='" + str2 + "'";
        }
        String str5 = "";
        if (i >= 0) {
            str5 = " AND chatid=" + i;
        }
        String str6 = "";
        if (i2 > 0) {
            str6 = " LIMIT " + i2;
        }
        try {
            this.db.execSQL("CREATE VIEW resendmediaview AS " + "SELECT messageid,recipient,localfilepath,messagetype,chatid FROM messagestore WHERE messagetype!='text' AND sentstatus='failed'" + str3 + str4 + str5 + " ORDER BY messageid ASC" + str6);
            close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            close();
            return false;
        } catch (Throwable th) {
            close();
            throw th;
        }
    }

    public boolean dropCurrentResendView() {
        open();
        try {
            this.db.execSQL("DROP VIEW IF EXISTS resendmediaview");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            close();
        }
    }

    public ResendMessage find(String str) {
        return null;
    }

    public Cursor getResendCursor() {
        Cursor cursor = null;
        open();
        try {
            cursor = this.db.rawQuery("SELECT * FROM resendmediaview", (String[]) null);
            cursor.moveToFirst();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return cursor;
    }

    /* JADX INFO: finally extract failed */
    public boolean isMessageInQueue(int i) {
        open();
        try {
            Cursor rawQuery = this.db.rawQuery("SELECT messageid from resendqueue where messageid=?", new String[]{String.valueOf(i)});
            if (rawQuery == null || rawQuery.getCount() <= 0) {
                rawQuery.close();
                close();
                return false;
            }
            rawQuery.close();
            close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            close();
            return false;
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
