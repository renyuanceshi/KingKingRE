.class public Lorg/linphone/core/AndroidCameraRecord8Impl;
.super Lorg/linphone/core/AndroidCameraRecord5Impl;
.source "AndroidCameraRecord8Impl.java"


# direct methods
.method public constructor <init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V
    .locals 0
    .param p1, "parameters"    # Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/linphone/core/AndroidCameraRecord5Impl;-><init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V

    .line 36
    return-void
.end method


# virtual methods
.method protected lowLevelSetPreviewCallback(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V
    .locals 3
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "cb"    # Landroid/hardware/Camera$PreviewCallback;

    .prologue
    .line 40
    if-eqz p2, :cond_0

    .line 41
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Setting optimized callback with buffer (Android >= 8). Remember to manage the pool of buffers!!!"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 43
    :cond_0
    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    .line 44
    return-void
.end method

.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 59
    invoke-super {p0, p1, p2}, Lorg/linphone/core/AndroidCameraRecord5Impl;->onPreviewFrame([BLandroid/hardware/Camera;)V

    .line 60
    invoke-virtual {p2, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 61
    return-void
.end method

.method public onPreviewStarted(Landroid/hardware/Camera;)V
    .locals 4
    .param p1, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 48
    invoke-super {p0, p1}, Lorg/linphone/core/AndroidCameraRecord5Impl;->onPreviewStarted(Landroid/hardware/Camera;)V

    .line 50
    invoke-virtual {p1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 51
    .local v0, "s":Landroid/hardware/Camera$Size;
    iget v2, v0, Landroid/hardware/Camera$Size;->height:I

    iget v3, v0, Landroid/hardware/Camera$Size;->width:I

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v1, v2, 0x2

    .line 53
    .local v1, "wishedBufferSize":I
    new-array v2, v1, [B

    invoke-virtual {p1, v2}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 54
    new-array v2, v1, [B

    invoke-virtual {p1, v2}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 55
    return-void
.end method

.method protected onSettingCameraParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 65
    invoke-super {p0, p1}, Lorg/linphone/core/AndroidCameraRecord5Impl;->onSettingCameraParameters(Landroid/hardware/Camera$Parameters;)V

    .line 67
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord8Impl;->camera:Landroid/hardware/Camera;

    iget v1, p0, Lorg/linphone/core/AndroidCameraRecord8Impl;->rotation:I

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 68
    return-void
.end method
