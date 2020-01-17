.class public Lcom/pccw/sms/service/CreateChatService;
.super Ljava/lang/Object;
.source "CreateChatService.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CreateChatService"


# instance fields
.field ctx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/pccw/sms/service/CreateChatService;->ctx:Landroid/content/Context;

    .line 23
    return-void
.end method

.method private addGroupMember(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 3
    .param p1, "groupId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p2, "recipients":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Lcom/pccw/sms/service/GroupMemberService;

    iget-object v2, p0, Lcom/pccw/sms/service/CreateChatService;->ctx:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/pccw/sms/service/GroupMemberService;-><init>(Landroid/content/Context;)V

    .line 93
    .local v0, "groupMemberService":Lcom/pccw/sms/service/GroupMemberService;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 94
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, p1, v2}, Lcom/pccw/sms/service/GroupMemberService;->addGroupMember(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 96
    :cond_0
    return-void
.end method

.method private addNewChatList(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 81
    new-instance v1, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v2, p0, Lcom/pccw/sms/service/CreateChatService;->ctx:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 82
    .local v1, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    new-instance v0, Lcom/pccw/database/entity/ChatList;

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, p1, v2}, Lcom/pccw/database/entity/ChatList;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 83
    .local v0, "chatList":Lcom/pccw/database/entity/ChatList;
    invoke-virtual {v1, v0}, Lcom/pccw/sms/service/ChatRecordService;->addChatList(Lcom/pccw/database/entity/ChatList;)V

    .line 84
    return-void
.end method

.method private addNewGroupInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "groupName"    # Ljava/lang/String;

    .prologue
    .line 87
    new-instance v0, Lcom/pccw/sms/service/GroupInfoService;

    iget-object v1, p0, Lcom/pccw/sms/service/CreateChatService;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/GroupInfoService;-><init>(Landroid/content/Context;)V

    .line 88
    .local v0, "groupInfoService":Lcom/pccw/sms/service/GroupInfoService;
    invoke-direct {p0}, Lcom/pccw/sms/service/CreateChatService;->getCurrentDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/pccw/sms/service/GroupInfoService;->addGroupInfo(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 89
    return-void
.end method

.method private addRecipientInfo(Ljava/lang/String;)V
    .locals 4
    .param p1, "recipient"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 69
    new-instance v1, Lcom/pccw/sms/service/ConversationParticipantItemService;

    iget-object v2, p0, Lcom/pccw/sms/service/CreateChatService;->ctx:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    .line 70
    .local v1, "service":Lcom/pccw/sms/service/ConversationParticipantItemService;
    new-instance v0, Lcom/pccw/sms/bean/ConversationParticipantItem;

    invoke-direct {v0, p1, v3, v3}, Lcom/pccw/sms/bean/ConversationParticipantItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .local v0, "item":Lcom/pccw/sms/bean/ConversationParticipantItem;
    invoke-virtual {v1, v0}, Lcom/pccw/sms/service/ConversationParticipantItemService;->addConversationParticipant(Lcom/pccw/sms/bean/ConversationParticipantItem;)V

    .line 73
    return-void
.end method

.method private getChatId(Ljava/lang/String;)I
    .locals 3
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 99
    new-instance v1, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v2, p0, Lcom/pccw/sms/service/CreateChatService;->ctx:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 100
    .local v1, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    invoke-virtual {v1, p1}, Lcom/pccw/sms/service/ChatRecordService;->getChatListByUserName(Ljava/lang/String;)Lcom/pccw/database/entity/ChatList;

    move-result-object v0

    .line 101
    .local v0, "chatList":Lcom/pccw/database/entity/ChatList;
    invoke-virtual {v0}, Lcom/pccw/database/entity/ChatList;->getChatId()I

    move-result v2

    return v2
.end method

.method private getCurrentDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 105
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    return-object v0
.end method

.method private isChatExist(Ljava/lang/String;)Z
    .locals 2
    .param p1, "recipient"    # Ljava/lang/String;

    .prologue
    .line 76
    new-instance v0, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v1, p0, Lcom/pccw/sms/service/CreateChatService;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 77
    .local v0, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    invoke-virtual {v0, p1}, Lcom/pccw/sms/service/ChatRecordService;->getChatListByUserName(Ljava/lang/String;)Lcom/pccw/database/entity/ChatList;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isRecipientExist(Ljava/lang/String;)Z
    .locals 2
    .param p1, "recipient"    # Ljava/lang/String;

    .prologue
    .line 64
    new-instance v0, Lcom/pccw/sms/service/ConversationParticipantItemService;

    iget-object v1, p0, Lcom/pccw/sms/service/CreateChatService;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    .line 65
    .local v0, "service":Lcom/pccw/sms/service/ConversationParticipantItemService;
    invoke-virtual {v0, p1}, Lcom/pccw/sms/service/ConversationParticipantItemService;->isDuplicatedUsername(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method


# virtual methods
.method public createMultipleChat(Ljava/util/ArrayList;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 46
    .local p1, "recipientsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {p1}, Lcom/pccw/sms/util/SMSFormatUtil;->getGroupIdString(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v0

    .line 47
    .local v0, "groupId":Ljava/lang/String;
    move-object v1, v0

    .line 49
    .local v1, "groupName":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/pccw/sms/service/CreateChatService;->isChatExist(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 52
    invoke-direct {p0, v0}, Lcom/pccw/sms/service/CreateChatService;->getChatId(Ljava/lang/String;)I

    move-result v2

    .line 59
    :goto_0
    return v2

    .line 56
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/pccw/sms/service/CreateChatService;->addNewGroupInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-direct {p0, v0, p1}, Lcom/pccw/sms/service/CreateChatService;->addGroupMember(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 58
    invoke-direct {p0, v0}, Lcom/pccw/sms/service/CreateChatService;->addNewChatList(Ljava/lang/String;)V

    .line 59
    invoke-direct {p0, v0}, Lcom/pccw/sms/service/CreateChatService;->getChatId(Ljava/lang/String;)I

    move-result v2

    goto :goto_0
.end method

.method public createSingleChat(Ljava/lang/String;)I
    .locals 1
    .param p1, "recipient"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/pccw/sms/service/CreateChatService;->isRecipientExist(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 28
    invoke-direct {p0, p1}, Lcom/pccw/sms/service/CreateChatService;->addRecipientInfo(Ljava/lang/String;)V

    .line 31
    :cond_0
    invoke-direct {p0, p1}, Lcom/pccw/sms/service/CreateChatService;->isChatExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 34
    invoke-direct {p0, p1}, Lcom/pccw/sms/service/CreateChatService;->getChatId(Ljava/lang/String;)I

    move-result v0

    .line 39
    :goto_0
    return v0

    .line 38
    :cond_1
    invoke-direct {p0, p1}, Lcom/pccw/sms/service/CreateChatService;->addNewChatList(Ljava/lang/String;)V

    .line 39
    invoke-direct {p0, p1}, Lcom/pccw/sms/service/CreateChatService;->getChatId(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method
