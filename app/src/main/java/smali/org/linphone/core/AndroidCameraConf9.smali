.class public Lorg/linphone/core/AndroidCameraConf9;
.super Lorg/linphone/core/AndroidCameraConf;
.source "AndroidCameraConf9.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/linphone/core/AndroidCameraConf;-><init>()V

    return-void
.end method


# virtual methods
.method public findFrontAndRearCameraIds9(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 2
    .param p1, "frontCameraId"    # Ljava/lang/Integer;
    .param p2, "rearCameraId"    # Ljava/lang/Integer;
    .param p3, "cameraId"    # Ljava/lang/Integer;

    .prologue
    .line 28
    const/4 v0, 0x0

    .local v0, "id":I
    :goto_0
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraConf9;->getNumberOfCameras()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 29
    invoke-virtual {p0, v0}, Lorg/linphone/core/AndroidCameraConf9;->isFrontCamera(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 30
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 28
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    goto :goto_1

    .line 35
    :cond_1
    return-void
.end method

.method public getCameraOrientation(I)I
    .locals 2
    .param p1, "cameraId"    # I

    .prologue
    .line 42
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 44
    .local v0, "info":Landroid/hardware/Camera$CameraInfo;
    if-gez p1, :cond_0

    .line 45
    const/4 p1, 0x0

    .line 47
    :cond_0
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 48
    iget v1, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    return v1
.end method

.method public getNumberOfCameras()I
    .locals 1

    .prologue
    .line 38
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v0

    return v0
.end method

.method public isFrontCamera(I)Z
    .locals 3
    .param p1, "cameraId"    # I

    .prologue
    const/4 v1, 0x1

    .line 52
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 54
    .local v0, "info":Landroid/hardware/Camera$CameraInfo;
    if-gez p1, :cond_0

    .line 55
    const/4 p1, 0x0

    .line 57
    :cond_0
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 58
    iget v2, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v2, v1, :cond_1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
