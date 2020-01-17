.class Lorg/linphone/core/AndroidCameraRecord$1;
.super Ljava/lang/Object;
.source "AndroidCameraRecord.java"

# interfaces
.implements Landroid/hardware/Camera$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/core/AndroidCameraRecord;->startPreview()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/core/AndroidCameraRecord;


# direct methods
.method constructor <init>(Lorg/linphone/core/AndroidCameraRecord;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/core/AndroidCameraRecord;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/linphone/core/AndroidCameraRecord$1;->this$0:Lorg/linphone/core/AndroidCameraRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(ILandroid/hardware/Camera;)V
    .locals 4
    .param p1, "error"    # I
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 69
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Camera error : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->e([Ljava/lang/Object;)V

    .line 70
    return-void
.end method
