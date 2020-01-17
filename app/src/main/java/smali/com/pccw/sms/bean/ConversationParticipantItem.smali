.class public Lcom/pccw/sms/bean/ConversationParticipantItem;
.super Ljava/lang/Object;
.source "ConversationParticipantItem.java"


# instance fields
.field private nickName:Ljava/lang/String;

.field private profileImagePath:Ljava/lang/String;

.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "userId"    # Ljava/lang/String;
    .param p2, "nickName"    # Ljava/lang/String;
    .param p3, "profileImagePath"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->userId:Ljava/lang/String;

    .line 11
    iput-object p2, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->nickName:Ljava/lang/String;

    .line 12
    iput-object p3, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->profileImagePath:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public getNickName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->nickName:Ljava/lang/String;

    return-object v0
.end method

.method public getProfileImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->profileImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public setNickName(Ljava/lang/String;)V
    .locals 0
    .param p1, "nickName"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->nickName:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public setProfileImagePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "profileImagePath"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->profileImagePath:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->userId:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/pccw/sms/bean/ConversationParticipantItem;->userId:Ljava/lang/String;

    return-object v0
.end method
