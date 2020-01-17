.class public Lorg/linphone/core/tutorials/TutorialBuddyStatus;
.super Ljava/lang/Object;
.source "TutorialBuddyStatus.java"

# interfaces
.implements Lorg/linphone/core/LinphoneCoreListener;


# instance fields
.field private TutorialNotifier:Lorg/linphone/core/tutorials/TutorialNotifier;

.field private running:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Lorg/linphone/core/tutorials/TutorialNotifier;

    invoke-direct {v0}, Lorg/linphone/core/tutorials/TutorialNotifier;-><init>()V

    iput-object v0, p0, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->TutorialNotifier:Lorg/linphone/core/tutorials/TutorialNotifier;

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/linphone/core/tutorials/TutorialNotifier;)V
    .locals 0
    .param p1, "TutorialNotifier"    # Lorg/linphone/core/tutorials/TutorialNotifier;

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->TutorialNotifier:Lorg/linphone/core/tutorials/TutorialNotifier;

    .line 74
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 9
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v8, 0x2

    const/4 v7, 0x1

    .line 119
    array-length v5, p0

    if-lt v5, v7, :cond_0

    array-length v5, p0

    const/4 v6, 0x3

    if-le v5, v6, :cond_1

    .line 120
    :cond_0
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Bad number of arguments ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, p0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "] should be 1, 2 or 3"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 124
    :cond_1
    new-instance v3, Lorg/linphone/core/tutorials/TutorialBuddyStatus;

    invoke-direct {v3}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;-><init>()V

    .line 127
    .local v3, "tutorial":Lorg/linphone/core/tutorials/TutorialBuddyStatus;
    const/4 v5, 0x1

    :try_start_0
    aget-object v4, p0, v5

    .line 130
    .local v4, "userSipAddress":Ljava/lang/String;
    array-length v5, p0

    if-le v5, v7, :cond_3

    const/4 v5, 0x1

    aget-object v1, p0, v5

    .line 132
    .local v1, "mySipAddress":Ljava/lang/String;
    :goto_0
    array-length v5, p0

    if-le v5, v8, :cond_2

    const/4 v5, 0x2

    aget-object v2, p0, v5

    .line 134
    .local v2, "mySipPassword":Ljava/lang/String;
    :cond_2
    invoke-virtual {v3, v4, v1, v2}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->launchTutorial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    .end local v1    # "mySipAddress":Ljava/lang/String;
    .end local v2    # "mySipPassword":Ljava/lang/String;
    .end local v4    # "userSipAddress":Ljava/lang/String;
    :goto_1
    return-void

    .restart local v4    # "userSipAddress":Ljava/lang/String;
    :cond_3
    move-object v1, v2

    .line 130
    goto :goto_0

    .line 135
    .end local v4    # "userSipAddress":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private write(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 244
    iget-object v0, p0, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->TutorialNotifier:Lorg/linphone/core/tutorials/TutorialNotifier;

    invoke-virtual {v0, p1}, Lorg/linphone/core/tutorials/TutorialNotifier;->notify(Ljava/lang/String;)V

    .line 245
    return-void
.end method


# virtual methods
.method public authInfoRequested(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "realm"    # Ljava/lang/String;
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "domain"    # Ljava/lang/String;

    .prologue
    .line 310
    return-void
.end method

.method public authenticationRequested(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneAuthInfo;Lorg/linphone/core/LinphoneCore$AuthMethod;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "authInfo"    # Lorg/linphone/core/LinphoneAuthInfo;
    .param p3, "method"    # Lorg/linphone/core/LinphoneCore$AuthMethod;

    .prologue
    .line 316
    return-void
.end method

.method public byeReceived(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "from"    # Ljava/lang/String;

    .prologue
    .line 104
    return-void
.end method

.method public callEncryptionChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;ZLjava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "encrypted"    # Z
    .param p4, "authenticationToken"    # Ljava/lang/String;

    .prologue
    .line 112
    return-void
.end method

.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "cstate"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "msg"    # Ljava/lang/String;

    .prologue
    .line 109
    return-void
.end method

.method public callStatsUpdated(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallStats;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "stats"    # Lorg/linphone/core/LinphoneCallStats;

    .prologue
    .line 110
    return-void
.end method

.method public configuringStatus(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$RemoteProvisioningState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$RemoteProvisioningState;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 303
    return-void
.end method

.method public displayMessage(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 106
    return-void
.end method

.method public displayStatus(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 105
    return-void
.end method

.method public displayWarning(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 107
    return-void
.end method

.method public dtmfReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;I)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "dtmf"    # I

    .prologue
    .line 114
    return-void
.end method

.method public ecCalibrationStatus(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;ILjava/lang/Object;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "status"    # Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;
    .param p3, "delay_ms"    # I
    .param p4, "data"    # Ljava/lang/Object;

    .prologue
    .line 111
    return-void
.end method

.method public fileTransferProgressIndication(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatMessage;Lorg/linphone/core/LinphoneContent;I)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Lorg/linphone/core/LinphoneChatMessage;
    .param p3, "content"    # Lorg/linphone/core/LinphoneContent;
    .param p4, "progress"    # I

    .prologue
    .line 323
    return-void
.end method

.method public fileTransferRecv(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatMessage;Lorg/linphone/core/LinphoneContent;[BI)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Lorg/linphone/core/LinphoneChatMessage;
    .param p3, "content"    # Lorg/linphone/core/LinphoneContent;
    .param p4, "buffer"    # [B
    .param p5, "size"    # I

    .prologue
    .line 330
    return-void
.end method

.method public fileTransferSend(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatMessage;Lorg/linphone/core/LinphoneContent;Ljava/nio/ByteBuffer;I)I
    .locals 1
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Lorg/linphone/core/LinphoneChatMessage;
    .param p3, "content"    # Lorg/linphone/core/LinphoneContent;
    .param p4, "buffer"    # Ljava/nio/ByteBuffer;
    .param p5, "size"    # I

    .prologue
    .line 336
    const/4 v0, 0x0

    return v0
.end method

.method public friendListCreated(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriendList;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "list"    # Lorg/linphone/core/LinphoneFriendList;

    .prologue
    .line 356
    return-void
.end method

.method public friendListRemoved(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriendList;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "list"    # Lorg/linphone/core/LinphoneFriendList;

    .prologue
    .line 362
    return-void
.end method

.method public globalState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$GlobalState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$GlobalState;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 108
    return-void
.end method

.method public infoReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneInfoMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "info"    # Lorg/linphone/core/LinphoneInfoMessage;

    .prologue
    .line 269
    return-void
.end method

.method public isComposingReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;

    .prologue
    .line 296
    return-void
.end method

.method public launchTutorial(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p1, "sipAddress"    # Ljava/lang/String;
    .param p2, "mySipAddress"    # Ljava/lang/String;
    .param p3, "mySipPassword"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 143
    invoke-static {}, Lorg/linphone/core/LinphoneCoreFactory;->instance()Lorg/linphone/core/LinphoneCoreFactory;

    move-result-object v5

    .line 147
    .local v5, "lcFactory":Lorg/linphone/core/LinphoneCoreFactory;
    invoke-virtual {v5, p0, v9}, Lorg/linphone/core/LinphoneCoreFactory;->createLinphoneCore(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/Object;)Lorg/linphone/core/LinphoneCore;

    move-result-object v4

    .line 153
    .local v4, "lc":Lorg/linphone/core/LinphoneCore;
    :try_start_0
    invoke-interface {v4, p1}, Lorg/linphone/core/LinphoneCore;->createFriendWithAddress(Ljava/lang/String;)Lorg/linphone/core/LinphoneFriend;

    move-result-object v6

    .line 154
    .local v6, "lf":Lorg/linphone/core/LinphoneFriend;
    if-nez v6, :cond_0

    .line 155
    const-string/jumbo v9, "Could not create friend; weird SIP address?"

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    const-string/jumbo v9, "Shutting down..."

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 232
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 233
    const-string/jumbo v9, "Exited"

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 235
    :goto_0
    return-void

    .line 159
    :cond_0
    if-eqz p2, :cond_2

    .line 161
    :try_start_1
    invoke-virtual {v5, p2}, Lorg/linphone/core/LinphoneCoreFactory;->createLinphoneAddress(Ljava/lang/String;)Lorg/linphone/core/LinphoneAddress;

    move-result-object v0

    .line 162
    .local v0, "address":Lorg/linphone/core/LinphoneAddress;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v8

    .line 163
    .local v8, "username":Ljava/lang/String;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneAddress;->getDomain()Ljava/lang/String;

    move-result-object v1

    .line 166
    .local v1, "domain":Ljava/lang/String;
    if-eqz p3, :cond_1

    .line 168
    const/4 v9, 0x0

    invoke-virtual {v5, v8, p3, v9, v1}, Lorg/linphone/core/LinphoneCoreFactory;->createAuthInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/LinphoneAuthInfo;

    move-result-object v9

    invoke-interface {v4, v9}, Lorg/linphone/core/LinphoneCore;->addAuthInfo(Lorg/linphone/core/LinphoneAuthInfo;)V

    .line 172
    :cond_1
    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-interface {v4, p2, v1, v9, v10}, Lorg/linphone/core/LinphoneCore;->createProxyConfig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v7

    .line 173
    .local v7, "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    const/4 v9, 0x1

    invoke-interface {v7, v9}, Lorg/linphone/core/LinphoneProxyConfig;->enablePublish(Z)V

    .line 174
    invoke-interface {v4, v7}, Lorg/linphone/core/LinphoneCore;->addProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V

    .line 175
    invoke-interface {v4, v7}, Lorg/linphone/core/LinphoneCore;->setDefaultProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V

    .line 176
    :goto_1
    invoke-interface {v7}, Lorg/linphone/core/LinphoneProxyConfig;->isRegistered()Z

    move-result v9

    if-nez v9, :cond_2

    .line 177
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->iterate()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 179
    const-wide/16 v10, 0x3e8

    :try_start_2
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 180
    :catch_0
    move-exception v3

    .line 181
    .local v3, "ie":Ljava/lang/InterruptedException;
    :try_start_3
    const-string/jumbo v9, "Interrupted!\nAborting"

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 230
    const-string/jumbo v9, "Shutting down..."

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 232
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 233
    const-string/jumbo v9, "Exited"

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 188
    .end local v0    # "address":Lorg/linphone/core/LinphoneAddress;
    .end local v1    # "domain":Ljava/lang/String;
    .end local v3    # "ie":Ljava/lang/InterruptedException;
    .end local v7    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    .end local v8    # "username":Ljava/lang/String;
    :cond_2
    const/4 v9, 0x1

    :try_start_4
    invoke-interface {v6, v9}, Lorg/linphone/core/LinphoneFriend;->enableSubscribes(Z)V

    .line 191
    sget-object v9, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->SPAccept:Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    invoke-interface {v6, v9}, Lorg/linphone/core/LinphoneFriend;->setIncSubscribePolicy(Lorg/linphone/core/LinphoneFriend$SubscribePolicy;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 194
    :try_start_5
    invoke-interface {v4, v6}, Lorg/linphone/core/LinphoneCore;->addFriend(Lorg/linphone/core/LinphoneFriend;)V
    :try_end_5
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 201
    const/4 v9, 0x0

    const/4 v10, 0x0

    :try_start_6
    sget-object v11, Lorg/linphone/core/OnlineStatus;->Online:Lorg/linphone/core/OnlineStatus;

    invoke-interface {v4, v9, v10, v11}, Lorg/linphone/core/LinphoneCore;->setPresenceInfo(ILjava/lang/String;Lorg/linphone/core/OnlineStatus;)V

    .line 205
    const/4 v9, 0x1

    iput-boolean v9, p0, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->running:Z

    .line 206
    :goto_2
    iget-boolean v9, p0, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->running:Z

    if-eqz v9, :cond_3

    .line 207
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->iterate()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 209
    const-wide/16 v10, 0x32

    :try_start_7
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_2

    .line 210
    :catch_1
    move-exception v3

    .line 211
    .restart local v3    # "ie":Ljava/lang/InterruptedException;
    :try_start_8
    const-string/jumbo v9, "Interrupted!\nAborting"

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 230
    const-string/jumbo v9, "Shutting down..."

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 232
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 233
    const-string/jumbo v9, "Exited"

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 195
    .end local v3    # "ie":Ljava/lang/InterruptedException;
    :catch_2
    move-exception v2

    .line 196
    .local v2, "e":Lorg/linphone/core/LinphoneCoreException;
    :try_start_9
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "Error while adding friend "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v6}, Lorg/linphone/core/LinphoneFriend;->getAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v10

    invoke-interface {v10}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " to linphone"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 230
    const-string/jumbo v9, "Shutting down..."

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 232
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 233
    const-string/jumbo v9, "Exited"

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 218
    .end local v2    # "e":Lorg/linphone/core/LinphoneCoreException;
    :cond_3
    const/4 v9, 0x0

    const/4 v10, 0x0

    :try_start_a
    sget-object v11, Lorg/linphone/core/OnlineStatus;->Offline:Lorg/linphone/core/OnlineStatus;

    invoke-interface {v4, v9, v10, v11}, Lorg/linphone/core/LinphoneCore;->setPresenceInfo(ILjava/lang/String;Lorg/linphone/core/OnlineStatus;)V

    .line 220
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->iterate()V

    .line 223
    invoke-interface {v6}, Lorg/linphone/core/LinphoneFriend;->edit()V

    .line 224
    const/4 v9, 0x0

    invoke-interface {v6, v9}, Lorg/linphone/core/LinphoneFriend;->enableSubscribes(Z)V

    .line 225
    invoke-interface {v6}, Lorg/linphone/core/LinphoneFriend;->done()V

    .line 226
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->iterate()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 230
    const-string/jumbo v9, "Shutting down..."

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 232
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 233
    const-string/jumbo v9, "Exited"

    invoke-direct {p0, v9}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 230
    .end local v6    # "lf":Lorg/linphone/core/LinphoneFriend;
    :catchall_0
    move-exception v9

    const-string/jumbo v10, "Shutting down..."

    invoke-direct {p0, v10}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 232
    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 233
    const-string/jumbo v10, "Exited"

    invoke-direct {p0, v10}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 234
    throw v9
.end method

.method public messageReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;Lorg/linphone/core/LinphoneChatMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;
    .param p3, "message"    # Lorg/linphone/core/LinphoneChatMessage;

    .prologue
    .line 251
    return-void
.end method

.method public messageReceivedUnableToDecrypted(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;Lorg/linphone/core/LinphoneChatMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;
    .param p3, "message"    # Lorg/linphone/core/LinphoneChatMessage;

    .prologue
    .line 256
    return-void
.end method

.method public networkReachableChanged(Lorg/linphone/core/LinphoneCore;Z)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "enable"    # Z

    .prologue
    .line 367
    return-void
.end method

.method public newSubscriptionRequest(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriend;Ljava/lang/String;)V
    .locals 3
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "lf"    # Lorg/linphone/core/LinphoneFriend;
    .param p3, "url"    # Ljava/lang/String;

    .prologue
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/linphone/core/LinphoneFriend;->getAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "] wants to see your status, accepting"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 84
    invoke-interface {p2}, Lorg/linphone/core/LinphoneFriend;->edit()V

    .line 85
    sget-object v1, Lorg/linphone/core/LinphoneFriend$SubscribePolicy;->SPAccept:Lorg/linphone/core/LinphoneFriend$SubscribePolicy;

    invoke-interface {p2, v1}, Lorg/linphone/core/LinphoneFriend;->setIncSubscribePolicy(Lorg/linphone/core/LinphoneFriend$SubscribePolicy;)V

    .line 86
    invoke-interface {p2}, Lorg/linphone/core/LinphoneFriend;->done()V

    .line 89
    :try_start_0
    invoke-interface {p1, p2}, Lorg/linphone/core/LinphoneCore;->addFriend(Lorg/linphone/core/LinphoneFriend;)V
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 93
    :goto_0
    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Lorg/linphone/core/LinphoneCoreException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Error while adding friend ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p2}, Lorg/linphone/core/LinphoneFriend;->getAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "] to linphone in the callback"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public notifyPresenceReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriend;)V
    .locals 2
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "lf"    # Lorg/linphone/core/LinphoneFriend;

    .prologue
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "New state ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p2}, Lorg/linphone/core/LinphoneFriend;->getStatus()Lorg/linphone/core/OnlineStatus;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "] for user id ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p2}, Lorg/linphone/core/LinphoneFriend;->getAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 97
    return-void
.end method

.method public notifyReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneAddress;[B)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "from"    # Lorg/linphone/core/LinphoneAddress;
    .param p4, "event"    # [B

    .prologue
    .line 113
    return-void
.end method

.method public notifyReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Ljava/lang/String;Lorg/linphone/core/LinphoneContent;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "eventName"    # Ljava/lang/String;
    .param p4, "content"    # Lorg/linphone/core/LinphoneContent;

    .prologue
    .line 283
    return-void
.end method

.method public publishStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Lorg/linphone/core/PublishState;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "state"    # Lorg/linphone/core/PublishState;

    .prologue
    .line 290
    return-void
.end method

.method public registrationState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneProxyConfig;Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V
    .locals 2
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cfg"    # Lorg/linphone/core/LinphoneProxyConfig;
    .param p3, "cstate"    # Lorg/linphone/core/LinphoneCore$RegistrationState;
    .param p4, "smessage"    # Ljava/lang/String;

    .prologue
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Lorg/linphone/core/LinphoneProxyConfig;->getIdentity()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->write(Ljava/lang/String;)V

    .line 102
    return-void
.end method

.method public show(Lorg/linphone/core/LinphoneCore;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 103
    return-void
.end method

.method public stopMainLoop()V
    .locals 1

    .prologue
    .line 239
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/core/tutorials/TutorialBuddyStatus;->running:Z

    .line 240
    return-void
.end method

.method public subscriptionStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Lorg/linphone/core/SubscriptionState;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "state"    # Lorg/linphone/core/SubscriptionState;

    .prologue
    .line 276
    return-void
.end method

.method public transferState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "new_call_state"    # Lorg/linphone/core/LinphoneCall$State;

    .prologue
    .line 263
    return-void
.end method

.method public uploadProgressIndication(Lorg/linphone/core/LinphoneCore;II)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "offset"    # I
    .param p3, "total"    # I

    .prologue
    .line 343
    return-void
.end method

.method public uploadStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$LogCollectionUploadState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$LogCollectionUploadState;
    .param p3, "info"    # Ljava/lang/String;

    .prologue
    .line 350
    return-void
.end method
