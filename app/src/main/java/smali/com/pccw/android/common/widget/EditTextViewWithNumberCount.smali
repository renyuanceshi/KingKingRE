.class public Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;
.super Landroid/widget/RelativeLayout;
.source "EditTextViewWithNumberCount.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private input:Landroid/widget/EditText;

.field private isFieldValid:Z

.field private isMultiLined:Z

.field private maxWordCount:I

.field private mlistener:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;

.field private textCount:Landroid/widget/TextView;

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    .line 37
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    const/16 v2, 0xf

    iput v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->maxWordCount:I

    .line 28
    iput-boolean v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isMultiLined:Z

    .line 29
    iput-boolean v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isFieldValid:Z

    .line 30
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->mlistener:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;

    .line 39
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 56
    :goto_0
    return-void

    .line 43
    :cond_0
    iput-object p1, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->context:Landroid/content/Context;

    .line 44
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string/jumbo v3, "Roboto-Regular.ttf"

    invoke-static {v2, v3}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->typeface:Landroid/graphics/Typeface;

    .line 46
    if-eqz p2, :cond_1

    .line 47
    sget-object v2, Lcom/pccw/mobile/sip02/R$styleable;->EditTextViewWithNumberCount:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 48
    .local v1, "styledAttrs":Landroid/content/res/TypedArray;
    iget v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->maxWordCount:I

    invoke-virtual {v1, v4, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->maxWordCount:I

    .line 49
    const/4 v2, 0x1

    iget-boolean v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isMultiLined:Z

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isMultiLined:Z

    .line 50
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 53
    .end local v1    # "styledAttrs":Landroid/content/res/TypedArray;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08002d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v0, v2

    .line 54
    .local v0, "padding":I
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->setPadding(IIII)V

    .line 55
    invoke-direct {p0}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->init()V

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    .prologue
    .line 19
    iget v0, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->maxWordCount:I

    return v0
.end method

.method static synthetic access$100(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->textCount:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->mlistener:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;

    return-object v0
.end method

.method public static convertPixelsToDp(FLandroid/content/Context;)I
    .locals 5
    .param p0, "px"    # F
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 141
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 142
    .local v2, "resources":Landroid/content/res/Resources;
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 143
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    iget v3, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v3, v3

    const/high16 v4, 0x43200000    # 160.0f

    div-float/2addr v3, v4

    div-float v3, p0, v3

    float-to-int v0, v3

    .line 144
    .local v0, "dp":I
    return v0
.end method

.method private init()V
    .locals 9

    .prologue
    const/16 v8, 0xf

    const/4 v7, -0x2

    const/4 v6, 0x0

    .line 60
    new-instance v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->textCount:Landroid/widget/TextView;

    .line 61
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v7, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 62
    .local v0, "counterLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v0, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 63
    const/16 v3, 0xb

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 64
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->textCount:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0b0077

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->textCount:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 66
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->textCount:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 67
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->textCount:Landroid/widget/TextView;

    iget v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->maxWordCount:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    new-instance v3, Landroid/widget/EditText;

    iget-object v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    .line 70
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setBackgroundResource(I)V

    .line 71
    new-instance v2, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 72
    .local v2, "inputLayoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    invoke-virtual {v2, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 73
    const/16 v3, 0x9

    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 74
    const/high16 v3, 0x41c00000    # 24.0f

    iget-object v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->context:Landroid/content/Context;

    invoke-static {v3, v4}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->convertPixelsToDp(FLandroid/content/Context;)I

    move-result v3

    invoke-virtual {v2, v6, v6, v3, v6}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 75
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 77
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    invoke-virtual {p0, v3, v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->textCount:Landroid/widget/TextView;

    invoke-virtual {p0, v3, v0}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    const/4 v3, 0x1

    new-array v1, v3, [Landroid/text/InputFilter;

    .line 81
    .local v1, "fArray":[Landroid/text/InputFilter;
    new-instance v3, Landroid/text/InputFilter$LengthFilter;

    iget v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->maxWordCount:I

    invoke-direct {v3, v4}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v3, v1, v6

    .line 82
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    invoke-virtual {v3, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 83
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    iget-boolean v4, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isMultiLined:Z

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 84
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    new-instance v4, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;

    invoke-direct {v4, p0}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;-><init>(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 113
    return-void
.end method


# virtual methods
.method public addTextValidationListener(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;)V
    .locals 0
    .param p1, "watcher"    # Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->mlistener:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;

    .line 138
    return-void
.end method

.method public getMaxWordCount()I
    .locals 1

    .prologue
    .line 148
    iget v0, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->maxWordCount:I

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 124
    iget-object v1, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public isFieldValid()Z
    .locals 1

    .prologue
    .line 116
    iget-boolean v0, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isFieldValid:Z

    return v0
.end method

.method public setFieldValid(Z)V
    .locals 0
    .param p1, "isFieldValid"    # Z

    .prologue
    .line 120
    iput-boolean p1, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isFieldValid:Z

    .line 121
    return-void
.end method

.method public setMaxWordCount(I)V
    .locals 0
    .param p1, "count"    # I

    .prologue
    .line 152
    iput p1, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->maxWordCount:I

    .line 153
    return-void
.end method

.method public setSelection(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 133
    iget-object v0, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 134
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->input:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 130
    return-void
.end method
