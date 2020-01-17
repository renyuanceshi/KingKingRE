.class public Lcom/pccw/database/dao/MessageStoreDAOImpl;
.super Ljava/lang/Object;
.source "MessageStoreDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/MessageStore;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field public LOG_TAG:Ljava/lang/String;

.field protected MESSAGESTORE_TABLE_COLUMNS:[Ljava/lang/String;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string/jumbo v0, "MessageStoreDAOImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 26
    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "MESSAGEID"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "SENDER"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "RECIPIENT"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "TEXTMESSAGE"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "SENTTIME"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "SENTSTATUS"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "ISREAD"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "LOCALFILEPATH"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "SERVERURIPATH"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "MESSAGETYPE"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "CHATID"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "SERVERMESSAGEID"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->MESSAGESTORE_TABLE_COLUMNS:[Ljava/lang/String;

    .line 34
    iput-object p1, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->mContext:Landroid/content/Context;

    .line 35
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
    invoke-virtual {p0, p2}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->parseMessageStore(Landroid/database/Cursor;)Lcom/pccw/database/entity/MessageStore;

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
    iget-object v1, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

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
.method public add(Lcom/pccw/database/entity/MessageStore;)V
    .locals 7
    .param p1, "entity"    # Lcom/pccw/database/entity/MessageStore;

    .prologue
    .line 436
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 438
    .local v2, "values":Landroid/content/ContentValues;
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "insert db; from="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getSender()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " recipient="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getRecipient()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ;file path="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getLocalfilepath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";textmsg="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getTextMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "  Time Save: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getSentTime()Ljava/util/Date;

    move-result-object v5

    const-string/jumbo v6, "yyyy-MM-dd HH:mm:ss:SSS"

    invoke-static {v5, v6}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStr(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 440
    const-string/jumbo v3, "SENDER"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getSender()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    const-string/jumbo v3, "RECIPIENT"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getRecipient()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    const-string/jumbo v3, "TEXTMESSAGE"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getTextMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    const-string/jumbo v3, "SENTTIME"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getSentTime()Ljava/util/Date;

    move-result-object v4

    const-string/jumbo v5, "yyyy-MM-dd HH:mm:ss:SSS"

    invoke-static {v4, v5}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStr(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    const-string/jumbo v3, "SENTSTATUS"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getSentStatus()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    const-string/jumbo v3, "ISREAD"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getIsRead()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    const-string/jumbo v3, "LOCALFILEPATH"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getLocalfilepath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 447
    const-string/jumbo v3, "SERVERURIPATH"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getServeruripath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    const-string/jumbo v3, "MESSAGETYPE"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    const-string/jumbo v3, "CHATID"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getChatid()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 450
    const-string/jumbo v3, "SERVERMESSAGEID"

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getServerMessageId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 454
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "messagestore"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 455
    .local v0, "id":J
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageImpl, add, added Message with ID="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 459
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 462
    .end local v0    # "id":J
    :goto_0
    return-void

    .line 456
    :catch_0
    move-exception v3

    .line 459
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v3
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lcom/pccw/database/entity/MessageStore;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->add(Lcom/pccw/database/entity/MessageStore;)V

    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 546
    return-void
.end method

.method public deleteChatByChatId(Ljava/lang/String;)I
    .locals 7
    .param p1, "chatId"    # Ljava/lang/String;

    .prologue
    .line 508
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 509
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "messagestore"

    const-string/jumbo v4, "CHATID=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 510
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, deleteChatByChatId, removed number of row="

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

    .line 518
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 515
    .end local v1    # "row":I
    :goto_0
    return v1

    .line 513
    :catch_0
    move-exception v0

    .line 514
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, deleteChatByChatId, exception="

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

    .line 515
    const/4 v1, -0x1

    .line 518
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v2
.end method

.method public deleteMessageByMsgId(Ljava/lang/String;)I
    .locals 7
    .param p1, "msgId"    # Ljava/lang/String;

    .prologue
    .line 524
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 525
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "messagestore"

    const-string/jumbo v4, "MESSAGEID=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 526
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, deleteChatByChatId, removed number of row="

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

    .line 534
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 531
    .end local v1    # "row":I
    :goto_0
    return v1

    .line 529
    :catch_0
    move-exception v0

    .line 530
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, deleteChatByChatId, exception="

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

    .line 531
    const/4 v1, -0x1

    .line 534
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v2
.end method

.method public find(Ljava/lang/Integer;)Lcom/pccw/database/entity/MessageStore;
    .locals 8
    .param p1, "key"    # Ljava/lang/Integer;

    .prologue
    .line 351
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByMsgId, key= "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    const/4 v2, 0x0

    .line 354
    .local v2, "messageStore":Lcom/pccw/database/entity/MessageStore;
    const-string/jumbo v3, "select * from messagestore where MESSAGEID=?"

    .line 357
    .local v3, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByMsgId, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 361
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 363
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 365
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByMsgId, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 369
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->parseMessageStore(Landroid/database/Cursor;)Lcom/pccw/database/entity/MessageStore;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 373
    :goto_0
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 375
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 379
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 381
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_1
    return-object v2

    .line 370
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 371
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByMsgId, fail to add MessageStore exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 376
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 377
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageImpl, findByMsgId, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 379
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_1

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v4
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 19
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->find(Ljava/lang/Integer;)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    return-object v0
.end method

.method public findByChatID(I)Ljava/util/ArrayList;
    .locals 8
    .param p1, "chatID"    # I
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
    .line 100
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v5, "MessageImpl, findByChatID, starts"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v2, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    const-string/jumbo v3, "SELECT * FROM messagestore where CHATID = ? order by SENTTIME asc"

    .line 108
    .local v3, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByChatID, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 113
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 115
    .local v0, "cursor":Landroid/database/Cursor;
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByChatID, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    invoke-direct {p0, v2, v0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->addResultToMessageStoreList(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    .line 119
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 125
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v2

    .line 120
    :catch_0
    move-exception v1

    .line 121
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageImpl, findByChatID, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v4
.end method

.method public findByChatIDWithPage(II)Ljava/util/ArrayList;
    .locals 10
    .param p1, "chatID"    # I
    .param p2, "pageNo"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/MessageStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    iget-object v6, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v7, "MessageImpl, findByChatIDWithPage, starts"

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    const/16 v3, 0x14

    .line 67
    .local v3, "pageSize":I
    add-int/lit8 v6, p2, -0x1

    mul-int v5, v6, v3

    .line 69
    .local v5, "startPage":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v2, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    const-string/jumbo v4, "SELECT * FROM (SELECT * FROM messagestore where CHATID = ? order by MESSAGEID desc limit ?, ?) order by MESSAGEID asc"

    .line 77
    .local v4, "query":Ljava/lang/String;
    iget-object v6, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "MessageStoreImpl, findByChatID, query="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 82
    iget-object v6, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v6, v4, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 84
    .local v0, "cursor":Landroid/database/Cursor;
    iget-object v6, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "MessageStoreImpl, findByChatID, count="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    invoke-direct {p0, v2, v0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->addResultToMessageStoreList(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    .line 88
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 94
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v2

    .line 89
    :catch_0
    move-exception v1

    .line 90
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v6, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "MessageImpl, findByChatID, exception="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v6
.end method

.method public getAllSentMessageWithChatId(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 9
    .param p1, "chatId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/MessageStore;",
            ">;"
        }
    .end annotation

    .prologue
    .line 311
    iget-object v5, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "MessageStoreImpl, getSentMessageWithChatId, chatId="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 313
    .local v3, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "SELECT * FROM messagestore WHERE CHATID=? AND SENTSTATUS=\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_SENT:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\' AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "SERVERMESSAGEID"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " IS NOT NULL"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 316
    .local v4, "query":Ljava/lang/String;
    iget-object v5, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "MessageStoreImpl, getSendingMessageWithChatId, query="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 320
    iget-object v5, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    .line 321
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 320
    invoke-virtual {v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 324
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 326
    iget-object v5, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "MessageStoreImpl, findByMsgId, count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_0

    .line 330
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->parseMessageStore(Landroid/database/Cursor;)Lcom/pccw/database/entity/MessageStore;

    move-result-object v2

    .line 331
    .local v2, "messageStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 335
    .end local v2    # "messageStore":Lcom/pccw/database/entity/MessageStore;
    :goto_1
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 339
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 340
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v5, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "MessageImpl, findByMsgId, exception="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 342
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 345
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v3

    .line 332
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v1

    .line 333
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v5, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "MessageStoreImpl, findByMsgId, fail to add MessageStore exception="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 342
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v5

    .line 337
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 342
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_2
.end method

.method public getFirstUnreadMessageId(Ljava/lang/String;)I
    .locals 8
    .param p1, "chatId"    # Ljava/lang/String;

    .prologue
    .line 279
    const/4 v2, -0x1

    .line 281
    .local v2, "lastUnreadMsgId":I
    const-string/jumbo v3, "SELECT MESSAGEID FROM messagestore WHERE ISREAD=\'N\' AND CHATID=? ORDER BY SENTTIME ASC LIMIT 1"

    .line 285
    .local v3, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, getLastUnreadMessageId, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 289
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 290
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 292
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 294
    :try_start_1
    const-string/jumbo v4, "MESSAGEID"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    .line 298
    :goto_0
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 300
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 304
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 307
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_1
    return v2

    .line 295
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 296
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, getLastUnreadMessageId, fail to find last unread messageID="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 301
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 302
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageImpl, getLastUnreadMessageId, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 304
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_1

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v4
.end method

.method public getLatestMessageStoreByChatId(I)Lcom/pccw/database/entity/MessageStore;
    .locals 8
    .param p1, "chatId"    # I

    .prologue
    .line 144
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageImpl, findByChatId, starts"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    const/4 v2, 0x0

    .line 152
    .local v2, "messageStore":Lcom/pccw/database/entity/MessageStore;
    const-string/jumbo v3, "select * from messagestore where CHATID=? order by MESSAGEID desc limit 1 "

    .line 156
    .local v3, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByChatID, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 160
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 162
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 164
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByChatID, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 168
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->parseMessageStore(Landroid/database/Cursor;)Lcom/pccw/database/entity/MessageStore;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .line 172
    :goto_0
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    .line 174
    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 178
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 180
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_1
    return-object v2

    .line 169
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 170
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageStoreImpl, findByChatID, fail to add MessageStore exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 175
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 176
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageImpl, findByChatID, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 178
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_1

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v4
.end method

.method public getMsgCount(I)I
    .locals 7
    .param p1, "chatId"    # I

    .prologue
    .line 487
    const/4 v0, 0x0

    .line 489
    .local v0, "cnt":I
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 490
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "select * from messagestore where CHATID=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 492
    .local v3, "sql":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 493
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 494
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 499
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 502
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v3    # "sql":Ljava/lang/String;
    :goto_0
    return v0

    .line 496
    :catch_0
    move-exception v2

    .line 497
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageImpl, getUnreadMsgCount, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 499
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v4
.end method

.method public getUnreadMsgCount(Ljava/lang/String;Ljava/lang/String;)I
    .locals 7
    .param p1, "participant"    # Ljava/lang/String;
    .param p2, "chatId"    # Ljava/lang/String;

    .prologue
    .line 465
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "get unread participants: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    const/4 v0, 0x0

    .line 468
    .local v0, "cnt":I
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 470
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "select * from messagestore where ISREAD=\'N\' and CHATID=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 472
    .local v3, "sql":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 473
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 474
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 479
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 482
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v3    # "sql":Ljava/lang/String;
    :goto_0
    return v0

    .line 476
    :catch_0
    move-exception v2

    .line 477
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v4, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "MessageImpl, getUnreadMsgCount, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 479
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v4
.end method

.method public list()Ljava/util/ArrayList;
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
    .line 40
    iget-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "MessageImpl, list, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .local v10, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    const-string/jumbo v7, "CHATID ASC"

    .line 45
    .local v7, "orderBy":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 46
    iget-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "messagestore"

    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->MESSAGESTORE_TABLE_COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 48
    .local v8, "cursor":Landroid/database/Cursor;
    iget-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "MessageImpl, list, count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    invoke-direct {p0, v10, v8}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->addResultToMessageStoreList(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    .line 52
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 60
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v10

    .line 54
    :catch_0
    move-exception v9

    .line 55
    .local v9, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "MessageImpl, list, exception="

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

    .line 57
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v9    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v0
.end method

.method public open()V
    .locals 1

    .prologue
    .line 540
    iget-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 541
    return-void
.end method

.method protected parseMessageStore(Landroid/database/Cursor;)Lcom/pccw/database/entity/MessageStore;
    .locals 14
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 550
    const-string/jumbo v13, "MESSAGEID"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 551
    .local v11, "msgId":I
    const-string/jumbo v13, "SENDER"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 552
    .local v1, "sender":Ljava/lang/String;
    const-string/jumbo v13, "RECIPIENT"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 553
    .local v2, "recipient":Ljava/lang/String;
    const-string/jumbo v13, "TEXTMESSAGE"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 554
    .local v3, "textMessage":Ljava/lang/String;
    const-string/jumbo v13, "SENTTIME"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/pccw/mobile/util/FormatUtil;->convertStrToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    .line 555
    .local v4, "sentTime":Ljava/util/Date;
    const-string/jumbo v13, "SENTSTATUS"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 556
    .local v5, "sentStatus":Ljava/lang/String;
    const-string/jumbo v13, "ISREAD"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 557
    .local v6, "isRead":Ljava/lang/String;
    const-string/jumbo v13, "LOCALFILEPATH"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 558
    .local v7, "localfilepath":Ljava/lang/String;
    const-string/jumbo v13, "SERVERURIPATH"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 559
    .local v8, "serveruripath":Ljava/lang/String;
    const-string/jumbo v13, "MESSAGETYPE"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 560
    .local v9, "messagetype":Ljava/lang/String;
    const-string/jumbo v13, "SERVERMESSAGEID"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 561
    .local v12, "serverMessageId":Ljava/lang/String;
    const-string/jumbo v13, "CHATID"

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    invoke-interface {p1, v13}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 563
    .local v10, "chatid":I
    new-instance v0, Lcom/pccw/database/entity/MessageStore;

    invoke-direct/range {v0 .. v10}, Lcom/pccw/database/entity/MessageStore;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 564
    .local v0, "messageStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v0, v11}, Lcom/pccw/database/entity/MessageStore;->setMessageId(I)V

    .line 565
    invoke-virtual {v0, v12}, Lcom/pccw/database/entity/MessageStore;->setServerMessageId(Ljava/lang/String;)V

    .line 567
    return-object v0
.end method

.method public remove(Lcom/pccw/database/entity/MessageStore;)V
    .locals 8
    .param p1, "entity"    # Lcom/pccw/database/entity/MessageStore;

    .prologue
    .line 392
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "MessageImpl, remove, starts"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 393
    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v2

    if-lez v2, :cond_0

    .line 395
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 396
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "messagestore"

    const-string/jumbo v4, "MESSAGEID=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 397
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, remove, removed number of row="

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

    .line 403
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 411
    .end local v1    # "row":I
    :goto_0
    return-void

    .line 399
    :catch_0
    move-exception v0

    .line 400
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, remove, exception="

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

    .line 403
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v2

    .line 407
    :cond_0
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, remove, fail: id is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lcom/pccw/database/entity/MessageStore;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->remove(Lcom/pccw/database/entity/MessageStore;)V

    return-void
.end method

.method public removeMessageByChatID(Ljava/lang/String;)V
    .locals 7
    .param p1, "chatID"    # Ljava/lang/String;

    .prologue
    .line 414
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "MessageImpl, remove, starts"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    if-eqz p1, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 417
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 418
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "messagestore"

    const-string/jumbo v4, "CHATID=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 419
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, removeMessageByChatID, removed number of row="

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

    .line 425
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 433
    .end local v1    # "row":I
    :goto_0
    return-void

    .line 421
    :catch_0
    move-exception v0

    .line 422
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "MessageImpl, removeMessageByChatID, exception="

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

    .line 425
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v2

    .line 429
    :cond_0
    iget-object v2, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v3, "removeMessageByContactID chatID is null or empty"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public update(Lcom/pccw/database/entity/MessageStore;)I
    .locals 1
    .param p1, "entity"    # Lcom/pccw/database/entity/MessageStore;

    .prologue
    .line 387
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 19
    check-cast p1, Lcom/pccw/database/entity/MessageStore;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->update(Lcom/pccw/database/entity/MessageStore;)I

    move-result v0

    return v0
.end method

.method public updateIsRead(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "chatId"    # Ljava/lang/String;
    .param p2, "isRead"    # Ljava/lang/String;

    .prologue
    .line 235
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, update message store, sender = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ;isRead="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    const/4 v1, 0x0

    .line 239
    .local v1, "row":I
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 240
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 241
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "ISREAD"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "messagestore"

    const-string/jumbo v5, "ISREAD=\'N\' and CHATID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 244
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, updated number of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 250
    .end local v2    # "values":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 245
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, update message store, exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v3
.end method

.method public updateSentStatus(ILjava/lang/String;)I
    .locals 9
    .param p1, "msgId"    # I
    .param p2, "status"    # Ljava/lang/String;

    .prologue
    .line 186
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, update message store, messageId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    const/4 v1, 0x0

    .line 188
    .local v1, "row":I
    if-lez p1, :cond_0

    .line 190
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 191
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 192
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "SENTSTATUS"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "messagestore"

    const-string/jumbo v5, "MESSAGEID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    .line 194
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 193
    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 196
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, updated number of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 205
    .end local v2    # "values":Landroid/content/ContentValues;
    :goto_0
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, no of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    return v1

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, update message store, exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 200
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v3

    .line 203
    :cond_0
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, fail: msgId is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)I
    .locals 8
    .param p1, "serverMessageId"    # Ljava/lang/String;
    .param p2, "status"    # Ljava/lang/String;

    .prologue
    .line 211
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, update message store, serverMessageId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    const/4 v1, 0x0

    .line 213
    .local v1, "row":I
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 215
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 216
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 217
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "SENTSTATUS"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "messagestore"

    const-string/jumbo v5, "SERVERMESSAGEID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 221
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, updated number of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 225
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 230
    .end local v2    # "values":Landroid/content/ContentValues;
    :goto_0
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, no of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    return v1

    .line 222
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, update message store, exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 225
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v3

    .line 228
    :cond_0
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, fail: serverMessageId is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public updateServerMessageId(ILjava/lang/String;)I
    .locals 9
    .param p1, "msgId"    # I
    .param p2, "serverMessageId"    # Ljava/lang/String;

    .prologue
    .line 253
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, update message store, msgId = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ;serverMessageId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    const/4 v1, 0x0

    .line 256
    .local v1, "row":I
    if-lez p1, :cond_0

    .line 258
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->open()V

    .line 259
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 260
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "SERVERMESSAGEID"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "messagestore"

    const-string/jumbo v5, "MESSAGEID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    .line 262
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 261
    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 265
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, updated number of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    .line 274
    .end local v2    # "values":Landroid/content/ContentValues;
    :goto_0
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, no of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    return v1

    .line 266
    :catch_0
    move-exception v0

    .line 267
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, update message store, exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 269
    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->close()V

    throw v3

    .line 272
    :cond_0
    iget-object v3, p0, Lcom/pccw/database/dao/MessageStoreDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "MessageStoreDAOImpl, fail: msgId is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
