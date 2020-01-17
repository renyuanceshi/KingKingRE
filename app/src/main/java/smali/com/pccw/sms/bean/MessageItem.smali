.class public Lcom/pccw/sms/bean/MessageItem;
.super Ljava/lang/Object;
.source "MessageItem.java"


# instance fields
.field private chatId:J

.field private content:Ljava/lang/String;

.field private filePath:Ljava/lang/String;

.field private isRead:Ljava/lang/String;

.field private lastMsgTime:Ljava/util/Date;

.field private msgId:I

.field private msgType:Ljava/lang/String;

.field private msg_direction:I

.field private sender:Ljava/lang/String;

.field private sentStatus:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "chatId"    # J
    .param p3, "filePath"    # Ljava/lang/String;
    .param p4, "sender"    # Ljava/lang/String;
    .param p5, "content"    # Ljava/lang/String;
    .param p6, "direction"    # I
    .param p7, "lastMsgTime"    # Ljava/util/Date;
    .param p8, "msgType"    # Ljava/lang/String;
    .param p9, "sentStatus"    # Ljava/lang/String;
    .param p10, "isRead"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-wide p1, p0, Lcom/pccw/sms/bean/MessageItem;->chatId:J

    .line 31
    iput-object p4, p0, Lcom/pccw/sms/bean/MessageItem;->sender:Ljava/lang/String;

    .line 32
    iput-object p5, p0, Lcom/pccw/sms/bean/MessageItem;->content:Ljava/lang/String;

    .line 33
    iput p6, p0, Lcom/pccw/sms/bean/MessageItem;->msg_direction:I

    .line 34
    iput-object p3, p0, Lcom/pccw/sms/bean/MessageItem;->filePath:Ljava/lang/String;

    .line 35
    iput-object p7, p0, Lcom/pccw/sms/bean/MessageItem;->lastMsgTime:Ljava/util/Date;

    .line 36
    iput-object p8, p0, Lcom/pccw/sms/bean/MessageItem;->msgType:Ljava/lang/String;

    .line 37
    iput-object p9, p0, Lcom/pccw/sms/bean/MessageItem;->sentStatus:Ljava/lang/String;

    .line 38
    iput-object p10, p0, Lcom/pccw/sms/bean/MessageItem;->isRead:Ljava/lang/String;

    .line 39
    return-void
.end method


# virtual methods
.method public getChatId()J
    .locals 2

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/pccw/sms/bean/MessageItem;->chatId:J

    return-wide v0
.end method

.method public getContent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageItem;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getDirection()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/pccw/sms/bean/MessageItem;->msg_direction:I

    return v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageItem;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public getIsRead()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageItem;->isRead:Ljava/lang/String;

    return-object v0
.end method

.method public getLastMsgTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageItem;->lastMsgTime:Ljava/util/Date;

    return-object v0
.end method

.method public getMsgId()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/pccw/sms/bean/MessageItem;->msgId:I

    return v0
.end method

.method public getMsgType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageItem;->msgType:Ljava/lang/String;

    return-object v0
.end method

.method public getSender()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageItem;->sender:Ljava/lang/String;

    return-object v0
.end method

.method public getSentStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/pccw/sms/bean/MessageItem;->sentStatus:Ljava/lang/String;

    return-object v0
.end method

.method public setChatId(J)V
    .locals 1
    .param p1, "chatId"    # J

    .prologue
    .line 44
    iput-wide p1, p0, Lcom/pccw/sms/bean/MessageItem;->chatId:J

    .line 45
    return-void
.end method

.method public setDesc(Ljava/lang/String;)V
    .locals 0
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageItem;->content:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setFilePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageItem;->filePath:Ljava/lang/String;

    .line 77
    return-void
.end method

.method public setIsRead(Ljava/lang/String;)V
    .locals 0
    .param p1, "isRead"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageItem;->isRead:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setLastMsgTime(Ljava/util/Date;)V
    .locals 0
    .param p1, "lastMsgTime"    # Ljava/util/Date;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageItem;->lastMsgTime:Ljava/util/Date;

    .line 71
    return-void
.end method

.method public setMsgId(I)V
    .locals 0
    .param p1, "msgId"    # I

    .prologue
    .line 94
    iput p1, p0, Lcom/pccw/sms/bean/MessageItem;->msgId:I

    .line 95
    return-void
.end method

.method public setMsgType(Ljava/lang/String;)V
    .locals 0
    .param p1, "msgType"    # Ljava/lang/String;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageItem;->msgType:Ljava/lang/String;

    .line 83
    return-void
.end method

.method public setSender(Ljava/lang/String;)V
    .locals 0
    .param p1, "sender"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageItem;->sender:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setSentStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "sentStatus"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/pccw/sms/bean/MessageItem;->sentStatus:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/pccw/sms/bean/MessageItem;->sender:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/bean/MessageItem;->content:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
