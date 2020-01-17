package com.pccw.database.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import com.pccw.database.entity.GroupInfo;
import com.pccw.database.helper.DBHelper;
import com.pccw.mobile.util.FormatUtil;
import java.util.ArrayList;
import java.util.Date;

public class GroupInfoDAOImpl implements GenericDAO<GroupInfo, String> {
    protected String[] GROUPINFO_TABLE_COLUMN = {"GROUPID", DBHelper.GROUPINFO_KEY_GROUPNAME, DBHelper.GROUPINFO_KEY_CREATEDATE};
    private String LOG_TAG = "GroupInfoDAOImpl";
    protected SQLiteDatabase db = null;
    protected Context mContext;

    public GroupInfoDAOImpl(Context context) {
        this.mContext = context;
    }

    private void addResultToGroupInfoList(ArrayList<GroupInfo> arrayList, Cursor cursor) {
        cursor.moveToFirst();
        while (!cursor.isAfterLast()) {
            try {
                arrayList.add(parseGroupInfo(cursor));
            } catch (Exception e) {
                Log.e(this.LOG_TAG, "GroupInfoDAOImpl, fail to add GroupInfo exception=" + e.toString());
            }
            cursor.moveToNext();
        }
    }

    public void add(GroupInfo groupInfo) {
        ContentValues contentValues = new ContentValues();
        Log.i(this.LOG_TAG, "insert db; from id=" + groupInfo.getGroupId() + " ;group name=" + groupInfo.getGroupName());
        Log.i(this.LOG_TAG, "  Time Save: " + FormatUtil.convertDateToStr(groupInfo.getCreatedate(), "yyyy-MM-dd HH:mm:ss"));
        contentValues.put("GROUPID", groupInfo.getGroupId());
        contentValues.put(DBHelper.GROUPINFO_KEY_GROUPNAME, groupInfo.getGroupName());
        contentValues.put(DBHelper.GROUPINFO_KEY_CREATEDATE, FormatUtil.convertDateToStr(groupInfo.getCreatedate(), "yyyy-MM-dd HH:mm:ss"));
        try {
            open();
            Log.i(this.LOG_TAG, "GroupInfoDAOImpl, add, added groupInfo with ID=" + this.db.insertWithOnConflict(DBHelper.TABLE_GROUPINFO, (String) null, contentValues, 5));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void close() {
    }

    public GroupInfo find(String str) {
        GroupInfo groupInfo;
        Log.v(this.LOG_TAG, "GroupInfo, find, starts");
        try {
            open();
            if (str != null) {
                Cursor query = this.db.query(DBHelper.TABLE_GROUPINFO, this.GROUPINFO_TABLE_COLUMN, "GROUPID=?", new String[]{str}, (String) null, (String) null, (String) null);
                if (query == null || query.getCount() <= 0) {
                    groupInfo = null;
                } else {
                    query.moveToFirst();
                    try {
                        groupInfo = parseGroupInfo(query);
                    } catch (Exception e) {
                        Log.e(this.LOG_TAG, "GroupInfo, find, exception=" + e.toString());
                        groupInfo = null;
                    }
                    try {
                        query.close();
                    } catch (Exception e2) {
                        e = e2;
                        try {
                            Log.e(this.LOG_TAG, "GroupInfo, find, exception=" + e.toString());
                            return groupInfo;
                        } finally {
                            close();
                        }
                    }
                }
            } else {
                Log.e(this.LOG_TAG, "GroupInfo, find, key is null");
                groupInfo = null;
            }
            close();
        } catch (Exception e3) {
            e = e3;
            groupInfo = null;
            Log.e(this.LOG_TAG, "GroupInfo, find, exception=" + e.toString());
            return groupInfo;
        }
        return groupInfo;
    }

    public ArrayList<GroupInfo> list() {
        Log.v(this.LOG_TAG, "GroupInfoDAOImpl, list, starts");
        ArrayList<GroupInfo> arrayList = new ArrayList<>();
        try {
            open();
            Cursor query = this.db.query(DBHelper.TABLE_GROUPINFO, this.GROUPINFO_TABLE_COLUMN, (String) null, (String[]) null, (String) null, (String) null, "GROUPNAME ASC");
            Log.v(this.LOG_TAG, "GroupInfoDAOImpl, list, count=" + query.getCount());
            addResultToGroupInfoList(arrayList, query);
            query.close();
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "GroupInfoDAOImpl, list, exception=" + e.toString());
        } finally {
            close();
        }
        return arrayList;
    }

    public void open() {
        this.db = DBHelper.getDBInstance(this.mContext);
    }

    /* access modifiers changed from: protected */
    public GroupInfo parseGroupInfo(Cursor cursor) {
        return new GroupInfo(cursor.getString(cursor.getColumnIndexOrThrow("GROUPID")), cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.GROUPINFO_KEY_GROUPNAME)), FormatUtil.convertStrToDate(cursor.getString(cursor.getColumnIndexOrThrow(DBHelper.GROUPINFO_KEY_CREATEDATE))));
    }

    public void remove(GroupInfo groupInfo) {
    }

    public void removeByGroupId(String str) {
        try {
            open();
            Log.i(this.LOG_TAG, "GroupInfoDAOImpl, remove, removed number of row=" + this.db.delete(DBHelper.TABLE_GROUPINFO, "GROUPID=?", new String[]{String.valueOf(str)}));
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "GroupInfoDAOImpl, remove, exception=" + e.toString());
        } finally {
            close();
        }
    }

    public int update(GroupInfo groupInfo) {
        return 0;
    }

    public void updateGroupNameAndDate(String str, String str2, Date date) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(DBHelper.GROUPINFO_KEY_GROUPNAME, str2);
        contentValues.put(DBHelper.GROUPINFO_KEY_CREATEDATE, FormatUtil.convertDateToStr(date, "yyyy-MM-dd HH:mm:ss"));
        try {
            open();
            Log.i(this.LOG_TAG, "GroupInfoDAOImpl, updateGroupNameAndDate, updated number of row=" + this.db.update(DBHelper.TABLE_GROUPINFO, contentValues, "GROUPID=?", new String[]{str}));
        } catch (Exception e) {
            Log.e(this.LOG_TAG, "GroupInfoDAOImpl, updateGroupNameAndDate, exception=" + e.toString());
        } finally {
            close();
        }
    }
}
