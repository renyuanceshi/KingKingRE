.class public Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper;
.super Ljava/lang/Object;
.source "AndroidVideoApi9JniWrapper.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x9
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static detectCameras([I[I[I)I
    .locals 1
    .param p0, "indexes"    # [I
    .param p1, "frontFacing"    # [I
    .param p2, "orientation"    # [I

    .prologue
    .line 35
    invoke-static {p0, p1, p2}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->detectCameras([I[I[I)I

    move-result v0

    return v0
.end method

.method private static findClosestEnclosingFpsRange(ILjava/util/List;)[I
    .locals 10
    .param p0, "expectedFps"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<[I>;)[I"
        }
    .end annotation

    .prologue
    .local p1, "fpsRanges":Ljava/util/List;, "Ljava/util/List<[I>;"
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 146
    new-array v4, v9, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Searching for closest fps range from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 147
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1

    .line 148
    :cond_0
    const/4 v4, 0x2

    new-array v0, v4, [I

    fill-array-data v0, :array_0

    .line 164
    :goto_0
    return-object v0

    .line 152
    :cond_1
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 153
    .local v0, "closestRange":[I
    aget v4, v0, v8

    sub-int/2addr v4, p0

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    aget v5, v0, v9

    sub-int/2addr v5, p0

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    add-int v3, v4, v5

    .line 154
    .local v3, "measure":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    .line 155
    .local v2, "curRange":[I
    aget v5, v2, v8

    if-gt v5, p0, :cond_2

    aget v5, v2, v9

    if-lt v5, p0, :cond_2

    .line 156
    aget v5, v2, v8

    sub-int/2addr v5, p0

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    aget v6, v2, v9

    sub-int/2addr v6, p0

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    add-int v1, v5, v6

    .line 157
    .local v1, "curMeasure":I
    if-ge v1, v3, :cond_2

    aget v5, v2, v8

    aget v6, v2, v9

    if-eq v5, v6, :cond_2

    .line 158
    move-object v0, v2

    .line 159
    move v3, v1

    .line 160
    new-array v5, v9, [Ljava/lang/Object;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "A better range has been found: w="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget v7, v0, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ",h="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget v7, v0, v9

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v5}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    goto :goto_1

    .line 163
    .end local v1    # "curMeasure":I
    .end local v2    # "curRange":[I
    :cond_3
    new-array v4, v9, [Ljava/lang/Object;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "The closest fps range is w="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v6, v0, v8

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ",h="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v6, v0, v9

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 148
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public static selectNearestResolutionAvailable(III)[I
    .locals 4
    .param p0, "cameraId"    # I
    .param p1, "requestedW"    # I
    .param p2, "requestedH"    # I

    .prologue
    .line 51
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "selectNearestResolutionAvailable: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 52
    invoke-static {p0, p1, p2}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->selectNearestResolutionAvailableForCamera(III)[I

    move-result-object v0

    return-object v0
.end method

.method private static setCameraDisplayOrientation(IILandroid/hardware/Camera;)V
    .locals 8
    .param p0, "rotationDegrees"    # I
    .param p1, "cameraId"    # I
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 125
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 126
    .local v1, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-static {p1, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 129
    iget v3, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v3, v6, :cond_0

    .line 130
    iget v3, v1, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v3, p0

    rem-int/lit16 v2, v3, 0x168

    .line 131
    .local v2, "result":I
    rsub-int v3, v2, 0x168

    rem-int/lit16 v2, v3, 0x168

    .line 136
    :goto_0
    new-array v3, v6, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Camera preview orientation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v3}, Lorg/linphone/mediastream/Log;->w([Ljava/lang/Object;)V

    .line 138
    :try_start_0
    invoke-virtual {p2, v2}, Landroid/hardware/Camera;->setDisplayOrientation(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    :goto_1
    return-void

    .line 133
    .end local v2    # "result":I
    :cond_0
    iget v3, v1, Landroid/hardware/Camera$CameraInfo;->orientation:I

    sub-int/2addr v3, p0

    add-int/lit16 v3, v3, 0x168

    rem-int/lit16 v2, v3, 0x168

    .restart local v2    # "result":I
    goto :goto_0

    .line 139
    :catch_0
    move-exception v0

    .line 140
    .local v0, "exc":Ljava/lang/Exception;
    new-array v3, v6, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Failed to execute: camera["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "].setDisplayOrientation("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v3}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 141
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static setPreviewDisplaySurface(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p0, "cam"    # Ljava/lang/Object;
    .param p1, "surf"    # Ljava/lang/Object;

    .prologue
    .line 121
    invoke-static {p0, p1}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->setPreviewDisplaySurface(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 122
    return-void
.end method

.method public static startRecording(IIIIIJ)Ljava/lang/Object;
    .locals 13
    .param p0, "cameraId"    # I
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "fps"    # I
    .param p4, "rotation"    # I
    .param p5, "nativePtr"    # J

    .prologue
    .line 56
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "startRecording("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move/from16 v0, p4

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ", "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-wide/from16 v0, p5

    invoke-virtual {v10, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v8}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 58
    :try_start_0
    invoke-static {p0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v3

    .line 59
    .local v3, "camera":Landroid/hardware/Camera;
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v7

    .line 62
    .local v7, "params":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 63
    .local v6, "focusMode":Ljava/lang/String;
    const-string/jumbo v9, "continuous-video"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 64
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string/jumbo v10, "FOCUS_MODE_CONTINUOUS_VIDEO is supported, let\'s use it"

    aput-object v10, v8, v9

    invoke-static {v8}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 65
    const-string/jumbo v8, "continuous-video"

    invoke-virtual {v7, v8}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 70
    .end local v6    # "focusMode":Ljava/lang/String;
    :cond_1
    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->isVideoStabilizationSupported()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 71
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string/jumbo v10, "Video stabilization is supported, let\'s use it"

    aput-object v10, v8, v9

    invoke-static {v8}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 72
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/hardware/Camera$Parameters;->setVideoStabilization(Z)V

    .line 75
    :cond_2
    invoke-virtual {v7, p1, p2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 76
    move/from16 v0, p3

    mul-int/lit16 v8, v0, 0x3e8

    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFpsRange()Ljava/util/List;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper;->findClosestEnclosingFpsRange(ILjava/util/List;)[I

    move-result-object v4

    .line 77
    .local v4, "chosenFps":[I
    const/4 v8, 0x0

    aget v8, v4, v8

    const/4 v9, 0x1

    aget v9, v4, v9

    if-eq v8, v9, :cond_3

    .line 79
    const/4 v8, 0x0

    aget v8, v4, v8

    const/4 v9, 0x1

    aget v9, v4, v9

    invoke-virtual {v7, v8, v9}, Landroid/hardware/Camera$Parameters;->setPreviewFpsRange(II)V

    .line 81
    :cond_3
    invoke-virtual {v3, v7}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 83
    mul-int v8, p1, p2

    invoke-virtual {v7}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v9

    invoke-static {v9}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    move-result v9

    mul-int/2addr v8, v9

    div-int/lit8 v2, v8, 0x8

    .line 84
    .local v2, "bufferSize":I
    new-array v8, v2, [B

    invoke-virtual {v3, v8}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 85
    new-array v8, v2, [B

    invoke-virtual {v3, v8}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 87
    new-instance v8, Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper$1;

    move-wide/from16 v0, p5

    invoke-direct {v8, v0, v1}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper$1;-><init>(J)V

    invoke-virtual {v3, v8}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 104
    move/from16 v0, p4

    invoke-static {v0, p0, v3}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper;->setCameraDisplayOrientation(IILandroid/hardware/Camera;)V

    .line 105
    invoke-virtual {v3}, Landroid/hardware/Camera;->startPreview()V

    .line 106
    const/4 v8, 0x1

    sput-boolean v8, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->isRecording:Z

    .line 107
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Returning camera object: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v8}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .end local v2    # "bufferSize":I
    .end local v3    # "camera":Landroid/hardware/Camera;
    .end local v4    # "chosenFps":[I
    .end local v7    # "params":Landroid/hardware/Camera$Parameters;
    :goto_0
    return-object v3

    .line 109
    :catch_0
    move-exception v5

    .line 110
    .local v5, "exc":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    .line 111
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static stopRecording(Ljava/lang/Object;)V
    .locals 1
    .param p0, "cam"    # Ljava/lang/Object;

    .prologue
    .line 116
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->isRecording:Z

    .line 117
    invoke-static {p0}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi8JniWrapper;->stopRecording(Ljava/lang/Object;)V

    .line 118
    return-void
.end method
