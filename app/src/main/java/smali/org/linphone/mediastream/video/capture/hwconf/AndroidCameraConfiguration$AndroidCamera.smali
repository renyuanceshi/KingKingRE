.class public Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
.super Ljava/lang/Object;
.source "AndroidCameraConfiguration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AndroidCamera"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;
    }
.end annotation


# instance fields
.field public frontFacing:Z

.field public id:I

.field public orientation:I

.field public resolutions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(IZILjava/util/List;)V
    .locals 6
    .param p1, "i"    # I
    .param p2, "f"    # Z
    .param p3, "o"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZI",
            "Ljava/util/List",
            "<",
            "Landroid/hardware/Camera$Size;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 111
    .local p4, "origin":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Camera$Size;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->resolutions:Ljava/util/List;

    .line 113
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Size;

    .line 114
    .local v0, "s":Landroid/hardware/Camera$Size;
    iget-object v2, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->resolutions:Ljava/util/List;

    new-instance v3, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;

    iget v4, v0, Landroid/hardware/Camera$Size;->width:I

    iget v5, v0, Landroid/hardware/Camera$Size;->height:I

    invoke-direct {v3, v4, v5}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;-><init>(II)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 116
    .end local v0    # "s":Landroid/hardware/Camera$Size;
    :cond_0
    iput p1, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->id:I

    .line 117
    iput-boolean p2, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    .line 118
    iput p3, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->orientation:I

    .line 119
    return-void
.end method

.method public constructor <init>(IZLjava/util/List;I)V
    .locals 0
    .param p1, "i"    # I
    .param p2, "f"    # Z
    .param p4, "o"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ljava/util/List",
            "<",
            "Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p3, "r":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera$Size;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput p1, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->id:I

    .line 107
    iput-boolean p2, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    .line 108
    iput p4, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->orientation:I

    .line 109
    iput-object p3, p0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->resolutions:Ljava/util/List;

    .line 110
    return-void
.end method
