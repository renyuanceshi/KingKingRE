.class public Lcom/pccw/sms/service/GroupInfoService;
.super Ljava/lang/Object;
.source "GroupInfoService.java"


# instance fields
.field protected context:Landroid/content/Context;

.field protected groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/pccw/sms/service/GroupInfoService;->context:Landroid/content/Context;

    .line 17
    new-instance v0, Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    .line 18
    return-void
.end method


# virtual methods
.method public addGroupInfo(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "groupName"    # Ljava/lang/String;
    .param p3, "createDate"    # Ljava/util/Date;

    .prologue
    .line 21
    new-instance v0, Lcom/pccw/database/entity/GroupInfo;

    invoke-direct {v0, p1, p2, p3}, Lcom/pccw/database/entity/GroupInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 22
    .local v0, "groupInfo":Lcom/pccw/database/entity/GroupInfo;
    iget-object v1, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v1, v0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->add(Lcom/pccw/database/entity/GroupInfo;)V

    .line 23
    return-void
.end method

.method public getGroupInfo(Ljava/lang/String;)Lcom/pccw/database/entity/GroupInfo;
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 50
    iget-object v1, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/GroupInfo;

    move-result-object v0

    .line 51
    .local v0, "dbGroupInfo":Lcom/pccw/database/entity/GroupInfo;
    return-object v0
.end method

.method public getGroupInfo()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/GroupInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 30
    iget-object v1, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->list()Ljava/util/ArrayList;

    move-result-object v0

    .line 31
    .local v0, "groupInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/GroupInfo;>;"
    return-object v0
.end method

.method public removeByGroupId(Ljava/lang/String;)V
    .locals 1
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->removeByGroupId(Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public updateGroupInfo(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .locals 3
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "groupName"    # Ljava/lang/String;
    .param p3, "createDate"    # Ljava/util/Date;

    .prologue
    .line 40
    new-instance v1, Lcom/pccw/database/entity/GroupInfo;

    invoke-direct {v1, p1, p2, p3}, Lcom/pccw/database/entity/GroupInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 41
    .local v1, "groupInfo":Lcom/pccw/database/entity/GroupInfo;
    iget-object v2, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v2, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/GroupInfo;

    move-result-object v0

    .line 42
    .local v0, "dbGroupInfo":Lcom/pccw/database/entity/GroupInfo;
    if-eqz v0, :cond_0

    .line 43
    iget-object v2, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v2, p1, p2, p3}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->updateGroupNameAndDate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 48
    :goto_0
    return-void

    .line 46
    :cond_0
    iget-object v2, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v2, v1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->add(Lcom/pccw/database/entity/GroupInfo;)V

    goto :goto_0
.end method

.method public updateGroupNameAndDate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .locals 1
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "groupName"    # Ljava/lang/String;
    .param p3, "createDate"    # Ljava/util/Date;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/pccw/sms/service/GroupInfoService;->groupInfoImpl:Lcom/pccw/database/dao/GroupInfoDAOImpl;

    invoke-virtual {v0, p1, p2, p3}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->updateGroupNameAndDate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 27
    return-void
.end method
