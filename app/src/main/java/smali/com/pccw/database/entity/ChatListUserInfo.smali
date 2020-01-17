.class public Lcom/pccw/database/entity/ChatListUserInfo;
.super Ljava/lang/Object;
.source "ChatListUserInfo.java"


# instance fields
.field private chatContact:Ljava/lang/String;

.field private chatId:I

.field private messageId:I

.field private nickName:Ljava/lang/String;

.field private photo:Ljava/lang/String;

.field private sentTime:Ljava/util/Date;

.field private status:Ljava/lang/String;

.field private textMessage:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getChatContact()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->chatContact:Ljava/lang/String;

    return-object v0
.end method

.method public getChatId()I
    .locals 1

    .prologue
    .line 18
    iget v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->chatId:I

    return v0
.end method

.method public getMessageId()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->messageId:I

    return v0
.end method

.method public getNickName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->nickName:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoto()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getSentTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->sentTime:Ljava/util/Date;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->status:Ljava/lang/String;

    return-object v0
.end method

.method public getTextMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->textMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/pccw/database/entity/ChatListUserInfo;->type:Ljava/lang/String;

    return-object v0
.end method

.method public setChatContact(Ljava/lang/String;)V
    .locals 0
    .param p1, "chatContact"    # Ljava/lang/String;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->chatContact:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public setChatId(I)V
    .locals 0
    .param p1, "chatId"    # I

    .prologue
    .line 21
    iput p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->chatId:I

    .line 22
    return-void
.end method

.method public setMessageId(I)V
    .locals 0
    .param p1, "messageId"    # I

    .prologue
    .line 51
    iput p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->messageId:I

    .line 52
    return-void
.end method

.method public setNickName(Ljava/lang/String;)V
    .locals 0
    .param p1, "nickName"    # Ljava/lang/String;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->nickName:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public setPhoto(Ljava/lang/String;)V
    .locals 0
    .param p1, "photo"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->photo:Ljava/lang/String;

    .line 40
    return-void
.end method

.method public setSentTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "sentTime"    # Ljava/util/Date;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->sentTime:Ljava/util/Date;

    .line 64
    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->status:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setTextMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "textMessage"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->textMessage:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/pccw/database/entity/ChatListUserInfo;->type:Ljava/lang/String;

    .line 70
    return-void
.end method
