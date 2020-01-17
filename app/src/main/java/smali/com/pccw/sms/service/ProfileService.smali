.class public Lcom/pccw/sms/service/ProfileService;
.super Ljava/lang/Object;
.source "ProfileService.java"


# instance fields
.field protected context:Landroid/content/Context;

.field protected userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/pccw/sms/service/ProfileService;->context:Landroid/content/Context;

    .line 15
    new-instance v0, Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/ProfileService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    .line 16
    return-void
.end method


# virtual methods
.method public getContactProfile(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 19
    iget-object v1, p0, Lcom/pccw/sms/service/ProfileService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v0

    .line 20
    .local v0, "contactInfo":Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;
    return-object v0
.end method

.method public getOwnerProfile(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;
    .locals 2
    .param p1, "ownername"    # Ljava/lang/String;

    .prologue
    .line 29
    iget-object v1, p0, Lcom/pccw/sms/service/ProfileService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findOwnerProfile(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v0

    .line 30
    .local v0, "userInfo":Lcom/pccw/database/entity/UserInfo;
    return-object v0
.end method

.method public getProfile(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;
    .locals 2
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 24
    iget-object v1, p0, Lcom/pccw/sms/service/ProfileService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserProfile(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v0

    .line 25
    .local v0, "userInfo":Lcom/pccw/database/entity/UserInfo;
    return-object v0
.end method

.method public updateProfile(Lcom/pccw/database/entity/UserInfo;)V
    .locals 3
    .param p1, "userInfo"    # Lcom/pccw/database/entity/UserInfo;

    .prologue
    .line 34
    iget-object v1, p0, Lcom/pccw/sms/service/ProfileService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/pccw/database/dao/UserInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v0

    .line 35
    .local v0, "dbUserInfo":Lcom/pccw/database/entity/UserInfo;
    if-eqz v0, :cond_0

    .line 36
    iget-object v1, p0, Lcom/pccw/sms/service/ProfileService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->update(Lcom/pccw/database/entity/UserInfo;)I

    .line 41
    :goto_0
    return-void

    .line 39
    :cond_0
    iget-object v1, p0, Lcom/pccw/sms/service/ProfileService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->add(Lcom/pccw/database/entity/UserInfo;)V

    goto :goto_0
.end method
