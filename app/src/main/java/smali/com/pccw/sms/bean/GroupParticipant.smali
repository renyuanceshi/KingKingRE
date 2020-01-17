.class public Lcom/pccw/sms/bean/GroupParticipant;
.super Ljava/lang/Object;
.source "GroupParticipant.java"


# instance fields
.field private groupId:Ljava/lang/String;

.field private participant:Ljava/lang/String;

.field private role:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "participant"    # Ljava/lang/String;
    .param p3, "role"    # Ljava/lang/String;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupParticipant;->groupId:Ljava/lang/String;

    .line 10
    iput-object p2, p0, Lcom/pccw/sms/bean/GroupParticipant;->participant:Ljava/lang/String;

    .line 11
    iput-object p3, p0, Lcom/pccw/sms/bean/GroupParticipant;->role:Ljava/lang/String;

    .line 12
    return-void
.end method


# virtual methods
.method public getGroupId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupParticipant;->groupId:Ljava/lang/String;

    return-object v0
.end method

.method public getParticipant()Ljava/lang/String;
    .locals 1

    .prologue
    .line 15
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupParticipant;->participant:Ljava/lang/String;

    return-object v0
.end method

.method public getRole()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    iget-object v0, p0, Lcom/pccw/sms/bean/GroupParticipant;->role:Ljava/lang/String;

    return-object v0
.end method

.method public setGroupId(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupParticipant;->groupId:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public setParticipant(Ljava/lang/String;)V
    .locals 0
    .param p1, "participant"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupParticipant;->participant:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setRole(Ljava/lang/String;)V
    .locals 0
    .param p1, "role"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/pccw/sms/bean/GroupParticipant;->role:Ljava/lang/String;

    .line 25
    return-void
.end method
