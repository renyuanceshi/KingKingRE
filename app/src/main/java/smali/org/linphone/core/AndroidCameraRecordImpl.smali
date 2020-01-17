.class public Lorg/linphone/core/AndroidCameraRecordImpl;
.super Lorg/linphone/core/AndroidCameraRecord;
.source "AndroidCameraRecordImpl.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# instance fields
.field private final expectedTimeBetweenFrames:D

.field private filterCtxPtr:J

.field private lastFrameTime:J

.field protected final rotation:I

.field private timeElapsedBetweenFrames:D


# direct methods
.method public constructor <init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V
    .locals 4
    .param p1, "parameters"    # Lorg/linphone/core/AndroidCameraRecord$RecorderParams;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/linphone/core/AndroidCameraRecord;-><init>(Lorg/linphone/core/AndroidCameraRecord$RecorderParams;)V

    .line 33
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->timeElapsedBetweenFrames:D

    .line 34
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->lastFrameTime:J

    .line 40
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    iget v2, p1, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->fps:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-double v2, v2

    div-double/2addr v0, v2

    iput-wide v0, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->expectedTimeBetweenFrames:D

    .line 41
    iget-wide v0, p1, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->filterDataNativePtr:J

    iput-wide v0, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->filterCtxPtr:J

    .line 42
    iget v0, p1, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->rotation:I

    iput v0, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->rotation:I

    .line 44
    invoke-virtual {p0, p0}, Lorg/linphone/core/AndroidCameraRecordImpl;->storePreviewCallBack(Landroid/hardware/Camera$PreviewCallback;)V

    .line 45
    return-void
.end method

.method private native putImage(J[BI)V
.end method


# virtual methods
.method protected lowLevelSetPreviewCallback(Landroid/hardware/Camera;Landroid/hardware/Camera$PreviewCallback;)V
    .locals 0
    .param p1, "camera"    # Landroid/hardware/Camera;
    .param p2, "cb"    # Landroid/hardware/Camera$PreviewCallback;

    .prologue
    .line 89
    invoke-virtual {p1, p2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 90
    return-void
.end method

.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 12
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    const-wide/16 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 50
    if-nez p1, :cond_1

    .line 51
    new-array v5, v9, [Ljava/lang/Object;

    const-string/jumbo v6, "onPreviewFrame Called with null buffer"

    aput-object v6, v5, v8

    invoke-static {v5}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 54
    :cond_1
    iget-wide v6, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->filterCtxPtr:J

    cmp-long v5, v6, v10

    if-nez v5, :cond_2

    .line 55
    new-array v5, v9, [Ljava/lang/Object;

    const-string/jumbo v6, "onPreviewFrame Called with no filterCtxPtr set"

    aput-object v6, v5, v8

    invoke-static {v5}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {p0}, Lorg/linphone/core/AndroidCameraRecordImpl;->getExpectedBufferLength()I

    move-result v4

    .line 60
    .local v4, "expectedBuffLength":I
    array-length v5, p1

    if-eq v4, v5, :cond_3

    .line 61
    new-array v5, v9, [Ljava/lang/Object;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "onPreviewFrame called with bad buffer length "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, p1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " whereas expected is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " don\'t calling putImage"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v5}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    goto :goto_0

    .line 66
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 67
    .local v0, "curTime":J
    iget-wide v6, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->lastFrameTime:J

    cmp-long v5, v6, v10

    if-nez v5, :cond_4

    .line 68
    iput-wide v0, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->lastFrameTime:J

    .line 69
    iget-wide v6, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->filterCtxPtr:J

    iget v5, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->rotation:I

    invoke-direct {p0, v6, v7, p1, v5}, Lorg/linphone/core/AndroidCameraRecordImpl;->putImage(J[BI)V

    goto :goto_0

    .line 73
    :cond_4
    const-wide v6, 0x3fe999999999999aL    # 0.8

    iget-wide v8, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->lastFrameTime:J

    sub-long v8, v0, v8

    long-to-double v8, v8

    mul-double/2addr v6, v8

    const-wide v8, 0x408f400000000000L    # 1000.0

    div-double/2addr v6, v8

    const-wide v8, 0x3fc999999999999aL    # 0.2

    iget-wide v10, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->timeElapsedBetweenFrames:D

    mul-double/2addr v8, v10

    add-double v2, v6, v8

    .line 75
    .local v2, "currentTimeElapsed":D
    iget-wide v6, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->expectedTimeBetweenFrames:D

    cmpg-double v5, v2, v6

    if-ltz v5, :cond_0

    .line 80
    iput-wide v0, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->lastFrameTime:J

    .line 81
    iput-wide v2, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->timeElapsedBetweenFrames:D

    .line 84
    iget-wide v6, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->filterCtxPtr:J

    iget v5, p0, Lorg/linphone/core/AndroidCameraRecordImpl;->rotation:I

    invoke-direct {p0, v6, v7, p1, v5}, Lorg/linphone/core/AndroidCameraRecordImpl;->putImage(J[BI)V

    goto/16 :goto_0
.end method
