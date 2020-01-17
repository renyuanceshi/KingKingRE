.class public Lcom/pccw/sms/service/CallLogIMService;
.super Ljava/lang/Object;
.source "CallLogIMService.java"


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field protected callLogTempImpl:Lcom/pccw/database/dao/CallLogTempDAOImpl;

.field protected context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string/jumbo v0, "CallLogIMService"

    iput-object v0, p0, Lcom/pccw/sms/service/CallLogIMService;->LOG_TAG:Ljava/lang/String;

    .line 26
    iput-object p1, p0, Lcom/pccw/sms/service/CallLogIMService;->context:Landroid/content/Context;

    .line 27
    new-instance v0, Lcom/pccw/database/dao/CallLogTempDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/CallLogTempDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/CallLogIMService;->callLogTempImpl:Lcom/pccw/database/dao/CallLogTempDAOImpl;

    .line 28
    return-void
.end method

.method private isCallType(Lcom/pccw/database/entity/MessageStore;)Z
    .locals 3
    .param p1, "messageStore"    # Lcom/pccw/database/entity/MessageStore;

    .prologue
    .line 31
    const/4 v0, 0x0

    .line 32
    .local v0, "isCallType":Z
    sget-object v1, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_INCOMING_CALL:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_OUTGOING_CALL:Ljava/lang/String;

    .line 33
    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_MISSING_CALL:Ljava/lang/String;

    .line 34
    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_OTHERS_CALL:Ljava/lang/String;

    .line 35
    invoke-virtual {p1}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 36
    :cond_0
    const/4 v0, 0x1

    .line 38
    :cond_1
    return v0
.end method


# virtual methods
.method public addCallLogAll(Landroid/database/Cursor;)V
    .locals 10
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 105
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v6, "callLogTempEntities":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/CallLogTemp;>;"
    if-eqz p1, :cond_0

    .line 108
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 109
    const/4 v7, 0x4

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 110
    .local v5, "contactNumber":Ljava/lang/String;
    const/4 v7, 0x1

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 111
    .local v3, "date":Ljava/lang/String;
    const/4 v7, 0x2

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 113
    .local v4, "duration":Ljava/lang/String;
    sget-object v2, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_OTHERS_CALL:Ljava/lang/String;

    .line 114
    .local v2, "type":Ljava/lang/String;
    const/4 v7, 0x3

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 127
    :goto_1
    invoke-static {v5}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 128
    .local v1, "chatNumber":Ljava/lang/String;
    const-string/jumbo v7, "KKIM"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "adding record to callLogTemp table: ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ","

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    new-instance v0, Lcom/pccw/database/entity/CallLogTemp;

    invoke-direct/range {v0 .. v5}, Lcom/pccw/database/entity/CallLogTemp;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .local v0, "callLogTempEntity":Lcom/pccw/database/entity/CallLogTemp;
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 117
    .end local v0    # "callLogTempEntity":Lcom/pccw/database/entity/CallLogTemp;
    .end local v1    # "chatNumber":Ljava/lang/String;
    :pswitch_0
    sget-object v2, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_MISSING_CALL:Ljava/lang/String;

    .line 118
    goto :goto_1

    .line 120
    :pswitch_1
    sget-object v2, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_OUTGOING_CALL:Ljava/lang/String;

    .line 121
    goto :goto_1

    .line 123
    :pswitch_2
    sget-object v2, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_INCOMING_CALL:Ljava/lang/String;

    goto :goto_1

    .line 135
    .end local v2    # "type":Ljava/lang/String;
    .end local v3    # "date":Ljava/lang/String;
    .end local v4    # "duration":Ljava/lang/String;
    .end local v5    # "contactNumber":Ljava/lang/String;
    :cond_0
    iget-object v7, p0, Lcom/pccw/sms/service/CallLogIMService;->callLogTempImpl:Lcom/pccw/database/dao/CallLogTempDAOImpl;

    invoke-virtual {v7, v6}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->addList(Ljava/util/ArrayList;)V

    .line 137
    return-void

    .line 114
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public clearCallLogAll()V
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lcom/pccw/sms/service/CallLogIMService;->callLogTempImpl:Lcom/pccw/database/dao/CallLogTempDAOImpl;

    invoke-virtual {v0}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->removeAllFromCallLogTemp()V

    .line 103
    return-void
.end method

.method public getAllCallLogTemp()Ljava/util/ArrayList;
    .locals 3
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
    .line 140
    const-string/jumbo v1, "KKIM"

    const-string/jumbo v2, "getAllCallLogTemp start"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    iget-object v1, p0, Lcom/pccw/sms/service/CallLogIMService;->callLogTempImpl:Lcom/pccw/database/dao/CallLogTempDAOImpl;

    invoke-virtual {v1}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->list()Ljava/util/ArrayList;

    move-result-object v0

    .line 143
    .local v0, "callLogTempRecords":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/CallLogTemp;>;"
    return-object v0
.end method

.method public getChatPageData(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;
    .locals 20
    .param p1, "chatPageInfo"    # Lcom/pccw/database/entity/ChatPageInfo;
    .param p2, "pageNo"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/pccw/database/entity/ChatPageInfo;",
            "I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/sms/bean/MessageItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/CallLogIMService;->callLogTempImpl:Lcom/pccw/database/dao/CallLogTempDAOImpl;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->dropChatLogView()V

    .line 42
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/CallLogIMService;->callLogTempImpl:Lcom/pccw/database/dao/CallLogTempDAOImpl;

    move-object/from16 v16, v0

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getRecipient()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v16 .. v18}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->createChatLogView(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/CallLogIMService;->callLogTempImpl:Lcom/pccw/database/dao/CallLogTempDAOImpl;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/database/dao/CallLogTempDAOImpl;->listChatPageDataWithPage(I)Ljava/util/ArrayList;

    move-result-object v15

    .line 46
    .local v15, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .local v2, "messageItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_5

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/pccw/database/entity/MessageStore;

    .line 48
    .local v14, "messageStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getChatid()I

    move-result v17

    move/from16 v0, v17

    int-to-long v4, v0

    .line 53
    .local v4, "id":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/CallLogIMService;->LOG_TAG:Ljava/lang/String;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "->sender:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getSender()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ;recipient:"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getRecipient()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ;r="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getRecipient()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ;owner="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getOwner()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/pccw/sms/service/CallLogIMService;->isCallType(Lcom/pccw/database/entity/MessageStore;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 58
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/CallLogIMService;->LOG_TAG:Ljava/lang/String;

    move-object/from16 v17, v0

    const-string/jumbo v18, "Call record found"

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    sget-object v17, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_INCOMING_CALL:Ljava/lang/String;

    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_0

    sget-object v17, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_MISSING_CALL:Ljava/lang/String;

    .line 60
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 61
    :cond_0
    const/4 v9, 0x0

    .line 81
    .local v9, "direction":I
    :goto_1
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getSender()Ljava/lang/String;

    move-result-object v7

    .line 82
    .local v7, "sender":Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "content":Ljava/lang/String;
    const/4 v6, 0x0

    .line 83
    .local v6, "filePath":Ljava/lang/String;
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v11

    .line 85
    .local v11, "msgType":Ljava/lang/String;
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getTextMessage()Ljava/lang/String;

    move-result-object v8

    .line 86
    const/4 v6, 0x0

    .line 88
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getSentTime()Ljava/util/Date;

    move-result-object v10

    .line 89
    .local v10, "lastMsgTime":Ljava/util/Date;
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getSentStatus()Ljava/lang/String;

    move-result-object v12

    .line 90
    .local v12, "sentStatus":Ljava/lang/String;
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getIsRead()Ljava/lang/String;

    move-result-object v13

    .line 92
    .local v13, "isRead":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/CallLogIMService;->LOG_TAG:Ljava/lang/String;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "from="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getSender()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ;filePath="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ;msgType="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, ";sentStatus="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ;direction="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ;content="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, " ;isRead="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    new-instance v3, Lcom/pccw/sms/bean/MessageItem;

    invoke-direct/range {v3 .. v13}, Lcom/pccw/sms/bean/MessageItem;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .local v3, "msgItem":Lcom/pccw/sms/bean/MessageItem;
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v3, v0}, Lcom/pccw/sms/bean/MessageItem;->setMsgId(I)V

    .line 96
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 63
    .end local v3    # "msgItem":Lcom/pccw/sms/bean/MessageItem;
    .end local v6    # "filePath":Ljava/lang/String;
    .end local v7    # "sender":Ljava/lang/String;
    .end local v8    # "content":Ljava/lang/String;
    .end local v9    # "direction":I
    .end local v10    # "lastMsgTime":Ljava/util/Date;
    .end local v11    # "msgType":Ljava/lang/String;
    .end local v12    # "sentStatus":Ljava/lang/String;
    .end local v13    # "isRead":Ljava/lang/String;
    :cond_1
    sget-object v17, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_OUTGOING_CALL:Ljava/lang/String;

    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 64
    const/4 v9, 0x1

    .restart local v9    # "direction":I
    goto/16 :goto_1

    .line 67
    .end local v9    # "direction":I
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/CallLogIMService;->LOG_TAG:Ljava/lang/String;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "invalid call type is found ["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, "] - Skipping this record"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 74
    :cond_3
    invoke-virtual {v14}, Lcom/pccw/database/entity/MessageStore;->getRecipient()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getOwner()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_4

    .line 75
    const/4 v9, 0x0

    .restart local v9    # "direction":I
    goto/16 :goto_1

    .line 77
    .end local v9    # "direction":I
    :cond_4
    const/4 v9, 0x1

    .restart local v9    # "direction":I
    goto/16 :goto_1

    .line 99
    .end local v4    # "id":J
    .end local v9    # "direction":I
    .end local v14    # "messageStore":Lcom/pccw/database/entity/MessageStore;
    :cond_5
    return-object v2
.end method
