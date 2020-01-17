.class public Lorg/linphone/BandwidthManager;
.super Ljava/lang/Object;
.source "BandwidthManager.java"


# static fields
.field public static final HIGH_RESOLUTION:I = 0x0

.field public static final LOW_BANDWIDTH:I = 0x2

.field public static final LOW_RESOLUTION:I = 0x1

.field private static final bandwidthes:[[I

.field private static instance:Lorg/linphone/BandwidthManager;


# instance fields
.field private currentProfile:I

.field private userRestriction:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 43
    const/4 v0, 0x3

    new-array v0, v0, [[I

    const/4 v1, 0x0

    new-array v2, v3, [I

    fill-array-data v2, :array_0

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-array v2, v3, [I

    fill-array-data v2, :array_1

    aput-object v2, v0, v1

    new-array v1, v3, [I

    fill-array-data v1, :array_2

    aput-object v1, v0, v3

    sput-object v0, Lorg/linphone/BandwidthManager;->bandwidthes:[[I

    return-void

    :array_0
    .array-data 4
        0x100
        0x100
    .end array-data

    :array_1
    .array-data 4
        0xc8
        0xc8
    .end array-data

    :array_2
    .array-data 4
        0x50
        0x50
    .end array-data
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput v0, p0, Lorg/linphone/BandwidthManager;->currentProfile:I

    .line 73
    return-void
.end method

.method private computeNewProfile()V
    .locals 2

    .prologue
    .line 87
    iget-boolean v1, p0, Lorg/linphone/BandwidthManager;->userRestriction:Z

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    .line 88
    .local v0, "newProfile":I
    :goto_0
    iget v1, p0, Lorg/linphone/BandwidthManager;->currentProfile:I

    if-eq v0, v1, :cond_0

    .line 89
    iput v0, p0, Lorg/linphone/BandwidthManager;->currentProfile:I

    .line 90
    iget v1, p0, Lorg/linphone/BandwidthManager;->currentProfile:I

    invoke-direct {p0, v1}, Lorg/linphone/BandwidthManager;->onProfileChanged(I)V

    .line 92
    :cond_0
    return-void

    .line 87
    .end local v0    # "newProfile":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static final declared-synchronized getInstance()Lorg/linphone/BandwidthManager;
    .locals 2

    .prologue
    .line 61
    const-class v1, Lorg/linphone/BandwidthManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/linphone/BandwidthManager;->instance:Lorg/linphone/BandwidthManager;

    if-nez v0, :cond_0

    .line 62
    new-instance v0, Lorg/linphone/BandwidthManager;

    invoke-direct {v0}, Lorg/linphone/BandwidthManager;-><init>()V

    sput-object v0, Lorg/linphone/BandwidthManager;->instance:Lorg/linphone/BandwidthManager;

    .line 63
    :cond_0
    sget-object v0, Lorg/linphone/BandwidthManager;->instance:Lorg/linphone/BandwidthManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 61
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getMaximumVideoSize(Z)Lorg/linphone/core/VideoSize;
    .locals 1
    .param p1, "isPortrait"    # Z

    .prologue
    .line 183
    iget v0, p0, Lorg/linphone/BandwidthManager;->currentProfile:I

    invoke-direct {p0, v0, p1}, Lorg/linphone/BandwidthManager;->maximumVideoSize(IZ)Lorg/linphone/core/VideoSize;

    move-result-object v0

    return-object v0
.end method

.method public static isRoamSaveVideoEnable()Z
    .locals 1

    .prologue
    .line 196
    invoke-static {}, Lorg/linphone/mediastream/Version;->isVideoCapable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/linphone/LinphoneActivity;->instance()Lorg/linphone/LinphoneActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->isPostpaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private maxSupportedVideoSize(ZLorg/linphone/core/VideoSize;Ljava/util/List;)Lorg/linphone/core/VideoSize;
    .locals 10
    .param p1, "isPortrait"    # Z
    .param p2, "maximumVideoSize"    # Lorg/linphone/core/VideoSize;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lorg/linphone/core/VideoSize;",
            "Ljava/util/List",
            "<",
            "Lorg/linphone/core/VideoSize;",
            ">;)",
            "Lorg/linphone/core/VideoSize;"
        }
    .end annotation

    .prologue
    .local p3, "supportedVideoSizes":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/VideoSize;>;"
    const/4 v6, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 147
    const/4 v4, 0x4

    new-array v5, v4, [Ljava/lang/Object;

    const-string/jumbo v4, "Searching for maximum video size for "

    aput-object v4, v5, v7

    if-eqz p1, :cond_2

    const-string/jumbo v4, "portrait"

    :goto_0
    aput-object v4, v5, v8

    const-string/jumbo v4, "capture from ("

    aput-object v4, v5, v9

    aput-object p2, v5, v6

    invoke-static {v5}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 149
    invoke-static {v6, p1}, Lorg/linphone/core/VideoSize;->createStandard(IZ)Lorg/linphone/core/VideoSize;

    move-result-object v3

    .line 150
    .local v3, "selected":Lorg/linphone/core/VideoSize;
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/VideoSize;

    .line 151
    .local v0, "s":Lorg/linphone/core/VideoSize;
    iget v2, v0, Lorg/linphone/core/VideoSize;->width:I

    .line 152
    .local v2, "sW":I
    iget v1, v0, Lorg/linphone/core/VideoSize;->height:I

    .line 153
    .local v1, "sH":I
    invoke-virtual {v0}, Lorg/linphone/core/VideoSize;->isPortrait()Z

    move-result v5

    if-eq v5, p1, :cond_1

    .line 154
    iget v2, v0, Lorg/linphone/core/VideoSize;->height:I

    .line 155
    iget v1, v0, Lorg/linphone/core/VideoSize;->width:I

    .line 157
    :cond_1
    iget v5, p2, Lorg/linphone/core/VideoSize;->width:I

    if-gt v2, v5, :cond_0

    iget v5, p2, Lorg/linphone/core/VideoSize;->height:I

    if-gt v1, v5, :cond_0

    .line 159
    iget v5, v3, Lorg/linphone/core/VideoSize;->width:I

    if-ge v5, v2, :cond_0

    iget v5, v3, Lorg/linphone/core/VideoSize;->height:I

    if-ge v5, v1, :cond_0

    .line 160
    new-instance v3, Lorg/linphone/core/VideoSize;

    .end local v3    # "selected":Lorg/linphone/core/VideoSize;
    invoke-direct {v3, v2, v1}, Lorg/linphone/core/VideoSize;-><init>(II)V

    .line 161
    .restart local v3    # "selected":Lorg/linphone/core/VideoSize;
    new-array v5, v9, [Ljava/lang/Object;

    const-string/jumbo v6, "A better video size has been found: "

    aput-object v6, v5, v7

    aput-object v3, v5, v8

    invoke-static {v5}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    goto :goto_1

    .line 147
    .end local v0    # "s":Lorg/linphone/core/VideoSize;
    .end local v1    # "sH":I
    .end local v2    # "sW":I
    .end local v3    # "selected":Lorg/linphone/core/VideoSize;
    :cond_2
    const-string/jumbo v4, "landscape"

    goto :goto_0

    .line 164
    .restart local v3    # "selected":Lorg/linphone/core/VideoSize;
    :cond_3
    return-object v3
.end method

.method private maximumVideoSize(IZ)Lorg/linphone/core/VideoSize;
    .locals 3
    .param p1, "profile"    # I
    .param p2, "cameraIsPortrait"    # Z

    .prologue
    .line 168
    packed-switch p1, :pswitch_data_0

    .line 174
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "profile not managed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 170
    :pswitch_0
    const/4 v0, 0x0

    invoke-static {v0, p2}, Lorg/linphone/core/VideoSize;->createStandard(IZ)Lorg/linphone/core/VideoSize;

    move-result-object v0

    .line 172
    :goto_0
    return-object v0

    :pswitch_1
    const/4 v0, 0x3

    invoke-static {v0, p2}, Lorg/linphone/core/VideoSize;->createStandard(IZ)Lorg/linphone/core/VideoSize;

    move-result-object v0

    goto :goto_0

    .line 168
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onProfileChanged(I)V
    .locals 3
    .param p1, "newProfile"    # I

    .prologue
    .line 95
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 96
    .local v0, "lc":Lorg/linphone/core/LinphoneCore;
    sget-object v1, Lorg/linphone/BandwidthManager;->bandwidthes:[[I

    aget-object v1, v1, p1

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setUploadBandwidth(I)V

    .line 97
    sget-object v1, Lorg/linphone/BandwidthManager;->bandwidthes:[[I

    aget-object v1, v1, p1

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setDownloadBandwidth(I)V

    .line 99
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 100
    invoke-static {}, Lorg/linphone/CallManager;->getInstance()Lorg/linphone/CallManager;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/CallManager;->reinvite()V

    .line 104
    :goto_0
    return-void

    .line 102
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/linphone/BandwidthManager;->updateWithProfileSettings(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCallParams;)V

    goto :goto_0
.end method


# virtual methods
.method public getCurrentProfile()I
    .locals 1

    .prologue
    .line 57
    iget v0, p0, Lorg/linphone/BandwidthManager;->currentProfile:I

    return v0
.end method

.method public isUserRestriction()Z
    .locals 1

    .prologue
    .line 78
    iget-boolean v0, p0, Lorg/linphone/BandwidthManager;->userRestriction:Z

    return v0
.end method

.method public isVideoPossible()Z
    .locals 2

    .prologue
    .line 179
    iget v0, p0, Lorg/linphone/BandwidthManager;->currentProfile:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setUserRestriction(Z)V
    .locals 0
    .param p1, "limit"    # Z

    .prologue
    .line 82
    iput-boolean p1, p0, Lorg/linphone/BandwidthManager;->userRestriction:Z

    .line 83
    invoke-direct {p0}, Lorg/linphone/BandwidthManager;->computeNewProfile()V

    .line 84
    return-void
.end method

.method public updateWithProfileSettings(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCallParams;)V
    .locals 8
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "callParams"    # Lorg/linphone/core/LinphoneCallParams;

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x0

    .line 109
    invoke-virtual {p0}, Lorg/linphone/BandwidthManager;->isVideoPossible()Z

    move-result v2

    .line 110
    .local v2, "bandwidthOKForVideo":Z
    if-eqz v2, :cond_0

    invoke-static {}, Lorg/linphone/BandwidthManager;->isRoamSaveVideoEnable()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 118
    invoke-static {}, Lorg/linphone/core/AndroidCameraRecordManager;->getInstance()Lorg/linphone/core/AndroidCameraRecordManager;

    move-result-object v0

    .line 119
    .local v0, "acrm":Lorg/linphone/core/AndroidCameraRecordManager;
    invoke-virtual {v0}, Lorg/linphone/core/AndroidCameraRecordManager;->isCameraOrientationPortrait()Z

    move-result v3

    .line 120
    .local v3, "isPortrait":Z
    new-instance v4, Lorg/linphone/core/VideoSize;

    invoke-direct {v4, v6, v6}, Lorg/linphone/core/VideoSize;-><init>(II)V

    .line 122
    .local v4, "targetVideoSize":Lorg/linphone/core/VideoSize;
    invoke-static {v7, v3}, Lorg/linphone/core/VideoSize;->createStandard(IZ)Lorg/linphone/core/VideoSize;

    move-result-object v5

    invoke-interface {p1, v5}, Lorg/linphone/core/LinphoneCore;->setPreferredVideoSize(Lorg/linphone/core/VideoSize;)V

    .line 125
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getPreferredVideoSize()Lorg/linphone/core/VideoSize;

    move-result-object v1

    .line 126
    .local v1, "actualVideoSize":Lorg/linphone/core/VideoSize;
    invoke-virtual {v4, v1}, Lorg/linphone/core/VideoSize;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 128
    invoke-virtual {v4}, Lorg/linphone/core/VideoSize;->isPortrait()Z

    move-result v5

    .line 127
    invoke-static {v7, v5}, Lorg/linphone/core/VideoSize;->createStandard(IZ)Lorg/linphone/core/VideoSize;

    move-result-object v5

    invoke-interface {p1, v5}, Lorg/linphone/core/LinphoneCore;->setPreferredVideoSize(Lorg/linphone/core/VideoSize;)V

    .line 132
    .end local v0    # "acrm":Lorg/linphone/core/AndroidCameraRecordManager;
    .end local v1    # "actualVideoSize":Lorg/linphone/core/VideoSize;
    .end local v3    # "isPortrait":Z
    .end local v4    # "targetVideoSize":Lorg/linphone/core/VideoSize;
    :cond_0
    if-eqz p2, :cond_1

    .line 134
    if-nez v2, :cond_2

    .line 136
    invoke-interface {p2, v6}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 137
    const/16 v5, 0x28

    invoke-interface {p2, v5}, Lorg/linphone/core/LinphoneCallParams;->setAudioBandwidth(I)V

    .line 143
    :cond_1
    :goto_0
    return-void

    .line 139
    :cond_2
    const/4 v5, 0x1

    invoke-interface {p2, v5}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 140
    invoke-interface {p2, v6}, Lorg/linphone/core/LinphoneCallParams;->setAudioBandwidth(I)V

    goto :goto_0
.end method
