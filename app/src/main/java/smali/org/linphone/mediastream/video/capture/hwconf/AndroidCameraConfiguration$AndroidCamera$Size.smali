.class public Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
.super Ljava/lang/Object;
.source "AndroidCameraConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Size"
.end annotation


# instance fields
.field public final height:I

.field public final width:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput p1, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->width:I

    .line 101
    iput p2, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;->height:I

    .line 102
    return-void
.end method
