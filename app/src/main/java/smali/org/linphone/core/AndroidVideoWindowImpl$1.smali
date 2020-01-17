.class Lorg/linphone/core/AndroidVideoWindowImpl$1;
.super Ljava/lang/Object;
.source "AndroidVideoWindowImpl.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/core/AndroidVideoWindowImpl;-><init>(Landroid/view/SurfaceView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/core/AndroidVideoWindowImpl;


# direct methods
.method constructor <init>(Lorg/linphone/core/AndroidVideoWindowImpl;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/core/AndroidVideoWindowImpl;

    .prologue
    .line 30
    iput-object p1, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

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

    .line 32
    new-array v0, v4, [Ljava/lang/Object;

    const-string/jumbo v1, "Surface is being changed."

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/linphone/core/Log;->i([Ljava/lang/Object;)V

    .line 33
    iget-object v1, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    monitor-enter v1

    .line 34
    :try_start_0
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p3, p4, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/linphone/core/AndroidVideoWindowImpl;->access$002(Lorg/linphone/core/AndroidVideoWindowImpl;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 35
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-static {v0, v2}, Lorg/linphone/core/AndroidVideoWindowImpl;->access$102(Lorg/linphone/core/AndroidVideoWindowImpl;Landroid/view/Surface;)Landroid/view/Surface;

    .line 36
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    invoke-static {v0}, Lorg/linphone/core/AndroidVideoWindowImpl;->access$200(Lorg/linphone/core/AndroidVideoWindowImpl;)Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    invoke-static {v0}, Lorg/linphone/core/AndroidVideoWindowImpl;->access$200(Lorg/linphone/core/AndroidVideoWindowImpl;)Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    invoke-interface {v0, v1}, Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;->onSurfaceReady(Lorg/linphone/core/AndroidVideoWindowImpl;)V

    .line 39
    :cond_0
    new-array v0, v4, [Ljava/lang/Object;

    const-string/jumbo v1, "Video display surface changed"

    aput-object v1, v0, v3

    invoke-static {v0}, Lorg/linphone/core/Log;->w([Ljava/lang/Object;)V

    .line 40
    return-void

    .line 36
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 43
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Video display surface created"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->w([Ljava/lang/Object;)V

    .line 44
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 47
    iget-object v1, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    monitor-enter v1

    .line 48
    :try_start_0
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lorg/linphone/core/AndroidVideoWindowImpl;->access$102(Lorg/linphone/core/AndroidVideoWindowImpl;Landroid/view/Surface;)Landroid/view/Surface;

    .line 49
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lorg/linphone/core/AndroidVideoWindowImpl;->access$002(Lorg/linphone/core/AndroidVideoWindowImpl;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 50
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    invoke-static {v0}, Lorg/linphone/core/AndroidVideoWindowImpl;->access$200(Lorg/linphone/core/AndroidVideoWindowImpl;)Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    invoke-static {v0}, Lorg/linphone/core/AndroidVideoWindowImpl;->access$200(Lorg/linphone/core/AndroidVideoWindowImpl;)Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/core/AndroidVideoWindowImpl$1;->this$0:Lorg/linphone/core/AndroidVideoWindowImpl;

    invoke-interface {v0, v1}, Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;->onSurfaceDestroyed(Lorg/linphone/core/AndroidVideoWindowImpl;)V

    .line 53
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Video display surface destroyed"

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/core/Log;->d([Ljava/lang/Object;)V

    .line 54
    return-void

    .line 50
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
