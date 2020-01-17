.class public Lorg/linphone/core/AndroidCameraRecord9Impl;
.super Lorg/linphone/core/AndroidCameraRecord8Impl;
.source "AndroidCameraRecord9Impl.java"


# direct methods
.method public constructor <init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V
    .locals 0
    .param p1, "parameters"    # Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lorg/linphone/core/AndroidCameraRecord8Impl;-><init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V

    .line 33
    return-void
.end method


# virtual methods
.method protected openCamera(I)Landroid/hardware/Camera;
    .locals 1
    .param p1, "cameraId"    # I

    .prologue
    .line 37
    invoke-static {p1}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    return-object v0
.end method
