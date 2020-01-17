.class public Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;
.super Landroid/widget/ImageView;
.source "FilledWidthRoundCorneredImageView.java"


# static fields
.field private static radius:F


# instance fields
.field private isFilled:Z

.field private viewHeight:I

.field private viewWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const/high16 v0, 0x41a00000    # 20.0f

    sput v0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->radius:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->isFilled:Z

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->isFilled:Z

    .line 30
    invoke-direct {p0, p1, p2}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->setRadius(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->isFilled:Z

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->setRadius(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 36
    return-void
.end method

.method private setRadius(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    .line 39
    sget-object v3, Lcom/pccw/mobile/sip02/R$styleable;->FilledWidthRoundCorneredImageView:[I

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    .line 40
    .local v2, "styledAttrs":Landroid/content/res/TypedArray;
    sget v3, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->radius:F

    invoke-virtual {v2, v4, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 41
    .local v0, "b_width":Ljava/lang/Float;
    const/4 v3, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 42
    .local v1, "is_filled":Z
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    .line 44
    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v3}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 45
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    sput v3, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->radius:F

    .line 46
    iput-boolean v1, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->isFilled:Z

    .line 47
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 51
    const/4 v1, 0x0

    .line 52
    .local v1, "bm":Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 54
    .local v0, "bitmapDrawable":Landroid/graphics/drawable/BitmapDrawable;
    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 57
    :cond_0
    if-eqz v1, :cond_1

    .line 59
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 60
    .local v2, "paint":Landroid/graphics/Paint;
    invoke-virtual {v2, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 61
    iget v6, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewWidth:I

    iget v7, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewHeight:I

    invoke-static {v1, v6, v7, v9}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 62
    .local v4, "scaledBitmap":Landroid/graphics/Bitmap;
    new-instance v5, Landroid/graphics/BitmapShader;

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v5, v4, v6, v7}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 65
    .local v5, "shader":Landroid/graphics/BitmapShader;
    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 67
    new-instance v3, Landroid/graphics/RectF;

    iget v6, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewWidth:I

    int-to-float v6, v6

    iget v7, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewHeight:I

    int-to-float v7, v7

    invoke-direct {v3, v8, v8, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 68
    .local v3, "rect":Landroid/graphics/RectF;
    sget v6, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->radius:F

    float-to-double v6, v6

    const-wide/16 v8, 0x0

    cmpl-double v6, v6, v8

    if-eqz v6, :cond_2

    .line 69
    sget v6, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->radius:F

    sget v7, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->radius:F

    invoke-virtual {p1, v3, v6, v7, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 73
    .end local v2    # "paint":Landroid/graphics/Paint;
    .end local v3    # "rect":Landroid/graphics/RectF;
    .end local v4    # "scaledBitmap":Landroid/graphics/Bitmap;
    .end local v5    # "shader":Landroid/graphics/BitmapShader;
    :cond_1
    :goto_0
    return-void

    .line 71
    .restart local v2    # "paint":Landroid/graphics/Paint;
    .restart local v3    # "rect":Landroid/graphics/RectF;
    .restart local v4    # "scaledBitmap":Landroid/graphics/Bitmap;
    .restart local v5    # "shader":Landroid/graphics/BitmapShader;
    :cond_2
    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const v2, 0x7f0800a9

    .line 77
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iput v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewWidth:I

    .line 78
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iput v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewHeight:I

    .line 80
    iget v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewHeight:I

    invoke-virtual {p0}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v1, v1

    if-ge v0, v1, :cond_0

    .line 81
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewHeight:I

    .line 83
    :cond_0
    iget v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewHeight:I

    invoke-virtual {p0}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    mul-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    div-int/2addr v0, v1

    iput v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewWidth:I

    .line 84
    iget v0, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewWidth:I

    iget v1, p0, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->viewHeight:I

    invoke-virtual {p0, v0, v1}, Lcom/pccw/android/common/widget/FilledWidthRoundCorneredImageView;->setMeasuredDimension(II)V

    .line 85
    return-void
.end method
