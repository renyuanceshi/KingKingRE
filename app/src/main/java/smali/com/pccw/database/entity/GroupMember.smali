.class public Lcom/pccw/database/entity/GroupMember;
.super Ljava/lang/Object;
.source "GroupMember.java"


# instance fields
.field private groupId:Ljava/lang/String;

.field private memberId:I

.field private memberUserName:Ljava/lang/String;

.field private nickName:Ljava/lang/String;

.field private profileImagePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "memberUserName"    # Ljava/lang/String;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    invoke-virtual {p0, p1}, Lcom/pccw/database/entity/GroupMember;->setGroupId(Ljava/lang/String;)V

    .line 12
    invoke-virtual {p0, p2}, Lcom/pccw/database/entity/GroupMember;->setMemberUserName(Ljava/lang/String;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "memberUserName"    # Ljava/lang/String;
    .param p3, "nickname"    # Ljava/lang/String;
    .param p4, "profileImg"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-virtual {p0, p1}, Lcom/pccw/database/entity/GroupMember;->setGroupId(Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0, p2}, Lcom/pccw/database/entity/GroupMember;->setMemberUserName(Ljava/lang/String;)V

    .line 21
    invoke-virtual {p0, p3}, Lcom/pccw/database/entity/GroupMember;->setNickName(Ljava/lang/String;)V

    .line 22
    invoke-virtual {p0, p4}, Lcom/pccw/database/entity/GroupMember;->setProfileImagePath(Ljava/lang/String;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getGroupId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/database/entity/GroupMember;->groupId:Ljava/lang/String;

    return-object v0
.end method

.method public getMemberId()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lcom/pccw/database/entity/GroupMember;->memberId:I

    return v0
.end method

.method public getMemberUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/pccw/database/entity/GroupMember;->memberUserName:Ljava/lang/String;

    return-object v0
.end method

.method public getNickName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/pccw/database/entity/GroupMember;->nickName:Ljava/lang/String;

    return-object v0
.end method

.method public getProfileImagePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/pccw/database/entity/GroupMember;->profileImagePath:Ljava/lang/String;

    return-object v0
.end method

.method public setGroupId(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/pccw/database/entity/GroupMember;->groupId:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setMemberId(I)V
    .locals 0
    .param p1, "memberId"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/pccw/database/entity/GroupMember;->memberId:I

    .line 39
    return-void
.end method

.method public setMemberUserName(Ljava/lang/String;)V
    .locals 0
    .param p1, "memberUserName"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/pccw/database/entity/GroupMember;->memberUserName:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setNickName(Ljava/lang/String;)V
    .locals 0
    .param p1, "nickName"    # Ljava/lang/String;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/pccw/database/entity/GroupMember;->nickName:Ljava/lang/String;

    .line 62
    return-void
.end method

.method public setProfileImagePath(Ljava/lang/String;)V
    .locals 0
    .param p1, "profileImagePath"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/pccw/database/entity/GroupMember;->profileImagePath:Ljava/lang/String;

    .line 31
    return-void
.end method
