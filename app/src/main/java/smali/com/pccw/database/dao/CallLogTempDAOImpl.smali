.class public Lcom/pccw/database/dao/CallLogTempDAOImpl;
.super Ljava/lang/Object;
.source "CallLogTempDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/CallLogTemp;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field protected CALLLOGTEMP_TABLE_COLUMNS:[Ljava/lang/String;

.field protected CHATLOG_VIEW_COLUMNS:[Ljava/lang/String;

.field public LOG_TAG:Ljava/lang/String;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string/jumbo v0, "CallLogTempDAOImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 27
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "CHATNUMBER"

    aput-object v1, v0, v2

    const-string/jumbo v1, "CALLDATE"

    aput-object v1, v0, v3

    const-string/jumbo v1, "CALLTYPE"

    aput-object v1, v0, v4

    const-string/jumbo v1, "DURATION"

    aput-object v1, v0, v5

    const-string/jumbo v1, "CONTACTNUMBER"

    aput-object v1, v0, v6

    iput-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->CALLLOGTEMP_TABLE_COLUMNS:[Ljava/lang/String;

    .line 28
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "MESSAGEID"

    aput-object v1, v0, v2

    const-string/jumbo v1, "CHATID"

    aput-object v1, v0, v3

    const-string/jumbo v1, "SENDER"

    aput-object v1, v0, v4

    const-string/jumbo v1, "RECIPIENT"

    aput-object v1, v0, v5

    const-string/jumbo v1, "TEXTMESSAGE"

    aput-object v1, v0, v6

    const/4 v1, 0x5

    const-string/jumbo v2, "SENTTIME"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "SENTSTATUS"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "ISREAD"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "LOCALFILEPATH"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "SERVERURIPATH"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "MESSAGETYPE"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "CHATID"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->CHATLOG_VIEW_COLUMNS:[Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->mContext:Landroid/content/Context;

    .line 32
    return-void
.end method

.method private addResultToMessageStoreList(Ljava/util/ArrayList;Landroid/database/Cursor;)V
    .locals 4
    .param p2, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/MessageStore;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 132
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_0

    .line 134
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->parseMessageStore(Landroid/database/Cursor;)Lcom/pccw/database/entity/MessageStore;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    :goto_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 135
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "MessageStoreImpl, fail to add MessageStore exception="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 140
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/CallLogTemp;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/CallLogTemp;

    .prologue
    .line 296
    return-void
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 20
    check-cast p1, Lcom/pccw/database/entity/CallLogTemp;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->add(Lcom/pccw/database/entity/CallLogTemp;)V

    return-void
.end method

.method public addList(Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/CallLogTemp;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 185
    .local p1, "entities":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/CallLogTemp;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->open()V

    .line 186
    iget-object v4, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 187
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/database/entity/CallLogTemp;

    .line 189
    .local v0, "entity":Lcom/pccw/database/entity/CallLogTemp;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 191
    .local v3, "values":Landroid/content/ContentValues;
    const-string/jumbo v5, "CHATNUMBER"

    invoke-virtual {v0}, Lcom/pccw/database/entity/CallLogTemp;->getChatNumber()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    invoke-virtual {v0}, Lcom/pccw/database/entity/CallLogTemp;->getCallDate()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/pccw/mobile/util/FormatUtil;->convertLongToStr(J)Ljava/lang/String;

    move-result-object v2

    .line 196
    .local v2, "strCallDate":Ljava/lang/String;
    const-string/jumbo v5, "CALLDATE"

    invoke-virtual {v3, v5, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    const-string/jumbo v5, "CALLTYPE"

    invoke-virtual {v0}, Lcom/pccw/database/entity/CallLogTemp;->getCallType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    invoke-virtual {v0}, Lcom/pccw/database/entity/CallLogTemp;->getDuration()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/pccw/mobile/util/FormatUtil;->convertDurationSecondsToTimeStr(J)Ljava/lang/String;

    move-result-object v1

    .line 200
    .local v1, "formattedDuration":Ljava/lang/String;
    const-string/jumbo v5, "KKIM"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Duration : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lcom/pccw/database/entity/CallLogTemp;->getDuration()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    const-string/jumbo v5, "DURATION"

    invoke-virtual {v3, v5, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    const-string/jumbo v5, "CONTACTNUMBER"

    invoke-virtual {v0}, Lcom/pccw/database/entity/CallLogTemp;->getContactNumber()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    iget-object v5, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v6, "calllogtemp"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_0

    .line 209
    .end local v0    # "entity":Lcom/pccw/database/entity/CallLogTemp;
    .end local v1    # "formattedDuration":Ljava/lang/String;
    .end local v2    # "strCallDate":Ljava/lang/String;
    .end local v3    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v4

    .line 212
    iget-object v4, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 213
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    .line 216
    :goto_1
    return-void

    .line 208
    :cond_0
    :try_start_1
    iget-object v4, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 212
    iget-object v4, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 213
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    goto :goto_1

    .line 212
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 213
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    throw v4
.end method

.method public close()V
    .locals 0

    .prologue
    .line 226
    return-void
.end method

.method public createChatLogView(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "chatId"    # Ljava/lang/String;
    .param p2, "chatNumber"    # Ljava/lang/String;

    .prologue
    .line 36
    :try_start_0
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "createChatLogView chatNumber : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->open()V

    .line 38
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "CREATE VIEW chatlog AS SELECT messagetype,senttime,textmessage,messageid,sender,recipient,sentstatus,isread,localfilepath,serveruripath,chatid FROM MESSAGESTORE where chatid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " UNION select calltype,calldate,duration,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "calllogtemp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " where chatNumber="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "create_view_chatLog":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 46
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "createChatLogView completed"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    .line 52
    .end local v0    # "create_view_chatLog":Ljava/lang/String;
    :goto_0
    return-void

    .line 47
    :catch_0
    move-exception v1

    .line 48
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "createChatLogView, exception="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    throw v2
.end method

.method public dropChatLogView()V
    .locals 5

    .prologue
    .line 260
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->open()V

    .line 261
    const-string/jumbo v0, "DROP view IF EXISTS chatlog"

    .line 262
    .local v0, "drop_chatlog_view_statement":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 263
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "CallLogTempDAOImpl, dropChatLogView completed"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    .line 272
    .end local v0    # "drop_chatlog_view_statement":Ljava/lang/String;
    :goto_0
    return-void

    .line 265
    :catch_0
    move-exception v1

    .line 266
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "CallLogTempDAOImpl, dropChatLogView, exception="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 269
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    throw v2
.end method

.method public find(Ljava/lang/Integer;)Lcom/pccw/database/entity/CallLogTemp;
    .locals 1
    .param p1, "key"    # Ljava/lang/Integer;

    .prologue
    .line 276
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 20
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->find(Ljava/lang/Integer;)Lcom/pccw/database/entity/CallLogTemp;

    move-result-object v0

    return-object v0
.end method

.method public list()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/CallLogTemp;",
            ">;"
        }
    .end annotation

    .prologue
    .line 144
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "CallLogTempDAOImpl, list, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .local v8, "callLogList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/CallLogTemp;>;"
    const-string/jumbo v7, "CALLDATE ASC"

    .line 149
    .local v7, "orderBy":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->open()V

    .line 150
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "calllogtemp"

    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->CALLLOGTEMP_TABLE_COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 151
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 153
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CallLogTempDAOImpl, list, count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 157
    :try_start_1
    invoke-virtual {p0, v9}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/CallLogTemp;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    :goto_1
    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 166
    .end local v9    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v10

    .line 167
    .local v10, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "UserInfoImpl, list, exception="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v10}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 169
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    .line 172
    .end local v10    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v8

    .line 158
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v10

    .line 159
    .restart local v10    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "list, fail to add exception="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v10}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 169
    .end local v9    # "cursor":Landroid/database/Cursor;
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    throw v0

    .line 164
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 169
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    goto :goto_2
.end method

.method public listChatPageData()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/MessageStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "CallLogTempDAOImpl, listChatPageData, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v10, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    const-string/jumbo v7, "SENTTIME ASC"

    .line 107
    .local v7, "orderBy":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->open()V

    .line 108
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "chatlog"

    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->CHATLOG_VIEW_COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 109
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 111
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CallLogTempDAOImpl, listChatPageData, count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    invoke-direct {p0, v10, v8}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->addResultToMessageStoreList(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    .line 116
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    .line 124
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v10

    .line 118
    :catch_0
    move-exception v9

    .line 119
    .local v9, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "CallLogTempDAOImpl, listChatPageData, exception="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    goto :goto_0

    .end local v9    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    throw v0
.end method

.method public listChatPageDataWithPage(I)Ljava/util/ArrayList;
    .locals 11
    .param p1, "pageNo"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/MessageStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    iget-object v8, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CallLogTempDAOImpl, listChatPageData, starts pageNo= "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    const/16 v5, 0x14

    .line 58
    .local v5, "pageSize":I
    add-int/lit8 v8, p1, -0x1

    mul-int v7, v8, v5

    .line 60
    .local v7, "startPage":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 63
    .local v4, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    iget-object v8, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->CHATLOG_VIEW_COLUMNS:[Ljava/lang/String;

    const-string/jumbo v9, ","

    invoke-static {v8, v9}, Lorg/apache/commons/lang/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 65
    .local v1, "col":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "select "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " from (select "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " from "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "chatlog"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " order by "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "SENTTIME"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " desc limit "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " , "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ") order by "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "SENTTIME"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " asc"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 69
    .local v6, "query":Ljava/lang/String;
    iget-object v8, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CallLogTempDAOImpl, query="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->open()V

    .line 73
    iget-object v8, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v9, 0x0

    invoke-virtual {v8, v6, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 74
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 76
    iget-object v8, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CallLogTempDAOImpl, count="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    if-nez v8, :cond_0

    .line 80
    :try_start_1
    invoke-virtual {p0, v2}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->parseMessageStore(Landroid/database/Cursor;)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    .line 81
    .local v0, "chatListUserInfo":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    .end local v0    # "chatListUserInfo":Lcom/pccw/database/entity/MessageStore;
    :goto_1
    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 90
    .end local v2    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v3

    .line 91
    .local v3, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v8, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CallLogTempDAOImpl, exception="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 93
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    .line 96
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v4

    .line 83
    .restart local v2    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v3

    .line 84
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v8, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CallLogTempDAOImpl, fail to find scanGroupInfo exception="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 93
    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    throw v8

    .line 89
    .restart local v2    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 93
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    goto :goto_2
.end method

.method public open()V
    .locals 1

    .prologue
    .line 220
    iget-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 221
    return-void
.end method

.method protected parseMessageStore(Landroid/database/Cursor;)Lcom/pccw/database/entity/MessageStore;
    .locals 16
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 299
    const-string/jumbo v13, "MESSAGEID"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 300
    .local v12, "msgId":I
    const-string/jumbo v13, "SENDER"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 301
    .local v2, "sender":Ljava/lang/String;
    const-string/jumbo v13, "RECIPIENT"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 302
    .local v3, "recipient":Ljava/lang/String;
    const-string/jumbo v13, "TEXTMESSAGE"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 303
    .local v4, "textMessage":Ljava/lang/String;
    const-string/jumbo v13, "SENTTIME"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/pccw/mobile/util/FormatUtil;->convertStrToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v5

    .line 304
    .local v5, "sentTime":Ljava/util/Date;
    const-string/jumbo v13, "SENTSTATUS"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 305
    .local v6, "sentStatus":Ljava/lang/String;
    const-string/jumbo v13, "ISREAD"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 306
    .local v7, "isRead":Ljava/lang/String;
    const-string/jumbo v13, "LOCALFILEPATH"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 307
    .local v8, "localfilepath":Ljava/lang/String;
    const-string/jumbo v13, "SERVERURIPATH"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 308
    .local v9, "serveruripath":Ljava/lang/String;
    const-string/jumbo v13, "MESSAGETYPE"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 309
    .local v10, "messagetype":Ljava/lang/String;
    const-string/jumbo v13, "CHATID"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 312
    .local v11, "chatid":I
    const-string/jumbo v13, "KKIM"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "chatlogView result : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    new-instance v1, Lcom/pccw/database/entity/MessageStore;

    invoke-direct/range {v1 .. v11}, Lcom/pccw/database/entity/MessageStore;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 315
    .local v1, "messageStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v1, v12}, Lcom/pccw/database/entity/MessageStore;->setMessageId(I)V

    .line 317
    return-object v1
.end method

.method protected parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/CallLogTemp;
    .locals 7
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 231
    const-string/jumbo v6, "CHATNUMBER"

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, "chatNumber":Ljava/lang/String;
    const-string/jumbo v6, "CALLDATE"

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 233
    .local v2, "callDate":Ljava/lang/String;
    const-string/jumbo v6, "CALLTYPE"

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 234
    .local v3, "callType":Ljava/lang/String;
    const-string/jumbo v6, "DURATION"

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 235
    .local v4, "duration":Ljava/lang/String;
    const-string/jumbo v6, "CONTACTNUMBER"

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 239
    .local v5, "contactNumber":Ljava/lang/String;
    new-instance v0, Lcom/pccw/database/entity/CallLogTemp;

    invoke-direct/range {v0 .. v5}, Lcom/pccw/database/entity/CallLogTemp;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .local v0, "callLogTemp":Lcom/pccw/database/entity/CallLogTemp;
    return-object v0
.end method

.method public remove(Lcom/pccw/database/entity/CallLogTemp;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/CallLogTemp;

    .prologue
    .line 289
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 20
    check-cast p1, Lcom/pccw/database/entity/CallLogTemp;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->remove(Lcom/pccw/database/entity/CallLogTemp;)V

    return-void
.end method

.method public removeAllFromCallLogTemp()V
    .locals 6

    .prologue
    .line 246
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->open()V

    .line 247
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "calllogtemp"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 248
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "CallLogTempDAOImpl, remove, removed number of row="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    .line 257
    .end local v1    # "row":I
    :goto_0
    return-void

    .line 250
    :catch_0
    move-exception v0

    .line 251
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/CallLogTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "CallLogTempDAOImpl, remove, exception="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 254
    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->close()V

    throw v2
.end method

.method public update(Lcom/pccw/database/entity/CallLogTemp;)I
    .locals 1
    .param p1, "entity"    # Lcom/pccw/database/entity/CallLogTemp;

    .prologue
    .line 282
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 20
    check-cast p1, Lcom/pccw/database/entity/CallLogTemp;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->update(Lcom/pccw/database/entity/CallLogTemp;)I

    move-result v0

    return v0
.end method
