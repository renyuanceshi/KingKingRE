.class Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;
.super Ljava/lang/Object;
.source "AndroidVideoWindowImpl.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;


# direct methods
.method constructor <init>(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    .prologue
    .line 125
    iput-object p1, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;->this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 5
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 128
    new-array v0, v4, [Ljava/lang/Object;

    const-string/jumbo v1, "Video preview surface is being changed."

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 129
    iget-object v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;->this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-static {v0}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->access$300(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$VideoWindowListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;->this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-static {v0}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->access$300(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$VideoWindowListener;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;->this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    iget-object v2, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;->this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-static {v2}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->access$500(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)Landroid/view/SurfaceView;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$VideoWindowListener;->onVideoPreviewSurfaceReady(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;Landroid/view/SurfaceView;)V

    .line 131
    :cond_0
    new-array v0, v4, [Ljava/lang/Object;

    const-string/jumbo v1, "Video preview surface changed"

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->w([Ljava/lang/Object;)V

    .line 132
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 135
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Video preview surface created"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->w([Ljava/lang/Object;)V

    .line 136
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 139
    iget-object v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;->this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-static {v0}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->access$300(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$VideoWindowListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;->this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-static {v0}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->access$300(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$VideoWindowListener;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$2;->this$0:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-interface {v0, v1}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$VideoWindowListener;->onVideoPreviewSurfaceDestroyed(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)V

    .line 141
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Video preview surface destroyed"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 142
    return-void
.end method
