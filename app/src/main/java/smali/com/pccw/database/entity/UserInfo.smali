.class public Lcom/pccw/database/entity/UserInfo;
.super Ljava/lang/Object;
.source "UserInfo.java"


# instance fields
.field private nickName:Ljava/lang/String;

.field private photo:Ljava/lang/String;

.field private userName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "nickName"    # Ljava/lang/String;
    .param p3, "photo"    # Ljava/lang/String;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/pccw/database/entity/UserInfo;->userName:Ljava/lang/String;

    .line 11
    iput-object p2, p0, Lcom/pccw/database/entity/UserInfo;->nickName:Ljava/lang/String;

    .line 12
    iput-object p3, p0, Lcom/pccw/database/entity/UserInfo;->photo:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public getNickName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/pccw/database/entity/UserInfo;->nickName:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoto()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/pccw/database/entity/UserInfo;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/pccw/database/entity/UserInfo;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public setNickName(Ljava/lang/String;)V
    .locals 0
    .param p1, "nickName"    # Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/pccw/database/entity/UserInfo;->nickName:Ljava/lang/String;

    .line 29
    return-void
.end method

.method public setPhoto(Ljava/lang/String;)V
    .locals 0
    .param p1, "photo"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/pccw/database/entity/UserInfo;->photo:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .locals 0
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/pccw/database/entity/UserInfo;->userName:Ljava/lang/String;

    .line 21
    return-void
.end method
