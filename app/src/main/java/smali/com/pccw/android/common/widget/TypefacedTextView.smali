.class public Lcom/pccw/android/common/widget/TypefacedTextView;
.super Landroid/widget/TextView;
.source "TypefacedTextView.java"

# interfaces
.implements Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;


# instance fields
.field private crossFadeAnimation:Lcom/pccw/android/common/widget/CrossFadeAnimation;

.field private textUpdate:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/pccw/android/common/widget/TypefacedTextView;->textUpdate:Ljava/lang/String;

    .line 22
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/TypefacedTextView;->isInEditMode()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 41
    :goto_0
    return-void

    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    .local v0, "fontName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string/jumbo v4, "Roboto-Bold.ttf"

    invoke-static {v3, v4}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 28
    .local v2, "typeface":Landroid/graphics/Typeface;
    new-instance v3, Lcom/pccw/android/common/widget/CrossFadeAnimation;

    invoke-direct {v3, p1, p0, p0}, Lcom/pccw/android/common/widget/CrossFadeAnimation;-><init>(Landroid/content/Context;Landroid/view/View;Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;)V

    iput-object v3, p0, Lcom/pccw/android/common/widget/TypefacedTextView;->crossFadeAnimation:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    .line 30
    if-eqz p2, :cond_1

    .line 31
    sget-object v3, Lcom/pccw/mobile/sip02/R$styleable;->TypefacedTextView:[I

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 32
    .local v1, "styledAttrs":Landroid/content/res/TypedArray;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 33
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 35
    .end local v1    # "styledAttrs":Landroid/content/res/TypedArray;
    :cond_1
    if-eqz v0, :cond_2

    .line 36
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-static {v3, v0}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    .line 39
    :cond_2
    invoke-virtual {p0, v2}, Lcom/pccw/android/common/widget/TypefacedTextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_0
.end method


# virtual methods
.method public animationEnds()V
    .locals 0

    .prologue
    .line 54
    return-void
.end method

.method public textUpdate(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/TypefacedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    iput-object p1, p0, Lcom/pccw/android/common/widget/TypefacedTextView;->textUpdate:Ljava/lang/String;

    .line 46
    iget-object v0, p0, Lcom/pccw/android/common/widget/TypefacedTextView;->crossFadeAnimation:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    invoke-virtual {v0}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeOut()V

    .line 47
    iget-object v0, p0, Lcom/pccw/android/common/widget/TypefacedTextView;->textUpdate:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    :cond_0
    return-void
.end method
