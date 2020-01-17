.class public Lcom/pccw/database/entity/MessageStore;
.super Ljava/lang/Object;
.source "MessageStore.java"


# instance fields
.field private chatid:I

.field private isRead:Ljava/lang/String;

.field private localfilepath:Ljava/lang/String;

.field private messageId:I

.field private messagetype:Ljava/lang/String;

.field private recipient:Ljava/lang/String;

.field private sender:Ljava/lang/String;

.field private sentStatus:Ljava/lang/String;

.field private sentTime:Ljava/util/Date;

.field private serverMessageId:Ljava/lang/String;

.field private serveruripath:Ljava/lang/String;

.field private textMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "sender"    # Ljava/lang/String;
    .param p2, "recipient"    # Ljava/lang/String;
    .param p3, "textMessage"    # Ljava/lang/String;
    .param p4, "sentTime"    # Ljava/util/Date;
    .param p5, "sentStatus"    # Ljava/lang/String;
    .param p6, "isRead"    # Ljava/lang/String;
    .param p7, "localfilepath"    # Ljava/lang/String;
    .param p8, "serveruripath"    # Ljava/lang/String;
    .param p9, "messagetype"    # Ljava/lang/String;
    .param p10, "chatid"    # I

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->sender:Ljava/lang/String;

    .line 21
    iput-object p2, p0, Lcom/pccw/database/entity/MessageStore;->recipient:Ljava/lang/String;

    .line 22
    iput-object p3, p0, Lcom/pccw/database/entity/MessageStore;->textMessage:Ljava/lang/String;

    .line 23
    iput-object p4, p0, Lcom/pccw/database/entity/MessageStore;->sentTime:Ljava/util/Date;

    .line 24
    iput-object p5, p0, Lcom/pccw/database/entity/MessageStore;->sentStatus:Ljava/lang/String;

    .line 25
    iput-object p6, p0, Lcom/pccw/database/entity/MessageStore;->isRead:Ljava/lang/String;

    .line 26
    iput-object p7, p0, Lcom/pccw/database/entity/MessageStore;->localfilepath:Ljava/lang/String;

    .line 27
    iput-object p8, p0, Lcom/pccw/database/entity/MessageStore;->serveruripath:Ljava/lang/String;

    .line 28
    iput-object p9, p0, Lcom/pccw/database/entity/MessageStore;->messagetype:Ljava/lang/String;

    .line 29
    iput p10, p0, Lcom/pccw/database/entity/MessageStore;->chatid:I

    .line 30
    return-void
.end method


# virtual methods
.method public getChatid()I
    .locals 1

    .prologue
    .line 93
    iget v0, p0, Lcom/pccw/database/entity/MessageStore;->chatid:I

    return v0
.end method

.method public getIsRead()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->isRead:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalfilepath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->localfilepath:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageId()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/pccw/database/entity/MessageStore;->messageId:I

    return v0
.end method

.method public getMessagetype()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->messagetype:Ljava/lang/String;

    return-object v0
.end method

.method public getRecipient()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->recipient:Ljava/lang/String;

    return-object v0
.end method

.method public getSender()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->sender:Ljava/lang/String;

    return-object v0
.end method

.method public getSentStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->sentStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getSentTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->sentTime:Ljava/util/Date;

    return-object v0
.end method

.method public getServerMessageId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->serverMessageId:Ljava/lang/String;

    return-object v0
.end method

.method public getServeruripath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->serveruripath:Ljava/lang/String;

    return-object v0
.end method

.method public getTextMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/pccw/database/entity/MessageStore;->textMessage:Ljava/lang/String;

    return-object v0
.end method

.method public setChatid(I)V
    .locals 0
    .param p1, "chatid"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/pccw/database/entity/MessageStore;->chatid:I

    .line 97
    return-void
.end method

.method public setIsRead(Ljava/lang/String;)V
    .locals 0
    .param p1, "isRead"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->isRead:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public setLocalfilepath(Ljava/lang/String;)V
    .locals 0
    .param p1, "localfilepath"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->localfilepath:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setMessageId(I)V
    .locals 0
    .param p1, "messageId"    # I

    .prologue
    .line 36
    iput p1, p0, Lcom/pccw/database/entity/MessageStore;->messageId:I

    .line 37
    return-void
.end method

.method public setMessagetype(Ljava/lang/String;)V
    .locals 0
    .param p1, "messagetype"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->messagetype:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public setRecipient(Ljava/lang/String;)V
    .locals 0
    .param p1, "recipient"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->recipient:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setSender(Ljava/lang/String;)V
    .locals 0
    .param p1, "sender"    # Ljava/lang/String;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->sender:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setSentStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "sentStatus"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->sentStatus:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setSentTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "sentTime"    # Ljava/util/Date;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->sentTime:Ljava/util/Date;

    .line 61
    return-void
.end method

.method public setServerMessageId(Ljava/lang/String;)V
    .locals 0
    .param p1, "serverMessageId"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->serverMessageId:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setServeruripath(Ljava/lang/String;)V
    .locals 0
    .param p1, "serveruripath"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->serveruripath:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public setTextMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "textMessage"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/pccw/database/entity/MessageStore;->textMessage:Ljava/lang/String;

    .line 55
    return-void
.end method
