.class public Lcom/pccw/sms/service/ChatListService;
.super Ljava/lang/Object;
.source "ChatListService.java"


# instance fields
.field chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

.field ctx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/pccw/sms/service/ChatListService;->ctx:Landroid/content/Context;

    .line 16
    new-instance v0, Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/ChatListService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    .line 17
    return-void
.end method


# virtual methods
.method public getChatListByUserName(Ljava/lang/String;)Lcom/pccw/database/entity/ChatList;
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 25
    iget-object v1, p0, Lcom/pccw/sms/service/ChatListService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->findByChatContact(Ljava/lang/String;)Lcom/pccw/database/entity/ChatList;

    move-result-object v0

    .line 26
    .local v0, "chatList":Lcom/pccw/database/entity/ChatList;
    return-object v0
.end method

.method public getUserNameByChatId(I)Ljava/lang/String;
    .locals 2
    .param p1, "chatId"    # I

    .prologue
    .line 20
    iget-object v1, p0, Lcom/pccw/sms/service/ChatListService;->chatListImpl:Lcom/pccw/database/dao/ChatListDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/ChatListDAOImpl;->findByChatId(I)Lcom/pccw/database/entity/ChatList;

    move-result-object v0

    .line 21
    .local v0, "chatList":Lcom/pccw/database/entity/ChatList;
    invoke-virtual {v0}, Lcom/pccw/database/entity/ChatList;->getChatContact()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
