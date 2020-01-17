.class Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfigurationReader9;
.super Ljava/lang/Object;
.source "AndroidCameraConfigurationReader9.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static probeCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    .locals 10

    .prologue
    const/4 v6, 0x1

    .line 35
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v5

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 37
    .local v1, "cam":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v5

    if-ge v2, v5, :cond_1

    .line 38
    new-instance v3, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v3}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 39
    .local v3, "info":Landroid/hardware/Camera$CameraInfo;
    invoke-static {v2, v3}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 40
    invoke-static {v2}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    .line 41
    .local v0, "c":Landroid/hardware/Camera;
    new-instance v7, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    iget v5, v3, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-ne v5, v6, :cond_0

    move v5, v6

    :goto_1
    iget v8, v3, Landroid/hardware/Camera$CameraInfo;->orientation:I

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v9

    invoke-virtual {v9}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v9

    invoke-direct {v7, v2, v5, v8, v9}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;-><init>(IZILjava/util/List;)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 37
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 41
    :cond_0
    const/4 v5, 0x0

    goto :goto_1

    .line 45
    .end local v0    # "c":Landroid/hardware/Camera;
    .end local v3    # "info":Landroid/hardware/Camera$CameraInfo;
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    new-array v4, v5, [Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    .line 46
    .local v4, "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    invoke-interface {v1, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    check-cast v4, [Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    .line 47
    .restart local v4    # "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    return-object v4
.end method
