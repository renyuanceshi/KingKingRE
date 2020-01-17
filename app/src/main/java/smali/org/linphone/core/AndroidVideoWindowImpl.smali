.class public Lorg/linphone/core/AndroidVideoWindowImpl;
.super Ljava/lang/Object;
.source "AndroidVideoWindowImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;
    }
.end annotation


# static fields
.field static final LANDSCAPE:I = 0x0

.field static final PORTRAIT:I = 0x1


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mListener:Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

.field private mSurface:Landroid/view/Surface;

.field private mView:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Landroid/view/SurfaceView;)V
    .locals 2
    .param p1, "view"    # Landroid/view/SurfaceView;

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mView:Landroid/view/SurfaceView;

    .line 27
    iput-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mBitmap:Landroid/graphics/Bitmap;

    .line 28
    iput-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mSurface:Landroid/view/Surface;

    .line 29
    iput-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mListener:Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

    .line 30
    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    new-instance v1, Lorg/linphone/core/AndroidVideoWindowImpl$1;

    invoke-direct {v1, p0}, Lorg/linphone/core/AndroidVideoWindowImpl$1;-><init>(Lorg/linphone/core/AndroidVideoWindowImpl;)V

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 56
    return-void
.end method

.method static synthetic access$002(Lorg/linphone/core/AndroidVideoWindowImpl;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/core/AndroidVideoWindowImpl;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 13
    iput-object p1, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$102(Lorg/linphone/core/AndroidVideoWindowImpl;Landroid/view/Surface;)Landroid/view/Surface;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/core/AndroidVideoWindowImpl;
    .param p1, "x1"    # Landroid/view/Surface;

    .prologue
    .line 13
    iput-object p1, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mSurface:Landroid/view/Surface;

    return-object p1
.end method

.method static synthetic access$200(Lorg/linphone/core/AndroidVideoWindowImpl;)Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/core/AndroidVideoWindowImpl;

    .prologue
    .line 13
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mListener:Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

    return-object v0
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public requestOrientation(I)V
    .locals 0
    .param p1, "orientation"    # I

    .prologue
    .line 64
    return-void
.end method

.method public setListener(Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;)V
    .locals 0
    .param p1, "l"    # Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mListener:Lorg/linphone/core/AndroidVideoWindowImpl$VideoWindowListener;

    .line 68
    return-void
.end method

.method public declared-synchronized update()V
    .locals 6

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mSurface:Landroid/view/Surface;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 82
    :try_start_1
    iget-object v2, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mSurface:Landroid/view/Surface;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/Surface;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    move-result-object v0

    .line 83
    .local v0, "canvas":Landroid/graphics/Canvas;
    iget-object v2, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 84
    iget-object v2, p0, Lorg/linphone/core/AndroidVideoWindowImpl;->mSurface:Landroid/view/Surface;

    invoke-virtual {v2, v0}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/view/Surface$OutOfResourcesException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    .end local v0    # "canvas":Landroid/graphics/Canvas;
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 86
    :catch_0
    move-exception v1

    .line 88
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 80
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 89
    :catch_1
    move-exception v1

    .line 91
    .local v1, "e":Landroid/view/Surface$OutOfResourcesException;
    :try_start_3
    invoke-virtual {v1}, Landroid/view/Surface$OutOfResourcesException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method
