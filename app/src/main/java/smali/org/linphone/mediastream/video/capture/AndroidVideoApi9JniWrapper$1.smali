.class final Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper$1;
.super Ljava/lang/Object;
.source "AndroidVideoApi9JniWrapper.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper;->startRecording(IIIIIJ)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$nativePtr:J


# direct methods
.method constructor <init>(J)V
    .locals 1

    .prologue
    .line 87
    iput-wide p1, p0, Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper$1;->val$nativePtr:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 6
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 90
    if-nez p1, :cond_1

    .line 92
    invoke-virtual {p2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v1

    .line 93
    .local v1, "params":Landroid/hardware/Camera$Parameters;
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v2

    .line 94
    .local v2, "size":Landroid/hardware/Camera$Size;
    iget v3, v2, Landroid/hardware/Camera$Size;->width:I

    iget v4, v2, Landroid/hardware/Camera$Size;->height:I

    mul-int/2addr v3, v4

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getPreviewFormat()I

    move-result v4

    invoke-static {v4}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    move-result v4

    mul-int/2addr v3, v4

    div-int/lit8 v0, v3, 0x8

    .line 95
    .local v0, "bufferSize":I
    div-int/lit8 v3, v0, 0x14

    add-int/2addr v0, v3

    .line 96
    new-array v3, v0, [B

    invoke-virtual {p2, v3}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 101
    .end local v0    # "bufferSize":I
    .end local v1    # "params":Landroid/hardware/Camera$Parameters;
    .end local v2    # "size":Landroid/hardware/Camera$Size;
    :cond_0
    :goto_0
    return-void

    .line 97
    :cond_1
    sget-boolean v3, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->isRecording:Z

    if-eqz v3, :cond_0

    .line 98
    iget-wide v4, p0, Lorg/linphone/mediastream/video/capture/AndroidVideoApi9JniWrapper$1;->val$nativePtr:J

    invoke-static {v4, v5, p1}, Lorg/linphone/mediastream/video/capture/AndroidVideoApi5JniWrapper;->putImage(J[B)V

    .line 99
    invoke-virtual {p2, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    goto :goto_0
.end method
