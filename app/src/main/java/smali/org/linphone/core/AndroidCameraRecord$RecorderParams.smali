.class public Lorg/linphone/core/AndroidCameraRecord$RecorderParams;
.super Ljava/lang/Object;
.source "AndroidCameraRecord.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/core/AndroidCameraRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecorderParams"
.end annotation


# instance fields
.field public cameraId:I

.field final filterDataNativePtr:J

.field public fps:F

.field public height:I

.field public rotation:I

.field public surfaceView:Landroid/view/SurfaceView;

.field public width:I


# direct methods
.method public constructor <init>(J)V
    .locals 1
    .param p1, "ptr"    # J

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    iput-wide p1, p0, Lorg/linphone/core/AndroidCameraRecord$RecorderParams;->filterDataNativePtr:J

    .line 173
    return-void
.end method
