.class public Lcom/pccw/database/dao/ChatListDAOImpl;
.super Ljava/lang/Object;
.source "ChatListDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/ChatList;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field protected CHATLIST_TABLE_COLUMNS:[Ljava/lang/String;

.field public LOG_CHATLISTDAO:Ljava/lang/String;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const-string/jumbo v0, "ChatListDAOImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 29
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "CHATID"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "CHATCONTACT"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "MESSAGEID"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->CHATLIST_TABLE_COLUMNS:[Ljava/lang/String;

    .line 32
    iput-object p1, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->mContext:Landroid/content/Context;

    .line 33
    return-void
.end method

.method private getPhoneNumberLookUpKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "memberUserName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v8, 0x2

    .line 475
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 476
    .local v7, "lookUpKey":Ljava/lang/StringBuilder;
    iget-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->URI:Landroid/net/Uri;

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v5, "data1"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 478
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 479
    const-string/jumbo v0, " ("

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_2

    .line 481
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 482
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 483
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 487
    :cond_0
    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 485
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, ", \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 489
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 490
    const-string/jumbo v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/ChatList;)V
    .locals 6
    .param p1, "entity"    # Lcom/pccw/database/entity/ChatList;

    .prologue
    .line 364
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 366
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "CHATCONTACT"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ChatList;->getChatContact()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 367
    const-string/jumbo v3, "MESSAGEID"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ChatList;->getMessageId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 370
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 371
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "chatlist"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 372
    .local v0, "modelId":J
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListImpl, add, added ID="

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

    .line 377
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 380
    .end local v0    # "modelId":J
    :goto_0
    return-void

    .line 374
    :catch_0
    move-exception v3

    .line 377
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v3
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 22
    check-cast p1, Lcom/pccw/database/entity/ChatList;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->add(Lcom/pccw/database/entity/ChatList;)V

    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 390
    return-void
.end method

.method public find(Ljava/lang/Integer;)Lcom/pccw/database/entity/ChatList;
    .locals 1
    .param p1, "key"    # Ljava/lang/Integer;

    .prologue
    .line 72
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 22
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->find(Ljava/lang/Integer;)Lcom/pccw/database/entity/ChatList;

    move-result-object v0

    return-object v0
.end method

.method public findByChatContact(Ljava/lang/String;)Lcom/pccw/database/entity/ChatList;
    .locals 8
    .param p1, "chatContact"    # Ljava/lang/String;

    .prologue
    .line 213
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    const-string/jumbo v5, "ChatListImpl, findByChatContact, starts"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    const-string/jumbo v3, "SELECT * FROM chatlist WHERE CHATCONTACT = ?"

    .line 217
    .local v3, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, findByChatContact, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " ;chatcontact="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    const/4 v0, 0x0

    .line 221
    .local v0, "chatList":Lcom/pccw/database/entity/ChatList;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 222
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 223
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 224
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, findByChatContact, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 228
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/pccw/database/dao/ChatListDAOImpl;->parseChatList(Landroid/database/Cursor;)Lcom/pccw/database/entity/ChatList;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 232
    :goto_0
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 234
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 238
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 240
    .end local v1    # "cursor":Landroid/database/Cursor;
    :goto_1
    return-object v0

    .line 229
    .restart local v1    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v2

    .line 230
    .local v2, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, findByChatContact, fail to add MessageStore exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

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

    .line 235
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 236
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, findByChatContact, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 238
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_1

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v4
.end method

.method public findByChatId(I)Lcom/pccw/database/entity/ChatList;
    .locals 8
    .param p1, "chatId"    # I

    .prologue
    .line 246
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    const-string/jumbo v5, "ChatListImpl, findByChatContact, starts"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    const-string/jumbo v3, "SELECT * FROM chatlist WHERE CHATID = ?"

    .line 250
    .local v3, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, findByChatContact, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " ;chatId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    const/4 v0, 0x0

    .line 254
    .local v0, "chatList":Lcom/pccw/database/entity/ChatList;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 255
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 256
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 257
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, findByChatContact, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 261
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/pccw/database/dao/ChatListDAOImpl;->parseChatList(Landroid/database/Cursor;)Lcom/pccw/database/entity/ChatList;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 265
    :goto_0
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 267
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 271
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 273
    .end local v1    # "cursor":Landroid/database/Cursor;
    :goto_1
    return-object v0

    .line 262
    .restart local v1    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v2

    .line 263
    .local v2, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, findByChatContact, fail to add MessageStore exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

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

    .line 268
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 269
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, findByChatContact, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 271
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_1

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v4
.end method

.method public getAllChatRecordCursor()Landroid/database/Cursor;
    .locals 6

    .prologue
    .line 76
    const/4 v0, 0x0

    .line 78
    .local v0, "cursor":Landroid/database/Cursor;
    const-string/jumbo v2, "SELECT NULL AS _id,chatcontact,senttime,duration,calltype,callername,callertype,callerlabel,chatnumber,textmessage,chatid,entrytype,unreadcount,isimuser,messagetype  FROM ( SELECT chatcontact,senttime,\'\' AS duration,21 AS calltype,nickname AS callername,1 AS callertype,\'CACHED_NUMBER_LABEL\' AS callerlabel,chatcontact AS chatnumber,textmessage,chatid,\'individual\' AS entrytype,unreadcount,\'Y\' AS isimuser,messagetype  FROM allchatview  LEFT OUTER JOIN (SELECT username,nickname FROM userinfo) ON username=chatcontact UNION ALL SELECT chatcontact,CASE WHEN senttime IS NULL THEN createdate ELSE senttime END AS senttime,\'\' AS duration,21 AS calltype,groupname,1 AS callertype,\'CACHED_NUMBER_LABEL\' AS callerlabel,chatcontact,textmessage,chatid,\'group\' AS entrytype,unreadcount,\'Y\' AS isimuser,messagetype  FROM allchatview INNER JOIN (SELECT groupid,groupname,createdate FROM groupinfo) ON groupid=chatcontact ORDER BY senttime ASC ) GROUP BY chatnumber ORDER BY senttime DESC"

    .line 94
    .local v2, "query":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 97
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 98
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 106
    :goto_0
    return-object v0

    .line 100
    :catch_0
    move-exception v1

    .line 101
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "getAllChatRecordCursor, list, exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v3
.end method

.method public getChatListDetailByChatcontact(Ljava/lang/String;)Lcom/pccw/database/entity/ChatListUserInfo;
    .locals 7
    .param p1, "chatcontact"    # Ljava/lang/String;

    .prologue
    .line 168
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    const-string/jumbo v5, "ChatListImpl, findByChatListId, starts"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const/4 v0, 0x0

    .line 171
    .local v0, "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO, TYPE FROM (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO ,\'individual\' as TYPE FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN userinfo FI ON (FI.USERNAME = SG.CHATCONTACT) order by SENTTIME desc) t1 where CHATCONTACT=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\' union all select chatid, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO, \'\', \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "group"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\' as TYPE from (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN groupinfo FI ON (FI.groupid = SG.CHATCONTACT) order by SENTTIME desc) t1 where "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "CHATCONTACT"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "=\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\' order by senttime desc"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 182
    .local v3, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 186
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 187
    .local v1, "cursor":Landroid/database/Cursor;
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 189
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 191
    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 193
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/pccw/database/dao/ChatListDAOImpl;->parseChatListUserInfo(Landroid/database/Cursor;)Lcom/pccw/database/entity/ChatListUserInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 199
    :goto_0
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    .line 202
    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 206
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 208
    .end local v1    # "cursor":Landroid/database/Cursor;
    :goto_1
    return-object v0

    .line 196
    .restart local v1    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v2

    .line 197
    .local v2, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, fail to find scanGroupInfo exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

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

    .line 203
    .end local v1    # "cursor":Landroid/database/Cursor;
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 204
    .restart local v2    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "ChatListImpl, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 206
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_1

    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v4
.end method

.method public getChatListGroupInfo()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/ChatListUserInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    const-string/jumbo v1, "ChatListImpl, findByChatListId, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const/4 v0, 0x0

    return-object v0
.end method

.method public getChatListUserInfo()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/ChatListUserInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    iget-object v5, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    const-string/jumbo v6, "ChatListImpl, findByChatListId, starts"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .local v1, "chatListUserInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/ChatListUserInfo;>;"
    const-string/jumbo v4, "SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO, TYPE FROM (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, NICKNAME, PHOTO ,\'individual\' as TYPE FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN userinfo FI ON (FI.USERNAME = SG.CHATCONTACT) order by SENTTIME desc) t1 union all select chatid, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO, \'\', \'group\' as TYPE from (SELECT CHATID, CHATCONTACT, MESSAGEID, TEXTMESSAGE, SENTTIME, groupname, PHOTO FROM (SELECT * FROM chatlist C LEFT OUTER JOIN messagestore M ON C.MESSAGEID = M.MESSAGEID) SG INNER JOIN groupinfo FI ON (FI.groupid = SG.CHATCONTACT) order by SENTTIME desc) t1 order by senttime desc"

    .line 137
    .local v4, "query":Ljava/lang/String;
    iget-object v5, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ChatListImpl, query="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 141
    iget-object v5, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 142
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 144
    iget-object v5, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ChatListImpl, count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_0

    .line 148
    :try_start_1
    invoke-virtual {p0, v2}, Lcom/pccw/database/dao/ChatListDAOImpl;->parseChatListUserInfo(Landroid/database/Cursor;)Lcom/pccw/database/entity/ChatListUserInfo;

    move-result-object v0

    .line 149
    .local v0, "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 154
    .end local v0    # "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    :goto_1
    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 158
    .end local v2    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v3

    .line 159
    .local v3, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v5, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ChatListImpl, exception="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 161
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 163
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v1

    .line 151
    .restart local v2    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v3

    .line 152
    .restart local v3    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v5, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ChatListImpl, fail to find scanGroupInfo exception="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

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

    .line 161
    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v3    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v5

    .line 157
    .restart local v2    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 161
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_2
.end method

.method public list()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/ChatList;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    iget-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    const-string/jumbo v1, "ChatListImpl, list, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .local v8, "chatList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/ChatList;>;"
    const-string/jumbo v7, "CHATID ASC"

    .line 43
    .local v7, "orderBy":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 44
    iget-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "chatlist"

    iget-object v2, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->CHATLIST_TABLE_COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 45
    .local v9, "cursor":Landroid/database/Cursor;
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 47
    iget-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ChatListImpl, list, count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 51
    :try_start_1
    invoke-virtual {p0, v9}, Lcom/pccw/database/dao/ChatListDAOImpl;->parseChatList(Landroid/database/Cursor;)Lcom/pccw/database/entity/ChatList;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    :goto_1
    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 60
    .end local v9    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v10

    .line 61
    .local v10, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "ChatListImpl, list, exception="

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

    .line 63
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 66
    .end local v10    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v8

    .line 52
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v10

    .line 53
    .restart local v10    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

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

    .line 63
    .end local v9    # "cursor":Landroid/database/Cursor;
    .end local v10    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v0

    .line 58
    .restart local v9    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v9}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 63
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_2
.end method

.method public open()V
    .locals 1

    .prologue
    .line 384
    iget-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 385
    return-void
.end method

.method protected parseChatList(Landroid/database/Cursor;)Lcom/pccw/database/entity/ChatList;
    .locals 5
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 393
    const-string/jumbo v4, "CHATID"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 394
    .local v1, "chatId":I
    const-string/jumbo v4, "CHATCONTACT"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 396
    .local v0, "chatContact":Ljava/lang/String;
    const-string/jumbo v4, "MESSAGEID"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 397
    .local v3, "messageId":I
    new-instance v2, Lcom/pccw/database/entity/ChatList;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, v0, v4}, Lcom/pccw/database/entity/ChatList;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 398
    .local v2, "chatList":Lcom/pccw/database/entity/ChatList;
    invoke-virtual {v2, v1}, Lcom/pccw/database/entity/ChatList;->setChatId(I)V

    .line 399
    return-object v2
.end method

.method protected parseChatListUserInfo(Landroid/database/Cursor;)Lcom/pccw/database/entity/ChatListUserInfo;
    .locals 24
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 405
    const-string/jumbo v1, "CHATID"

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 406
    .local v9, "chatId":I
    const-string/jumbo v1, "CHATCONTACT"

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 408
    .local v8, "chatContact":Ljava/lang/String;
    const-string/jumbo v1, "MESSAGEID"

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    .line 409
    .local v16, "messageId":I
    const-string/jumbo v1, "TEXTMESSAGE"

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 410
    .local v22, "textMessage":Ljava/lang/String;
    const-string/jumbo v1, "SENTTIME"

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/util/FormatUtil;->convertStrToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v21

    .line 412
    .local v21, "sentTime":Ljava/util/Date;
    const-string/jumbo v1, "NICKNAME"

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 413
    .local v17, "nickName":Ljava/lang/String;
    const-string/jumbo v1, "PHOTO"

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v20

    .line 414
    .local v20, "photo":Ljava/lang/String;
    const-string/jumbo v1, "TYPE"

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 416
    .local v23, "type":Ljava/lang/String;
    if-eqz v23, :cond_4

    const-string/jumbo v1, "individual"

    .line 417
    move-object/from16 v0, v23

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 419
    const/4 v14, 0x0

    .line 420
    .local v14, "isChecked":Z
    const/4 v1, 0x3

    new-array v7, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v7, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "data1"

    aput-object v2, v7, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "lookup"

    aput-object v2, v7, v1

    .line 424
    .local v7, "PROJECTION":[Ljava/lang/String;
    invoke-static {v8}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 425
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/pccw/database/dao/ChatListDAOImpl;->getPhoneNumberLookUpKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 427
    .local v15, "lookUpKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/database/dao/ChatListDAOImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "lookup IN "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const-string/jumbo v6, "display_name"

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 428
    .local v11, "contactCursor":Landroid/database/Cursor;
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 429
    :cond_0
    :goto_0
    invoke-interface {v11}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_3

    if-nez v14, :cond_3

    .line 430
    const/4 v1, 0x0

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 431
    .local v12, "contactId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/database/dao/ChatListDAOImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v4, "contact_id = ?"

    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v12, v5, v3

    const/4 v6, 0x0

    move-object v3, v7

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v19

    .line 433
    .local v19, "numCursor":Landroid/database/Cursor;
    if-eqz v19, :cond_0

    .line 437
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->moveToFirst()Z

    .line 438
    :goto_1
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_2

    .line 439
    const-string/jumbo v1, "data1"

    move-object/from16 v0, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 440
    .local v18, "normNumber":Ljava/lang/String;
    if-eqz v18, :cond_1

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 442
    const/4 v1, 0x1

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 443
    .local v13, "displayName":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v13, :cond_1

    .line 444
    move-object/from16 v17, v13

    .line 445
    const/4 v14, 0x1

    .line 448
    .end local v13    # "displayName":Ljava/lang/String;
    :cond_1
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 450
    .end local v18    # "normNumber":Ljava/lang/String;
    :cond_2
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->close()V

    .line 451
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 453
    .end local v12    # "contactId":Ljava/lang/String;
    .end local v19    # "numCursor":Landroid/database/Cursor;
    :cond_3
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 456
    .end local v7    # "PROJECTION":[Ljava/lang/String;
    .end local v11    # "contactCursor":Landroid/database/Cursor;
    .end local v14    # "isChecked":Z
    .end local v15    # "lookUpKey":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " ;chatContact="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " ;messageId"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ";type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ";nickname="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    new-instance v10, Lcom/pccw/database/entity/ChatListUserInfo;

    invoke-direct {v10}, Lcom/pccw/database/entity/ChatListUserInfo;-><init>()V

    .line 459
    .local v10, "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    invoke-virtual {v10, v9}, Lcom/pccw/database/entity/ChatListUserInfo;->setChatId(I)V

    .line 460
    invoke-virtual {v10, v8}, Lcom/pccw/database/entity/ChatListUserInfo;->setChatContact(Ljava/lang/String;)V

    .line 462
    move/from16 v0, v16

    invoke-virtual {v10, v0}, Lcom/pccw/database/entity/ChatListUserInfo;->setMessageId(I)V

    .line 463
    move-object/from16 v0, v22

    invoke-virtual {v10, v0}, Lcom/pccw/database/entity/ChatListUserInfo;->setTextMessage(Ljava/lang/String;)V

    .line 464
    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Lcom/pccw/database/entity/ChatListUserInfo;->setSentTime(Ljava/util/Date;)V

    .line 466
    move-object/from16 v0, v17

    invoke-virtual {v10, v0}, Lcom/pccw/database/entity/ChatListUserInfo;->setNickName(Ljava/lang/String;)V

    .line 467
    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Lcom/pccw/database/entity/ChatListUserInfo;->setPhoto(Ljava/lang/String;)V

    .line 469
    move-object/from16 v0, v23

    invoke-virtual {v10, v0}, Lcom/pccw/database/entity/ChatListUserInfo;->setType(Ljava/lang/String;)V

    .line 471
    return-object v10
.end method

.method public remove(Lcom/pccw/database/entity/ChatList;)V
    .locals 9
    .param p1, "entity"    # Lcom/pccw/database/entity/ChatList;

    .prologue
    .line 330
    invoke-virtual {p1}, Lcom/pccw/database/entity/ChatList;->getChatId()I

    move-result v0

    .line 332
    .local v0, "chatId":I
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 333
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "chatlist"

    const-string/jumbo v5, "CHATID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v4, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 334
    .local v2, "row":I
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListDAOImpl, remove, removed number of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 343
    .end local v2    # "row":I
    :goto_0
    return-void

    .line 336
    :catch_0
    move-exception v1

    .line 337
    .local v1, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListDAOImpl, remove, exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 340
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_0

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v3
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 22
    check-cast p1, Lcom/pccw/database/entity/ChatList;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->remove(Lcom/pccw/database/entity/ChatList;)V

    return-void
.end method

.method public removeChatRecord(Ljava/lang/String;)V
    .locals 7
    .param p1, "chatId"    # Ljava/lang/String;

    .prologue
    .line 348
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 349
    iget-object v2, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "chatlist"

    const-string/jumbo v4, "CHATID=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 350
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "ChatListDAOImpl, removeChatRecord, removed number of row="

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

    .line 356
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 359
    .end local v1    # "row":I
    :goto_0
    return-void

    .line 352
    :catch_0
    move-exception v0

    .line 353
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "ChatListDAOImpl, removeChatRecord, exception="

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

    .line 356
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v2
.end method

.method public update(Lcom/pccw/database/entity/ChatList;)I
    .locals 9
    .param p1, "entity"    # Lcom/pccw/database/entity/ChatList;

    .prologue
    .line 301
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    const-string/jumbo v4, "ChatListDAOImpl, update, starts"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    const/4 v1, 0x0

    .line 303
    .local v1, "row":I
    invoke-virtual {p1}, Lcom/pccw/database/entity/ChatList;->getChatId()I

    move-result v3

    if-lez v3, :cond_0

    .line 304
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 306
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "CHATCONTACT"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ChatList;->getChatContact()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    const-string/jumbo v3, "MESSAGEID"

    invoke-virtual {p1}, Lcom/pccw/database/entity/ChatList;->getMessageId()Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 310
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 311
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "chatlist"

    const-string/jumbo v5, "CHATID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string/jumbo v8, "CHATID"

    .line 312
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 311
    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 314
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListImpl, update, updated number of row="

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

    .line 318
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 323
    .end local v2    # "values":Landroid/content/ContentValues;
    :goto_0
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListImpl, update, no of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    return v1

    .line 315
    .restart local v2    # "values":Landroid/content/ContentValues;
    :catch_0
    move-exception v0

    .line 316
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListImpl, update, exception="

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

    .line 318
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v3

    .line 321
    .end local v2    # "values":Landroid/content/ContentValues;
    :cond_0
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListImpl, update, fail: scan group id is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/pccw/database/entity/ChatList;->getChatId()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 22
    check-cast p1, Lcom/pccw/database/entity/ChatList;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->update(Lcom/pccw/database/entity/ChatList;)I

    move-result v0

    return v0
.end method

.method public updateMessageIdForChatList(II)V
    .locals 9
    .param p1, "chatId"    # I
    .param p2, "messageId"    # I

    .prologue
    .line 278
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    const-string/jumbo v4, "ChatListDAOImpl, update, starts"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    const/4 v1, 0x0

    .line 280
    .local v1, "row":I
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 281
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "MESSAGEID"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 284
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->open()V

    .line 285
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "chatlist"

    const-string/jumbo v5, "CHATID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    .line 286
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    .line 285
    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 288
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListImpl, update, updated number of row="

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

    .line 292
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    .line 295
    :goto_0
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListImpl, update, no of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    return-void

    .line 289
    :catch_0
    move-exception v0

    .line 290
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/ChatListDAOImpl;->LOG_CHATLISTDAO:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "ChatListImpl, update, exception="

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

    .line 292
    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/ChatListDAOImpl;->close()V

    throw v3
.end method
