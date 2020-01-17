package com.pccw.database.helper;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Environment;
import android.util.Log;
import com.pccw.mobile.sip.ClientStateManager;
import com.pccw.sms.bean.SMSConstants;
import com.pccw.sms.util.FileFormatUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.channels.FileChannel;

public class DBHelper extends SQLiteOpenHelper {
    public static final String ALLHISTORY_KEY_CACHED_NAME = "cachedname";
    public static final String ALLHISTORY_KEY_CACHED_NUMBER_LABEL = "cachednumlabel";
    public static final String ALLHISTORY_KEY_CACHED_NUMBER_TYPE = "cachednumtype";
    public static final String ALLHISTORY_KEY_CHATNUMBER = "chatnumber";
    public static final String ALLHISTORY_KEY_CONTACTNUMBER = "contactnumber";
    public static final String ALLHISTORY_KEY_DATE = "calldate";
    public static final String ALLHISTORY_KEY_DURATION = "duration";
    public static final String ALLHISTORY_KEY_ID = "_id";
    public static final String ALLHISTORY_KEY_TYPE = "calltype";
    public static final String CACHED_NAME = "name";
    public static final String CACHED_NUMBER_LABEL = "numberlabel";
    public static final String CACHED_NUMBER_TYPE = "numbertype";
    public static final String CALLLOGTEMP_KEY_CALLDATE = "CALLDATE";
    public static final String CALLLOGTEMP_KEY_CALLID = "CALLID";
    public static final String CALLLOGTEMP_KEY_CALLTYPE = "CALLTYPE";
    public static final String CALLLOGTEMP_KEY_CHATNUMBER = "CHATNUMBER";
    public static final String CALLLOGTEMP_KEY_CONTACTNUMBER = "CONTACTNUMBER";
    public static final String CALLLOGTEMP_KEY_DURATION = "DURATION";
    public static final String CHATLIST_KEY_CHATCONTACT = "CHATCONTACT";
    public static final String CHATLIST_KEY_CHATID = "CHATID";
    public static final String CHATLIST_KEY_MESSAGEID = "MESSAGEID";
    public static final String CHATLOG_KEY_CHATID = "CHATID";
    public static final String CHATLOG_KEY_ISREAD = "ISREAD";
    public static final String CHATLOG_KEY_LOCALFILEPATH = "LOCALFILEPATH";
    public static final String CHATLOG_KEY_MESSAGEID = "MESSAGEID";
    public static final String CHATLOG_KEY_MESSAGETYPE = "MESSAGETYPE";
    public static final String CHATLOG_KEY_RECIPIENT = "RECIPIENT";
    public static final String CHATLOG_KEY_SENDER = "SENDER";
    public static final String CHATLOG_KEY_SENTSTATUS = "SENTSTATUS";
    public static final String CHATLOG_KEY_SENTTIME = "SENTTIME";
    public static final String CHATLOG_KEY_SERVERURIPATH = "SERVERURIPATH";
    public static final String CHATLOG_KEY_TEXTMESSAGE = "TEXTMESSAGE";
    public static final String CHATRECORD_KEY_ID = "id";
    public static final String CHATRECORD_KEY_IMAGE_PATH = "imagePath";
    public static final String CHATRECORD_KEY_LASTMESSAGE = "lastMessage";
    public static final String CHATRECORD_KEY_NAME = "name";
    public static final String CHATRECORD_KEY_lastMessageTime = "lastMessageTime";
    public static final String DATE = "date";
    private static final String DB_NAME = "IM.db";
    private static final int DB_VERSION = 7;
    public static final String DURATION = "duration";
    public static final String GROUPINFO_KEY_CREATEDATE = "CREATEDATE";
    public static final String GROUPINFO_KEY_GROUPID = "GROUPID";
    public static final String GROUPINFO_KEY_GROUPNAME = "GROUPNAME";
    public static final String GROUPMEMBER_KEY_GROUPID = "GROUPID";
    public static final String GROUPMEMBER_KEY_MEMBERID = "MEMBERID";
    public static final String GROUPMEMBER_KEY_MEMBERUSERNAME = "MEMBERUSERNAME";
    public static final String KKSMSTYPE_MSISDN = "msisdn";
    public static final String KKSMSTYPE_SMSTYPE = "smsType";
    public static final String KKSMSTYPE_UPDATETIME = "updateTime";
    public static final String MESSAGESTORE_KEY_CHATID = "CHATID";
    public static final String MESSAGESTORE_KEY_ISREAD = "ISREAD";
    public static final String MESSAGESTORE_KEY_LOCALFILEPATH = "LOCALFILEPATH";
    public static final String MESSAGESTORE_KEY_MESSAGEID = "MESSAGEID";
    public static final String MESSAGESTORE_KEY_MESSAGETYPE = "MESSAGETYPE";
    public static final String MESSAGESTORE_KEY_RECIPIENT = "RECIPIENT";
    public static final String MESSAGESTORE_KEY_SENDER = "SENDER";
    public static final String MESSAGESTORE_KEY_SENTSTATUS = "SENTSTATUS";
    public static final String MESSAGESTORE_KEY_SENTTIME = "SENTTIME";
    public static final String MESSAGESTORE_KEY_SERVERMESSAGEID = "SERVERMESSAGEID";
    public static final String MESSAGESTORE_KEY_SERVERURIPATH = "SERVERURIPATH";
    public static final String MESSAGESTORE_KEY_TEXTMESSAGE = "TEXTMESSAGE";
    public static final String NEW = "new";
    public static final String NUMBER = "number";
    public static final String RESENDQUEUE_KEY_CHATID = "CHATID";
    public static final String RESENDQUEUE_KEY_ID = "_id";
    public static final String RESENDQUEUE_KEY_LOCALFILEPATH = "LOCALFILEPATH";
    public static final String RESENDQUEUE_KEY_MESSAGEID = "MESSAGEID";
    public static final String RESENDQUEUE_KEY_MESSAGETYPE = "MESSAGETYPE";
    public static final String RESENDQUEUE_KEY_RECIPIENT = "RECIPIENT";
    public static final String TABLE_ALLHISTORYTEMP = "allhistorytemp";
    public static final String TABLE_CALLLOGTEMP = "calllogtemp";
    public static final String TABLE_CHATLIST = "chatlist";
    public static final String TABLE_COLLLOG = "call_log";
    public static final String TABLE_GROUPINFO = "groupinfo";
    public static final String TABLE_GROUPMEMBER = "groupmember";
    public static final String TABLE_KKSMSTYPE = "kksmstype";
    public static final String TABLE_MESSAGESTORE = "messagestore";
    public static final String TABLE_RESENDQUEUE = "resendqueue";
    public static final String TABLE_USERINFO = "userinfo";
    static String TAG = DBHelper.class.getSimpleName();
    public static final String TYPE = "type";
    public static final String USERINFO_KEY_NICKNAME = "NICKNAME";
    public static final String USERINFO_KEY_PHOTO = "PHOTO";
    public static final String USERINFO_KEY_USERNAME = "USERNAME";
    public static final String VIEW_ALLHISTORY_COMBINED = "allhistorycombined";
    public static final String VIEW_ALL_CHAT_TEMP = "allchatview";
    public static final String VIEW_CHATLOG = "chatlog";
    public static final String _ID = "_id";
    private static SQLiteDatabase db;
    private static DBHelper dbhelper;
    public String LOG_TAG = "db";
    Context ctx;

    public DBHelper(Context context) {
        super(context, DB_NAME, (SQLiteDatabase.CursorFactory) null, 7);
        this.ctx = context;
    }

    public static void deleteWholeDatabase(Context context) {
        context.deleteDatabase(DB_NAME);
    }

    public static SQLiteDatabase getDBInstance(Context context) {
        SQLiteDatabase sQLiteDatabase;
        synchronized (DBHelper.class) {
            try {
                if (db == null || !db.isOpen() || !db.isDbLockedByCurrentThread()) {
                    db = getInstance(context).getWritableDatabase();
                }
                sQLiteDatabase = db;
            } catch (Throwable th) {
                Class<DBHelper> cls = DBHelper.class;
                throw th;
            }
        }
        return sQLiteDatabase;
    }

    public static DBHelper getInstance(Context context) {
        DBHelper dBHelper;
        synchronized (DBHelper.class) {
            try {
                if (dbhelper == null) {
                    dbhelper = new DBHelper(context);
                }
                dBHelper = dbhelper;
            } catch (Throwable th) {
                Class<DBHelper> cls = DBHelper.class;
                throw th;
            }
        }
        return dBHelper;
    }

    public static void saveDatabaseToSdcard() {
        try {
            File file = new File(SMSConstants.EXTRACTED_DB_FILEPATH());
            File dataDirectory = Environment.getDataDirectory();
            if (file.canWrite()) {
                File file2 = new File(dataDirectory, "/data/com.pccw.mobile.sip02/databases/IM.db");
                File file3 = new File(file, FileFormatUtil.getExtractDbFileName(7) + ".db");
                if (file2.exists()) {
                    FileChannel channel = new FileInputStream(file2).getChannel();
                    FileChannel channel2 = new FileOutputStream(file3).getChannel();
                    channel2.transferFrom(channel, 0, channel.size());
                    channel.close();
                    channel2.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        if (ClientStateManager.isSupportSMS(this.ctx)) {
            Log.v(this.LOG_TAG, "DBHelper, onCreate, starts");
            sQLiteDatabase.execSQL("CREATE TABLE messagestore(MESSAGEID INTEGER PRIMARY KEY AUTOINCREMENT,SENDER TEXT NOT NULL,RECIPIENT TEXT NOT NULL,TEXTMESSAGE TEXT NOT NULL,SENTTIME DATETIME default CURRENT_TIMESTAMP,SENTSTATUS TEXT NOT NULL,ISREAD TEXT NOT NULL,LOCALFILEPATH TEXT NOT NULL,SERVERURIPATH TEXT NOT NULL,MESSAGETYPE TEXT NOT NULL,CHATID INTEGER NOT NULL,SERVERMESSAGEID TEXT)");
            sQLiteDatabase.execSQL("CREATE TABLE userinfo(USERNAME TEXT PRIMARY KEY,NICKNAME TEXT NOT NULL,PHOTO TEXT)");
            sQLiteDatabase.execSQL("CREATE TABLE chatlist(CHATID INTEGER PRIMARY KEY AUTOINCREMENT,CHATCONTACT TEXT NOT NULL,MESSAGEID INTEGER)");
            sQLiteDatabase.execSQL("CREATE TABLE groupinfo(GROUPID TEXT PRIMARY KEY , GROUPNAME TEXT NOT NULL , CREATEDATE DATETIME default CURRENT_DATE)");
            sQLiteDatabase.execSQL("CREATE TABLE groupmember(MEMBERID INTEGER PRIMARY KEY AUTOINCREMENT, GROUPID TEXT NOT NULL , MEMBERUSERNAME TEXT NOT NULL )");
            sQLiteDatabase.execSQL("CREATE TABLE calllogtemp(CALLID INTEGER PRIMARY KEY AUTOINCREMENT, CHATNUMBER TEXT , CALLTYPE TEXT NOT NULL, CALLDATE DATETIME NOT NULL , DURATION TEXT , CONTACTNUMBER TEXT NOT NULL )");
            sQLiteDatabase.execSQL("CREATE TABLE allhistorytemp(_id INTEGER PRIMARY KEY AUTOINCREMENT, chatnumber TEXT , calltype INTEGER , calldate DATETIME NOT NULL , duration INTEGER , cachedname TEXT , cachednumtype INTEGER , cachednumlabel TEXT , contactnumber TEXT NOT NULL )");
            sQLiteDatabase.execSQL("CREATE TABLE resendqueue(_id INTEGER PRIMARY KEY AUTOINCREMENT , MESSAGEID INTEGER , RECIPIENT TEXT , LOCALFILEPATH TEXT , MESSAGETYPE TEXT , CHATID INTEGER )");
            sQLiteDatabase.execSQL("CREATE TABLE kksmstype(msisdn TEXT NOT NULL,smsType TEXT NOT NULL,updateTime TEXT NOT NULL)");
            Log.i(this.LOG_TAG, "DBHelper onCreate completed");
        }
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS call_log(_id INTEGER PRIMARY KEY AUTOINCREMENT,number TEXT NOT NULL,date INTEGER NOT NULL,duration INTEGER NOT NULL,type INTEGER NOT NULL,new INTEGER NOT NULL,name TEXT NOT NULL,numbertype INTEGER NOT NULL,numberlabel TEXT NOT NULL)");
    }

    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        Log.w(this.LOG_TAG, "DBHelper onUpgrade oldVerions=" + i + " newVersion=" + i2);
        sQLiteDatabase.beginTransaction();
        for (int i3 = i + 1; i3 <= i2; i3++) {
            switch (i3) {
                case 2:
                    try {
                        upgradeToVersion2(sQLiteDatabase);
                        break;
                    } catch (Exception e) {
                        e.printStackTrace();
                        Log.w(this.LOG_TAG, "DBHelper onUpgrade failed");
                        sQLiteDatabase.endTransaction();
                        return;
                    } catch (Throwable th) {
                        sQLiteDatabase.endTransaction();
                        throw th;
                    }
                case 7:
                    upgradeToVersion7(sQLiteDatabase);
                    break;
            }
        }
        sQLiteDatabase.setTransactionSuccessful();
        Log.w(this.LOG_TAG, "DBHelper onUpgrade success");
        sQLiteDatabase.endTransaction();
    }

    public void upgradeToVersion2(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS messagestore(MESSAGEID INTEGER PRIMARY KEY AUTOINCREMENT,SENDER TEXT NOT NULL,RECIPIENT TEXT NOT NULL,TEXTMESSAGE TEXT NOT NULL,SENTTIME DATETIME default CURRENT_TIMESTAMP,SENTSTATUS TEXT NOT NULL,ISREAD TEXT NOT NULL,LOCALFILEPATH TEXT NOT NULL,SERVERURIPATH TEXT NOT NULL,MESSAGETYPE TEXT NOT NULL,CHATID INTEGER NOT NULL,SERVERMESSAGEID TEXT)");
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS userinfo(USERNAME TEXT PRIMARY KEY,NICKNAME TEXT,PHOTO TEXT)");
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS chatlist(CHATID INTEGER PRIMARY KEY AUTOINCREMENT,CHATCONTACT TEXT NOT NULL,MESSAGEID INTEGER)");
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS groupinfo(GROUPID TEXT PRIMARY KEY , GROUPNAME TEXT NOT NULL , CREATEDATE DATETIME default CURRENT_DATE)");
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS groupmember(MEMBERID INTEGER PRIMARY KEY AUTOINCREMENT, GROUPID TEXT NOT NULL , MEMBERUSERNAME TEXT NOT NULL )");
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS calllogtemp(CALLID INTEGER PRIMARY KEY AUTOINCREMENT, CHATNUMBER TEXT , CALLTYPE TEXT NOT NULL, CALLDATE DATETIME NOT NULL , DURATION TEXT , CONTACTNUMBER TEXT NOT NULL )");
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS allhistorytemp(_id INTEGER PRIMARY KEY AUTOINCREMENT, chatnumber TEXT , calltype INTEGER , calldate DATETIME NOT NULL , duration INTEGER , cachedname TEXT , cachednumtype INTEGER , cachednumlabel TEXT , contactnumber TEXT NOT NULL )");
        sQLiteDatabase.execSQL("CREATE TABLE kksmstype(msisdn TEXT NOT NULL,smsType TEXT NOT NULL,updateTime TEXT NOT NULL)");
    }

    public void upgradeToVersion7(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS call_log(_id INTEGER PRIMARY KEY AUTOINCREMENT,number TEXT NOT NULL,date INTEGER NOT NULL,duration INTEGER NOT NULL,type INTEGER NOT NULL,new INTEGER NOT NULL,name TEXT NOT NULL,numbertype INTEGER NOT NULL,numberlabel TEXT NOT NULL)");
        Log.d(TAG, "create call log table successful");
    }
}
