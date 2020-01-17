package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.pccw.database.entity.KKSMSType;
import com.pccw.database.helper.DBHelper;
import java.util.ArrayList;

public class KKSMSTypeDAOImpl implements GenericDAO<KKSMSType, String> {
    protected String[] KKSMSTYPE_TABLE_COLUMNS = {"msisdn", DBHelper.KKSMSTYPE_SMSTYPE, DBHelper.KKSMSTYPE_UPDATETIME};
    public String LOG_TAG = "KKSMSTypeImpl";
    protected SQLiteDatabase db = null;
    protected Context mContext;

    public KKSMSTypeDAOImpl() {
    }

    public KKSMSTypeDAOImpl(Context context) {
        this.mContext = context;
    }

    public void add(KKSMSType kKSMSType) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("msisdn", kKSMSType.getMsisdn());
        contentValues.put(DBHelper.KKSMSTYPE_SMSTYPE, kKSMSType.getSmsType());
        contentValues.put(DBHelper.KKSMSTYPE_UPDATETIME, kKSMSType.getUpdateTime());
        try {
            open();
            Log.i(this.LOG_TAG, "KKSMSTypeImpl, add, added ID=" + this.db.insert(DBHelper.TABLE_KKSMSTYPE, (String) null, contentValues));
        } catch (Exception e) {
        } finally {
            close();
        }
    }

    public void close() {
    }

    public KKSMSType find(String str) {
        KKSMSType kKSMSType = null;
        KKSMSType kKSMSType2 = new KKSMSType();
        String str2 = "SELECT * FROM kksmstype where msisdn = '" + str + "'";
        try {
            open();
            Cursor rawQuery = this.db.rawQuery(str2, (String[]) null);
            if (rawQuery.getCount() == 0) {
                close();
            } else {
                rawQuery.moveToFirst();
                kKSMSType = parseModel(rawQuery);
                try {
                    rawQuery.close();
                    close();
                } catch (Exception e) {
                    e = e;
                    try {
                        Log.e(this.LOG_TAG, "KKSMSTypeImpl, listKKSMSTypeWithmsisdn, exception=" + e.toString());
                        return kKSMSType;
                    } finally {
                        close();
                    }
                }
            }
        } catch (Exception e2) {
            e = e2;
            kKSMSType = kKSMSType2;
        }
        return kKSMSType;
    }

    /* JADX INFO: finally extract failed */
    public ArrayList<KKSMSType> list() {
        ArrayList<KKSMSType> arrayList = new ArrayList<>();
        Log.d(this.LOG_TAG, "KKSMSTypeImpl, query=" + "SELECT * FROM kksmstype");
        try {
            open();
            Cursor rawQuery = this.db.rawQuery("SELECT * FROM kksmstype", (String[]) null);
            if (rawQuery.getCount() == 0) {
                close();
                return null;
            }
            rawQuery.moveToFirst();
            Log.v(this.LOG_TAG, "KKSMSTypeImpl, list, count=" + rawQuery.getCount());
            while (!rawQuery.isAfterLast()) {
                try {
                    arrayList.add(parseModel(rawQuery));
                } catch (Exception e) {
                    Log.e(this.LOG_TAG, "list, fail to add exception=" + e.toString());
                }
                rawQuery.moveToNext();
            }
            rawQuery.close();
            close();
            return arrayList;
        } catch (Exception e2) {
            Log.e(this.LOG_TAG, "KKSMSTypeImpl, listKKSMSTypeWithmsisdn, exception=" + e2.toString());
            close();
            return arrayList;
        } catch (Throwable th) {
            close();
            throw th;
        }
    }

    public void open() {
        this.db = DBHelper.getDBInstance(this.mContext);
    }

    /* access modifiers changed from: protected */
    public KKSMSType parseModel(Cursor cursor) {
        Log.v(this.LOG_TAG, "KKSMSTypeImpl started");
        return new KKSMSType(cursor.getString(cursor.getColumnIndexOrThrow("msisdn")), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.KKSMSTYPE_SMSTYPE)), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.KKSMSTYPE_UPDATETIME)));
    }

    public void remove(KKSMSType kKSMSType) {
    }

    public int update(KKSMSType kKSMSType) {
        int i = 0;
        ContentValues contentValues = new ContentValues();
        contentValues.put("msisdn", kKSMSType.getMsisdn());
        contentValues.put(DBHelper.KKSMSTYPE_SMSTYPE, kKSMSType.getSmsType());
        contentValues.put(DBHelper.KKSMSTYPE_UPDATETIME, kKSMSType.getUpdateTime());
        try {
            open();
            i = this.db.update(DBHelper.TABLE_KKSMSTYPE, contentValues, "msisdn=?", new String[]{kKSMSType.getMsisdn()});
            Log.i(this.LOG_TAG, "KKSMSTypeImpl, update, updated number of row=" + i);
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "KKSMSTypeImpl, update, exception=" + e.toString());
        } finally {
            close();
        }
        return i;
    }
}
