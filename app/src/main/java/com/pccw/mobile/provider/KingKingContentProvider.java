package com.pccw.mobile.provider;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.util.Log;
import com.pccw.database.helper.DBHelper;

public class KingKingContentProvider extends ContentProvider {
    public static String AUTHORITY = "kingking";
    public static final Uri CALL_LOG_URI = Uri.parse("content://kingking/call_log");
    public static String COLLLOG_PATH = DBHelper.TABLE_COLLLOG;
    static String TAG = KingKingContentProvider.class.getSimpleName();
    public static final int callLogCode = 1;
    public static final int callLogCodes = 2;
    private static UriMatcher uriMatcher;
    private SQLiteDatabase db;
    private DBHelper dbHelper;

    static {
        uriMatcher = null;
        uriMatcher = new UriMatcher(-1);
        uriMatcher.addURI(AUTHORITY, COLLLOG_PATH, 2);
        uriMatcher.addURI(AUTHORITY, COLLLOG_PATH + "/#", 1);
    }

    public int delete(Uri uri, String str, String[] strArr) {
        this.db = this.dbHelper.getWritableDatabase();
        switch (uriMatcher.match(uri)) {
            case 1:
                String str2 = "_id=" + ContentUris.parseId(uri);
                if (str != null && !"".equals(str)) {
                    str + " and " + str2;
                }
                return this.db.delete(DBHelper.TABLE_COLLLOG, str, strArr);
            default:
                return -1;
        }
    }

    public String getType(Uri uri) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    public Uri insert(Uri uri, ContentValues contentValues) {
        switch (uriMatcher.match(uri)) {
            case 2:
                this.db = this.dbHelper.getWritableDatabase();
                Log.i(TAG, "insertUri:" + Uri.withAppendedPath(uri, "/" + this.db.insert(DBHelper.TABLE_COLLLOG, "_id", contentValues)).toString());
                getContext().getContentResolver().notifyChange(uri, (ContentObserver) null);
                return uri;
            default:
                return null;
        }
    }

    public boolean onCreate() {
        this.dbHelper = DBHelper.getInstance(getContext());
        return this.dbHelper != null;
    }

    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        this.db = this.dbHelper.getReadableDatabase();
        switch (uriMatcher.match(uri)) {
            case 1:
                String str3 = "_id=" + ContentUris.parseId(uri);
                if (str != null && !"".equals(str)) {
                    str3 = str + " and " + str3;
                }
                return this.db.query(DBHelper.TABLE_COLLLOG, strArr, str3, strArr2, (String) null, (String) null, str2);
            case 2:
                return this.db.query(DBHelper.TABLE_COLLLOG, strArr, str, strArr2, (String) null, (String) null, str2);
            default:
                return null;
        }
    }

    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        this.db = this.dbHelper.getWritableDatabase();
        switch (uriMatcher.match(uri)) {
            case 1:
                String str2 = "_id=" + ContentUris.parseId(uri);
                if (str != null && !"".equals(str)) {
                    str + " and " + str2;
                }
                return this.db.update(DBHelper.TABLE_COLLLOG, contentValues, str, strArr);
            default:
                return -1;
        }
    }
}
