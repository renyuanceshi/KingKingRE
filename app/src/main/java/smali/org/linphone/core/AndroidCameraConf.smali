.class public Lorg/linphone/core/AndroidCameraConf;
.super Ljava/lang/Object;
.source "AndroidCameraConf.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public findFrontAndRearCameraIds([I[I[I)V
    .locals 4
    .param p1, "frontCameraId"    # [I
    .param p2, "rearCameraId"    # [I
    .param p3, "cameraId"    # [I

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 25
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Detecting cameras"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/core/Log;->i([Ljava/lang/Object;)V

    .line 26
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxyS()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 27
    new-array v0, v3, [Ljava/lang/Object;

    const-string/jumbo v1, "Hack Galaxy S : has 2 cameras front=2; rear=1"

    aput-object v1, v0, v2

    invoke-static {v0}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 28
    const/4 v0, 0x2

    aput v0, p1, v2

    .line 29
    aput v3, p2, v2

    .line 30
    aget v0, p2, v2

    aput v0, p3, v2

    .line 35
    :cond_0
    return-void
.end method

.method public getCameraOrientation(I)I
    .locals 3
    .param p1, "cameraId"    # I

    .prologue
    const/4 v0, 0x0

    .line 48
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxyS()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "Hack Galaxy S : rear camera id=2 ; mounted landscape"

    aput-object v2, v1, v0

    invoke-static {v1}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 51
    const/16 v0, 0x5a

    .line 53
    :cond_0
    return v0
.end method

.method public getNumberOfCameras()I
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 39
    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxyS()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 40
    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Hack Galaxy S : has 2 cameras"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 41
    const/4 v0, 0x2

    .line 43
    :cond_0
    return v0
.end method

.method public isFrontCamera(I)Z
    .locals 4
    .param p1, "cameraId"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 58
    const/4 v2, 0x2

    if-ne p1, v2, :cond_0

    invoke-static {}, Lorg/linphone/core/Hacks;->isGalaxyS()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 59
    new-array v2, v0, [Ljava/lang/Object;

    const-string/jumbo v3, "Hack Galaxy S : front camera has id=2"

    aput-object v3, v2, v1

    invoke-static {v2}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 63
    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method
