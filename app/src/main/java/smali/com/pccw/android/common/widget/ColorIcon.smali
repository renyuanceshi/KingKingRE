.class public Lcom/pccw/android/common/widget/ColorIcon;
.super Landroid/widget/ImageView;
.source "ColorIcon.java"


# instance fields
.field private bmp_foreground:Landroid/graphics/Bitmap;

.field colorFilter:Landroid/graphics/ColorFilter;

.field private context:Landroid/content/Context;

.field private paint:Landroid/graphics/Paint;

.field private viewHeight:I

.field private viewWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->paint:Landroid/graphics/Paint;

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->bmp_foreground:Landroid/graphics/Bitmap;

    .line 30
    iput-object p1, p0, Lcom/pccw/android/common/widget/ColorIcon;->context:Landroid/content/Context;

    .line 31
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/pccw/android/common/widget/ColorIcon;->setBackgroundColor(I)V

    .line 32
    return-void
.end method

.method public static drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;
    .locals 8
    .param p0, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v7, 0x0

    .line 126
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    .line 127
    .local v4, "w":I
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    .line 129
    .local v3, "h":I
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_0

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 130
    .local v2, "config":Landroid/graphics/Bitmap$Config;
    :goto_0
    invoke-static {v4, v3, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 132
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 133
    .local v1, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {p0, v7, v7, v4, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 135
    invoke-virtual {p0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 136
    return-object v0

    .line 129
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "canvas":Landroid/graphics/Canvas;
    .end local v2    # "config":Landroid/graphics/Bitmap$Config;
    :cond_0
    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    goto :goto_0
.end method

.method private init()V
    .locals 1

    .prologue
    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->paint:Landroid/graphics/Paint;

    .line 41
    return-void
.end method

.method private loadBitmap()V
    .locals 4

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/ColorIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    instance-of v3, v3, Landroid/graphics/drawable/StateListDrawable;

    if-eqz v3, :cond_1

    .line 45
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/ColorIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/StateListDrawable;

    .line 46
    .local v2, "iconDrawable":Landroid/graphics/drawable/StateListDrawable;
    if-eqz v2, :cond_0

    .line 47
    invoke-virtual {v2}, Landroid/graphics/drawable/StateListDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 48
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    invoke-static {v0}, Lcom/pccw/android/common/widget/ColorIcon;->drawableToBitmap(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/android/common/widget/ColorIcon;->bmp_foreground:Landroid/graphics/Bitmap;

    .line 56
    .end local v0    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v2    # "iconDrawable":Landroid/graphics/drawable/StateListDrawable;
    :cond_0
    :goto_0
    return-void

    .line 51
    :cond_1
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/ColorIcon;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;

    .line 52
    .local v1, "iconBitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v1, :cond_0

    .line 53
    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/android/common/widget/ColorIcon;->bmp_foreground:Landroid/graphics/Bitmap;

    goto :goto_0
.end method

.method private measureHeight(II)I
    .locals 4
    .param p1, "measureSpecHeight"    # I
    .param p2, "measureSpecWidth"    # I

    .prologue
    .line 109
    const/4 v0, 0x0

    .line 110
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 111
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 113
    .local v2, "specSize":I
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v3, :cond_0

    .line 115
    move v0, v2

    .line 122
    :goto_0
    add-int/lit8 v3, v0, 0x2

    return v3

    .line 119
    :cond_0
    iget v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->viewHeight:I

    goto :goto_0
.end method

.method private measureWidth(I)I
    .locals 4
    .param p1, "measureSpec"    # I

    .prologue
    .line 91
    const/4 v0, 0x0

    .line 92
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 93
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 95
    .local v2, "specSize":I
    const/high16 v3, 0x40000000    # 2.0f

    if-ne v1, v3, :cond_0

    .line 97
    move v0, v2

    .line 104
    :goto_0
    return v0

    .line 101
    :cond_0
    iget v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->viewWidth:I

    goto :goto_0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 60
    invoke-direct {p0}, Lcom/pccw/android/common/widget/ColorIcon;->loadBitmap()V

    .line 61
    iget-object v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->bmp_foreground:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->colorFilter:Landroid/graphics/ColorFilter;

    sget-object v1, Lcom/pccw/sms/bean/SMSConstants;->cf_white:Landroid/graphics/ColorFilter;

    if-eq v0, v1, :cond_0

    .line 62
    iget-object v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->paint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/pccw/android/common/widget/ColorIcon;->colorFilter:Landroid/graphics/ColorFilter;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 63
    iget-object v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->bmp_foreground:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/pccw/android/common/widget/ColorIcon;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 67
    :goto_0
    return-void

    .line 65
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 4
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/pccw/android/common/widget/ColorIcon;->measureWidth(I)I

    move-result v1

    .line 73
    .local v1, "width":I
    invoke-direct {p0, p2, p1}, Lcom/pccw/android/common/widget/ColorIcon;->measureHeight(II)I

    move-result v0

    .line 75
    .local v0, "height":I
    invoke-direct {p0}, Lcom/pccw/android/common/widget/ColorIcon;->loadBitmap()V

    .line 76
    iget-object v2, p0, Lcom/pccw/android/common/widget/ColorIcon;->bmp_foreground:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_0

    .line 77
    iget-object v2, p0, Lcom/pccw/android/common/widget/ColorIcon;->bmp_foreground:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iput v2, p0, Lcom/pccw/android/common/widget/ColorIcon;->viewWidth:I

    .line 78
    iget-object v2, p0, Lcom/pccw/android/common/widget/ColorIcon;->bmp_foreground:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iput v2, p0, Lcom/pccw/android/common/widget/ColorIcon;->viewHeight:I

    .line 84
    :goto_0
    iget v2, p0, Lcom/pccw/android/common/widget/ColorIcon;->viewWidth:I

    iget v3, p0, Lcom/pccw/android/common/widget/ColorIcon;->viewHeight:I

    invoke-virtual {p0, v2, v3}, Lcom/pccw/android/common/widget/ColorIcon;->setMeasuredDimension(II)V

    .line 86
    invoke-direct {p0}, Lcom/pccw/android/common/widget/ColorIcon;->init()V

    .line 87
    return-void

    .line 80
    :cond_0
    iput v1, p0, Lcom/pccw/android/common/widget/ColorIcon;->viewWidth:I

    .line 81
    iput v0, p0, Lcom/pccw/android/common/widget/ColorIcon;->viewHeight:I

    goto :goto_0
.end method

.method public setIconAttr(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/pccw/android/common/widget/ColorIcon;->loadBitmap()V

    .line 36
    iput-object p1, p0, Lcom/pccw/android/common/widget/ColorIcon;->colorFilter:Landroid/graphics/ColorFilter;

    .line 37
    return-void
.end method
