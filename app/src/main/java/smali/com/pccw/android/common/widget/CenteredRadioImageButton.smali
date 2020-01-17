.class public Lcom/pccw/android/common/widget/CenteredRadioImageButton;
.super Landroid/support/v7/widget/AppCompatRadioButton;
.source "CenteredRadioImageButton.java"


# instance fields
.field image:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x0

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/AppCompatRadioButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 32
    :goto_0
    return-void

    .line 25
    :cond_0
    sget-object v2, Lcom/pccw/mobile/sip02/R$styleable;->CompoundButton:[I

    invoke-virtual {p1, p2, v2, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 26
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->image:Landroid/graphics/drawable/Drawable;

    .line 27
    const v2, 0x106000d

    invoke-virtual {p0, v2}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setButtonDrawable(I)V

    .line 28
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 30
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string/jumbo v3, "RobotoCondensed-Bold.ttf"

    invoke-static {v2, v3}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 31
    .local v1, "typeface":Landroid/graphics/Typeface;
    invoke-virtual {p0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v10, 0x3f000000    # 0.5f

    .line 36
    invoke-super {p0, p1}, Landroid/support/v7/widget/AppCompatRadioButton;->onDraw(Landroid/graphics/Canvas;)V

    .line 38
    iget-object v7, p0, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->image:Landroid/graphics/drawable/Drawable;

    if-eqz v7, :cond_0

    .line 39
    iget-object v7, p0, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->image:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->getDrawableState()[I

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 41
    iget-object v7, p0, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->image:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    .line 42
    .local v4, "imgHeight":I
    iget-object v7, p0, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->image:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    .line 43
    .local v5, "imgWidth":I
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->getWidth()I

    move-result v1

    .line 44
    .local v1, "btnWidth":I
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->getHeight()I

    move-result v0

    .line 47
    .local v0, "btnHeight":I
    if-gt v5, v1, :cond_1

    if-gt v4, v0, :cond_1

    .line 48
    const/high16 v6, 0x3f800000    # 1.0f

    .line 54
    .local v6, "scale":F
    :goto_0
    int-to-float v7, v1

    int-to-float v8, v5

    mul-float/2addr v8, v6

    sub-float/2addr v7, v8

    mul-float/2addr v7, v10

    add-float/2addr v7, v10

    float-to-int v2, v7

    .line 55
    .local v2, "dx":I
    int-to-float v7, v0

    int-to-float v8, v4

    mul-float/2addr v8, v6

    sub-float/2addr v7, v8

    mul-float/2addr v7, v10

    add-float/2addr v7, v10

    float-to-int v3, v7

    .line 57
    .local v3, "dy":I
    iget-object v7, p0, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->image:Landroid/graphics/drawable/Drawable;

    int-to-float v8, v2

    int-to-float v9, v5

    mul-float/2addr v9, v6

    add-float/2addr v8, v9

    float-to-int v8, v8

    int-to-float v9, v3

    int-to-float v10, v4

    mul-float/2addr v10, v6

    add-float/2addr v9, v10

    float-to-int v9, v9

    invoke-virtual {v7, v2, v3, v8, v9}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 60
    iget-object v7, p0, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->image:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 62
    .end local v0    # "btnHeight":I
    .end local v1    # "btnWidth":I
    .end local v2    # "dx":I
    .end local v3    # "dy":I
    .end local v4    # "imgHeight":I
    .end local v5    # "imgWidth":I
    .end local v6    # "scale":F
    :cond_0
    return-void

    .line 50
    .restart local v0    # "btnHeight":I
    .restart local v1    # "btnWidth":I
    .restart local v4    # "imgHeight":I
    .restart local v5    # "imgWidth":I
    :cond_1
    int-to-float v7, v1

    int-to-float v8, v5

    div-float/2addr v7, v8

    int-to-float v8, v0

    int-to-float v9, v4

    div-float/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v6

    .restart local v6    # "scale":F
    goto :goto_0
.end method
