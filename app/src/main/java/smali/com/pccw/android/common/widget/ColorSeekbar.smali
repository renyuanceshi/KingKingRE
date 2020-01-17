.class public Lcom/pccw/android/common/widget/ColorSeekbar;
.super Landroid/widget/SeekBar;
.source "ColorSeekbar.java"


# instance fields
.field cf:Landroid/graphics/ColorFilter;

.field private mThumb:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Landroid/widget/SeekBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/pccw/android/common/widget/ColorSeekbar;->setBackgroundColor(I)V

    .line 22
    return-void
.end method

.method private updateColor()V
    .locals 5

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/ColorSeekbar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/LayerDrawable;

    .line 31
    .local v1, "progressDrawable":Landroid/graphics/drawable/LayerDrawable;
    const v4, 0x102000d

    invoke-virtual {v1, v4}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/ScaleDrawable;

    .line 32
    .local v0, "d1":Landroid/graphics/drawable/ScaleDrawable;
    iget-object v4, p0, Lcom/pccw/android/common/widget/ColorSeekbar;->cf:Landroid/graphics/ColorFilter;

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/ScaleDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 34
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/ColorSeekbar;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/StateListDrawable;

    .line 35
    .local v3, "thumbDrawable":Landroid/graphics/drawable/StateListDrawable;
    invoke-virtual {v3}, Landroid/graphics/drawable/StateListDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 36
    .local v2, "thumb":Landroid/graphics/drawable/Drawable;
    iget-object v4, p0, Lcom/pccw/android/common/widget/ColorSeekbar;->cf:Landroid/graphics/ColorFilter;

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 37
    return-void
.end method


# virtual methods
.method public getThumb()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/pccw/android/common/widget/ColorSeekbar;->mThumb:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method protected declared-synchronized onDraw(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 52
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/ColorSeekbar;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/StateListDrawable;

    .line 53
    .local v1, "thumbDrawable":Landroid/graphics/drawable/StateListDrawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/StateListDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 54
    .local v0, "thumb":Landroid/graphics/drawable/Drawable;
    iget-object v2, p0, Lcom/pccw/android/common/widget/ColorSeekbar;->cf:Landroid/graphics/ColorFilter;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 55
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    monitor-exit p0

    return-void

    .line 52
    .end local v0    # "thumb":Landroid/graphics/drawable/Drawable;
    .end local v1    # "thumbDrawable":Landroid/graphics/drawable/StateListDrawable;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public setIconAttr(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/pccw/android/common/widget/ColorSeekbar;->cf:Landroid/graphics/ColorFilter;

    .line 26
    invoke-direct {p0}, Lcom/pccw/android/common/widget/ColorSeekbar;->updateColor()V

    .line 27
    return-void
.end method

.method public setThumb(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "thumb"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 42
    iput-object p1, p0, Lcom/pccw/android/common/widget/ColorSeekbar;->mThumb:Landroid/graphics/drawable/Drawable;

    .line 43
    return-void
.end method
