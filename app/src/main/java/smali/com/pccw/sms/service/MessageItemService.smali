.class public Lcom/pccw/sms/service/MessageItemService;
.super Ljava/lang/Object;
.source "MessageItemService.java"


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field protected context:Landroid/content/Context;

.field protected messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const-string/jumbo v0, "MessageItemService"

    iput-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->LOG_TAG:Ljava/lang/String;

    .line 25
    iput-object p1, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 26
    new-instance v0, Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    .line 27
    return-void
.end method

.method private getParsedSystemMessage(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/pccw/database/dao/UserInfoDAOImpl;)Ljava/lang/String;
    .locals 7
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "user"    # Ljava/lang/String;
    .param p3, "content"    # [Ljava/lang/String;
    .param p4, "userInfoImpl"    # Lcom/pccw/database/dao/UserInfoDAOImpl;

    .prologue
    .line 181
    const-string/jumbo v2, ""

    .line 182
    .local v2, "msg":Ljava/lang/String;
    const-string/jumbo v4, ""

    .line 183
    .local v4, "subj":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 184
    .local v3, "obj":Ljava/lang/String;
    const/4 v1, 0x0

    .line 186
    .local v1, "contact":Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;
    array-length v5, p3

    const/4 v6, 0x2

    if-ne v5, v6, :cond_c

    .line 187
    sget-object v5, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_ADD:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, 0x0

    aget-object v5, p3, v5

    .line 188
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x0

    aget-object v5, p3, v5

    const/4 v6, 0x1

    aget-object v6, p3, v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 189
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070161

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 199
    .local v0, "SUBJ_ACTION":Ljava/lang/String;
    :goto_0
    const/4 v5, 0x0

    aget-object v4, p3, v5

    .line 200
    const/4 v5, 0x1

    aget-object v3, p3, v5

    .line 202
    invoke-virtual {p4, v4}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v1

    .line 203
    const/4 v5, 0x0

    aget-object v5, p3, v5

    const/4 v6, 0x1

    aget-object v6, p3, v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 206
    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 207
    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070160

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 212
    :goto_1
    const/4 v5, 0x1

    aget-object v5, p3, v5

    invoke-virtual {p4, v5}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v1

    .line 213
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 215
    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 216
    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070160

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 244
    .end local v0    # "SUBJ_ACTION":Ljava/lang/String;
    :goto_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 245
    return-object v2

    .line 189
    :cond_0
    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 190
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07015d

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    aget-object v5, p3, v5

    .line 191
    invoke-virtual {p2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v5, 0x0

    aget-object v5, p3, v5

    const/4 v6, 0x1

    aget-object v6, p3, v6

    .line 192
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 193
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070162

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_2
    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 194
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07015f

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_3
    const/4 v5, 0x0

    aget-object v5, p3, v5

    const/4 v6, 0x1

    aget-object v6, p3, v6

    .line 195
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 196
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07015e

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_4
    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 197
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07015f

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 209
    .restart local v0    # "SUBJ_ACTION":Ljava/lang/String;
    :cond_5
    const-string/jumbo v5, ""

    iget-object v6, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    iget-object v5, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v5, :cond_6

    iget-object v4, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    .line 210
    :goto_3
    goto/16 :goto_1

    :cond_6
    invoke-static {v4}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 218
    :cond_7
    const-string/jumbo v5, ""

    iget-object v6, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_8

    iget-object v5, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v5, :cond_8

    iget-object v3, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    .line 219
    :goto_4
    goto/16 :goto_2

    :cond_8
    invoke-static {v3}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    .line 222
    :cond_9
    move-object v4, v3

    .line 223
    const-string/jumbo v3, ""

    .line 224
    move-object v2, v0

    .line 226
    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 227
    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f070160

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_2

    .line 230
    :cond_a
    const-string/jumbo v5, ""

    iget-object v6, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_b

    iget-object v5, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v5, :cond_b

    iget-object v4, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    .line 232
    :goto_5
    const/4 v5, 0x1

    aget-object v5, p3, v5

    invoke-virtual {p4, v5}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v1

    goto/16 :goto_2

    .line 231
    :cond_b
    invoke-static {v4}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_5

    .line 237
    .end local v0    # "SUBJ_ACTION":Ljava/lang/String;
    :cond_c
    sget-object v5, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_ADD:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 238
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07015d

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 240
    :goto_6
    const/4 v5, 0x0

    aget-object v5, p3, v5

    invoke-virtual {p4, v5}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v1

    .line 241
    const-string/jumbo v5, ""

    iget-object v6, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_e

    iget-object v5, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v5, :cond_e

    iget-object v3, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    :goto_7
    goto/16 :goto_2

    .line 238
    :cond_d
    iget-object v5, p0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    .line 239
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07015f

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    .line 241
    :cond_e
    const/4 v5, 0x0

    aget-object v5, p3, v5

    invoke-static {v5}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7
.end method


# virtual methods
.method public addMessageItem(Ljava/lang/String;Ljava/lang/String;Lcom/pccw/sms/bean/MessageItem;)V
    .locals 16
    .param p1, "owner"    # Ljava/lang/String;
    .param p2, "recipient"    # Ljava/lang/String;
    .param p3, "messageItem"    # Lcom/pccw/sms/bean/MessageItem;

    .prologue
    .line 85
    const/4 v12, 0x0

    .line 87
    .local v12, "chatid":I
    if-eqz p3, :cond_0

    .line 89
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/sms/service/MessageItemService;->LOG_TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "dir="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getDirection()I

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ";receipt="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, ";owner="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getDirection()I

    move-result v13

    if-nez v13, :cond_1

    .line 92
    move-object/from16 v3, p2

    .line 93
    .local v3, "from":Ljava/lang/String;
    move-object/from16 v4, p1

    .line 99
    .local v4, "to":Ljava/lang/String;
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getContent()Ljava/lang/String;

    move-result-object v5

    .line 100
    .local v5, "textMessage":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getLastMsgTime()Ljava/util/Date;

    move-result-object v6

    .line 101
    .local v6, "sentTime":Ljava/util/Date;
    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getSentStatus()Ljava/lang/String;

    move-result-object v7

    .line 103
    .local v7, "sentStatus":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getIsRead()Ljava/lang/String;

    move-result-object v8

    .line 104
    .local v8, "isRead":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getFilePath()Ljava/lang/String;

    move-result-object v9

    .line 105
    .local v9, "localfilepath":Ljava/lang/String;
    const-string/jumbo v10, ""

    .line 106
    .local v10, "serveruripath":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getMsgType()Ljava/lang/String;

    move-result-object v11

    .line 107
    .local v11, "messagetype":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Lcom/pccw/sms/bean/MessageItem;->getChatId()J

    move-result-wide v14

    long-to-int v12, v14

    .line 109
    new-instance v2, Lcom/pccw/database/entity/MessageStore;

    invoke-direct/range {v2 .. v12}, Lcom/pccw/database/entity/MessageStore;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 110
    .local v2, "messageStore":Lcom/pccw/database/entity/MessageStore;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v13, v2}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->add(Lcom/pccw/database/entity/MessageStore;)V

    .line 115
    .end local v2    # "messageStore":Lcom/pccw/database/entity/MessageStore;
    .end local v3    # "from":Ljava/lang/String;
    .end local v4    # "to":Ljava/lang/String;
    .end local v5    # "textMessage":Ljava/lang/String;
    .end local v6    # "sentTime":Ljava/util/Date;
    .end local v7    # "sentStatus":Ljava/lang/String;
    .end local v8    # "isRead":Ljava/lang/String;
    .end local v9    # "localfilepath":Ljava/lang/String;
    .end local v10    # "serveruripath":Ljava/lang/String;
    .end local v11    # "messagetype":Ljava/lang/String;
    :cond_0
    return-void

    .line 95
    :cond_1
    move-object/from16 v3, p1

    .line 96
    .restart local v3    # "from":Ljava/lang/String;
    move-object/from16 v4, p2

    .restart local v4    # "to":Ljava/lang/String;
    goto :goto_0
.end method

.method public deleteChatByChatId(Ljava/lang/String;)I
    .locals 1
    .param p1, "chatId"    # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->deleteChatByChatId(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public deleteMessageByMsgId(Ljava/lang/String;)I
    .locals 1
    .param p1, "msgId"    # Ljava/lang/String;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->deleteMessageByMsgId(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getAllSentMessageWithChatId(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
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
    .line 151
    iget-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->getAllSentMessageWithChatId(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getFirstUnreadMessageId(Ljava/lang/String;)I
    .locals 2
    .param p1, "chatId"    # Ljava/lang/String;

    .prologue
    .line 146
    iget-object v1, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->getFirstUnreadMessageId(Ljava/lang/String;)I

    move-result v0

    .line 147
    .local v0, "pos":I
    return v0
.end method

.method public getLastMessage(I)Lcom/pccw/database/entity/MessageStore;
    .locals 2
    .param p1, "chatId"    # I

    .prologue
    .line 119
    iget-object v1, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->getLatestMessageStoreByChatId(I)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    .line 120
    .local v0, "msgStore":Lcom/pccw/database/entity/MessageStore;
    return-object v0
.end method

.method public getMessageItem(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;
    .locals 24
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
    .line 31
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .local v4, "messageItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    move-object/from16 v20, v0

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v21

    move-object/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->findByChatIDWithPage(II)Ljava/util/ArrayList;

    move-result-object v17

    .line 36
    .local v17, "messageStoreList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/MessageStore;>;"
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_0
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_4

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/pccw/database/entity/MessageStore;

    .line 37
    .local v16, "messageStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getChatid()I

    move-result v21

    move/from16 v0, v21

    int-to-long v6, v0

    .line 42
    .local v6, "id":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/MessageItemService;->LOG_TAG:Ljava/lang/String;

    move-object/from16 v21, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "->sender:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getSender()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, " ;recipient:"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getRecipient()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, " ;r="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getRecipient()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, " ;owner="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getOwner()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getRecipient()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getOwner()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_1

    .line 45
    const/4 v11, 0x0

    .line 50
    .local v11, "direction":I
    :goto_1
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getSender()Ljava/lang/String;

    move-result-object v9

    .line 51
    .local v9, "sender":Ljava/lang/String;
    const/4 v10, 0x0

    .local v10, "content":Ljava/lang/String;
    const/4 v8, 0x0

    .line 52
    .local v8, "filePath":Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getMessagetype()Ljava/lang/String;

    move-result-object v13

    .line 53
    .local v13, "msgType":Ljava/lang/String;
    new-instance v19, Lcom/pccw/database/dao/UserInfoDAOImpl;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/MessageItemService;->context:Landroid/content/Context;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/pccw/database/dao/UserInfoDAOImpl;-><init>(Landroid/content/Context;)V

    .line 55
    .local v19, "userInfoImpl":Lcom/pccw/database/dao/UserInfoDAOImpl;
    sget-object v21, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_TEXT:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_2

    .line 56
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getTextMessage()Ljava/lang/String;

    move-result-object v10

    .line 57
    const/4 v8, 0x0

    .line 66
    :cond_0
    :goto_2
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getSentTime()Ljava/util/Date;

    move-result-object v12

    .line 67
    .local v12, "lastMsgTime":Ljava/util/Date;
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getSentStatus()Ljava/lang/String;

    move-result-object v14

    .line 68
    .local v14, "sentStatus":Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getIsRead()Ljava/lang/String;

    move-result-object v15

    .line 70
    .local v15, "isRead":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/service/MessageItemService;->LOG_TAG:Ljava/lang/String;

    move-object/from16 v21, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "from="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getSender()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, " ;filePath="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, " ;msgType="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, ";sentStatus="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, " ;direction="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, " ;content="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, " ;isRead="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    new-instance v5, Lcom/pccw/sms/bean/MessageItem;

    invoke-direct/range {v5 .. v15}, Lcom/pccw/sms/bean/MessageItem;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .local v5, "msgItem":Lcom/pccw/sms/bean/MessageItem;
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getMessageId()I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Lcom/pccw/sms/bean/MessageItem;->setMsgId(I)V

    .line 74
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 47
    .end local v5    # "msgItem":Lcom/pccw/sms/bean/MessageItem;
    .end local v8    # "filePath":Ljava/lang/String;
    .end local v9    # "sender":Ljava/lang/String;
    .end local v10    # "content":Ljava/lang/String;
    .end local v11    # "direction":I
    .end local v12    # "lastMsgTime":Ljava/util/Date;
    .end local v13    # "msgType":Ljava/lang/String;
    .end local v14    # "sentStatus":Ljava/lang/String;
    .end local v15    # "isRead":Ljava/lang/String;
    .end local v19    # "userInfoImpl":Lcom/pccw/database/dao/UserInfoDAOImpl;
    :cond_1
    const/4 v11, 0x1

    .restart local v11    # "direction":I
    goto/16 :goto_1

    .line 58
    .restart local v8    # "filePath":Ljava/lang/String;
    .restart local v9    # "sender":Ljava/lang/String;
    .restart local v10    # "content":Ljava/lang/String;
    .restart local v13    # "msgType":Ljava/lang/String;
    .restart local v19    # "userInfoImpl":Lcom/pccw/database/dao/UserInfoDAOImpl;
    :cond_2
    sget-object v21, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_ADD:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_3

    sget-object v21, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_DELETE:Ljava/lang/String;

    .line 59
    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 60
    :cond_3
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/database/entity/MessageStore;->getTextMessage()Ljava/lang/String;

    move-result-object v21

    sget-object v22, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_SYSTEM_SEPARATOR:Ljava/lang/String;

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v18

    .line 61
    .local v18, "messages":[Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/pccw/database/entity/ChatPageInfo;->getOwner()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object/from16 v2, v18

    move-object/from16 v3, v19

    invoke-direct {v0, v13, v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->getParsedSystemMessage(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/pccw/database/dao/UserInfoDAOImpl;)Ljava/lang/String;

    move-result-object v10

    .line 63
    const/4 v8, 0x0

    goto/16 :goto_2

    .line 78
    .end local v6    # "id":J
    .end local v8    # "filePath":Ljava/lang/String;
    .end local v9    # "sender":Ljava/lang/String;
    .end local v10    # "content":Ljava/lang/String;
    .end local v11    # "direction":I
    .end local v13    # "msgType":Ljava/lang/String;
    .end local v16    # "messageStore":Lcom/pccw/database/entity/MessageStore;
    .end local v18    # "messages":[Ljava/lang/String;
    .end local v19    # "userInfoImpl":Lcom/pccw/database/dao/UserInfoDAOImpl;
    :cond_4
    return-object v4
.end method

.method public getMessageStoreByMsgId(I)Lcom/pccw/database/entity/MessageStore;
    .locals 2
    .param p1, "msgId"    # I

    .prologue
    .line 137
    iget-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->find(Ljava/lang/Integer;)Lcom/pccw/database/entity/MessageStore;

    move-result-object v0

    return-object v0
.end method

.method public updateIsRead(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "chatId"    # Ljava/lang/String;
    .param p2, "isRead"    # Ljava/lang/String;

    .prologue
    .line 142
    iget-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    const-string/jumbo v1, "Y"

    invoke-virtual {v0, p1, v1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->updateIsRead(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    return-void
.end method

.method public updateSentStatus(ILjava/lang/String;)V
    .locals 1
    .param p1, "msgId"    # I
    .param p2, "status"    # Ljava/lang/String;

    .prologue
    .line 124
    iget-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v0, p1, p2}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->updateSentStatus(ILjava/lang/String;)I

    .line 126
    return-void
.end method

.method public updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "serverMessageId"    # Ljava/lang/String;
    .param p2, "status"    # Ljava/lang/String;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v0, p1, p2}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->updateSentStatusByServerMessageId(Ljava/lang/String;Ljava/lang/String;)I

    .line 130
    return-void
.end method

.method public updateServerMessageId(ILjava/lang/String;)V
    .locals 1
    .param p1, "msgId"    # I
    .param p2, "serverMsgId"    # Ljava/lang/String;

    .prologue
    .line 133
    iget-object v0, p0, Lcom/pccw/sms/service/MessageItemService;->messageStoreImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v0, p1, p2}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->updateServerMessageId(ILjava/lang/String;)I

    .line 134
    return-void
.end method
