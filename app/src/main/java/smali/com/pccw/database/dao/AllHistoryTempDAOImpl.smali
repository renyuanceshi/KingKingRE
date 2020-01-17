.class public Lcom/pccw/database/dao/AllHistoryTempDAOImpl;
.super Ljava/lang/Object;
.source "AllHistoryTempDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/AllHistoryTemp;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field protected ALLHISTORYTEMP_TABLE_COLUMNS:[Ljava/lang/String;

.field protected CHATLOG_VIEW_COLUMNS:[Ljava/lang/String;

.field public LOG_TAG:Ljava/lang/String;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string/jumbo v0, "AllHistoryTempDAOImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 23
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "chatnumber"

    aput-object v1, v0, v4

    const-string/jumbo v1, "calltype"

    aput-object v1, v0, v5

    const-string/jumbo v1, "calldate"

    aput-object v1, v0, v6

    const-string/jumbo v1, "duration"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "cachedname"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "cachednumtype"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "cachednumlabel"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "contactnumber"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->ALLHISTORYTEMP_TABLE_COLUMNS:[Ljava/lang/String;

    .line 29
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "chatnumber"

    aput-object v1, v0, v4

    const-string/jumbo v1, "calltype"

    aput-object v1, v0, v5

    const-string/jumbo v1, "calldate"

    aput-object v1, v0, v6

    const-string/jumbo v1, "duration"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "cachedname"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "cachednumtype"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "cachednumlabel"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "contactnumber"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->CHATLOG_VIEW_COLUMNS:[Ljava/lang/String;

    .line 36
    iput-object p1, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->mContext:Landroid/content/Context;

    .line 37
    return-void
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/AllHistoryTemp;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/AllHistoryTemp;

    .prologue
    .line 256
    return-void
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 16
    check-cast p1, Lcom/pccw/database/entity/AllHistoryTemp;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->add(Lcom/pccw/database/entity/AllHistoryTemp;)V

    return-void
.end method

.method public addList(Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/AllHistoryTemp;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 144
    .local p1, "entities":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/AllHistoryTemp;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->open()V

    .line 145
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 146
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/database/entity/AllHistoryTemp;

    .line 148
    .local v0, "entity":Lcom/pccw/database/entity/AllHistoryTemp;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 149
    .local v1, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "chatnumber"

    invoke-virtual {v0}, Lcom/pccw/database/entity/AllHistoryTemp;->getChatnumber()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-string/jumbo v3, "calltype"

    invoke-virtual {v0}, Lcom/pccw/database/entity/AllHistoryTemp;->getType()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 151
    const-string/jumbo v3, "calldate"

    invoke-virtual {v0}, Lcom/pccw/database/entity/AllHistoryTemp;->getDate()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    const-string/jumbo v3, "duration"

    invoke-virtual {v0}, Lcom/pccw/database/entity/AllHistoryTemp;->getDuration()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    const-string/jumbo v3, "cachedname"

    invoke-virtual {v0}, Lcom/pccw/database/entity/AllHistoryTemp;->getCached_name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    const-string/jumbo v3, "cachednumtype"

    invoke-virtual {v0}, Lcom/pccw/database/entity/AllHistoryTemp;->getCached_number_type()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    const-string/jumbo v3, "cachednumlabel"

    invoke-virtual {v0}, Lcom/pccw/database/entity/AllHistoryTemp;->getCached_number_label()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-string/jumbo v3, "contactnumber"

    invoke-virtual {v0}, Lcom/pccw/database/entity/AllHistoryTemp;->getContactNumber()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    iget-object v3, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "allhistorytemp"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 161
    .end local v0    # "entity":Lcom/pccw/database/entity/AllHistoryTemp;
    .end local v1    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v2

    .line 164
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 165
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    .line 168
    :goto_1
    return-void

    .line 160
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 164
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 165
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    goto :goto_1

    .line 164
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 165
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    throw v2
.end method

.method public close()V
    .locals 0

    .prologue
    .line 178
    return-void
.end method

.method public dropAllHistoryCombinedView()V
    .locals 5

    .prologue
    .line 218
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->open()V

    .line 220
    const-string/jumbo v0, "DROP VIEW IF EXISTS allchatview"

    .line 221
    .local v0, "drop_allchat_view_statement":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 223
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "AllHistoryTempDAOImpl, dropAllHistoryCombinedView completed"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 229
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    .line 232
    .end local v0    # "drop_allchat_view_statement":Ljava/lang/String;
    :goto_0
    return-void

    .line 225
    :catch_0
    move-exception v1

    .line 226
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "AllHistoryTempDAOImpl, dropAllHistoryCombinedView exception="

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

    .line 229
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    throw v2
.end method

.method public find(Ljava/lang/Integer;)Lcom/pccw/database/entity/AllHistoryTemp;
    .locals 1
    .param p1, "key"    # Ljava/lang/Integer;

    .prologue
    .line 237
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 16
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->find(Ljava/lang/Integer;)Lcom/pccw/database/entity/AllHistoryTemp;

    move-result-object v0

    return-object v0
.end method

.method public getCursor()Landroid/database/Cursor;
    .locals 9

    .prologue
    .line 40
    iget-object v6, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v7, "getCursor called"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    const/16 v4, 0x1e

    .line 43
    .local v4, "msgLength":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "SELECT chatcontact,senttime,C.messageid,textmessage,C.chatid,unreadcount,messagetype  FROM chatlist C LEFT OUTER JOIN ( SELECT messageid,textmessage,senttime,SUM(CASE isread WHEN \'N\' THEN 1 ELSE 0 END) AS unreadcount,chatid,messagetype  FROM ( SELECT messageid,(CASE WHEN LENGTH(textmessage)>"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " THEN SUBSTR(textmessage,0,"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ")||\'...\' ELSE textmessage END) AS textmessage,senttime,isread,chatid,messagetype  FROM messagestore ORDER BY messageid ASC ) GROUP BY chatid ) MSV ON C.chatid = MSV.chatid"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, "helperview":Ljava/lang/String;
    const-string/jumbo v5, "SELECT NULL AS _id,chatcontact,senttime,duration,calltype,callername,callertype,callerlabel,chatnumber,textmessage,chatid,entrytype,unreadcount,isimuser,messagetype  FROM ( SELECT chatcontact,senttime,\'\' AS duration,21 AS calltype,nickname AS callername,1 AS callertype,\'CACHED_NUMBER_LABEL\' AS callerlabel,chatcontact AS chatnumber,textmessage,chatid,\'individual\' AS entrytype,unreadcount,\'Y\' AS isimuser,messagetype  FROM allchatview LEFT OUTER JOIN (SELECT username,nickname FROM userinfo) ON username=chatcontact WHERE length(chatcontact) < 12 UNION ALL SELECT chatcontact,CASE WHEN senttime IS NULL THEN createdate ELSE senttime END AS senttime,\'\' AS duration,21 AS calltype,groupname,1 AS callertype,\'CACHED_NUMBER_LABEL\' AS callerlabel,chatcontact,textmessage,chatid,\'group\' AS entrytype,unreadcount,\'Y\' AS isimuser,messagetype  FROM allchatview INNER JOIN (SELECT groupid,groupname,createdate FROM groupinfo) ON groupid=chatcontact UNION ALL SELECT contactnumber,lastcall,duration,calltype,cachedname,cachednumtype,cachednumlabel,chatnumber,NULL AS textmessage,ACV.chatid,\'individual\' AS entrytype,unreadcount,CASE WHEN UIN.username IS NOT NULL THEN \'Y\' ELSE \'N\' END AS isimuser,\'call\' AS messagetype  FROM ( SELECT chatnumber,calltype,lastcall,duration,cachedname,cachednumtype,cachednumlabel,contactnumber FROM ( SELECT chatnumber,calltype,calldate as lastcall,duration,cachedname,cachednumtype,cachednumlabel,contactnumber FROM allhistorytemp ORDER BY lastcall ASC ) GROUP BY chatnumber ) calllogtable LEFT OUTER JOIN (SELECT username FROM userinfo) UIN ON calllogtable.chatnumber=UIN.username LEFT OUTER JOIN allchatview ACV ON calllogtable.chatnumber=ACV.chatcontact ORDER BY senttime ASC ) GROUP BY chatnumber ORDER BY senttime DESC"

    .line 84
    .local v5, "query":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->open()V

    .line 86
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "CREATE VIEW allchatview AS "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 87
    .local v0, "createViewAllChat":Ljava/lang/String;
    iget-object v6, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 89
    const/4 v1, 0x0

    .line 92
    .local v1, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->open()V

    .line 93
    iget-object v6, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 94
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    .line 102
    :goto_0
    return-object v1

    .line 96
    :catch_0
    move-exception v2

    .line 97
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v6, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "UserInfoImpl, list, exception="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    goto :goto_0

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    throw v6
.end method

.method public list()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/AllHistoryTemp;",
            ">;"
        }
    .end annotation

    .prologue
    .line 108
    iget-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "AllHistoryTempDAOImpl, list, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .local v8, "allHistoryList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/AllHistoryTemp;>;"
    const-string/jumbo v7, "calldate DESC"

    .line 114
    .local v7, "orderBy":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->open()V

    .line 115
    iget-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "allhistorytemp"

    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->ALLHISTORYTEMP_TABLE_COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 117
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 119
    iget-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "AllHistoryTempDAOImpl, list, count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 123
    :try_start_1
    invoke-virtual {p0, v9}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/AllHistoryTemp;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    :goto_1
    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 132
    .end local v9    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v10

    .line 133
    .local v10, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

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

    .line 135
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    .line 138
    .end local v10    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v8

    .line 124
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v10

    .line 125
    .restart local v10    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

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

    .line 135
    .end local v9    # "cursor":Landroid/database/Cursor;
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    throw v0

    .line 130
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 135
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    goto :goto_2
.end method

.method public open()V
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 173
    return-void
.end method

.method protected parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/AllHistoryTemp;
    .locals 10
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 183
    const-string/jumbo v9, "chatnumber"

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 184
    .local v1, "chatnumber":Ljava/lang/String;
    const-string/jumbo v9, "calltype"

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 185
    .local v2, "type":I
    const-string/jumbo v9, "calldate"

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 186
    .local v3, "date":Ljava/lang/String;
    const-string/jumbo v9, "duration"

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 187
    .local v4, "duration":Ljava/lang/String;
    const-string/jumbo v9, "cachedname"

    .line 188
    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 187
    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 189
    .local v5, "cached_name":Ljava/lang/String;
    const-string/jumbo v9, "cachednumtype"

    .line 190
    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 189
    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 191
    .local v6, "cached_number_type":Ljava/lang/String;
    const-string/jumbo v9, "cachednumlabel"

    .line 192
    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 191
    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 193
    .local v7, "cached_number_label":Ljava/lang/String;
    const-string/jumbo v9, "contactnumber"

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p1, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 195
    .local v8, "contactnumber":Ljava/lang/String;
    new-instance v0, Lcom/pccw/database/entity/AllHistoryTemp;

    invoke-direct/range {v0 .. v8}, Lcom/pccw/database/entity/AllHistoryTemp;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    .local v0, "allHistoryTemp":Lcom/pccw/database/entity/AllHistoryTemp;
    return-object v0
.end method

.method public remove(Lcom/pccw/database/entity/AllHistoryTemp;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/AllHistoryTemp;

    .prologue
    .line 250
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 16
    check-cast p1, Lcom/pccw/database/entity/AllHistoryTemp;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->remove(Lcom/pccw/database/entity/AllHistoryTemp;)V

    return-void
.end method

.method public removeAllFromCallLogTemp()V
    .locals 6

    .prologue
    .line 203
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->open()V

    .line 204
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "allhistorytemp"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 205
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "remove, removed number of row="

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

    .line 211
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    .line 214
    .end local v1    # "row":I
    :goto_0
    return-void

    .line 207
    :catch_0
    move-exception v0

    .line 208
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "remove, exception="

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

    .line 211
    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->close()V

    throw v2
.end method

.method public update(Lcom/pccw/database/entity/AllHistoryTemp;)I
    .locals 1
    .param p1, "entity"    # Lcom/pccw/database/entity/AllHistoryTemp;

    .prologue
    .line 243
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 16
    check-cast p1, Lcom/pccw/database/entity/AllHistoryTemp;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->update(Lcom/pccw/database/entity/AllHistoryTemp;)I

    move-result v0

    return v0
.end method
