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
   public static String COLLLOG_PATH = "call_log";
   static String TAG = KingKingContentProvider.class.getSimpleName();
   public static final int callLogCode = 1;
   public static final int callLogCodes = 2;
   private static UriMatcher uriMatcher = null;
   private SQLiteDatabase db;
   private DBHelper dbHelper;

   static {
      uriMatcher = new UriMatcher(-1);
      uriMatcher.addURI(AUTHORITY, COLLLOG_PATH, 2);
      uriMatcher.addURI(AUTHORITY, COLLLOG_PATH + "/#", 1);
   }

   public int delete(Uri var1, String var2, String[] var3) {
      this.db = this.dbHelper.getWritableDatabase();
      int var4;
      switch(uriMatcher.match(var1)) {
      case 1:
         long var5 = ContentUris.parseId(var1);
         String var7 = "_id=" + var5;
         if (var2 != null && !"".equals(var2)) {
            (new StringBuilder()).append(var2).append(" and ").append(var7).toString();
         }

         var4 = this.db.delete("call_log", var2, var3);
         break;
      default:
         var4 = -1;
      }

      return var4;
   }

   public String getType(Uri var1) {
      throw new UnsupportedOperationException("Not yet implemented");
   }

   public Uri insert(Uri var1, ContentValues var2) {
      switch(uriMatcher.match(var1)) {
      case 2:
         this.db = this.dbHelper.getWritableDatabase();
         long var3 = this.db.insert("call_log", "_id", var2);
         Uri var5 = Uri.withAppendedPath(var1, "/" + var3);
         Log.i(TAG, "insertUri:" + var5.toString());
         this.getContext().getContentResolver().notifyChange(var1, (ContentObserver)null);
         break;
      default:
         var1 = null;
      }

      return var1;
   }

   public boolean onCreate() {
      this.dbHelper = DBHelper.getInstance(this.getContext());
      boolean var1;
      if (this.dbHelper == null) {
         var1 = false;
      } else {
         var1 = true;
      }

      return var1;
   }

   public Cursor query(Uri var1, String[] var2, String var3, String[] var4, String var5) {
      this.db = this.dbHelper.getReadableDatabase();
      Cursor var9;
      switch(uriMatcher.match(var1)) {
      case 1:
         long var6 = ContentUris.parseId(var1);
         String var8 = "_id=" + var6;
         String var10 = var8;
         if (var3 != null) {
            var10 = var8;
            if (!"".equals(var3)) {
               var10 = var3 + " and " + var8;
            }
         }

         var9 = this.db.query("call_log", var2, var10, var4, (String)null, (String)null, var5);
         break;
      case 2:
         var9 = this.db.query("call_log", var2, var3, var4, (String)null, (String)null, var5);
         break;
      default:
         var9 = null;
      }

      return var9;
   }

   public int update(Uri var1, ContentValues var2, String var3, String[] var4) {
      this.db = this.dbHelper.getWritableDatabase();
      int var5;
      switch(uriMatcher.match(var1)) {
      case 1:
         long var6 = ContentUris.parseId(var1);
         String var8 = "_id=" + var6;
         if (var3 != null && !"".equals(var3)) {
            (new StringBuilder()).append(var3).append(" and ").append(var8).toString();
         }

         var5 = this.db.update("call_log", var2, var3, var4);
         break;
      default:
         var5 = -1;
      }

      return var5;
   }
}
