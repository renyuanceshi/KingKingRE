.class public Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfigurationReader21;
.super Ljava/lang/Object;
.source "AndroidCameraConfigurationReader21.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static probeCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    .locals 23
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 26
    invoke-static {}, Lorg/linphone/mediastream/MediastreamerAndroidContext;->getContext()Landroid/content/Context;

    move-result-object v9

    .line 27
    .local v9, "context":Landroid/content/Context;
    if-eqz v9, :cond_3

    .line 28
    const-string/jumbo v20, "camera"

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/hardware/camera2/CameraManager;

    .line 29
    .local v14, "manager":Landroid/hardware/camera2/CameraManager;
    const/4 v15, 0x0

    .line 33
    .local v15, "numOfAvailableCameras":I
    :try_start_0
    invoke-virtual {v14}, Landroid/hardware/camera2/CameraManager;->getCameraIdList()[Ljava/lang/String;

    move-result-object v6

    .line 34
    .local v6, "cameraList":[Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    array-length v0, v6

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 35
    .local v2, "cam":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;>;"
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    array-length v0, v6

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v12, v0, :cond_2

    .line 36
    aget-object v5, v6, v12

    .line 37
    .local v5, "cameraId":Ljava/lang/String;
    invoke-virtual {v14, v5}, Landroid/hardware/camera2/CameraManager;->getCameraCharacteristics(Ljava/lang/String;)Landroid/hardware/camera2/CameraCharacteristics;

    move-result-object v7

    .line 38
    .local v7, "characteristics":Landroid/hardware/camera2/CameraCharacteristics;
    sget-object v20, Landroid/hardware/camera2/CameraCharacteristics;->LENS_FACING:Landroid/hardware/camera2/CameraCharacteristics$Key;

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Integer;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 39
    .local v3, "camFacing":I
    const/4 v11, 0x0

    .line 40
    .local v11, "frontFacing":Z
    if-nez v3, :cond_0

    .line 41
    const/4 v11, 0x1

    .line 43
    :cond_0
    sget-object v20, Landroid/hardware/camera2/CameraCharacteristics;->SENSOR_ORIENTATION:Landroid/hardware/camera2/CameraCharacteristics$Key;

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/Integer;

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 44
    .local v4, "camOrientation":I
    sget-object v20, Landroid/hardware/camera2/CameraCharacteristics;->SCALER_STREAM_CONFIGURATION_MAP:Landroid/hardware/camera2/CameraCharacteristics$Key;

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/hardware/camera2/params/StreamConfigurationMap;

    .line 45
    .local v8, "configs":Landroid/hardware/camera2/params/StreamConfigurationMap;
    const/16 v20, 0x100

    move/from16 v0, v20

    invoke-virtual {v8, v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    move-result-object v19

    .line 46
    .local v19, "supportedSizes":[Landroid/util/Size;
    new-instance v18, Ljava/util/ArrayList;

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v20, v0

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 47
    .local v18, "supportedPreviewSizes":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;>;"
    const/4 v13, 0x0

    .local v13, "j":I
    :goto_1
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v13, v0, :cond_1

    .line 48
    aget-object v17, v19, v13

    .line 49
    .local v17, "size":Landroid/util/Size;
    new-instance v20, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;

    invoke-virtual/range {v17 .. v17}, Landroid/util/Size;->getWidth()I

    move-result v21

    invoke-virtual/range {v17 .. v17}, Landroid/util/Size;->getHeight()I

    move-result v22

    invoke-direct/range {v20 .. v22}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;-><init>(II)V

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 52
    .end local v17    # "size":Landroid/util/Size;
    :cond_1
    new-instance v20, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-direct {v0, v12, v11, v1, v4}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;-><init>(IZLjava/util/List;I)V

    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    add-int/lit8 v15, v15, 0x1

    .line 35
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_0

    .line 56
    .end local v3    # "camFacing":I
    .end local v4    # "camOrientation":I
    .end local v5    # "cameraId":Ljava/lang/String;
    .end local v7    # "characteristics":Landroid/hardware/camera2/CameraCharacteristics;
    .end local v8    # "configs":Landroid/hardware/camera2/params/StreamConfigurationMap;
    .end local v11    # "frontFacing":Z
    .end local v13    # "j":I
    .end local v18    # "supportedPreviewSizes":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;>;"
    .end local v19    # "supportedSizes":[Landroid/util/Size;
    :cond_2
    new-array v0, v15, [Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-object/from16 v16, v0

    .line 57
    .local v16, "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    move-object/from16 v0, v16

    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v16

    .end local v16    # "result":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    check-cast v16, [Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .end local v2    # "cam":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;>;"
    .end local v6    # "cameraList":[Ljava/lang/String;
    .end local v12    # "i":I
    .end local v14    # "manager":Landroid/hardware/camera2/CameraManager;
    .end local v15    # "numOfAvailableCameras":I
    :goto_2
    return-object v16

    .line 61
    .restart local v14    # "manager":Landroid/hardware/camera2/CameraManager;
    .restart local v15    # "numOfAvailableCameras":I
    :catch_0
    move-exception v10

    .line 62
    .local v10, "exp":Landroid/hardware/camera2/CameraAccessException;
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v10, v20, v21

    invoke-static/range {v20 .. v20}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 65
    .end local v10    # "exp":Landroid/hardware/camera2/CameraAccessException;
    .end local v14    # "manager":Landroid/hardware/camera2/CameraManager;
    .end local v15    # "numOfAvailableCameras":I
    :cond_3
    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-object/from16 v16, v0

    goto :goto_2
.end method
