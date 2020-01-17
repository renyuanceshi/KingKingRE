.class public Lorg/linphone/core/AndroidCameraRecordManager;
.super Ljava/lang/Object;
.source "AndroidCameraRecordManager.java"


# static fields
.field private static instance:Lorg/linphone/core/AndroidCameraRecordManager; = null

.field private static final tag:Ljava/lang/String; = "Linphone"


# instance fields
.field private cameraId:I

.field private final cc:Lorg/linphone/core/AndroidCameraConf;

.field private frontCameraId:I

.field private muted:Z

.field private parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

.field private phoneOrientation:I

.field private rearCameraId:I

.field private recorder:Lorg/linphone/core/AndroidCameraRecord;

.field private supportedVideoSizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Size;",
            ">;"
        }
    .end annotation
.end field

.field private surfaceView:Landroid/view/SurfaceView;


# direct methods
.method private constructor <init>()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v5, -0x1

    const/4 v4, 0x0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/16 v3, 0x9

    invoke-static {v3}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Lorg/linphone/core/AndroidCameraConf9;

    invoke-direct {v3}, Lorg/linphone/core/AndroidCameraConf9;-><init>()V

    :goto_0
    iput-object v3, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cc:Lorg/linphone/core/AndroidCameraConf;

    .line 76
    new-array v1, v6, [I

    aput v5, v1, v4

    .line 79
    .local v1, "fId":[I
    new-array v2, v6, [I

    aput v5, v2, v4

    .line 82
    .local v2, "rId":[I
    new-array v0, v6, [I

    aput v5, v0, v4

    .line 85
    .local v0, "cId":[I
    iget-object v3, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cc:Lorg/linphone/core/AndroidCameraConf;

    invoke-virtual {v3, v1, v2, v0}, Lorg/linphone/core/AndroidCameraConf;->findFrontAndRearCameraIds([I[I[I)V

    .line 86
    aget v3, v1, v4

    iput v3, p0, Lorg/linphone/core/AndroidCameraRecordManager;->frontCameraId:I

    .line 87
    aget v3, v2, v4

    iput v3, p0, Lorg/linphone/core/AndroidCameraRecordManager;->rearCameraId:I

    .line 88
    aget v3, v0, v4

    iput v3, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    .line 89
    return-void

    .line 74
    .end local v0    # "cId":[I
    .end local v1    # "fId":[I
    .end local v2    # "rId":[I
    :cond_0
    new-instance v3, Lorg/linphone/core/AndroidCameraConf;

    invoke-direct {v3}, Lorg/linphone/core/AndroidCameraConf;-><init>()V

    goto :goto_0
.end method

.method static synthetic access$002(Lorg/linphone/core/AndroidCameraRecordManager;Landroid/view/SurfaceView;)Landroid/view/SurfaceView;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/core/AndroidCameraRecordManager;
    .param p1, "x1"    # Landroid/view/SurfaceView;

    .prologue
    .line 37
    iput-object p1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->surfaceView:Landroid/view/SurfaceView;

    return-object p1
.end method

.method static synthetic access$100(Lorg/linphone/core/AndroidCameraRecordManager;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/core/AndroidCameraRecordManager;

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->tryToStartVideoRecording()V

    return-void
.end method

.method private bufferRotationForCorrectImageOrientation()I
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 260
    iget-object v3, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cc:Lorg/linphone/core/AndroidCameraConf;

    iget v4, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    invoke-virtual {v3, v4}, Lorg/linphone/core/AndroidCameraConf;->getCameraOrientation(I)I

    move-result v0

    .line 261
    .local v0, "cameraOrientation":I
    const/16 v3, 0x8

    invoke-static {v3}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v3

    if-eqz v3, :cond_0

    rsub-int v3, v0, 0x168

    add-int/lit8 v3, v3, 0x5a

    iget v4, p0, Lorg/linphone/core/AndroidCameraRecordManager;->phoneOrientation:I

    sub-int/2addr v3, v4

    rem-int/lit16 v1, v3, 0x168

    .line 263
    .local v1, "rotation":I
    :goto_0
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Capture video buffer will need a rotation of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " degrees : camera "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", phone "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lorg/linphone/core/AndroidCameraRecordManager;->phoneOrientation:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v3}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 265
    return v1

    .end local v1    # "rotation":I
    :cond_0
    move v1, v2

    .line 261
    goto :goto_0
.end method

.method public static final declared-synchronized getInstance()Lorg/linphone/core/AndroidCameraRecordManager;
    .locals 2

    .prologue
    .line 45
    const-class v1, Lorg/linphone/core/AndroidCameraRecordManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/linphone/core/AndroidCameraRecordManager;->instance:Lorg/linphone/core/AndroidCameraRecordManager;

    if-nez v0, :cond_0

    .line 46
    new-instance v0, Lorg/linphone/core/AndroidCameraRecordManager;

    invoke-direct {v0}, Lorg/linphone/core/AndroidCameraRecordManager;-><init>()V

    sput-object v0, Lorg/linphone/core/AndroidCameraRecordManager;->instance:Lorg/linphone/core/AndroidCameraRecordManager;

    .line 48
    :cond_0
    sget-object v0, Lorg/linphone/core/AndroidCameraRecordManager;->instance:Lorg/linphone/core/AndroidCameraRecordManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private tryToStartVideoRecording()V
    .locals 2

    .prologue
    .line 184
    iget-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->muted:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->surfaceView:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    if-nez v0, :cond_1

    .line 201
    :cond_0
    :goto_0
    return-void

    .line 187
    :cond_1
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    invoke-direct {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->bufferRotationForCorrectImageOrientation()I

    move-result v1

    iput v1, v0, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->rotation:I

    .line 189
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->surfaceView:Landroid/view/SurfaceView;

    iput-object v1, v0, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->surfaceView:Landroid/view/SurfaceView;

    .line 190
    const/16 v0, 0x9

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 191
    new-instance v0, Lorg/linphone/core/AndroidCameraRecord9Impl;

    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    invoke-direct {v0, v1}, Lorg/linphone/core/AndroidCameraRecord9Impl;-><init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V

    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    .line 200
    :goto_1
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    invoke-virtual {v0}, Lorg/linphone/core/AndroidCameraRecord;->startPreview()V

    goto :goto_0

    .line 192
    :cond_2
    const/16 v0, 0x8

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 193
    new-instance v0, Lorg/linphone/core/AndroidCameraRecord8Impl;

    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    invoke-direct {v0, v1}, Lorg/linphone/core/AndroidCameraRecord8Impl;-><init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V

    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    goto :goto_1

    .line 194
    :cond_3
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 195
    new-instance v0, Lorg/linphone/core/AndroidCameraRecord5Impl;

    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    invoke-direct {v0, v1}, Lorg/linphone/core/AndroidCameraRecord5Impl;-><init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V

    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    goto :goto_1

    .line 197
    :cond_4
    new-instance v0, Lorg/linphone/core/AndroidCameraRecordImpl;

    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    invoke-direct {v0, v1}, Lorg/linphone/core/AndroidCameraRecordImpl;-><init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V

    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    goto :goto_1
.end method


# virtual methods
.method public getPhoneOrientation()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->phoneOrientation:I

    return v0
.end method

.method public hasSeveralCameras()Z
    .locals 2

    .prologue
    .line 92
    iget v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->frontCameraId:I

    iget v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->rearCameraId:I

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public invalidateParameters()V
    .locals 1

    .prologue
    .line 243
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->stopVideoRecording()V

    .line 244
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    .line 245
    return-void
.end method

.method public isCameraOrientationPortrait()Z
    .locals 2

    .prologue
    .line 256
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cc:Lorg/linphone/core/AndroidCameraConf;

    iget v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    invoke-virtual {v0, v1}, Lorg/linphone/core/AndroidCameraConf;->getCameraOrientation(I)I

    move-result v0

    rem-int/lit16 v0, v0, 0xb4

    const/16 v1, 0x5a

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMuted()Z
    .locals 1

    .prologue
    .line 174
    iget-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->muted:Z

    return v0
.end method

.method public isRecording()Z
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    invoke-virtual {v0}, Lorg/linphone/core/AndroidCameraRecord;->isStarted()Z

    move-result v0

    .line 239
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isUseFrontCamera()Z
    .locals 2

    .prologue
    .line 103
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cc:Lorg/linphone/core/AndroidCameraConf;

    iget v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    invoke-virtual {v0, v1}, Lorg/linphone/core/AndroidCameraConf;->isFrontCamera(I)Z

    move-result v0

    return v0
.end method

.method public outputIsPortrait()Z
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 248
    invoke-direct {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->bufferRotationForCorrectImageOrientation()I

    move-result v1

    .line 249
    .local v1, "rotation":I
    rem-int/lit16 v4, v1, 0xb4

    const/16 v5, 0x5a

    if-ne v4, v5, :cond_0

    move v0, v2

    .line 251
    .local v0, "isPortrait":Z
    :goto_0
    new-array v2, v2, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Camera sensor in portrait orientation ?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v2}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 252
    return v0

    .end local v0    # "isPortrait":Z
    :cond_0
    move v0, v3

    .line 249
    goto :goto_0
.end method

.method public setMuted(Z)V
    .locals 1
    .param p1, "muteState"    # Z

    .prologue
    .line 158
    iget-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->muted:Z

    if-ne p1, v0, :cond_0

    .line 166
    :goto_0
    return-void

    .line 160
    :cond_0
    iput-boolean p1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->muted:Z

    .line 161
    iget-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->muted:Z

    if-eqz v0, :cond_1

    .line 162
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->stopVideoRecording()V

    goto :goto_0

    .line 164
    :cond_1
    invoke-direct {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->tryToStartVideoRecording()V

    goto :goto_0
.end method

.method public setParametersFromFilter(JIIF)V
    .locals 3
    .param p1, "filterDataPtr"    # J
    .param p3, "height"    # I
    .param p4, "width"    # I
    .param p5, "fps"    # F

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->stopVideoRecording()V

    .line 124
    new-instance v0, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    invoke-direct {v0, p1, p2}, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;-><init>(J)V

    .line 125
    .local v0, "p":Lorg/linphone/core/AndroidCameraRecord$RecorderParams;
    iput p5, v0, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->fps:F

    .line 126
    iput p4, v0, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->width:I

    .line 127
    iput p3, v0, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->height:I

    .line 128
    iget v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    iput v1, v0, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->cameraId:I

    .line 129
    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    .line 130
    invoke-direct {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->tryToStartVideoRecording()V

    .line 131
    return-void
.end method

.method public setPhoneOrientation(I)V
    .locals 0
    .param p1, "degrees"    # I

    .prologue
    .line 66
    iput p1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->phoneOrientation:I

    .line 67
    return-void
.end method

.method public final setSurfaceView(Landroid/view/SurfaceView;I)V
    .locals 2
    .param p1, "sv"    # Landroid/view/SurfaceView;
    .param p2, "phoneOrientation"    # I

    .prologue
    .line 134
    iput p2, p0, Lorg/linphone/core/AndroidCameraRecordManager;->phoneOrientation:I

    .line 135
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    .line 136
    .local v0, "holder":Landroid/view/SurfaceHolder;
    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 138
    new-instance v1, Lorg/linphone/core/AndroidCameraRecordManager$1;

    invoke-direct {v1, p0, p1}, Lorg/linphone/core/AndroidCameraRecordManager$1;-><init>(Lorg/linphone/core/AndroidCameraRecordManager;Landroid/view/SurfaceView;)V

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 155
    return-void
.end method

.method public setUseFrontCamera(Z)V
    .locals 2
    .param p1, "value"    # Z

    .prologue
    .line 96
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cc:Lorg/linphone/core/AndroidCameraConf;

    iget v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    invoke-virtual {v0, v1}, Lorg/linphone/core/AndroidCameraConf;->isFrontCamera(I)Z

    move-result v0

    if-ne v0, p1, :cond_0

    .line 100
    :goto_0
    return-void

    .line 99
    :cond_0
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->toggleUseFrontCamera()Z

    goto :goto_0
.end method

.method public stopVideoRecording()V
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    invoke-virtual {v0}, Lorg/linphone/core/AndroidCameraRecord;->stopPreview()V

    .line 206
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    .line 208
    :cond_0
    return-void
.end method

.method public supportedVideoSizes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Size;",
            ">;"
        }
    .end annotation

    .prologue
    .line 215
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->supportedVideoSizes:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 216
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->supportedVideoSizes:Ljava/util/List;

    .line 231
    :goto_0
    return-object v0

    .line 219
    :cond_0
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    if-eqz v0, :cond_1

    .line 220
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->recorder:Lorg/linphone/core/AndroidCameraRecord;

    invoke-virtual {v0}, Lorg/linphone/core/AndroidCameraRecord;->getSupportedVideoSizes()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->supportedVideoSizes:Ljava/util/List;

    .line 221
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->supportedVideoSizes:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 222
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->supportedVideoSizes:Ljava/util/List;

    goto :goto_0

    .line 225
    :cond_1
    const/4 v0, 0x5

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 226
    invoke-static {}, Lorg/linphone/core/AndroidCameraRecord5Impl;->oneShotSupportedVideoSizes()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->supportedVideoSizes:Ljava/util/List;

    .line 231
    :cond_2
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->supportedVideoSizes:Ljava/util/List;

    goto :goto_0
.end method

.method public toggleMute()Z
    .locals 1

    .prologue
    .line 169
    iget-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->muted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lorg/linphone/core/AndroidCameraRecordManager;->setMuted(Z)V

    .line 170
    iget-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecordManager;->muted:Z

    return v0

    .line 169
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toggleUseFrontCamera()Z
    .locals 3

    .prologue
    .line 107
    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cc:Lorg/linphone/core/AndroidCameraConf;

    iget v2, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    invoke-virtual {v1, v2}, Lorg/linphone/core/AndroidCameraConf;->isFrontCamera(I)Z

    move-result v0

    .line 109
    .local v0, "previousUseFront":Z
    if-eqz v0, :cond_1

    iget v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->rearCameraId:I

    :goto_0
    iput v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    .line 111
    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    if-eqz v1, :cond_0

    .line 112
    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->parameters:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v2, p0, Lorg/linphone/core/AndroidCameraRecordManager;->cameraId:I

    iput v2, v1, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->cameraId:I

    .line 113
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->isRecording()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 114
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->stopVideoRecording()V

    .line 115
    invoke-direct {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->tryToStartVideoRecording()V

    .line 119
    :cond_0
    if-nez v0, :cond_2

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 109
    :cond_1
    iget v1, p0, Lorg/linphone/core/AndroidCameraRecordManager;->frontCameraId:I

    goto :goto_0

    .line 119
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public tryResumingVideoRecording()V
    .locals 1

    .prologue
    .line 178
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    :goto_0
    return-void

    .line 180
    :cond_0
    invoke-direct {p0}, Lorg/linphone/core/AndroidCameraRecordManager;->tryToStartVideoRecording()V

    goto :goto_0
.end method
