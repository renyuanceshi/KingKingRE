.class public Lcom/pccw/database/entity/ChatList;
.super Ljava/lang/Object;
.source "ChatList.java"


# instance fields
.field private chatContact:Ljava/lang/String;

.field private chatId:I

.field private messageId:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0
    .param p1, "chatContact"    # Ljava/lang/String;
    .param p2, "messageId"    # Ljava/lang/Integer;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/pccw/database/entity/ChatList;->chatContact:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Lcom/pccw/database/entity/ChatList;->messageId:Ljava/lang/Integer;

    .line 14
    return-void
.end method


# virtual methods
.method public getChatContact()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/pccw/database/entity/ChatList;->chatContact:Ljava/lang/String;

    return-object v0
.end method

.method public getChatId()I
    .locals 1

    .prologue
    .line 17
    iget v0, p0, Lcom/pccw/database/entity/ChatList;->chatId:I

    return v0
.end method

.method public getMessageId()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/pccw/database/entity/ChatList;->messageId:Ljava/lang/Integer;

    return-object v0
.end method

.method public setChatContact(Ljava/lang/String;)V
    .locals 0
    .param p1, "chatContact"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/pccw/database/entity/ChatList;->chatContact:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public setChatId(I)V
    .locals 0
    .param p1, "chatId"    # I

    .prologue
    .line 20
    iput p1, p0, Lcom/pccw/database/entity/ChatList;->chatId:I

    .line 21
    return-void
.end method

.method public setMessageId(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "messageId"    # Ljava/lang/Integer;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/pccw/database/entity/ChatList;->messageId:Ljava/lang/Integer;

    .line 34
    return-void
.end method
