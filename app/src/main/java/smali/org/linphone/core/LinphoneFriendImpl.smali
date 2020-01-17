.class public Lorg/linphone/core/LinphoneFriendImpl;
.super Ljava/lang/Object;
.source "LinphoneFriendImpl.java"

# interfaces
.implements Lorg/linphone/core/LinphoneFriend;
.implements Ljava/io/Serializable;


# instance fields
.field protected final nativePtr:J

.field private userdData:Ljava/lang/Object;


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/linphone/core/LinphoneFriendImpl;->newLinphoneFriend(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    .line 55
    return-void
.end method

.method protected constructor <init>(J)V
    .locals 1
    .param p1, "aNativePtr"    # J

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-wide p1, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    .line 63
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "friendUri"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneFriendImpl;->newLinphoneFriend(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    .line 58
    return-void
.end method

.method private native addAddress(JJ)V
.end method

.method private native addPhoneNumber(JLjava/lang/String;)V
.end method

.method private native done(J)V
.end method

.method private native edit(J)V
.end method

.method private native enableSubscribes(JZ)V
.end method

.method private native finalize(J)V
.end method

.method private native getAddress(J)J
.end method

.method private native getAddresses(J)[J
.end method

.method private native getCore(J)Ljava/lang/Object;
.end method

.method private native getFamilyName(J)Ljava/lang/String;
.end method

.method private native getGivenName(J)Ljava/lang/String;
.end method

.method private native getIncSubscribePolicy(J)I
.end method

.method private native getName(J)Ljava/lang/String;
.end method

.method private native getOrganization(J)Ljava/lang/String;
.end method

.method private native getPhoneNumbers(J)[Ljava/lang/Object;
.end method

.method private native getPresenceModel(J)Ljava/lang/Object;
.end method

.method private native getPresenceModelForUri(JLjava/lang/String;)Ljava/lang/Object;
.end method

.method private native getRefKey(J)Ljava/lang/String;
.end method

.method private native getStatus(J)I
.end method

.method private getSyncObject()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 131
    iget-wide v2, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneFriendImpl;->getCore(J)Ljava/lang/Object;

    move-result-object v0

    .line 132
    .local v0, "core":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 133
    .end local v0    # "core":Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0    # "core":Ljava/lang/Object;
    :cond_0
    move-object v0, p0

    goto :goto_0
.end method

.method private native getVcardToString(J)Ljava/lang/String;
.end method

.method private native isAlreadyPresentInFriendList(J)Z
.end method

.method private native isPresenceReceived(J)Z
.end method

.method private native isSubscribesEnabled(J)Z
.end method

.method private native newLinphoneFriend(Ljava/lang/String;)J
.end method

.method private native removeAddress(JJ)V
.end method

.method private native removePhoneNumber(JLjava/lang/String;)V
.end method

.method private native setAddress(JJ)V
.end method

.method private native setFamilyName(JLjava/lang/String;)V
.end method

.method private native setGivenName(JLjava/lang/String;)V
.end method

.method private native setIncSubscribePolicy(JI)V
.end method

.method private native setName(JLjava/lang/String;)V
.end method

.method private native setOrganization(JLjava/lang/String;)V
.end method

.method private native setPresenceModel(JJ)V
.end method

.method private native setRefKey(JLjava/lang/String;)V
.end method


# virtual methods
.method public addAddress(Lorg/linphone/core/LinphoneAddress;)V
    .locals 4
    .param p1, "addr"    # Lorg/linphone/core/LinphoneAddress;

    .prologue
    .line 214
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "addr":Lorg/linphone/core/LinphoneAddress;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneFriendImpl;->addAddress(JJ)V

    .line 215
    return-void
.end method

.method public addPhoneNumber(Ljava/lang/String;)V
    .locals 2
    .param p1, "phone"    # Ljava/lang/String;

    .prologue
    .line 239
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneFriendImpl;->addPhoneNumber(JLjava/lang/String;)V

    .line 240
    return-void
.end method

.method public done()V
    .locals 4

    .prologue
    .line 117
    invoke-direct {p0}, Lorg/linphone/core/LinphoneFriendImpl;->getSyncObject()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 118
    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneFriendImpl;->done(J)V

    .line 119
    monitor-exit v1

    .line 120
    return-void

    .line 119
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public edit()V
    .locals 4

    .prologue
    .line 112
    invoke-direct {p0}, Lorg/linphone/core/LinphoneFriendImpl;->getSyncObject()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 113
    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneFriendImpl;->edit(J)V

    .line 114
    monitor-exit v1

    .line 115
    return-void

    .line 114
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public enableSubscribes(Z)V
    .locals 4
    .param p1, "enable"    # Z

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/linphone/core/LinphoneFriendImpl;->getSyncObject()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 90
    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v2, v3, p1}, Lorg/linphone/core/LinphoneFriendImpl;->enableSubscribes(JZ)V

    .line 91
    monitor-exit v1

    .line 92
    return-void

    .line 91
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected finalize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 65
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 66
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->finalize(J)V

    .line 68
    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 69
    return-void
.end method

.method public getAddress()Lorg/linphone/core/LinphoneAddress;
    .locals 4

    .prologue
    .line 74
    iget-wide v2, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneFriendImpl;->getAddress(J)J

    move-result-wide v0

    .line 75
    .local v0, "ptr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 76
    new-instance v2, Lorg/linphone/core/LinphoneAddressImpl;

    sget-object v3, Lorg/linphone/core/LinphoneAddressImpl$WrapMode;->FromConst:Lorg/linphone/core/LinphoneAddressImpl$WrapMode;

    invoke-direct {v2, v0, v1, v3}, Lorg/linphone/core/LinphoneAddressImpl;-><init>(JLorg/linphone/core/LinphoneAddressImpl$WrapMode;)V

    .line 78
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getAddresses()[Lorg/linphone/core/LinphoneAddress;
    .locals 7

    .prologue
    .line 201
    iget-wide v4, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v4, v5}, Lorg/linphone/core/LinphoneFriendImpl;->getAddresses(J)[J

    move-result-object v2

    .line 202
    .local v2, "ptrs":[J
    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 208
    :cond_0
    return-object v0

    .line 204
    :cond_1
    array-length v3, v2

    new-array v0, v3, [Lorg/linphone/core/LinphoneAddress;

    .line 205
    .local v0, "addresses":[Lorg/linphone/core/LinphoneAddress;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 206
    new-instance v3, Lorg/linphone/core/LinphoneAddressImpl;

    aget-wide v4, v2, v1

    sget-object v6, Lorg/linphone/core/LinphoneAddressImpl$WrapMode;->FromConst:Lorg/linphone/core/LinphoneAddressImpl$WrapMode;

    invoke-direct {v3, v4, v5, v6}, Lorg/linphone/core/LinphoneAddressImpl;-><init>(JLorg/linphone/core/LinphoneAddressImpl$WrapMode;)V

    aput-object v3, v0, v1

    .line 205
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public getFamilyName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 172
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getFamilyName(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getGivenName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 183
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getGivenName(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIncSubscribePolicy()Lorg/linphone/core/LinphoneFriend$SubscribePolicy;
    .locals 2

    .prologue
    .line 86
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getIncSubscribePolicy(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->fromInt(I)Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 161
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getName(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNativePtr()J
    .locals 2

    .prologue
    .line 122
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    return-wide v0
.end method

.method public getOrganization()Ljava/lang/String;
    .locals 2

    .prologue
    .line 195
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getOrganization(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPhoneNumbers()[Ljava/lang/String;
    .locals 6

    .prologue
    .line 226
    iget-wide v4, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v4, v5}, Lorg/linphone/core/LinphoneFriendImpl;->getPhoneNumbers(J)[Ljava/lang/Object;

    move-result-object v2

    .line 227
    .local v2, "phones":[Ljava/lang/Object;
    if-nez v2, :cond_1

    const/4 v1, 0x0

    .line 233
    :cond_0
    return-object v1

    .line 229
    :cond_1
    array-length v3, v2

    new-array v1, v3, [Ljava/lang/String;

    .line 230
    .local v1, "phoneNumbers":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_0

    .line 231
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 230
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getPresenceModel()Lorg/linphone/core/PresenceModel;
    .locals 2

    .prologue
    .line 103
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getPresenceModel(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/PresenceModel;

    return-object v0
.end method

.method public getPresenceModelForUri(Ljava/lang/String;)Lorg/linphone/core/PresenceModel;
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 106
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneFriendImpl;->getPresenceModelForUri(JLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/PresenceModel;

    return-object v0
.end method

.method public getRefKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 143
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getRefKey(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStatus()Lorg/linphone/core/OnlineStatus;
    .locals 2

    .prologue
    .line 100
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getStatus(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/OnlineStatus;->fromInt(I)Lorg/linphone/core/OnlineStatus;

    move-result-object v0

    return-object v0
.end method

.method public getUserData()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->userdData:Ljava/lang/Object;

    return-object v0
.end method

.method public declared-synchronized getVcardToString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 148
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->getVcardToString(J)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isAlreadyPresentInFriendList()Z
    .locals 2

    .prologue
    .line 251
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->isAlreadyPresentInFriendList(J)Z

    move-result v0

    return v0
.end method

.method public isPresenceReceived()Z
    .locals 2

    .prologue
    .line 97
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->isPresenceReceived(J)Z

    move-result v0

    return v0
.end method

.method public isSubscribesEnabled()Z
    .locals 2

    .prologue
    .line 94
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneFriendImpl;->isSubscribesEnabled(J)Z

    move-result v0

    return v0
.end method

.method public removeAddress(Lorg/linphone/core/LinphoneAddress;)V
    .locals 4
    .param p1, "addr"    # Lorg/linphone/core/LinphoneAddress;

    .prologue
    .line 220
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "addr":Lorg/linphone/core/LinphoneAddress;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneFriendImpl;->removeAddress(JJ)V

    .line 221
    return-void
.end method

.method public removePhoneNumber(Ljava/lang/String;)V
    .locals 2
    .param p1, "phone"    # Ljava/lang/String;

    .prologue
    .line 245
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneFriendImpl;->removePhoneNumber(JLjava/lang/String;)V

    .line 246
    return-void
.end method

.method public setAddress(Lorg/linphone/core/LinphoneAddress;)V
    .locals 4
    .param p1, "anAddress"    # Lorg/linphone/core/LinphoneAddress;

    .prologue
    .line 71
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "anAddress":Lorg/linphone/core/LinphoneAddress;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneFriendImpl;->setAddress(JJ)V

    .line 72
    return-void
.end method

.method public setFamilyName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneFriendImpl;->setFamilyName(JLjava/lang/String;)V

    .line 168
    return-void
.end method

.method public setGivenName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 178
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneFriendImpl;->setGivenName(JLjava/lang/String;)V

    .line 179
    return-void
.end method

.method public setIncSubscribePolicy(Lorg/linphone/core/LinphoneFriend$SubscribePolicy;)V
    .locals 4
    .param p1, "policy"    # Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    .prologue
    .line 81
    invoke-direct {p0}, Lorg/linphone/core/LinphoneFriendImpl;->getSyncObject()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 82
    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    iget v0, p1, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->mValue:I

    invoke-direct {p0, v2, v3, v0}, Lorg/linphone/core/LinphoneFriendImpl;->setIncSubscribePolicy(JI)V

    .line 83
    monitor-exit v1

    .line 84
    return-void

    .line 83
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 155
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneFriendImpl;->setName(JLjava/lang/String;)V

    .line 156
    return-void
.end method

.method public setOrganization(Ljava/lang/String;)V
    .locals 2
    .param p1, "organization"    # Ljava/lang/String;

    .prologue
    .line 189
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneFriendImpl;->setOrganization(JLjava/lang/String;)V

    .line 190
    return-void
.end method

.method public setPresenceModel(Lorg/linphone/core/PresenceModel;)V
    .locals 4
    .param p1, "presenceModel"    # Lorg/linphone/core/PresenceModel;

    .prologue
    .line 109
    iget-wide v0, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/PresenceModelImpl;

    .end local p1    # "presenceModel":Lorg/linphone/core/PresenceModel;
    invoke-virtual {p1}, Lorg/linphone/core/PresenceModelImpl;->getNativePtr()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneFriendImpl;->setPresenceModel(JJ)V

    .line 110
    return-void
.end method

.method public setRefKey(Ljava/lang/String;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-direct {p0}, Lorg/linphone/core/LinphoneFriendImpl;->getSyncObject()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 138
    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v2, v3, p1}, Lorg/linphone/core/LinphoneFriendImpl;->setRefKey(JLjava/lang/String;)V

    .line 139
    monitor-exit v1

    .line 140
    return-void

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setUserData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "ud"    # Ljava/lang/Object;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/linphone/core/LinphoneFriendImpl;->userdData:Ljava/lang/Object;

    .line 51
    return-void
.end method
