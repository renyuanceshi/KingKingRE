.class public Lcom/pccw/sms/service/GroupMemberService;
.super Ljava/lang/Object;
.source "GroupMemberService.java"


# instance fields
.field protected context:Landroid/content/Context;

.field protected groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/pccw/sms/service/GroupMemberService;->context:Landroid/content/Context;

    .line 16
    new-instance v0, Lcom/pccw/database/dao/GroupMemberDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/GroupMemberService;->groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

    .line 17
    return-void
.end method


# virtual methods
.method public addGroupMember(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "memberUserName"    # Ljava/lang/String;

    .prologue
    .line 20
    new-instance v0, Lcom/pccw/database/entity/GroupMember;

    invoke-direct {v0, p1, p2}, Lcom/pccw/database/entity/GroupMember;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .local v0, "groupMember":Lcom/pccw/database/entity/GroupMember;
    iget-object v1, p0, Lcom/pccw/sms/service/GroupMemberService;->groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

    invoke-virtual {v1, v0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->add(Lcom/pccw/database/entity/GroupMember;)V

    .line 23
    return-void
.end method

.method public getGroupMemberByGroupId(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/GroupMember;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    iget-object v1, p0, Lcom/pccw/sms/service/GroupMemberService;->groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->getGroupMemberByGroupId(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 36
    .local v0, "groupMemberList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/GroupMember;>;"
    return-object v0
.end method

.method public removeByGroupId(Ljava/lang/String;)V
    .locals 1
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/pccw/sms/service/GroupMemberService;->groupMemberDAOImpl:Lcom/pccw/database/dao/GroupMemberDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->removeByGroupId(Ljava/lang/String;)V

    .line 31
    return-void
.end method
