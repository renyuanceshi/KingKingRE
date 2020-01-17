.class public Lorg/linphone/CallManager;
.super Ljava/lang/Object;
.source "CallManager.java"


# static fields
.field private static instance:Lorg/linphone/CallManager;

.field private static shouldaddvideo:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/CallManager;->shouldaddvideo:Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method private bm()Lorg/linphone/BandwidthManager;
    .locals 1

    .prologue
    .line 58
    invoke-static {}, Lorg/linphone/BandwidthManager;->getInstance()Lorg/linphone/BandwidthManager;

    move-result-object v0

    return-object v0
.end method

.method public static final declared-synchronized getInstance()Lorg/linphone/CallManager;
    .locals 2

    .prologue
    .line 44
    const-class v1, Lorg/linphone/CallManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/linphone/CallManager;->instance:Lorg/linphone/CallManager;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lorg/linphone/CallManager;

    invoke-direct {v0}, Lorg/linphone/CallManager;-><init>()V

    sput-object v0, Lorg/linphone/CallManager;->instance:Lorg/linphone/CallManager;

    .line 46
    :cond_0
    sget-object v0, Lorg/linphone/CallManager;->instance:Lorg/linphone/CallManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 44
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private lc()Lorg/linphone/core/LinphoneCore;
    .locals 1

    .prologue
    .line 50
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    return-object v0
.end method

.method private videoManager()Lorg/linphone/core/AndroidCameraRecordManager;
    .locals 1

    .prologue
    .line 54
    invoke-static {}, Lorg/linphone/core/AndroidCameraRecordManager;->getInstance()Lorg/linphone/core/AndroidCameraRecordManager;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addVideo()Z
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 121
    invoke-direct {p0}, Lorg/linphone/CallManager;->lc()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 122
    .local v0, "call":Lorg/linphone/core/LinphoneCall;
    invoke-virtual {p0, v0, v3}, Lorg/linphone/CallManager;->enableCamera(Lorg/linphone/core/LinphoneCall;Z)V

    .line 123
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v1

    .line 124
    .local v1, "params":Lorg/linphone/core/LinphoneCallParams;
    invoke-interface {v1, v3}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 125
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    invoke-interface {v2, v3, v3}, Lorg/linphone/core/LinphoneCore;->enableVideo(ZZ)V

    .line 128
    invoke-virtual {p0}, Lorg/linphone/CallManager;->reinviteWithVideo()Z

    move-result v2

    return v2
.end method

.method public enableCamera(Lorg/linphone/core/LinphoneCall;Z)V
    .locals 0
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "enable"    # Z

    .prologue
    .line 132
    if-eqz p1, :cond_0

    .line 133
    invoke-interface {p1, p2}, Lorg/linphone/core/LinphoneCall;->enableCamera(Z)V

    .line 136
    :cond_0
    return-void
.end method

.method public inviteAddress(Lorg/linphone/core/LinphoneAddress;Z)V
    .locals 5
    .param p1, "lAddress"    # Lorg/linphone/core/LinphoneAddress;
    .param p2, "videoEnabled"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 63
    invoke-direct {p0}, Lorg/linphone/CallManager;->lc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 65
    .local v0, "lc":Lorg/linphone/core/LinphoneCore;
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->createCallParams(Lorg/linphone/core/LinphoneCall;)Lorg/linphone/core/LinphoneCallParams;

    move-result-object v1

    .line 66
    .local v1, "params":Lorg/linphone/core/LinphoneCallParams;
    invoke-direct {p0}, Lorg/linphone/CallManager;->bm()Lorg/linphone/BandwidthManager;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lorg/linphone/BandwidthManager;->updateWithProfileSettings(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCallParams;)V

    .line 68
    if-eqz p2, :cond_0

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 69
    invoke-direct {p0}, Lorg/linphone/CallManager;->videoManager()Lorg/linphone/core/AndroidCameraRecordManager;

    move-result-object v2

    invoke-virtual {v2, v3}, Lorg/linphone/core/AndroidCameraRecordManager;->setMuted(Z)V

    .line 70
    invoke-interface {v1, v4}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 75
    :goto_0
    invoke-interface {v0, p1, v1}, Lorg/linphone/core/LinphoneCore;->inviteAddressWithParams(Lorg/linphone/core/LinphoneAddress;Lorg/linphone/core/LinphoneCallParams;)Lorg/linphone/core/LinphoneCall;

    .line 77
    if-eqz p2, :cond_1

    .line 78
    sput-boolean v4, Lorg/linphone/CallManager;->shouldaddvideo:Z

    .line 83
    :goto_1
    return-void

    .line 72
    :cond_0
    invoke-interface {v1, v3}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    goto :goto_0

    .line 80
    :cond_1
    sput-boolean v3, Lorg/linphone/CallManager;->shouldaddvideo:Z

    goto :goto_1
.end method

.method reinvite()V
    .locals 6

    .prologue
    .line 142
    invoke-direct {p0}, Lorg/linphone/CallManager;->lc()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    .line 143
    .local v1, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 144
    .local v0, "lCall":Lorg/linphone/core/LinphoneCall;
    if-nez v0, :cond_0

    .line 145
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "Trying to reinvite while not in call: doing nothing"

    aput-object v5, v3, v4

    invoke-static {v3}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    .line 151
    :goto_0
    return-void

    .line 148
    :cond_0
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v2

    .line 149
    .local v2, "params":Lorg/linphone/core/LinphoneCallParams;
    invoke-direct {p0}, Lorg/linphone/CallManager;->bm()Lorg/linphone/BandwidthManager;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lorg/linphone/BandwidthManager;->updateWithProfileSettings(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCallParams;)V

    .line 150
    invoke-interface {v1, v0, v2}, Lorg/linphone/core/LinphoneCore;->updateCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)I

    goto :goto_0
.end method

.method reinviteWithVideo()Z
    .locals 6

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 93
    invoke-direct {p0}, Lorg/linphone/CallManager;->lc()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    .line 94
    .local v1, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 95
    .local v0, "lCall":Lorg/linphone/core/LinphoneCall;
    if-nez v0, :cond_1

    .line 96
    new-array v4, v4, [Ljava/lang/Object;

    const-string/jumbo v5, "Trying to reinviteWithVideo while not in call: doing nothing"

    aput-object v5, v4, v3

    invoke-static {v4}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    .line 114
    :cond_0
    :goto_0
    return v3

    .line 99
    :cond_1
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v2

    .line 101
    .local v2, "params":Lorg/linphone/core/LinphoneCallParams;
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v5

    if-nez v5, :cond_0

    .line 105
    invoke-direct {p0}, Lorg/linphone/CallManager;->bm()Lorg/linphone/BandwidthManager;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Lorg/linphone/BandwidthManager;->updateWithProfileSettings(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCallParams;)V

    .line 106
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 113
    invoke-interface {v1, v0, v2}, Lorg/linphone/core/LinphoneCore;->updateCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)I

    move v3, v4

    .line 114
    goto :goto_0
.end method

.method updateCall()V
    .locals 6

    .prologue
    .line 160
    invoke-direct {p0}, Lorg/linphone/CallManager;->lc()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    .line 161
    .local v1, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 162
    .local v0, "lCall":Lorg/linphone/core/LinphoneCall;
    if-nez v0, :cond_0

    .line 163
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "Trying to updateCall while not in call: doing nothing"

    aput-object v5, v3, v4

    invoke-static {v3}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    .line 169
    :goto_0
    return-void

    .line 166
    :cond_0
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v2

    .line 167
    .local v2, "params":Lorg/linphone/core/LinphoneCallParams;
    invoke-direct {p0}, Lorg/linphone/CallManager;->bm()Lorg/linphone/BandwidthManager;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lorg/linphone/BandwidthManager;->updateWithProfileSettings(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCallParams;)V

    .line 168
    const/4 v3, 0x0

    invoke-interface {v1, v0, v3}, Lorg/linphone/core/LinphoneCore;->updateCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)I

    goto :goto_0
.end method
