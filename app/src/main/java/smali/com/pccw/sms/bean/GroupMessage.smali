.class public Lcom/pccw/sms/bean/GroupMessage;
.super Ljava/lang/Object;
.source "GroupMessage.java"


# instance fields
.field private content:Ljava/lang/String;

.field private groupId:Ljava/lang/String;

.field private msgId:Ljava/lang/String;

.field private receiver:Ljava/lang/String;

.field private sender:Ljava/lang/String;

.field private subject:Ljava/lang/String;

.field private time:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "msgId"    # Ljava/lang/String;
    .param p2, "groupId"    # Ljava/lang/String;
    .param p3, "sender"    # Ljava/lang/String;
    .param p4, "receiver"    # Ljava/lang/String;
    .param p5, "content"    # Ljava/lang/String;
    .param p6, "time"    # Ljava/lang/String;
    .param p7, "subject"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupMessage;->msgId:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lcom/pccw/sms/bean/GroupMessage;->groupId:Ljava/lang/String;

    .line 16
    iput-object p3, p0, Lcom/pccw/sms/bean/GroupMessage;->sender:Ljava/lang/String;

    .line 17
    iput-object p4, p0, Lcom/pccw/sms/bean/GroupMessage;->receiver:Ljava/lang/String;

    .line 18
    iput-object p5, p0, Lcom/pccw/sms/bean/GroupMessage;->content:Ljava/lang/String;

    .line 19
    iput-object p6, p0, Lcom/pccw/sms/bean/GroupMessage;->time:Ljava/lang/String;

    .line 20
    iput-object p7, p0, Lcom/pccw/sms/bean/GroupMessage;->subject:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupMessage;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupMessage;->groupId:Ljava/lang/String;

    return-object v0
.end method

.method public getMsgId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupMessage;->msgId:Ljava/lang/String;

    return-object v0
.end method

.method public getReceiver()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupMessage;->receiver:Ljava/lang/String;

    return-object v0
.end method

.method public getSender()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupMessage;->sender:Ljava/lang/String;

    return-object v0
.end method

.method public getSubject()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupMessage;->subject:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupMessage;->time:Ljava/lang/String;

    return-object v0
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupMessage;->content:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public setGroupId(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupMessage;->groupId:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setMsgId(Ljava/lang/String;)V
    .locals 0
    .param p1, "msgId"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupMessage;->msgId:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public setReceiver(Ljava/lang/String;)V
    .locals 0
    .param p1, "receiver"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupMessage;->receiver:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public setSender(Ljava/lang/String;)V
    .locals 0
    .param p1, "sender"    # Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupMessage;->sender:Ljava/lang/String;

    .line 29
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .locals 0
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupMessage;->subject:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setTime(Ljava/lang/String;)V
    .locals 0
    .param p1, "time"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupMessage;->time:Ljava/lang/String;

    .line 41
    return-void
.end method
