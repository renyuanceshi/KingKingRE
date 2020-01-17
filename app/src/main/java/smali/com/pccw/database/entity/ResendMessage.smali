.class public Lcom/pccw/database/entity/ResendMessage;
.super Ljava/lang/Object;
.source "ResendMessage.java"


# instance fields
.field private chatid:I

.field private localfilepath:Ljava/lang/String;

.field private messageId:I

.field private messagetype:Ljava/lang/String;

.field private recipient:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "messageId"    # I
    .param p2, "recipient"    # Ljava/lang/String;
    .param p3, "localfilepath"    # Ljava/lang/String;
    .param p4, "messagetype"    # Ljava/lang/String;
    .param p5, "chatid"    # I

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput p1, p0, Lcom/pccw/database/entity/ResendMessage;->messageId:I

    .line 13
    iput-object p2, p0, Lcom/pccw/database/entity/ResendMessage;->recipient:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/pccw/database/entity/ResendMessage;->localfilepath:Ljava/lang/String;

    .line 15
    iput-object p4, p0, Lcom/pccw/database/entity/ResendMessage;->messagetype:Ljava/lang/String;

    .line 16
    iput p5, p0, Lcom/pccw/database/entity/ResendMessage;->chatid:I

    .line 17
    return-void
.end method


# virtual methods
.method public getChatid()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/pccw/database/entity/ResendMessage;->chatid:I

    return v0
.end method

.method public getLocalfilepath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/pccw/database/entity/ResendMessage;->localfilepath:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageId()I
    .locals 1

    .prologue
    .line 20
    iget v0, p0, Lcom/pccw/database/entity/ResendMessage;->messageId:I

    return v0
.end method

.method public getMessagetype()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/pccw/database/entity/ResendMessage;->messagetype:Ljava/lang/String;

    return-object v0
.end method

.method public getRecipient()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/pccw/database/entity/ResendMessage;->recipient:Ljava/lang/String;

    return-object v0
.end method

.method public setChatid(I)V
    .locals 0
    .param p1, "chatid"    # I

    .prologue
    .line 51
    iput p1, p0, Lcom/pccw/database/entity/ResendMessage;->chatid:I

    .line 52
    return-void
.end method

.method public setLocalfilepath(Ljava/lang/String;)V
    .locals 0
    .param p1, "localfilepath"    # Ljava/lang/String;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/pccw/database/entity/ResendMessage;->localfilepath:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public setMessageId(I)V
    .locals 0
    .param p1, "messageId"    # I

    .prologue
    .line 23
    iput p1, p0, Lcom/pccw/database/entity/ResendMessage;->messageId:I

    .line 24
    return-void
.end method

.method public setMessagetype(Ljava/lang/String;)V
    .locals 0
    .param p1, "messagetype"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/pccw/database/entity/ResendMessage;->messagetype:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setRecipient(Ljava/lang/String;)V
    .locals 0
    .param p1, "recipient"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/pccw/database/entity/ResendMessage;->recipient:Ljava/lang/String;

    .line 31
    return-void
.end method
