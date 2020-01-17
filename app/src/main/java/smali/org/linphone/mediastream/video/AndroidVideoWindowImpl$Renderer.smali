.class Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;
.super Ljava/lang/Object;
.source "AndroidVideoWindowImpl.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Renderer"
.end annotation


# instance fields
.field height:I

.field initPending:Z

.field ptr:J

.field width:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->ptr:J

    .line 218
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->initPending:Z

    .line 219
    return-void
.end method


# virtual methods
.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 4
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;

    .prologue
    .line 239
    monitor-enter p0

    .line 240
    :try_start_0
    iget-wide v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->ptr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 241
    monitor-exit p0

    .line 248
    :goto_0
    return-void

    .line 242
    :cond_0
    iget-boolean v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->initPending:Z

    if-eqz v0, :cond_1

    .line 243
    iget-wide v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->ptr:J

    iget v2, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->width:I

    iget v3, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->height:I

    invoke-static {v0, v1, v2, v3}, Lorg/linphone/mediastream/video/display/OpenGLESDisplay;->init(JII)V

    .line 244
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->initPending:Z

    .line 246
    :cond_1
    iget-wide v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->ptr:J

    invoke-static {v0, v1}, Lorg/linphone/mediastream/video/display/OpenGLESDisplay;->render(J)V

    .line 247
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 1
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 252
    iput p2, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->width:I

    .line 253
    iput p3, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->height:I

    .line 254
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->initPending:Z

    .line 255
    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0
    .param p1, "gl"    # Ljavax/microedition/khronos/opengles/GL10;
    .param p2, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .prologue
    .line 259
    return-void
.end method

.method public setOpenGLESDisplay(J)V
    .locals 5
    .param p1, "ptr"    # J

    .prologue
    .line 227
    monitor-enter p0

    .line 228
    :try_start_0
    iget-wide v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->ptr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->ptr:J

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    .line 229
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->initPending:Z

    .line 231
    :cond_0
    iput-wide p1, p0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$Renderer;->ptr:J

    .line 232
    monitor-exit p0

    .line 233
    return-void

    .line 232
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
