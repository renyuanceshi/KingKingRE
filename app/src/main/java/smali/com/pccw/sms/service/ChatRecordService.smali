.class public Lcom/pccw/sms/service/ChatRecordService;
.super Ljava/lang/Object;
.source "ChatRecordService.java"


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field protected chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

.field protected context:Landroid/content/Context;

.field protected messageStoreDAOImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const-string/jumbo v0, "ChatRecordService"

    iput-object v0, p0, Lcom/pccw/sms/service/ChatRecordService;->LOG_TAG:Ljava/lang/String;

    .line 26
    iput-object p1, p0, Lcom/pccw/sms/service/ChatRecordService;->context:Landroid/content/Context;

    .line 27
    new-instance v0, Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    .line 28
    new-instance v0, Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/ChatRecordService;->messageStoreDAOImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    .line 29
    return-void
.end method


# virtual methods
.method public addChatList(Lcom/pccw/database/entity/ChatList;)V
    .locals 3
    .param p1, "chatList"    # Lcom/pccw/database/entity/ChatList;

    .prologue
    .line 32
    if-eqz p1, :cond_0

    .line 33
    iget-object v0, p0, Lcom/pccw/sms/service/ChatRecordService;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "chatId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/pccw/database/entity/ChatList;->getChatContact()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    iget-object v0, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->add(Lcom/pccw/database/entity/ChatList;)V

    .line 37
    :cond_0
    return-void
.end method

.method public convertSetToString(Ljava/util/Set;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "strSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 106
    .local v1, "str":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ";"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 108
    .end local v1    # "str":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public deleteChatByChatId(Ljava/lang/String;)V
    .locals 1
    .param p1, "chatId"    # Ljava/lang/String;

    .prologue
    .line 118
    iget-object v0, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->removeChatRecord(Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method public getAllChatRecordCursor()Landroid/database/Cursor;
    .locals 2

    .prologue
    .line 112
    iget-object v1, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v1}, Lcom/pccw/database/dao/ChatListDAOImpl;->getAllChatRecordCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 114
    .local v0, "cursor1":Landroid/database/Cursor;
    return-object v0
.end method

.method public getChatListByUserName(Ljava/lang/String;)Lcom/pccw/database/entity/ChatList;
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 74
    iget-object v1, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->findByChatContact(Ljava/lang/String;)Lcom/pccw/database/entity/ChatList;

    move-result-object v0

    .line 75
    .local v0, "chatList":Lcom/pccw/database/entity/ChatList;
    return-object v0
.end method

.method public getChatListDetailByChatcontact(Ljava/lang/String;)Lcom/pccw/database/entity/ChatListUserInfo;
    .locals 2
    .param p1, "chatcontact"    # Ljava/lang/String;

    .prologue
    .line 98
    iget-object v1, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->getChatListDetailByChatcontact(Ljava/lang/String;)Lcom/pccw/database/entity/ChatListUserInfo;

    move-result-object v0

    .line 99
    .local v0, "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    return-object v0
.end method

.method public getChatRecordItem()Ljava/util/ArrayList;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/sms/bean/ChatRecordItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .local v10, "chatRecordItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/ChatRecordItem;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v13}, Lcom/pccw/database/dao/ChatListDAOImpl;->getChatListUserInfo()Ljava/util/ArrayList;

    move-result-object v9

    .line 48
    .local v9, "chatListUserInfoArr":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/ChatListUserInfo;>;"
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_0

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/pccw/database/entity/ChatListUserInfo;

    .line 50
    .local v8, "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    invoke-virtual {v8}, Lcom/pccw/database/entity/ChatListUserInfo;->getChatId()I

    move-result v11

    .line 51
    .local v11, "id":I
    invoke-virtual {v8}, Lcom/pccw/database/entity/ChatListUserInfo;->getNickName()Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, "nickName":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/pccw/database/entity/ChatListUserInfo;->getChatContact()Ljava/lang/String;

    move-result-object v3

    .line 53
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/pccw/database/entity/ChatListUserInfo;->getTextMessage()Ljava/lang/String;

    move-result-object v4

    .line 54
    .local v4, "lastMessage":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/pccw/database/entity/ChatListUserInfo;->getMessageId()I

    move-result v12

    .line 57
    .local v12, "mesasageId":I
    invoke-virtual {v8}, Lcom/pccw/database/entity/ChatListUserInfo;->getSentTime()Ljava/util/Date;

    move-result-object v5

    .line 58
    .local v5, "lastMessageTime":Ljava/util/Date;
    invoke-virtual {v8}, Lcom/pccw/database/entity/ChatListUserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v6

    .line 60
    .local v6, "imgPath":Ljava/lang/String;
    invoke-virtual {v8}, Lcom/pccw/database/entity/ChatListUserInfo;->getType()Ljava/lang/String;

    move-result-object v7

    .line 62
    .local v7, "type":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pccw/sms/service/ChatRecordService;->LOG_TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "chatId="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " ;name="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ", nickName="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " ;lastMessageTime="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, ";type="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " ;mesasageId="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    new-instance v1, Lcom/pccw/sms/bean/ChatRecordItem;

    invoke-direct/range {v1 .. v7}, Lcom/pccw/sms/bean/ChatRecordItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .local v1, "chatRecordItem":Lcom/pccw/sms/bean/ChatRecordItem;
    invoke-virtual {v1, v11}, Lcom/pccw/sms/bean/ChatRecordItem;->setChatId(I)V

    .line 66
    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 69
    .end local v1    # "chatRecordItem":Lcom/pccw/sms/bean/ChatRecordItem;
    .end local v2    # "nickName":Ljava/lang/String;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "lastMessage":Ljava/lang/String;
    .end local v5    # "lastMessageTime":Ljava/util/Date;
    .end local v6    # "imgPath":Ljava/lang/String;
    .end local v7    # "type":Ljava/lang/String;
    .end local v8    # "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    .end local v11    # "id":I
    .end local v12    # "mesasageId":I
    :cond_0
    return-object v10
.end method

.method public getMsgCount(I)I
    .locals 2
    .param p1, "chatId"    # I

    .prologue
    .line 88
    iget-object v1, p0, Lcom/pccw/sms/service/ChatRecordService;->messageStoreDAOImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->getMsgCount(I)I

    move-result v0

    .line 89
    .local v0, "unreadMsgCount":I
    return v0
.end method

.method public getUnreadMsgCount(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p1, "participant"    # Ljava/lang/String;
    .param p2, "chatId"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v1, p0, Lcom/pccw/sms/service/ChatRecordService;->messageStoreDAOImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v1, p1, p2}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->getUnreadMsgCount(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 84
    .local v0, "unreadMsgCount":I
    return v0
.end method

.method public listAll()Ljava/util/ArrayList;
    .locals 2
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
    .line 93
    iget-object v1, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v1}, Lcom/pccw/database/dao/ChatListDAOImpl;->list()Ljava/util/ArrayList;

    move-result-object v0

    .line 94
    .local v0, "chatListArr":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/ChatList;>;"
    return-object v0
.end method

.method public removeChatList(Lcom/pccw/database/entity/ChatList;)V
    .locals 1
    .param p1, "chatList"    # Lcom/pccw/database/entity/ChatList;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->remove(Lcom/pccw/database/entity/ChatList;)V

    .line 41
    return-void
.end method

.method public updateMessageIdForChatList(II)V
    .locals 1
    .param p1, "chatId"    # I
    .param p2, "messageId"    # I

    .prologue
    .line 79
    iget-object v0, p0, Lcom/pccw/sms/service/ChatRecordService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v0, p1, p2}, Lcom/pccw/database/dao/ChatListDAOImpl;->updateMessageIdForChatList(II)V

    .line 80
    return-void
.end method
