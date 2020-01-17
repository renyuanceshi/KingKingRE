.class public Lcom/pccw/android/common/widget/CircularImageView;
.super Landroid/widget/ImageView;
.source "CircularImageView.java"

# interfaces
.implements Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;


# instance fields
.field private borderWidth:I

.field private crossFadeAnimation:Lcom/pccw/android/common/widget/CrossFadeAnimation;

.field private image:Landroid/graphics/Bitmap;

.field private mBlockLayout:Z

.field private paint:Landroid/graphics/Paint;

.field private paintBorder:Landroid/graphics/Paint;

.field private shader:Landroid/graphics/BitmapShader;

.field private updateBitmap:Landroid/graphics/Bitmap;

.field private viewHeight:I

.field private viewWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 23
    const/4 v0, 0x2

    iput v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->updateBitmap:Landroid/graphics/Bitmap;

    .line 38
    invoke-direct {p0}, Lcom/pccw/android/common/widget/CircularImageView;->setup()V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    const/4 v0, 0x2

    iput v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->updateBitmap:Landroid/graphics/Bitmap;

    .line 44
    invoke-direct {p0}, Lcom/pccw/android/common/widget/CircularImageView;->setup()V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    const/4 v2, 0x2

    iput v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    .line 33
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->updateBitmap:Landroid/graphics/Bitmap;

    .line 51
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CircularImageView;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 61
    :goto_0
    return-void

    .line 55
    :cond_0
    sget-object v2, Lcom/pccw/mobile/sip02/R$styleable;->CircularImageView:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 56
    .local v1, "styledAttrs":Landroid/content/res/TypedArray;
    const/4 v2, 0x0

    iget v3, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    .line 57
    .local v0, "b_width":I
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 58
    iput v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    .line 60
    invoke-direct {p0}, Lcom/pccw/android/common/widget/CircularImageView;->setup()V

    goto :goto_0
.end method

.method private loadBitmap()V
    .locals 2

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CircularImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 97
    .local v0, "bitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :cond_0

    .line 98
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/android/common/widget/CircularImageView;->image:Landroid/graphics/Bitmap;

    .line 99
    :cond_0
    return-void
.end method

.method private measureHeight(II)I
    .locals 4
    .param p1, "measureSpecHeight"    # I
    .param p2, "measureSpecWidth"    # I

    .prologue
    .line 157
    const/4 v0, 0x0

    .line 158
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 159
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 161
    .local v2, "specSize":I
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v3, :cond_0

    .line 164
    move v0, v2

    .line 172
    :goto_0
    add-int/lit8 v3, v0, 0x2

    return v3

    .line 169
    :cond_0
    iget v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->viewHeight:I

    goto :goto_0
.end method

.method private measureWidth(I)I
    .locals 4
    .param p1, "measureSpec"    # I

    .prologue
    .line 137
    const/4 v0, 0x0

    .line 138
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 139
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 141
    .local v2, "specSize":I
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v3, :cond_0

    .line 144
    move v0, v2

    .line 152
    :goto_0
    return v0

    .line 149
    :cond_0
    iget v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->viewWidth:I

    goto :goto_0
.end method

.method private setup()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 66
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->paint:Landroid/graphics/Paint;

    .line 67
    iget-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 69
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->paintBorder:Landroid/graphics/Paint;

    .line 70
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CircularImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0b0052

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/pccw/android/common/widget/CircularImageView;->setBorderColor(I)V

    .line 71
    iget v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    invoke-virtual {p0, v0}, Lcom/pccw/android/common/widget/CircularImageView;->setBorderWidth(I)V

    .line 72
    iget-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->paintBorder:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 73
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 74
    iget-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->paintBorder:Landroid/graphics/Paint;

    invoke-virtual {p0, v2, v0}, Lcom/pccw/android/common/widget/CircularImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 76
    :cond_0
    iget-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->paintBorder:Landroid/graphics/Paint;

    const/high16 v1, 0x3fc00000    # 1.5f

    const v2, -0xbbbbbc

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 77
    return-void
.end method


# virtual methods
.method public animationEnds()V
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->updateBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0}, Lcom/pccw/android/common/widget/CircularImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 218
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DrawAllocation"
        }
    .end annotation

    .prologue
    const/high16 v6, 0x40800000    # 4.0f

    .line 106
    invoke-direct {p0}, Lcom/pccw/android/common/widget/CircularImageView;->loadBitmap()V

    .line 109
    iget-object v1, p0, Lcom/pccw/android/common/widget/CircularImageView;->image:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    .line 111
    new-instance v1, Landroid/graphics/BitmapShader;

    iget-object v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->image:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CircularImageView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CircularImageView;->getHeight()I

    move-result v4

    const/4 v5, 0x1

    invoke-static {v2, v3, v4, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, v2, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lcom/pccw/android/common/widget/CircularImageView;->shader:Landroid/graphics/BitmapShader;

    .line 112
    iget-object v1, p0, Lcom/pccw/android/common/widget/CircularImageView;->paint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->shader:Landroid/graphics/BitmapShader;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 113
    iget v1, p0, Lcom/pccw/android/common/widget/CircularImageView;->viewWidth:I

    div-int/lit8 v0, v1, 0x2

    .line 118
    .local v0, "circleCenter":I
    iget v1, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    add-int/2addr v1, v0

    int-to-float v1, v1

    iget v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    add-int/2addr v2, v0

    int-to-float v2, v2

    iget v3, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    add-int/2addr v3, v0

    int-to-float v3, v3

    sub-float/2addr v3, v6

    iget-object v4, p0, Lcom/pccw/android/common/widget/CircularImageView;->paintBorder:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 119
    iget v1, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    add-int/2addr v1, v0

    int-to-float v1, v1

    iget v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    add-int/2addr v2, v0

    int-to-float v2, v2

    int-to-float v3, v0

    sub-float/2addr v3, v6

    iget-object v4, p0, Lcom/pccw/android/common/widget/CircularImageView;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 121
    .end local v0    # "circleCenter":I
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 126
    invoke-direct {p0, p1}, Lcom/pccw/android/common/widget/CircularImageView;->measureWidth(I)I

    move-result v1

    .line 127
    .local v1, "width":I
    invoke-direct {p0, p2, p1}, Lcom/pccw/android/common/widget/CircularImageView;->measureHeight(II)I

    move-result v0

    .line 129
    .local v0, "height":I
    iget v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    mul-int/lit8 v2, v2, 0x2

    sub-int v2, v1, v2

    iput v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->viewWidth:I

    .line 130
    iget v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    mul-int/lit8 v2, v2, 0x2

    sub-int v2, v0, v2

    iput v2, p0, Lcom/pccw/android/common/widget/CircularImageView;->viewHeight:I

    .line 132
    invoke-virtual {p0, v1, v0}, Lcom/pccw/android/common/widget/CircularImageView;->setMeasuredDimension(II)V

    .line 133
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .prologue
    .line 177
    iget-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    if-nez v0, :cond_0

    .line 178
    invoke-super {p0}, Landroid/widget/ImageView;->requestLayout()V

    .line 180
    :cond_0
    return-void
.end method

.method public setBorderColor(I)V
    .locals 1
    .param p1, "borderColor"    # I

    .prologue
    .line 87
    iget-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->paintBorder:Landroid/graphics/Paint;

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->paintBorder:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 90
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CircularImageView;->invalidate()V

    .line 91
    return-void
.end method

.method public setBorderWidth(I)V
    .locals 0
    .param p1, "borderWidth"    # I

    .prologue
    .line 81
    iput p1, p0, Lcom/pccw/android/common/widget/CircularImageView;->borderWidth:I

    .line 82
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CircularImageView;->invalidate()V

    .line 83
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 191
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    .line 192
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 193
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    .line 194
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 184
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    .line 185
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 186
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    .line 187
    return-void
.end method

.method public setImageResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 205
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    .line 206
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 207
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    .line 208
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 1
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 198
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    .line 199
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 200
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->mBlockLayout:Z

    .line 201
    return-void
.end method

.method public updateImage(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bm"    # Landroid/graphics/Bitmap;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/pccw/android/common/widget/CircularImageView;->updateBitmap:Landroid/graphics/Bitmap;

    .line 212
    iget-object v0, p0, Lcom/pccw/android/common/widget/CircularImageView;->crossFadeAnimation:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    invoke-virtual {v0}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeOut()V

    .line 213
    return-void
.end method
