.class public Lcom/pccw/database/entity/GroupInfo;
.super Ljava/lang/Object;
.source "GroupInfo.java"


# instance fields
.field private createdate:Ljava/util/Date;

.field private groupId:Ljava/lang/String;

.field private groupName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "groupName"    # Ljava/lang/String;
    .param p3, "createDate"    # Ljava/util/Date;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/pccw/database/entity/GroupInfo;->groupId:Ljava/lang/String;

    .line 12
    iput-object p2, p0, Lcom/pccw/database/entity/GroupInfo;->groupName:Ljava/lang/String;

    .line 13
    iput-object p3, p0, Lcom/pccw/database/entity/GroupInfo;->createdate:Ljava/util/Date;

    .line 14
    return-void
.end method


# virtual methods
.method public getCreatedate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/pccw/database/entity/GroupInfo;->createdate:Ljava/util/Date;

    return-object v0
.end method

.method public getGroupId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/pccw/database/entity/GroupInfo;->groupId:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/pccw/database/entity/GroupInfo;->groupName:Ljava/lang/String;

    return-object v0
.end method

.method public setCreatedate(Ljava/util/Date;)V
    .locals 0
    .param p1, "createdate"    # Ljava/util/Date;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/pccw/database/entity/GroupInfo;->createdate:Ljava/util/Date;

    .line 38
    return-void
.end method

.method public setGroupId(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/pccw/database/entity/GroupInfo;->groupId:Ljava/lang/String;

    .line 22
    return-void
.end method

.method public setGroupName(Ljava/lang/String;)V
    .locals 0
    .param p1, "groupName"    # Ljava/lang/String;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/pccw/database/entity/GroupInfo;->groupName:Ljava/lang/String;

    .line 30
    return-void
.end method
