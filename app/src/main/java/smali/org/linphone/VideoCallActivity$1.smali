.class Lorg/linphone/VideoCallActivity$1;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$VideoWindowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/VideoCallActivity;

.field final synthetic val$lc:Lorg/linphone/core/LinphoneCore;


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity;Lorg/linphone/core/LinphoneCore;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 236
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$1;->this$0:Lorg/linphone/VideoCallActivity;

    iput-object p2, p0, Lorg/linphone/VideoCallActivity$1;->val$lc:Lorg/linphone/core/LinphoneCore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoPreviewSurfaceDestroyed(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)V
    .locals 2
    .param p1, "vw"    # Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    .prologue
    .line 254
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$1;->val$lc:Lorg/linphone/core/LinphoneCore;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setPreviewWindow(Ljava/lang/Object;)V

    .line 255
    return-void
.end method

.method public onVideoPreviewSurfaceReady(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;Landroid/view/SurfaceView;)V
    .locals 2
    .param p1, "vw"    # Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;
    .param p2, "surface"    # Landroid/view/SurfaceView;

    .prologue
    .line 248
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$1;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0, p2}, Lorg/linphone/VideoCallActivity;->access$102(Lorg/linphone/VideoCallActivity;Landroid/view/SurfaceView;)Landroid/view/SurfaceView;

    .line 249
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$1;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v1, p0, Lorg/linphone/VideoCallActivity$1;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v1}, Lorg/linphone/VideoCallActivity;->access$100(Lorg/linphone/VideoCallActivity;)Landroid/view/SurfaceView;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setPreviewWindow(Ljava/lang/Object;)V

    .line 250
    return-void
.end method

.method public onVideoRenderingSurfaceDestroyed(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)V
    .locals 2
    .param p1, "vw"    # Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    .prologue
    .line 244
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$1;->val$lc:Lorg/linphone/core/LinphoneCore;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setVideoWindow(Ljava/lang/Object;)V

    .line 245
    return-void
.end method

.method public onVideoRenderingSurfaceReady(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;Landroid/view/SurfaceView;)V
    .locals 1
    .param p1, "vw"    # Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;
    .param p2, "surface"    # Landroid/view/SurfaceView;

    .prologue
    .line 239
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$1;->val$lc:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0, p1}, Lorg/linphone/core/LinphoneCore;->setVideoWindow(Ljava/lang/Object;)V

    .line 240
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$1;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0, p2}, Lorg/linphone/VideoCallActivity;->access$002(Lorg/linphone/VideoCallActivity;Landroid/view/SurfaceView;)Landroid/view/SurfaceView;

    .line 241
    return-void
.end method
