.class Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfigurationReader5;
.super Ljava/lang/Object;
.source "AndroidCameraConfigurationReader5.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static probeCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    .locals 9

    .prologue
    const/16 v8, 0x5a

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 38
    .local v0, "cam":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;>;"
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v1

    .line 39
    .local v1, "camera":Landroid/hardware/Camera;
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v4

    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    move-result-object v2

    .line 40
    .local v2, "r":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    invoke-virtual {v1}, Landroid/hardware/Camera;->release()V

    .line 43
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/Hacks;->isGalaxySOrTab()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 44
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "Hack Galaxy S : has one or more cameras"

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 45
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/Hacks;->isGalaxySOrTabWithFrontCamera()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 46
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "Hack Galaxy S : HAS a front camera with id=2"

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 47
    new-instance v4, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    const/4 v5, 0x2

    invoke-direct {v4, v5, v6, v8, v2}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;-><init>(IZILjava/util/List;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    :goto_0
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "Hack Galaxy S : HAS a rear camera with id=1"

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 52
    new-instance v4, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    invoke-direct {v4, v6, v7, v8, v2}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;-><init>(IZILjava/util/List;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    :cond_0
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    new-array v3, v4, [Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    .line 63
    .local v3, "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    check-cast v3, [Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    .line 64
    .restart local v3    # "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    return-object v3

    .line 49
    .end local v3    # "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_1
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "Hack Galaxy S : NO front camera"

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    goto :goto_0

    .line 54
    :cond_2
    new-instance v4, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    invoke-direct {v4, v7, v7, v8, v2}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;-><init>(IZILjava/util/List;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/Hacks;->hasTwoCamerasRear0Front1()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 57
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "Hack SPHD700 has 2 cameras a rear with id=0 and a front with id=1"

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 58
    new-instance v4, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    invoke-direct {v4, v6, v6, v8, v2}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;-><init>(IZILjava/util/List;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method
