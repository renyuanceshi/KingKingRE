.class public Lorg/linphone/mediastream/video/capture/AndroidVideoApi8JniWrapper;
.super Ljava/lang/Object;
.source "AndroidVideoApi8JniWrapper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static detectCameras([I[I[I)I
    .locals 1
    .param p0, "indexes"    # [I
    .param p1, "frontFacing"    # [I
    .param p2, "orientation"    # [I

    .prologue
    .line 28
    invoke-static {p0, p1, p2}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->detectCameras([I[I[I)I

    move-result v0

    return v0
.end method

.method public static selectNearestResolutionAvailable(III)[I
    .locals 1
    .param p0, "cameraId"    # I
    .param p1, "requestedW"    # I
    .param p2, "requestedH"    # I

    .prologue
    .line 32
    invoke-static {p0, p1, p2}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->selectNearestResolutionAvailable(III)[I

    move-result-object v0

    return-object v0
.end method

.method public static setPreviewDisplaySurface(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .param p0, "cam"    # Ljava/lang/Object;
    .param p1, "surf"    # Ljava/lang/Object;

    .prologue
    .line 76
    invoke-static {p0, p1}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->setPreviewDisplaySurface(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 77
    return-void
.end method

.method public static startRecording(IIIIIJ)Ljava/lang/Object;
    .locals 7
    .param p0, "cameraId"    # I
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "fps"    # I
    .param p4, "rotation"    # I
    .param p5, "nativePtr"    # J

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 36
    new-array v2, v5, [Ljava/lang/Object;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "startRecording("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 37
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v1

    .line 39
    .local v1, "camera":Landroid/hardware/Camera;
    invoke-static {v1, p1, p2, p3}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->applyCameraParameters(Landroid/hardware/Camera;III)V

    .line 41
    mul-int v2, p1, p2

    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v3

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v3

    invoke-static {v3}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    move-result v3

    mul-int/2addr v2, v3

    div-int/lit8 v0, v2, 0x8

    .line 42
    .local v0, "bufferSize":I
    new-array v2, v0, [B

    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 43
    new-array v2, v0, [B

    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 45
    new-instance v2, Lorg/linphone/mediastream/video/capture/AndroidVideoApi8JniWrapper$1;

    invoke-direct {v2, p5, p6}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi8JniWrapper$1;-><init>(J)V

    invoke-virtual {v1, v2}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 55
    invoke-virtual {v1}, Landroid/hardware/Camera;->startPreview()V

    .line 56
    sput-boolean v5, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->isRecording:Z

    .line 57
    new-array v2, v5, [Ljava/lang/Object;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Returning camera object: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v2}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 58
    return-object v1
.end method

.method public static stopRecording(Ljava/lang/Object;)V
    .locals 6
    .param p0, "cam"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 62
    sput-boolean v4, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->isRecording:Z

    .line 63
    new-array v1, v5, [Ljava/lang/Object;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "stopRecording("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    move-object v0, p0

    .line 64
    check-cast v0, Landroid/hardware/Camera;

    .line 66
    .local v0, "camera":Landroid/hardware/Camera;
    if-eqz v0, :cond_0

    .line 67
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 68
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 69
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 73
    :goto_0
    return-void

    .line 71
    :cond_0
    new-array v1, v5, [Ljava/lang/Object;

    const-string/jumbo v2, "Cannot stop recording (\'camera\' is null)"

    aput-object v2, v1, v4

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    goto :goto_0
.end method
