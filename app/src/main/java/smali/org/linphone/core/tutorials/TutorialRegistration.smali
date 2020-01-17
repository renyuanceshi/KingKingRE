.class public Lorg/linphone/core/tutorials/TutorialRegistration;
.super Ljava/lang/Object;
.source "TutorialRegistration.java"

# interfaces
.implements Lorg/linphone/core/LinphoneCoreListener;


# instance fields
.field private TutorialNotifier:Lorg/linphone/core/tutorials/TutorialNotifier;

.field private running:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Lorg/linphone/core/tutorials/TutorialNotifier;

    invoke-direct {v0}, Lorg/linphone/core/tutorials/TutorialNotifier;-><init>()V

    iput-object v0, p0, Lorg/linphone/core/tutorials/TutorialRegistration;->TutorialNotifier:Lorg/linphone/core/tutorials/TutorialNotifier;

    .line 74
    return-void
.end method

.method public constructor <init>(Lorg/linphone/core/tutorials/TutorialNotifier;)V
    .locals 0
    .param p1, "TutorialNotifier"    # Lorg/linphone/core/tutorials/TutorialNotifier;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/linphone/core/tutorials/TutorialRegistration;->TutorialNotifier:Lorg/linphone/core/tutorials/TutorialNotifier;

    .line 70
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 6
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x2

    .line 103
    array-length v4, p0

    if-eq v4, v5, :cond_0

    .line 104
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "Bad number of arguments"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 108
    :cond_0
    new-instance v1, Lorg/linphone/core/tutorials/TutorialRegistration;

    invoke-direct {v1}, Lorg/linphone/core/tutorials/TutorialRegistration;-><init>()V

    .line 111
    .local v1, "tutorial":Lorg/linphone/core/tutorials/TutorialRegistration;
    const/4 v4, 0x1

    :try_start_0
    aget-object v2, p0, v4

    .line 113
    .local v2, "userSipAddress":Ljava/lang/String;
    const/4 v4, 0x2

    aget-object v3, p0, v4

    .line 114
    .local v3, "userSipPassword":Ljava/lang/String;
    invoke-virtual {v1, v2, v3}, Lorg/linphone/core/tutorials/TutorialRegistration;->launchTutorial(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .end local v2    # "userSipAddress":Ljava/lang/String;
    .end local v3    # "userSipPassword":Ljava/lang/String;
    :goto_0
    return-void

    .line 115
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private sleep(I)V
    .locals 4
    .param p1, "ms"    # I

    .prologue
    .line 189
    int-to-long v2, p1

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    :goto_0
    return-void

    .line 190
    :catch_0
    move-exception v0

    .line 191
    .local v0, "ie":Ljava/lang/InterruptedException;
    const-string/jumbo v1, "Interrupted!\nAborting"

    invoke-direct {p0, v1}, Lorg/linphone/core/tutorials/TutorialRegistration;->write(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private write(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 202
    iget-object v0, p0, Lorg/linphone/core/tutorials/TutorialRegistration;->TutorialNotifier:Lorg/linphone/core/tutorials/TutorialNotifier;

    invoke-virtual {v0, p1}, Lorg/linphone/core/tutorials/TutorialNotifier;->notify(Ljava/lang/String;)V

    .line 203
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
    .line 86
    return-void
.end method

.method public authenticationRequested(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneAuthInfo;Lorg/linphone/core/LinphoneCore$AuthMethod;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "authInfo"    # Lorg/linphone/core/LinphoneAuthInfo;
    .param p3, "method"    # Lorg/linphone/core/LinphoneCore$AuthMethod;

    .prologue
    .line 87
    return-void
.end method

.method public byeReceived(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "from"    # Ljava/lang/String;

    .prologue
    .line 85
    return-void
.end method

.method public callEncryptionChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;ZLjava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "encrypted"    # Z
    .param p4, "authenticationToken"    # Ljava/lang/String;

    .prologue
    .line 97
    return-void
.end method

.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "cstate"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "msg"    # Ljava/lang/String;

    .prologue
    .line 94
    return-void
.end method

.method public callStatsUpdated(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallStats;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "stats"    # Lorg/linphone/core/LinphoneCallStats;

    .prologue
    .line 95
    return-void
.end method

.method public configuringStatus(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$RemoteProvisioningState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$RemoteProvisioningState;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 262
    return-void
.end method

.method public displayMessage(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 89
    return-void
.end method

.method public displayStatus(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 88
    return-void
.end method

.method public displayWarning(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 90
    return-void
.end method

.method public dtmfReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;I)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "dtmf"    # I

    .prologue
    .line 99
    return-void
.end method

.method public ecCalibrationStatus(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;ILjava/lang/Object;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "status"    # Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;
    .param p3, "delay_ms"    # I
    .param p4, "data"    # Ljava/lang/Object;

    .prologue
    .line 96
    return-void
.end method

.method public fileTransferProgressIndication(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatMessage;Lorg/linphone/core/LinphoneContent;I)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Lorg/linphone/core/LinphoneChatMessage;
    .param p3, "content"    # Lorg/linphone/core/LinphoneContent;
    .param p4, "progress"    # I

    .prologue
    .line 269
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
    .line 276
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
    .line 282
    const/4 v0, 0x0

    return v0
.end method

.method public friendListCreated(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriendList;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "list"    # Lorg/linphone/core/LinphoneFriendList;

    .prologue
    .line 303
    return-void
.end method

.method public friendListRemoved(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriendList;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "list"    # Lorg/linphone/core/LinphoneFriendList;

    .prologue
    .line 309
    return-void
.end method

.method public globalState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$GlobalState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$GlobalState;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 91
    return-void
.end method

.method public infoReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneInfoMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "info"    # Lorg/linphone/core/LinphoneInfoMessage;

    .prologue
    .line 228
    return-void
.end method

.method public isComposingReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;

    .prologue
    .line 255
    return-void
.end method

.method public launchTutorial(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "sipAddress"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 123
    invoke-static {}, Lorg/linphone/core/LinphoneCoreFactory;->instance()Lorg/linphone/core/LinphoneCoreFactory;

    move-result-object v3

    .line 127
    .local v3, "lcFactory":Lorg/linphone/core/LinphoneCoreFactory;
    invoke-virtual {v3, p0, v6}, Lorg/linphone/core/LinphoneCoreFactory;->createLinphoneCore(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/Object;)Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    .line 133
    .local v2, "lc":Lorg/linphone/core/LinphoneCore;
    :try_start_0
    invoke-virtual {v3, p1}, Lorg/linphone/core/LinphoneCoreFactory;->createLinphoneAddress(Ljava/lang/String;)Lorg/linphone/core/LinphoneAddress;

    move-result-object v0

    .line 134
    .local v0, "address":Lorg/linphone/core/LinphoneAddress;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v5

    .line 135
    .local v5, "username":Ljava/lang/String;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneAddress;->getDomain()Ljava/lang/String;

    move-result-object v1

    .line 138
    .local v1, "domain":Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 140
    const/4 v6, 0x0

    invoke-virtual {v3, v5, p2, v6, v1}, Lorg/linphone/core/LinphoneCoreFactory;->createAuthInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/LinphoneAuthInfo;

    move-result-object v6

    invoke-interface {v2, v6}, Lorg/linphone/core/LinphoneCore;->addAuthInfo(Lorg/linphone/core/LinphoneAuthInfo;)V

    .line 144
    :cond_0
    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-interface {v2, p1, v1, v6, v7}, Lorg/linphone/core/LinphoneCore;->createProxyConfig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v4

    .line 145
    .local v4, "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    const/16 v6, 0x7d0

    invoke-interface {v4, v6}, Lorg/linphone/core/LinphoneProxyConfig;->setExpires(I)V

    .line 146
    invoke-interface {v2, v4}, Lorg/linphone/core/LinphoneCore;->addProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V

    .line 147
    invoke-interface {v2, v4}, Lorg/linphone/core/LinphoneCore;->setDefaultProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V

    .line 152
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/linphone/core/tutorials/TutorialRegistration;->running:Z

    .line 153
    :goto_0
    iget-boolean v6, p0, Lorg/linphone/core/tutorials/TutorialRegistration;->running:Z

    if-eqz v6, :cond_1

    .line 154
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->iterate()V

    .line 155
    const/16 v6, 0x32

    invoke-direct {p0, v6}, Lorg/linphone/core/tutorials/TutorialRegistration;->sleep(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 181
    .end local v0    # "address":Lorg/linphone/core/LinphoneAddress;
    .end local v1    # "domain":Ljava/lang/String;
    .end local v4    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    .end local v5    # "username":Ljava/lang/String;
    :catchall_0
    move-exception v6

    const-string/jumbo v7, "Shutting down linphone..."

    invoke-direct {p0, v7}, Lorg/linphone/core/tutorials/TutorialRegistration;->write(Ljava/lang/String;)V

    .line 183
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 184
    throw v6

    .line 160
    .restart local v0    # "address":Lorg/linphone/core/LinphoneAddress;
    .restart local v1    # "domain":Ljava/lang/String;
    .restart local v4    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    .restart local v5    # "username":Ljava/lang/String;
    :cond_1
    :try_start_1
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneProxyConfig;->edit()Lorg/linphone/core/LinphoneProxyConfig;

    .line 161
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    const/4 v7, 0x0

    invoke-interface {v6, v7}, Lorg/linphone/core/LinphoneProxyConfig;->enableRegister(Z)Lorg/linphone/core/LinphoneProxyConfig;

    .line 162
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneProxyConfig;->done()V

    .line 163
    :goto_1
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneProxyConfig;->getState()Lorg/linphone/core/LinphoneCore$RegistrationState;

    move-result-object v6

    sget-object v7, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationCleared:Lorg/linphone/core/LinphoneCore$RegistrationState;

    if-eq v6, v7, :cond_2

    .line 164
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->iterate()V

    .line 165
    const/16 v6, 0x32

    invoke-direct {p0, v6}, Lorg/linphone/core/tutorials/TutorialRegistration;->sleep(I)V

    goto :goto_1

    .line 169
    :cond_2
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneProxyConfig;->edit()Lorg/linphone/core/LinphoneProxyConfig;

    .line 170
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Lorg/linphone/core/LinphoneProxyConfig;->enableRegister(Z)Lorg/linphone/core/LinphoneProxyConfig;

    .line 171
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneProxyConfig;->done()V

    .line 173
    :goto_2
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneProxyConfig;->getState()Lorg/linphone/core/LinphoneCore$RegistrationState;

    move-result-object v6

    sget-object v7, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationOk:Lorg/linphone/core/LinphoneCore$RegistrationState;

    if-eq v6, v7, :cond_3

    .line 174
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneProxyConfig;->getState()Lorg/linphone/core/LinphoneCore$RegistrationState;

    move-result-object v6

    sget-object v7, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationFailed:Lorg/linphone/core/LinphoneCore$RegistrationState;

    if-eq v6, v7, :cond_3

    .line 175
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->iterate()V

    .line 176
    const/16 v6, 0x32

    invoke-direct {p0, v6}, Lorg/linphone/core/tutorials/TutorialRegistration;->sleep(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 181
    :cond_3
    const-string/jumbo v6, "Shutting down linphone..."

    invoke-direct {p0, v6}, Lorg/linphone/core/tutorials/TutorialRegistration;->write(Ljava/lang/String;)V

    .line 183
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 185
    return-void
.end method

.method public messageReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;Lorg/linphone/core/LinphoneChatMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;
    .param p3, "message"    # Lorg/linphone/core/LinphoneChatMessage;

    .prologue
    .line 210
    return-void
.end method

.method public messageReceivedUnableToDecrypted(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;Lorg/linphone/core/LinphoneChatMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;
    .param p3, "message"    # Lorg/linphone/core/LinphoneChatMessage;

    .prologue
    .line 215
    return-void
.end method

.method public networkReachableChanged(Lorg/linphone/core/LinphoneCore;Z)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "enable"    # Z

    .prologue
    .line 314
    return-void
.end method

.method public newSubscriptionRequest(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriend;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "lf"    # Lorg/linphone/core/LinphoneFriend;
    .param p3, "url"    # Ljava/lang/String;

    .prologue
    .line 92
    return-void
.end method

.method public notifyPresenceReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriend;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "lf"    # Lorg/linphone/core/LinphoneFriend;

    .prologue
    .line 93
    return-void
.end method

.method public notifyReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneAddress;[B)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "from"    # Lorg/linphone/core/LinphoneAddress;
    .param p4, "event"    # [B

    .prologue
    .line 98
    return-void
.end method

.method public notifyReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Ljava/lang/String;Lorg/linphone/core/LinphoneContent;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "eventName"    # Ljava/lang/String;
    .param p4, "content"    # Lorg/linphone/core/LinphoneContent;

    .prologue
    .line 242
    return-void
.end method

.method public publishStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Lorg/linphone/core/PublishState;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "state"    # Lorg/linphone/core/PublishState;

    .prologue
    .line 249
    return-void
.end method

.method public registrationState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneProxyConfig;Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V
    .locals 2
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cfg"    # Lorg/linphone/core/LinphoneProxyConfig;
    .param p3, "cstate"    # Lorg/linphone/core/LinphoneCore$RegistrationState;
    .param p4, "smessage"    # Ljava/lang/String;

    .prologue
    .line 81
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

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/linphone/core/tutorials/TutorialRegistration;->write(Ljava/lang/String;)V

    .line 82
    return-void
.end method

.method public show(Lorg/linphone/core/LinphoneCore;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 84
    return-void
.end method

.method public stopMainLoop()V
    .locals 1

    .prologue
    .line 197
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/core/tutorials/TutorialRegistration;->running:Z

    .line 198
    return-void
.end method

.method public subscriptionStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Lorg/linphone/core/SubscriptionState;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "state"    # Lorg/linphone/core/SubscriptionState;

    .prologue
    .line 235
    return-void
.end method

.method public transferState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "new_call_state"    # Lorg/linphone/core/LinphoneCall$State;

    .prologue
    .line 222
    return-void
.end method

.method public uploadProgressIndication(Lorg/linphone/core/LinphoneCore;II)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "offset"    # I
    .param p3, "total"    # I

    .prologue
    .line 289
    return-void
.end method

.method public uploadStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$LogCollectionUploadState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$LogCollectionUploadState;
    .param p3, "info"    # Ljava/lang/String;

    .prologue
    .line 296
    return-void
.end method
