.class public Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;
.super Ljava/lang/Object;
.source "AndroidVideoApi5JniWrapper.java"


# static fields
.field public static isRecording:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->isRecording:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activateAutoFocus(Ljava/lang/Object;)V
    .locals 5
    .param p0, "cam"    # Ljava/lang/Object;

    .prologue
    .line 81
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string/jumbo v3, "mediastreamer"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Turning on autofocus on camera "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    move-object v0, p0

    .line 82
    check-cast v0, Landroid/hardware/Camera;

    .line 83
    .local v0, "camera":Landroid/hardware/Camera;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "auto"

    if-eq v1, v2, :cond_0

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "macro"

    if-ne v1, v2, :cond_1

    .line 84
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 85
    :cond_1
    return-void
.end method

.method protected static applyCameraParameters(Landroid/hardware/Camera;III)V
    .locals 9
    .param p0, "camera"    # Landroid/hardware/Camera;
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "requestedFps"    # I

    .prologue
    .line 208
    invoke-virtual {p0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v3

    .line 210
    .local v3, "params":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v3, p1, p2}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 212
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFrameRates()Ljava/util/List;

    move-result-object v4

    .line 213
    .local v4, "supported":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-eqz v4, :cond_2

    .line 214
    const v2, 0x7fffffff

    .line 215
    .local v2, "nearest":I
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 216
    .local v1, "fr":Ljava/lang/Integer;
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    sub-int/2addr v6, p3

    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 217
    .local v0, "diff":I
    if-ge v0, v2, :cond_0

    .line 218
    move v2, v0

    .line 219
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    goto :goto_0

    .line 222
    .end local v0    # "diff":I
    .end local v1    # "fr":Ljava/lang/Integer;
    :cond_1
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "mediastreamer"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Preview framerate set:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getPreviewFrameRate()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v5}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 225
    .end local v2    # "nearest":I
    :cond_2
    invoke-virtual {p0, v3}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 226
    return-void
.end method

.method public static detectCameras([I[I[I)I
    .locals 8
    .param p0, "indexes"    # [I
    .param p1, "frontFacing"    # [I
    .param p2, "orientation"    # [I

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 44
    new-array v3, v4, [Ljava/lang/Object;

    const-string/jumbo v6, "detectCameras\n"

    aput-object v6, v3, v5

    invoke-static {v3}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 45
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;->retrieveCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-result-object v1

    .line 47
    .local v1, "cameras":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    const/4 v2, 0x0

    .line 48
    .local v2, "nextIndex":I
    array-length v7, v1

    move v6, v5

    :goto_0
    if-ge v6, v7, :cond_0

    aget-object v0, v1, v6

    .line 49
    .local v0, "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 50
    new-array v3, v4, [Ljava/lang/Object;

    const-string/jumbo v4, "Returning only the 2 first cameras (increase buffer size to retrieve all)"

    aput-object v4, v3, v5

    invoke-static {v3}, Lorg/linphone/mediastream/Log;->w([Ljava/lang/Object;)V

    .line 59
    .end local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_0
    return v2

    .line 54
    .restart local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_1
    iget v3, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->id:I

    aput v3, p0, v2

    .line 55
    iget-boolean v3, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    if-eqz v3, :cond_2

    move v3, v4

    :goto_1
    aput v3, p1, v2

    .line 56
    iget v3, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->orientation:I

    aput v3, p2, v2

    .line 57
    add-int/lit8 v2, v2, 0x1

    .line 48
    add-int/lit8 v3, v6, 0x1

    move v6, v3

    goto :goto_0

    :cond_2
    move v3, v5

    .line 55
    goto :goto_1
.end method

.method public static native putImage(J[B)V
.end method

.method public static selectNearestResolutionAvailable(III)[I
    .locals 4
    .param p0, "cameraId"    # I
    .param p1, "requestedW"    # I
    .param p2, "requestedH"    # I

    .prologue
    .line 75
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "mediastreamer"

    aput-object v2, v0, v1

    const/4 v1, 0x1

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

    .line 77
    invoke-static {p0, p1, p2}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->selectNearestResolutionAvailableForCamera(III)[I

    move-result-object v0

    return-object v0
.end method

.method protected static selectNearestResolutionAvailableForCamera(III)[I
    .locals 23
    .param p0, "id"    # I
    .param p1, "requestedW"    # I
    .param p2, "requestedH"    # I

    .prologue
    .line 141
    move/from16 v0, p2

    move/from16 v1, p1

    if-le v0, v1, :cond_0

    .line 142
    move/from16 v16, p2

    .line 143
    .local v16, "t":I
    move/from16 p2, p1

    .line 144
    move/from16 p1, v16

    .line 147
    .end local v16    # "t":I
    :cond_0
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;->retrieveCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-result-object v3

    .line 148
    .local v3, "cameras":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    const/4 v15, 0x0

    .line 149
    .local v15, "supportedSizes":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;>;"
    array-length v0, v3

    move/from16 v19, v0

    const/16 v18, 0x0

    :goto_0
    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_2

    aget-object v2, v3, v18

    .line 150
    .local v2, "c":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    iget v0, v2, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->id:I

    move/from16 v20, v0

    move/from16 v0, v20

    move/from16 v1, p0

    if-ne v0, v1, :cond_1

    .line 151
    iget-object v15, v2, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->resolutions:Ljava/util/List;

    .line 149
    :cond_1
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 153
    .end local v2    # "c":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_2
    if-nez v15, :cond_3

    .line 154
    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string/jumbo v20, "mediastreamer"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    const-string/jumbo v20, "Failed to retrieve supported resolutions."

    aput-object v20, v18, v19

    invoke-static/range {v18 .. v18}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 155
    const/4 v9, 0x0

    .line 203
    :goto_1
    return-object v9

    .line 157
    :cond_3
    const/16 v18, 0x2

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string/jumbo v20, "mediastreamer"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, " supported resolutions :"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v18 .. v18}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 158
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_2
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_4

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;

    .line 159
    .local v14, "s":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string/jumbo v21, "mediastreamer"

    aput-object v21, v19, v20

    const/16 v20, 0x1

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v22, "\t"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, "x"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    invoke-static/range {v19 .. v19}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    goto :goto_2

    .line 161
    .end local v14    # "s":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    :cond_4
    const/4 v8, 0x0

    .line 163
    .local v8, "r":[I
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 164
    .local v11, "rW":I
    invoke-static/range {p1 .. p2}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 168
    .local v10, "rH":I
    const/16 v18, 0x0

    :try_start_0
    move/from16 v0, v18

    invoke-interface {v15, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;

    .line 169
    .local v13, "result":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    mul-int v12, v11, v10

    .line 170
    .local v12, "req":I
    const v7, 0x7fffffff

    .line 171
    .local v7, "minDist":I
    const/16 v17, 0x0

    .line 172
    .local v17, "useDownscale":I
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_5
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_c

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;

    .line 173
    .restart local v14    # "s":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v19, v0

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    sub-int v19, v12, v19

    mul-int/lit8 v4, v19, -0x1

    .line 174
    .local v4, "dist":I
    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-lt v0, v11, :cond_6

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v0, v10, :cond_7

    :cond_6
    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-lt v0, v10, :cond_8

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-lt v0, v11, :cond_8

    :cond_7
    if-ge v4, v7, :cond_8

    .line 175
    move v7, v4

    .line 176
    move-object v13, v14

    .line 177
    const/16 v17, 0x0

    .line 181
    :cond_8
    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v19, v0

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    div-int/lit8 v19, v19, 0x4

    sub-int v19, v12, v19

    mul-int/lit8 v5, v19, -0x1

    .line 182
    .local v5, "downScaleDist":I
    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v19, v0

    div-int/lit8 v19, v19, 0x2

    move/from16 v0, v19

    if-lt v0, v11, :cond_9

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v19, v0

    div-int/lit8 v19, v19, 0x2

    move/from16 v0, v19

    if-ge v0, v10, :cond_a

    :cond_9
    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v19, v0

    div-int/lit8 v19, v19, 0x2

    move/from16 v0, v19

    if-lt v0, v10, :cond_b

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v19, v0

    div-int/lit8 v19, v19, 0x2

    move/from16 v0, v19

    if-lt v0, v11, :cond_b

    :cond_a
    if-ge v5, v7, :cond_b

    .line 183
    invoke-static {}, Lorg/linphone/mediastream/Version;->hasFastCpuWithAsmOptim()Z

    move-result v19

    if-eqz v19, :cond_d

    .line 184
    move v7, v5

    .line 185
    move-object v13, v14

    .line 186
    const/16 v17, 0x1

    .line 192
    :cond_b
    :goto_3
    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v11, :cond_5

    iget v0, v14, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v10, :cond_5

    .line 193
    move-object v13, v14

    .line 194
    const/16 v17, 0x0

    .line 198
    .end local v4    # "dist":I
    .end local v5    # "downScaleDist":I
    .end local v14    # "s":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    :cond_c
    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v9, v0, [I

    const/16 v18, 0x0

    iget v0, v13, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    move/from16 v19, v0

    aput v19, v9, v18

    const/16 v18, 0x1

    iget v0, v13, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    move/from16 v19, v0

    aput v19, v9, v18

    const/16 v18, 0x2

    aput v17, v9, v18
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 199
    .end local v8    # "r":[I
    .local v9, "r":[I
    const/16 v18, 0x2

    :try_start_1
    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const-string/jumbo v20, "mediastreamer"

    aput-object v20, v18, v19

    const/16 v19, 0x1

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "resolution selection done ("

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const/16 v21, 0x0

    aget v21, v9, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const/16 v21, 0x1

    aget v21, v9, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const/16 v21, 0x2

    aget v21, v9, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ")"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v18 .. v18}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1

    .line 201
    :catch_0
    move-exception v6

    move-object v8, v9

    .line 202
    .end local v7    # "minDist":I
    .end local v9    # "r":[I
    .end local v12    # "req":I
    .end local v13    # "result":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    .end local v17    # "useDownscale":I
    .local v6, "exc":Ljava/lang/Exception;
    .restart local v8    # "r":[I
    :goto_4
    const/16 v18, 0x3

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    aput-object v6, v18, v19

    const/16 v19, 0x1

    const-string/jumbo v20, "mediastreamer"

    aput-object v20, v18, v19

    const/16 v19, 0x2

    const-string/jumbo v20, " resolution selection failed"

    aput-object v20, v18, v19

    invoke-static/range {v18 .. v18}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 203
    const/4 v9, 0x0

    goto/16 :goto_1

    .line 188
    .end local v6    # "exc":Ljava/lang/Exception;
    .restart local v4    # "dist":I
    .restart local v5    # "downScaleDist":I
    .restart local v7    # "minDist":I
    .restart local v12    # "req":I
    .restart local v13    # "result":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    .restart local v14    # "s":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    .restart local v17    # "useDownscale":I
    :cond_d
    move-object v13, v14

    .line 189
    const/16 v17, 0x0

    goto/16 :goto_3

    .line 201
    .end local v4    # "dist":I
    .end local v5    # "downScaleDist":I
    .end local v7    # "minDist":I
    .end local v12    # "req":I
    .end local v13    # "result":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    .end local v14    # "s":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    .end local v17    # "useDownscale":I
    :catch_1
    move-exception v6

    goto :goto_4
.end method

.method public static setPreviewDisplaySurface(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 10
    .param p0, "cam"    # Ljava/lang/Object;
    .param p1, "surf"    # Ljava/lang/Object;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 123
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const-string/jumbo v6, "mediastreamer"

    aput-object v6, v5, v8

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "setPreviewDisplaySurface("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    invoke-static {v5}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    move-object v2, p0

    .line 124
    check-cast v2, Landroid/hardware/Camera;

    .line 126
    .local v2, "camera":Landroid/hardware/Camera;
    :try_start_0
    instance-of v5, p1, Landroid/view/SurfaceView;

    if-eqz v5, :cond_0

    .line 127
    move-object v0, p1

    check-cast v0, Landroid/view/SurfaceView;

    move-object v4, v0

    .line 128
    .local v4, "surface":Landroid/view/SurfaceView;
    invoke-virtual {v4}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 137
    .end local v4    # "surface":Landroid/view/SurfaceView;
    :goto_0
    return-void

    .line 130
    :cond_0
    move-object v0, p1

    check-cast v0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    move-object v1, v0

    .line 131
    .local v1, "avw":Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;
    invoke-virtual {v1}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->getPreviewSurfaceView()Landroid/view/SurfaceView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 133
    .end local v1    # "avw":Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;
    :catch_0
    move-exception v3

    .line 134
    .local v3, "exc":Ljava/lang/Exception;
    new-array v5, v9, [Ljava/lang/Object;

    aput-object v3, v5, v8

    invoke-static {v5}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 135
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
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
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 88
    new-array v1, v6, [Ljava/lang/Object;

    const-string/jumbo v2, "mediastreamer"

    aput-object v2, v1, v5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "startRecording("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 89
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v0

    .line 91
    .local v0, "camera":Landroid/hardware/Camera;
    invoke-static {v0, p1, p2, p3}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->applyCameraParameters(Landroid/hardware/Camera;III)V

    .line 93
    new-instance v1, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper$1;

    invoke-direct {v1, p5, p6}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper$1;-><init>(J)V

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 102
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 103
    sput-boolean v4, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->isRecording:Z

    .line 104
    new-array v1, v6, [Ljava/lang/Object;

    const-string/jumbo v2, "mediastreamer"

    aput-object v2, v1, v5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Returning camera object: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 105
    return-object v0
.end method

.method public static stopRecording(Ljava/lang/Object;)V
    .locals 7
    .param p0, "cam"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 109
    sput-boolean v4, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->isRecording:Z

    .line 110
    new-array v1, v6, [Ljava/lang/Object;

    const-string/jumbo v2, "mediastreamer"

    aput-object v2, v1, v4

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

    aput-object v2, v1, v5

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    move-object v0, p0

    .line 111
    check-cast v0, Landroid/hardware/Camera;

    .line 113
    .local v0, "camera":Landroid/hardware/Camera;
    if-eqz v0, :cond_0

    .line 114
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 115
    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 116
    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 120
    :goto_0
    return-void

    .line 118
    :cond_0
    new-array v1, v6, [Ljava/lang/Object;

    const-string/jumbo v2, "mediastreamer"

    aput-object v2, v1, v4

    const-string/jumbo v2, "Cannot stop recording (\'camera\' is null)"

    aput-object v2, v1, v5

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    goto :goto_0
.end method
