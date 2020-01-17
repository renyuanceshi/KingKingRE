.class Lorg/linphone/core/AndroidCameraRecordManager$1;
.super Ljava/lang/Object;
.source "AndroidCameraRecordManager.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/core/AndroidCameraRecordManager;->setSurfaceView(Landroid/view/SurfaceView;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/core/AndroidCameraRecordManager;

.field final synthetic val$sv:Landroid/view/SurfaceView;


# direct methods
.method constructor <init>(Lorg/linphone/core/AndroidCameraRecordManager;Landroid/view/SurfaceView;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/core/AndroidCameraRecordManager;

    .prologue
    .line 138
    iput-object p1, p0, Lorg/linphone/core/AndroidCameraRecordManager$1;->this$0:Lorg/linphone/core/AndroidCameraRecordManager;

    iput-object p2, p0, Lorg/linphone/core/AndroidCameraRecordManager$1;->val$sv:Landroid/view/SurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 152
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Video capture surface changed"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 153
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 146
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager$1;->this$0:Lorg/linphone/core/AndroidCameraRecordManager;

    iget-object v1, p0, Lorg/linphone/core/AndroidCameraRecordManager$1;->val$sv:Landroid/view/SurfaceView;

    invoke-static {v0, v1}, Lorg/linphone/core/AndroidCameraRecordManager;->access$002(Lorg/linphone/core/AndroidCameraRecordManager;Landroid/view/SurfaceView;)Landroid/view/SurfaceView;

    .line 147
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Video capture surface created"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 148
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager$1;->this$0:Lorg/linphone/core/AndroidCameraRecordManager;

    invoke-static {v0}, Lorg/linphone/core/AndroidCameraRecordManager;->access$100(Lorg/linphone/core/AndroidCameraRecordManager;)V

    .line 149
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 140
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager$1;->this$0:Lorg/linphone/core/AndroidCameraRecordManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/linphone/core/AndroidCameraRecordManager;->access$002(Lorg/linphone/core/AndroidCameraRecordManager;Landroid/view/SurfaceView;)Landroid/view/SurfaceView;

    .line 141
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Video capture surface destroyed"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 142
    iget-object v0, p0, Lorg/linphone/core/AndroidCameraRecordManager$1;->this$0:Lorg/linphone/core/AndroidCameraRecordManager;

    invoke-virtual {v0}, Lorg/linphone/core/AndroidCameraRecordManager;->stopVideoRecording()V

    .line 143
    return-void
.end method
