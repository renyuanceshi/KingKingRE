.class public Lcom/pccw/sms/service/ClearGroupService;
.super Ljava/lang/Object;
.source "ClearGroupService.java"


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field protected chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

.field protected context:Landroid/content/Context;

.field protected groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

.field protected groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

.field protected messageStoreDAOImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const-string/jumbo v0, "ClearGroupService"

    iput-object v0, p0, Lcom/pccw/sms/service/ClearGroupService;->LOG_TAG:Ljava/lang/String;

    .line 25
    iput-object p1, p0, Lcom/pccw/sms/service/ClearGroupService;->context:Landroid/content/Context;

    .line 26
    new-instance v0, Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/ClearGroupService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    .line 27
    new-instance v0, Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/ClearGroupService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    .line 28
    new-instance v0, Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/MessageStoreDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/ClearGroupService;->messageStoreDAOImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    .line 29
    new-instance v0, Lcom/pccw/database/dao/GroupMemberDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/ClearGroupService;->groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

    .line 30
    return-void
.end method


# virtual methods
.method public clearGroupInfo(Ljava/lang/String;)V
    .locals 7
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 48
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v4, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->findByChatContact(Ljava/lang/String;)Lcom/pccw/database/entity/ChatList;

    move-result-object v1

    .line 49
    .local v1, "chatList":Lcom/pccw/database/entity/ChatList;
    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatList;->getChatId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "chatID":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

    invoke-virtual {v4, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->getGroupMemberByGroupId(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 52
    .local v2, "memberList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/GroupMember;>;"
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "before groupID:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " memberlist size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

    invoke-virtual {v4, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->removeByGroupId(Ljava/lang/String;)V

    .line 54
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

    invoke-virtual {v4, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->getGroupMemberByGroupId(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 56
    .local v3, "memberList2":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/GroupMember;>;"
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "removing messagestore record by chatID : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->messageStoreDAOImpl:Lcom/pccw/database/dao/MessageStoreDAOImpl;

    invoke-virtual {v4, v0}, Lcom/pccw/database/dao/MessageStoreDAOImpl;->removeMessageByChatID(Ljava/lang/String;)V

    .line 59
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "removing groupinfo record by groupId : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v4, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->removeByGroupId(Ljava/lang/String;)V

    .line 62
    iget-object v4, p0, Lcom/pccw/sms/service/ClearGroupService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v4, v0}, Lcom/pccw/database/dao/ChatListDAOImpl;->removeChatRecord(Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public getGroupInfo(Ljava/lang/String;)Lcom/pccw/database/entity/GroupInfo;
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 43
    iget-object v1, p0, Lcom/pccw/sms/service/ClearGroupService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/GroupInfo;

    move-result-object v0

    .line 44
    .local v0, "dbGroupInfo":Lcom/pccw/database/entity/GroupInfo;
    return-object v0
.end method

.method public getGroupInfo()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/GroupInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 33
    iget-object v1, p0, Lcom/pccw/sms/service/ClearGroupService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->list()Ljava/util/ArrayList;

    move-result-object v0

    .line 34
    .local v0, "groupInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/GroupInfo;>;"
    return-object v0
.end method

.method public removeGroupInfoByGroupId(Ljava/lang/String;)V
    .locals 1
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/pccw/sms/service/ClearGroupService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->removeByGroupId(Ljava/lang/String;)V

    .line 40
    return-void
.end method
