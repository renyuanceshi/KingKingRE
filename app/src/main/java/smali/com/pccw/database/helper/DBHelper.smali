.class public Lcom/pccw/database/helper/DBHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DBHelper.java"


# static fields
.field public static final ALLHISTORY_KEY_CACHED_NAME:Ljava/lang/String; = "cachedname"

.field public static final ALLHISTORY_KEY_CACHED_NUMBER_LABEL:Ljava/lang/String; = "cachednumlabel"

.field public static final ALLHISTORY_KEY_CACHED_NUMBER_TYPE:Ljava/lang/String; = "cachednumtype"

.field public static final ALLHISTORY_KEY_CHATNUMBER:Ljava/lang/String; = "chatnumber"

.field public static final ALLHISTORY_KEY_CONTACTNUMBER:Ljava/lang/String; = "contactnumber"

.field public static final ALLHISTORY_KEY_DATE:Ljava/lang/String; = "calldate"

.field public static final ALLHISTORY_KEY_DURATION:Ljava/lang/String; = "duration"

.field public static final ALLHISTORY_KEY_ID:Ljava/lang/String; = "_id"

.field public static final ALLHISTORY_KEY_TYPE:Ljava/lang/String; = "calltype"

.field public static final CACHED_NAME:Ljava/lang/String; = "name"

.field public static final CACHED_NUMBER_LABEL:Ljava/lang/String; = "numberlabel"

.field public static final CACHED_NUMBER_TYPE:Ljava/lang/String; = "numbertype"

.field public static final CALLLOGTEMP_KEY_CALLDATE:Ljava/lang/String; = "CALLDATE"

.field public static final CALLLOGTEMP_KEY_CALLID:Ljava/lang/String; = "CALLID"

.field public static final CALLLOGTEMP_KEY_CALLTYPE:Ljava/lang/String; = "CALLTYPE"

.field public static final CALLLOGTEMP_KEY_CHATNUMBER:Ljava/lang/String; = "CHATNUMBER"

.field public static final CALLLOGTEMP_KEY_CONTACTNUMBER:Ljava/lang/String; = "CONTACTNUMBER"

.field public static final CALLLOGTEMP_KEY_DURATION:Ljava/lang/String; = "DURATION"

.field public static final CHATLIST_KEY_CHATCONTACT:Ljava/lang/String; = "CHATCONTACT"

.field public static final CHATLIST_KEY_CHATID:Ljava/lang/String; = "CHATID"

.field public static final CHATLIST_KEY_MESSAGEID:Ljava/lang/String; = "MESSAGEID"

.field public static final CHATLOG_KEY_CHATID:Ljava/lang/String; = "CHATID"

.field public static final CHATLOG_KEY_ISREAD:Ljava/lang/String; = "ISREAD"

.field public static final CHATLOG_KEY_LOCALFILEPATH:Ljava/lang/String; = "LOCALFILEPATH"

.field public static final CHATLOG_KEY_MESSAGEID:Ljava/lang/String; = "MESSAGEID"

.field public static final CHATLOG_KEY_MESSAGETYPE:Ljava/lang/String; = "MESSAGETYPE"

.field public static final CHATLOG_KEY_RECIPIENT:Ljava/lang/String; = "RECIPIENT"

.field public static final CHATLOG_KEY_SENDER:Ljava/lang/String; = "SENDER"

.field public static final CHATLOG_KEY_SENTSTATUS:Ljava/lang/String; = "SENTSTATUS"

.field public static final CHATLOG_KEY_SENTTIME:Ljava/lang/String; = "SENTTIME"

.field public static final CHATLOG_KEY_SERVERURIPATH:Ljava/lang/String; = "SERVERURIPATH"

.field public static final CHATLOG_KEY_TEXTMESSAGE:Ljava/lang/String; = "TEXTMESSAGE"

.field public static final CHATRECORD_KEY_ID:Ljava/lang/String; = "id"

.field public static final CHATRECORD_KEY_IMAGE_PATH:Ljava/lang/String; = "imagePath"

.field public static final CHATRECORD_KEY_LASTMESSAGE:Ljava/lang/String; = "lastMessage"

.field public static final CHATRECORD_KEY_NAME:Ljava/lang/String; = "name"

.field public static final CHATRECORD_KEY_lastMessageTime:Ljava/lang/String; = "lastMessageTime"

.field public static final DATE:Ljava/lang/String; = "date"

.field private static final DB_NAME:Ljava/lang/String; = "IM.db"

.field private static final DB_VERSION:I = 0x7

.field public static final DURATION:Ljava/lang/String; = "duration"

.field public static final GROUPINFO_KEY_CREATEDATE:Ljava/lang/String; = "CREATEDATE"

.field public static final GROUPINFO_KEY_GROUPID:Ljava/lang/String; = "GROUPID"

.field public static final GROUPINFO_KEY_GROUPNAME:Ljava/lang/String; = "GROUPNAME"

.field public static final GROUPMEMBER_KEY_GROUPID:Ljava/lang/String; = "GROUPID"

.field public static final GROUPMEMBER_KEY_MEMBERID:Ljava/lang/String; = "MEMBERID"

.field public static final GROUPMEMBER_KEY_MEMBERUSERNAME:Ljava/lang/String; = "MEMBERUSERNAME"

.field public static final KKSMSTYPE_MSISDN:Ljava/lang/String; = "msisdn"

.field public static final KKSMSTYPE_SMSTYPE:Ljava/lang/String; = "smsType"

.field public static final KKSMSTYPE_UPDATETIME:Ljava/lang/String; = "updateTime"

.field public static final MESSAGESTORE_KEY_CHATID:Ljava/lang/String; = "CHATID"

.field public static final MESSAGESTORE_KEY_ISREAD:Ljava/lang/String; = "ISREAD"

.field public static final MESSAGESTORE_KEY_LOCALFILEPATH:Ljava/lang/String; = "LOCALFILEPATH"

.field public static final MESSAGESTORE_KEY_MESSAGEID:Ljava/lang/String; = "MESSAGEID"

.field public static final MESSAGESTORE_KEY_MESSAGETYPE:Ljava/lang/String; = "MESSAGETYPE"

.field public static final MESSAGESTORE_KEY_RECIPIENT:Ljava/lang/String; = "RECIPIENT"

.field public static final MESSAGESTORE_KEY_SENDER:Ljava/lang/String; = "SENDER"

.field public static final MESSAGESTORE_KEY_SENTSTATUS:Ljava/lang/String; = "SENTSTATUS"

.field public static final MESSAGESTORE_KEY_SENTTIME:Ljava/lang/String; = "SENTTIME"

.field public static final MESSAGESTORE_KEY_SERVERMESSAGEID:Ljava/lang/String; = "SERVERMESSAGEID"

.field public static final MESSAGESTORE_KEY_SERVERURIPATH:Ljava/lang/String; = "SERVERURIPATH"

.field public static final MESSAGESTORE_KEY_TEXTMESSAGE:Ljava/lang/String; = "TEXTMESSAGE"

.field public static final NEW:Ljava/lang/String; = "new"

.field public static final NUMBER:Ljava/lang/String; = "number"

.field public static final RESENDQUEUE_KEY_CHATID:Ljava/lang/String; = "CHATID"

.field public static final RESENDQUEUE_KEY_ID:Ljava/lang/String; = "_id"

.field public static final RESENDQUEUE_KEY_LOCALFILEPATH:Ljava/lang/String; = "LOCALFILEPATH"

.field public static final RESENDQUEUE_KEY_MESSAGEID:Ljava/lang/String; = "MESSAGEID"

.field public static final RESENDQUEUE_KEY_MESSAGETYPE:Ljava/lang/String; = "MESSAGETYPE"

.field public static final RESENDQUEUE_KEY_RECIPIENT:Ljava/lang/String; = "RECIPIENT"

.field public static final TABLE_ALLHISTORYTEMP:Ljava/lang/String; = "allhistorytemp"

.field public static final TABLE_CALLLOGTEMP:Ljava/lang/String; = "calllogtemp"

.field public static final TABLE_CHATLIST:Ljava/lang/String; = "chatlist"

.field public static final TABLE_COLLLOG:Ljava/lang/String; = "call_log"

.field public static final TABLE_GROUPINFO:Ljava/lang/String; = "groupinfo"

.field public static final TABLE_GROUPMEMBER:Ljava/lang/String; = "groupmember"

.field public static final TABLE_KKSMSTYPE:Ljava/lang/String; = "kksmstype"

.field public static final TABLE_MESSAGESTORE:Ljava/lang/String; = "messagestore"

.field public static final TABLE_RESENDQUEUE:Ljava/lang/String; = "resendqueue"

.field public static final TABLE_USERINFO:Ljava/lang/String; = "userinfo"

.field static TAG:Ljava/lang/String; = null

.field public static final TYPE:Ljava/lang/String; = "type"

.field public static final USERINFO_KEY_NICKNAME:Ljava/lang/String; = "NICKNAME"

.field public static final USERINFO_KEY_PHOTO:Ljava/lang/String; = "PHOTO"

.field public static final USERINFO_KEY_USERNAME:Ljava/lang/String; = "USERNAME"

.field public static final VIEW_ALLHISTORY_COMBINED:Ljava/lang/String; = "allhistorycombined"

.field public static final VIEW_ALL_CHAT_TEMP:Ljava/lang/String; = "allchatview"

.field public static final VIEW_CHATLOG:Ljava/lang/String; = "chatlog"

.field public static final _ID:Ljava/lang/String; = "_id"

.field private static db:Landroid/database/sqlite/SQLiteDatabase;

.field private static dbhelper:Lcom/pccw/database/helper/DBHelper;


# instance fields
.field public LOG_TAG:Ljava/lang/String;

.field ctx:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/pccw/database/helper/DBHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/pccw/database/helper/DBHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 147
    const-string/jumbo v0, "IM.db"

    const/4 v1, 0x0

    const/4 v2, 0x7

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 22
    const-string/jumbo v0, "db"

    iput-object v0, p0, Lcom/pccw/database/helper/DBHelper;->LOG_TAG:Ljava/lang/String;

    .line 148
    iput-object p1, p0, Lcom/pccw/database/helper/DBHelper;->ctx:Landroid/content/Context;

    .line 150
    return-void
.end method

.method public static deleteWholeDatabase(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 445
    const-string/jumbo v0, "IM.db"

    invoke-virtual {p0, v0}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 446
    return-void
.end method

.method public static declared-synchronized getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 165
    const-class v1, Lcom/pccw/database/helper/DBHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/pccw/database/helper/DBHelper;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/pccw/database/helper/DBHelper;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/pccw/database/helper/DBHelper;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isDbLockedByCurrentThread()Z

    move-result v0

    if-nez v0, :cond_1

    .line 166
    :cond_0
    invoke-static {p0}, Lcom/pccw/database/helper/DBHelper;->getInstance(Landroid/content/Context;)Lcom/pccw/database/helper/DBHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/database/helper/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sput-object v0, Lcom/pccw/database/helper/DBHelper;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 168
    :cond_1
    sget-object v0, Lcom/pccw/database/helper/DBHelper;->db:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 165
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/pccw/database/helper/DBHelper;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 156
    const-class v1, Lcom/pccw/database/helper/DBHelper;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/pccw/database/helper/DBHelper;->dbhelper:Lcom/pccw/database/helper/DBHelper;

    if-nez v0, :cond_0

    .line 157
    new-instance v0, Lcom/pccw/database/helper/DBHelper;

    invoke-direct {v0, p0}, Lcom/pccw/database/helper/DBHelper;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/pccw/database/helper/DBHelper;->dbhelper:Lcom/pccw/database/helper/DBHelper;

    .line 159
    :cond_0
    sget-object v0, Lcom/pccw/database/helper/DBHelper;->dbhelper:Lcom/pccw/database/helper/DBHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 156
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static saveDatabaseToSdcard()V
    .locals 13

    .prologue
    .line 322
    :try_start_0
    new-instance v12, Ljava/io/File;

    invoke-static {}, Lcom/pccw/sms/bean/SMSConstants;->EXTRACTED_DB_FILEPATH()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v12, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 323
    .local v12, "sd":Ljava/io/File;
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v10

    .line 325
    .local v10, "data":Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 326
    const-string/jumbo v9, "/data/com.pccw.mobile.sip02/databases/IM.db"

    .line 327
    .local v9, "currentDBPath":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x7

    invoke-static {v3}, Lcom/pccw/sms/util/FileFormatUtil;->getExtractDbFileName(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".db"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 328
    .local v7, "backupDBPath":Ljava/lang/String;
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v10, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 329
    .local v8, "currentDB":Ljava/io/File;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v12, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 331
    .local v6, "backupDB":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 332
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 333
    .local v1, "src":Ljava/nio/channels/FileChannel;
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 334
    .local v0, "dst":Ljava/nio/channels/FileChannel;
    const-wide/16 v2, 0x0

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J

    .line 335
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 336
    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 342
    .end local v0    # "dst":Ljava/nio/channels/FileChannel;
    .end local v1    # "src":Ljava/nio/channels/FileChannel;
    .end local v6    # "backupDB":Ljava/io/File;
    .end local v7    # "backupDBPath":Ljava/lang/String;
    .end local v8    # "currentDB":Ljava/io/File;
    .end local v9    # "currentDBPath":Ljava/lang/String;
    .end local v10    # "data":Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 339
    :catch_0
    move-exception v11

    .line 340
    .local v11, "e":Ljava/lang/Exception;
    invoke-virtual {v11}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 13
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 173
    iget-object v11, p0, Lcom/pccw/database/helper/DBHelper;->ctx:Landroid/content/Context;

    invoke-static {v11}, Lcom/pccw/mobile/sip/ClientStateManager;->isSupportSMS(Landroid/content/Context;)Z

    move-result v10

    .line 174
    .local v10, "supportSMSFlag":Z
    if-eqz v10, :cond_0

    .line 175
    iget-object v11, p0, Lcom/pccw/database/helper/DBHelper;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v12, "DBHelper, onCreate, starts"

    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    const-string/jumbo v7, "CREATE TABLE messagestore(MESSAGEID INTEGER PRIMARY KEY AUTOINCREMENT,SENDER TEXT NOT NULL,RECIPIENT TEXT NOT NULL,TEXTMESSAGE TEXT NOT NULL,SENTTIME DATETIME default CURRENT_TIMESTAMP,SENTSTATUS TEXT NOT NULL,ISREAD TEXT NOT NULL,LOCALFILEPATH TEXT NOT NULL,SERVERURIPATH TEXT NOT NULL,MESSAGETYPE TEXT NOT NULL,CHATID INTEGER NOT NULL,SERVERMESSAGEID TEXT)"

    .line 191
    .local v7, "create_table_messagestore":Ljava/lang/String;
    invoke-virtual {p1, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 193
    const-string/jumbo v9, "CREATE TABLE userinfo(USERNAME TEXT PRIMARY KEY,NICKNAME TEXT NOT NULL,PHOTO TEXT)"

    .line 198
    .local v9, "create_table_userinfo":Ljava/lang/String;
    invoke-virtual {p1, v9}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 200
    const-string/jumbo v3, "CREATE TABLE chatlist(CHATID INTEGER PRIMARY KEY AUTOINCREMENT,CHATCONTACT TEXT NOT NULL,MESSAGEID INTEGER)"

    .line 206
    .local v3, "create_table_chatlist":Ljava/lang/String;
    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 208
    const-string/jumbo v4, "CREATE TABLE groupinfo(GROUPID TEXT PRIMARY KEY , GROUPNAME TEXT NOT NULL , CREATEDATE DATETIME default CURRENT_DATE)"

    .line 213
    .local v4, "create_table_groupInfo":Ljava/lang/String;
    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 215
    const-string/jumbo v5, "CREATE TABLE groupmember(MEMBERID INTEGER PRIMARY KEY AUTOINCREMENT, GROUPID TEXT NOT NULL , MEMBERUSERNAME TEXT NOT NULL )"

    .line 220
    .local v5, "create_table_groupMember":Ljava/lang/String;
    invoke-virtual {p1, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 223
    const-string/jumbo v2, "CREATE TABLE calllogtemp(CALLID INTEGER PRIMARY KEY AUTOINCREMENT, CHATNUMBER TEXT , CALLTYPE TEXT NOT NULL, CALLDATE DATETIME NOT NULL , DURATION TEXT , CONTACTNUMBER TEXT NOT NULL )"

    .line 231
    .local v2, "create_table_callLogTemp":Ljava/lang/String;
    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 233
    const-string/jumbo v1, "CREATE TABLE allhistorytemp(_id INTEGER PRIMARY KEY AUTOINCREMENT, chatnumber TEXT , calltype INTEGER , calldate DATETIME NOT NULL , duration INTEGER , cachedname TEXT , cachednumtype INTEGER , cachednumlabel TEXT , contactnumber TEXT NOT NULL )"

    .line 245
    .local v1, "create_table_allHistoryTemp":Ljava/lang/String;
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 247
    const-string/jumbo v8, "CREATE TABLE resendqueue(_id INTEGER PRIMARY KEY AUTOINCREMENT , MESSAGEID INTEGER , RECIPIENT TEXT , LOCALFILEPATH TEXT , MESSAGETYPE TEXT , CHATID INTEGER )"

    .line 256
    .local v8, "create_table_resendqueue":Ljava/lang/String;
    invoke-virtual {p1, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 258
    const-string/jumbo v6, "CREATE TABLE kksmstype(msisdn TEXT NOT NULL,smsType TEXT NOT NULL,updateTime TEXT NOT NULL)"

    .line 262
    .local v6, "create_table_kksmstype":Ljava/lang/String;
    invoke-virtual {p1, v6}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 264
    iget-object v11, p0, Lcom/pccw/database/helper/DBHelper;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v12, "DBHelper onCreate completed"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    .end local v1    # "create_table_allHistoryTemp":Ljava/lang/String;
    .end local v2    # "create_table_callLogTemp":Ljava/lang/String;
    .end local v3    # "create_table_chatlist":Ljava/lang/String;
    .end local v4    # "create_table_groupInfo":Ljava/lang/String;
    .end local v5    # "create_table_groupMember":Ljava/lang/String;
    .end local v6    # "create_table_kksmstype":Ljava/lang/String;
    .end local v7    # "create_table_messagestore":Ljava/lang/String;
    .end local v8    # "create_table_resendqueue":Ljava/lang/String;
    .end local v9    # "create_table_userinfo":Ljava/lang/String;
    :cond_0
    const-string/jumbo v0, "CREATE TABLE IF NOT EXISTS call_log(_id INTEGER PRIMARY KEY AUTOINCREMENT,number TEXT NOT NULL,date INTEGER NOT NULL,duration INTEGER NOT NULL,type INTEGER NOT NULL,new INTEGER NOT NULL,name TEXT NOT NULL,numbertype INTEGER NOT NULL,numberlabel TEXT NOT NULL)"

    .line 277
    .local v0, "create_call_log_table_sql":Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 278
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 5
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 282
    iget-object v2, p0, Lcom/pccw/database/helper/DBHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "DBHelper onUpgrade oldVerions="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " newVersion="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 286
    add-int/lit8 v1, p2, 0x1

    .line 287
    .local v1, "upgradeTo":I
    :goto_0
    if-gt v1, p3, :cond_0

    .line 288
    sparse-switch v1, :sswitch_data_0

    .line 297
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 290
    :sswitch_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/pccw/database/helper/DBHelper;->upgradeToVersion2(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 301
    :catch_0
    move-exception v0

    .line 302
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 303
    iget-object v2, p0, Lcom/pccw/database/helper/DBHelper;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "DBHelper onUpgrade failed"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 305
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 307
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 294
    :sswitch_1
    :try_start_2
    invoke-virtual {p0, p1}, Lcom/pccw/database/helper/DBHelper;->upgradeToVersion7(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 305
    :catchall_0
    move-exception v2

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v2

    .line 299
    :cond_0
    :try_start_3
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 300
    iget-object v2, p0, Lcom/pccw/database/helper/DBHelper;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "DBHelper onUpgrade success"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 305
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_2

    .line 288
    nop

    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x7 -> :sswitch_1
    .end sparse-switch
.end method

.method public upgradeToVersion2(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 8
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 368
    const-string/jumbo v6, "CREATE TABLE IF NOT EXISTS messagestore(MESSAGEID INTEGER PRIMARY KEY AUTOINCREMENT,SENDER TEXT NOT NULL,RECIPIENT TEXT NOT NULL,TEXTMESSAGE TEXT NOT NULL,SENTTIME DATETIME default CURRENT_TIMESTAMP,SENTSTATUS TEXT NOT NULL,ISREAD TEXT NOT NULL,LOCALFILEPATH TEXT NOT NULL,SERVERURIPATH TEXT NOT NULL,MESSAGETYPE TEXT NOT NULL,CHATID INTEGER NOT NULL,SERVERMESSAGEID TEXT)"

    .line 382
    .local v6, "create_table_messagestore":Ljava/lang/String;
    invoke-virtual {p1, v6}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 384
    const-string/jumbo v7, "CREATE TABLE IF NOT EXISTS userinfo(USERNAME TEXT PRIMARY KEY,NICKNAME TEXT,PHOTO TEXT)"

    .line 389
    .local v7, "create_table_userinfo":Ljava/lang/String;
    invoke-virtual {p1, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 391
    const-string/jumbo v2, "CREATE TABLE IF NOT EXISTS chatlist(CHATID INTEGER PRIMARY KEY AUTOINCREMENT,CHATCONTACT TEXT NOT NULL,MESSAGEID INTEGER)"

    .line 396
    .local v2, "create_table_chatlist":Ljava/lang/String;
    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 398
    const-string/jumbo v3, "CREATE TABLE IF NOT EXISTS groupinfo(GROUPID TEXT PRIMARY KEY , GROUPNAME TEXT NOT NULL , CREATEDATE DATETIME default CURRENT_DATE)"

    .line 403
    .local v3, "create_table_groupInfo":Ljava/lang/String;
    invoke-virtual {p1, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 405
    const-string/jumbo v4, "CREATE TABLE IF NOT EXISTS groupmember(MEMBERID INTEGER PRIMARY KEY AUTOINCREMENT, GROUPID TEXT NOT NULL , MEMBERUSERNAME TEXT NOT NULL )"

    .line 410
    .local v4, "create_table_groupMember":Ljava/lang/String;
    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 413
    const-string/jumbo v1, "CREATE TABLE IF NOT EXISTS calllogtemp(CALLID INTEGER PRIMARY KEY AUTOINCREMENT, CHATNUMBER TEXT , CALLTYPE TEXT NOT NULL, CALLDATE DATETIME NOT NULL , DURATION TEXT , CONTACTNUMBER TEXT NOT NULL )"

    .line 421
    .local v1, "create_table_callLogTemp":Ljava/lang/String;
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 423
    const-string/jumbo v0, "CREATE TABLE IF NOT EXISTS allhistorytemp(_id INTEGER PRIMARY KEY AUTOINCREMENT, chatnumber TEXT , calltype INTEGER , calldate DATETIME NOT NULL , duration INTEGER , cachedname TEXT , cachednumtype INTEGER , cachednumlabel TEXT , contactnumber TEXT NOT NULL )"

    .line 434
    .local v0, "create_table_allHistoryTemp":Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 436
    const-string/jumbo v5, "CREATE TABLE kksmstype(msisdn TEXT NOT NULL,smsType TEXT NOT NULL,updateTime TEXT NOT NULL)"

    .line 440
    .local v5, "create_table_kksmstype":Ljava/lang/String;
    invoke-virtual {p1, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 442
    return-void
.end method

.method public upgradeToVersion7(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 345
    const-string/jumbo v0, "CREATE TABLE IF NOT EXISTS call_log(_id INTEGER PRIMARY KEY AUTOINCREMENT,number TEXT NOT NULL,date INTEGER NOT NULL,duration INTEGER NOT NULL,type INTEGER NOT NULL,new INTEGER NOT NULL,name TEXT NOT NULL,numbertype INTEGER NOT NULL,numberlabel TEXT NOT NULL)"

    .line 356
    .local v0, "create_call_log_table_sql":Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 357
    sget-object v1, Lcom/pccw/database/helper/DBHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "create call log table successful"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    return-void
.end method
