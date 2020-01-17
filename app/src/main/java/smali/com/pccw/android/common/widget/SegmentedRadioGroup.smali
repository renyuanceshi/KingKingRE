.class public Lcom/pccw/android/common/widget/SegmentedRadioGroup;
.super Landroid/widget/RadioGroup;
.source "SegmentedRadioGroup.java"


# instance fields
.field context:Landroid/content/Context;

.field selector:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    .line 15
    iput-object p1, p0, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->context:Landroid/content/Context;

    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    iput-object p1, p0, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->context:Landroid/content/Context;

    .line 21
    return-void
.end method

.method private changeButtonsImages()V
    .locals 1

    .prologue
    .line 30
    invoke-super {p0}, Landroid/widget/RadioGroup;->getChildCount()I

    move-result v0

    .line 42
    .local v0, "childCount":I
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 0

    .prologue
    .line 25
    invoke-super {p0}, Landroid/widget/RadioGroup;->onFinishInflate()V

    .line 26
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->changeButtonsImages()V

    .line 27
    return-void
.end method
