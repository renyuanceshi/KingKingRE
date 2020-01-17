.class public Lcom/pccw/android/common/widget/CrossFadeAnimation;
.super Ljava/lang/Object;
.source "CrossFadeAnimation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;
    }
.end annotation


# static fields
.field private static final IS_ANIMATING_TAG_ID:I


# instance fields
.field private animation:Landroid/view/animation/AnimationSet;

.field private context:Landroid/content/Context;

.field private fadeAnimation:Landroid/view/animation/AlphaAnimation;

.field private listener:Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;

.field private mShortAnimationDuration:I

.field private translateAnimation:Landroid/view/animation/TranslateAnimation;

.field private view:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-string/jumbo v0, "isAnimating"

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    sput v0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->IS_ANIMATING_TAG_ID:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "listener"    # Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;

    .prologue
    const/4 v2, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeAnimation:Landroid/view/animation/AlphaAnimation;

    .line 16
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/high16 v1, -0x3e600000    # -20.0f

    invoke-direct {v0, v2, v2, v2, v1}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->translateAnimation:Landroid/view/animation/TranslateAnimation;

    .line 29
    iput-object p1, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->context:Landroid/content/Context;

    .line 30
    iput-object p2, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->view:Landroid/view/View;

    .line 31
    iput-object p3, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->listener:Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;

    .line 33
    invoke-direct {p0}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->initializeAnimation()V

    .line 34
    return-void
.end method

.method static synthetic access$000(Lcom/pccw/android/common/widget/CrossFadeAnimation;)Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/CrossFadeAnimation;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->listener:Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/pccw/android/common/widget/CrossFadeAnimation;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/android/common/widget/CrossFadeAnimation;
    .param p1, "x1"    # Z

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->setAnimatingFlag(Z)V

    return-void
.end method

.method private initializeAnimation()V
    .locals 7

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 38
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x10e0000

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->mShortAnimationDuration:I

    .line 39
    invoke-direct {p0, v5}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->setAnimatingFlag(Z)V

    .line 41
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeAnimation:Landroid/view/animation/AlphaAnimation;

    iget v1, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->mShortAnimationDuration:I

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    .line 42
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeAnimation:Landroid/view/animation/AlphaAnimation;

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 43
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0, v6}, Landroid/view/animation/AlphaAnimation;->setRepeatMode(I)V

    .line 44
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0, v4}, Landroid/view/animation/AlphaAnimation;->setRepeatCount(I)V

    .line 45
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0, v4}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 47
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->translateAnimation:Landroid/view/animation/TranslateAnimation;

    iget v1, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->mShortAnimationDuration:I

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 48
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->translateAnimation:Landroid/view/animation/TranslateAnimation;

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 49
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->translateAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v6}, Landroid/view/animation/TranslateAnimation;->setRepeatMode(I)V

    .line 50
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->translateAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v4}, Landroid/view/animation/TranslateAnimation;->setRepeatCount(I)V

    .line 51
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->translateAnimation:Landroid/view/animation/TranslateAnimation;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/TranslateAnimation;->setStartOffset(J)V

    .line 52
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->translateAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v4}, Landroid/view/animation/TranslateAnimation;->setFillAfter(Z)V

    .line 54
    new-instance v0, Landroid/view/animation/AnimationSet;

    invoke-direct {v0, v5}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->animation:Landroid/view/animation/AnimationSet;

    .line 55
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->animation:Landroid/view/animation/AnimationSet;

    iget-object v1, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeAnimation:Landroid/view/animation/AlphaAnimation;

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 56
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->animation:Landroid/view/animation/AnimationSet;

    iget-object v1, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->translateAnimation:Landroid/view/animation/TranslateAnimation;

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 57
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->animation:Landroid/view/animation/AnimationSet;

    invoke-virtual {v0, v5}, Landroid/view/animation/AnimationSet;->setRepeatCount(I)V

    .line 59
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->fadeAnimation:Landroid/view/animation/AlphaAnimation;

    new-instance v1, Lcom/pccw/android/common/widget/CrossFadeAnimation$1;

    invoke-direct {v1, p0}, Lcom/pccw/android/common/widget/CrossFadeAnimation$1;-><init>(Lcom/pccw/android/common/widget/CrossFadeAnimation;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 74
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->animation:Landroid/view/animation/AnimationSet;

    new-instance v1, Lcom/pccw/android/common/widget/CrossFadeAnimation$2;

    invoke-direct {v1, p0}, Lcom/pccw/android/common/widget/CrossFadeAnimation$2;-><init>(Lcom/pccw/android/common/widget/CrossFadeAnimation;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 87
    return-void
.end method

.method private isAnimating()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 90
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->view:Landroid/view/View;

    sget v2, Lcom/pccw/android/common/widget/CrossFadeAnimation;->IS_ANIMATING_TAG_ID:I

    invoke-virtual {v0, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setAnimatingFlag(Z)V
    .locals 3
    .param p1, "isAnimating"    # Z

    .prologue
    .line 94
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->view:Landroid/view/View;

    sget v1, Lcom/pccw/android/common/widget/CrossFadeAnimation;->IS_ANIMATING_TAG_ID:I

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 95
    return-void
.end method


# virtual methods
.method public fadeOut()V
    .locals 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->isAnimating()Z

    move-result v0

    if-nez v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->view:Landroid/view/View;

    iget-object v1, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation;->animation:Landroid/view/animation/AnimationSet;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 101
    :cond_0
    return-void
.end method
