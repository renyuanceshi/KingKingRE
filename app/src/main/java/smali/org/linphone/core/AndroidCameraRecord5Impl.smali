.class public Lorg/linphone/core/AndroidCameraRecord5Impl;
.super Lorg/linphone/core/AndroidCameraRecordImpl;
.source "AndroidCameraRecord5Impl.java"


# direct methods
.method public constructor <init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V
    .locals 0
    .param p1, "parameters"    # Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lorg/linphone/core/AndroidCameraRecordImpl;-><init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V

    .line 32
    return-void
.end method

.method public static oneShotSupportedVideoSizes()Ljava/util/List;
    .locals 3
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
    .line 53
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v0

    .line 54
    .local v0, "camera":Landroid/hardware/Camera;
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v1

    .line 55
    .local v1, "supportedVideoSizes":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 56
    return-object v1
.end method


# virtual methods
.method protected getSupportedPreviewSizes(Landroid/hardware/Camera$Parameters;)Ljava/util/List;
    .locals 1
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/Camera$Parameters;",
            ")",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Size;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected onSettingCameraParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 4
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 36
    invoke-super {p0, p1}, Lorg/linphone/core/AndroidCameraRecordImpl;->onSettingCameraParameters(Landroid/hardware/Camera$Parameters;)V

    .line 38
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v0

    const-string/jumbo v1, "auto"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Auto Focus supported by camera device"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/core/Log;->w([Ljava/lang/Object;)V

    .line 40
    const-string/jumbo v0, "auto"

    invoke-virtual {p1, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 50
    :goto_0
    return-void

    .line 42
    :cond_0
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Auto Focus not supported by camera device"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/core/Log;->w([Ljava/lang/Object;)V

    .line 43
    invoke-virtual {p1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v0

    const-string/jumbo v1, "infinity"

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 44
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Infinity Focus supported by camera device"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/core/Log;->w([Ljava/lang/Object;)V

    .line 45
    const-string/jumbo v0, "infinity"

    invoke-virtual {p1, v0}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    goto :goto_0

    .line 47
    :cond_1
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Infinity Focus not supported by camera device"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/core/Log;->w([Ljava/lang/Object;)V

    goto :goto_0
.end method
