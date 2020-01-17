.class public Lcom/pccw/database/dao/ResendAddQueueDAOImpl;
.super Ljava/lang/Object;
.source "ResendAddQueueDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/ResendMessage;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field CHATID_COLUMN:I

.field ID_COLUMN:I

.field LOCALFILEPATH_COLUMN:I

.field public LOG_TAG:Ljava/lang/String;

.field MESSAGEID_COLUMN:I

.field MESSAGETYPE_COLUMN:I

.field RECIPIENT_COLUMN:I

.field final RESEND_VIEW:Ljava/lang/String;

.field protected context:Landroid/content/Context;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string/jumbo v0, "ResendMessageDAOImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 17
    const-string/jumbo v0, "resendmediaview"

    iput-object v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->RESEND_VIEW:Ljava/lang/String;

    .line 20
    iput v1, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->ID_COLUMN:I

    .line 21
    iput v1, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->MESSAGEID_COLUMN:I

    .line 22
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->RECIPIENT_COLUMN:I

    .line 23
    const/4 v0, 0x2

    iput v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->LOCALFILEPATH_COLUMN:I

    .line 24
    const/4 v0, 0x3

    iput v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->MESSAGETYPE_COLUMN:I

    .line 25
    const/4 v0, 0x4

    iput v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->CHATID_COLUMN:I

    .line 27
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 31
    iput-object p1, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->context:Landroid/content/Context;

    .line 32
    return-void
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/ResendMessage;)V
    .locals 8
    .param p1, "entity"    # Lcom/pccw/database/entity/ResendMessage;

    .prologue
    .line 167
    invoke-virtual {p1}, Lcom/pccw/database/entity/ResendMessage;->getMessageId()I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->isMessageInQueue(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 168
    iget-object v4, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Add Message to resend queue duplicated, ignore: msgid="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/pccw/database/entity/ResendMessage;->getMessageId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    :goto_0
    return-void

    .line 172
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 173
    .local v1, "values":Landroid/content/ContentValues;
    const-string/jumbo v4, "MESSAGEID"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ResendMessage;->getMessageId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 174
    const-string/jumbo v4, "RECIPIENT"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ResendMessage;->getRecipient()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    const-string/jumbo v4, "LOCALFILEPATH"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ResendMessage;->getLocalfilepath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    const-string/jumbo v4, "MESSAGETYPE"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ResendMessage;->getMessagetype()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    const-string/jumbo v4, "CHATID"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ResendMessage;->getChatid()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 180
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->open()V

    .line 181
    iget-object v4, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v5, "resendqueue"

    const/4 v6, 0x0

    const/4 v7, 0x4

    invoke-virtual {v4, v5, v6, v1, v7}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v2

    .line 182
    .local v2, "insertId":J
    iget-object v4, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ResendMessageDAOImpl, add, added ID="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 187
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    goto :goto_0

    .line 184
    .end local v2    # "insertId":J
    :catch_0
    move-exception v0

    .line 185
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 187
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    throw v4
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 14
    check-cast p1, Lcom/pccw/database/entity/ResendMessage;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->add(Lcom/pccw/database/entity/ResendMessage;)V

    return-void
.end method

.method public addQueueCursorToResendQueue(Landroid/database/Cursor;)V
    .locals 7
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 123
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 125
    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v6

    if-lez v6, :cond_1

    .line 127
    :cond_0
    iget v6, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->MESSAGEID_COLUMN:I

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 128
    .local v1, "messageId":I
    iget v6, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->RECIPIENT_COLUMN:I

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 129
    .local v2, "recipient":Ljava/lang/String;
    iget v6, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->LOCALFILEPATH_COLUMN:I

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 130
    .local v3, "localFilePath":Ljava/lang/String;
    iget v6, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->MESSAGETYPE_COLUMN:I

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 131
    .local v4, "messageType":Ljava/lang/String;
    iget v6, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->CHATID_COLUMN:I

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 132
    .local v5, "chatid":I
    new-instance v0, Lcom/pccw/database/entity/ResendMessage;

    invoke-direct/range {v0 .. v5}, Lcom/pccw/database/entity/ResendMessage;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 133
    .local v0, "resendMsg":Lcom/pccw/database/entity/ResendMessage;
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->add(Lcom/pccw/database/entity/ResendMessage;)V

    .line 134
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_0

    .line 135
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 137
    .end local v0    # "resendMsg":Lcom/pccw/database/entity/ResendMessage;
    .end local v1    # "messageId":I
    .end local v2    # "recipient":Ljava/lang/String;
    .end local v3    # "localFilePath":Ljava/lang/String;
    .end local v4    # "messageType":Ljava/lang/String;
    .end local v5    # "chatid":I
    :cond_1
    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 43
    return-void
.end method

.method public createResendViewFromMessagestore(Ljava/lang/String;Ljava/lang/String;II)Z
    .locals 11
    .param p1, "startTime"    # Ljava/lang/String;
    .param p2, "endTime"    # Ljava/lang/String;
    .param p3, "chatid"    # I
    .param p4, "sendingLimit"    # I

    .prologue
    const/4 v8, 0x0

    .line 63
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->dropCurrentResendView()Z

    move-result v9

    if-nez v9, :cond_0

    .line 98
    :goto_0
    return v8

    .line 67
    :cond_0
    const-string/jumbo v1, "SELECT messageid,recipient,localfilepath,messagetype,chatid FROM messagestore WHERE messagetype!=\'text\' AND sentstatus=\'failed\'"

    .line 68
    .local v1, "basicStartPart":Ljava/lang/String;
    const-string/jumbo v0, " ORDER BY messageid ASC"

    .line 70
    .local v0, "basicEndPart":Ljava/lang/String;
    const-string/jumbo v7, ""

    .line 71
    .local v7, "startTimeRangePart":Ljava/lang/String;
    if-eqz p1, :cond_1

    const-string/jumbo v9, ""

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 72
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, " AND senttime>=\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 75
    :cond_1
    const-string/jumbo v3, ""

    .line 76
    .local v3, "endTimeRangePart":Ljava/lang/String;
    if-eqz p2, :cond_2

    const-string/jumbo v9, ""

    invoke-virtual {p2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 77
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, " AND senttime<=\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 80
    :cond_2
    const-string/jumbo v6, ""

    .line 81
    .local v6, "specificChatidPart":Ljava/lang/String;
    if-ltz p3, :cond_3

    .line 82
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, " AND chatid="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 85
    :cond_3
    const-string/jumbo v5, ""

    .line 86
    .local v5, "sendingLimitPart":Ljava/lang/String;
    if-lez p4, :cond_4

    .line 87
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, " LIMIT "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 90
    :cond_4
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CREATE VIEW resendmediaview AS "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 94
    .local v4, "query":Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v9, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    const/4 v8, 0x1

    .line 100
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    goto/16 :goto_0

    .line 96
    :catch_0
    move-exception v2

    .line 97
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    goto/16 :goto_0

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    throw v8
.end method

.method public dropCurrentResendView()Z
    .locals 3

    .prologue
    .line 46
    const-string/jumbo v0, "DROP VIEW IF EXISTS resendmediaview"

    .line 48
    .local v0, "dropCurrentResendView":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->open()V

    .line 51
    :try_start_0
    iget-object v2, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    const/4 v2, 0x1

    .line 57
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    .line 55
    :goto_0
    return v2

    .line 53
    :catch_0
    move-exception v1

    .line 54
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    const/4 v2, 0x0

    .line 57
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    throw v2
.end method

.method public find(Ljava/lang/String;)Lcom/pccw/database/entity/ResendMessage;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 202
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 14
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/ResendMessage;

    move-result-object v0

    return-object v0
.end method

.method public getResendCursor()Landroid/database/Cursor;
    .locals 5

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->open()V

    .line 107
    const/4 v0, 0x0

    .line 109
    .local v0, "cursor":Landroid/database/Cursor;
    const-string/jumbo v2, "SELECT * FROM resendmediaview"

    .line 112
    .local v2, "query":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 113
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    .line 119
    :goto_0
    return-object v0

    .line 114
    :catch_0
    move-exception v1

    .line 115
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    throw v3
.end method

.method public isMessageInQueue(I)Z
    .locals 7
    .param p1, "msgId"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 141
    const-string/jumbo v0, "SELECT messageid from resendqueue where messageid=?"

    .line 143
    .local v0, "checkExist":Ljava/lang/String;
    new-array v3, v4, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    .line 145
    .local v3, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->open()V

    .line 148
    :try_start_0
    iget-object v6, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v6, v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 150
    .local v2, "resultCurosr":Landroid/database/Cursor;
    if-eqz v2, :cond_0

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v6

    if-lez v6, :cond_0

    .line 151
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    .line 159
    .end local v2    # "resultCurosr":Landroid/database/Cursor;
    :goto_0
    return v4

    .line 154
    .restart local v2    # "resultCurosr":Landroid/database/Cursor;
    :cond_0
    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    move v4, v5

    .line 155
    goto :goto_0

    .line 157
    .end local v2    # "resultCurosr":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 158
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 161
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    move v4, v5

    .line 159
    goto :goto_0

    .line 161
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->close()V

    throw v4
.end method

.method public list()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/ResendMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 195
    const/4 v0, 0x0

    return-object v0
.end method

.method public open()V
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 38
    return-void
.end method

.method public remove(Lcom/pccw/database/entity/ResendMessage;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/ResendMessage;

    .prologue
    .line 217
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 14
    check-cast p1, Lcom/pccw/database/entity/ResendMessage;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->remove(Lcom/pccw/database/entity/ResendMessage;)V

    return-void
.end method

.method public update(Lcom/pccw/database/entity/ResendMessage;)I
    .locals 1
    .param p1, "entity"    # Lcom/pccw/database/entity/ResendMessage;

    .prologue
    .line 209
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 14
    check-cast p1, Lcom/pccw/database/entity/ResendMessage;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ResendAddQueueDAOImpl;->update(Lcom/pccw/database/entity/ResendMessage;)I

    move-result v0

    return v0
.end method
