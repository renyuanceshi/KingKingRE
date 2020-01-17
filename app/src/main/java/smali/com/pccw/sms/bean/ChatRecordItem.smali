.class public Lcom/pccw/sms/bean/ChatRecordItem;
.super Ljava/lang/Object;
.source "ChatRecordItem.java"


# instance fields
.field private chatId:I

.field private imagePath:Ljava/lang/String;

.field private isUnread:Z

.field private lastMessage:Ljava/lang/String;

.field private lastMessageTime:Ljava/util/Date;

.field private name:Ljava/lang/String;

.field private nickName:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "nickName"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "lastMessage"    # Ljava/lang/String;
    .param p4, "lastMessageTime"    # Ljava/util/Date;
    .param p5, "imgPath"    # Ljava/lang/String;
    .param p6, "type"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->imagePath:Ljava/lang/String;

    .line 12
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->lastMessage:Ljava/lang/String;

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->isUnread:Z

    .line 27
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->nickName:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/pccw/sms/bean/ChatRecordItem;->name:Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lcom/pccw/sms/bean/ChatRecordItem;->lastMessage:Ljava/lang/String;

    .line 30
    iput-object p5, p0, Lcom/pccw/sms/bean/ChatRecordItem;->imagePath:Ljava/lang/String;

    .line 31
    iput-object p4, p0, Lcom/pccw/sms/bean/ChatRecordItem;->lastMessageTime:Ljava/util/Date;

    .line 32
    iput-object p6, p0, Lcom/pccw/sms/bean/ChatRecordItem;->type:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public getChatId()I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->chatId:I

    return v0
.end method

.method public getImagePath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 43
    iget-object v1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->imagePath:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 44
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->imagePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 45
    .local v0, "imgFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 46
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 49
    .end local v0    # "imgFile":Ljava/io/File;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getLastMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->lastMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getLastMessageTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->lastMessageTime:Ljava/util/Date;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNickName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->nickName:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->type:Ljava/lang/String;

    return-object v0
.end method

.method public isUnread()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lcom/pccw/sms/bean/ChatRecordItem;->isUnread:Z

    return v0
.end method

.method public setChatId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 40
    iput p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->chatId:I

    .line 41
    return-void
.end method

.method public setImagePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "imagePath"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->imagePath:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public setLastMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "lastMessage"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->lastMessage:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setLastMessageTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "lastMessageTime"    # Ljava/util/Date;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->lastMessageTime:Ljava/util/Date;

    .line 86
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->name:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setNickName(Ljava/lang/String;)V
    .locals 0
    .param p1, "nickName"    # Ljava/lang/String;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->nickName:Ljava/lang/String;

    .line 94
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->type:Ljava/lang/String;

    .line 111
    return-void
.end method

.method public setUnread(Z)V
    .locals 0
    .param p1, "isUnread"    # Z

    .prologue
    .line 77
    iput-boolean p1, p0, Lcom/pccw/sms/bean/ChatRecordItem;->isUnread:Z

    .line 78
    return-void
.end method
