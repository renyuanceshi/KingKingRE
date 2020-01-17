.class public abstract Lorg/linphone/core/AndroidCameraRecord;
.super Ljava/lang/Object;
.source "AndroidCameraRecord.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/core/AndroidCameraRecord$RecorderParams;
    }
.end annotation


# static fields
.field protected static final tag:Ljava/lang/String; = "Linphone"


# instance fields
.field protected camera:Landroid/hardware/Camera;

.field private currentPreviewSize:Landroid/hardware/Camera$Size;

.field private params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

.field private previewStarted:Z

.field private storedPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

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


# direct methods
.method public constructor <init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V
    .locals 0
    .param p1, "parameters"    # Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    .line 47
    return-void
.end method


# virtual methods
.method protected getExpectedBufferLength()I
    .locals 2

    .prologue
    .line 185
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->currentPreviewSize:Landroid/hardware/Camera$Size;

    if-nez v0, :cond_0

    .line 186
    const/4 v0, -0x1

    .line 188
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->currentPreviewSize:Landroid/hardware/Camera$Size;

    iget v0, v0, Landroid/hardware/Camera$Size;->width:I

    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecord;->currentPreviewSize:Landroid/hardware/Camera$Size;

    iget v1, v1, Landroid/hardware/Camera$Size;->height:I

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x2

    goto :goto_0
.end method

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
    .line 50
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedVideoSizes()Ljava/util/List;
    .locals 2
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
    .line 181
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecord;->supportedVideoSizes:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public isStarted()Z
    .locals 1

    .prologue
    .line 177
    iget-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecord;->previewStarted:Z

    return v0
.end method

.method protected abstract lowLevelSetPreviewCallback(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V
.end method

.method public onPreviewStarted(Landroid/hardware/Camera;)V
    .locals 0
    .param p1, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 129
    return-void
.end method

.method protected onSettingCameraParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 0
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 121
    return-void
.end method

.method protected openCamera(I)Landroid/hardware/Camera;
    .locals 1
    .param p1, "cameraId"    # I

    .prologue
    .line 117
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v0

    return-object v0
.end method

.method public startPreview()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 54
    iget-boolean v4, p0, Lorg/linphone/core/AndroidCameraRecord;->previewStarted:Z

    if-eqz v4, :cond_0

    .line 55
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "Already started"

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/core/Log;->w([Ljava/lang/Object;)V

    .line 56
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v5, "Video recorder already started"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 60
    :cond_0
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget-object v4, v4, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v4}, Landroid/view/SurfaceView;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_1

    .line 62
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "Illegal state: video capture surface view is not visible"

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    .line 114
    :goto_0
    return-void

    .line 66
    :cond_1
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v4, v4, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->cameraId:I

    invoke-virtual {p0, v4}, Lorg/linphone/core/AndroidCameraRecord;->openCamera(I)Landroid/hardware/Camera;

    move-result-object v4

    iput-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    .line 67
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    new-instance v5, Lorg/linphone/core/AndroidCameraRecord$1;

    invoke-direct {v5, p0}, Lorg/linphone/core/AndroidCameraRecord$1;-><init>(Lorg/linphone/core/AndroidCameraRecord;)V

    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V

    .line 73
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    .line 74
    .local v2, "parameters":Landroid/hardware/Camera$Parameters;
    const-string/jumbo v4, "camera-id"

    iget-object v5, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v5, v5, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->cameraId:I

    invoke-virtual {v2, v4, v5}, Landroid/hardware/Camera$Parameters;->set(Ljava/lang/String;I)V

    .line 75
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 76
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v2

    .line 77
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->supportedVideoSizes:Ljava/util/List;

    if-nez v4, :cond_2

    .line 78
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Lorg/linphone/core/AndroidCameraRecord;->getSupportedPreviewSizes(Landroid/hardware/Camera$Parameters;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->supportedVideoSizes:Ljava/util/List;

    .line 81
    :cond_2
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v4, v4, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->width:I

    iget-object v5, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v5, v5, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->height:I

    if-lt v4, v5, :cond_3

    .line 82
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v4, v4, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->width:I

    iget-object v5, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v5, v5, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->height:I

    invoke-virtual {v2, v4, v5}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 87
    :goto_1
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v4, v4, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->fps:F

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/hardware/Camera$Parameters;->setPreviewFrameRate(I)V

    .line 89
    invoke-virtual {p0, v2}, Lorg/linphone/core/AndroidCameraRecord;->onSettingCameraParameters(Landroid/hardware/Camera$Parameters;)V

    .line 90
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 92
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v4

    invoke-virtual {v4}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v4

    iput-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->currentPreviewSize:Landroid/hardware/Camera$Size;

    .line 94
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget-object v4, v4, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->surfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v4}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    .line 96
    .local v1, "holder":Landroid/view/SurfaceHolder;
    :try_start_0
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4, v1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    :goto_2
    :try_start_1
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4}, Landroid/hardware/Camera;->startPreview()V

    .line 103
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/linphone/core/AndroidCameraRecord;->previewStarted:Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 108
    :goto_3
    iput-boolean v6, p0, Lorg/linphone/core/AndroidCameraRecord;->previewStarted:Z

    .line 111
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    iget-object v5, p0, Lorg/linphone/core/AndroidCameraRecord;->storedPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

    invoke-virtual {p0, v4, v5}, Lorg/linphone/core/AndroidCameraRecord;->lowLevelSetPreviewCallback(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V

    .line 113
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {p0, v4}, Lorg/linphone/core/AndroidCameraRecord;->onPreviewStarted(Landroid/hardware/Camera;)V

    goto/16 :goto_0

    .line 85
    .end local v1    # "holder":Landroid/view/SurfaceHolder;
    :cond_3
    iget-object v4, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v4, v4, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->height:I

    iget-object v5, p0, Lorg/linphone/core/AndroidCameraRecord;->params:Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    iget v5, v5, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->width:I

    invoke-virtual {v2, v4, v5}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    goto :goto_1

    .line 97
    .restart local v1    # "holder":Landroid/view/SurfaceHolder;
    :catch_0
    move-exception v3

    .line 98
    .local v3, "t":Ljava/lang/Throwable;
    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const-string/jumbo v5, "Exception in Video capture setPreviewDisplay()"

    aput-object v5, v4, v7

    aput-object v3, v4, v6

    invoke-static {v4}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    goto :goto_2

    .line 104
    .end local v3    # "t":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Throwable;
    new-array v4, v6, [Ljava/lang/Object;

    const-string/jumbo v5, "Can\'t start camera preview"

    aput-object v5, v4, v7

    invoke-static {v4}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    goto :goto_3
.end method

.method public stopCaptureCallback()V
    .locals 2

    .prologue
    .line 154
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/AndroidCameraRecord;->lowLevelSetPreviewCallback(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V

    .line 157
    :cond_0
    return-void
.end method

.method public stopPreview()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 142
    iget-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecord;->previewStarted:Z

    if-nez v0, :cond_0

    .line 151
    :goto_0
    return-void

    .line 144
    :cond_0
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {p0, v0, v1}, Lorg/linphone/core/AndroidCameraRecord;->lowLevelSetPreviewCallback(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V

    .line 145
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 146
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 147
    iput-object v1, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    .line 148
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->currentPreviewSize:Landroid/hardware/Camera$Size;

    if-eqz v0, :cond_1

    .line 149
    iput-object v1, p0, Lorg/linphone/core/AndroidCameraRecord;->currentPreviewSize:Landroid/hardware/Camera$Size;

    .line 150
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/core/AndroidCameraRecord;->previewStarted:Z

    goto :goto_0
.end method

.method public storePreviewCallBack(Landroid/hardware/Camera$PreviewCallback;)V
    .locals 3
    .param p1, "cb"    # Landroid/hardware/Camera$PreviewCallback;

    .prologue
    .line 132
    iput-object p1, p0, Lorg/linphone/core/AndroidCameraRecord;->storedPreviewCallback:Landroid/hardware/Camera$PreviewCallback;

    .line 133
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    if-nez v0, :cond_0

    .line 134
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Capture camera not ready, storing callback"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->w([Ljava/lang/Object;)V

    .line 139
    :goto_0
    return-void

    .line 138
    :cond_0
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecord;->camera:Landroid/hardware/Camera;

    invoke-virtual {p0, v0, p1}, Lorg/linphone/core/AndroidCameraRecord;->lowLevelSetPreviewCallback(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V

    goto :goto_0
.end method
