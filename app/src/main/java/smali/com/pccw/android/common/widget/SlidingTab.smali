.class public Lcom/pccw/android/common/widget/SlidingTab;
.super Landroid/view/ViewGroup;
.source "SlidingTab.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/android/common/widget/SlidingTab$Slider;,
        Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;
    }
.end annotation


# static fields
.field private static final ANIM_DURATION:I = 0xfa

.field private static final ANIM_TARGET_TIME:I = 0x1f4

.field private static final DBG:Z = false

.field private static final HORIZONTAL:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field private static final THRESHOLD:F = 0.6666667f

.field private static final TRACKING_MARGIN:I = 0x32

.field private static final VERTICAL:I = 0x1

.field private static final VIBRATE_LONG:J = 0x28L

.field private static final VIBRATE_SHORT:J = 0x1eL

.field public static btnAcceptCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

.field public static btnAcceptVideoAnimation:Landroid/graphics/drawable/AnimationDrawable;

.field public static btnRejectCallAnimation:Landroid/graphics/drawable/AnimationDrawable;


# instance fields
.field private mAnimating:Z

.field private final mAnimationDoneListener:Landroid/view/animation/Animation$AnimationListener;

.field private mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

.field private mDensity:F

.field private mGrabbedState:I

.field private mHoldLeftOnTransition:Z

.field private mHoldRightOnTransition:Z

.field private mHoldVideoOnTransition:Z

.field private mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

.field private mOnTriggerListener:Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;

.field private mOrientation:I

.field private mOtherSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

.field private mOtherSlider2:Lcom/pccw/android/common/widget/SlidingTab$Slider;

.field private mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

.field private mThreshold:F

.field private mTmpRect:Landroid/graphics/Rect;

.field private mTracking:Z

.field private mTriggered:Z

.field private mVibrator:Landroid/os/Vibrator;

.field private mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 470
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/pccw/android/common/widget/SlidingTab;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 471
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const v2, 0x7f020486

    const v3, 0x7f020480

    const v4, 0x7f02048d

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 477
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 57
    iput-boolean v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mHoldLeftOnTransition:Z

    .line 58
    iput-boolean v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mHoldRightOnTransition:Z

    .line 59
    iput-boolean v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mHoldVideoOnTransition:Z

    .line 62
    iput v1, p0, Lcom/pccw/android/common/widget/SlidingTab;->mGrabbedState:I

    .line 63
    iput-boolean v1, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTriggered:Z

    .line 89
    new-instance v0, Lcom/pccw/android/common/widget/SlidingTab$1;

    invoke-direct {v0, p0}, Lcom/pccw/android/common/widget/SlidingTab$1;-><init>(Lcom/pccw/android/common/widget/SlidingTab;)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mAnimationDoneListener:Landroid/view/animation/Animation$AnimationListener;

    .line 480
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTmpRect:Landroid/graphics/Rect;

    .line 482
    sget-object v0, Lcom/pccw/mobile/sip02/R$styleable;->SlidingDrawerEx:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v11

    .line 483
    .local v11, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v11, v1, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOrientation:I

    .line 484
    invoke-virtual {v11}, Landroid/content/res/TypedArray;->recycle()V

    .line 486
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/SlidingTab;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    .line 487
    .local v12, "r":Landroid/content/res/Resources;
    invoke-virtual {v12}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mDensity:F

    .line 491
    new-instance v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;

    const v5, 0x7f020061

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;-><init>(Landroid/view/ViewGroup;IIII)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 493
    new-instance v5, Lcom/pccw/android/common/widget/SlidingTab$Slider;

    const v7, 0x7f02048a

    const v8, 0x7f020484

    const v10, 0x7f02007c

    move-object v6, p0

    move v9, v4

    invoke-direct/range {v5 .. v10}, Lcom/pccw/android/common/widget/SlidingTab$Slider;-><init>(Landroid/view/ViewGroup;IIII)V

    iput-object v5, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 495
    new-instance v0, Lcom/pccw/android/common/widget/SlidingTab$Slider;

    const v5, 0x7f020062

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;-><init>(Landroid/view/ViewGroup;IIII)V

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 499
    return-void
.end method

.method static synthetic access$000(Lcom/pccw/android/common/widget/SlidingTab;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->onAnimationDone()V

    return-void
.end method

.method static synthetic access$202(Lcom/pccw/android/common/widget/SlidingTab;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab;
    .param p1, "x1"    # Z

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/pccw/android/common/widget/SlidingTab;->mAnimating:Z

    return p1
.end method

.method static synthetic access$300(Lcom/pccw/android/common/widget/SlidingTab;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->resetView()V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/android/common/widget/SlidingTab;)Landroid/view/animation/Animation$AnimationListener;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mAnimationDoneListener:Landroid/view/animation/Animation$AnimationListener;

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/android/common/widget/SlidingTab;)Lcom/pccw/android/common/widget/SlidingTab$Slider;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    return-object v0
.end method

.method static synthetic access$600(Lcom/pccw/android/common/widget/SlidingTab;)Lcom/pccw/android/common/widget/SlidingTab$Slider;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    return-object v0
.end method

.method static synthetic access$700(Lcom/pccw/android/common/widget/SlidingTab;)Lcom/pccw/android/common/widget/SlidingTab$Slider;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/android/common/widget/SlidingTab;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    return-object v0
.end method

.method private dispatchTriggerEvent(I)V
    .locals 2
    .param p1, "whichHandle"    # I

    .prologue
    .line 976
    const-wide/16 v0, 0x28

    invoke-direct {p0, v0, v1}, Lcom/pccw/android/common/widget/SlidingTab;->vibrate(J)V

    .line 977
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOnTriggerListener:Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;

    if-eqz v0, :cond_0

    .line 978
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOnTriggerListener:Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;

    invoke-interface {v0, p0, p1}, Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;->onTrigger(Landroid/view/View;I)V

    .line 980
    :cond_0
    return-void
.end method

.method private getRelativeLeft(Landroid/view/View;)I
    .locals 2
    .param p1, "myView"    # Landroid/view/View;

    .prologue
    .line 788
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 789
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 791
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/pccw/android/common/widget/SlidingTab;->getRelativeLeft(Landroid/view/View;)I

    move-result v0

    add-int/2addr v0, v1

    goto :goto_0
.end method

.method private isHorizontal()Z
    .locals 1

    .prologue
    .line 795
    iget v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOrientation:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 998
    return-void
.end method

.method private moveHandle(FF)V
    .locals 6
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 836
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-static {v4}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v3

    .line 837
    .local v3, "handle":Landroid/view/View;
    iget-object v4, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-static {v4}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$800(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/TextView;

    move-result-object v0

    .line 838
    .local v0, "content":Landroid/view/View;
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 839
    float-to-int v4, p1

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    sub-int v1, v4, v5

    .line 846
    .local v1, "deltaX":I
    invoke-virtual {v3, v1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 847
    invoke-virtual {v0, v1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 853
    .end local v1    # "deltaX":I
    :goto_0
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/SlidingTab;->invalidate()V

    .line 855
    return-void

    .line 849
    :cond_0
    float-to-int v4, p2

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    sub-int v2, v4, v5

    .line 850
    .local v2, "deltaY":I
    invoke-virtual {v3, v2}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 851
    invoke-virtual {v0, v2}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_0
.end method

.method private onAnimationDone()V
    .locals 1

    .prologue
    .line 778
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->resetView()V

    .line 779
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mAnimating:Z

    .line 780
    return-void
.end method

.method private resetView()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 799
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->reset(Z)V

    .line 800
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->reset(Z)V

    .line 801
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->reset(Z)V

    .line 804
    return-void
.end method

.method private setGrabbedState(I)V
    .locals 2
    .param p1, "newState"    # I

    .prologue
    .line 987
    iget v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mGrabbedState:I

    if-eq p1, v0, :cond_0

    .line 988
    iput p1, p0, Lcom/pccw/android/common/widget/SlidingTab;->mGrabbedState:I

    .line 989
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOnTriggerListener:Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;

    if-eqz v0, :cond_0

    .line 990
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOnTriggerListener:Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;

    iget v1, p0, Lcom/pccw/android/common/widget/SlidingTab;->mGrabbedState:I

    invoke-interface {v0, p0, v1}, Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;->onGrabbedStateChange(Landroid/view/View;I)V

    .line 993
    :cond_0
    return-void
.end method

.method private declared-synchronized vibrate(J)V
    .locals 3
    .param p1, "duration"    # J

    .prologue
    .line 954
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVibrator:Landroid/os/Vibrator;

    if-nez v0, :cond_0

    .line 955
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/SlidingTab;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "vibrator"

    .line 956
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVibrator:Landroid/os/Vibrator;

    .line 958
    :cond_0
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVibrator:Landroid/os/Vibrator;

    invoke-virtual {v0, p1, p2}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 959
    monitor-exit p0

    return-void

    .line 954
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private withinView(FFLandroid/view/View;)Z
    .locals 1
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "view"    # Landroid/view/View;

    .prologue
    .line 783
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v0

    if-eqz v0, :cond_0

    const/high16 v0, 0x42480000    # 50.0f

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    invoke-virtual {p3}, Landroid/view/View;->getWidth()I

    move-result v0

    add-int/lit8 v0, v0, 0x32

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_1

    .line 784
    :cond_0
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v0

    if-nez v0, :cond_2

    const/high16 v0, -0x3db80000    # -50.0f

    cmpl-float v0, p2, v0

    if-lez v0, :cond_2

    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result v0

    add-int/lit8 v0, v0, 0x32

    int-to-float v0, v0

    cmpg-float v0, p2, v0

    if-gez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    .line 783
    :goto_0
    return v0

    .line 784
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 536
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 537
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    .line 538
    .local v7, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    .line 540
    .local v8, "y":F
    iget-boolean v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mAnimating:Z

    if-eqz v9, :cond_0

    .line 541
    const/4 v9, 0x0

    .line 592
    :goto_0
    return v9

    .line 544
    :cond_0
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-static {v9}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v1

    .line 545
    .local v1, "leftHandle":Landroid/view/View;
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v9}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 546
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTmpRect:Landroid/graphics/Rect;

    float-to-int v10, v7

    float-to-int v11, v8

    invoke-virtual {v9, v10, v11}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    .line 548
    .local v2, "leftHit":Z
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-static {v9}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v3

    .line 549
    .local v3, "rightHandle":Landroid/view/View;
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v9}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 550
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTmpRect:Landroid/graphics/Rect;

    float-to-int v10, v7

    float-to-int v11, v8

    invoke-virtual {v9, v10, v11}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    .line 552
    .local v4, "rightHit":Z
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-static {v9}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v5

    .line 553
    .local v5, "videoHandle":Landroid/view/View;
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {v5, v9}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 554
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTmpRect:Landroid/graphics/Rect;

    float-to-int v10, v7

    float-to-int v11, v8

    invoke-virtual {v9, v10, v11}, Landroid/graphics/Rect;->contains(II)Z

    move-result v6

    .line 556
    .local v6, "videoHit":Z
    iget-boolean v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTracking:Z

    if-nez v9, :cond_1

    if-nez v2, :cond_1

    if-nez v4, :cond_1

    if-nez v6, :cond_1

    .line 557
    const/4 v9, 0x0

    goto :goto_0

    .line 560
    :cond_1
    packed-switch v0, :pswitch_data_0

    .line 592
    :goto_1
    const/4 v9, 0x1

    goto :goto_0

    .line 562
    :pswitch_0
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTracking:Z

    .line 563
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTriggered:Z

    .line 564
    const-wide/16 v10, 0x1e

    invoke-direct {p0, v10, v11}, Lcom/pccw/android/common/widget/SlidingTab;->vibrate(J)V

    .line 565
    if-eqz v2, :cond_3

    .line 566
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 567
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 568
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider2:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 569
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v9

    if-eqz v9, :cond_2

    const v9, 0x3f2aaaab

    :goto_2
    iput v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mThreshold:F

    .line 570
    const/4 v9, 0x1

    invoke-direct {p0, v9}, Lcom/pccw/android/common/widget/SlidingTab;->setGrabbedState(I)V

    .line 584
    :goto_3
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setState(I)V

    .line 585
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v9}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->showTarget()V

    .line 586
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v9}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->hide()V

    .line 587
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider2:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v9}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->hide()V

    goto :goto_1

    .line 569
    :cond_2
    const v9, 0x3eaaaaaa

    goto :goto_2

    .line 571
    :cond_3
    if-eqz v4, :cond_5

    .line 572
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 573
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 574
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider2:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 575
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v9

    if-eqz v9, :cond_4

    const v9, 0x3eaaaaaa

    :goto_4
    iput v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mThreshold:F

    .line 576
    const/4 v9, 0x2

    invoke-direct {p0, v9}, Lcom/pccw/android/common/widget/SlidingTab;->setGrabbedState(I)V

    goto :goto_3

    .line 575
    :cond_4
    const v9, 0x3f2aaaab

    goto :goto_4

    .line 578
    :cond_5
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 579
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 580
    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider2:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 581
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v9

    if-eqz v9, :cond_6

    const v9, 0x3f2aaaab

    :goto_5
    iput v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mThreshold:F

    .line 582
    const/4 v9, 0x3

    invoke-direct {p0, v9}, Lcom/pccw/android/common/widget/SlidingTab;->setGrabbedState(I)V

    goto :goto_3

    .line 581
    :cond_6
    const v9, 0x3eaaaaaa

    goto :goto_5

    .line 560
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 10
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/4 v9, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 808
    if-nez p1, :cond_0

    .line 833
    :goto_0
    return-void

    .line 813
    :cond_0
    sget-boolean v0, Lorg/linphone/LinphoneService;->ShowVideoSlidingTab:Z

    if-eqz v0, :cond_3

    invoke-static {}, Lorg/linphone/BandwidthManager;->isRoamSaveVideoEnable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 827
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v1

    if-eqz v1, :cond_1

    move v5, v6

    :goto_1
    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->layout(IIIII)V

    .line 828
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v1

    if-eqz v1, :cond_2

    move v5, v8

    :goto_2
    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->layout(IIIII)V

    goto :goto_0

    :cond_1
    move v5, v7

    .line 827
    goto :goto_1

    :cond_2
    move v5, v9

    .line 828
    goto :goto_2

    .line 830
    :cond_3
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v1

    if-eqz v1, :cond_4

    move v5, v8

    :goto_3
    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->layout(IIIII)V

    .line 831
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v1

    if-eqz v1, :cond_5

    move v5, v6

    :goto_4
    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    invoke-virtual/range {v0 .. v5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->layout(IIIII)V

    goto :goto_0

    :cond_4
    move v5, v9

    .line 830
    goto :goto_3

    :cond_5
    move v5, v7

    .line 831
    goto :goto_4
.end method

.method protected onMeasure(II)V
    .locals 13
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 503
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v10

    .line 504
    .local v10, "widthSpecMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v11

    .line 506
    .local v11, "widthSpecSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 507
    .local v1, "heightSpecMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 509
    .local v2, "heightSpecSize":I
    if-eqz v10, :cond_0

    if-nez v1, :cond_0

    .line 513
    :cond_0
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->measure()V

    .line 514
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->measure()V

    .line 515
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->measure()V

    .line 516
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->getTabWidth()I

    move-result v4

    .line 517
    .local v4, "leftTabWidth":I
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->getTabWidth()I

    move-result v6

    .line 518
    .local v6, "rightTabWidth":I
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->getTabWidth()I

    move-result v8

    .line 519
    .local v8, "videoTabWidth":I
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->getTabHeight()I

    move-result v3

    .line 520
    .local v3, "leftTabHeight":I
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->getTabHeight()I

    move-result v5

    .line 521
    .local v5, "rightTabHeight":I
    iget-object v12, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v12}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->getTabHeight()I

    move-result v7

    .line 524
    .local v7, "videoTabHeight":I
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 525
    add-int v12, v4, v6

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 526
    .local v9, "width":I
    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 531
    .local v0, "height":I
    :goto_0
    invoke-virtual {p0, v9, v0}, Lcom/pccw/android/common/widget/SlidingTab;->setMeasuredDimension(II)V

    .line 532
    return-void

    .line 528
    .end local v0    # "height":I
    .end local v9    # "width":I
    :cond_1
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 529
    .restart local v9    # "width":I
    add-int v12, v3, v5

    add-int/2addr v12, v7

    invoke-static {v2, v12}, Ljava/lang/Math;->max(II)I

    move-result v0

    .restart local v0    # "height":I
    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 11
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 620
    iget-boolean v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTracking:Z

    if-eqz v6, :cond_0

    .line 621
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 622
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    .line 623
    .local v4, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    .line 625
    .local v5, "y":F
    packed-switch v0, :pswitch_data_0

    .line 698
    .end local v0    # "action":I
    .end local v4    # "x":F
    .end local v5    # "y":F
    :cond_0
    :goto_0
    iget-boolean v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTracking:Z

    if-nez v6, :cond_1

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v6

    if-eqz v6, :cond_2

    :cond_1
    move v8, v7

    :cond_2
    return v8

    .line 627
    .restart local v0    # "action":I
    .restart local v4    # "x":F
    .restart local v5    # "y":F
    :pswitch_0
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 628
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6, v8}, Landroid/graphics/drawable/AnimationDrawable;->selectDrawable(I)Z

    .line 629
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnRejectCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 630
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnRejectCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6, v8}, Landroid/graphics/drawable/AnimationDrawable;->selectDrawable(I)Z

    .line 631
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptVideoAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 632
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptVideoAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6, v8}, Landroid/graphics/drawable/AnimationDrawable;->selectDrawable(I)Z

    goto :goto_0

    .line 635
    :pswitch_1
    invoke-direct {p0, v4, v5, p0}, Lcom/pccw/android/common/widget/SlidingTab;->withinView(FFLandroid/view/View;)Z

    move-result v6

    if-eqz v6, :cond_10

    .line 636
    invoke-direct {p0, v4, v5}, Lcom/pccw/android/common/widget/SlidingTab;->moveHandle(FF)V

    .line 637
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v6

    if-eqz v6, :cond_4

    move v1, v4

    .line 638
    .local v1, "position":F
    :goto_1
    iget v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mThreshold:F

    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {p0}, Lcom/pccw/android/common/widget/SlidingTab;->getWidth()I

    move-result v6

    :goto_2
    int-to-float v6, v6

    mul-float v2, v9, v6

    .line 640
    .local v2, "target":F
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 644
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    if-eq v6, v9, :cond_3

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    if-ne v6, v9, :cond_7

    :cond_3
    cmpl-float v6, v1, v2

    if-lez v6, :cond_6

    move v3, v7

    .line 653
    .local v3, "thresholdReached":Z
    :goto_3
    iget-boolean v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTriggered:Z

    if-nez v6, :cond_0

    if-eqz v3, :cond_0

    .line 654
    iput-boolean v7, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTriggered:Z

    .line 655
    iput-boolean v8, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTracking:Z

    .line 656
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v6, v10}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setState(I)V

    .line 662
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    if-ne v6, v9, :cond_e

    .line 663
    invoke-direct {p0, v7}, Lcom/pccw/android/common/widget/SlidingTab;->dispatchTriggerEvent(I)V

    .line 672
    :goto_4
    invoke-direct {p0, v8}, Lcom/pccw/android/common/widget/SlidingTab;->setGrabbedState(I)V

    goto :goto_0

    .end local v1    # "position":F
    .end local v2    # "target":F
    .end local v3    # "thresholdReached":Z
    :cond_4
    move v1, v5

    .line 637
    goto :goto_1

    .line 638
    .restart local v1    # "position":F
    :cond_5
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/SlidingTab;->getHeight()I

    move-result v6

    goto :goto_2

    .restart local v2    # "target":F
    :cond_6
    move v3, v8

    .line 644
    goto :goto_3

    :cond_7
    cmpg-float v6, v1, v2

    if-gez v6, :cond_8

    move v3, v7

    goto :goto_3

    :cond_8
    move v3, v8

    goto :goto_3

    .line 649
    :cond_9
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    if-eq v6, v9, :cond_a

    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    if-ne v6, v9, :cond_c

    :cond_a
    cmpg-float v6, v1, v2

    if-gez v6, :cond_b

    move v3, v7

    .restart local v3    # "thresholdReached":Z
    :goto_5
    goto :goto_3

    .end local v3    # "thresholdReached":Z
    :cond_b
    move v3, v8

    goto :goto_5

    :cond_c
    cmpl-float v6, v1, v2

    if-lez v6, :cond_d

    move v3, v7

    goto :goto_5

    :cond_d
    move v3, v8

    goto :goto_5

    .line 664
    .restart local v3    # "thresholdReached":Z
    :cond_e
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    iget-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    if-ne v6, v9, :cond_f

    .line 665
    invoke-direct {p0, v10}, Lcom/pccw/android/common/widget/SlidingTab;->dispatchTriggerEvent(I)V

    goto :goto_4

    .line 667
    :cond_f
    const/4 v6, 0x3

    invoke-direct {p0, v6}, Lcom/pccw/android/common/widget/SlidingTab;->dispatchTriggerEvent(I)V

    goto :goto_4

    .line 681
    .end local v1    # "position":F
    .end local v2    # "target":F
    .end local v3    # "thresholdReached":Z
    :cond_10
    :pswitch_2
    iput-boolean v8, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTracking:Z

    .line 682
    iput-boolean v8, p0, Lcom/pccw/android/common/widget/SlidingTab;->mTriggered:Z

    .line 683
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v6, v7}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->show(Z)V

    .line 684
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider2:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v6, v7}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->show(Z)V

    .line 685
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v6, v8}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->reset(Z)V

    .line 686
    iget-object v6, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v6}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->hideTarget()V

    .line 687
    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 688
    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 689
    iput-object v9, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider2:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 690
    invoke-direct {p0, v8}, Lcom/pccw/android/common/widget/SlidingTab;->setGrabbedState(I)V

    .line 691
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 692
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnRejectCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 693
    sget-object v6, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptVideoAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    goto/16 :goto_0

    .line 625
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public reset(Z)V
    .locals 1
    .param p1, "animate"    # Z

    .prologue
    .line 602
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->reset(Z)V

    .line 603
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->reset(Z)V

    .line 604
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->reset(Z)V

    .line 605
    return-void
.end method

.method public setHoldAfterTrigger(ZZZ)V
    .locals 0
    .param p1, "holdLeft"    # Z
    .param p2, "holdRight"    # Z
    .param p3, "holdVideo"    # Z

    .prologue
    .line 945
    iput-boolean p1, p0, Lcom/pccw/android/common/widget/SlidingTab;->mHoldLeftOnTransition:Z

    .line 946
    iput-boolean p2, p0, Lcom/pccw/android/common/widget/SlidingTab;->mHoldRightOnTransition:Z

    .line 947
    iput-boolean p3, p0, Lcom/pccw/android/common/widget/SlidingTab;->mHoldVideoOnTransition:Z

    .line 948
    return-void
.end method

.method public setLeftHintText(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 881
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 882
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setHintText(I)V

    .line 884
    :cond_0
    return-void
.end method

.method public setLeftTabResources(IIIII)V
    .locals 1
    .param p1, "iconId"    # I
    .param p2, "targetId"    # I
    .param p3, "barId"    # I
    .param p4, "tabId"    # I
    .param p5, "aniId"    # I

    .prologue
    .line 867
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setIcon(I)V

    .line 868
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p2}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setTarget(I)V

    .line 869
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p3}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setBarBackgroundResource(I)V

    .line 870
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p4}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setTabBackgroundResource(I)V

    .line 871
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setAnimationResource(I)V

    .line 872
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mLeftSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->updateDrawableStates()V

    .line 873
    return-void
.end method

.method public setOnTriggerListener(Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;

    .prologue
    .line 967
    iput-object p1, p0, Lcom/pccw/android/common/widget/SlidingTab;->mOnTriggerListener:Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;

    .line 968
    return-void
.end method

.method public setRightHintText(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 910
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 911
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setHintText(I)V

    .line 913
    :cond_0
    return-void
.end method

.method public setRightTabResources(IIIII)V
    .locals 1
    .param p1, "iconId"    # I
    .param p2, "targetId"    # I
    .param p3, "barId"    # I
    .param p4, "tabId"    # I
    .param p5, "aniId"    # I

    .prologue
    .line 896
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setIcon(I)V

    .line 897
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p2}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setTarget(I)V

    .line 898
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p3}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setBarBackgroundResource(I)V

    .line 899
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p4}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setTabBackgroundResource(I)V

    .line 900
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setAnimationResource(I)V

    .line 901
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->updateDrawableStates()V

    .line 902
    return-void
.end method

.method public setVideoHintText(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 939
    invoke-direct {p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 940
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setHintText(I)V

    .line 942
    :cond_0
    return-void
.end method

.method public setVideoTabResources(IIIII)V
    .locals 1
    .param p1, "iconId"    # I
    .param p2, "targetId"    # I
    .param p3, "barId"    # I
    .param p4, "tabId"    # I
    .param p5, "aniId"    # I

    .prologue
    .line 925
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setIcon(I)V

    .line 926
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p2}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setTarget(I)V

    .line 927
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p3}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setBarBackgroundResource(I)V

    .line 928
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p4}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setTabBackgroundResource(I)V

    .line 929
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0, p5}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->setAnimationResource(I)V

    .line 930
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab;->mVideoSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    invoke-virtual {v0}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->updateDrawableStates()V

    .line 931
    return-void
.end method

.method public setVisibility(I)V
    .locals 1
    .param p1, "visibility"    # I

    .prologue
    .line 611
    invoke-virtual {p0}, Lcom/pccw/android/common/widget/SlidingTab;->getVisibility()I

    move-result v0

    if-eq p1, v0, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/16 v0, 0x8

    if-ne p1, v0, :cond_1

    .line 613
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/pccw/android/common/widget/SlidingTab;->reset(Z)V

    .line 615
    :cond_1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 616
    return-void
.end method

.method startAnimating(Z)V
    .locals 26
    .param p1, "holdAfter"    # Z

    .prologue
    .line 702
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/pccw/android/common/widget/SlidingTab;->mAnimating:Z

    .line 705
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/pccw/android/common/widget/SlidingTab;->mCurrentSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 706
    .local v15, "slider":Lcom/pccw/android/common/widget/SlidingTab$Slider;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 707
    .local v12, "other":Lcom/pccw/android/common/widget/SlidingTab$Slider;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/android/common/widget/SlidingTab;->mOtherSlider2:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    .line 710
    .local v13, "other2":Lcom/pccw/android/common/widget/SlidingTab$Slider;
    invoke-direct/range {p0 .. p0}, Lcom/pccw/android/common/widget/SlidingTab;->isHorizontal()Z

    move-result v22

    if-eqz v22, :cond_2

    .line 711
    invoke-static {v15}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getRight()I

    move-result v14

    .line 712
    .local v14, "right":I
    invoke-static {v15}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getWidth()I

    move-result v21

    .line 713
    .local v21, "width":I
    invoke-static {v15}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getLeft()I

    move-result v11

    .line 714
    .local v11, "left":I
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/android/common/widget/SlidingTab;->getWidth()I

    move-result v20

    .line 715
    .local v20, "viewWidth":I
    if-eqz p1, :cond_0

    const/4 v10, 0x0

    .line 717
    .local v10, "holdOffset":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    if-ne v15, v0, :cond_1

    add-int v22, v14, v20

    sub-int v22, v22, v10

    move/from16 v0, v22

    neg-int v7, v0

    .line 719
    .local v7, "dx":I
    :goto_1
    const/4 v8, 0x0

    .line 731
    .end local v11    # "left":I
    .end local v14    # "right":I
    .end local v20    # "viewWidth":I
    .end local v21    # "width":I
    .local v8, "dy":I
    :goto_2
    new-instance v17, Landroid/view/animation/TranslateAnimation;

    const/16 v22, 0x0

    int-to-float v0, v7

    move/from16 v23, v0

    const/16 v24, 0x0

    int-to-float v0, v8

    move/from16 v25, v0

    move-object/from16 v0, v17

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 732
    .local v17, "trans1":Landroid/view/animation/Animation;
    const-wide/16 v22, 0xfa

    move-object/from16 v0, v17

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 733
    new-instance v22, Landroid/view/animation/LinearInterpolator;

    invoke-direct/range {v22 .. v22}, Landroid/view/animation/LinearInterpolator;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 734
    const/16 v22, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 735
    new-instance v18, Landroid/view/animation/TranslateAnimation;

    const/16 v22, 0x0

    int-to-float v0, v7

    move/from16 v23, v0

    const/16 v24, 0x0

    int-to-float v0, v8

    move/from16 v25, v0

    move-object/from16 v0, v18

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 736
    .local v18, "trans2":Landroid/view/animation/Animation;
    const-wide/16 v22, 0xfa

    move-object/from16 v0, v18

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 737
    new-instance v22, Landroid/view/animation/LinearInterpolator;

    invoke-direct/range {v22 .. v22}, Landroid/view/animation/LinearInterpolator;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 738
    const/16 v22, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 740
    new-instance v22, Lcom/pccw/android/common/widget/SlidingTab$2;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move/from16 v2, p1

    invoke-direct {v0, v1, v2, v7, v8}, Lcom/pccw/android/common/widget/SlidingTab$2;-><init>(Lcom/pccw/android/common/widget/SlidingTab;ZII)V

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 773
    invoke-virtual {v15}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->hideTarget()V

    .line 774
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v15, v0, v1}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->startAnimation(Landroid/view/animation/Animation;Landroid/view/animation/Animation;)V

    .line 775
    return-void

    .end local v7    # "dx":I
    .end local v8    # "dy":I
    .end local v10    # "holdOffset":I
    .end local v17    # "trans1":Landroid/view/animation/Animation;
    .end local v18    # "trans2":Landroid/view/animation/Animation;
    .restart local v11    # "left":I
    .restart local v14    # "right":I
    .restart local v20    # "viewWidth":I
    .restart local v21    # "width":I
    :cond_0
    move/from16 v10, v21

    .line 715
    goto/16 :goto_0

    .line 717
    .restart local v10    # "holdOffset":I
    :cond_1
    sub-int v22, v20, v11

    add-int v22, v22, v20

    sub-int v7, v22, v10

    goto/16 :goto_1

    .line 721
    .end local v10    # "holdOffset":I
    .end local v11    # "left":I
    .end local v14    # "right":I
    .end local v20    # "viewWidth":I
    .end local v21    # "width":I
    :cond_2
    invoke-static {v15}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getTop()I

    move-result v16

    .line 722
    .local v16, "top":I
    invoke-static {v15}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getBottom()I

    move-result v6

    .line 723
    .local v6, "bottom":I
    invoke-static {v15}, Lcom/pccw/android/common/widget/SlidingTab$Slider;->access$100(Lcom/pccw/android/common/widget/SlidingTab$Slider;)Landroid/widget/ImageView;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/widget/ImageView;->getHeight()I

    move-result v9

    .line 724
    .local v9, "height":I
    invoke-virtual/range {p0 .. p0}, Lcom/pccw/android/common/widget/SlidingTab;->getHeight()I

    move-result v19

    .line 725
    .local v19, "viewHeight":I
    if-eqz p1, :cond_3

    const/4 v10, 0x0

    .line 727
    .restart local v10    # "holdOffset":I
    :goto_3
    const/4 v7, 0x0

    .line 728
    .restart local v7    # "dx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/android/common/widget/SlidingTab;->mRightSlider:Lcom/pccw/android/common/widget/SlidingTab$Slider;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    if-ne v15, v0, :cond_4

    add-int v22, v16, v19

    sub-int v8, v22, v10

    .restart local v8    # "dy":I
    :goto_4
    goto/16 :goto_2

    .end local v7    # "dx":I
    .end local v8    # "dy":I
    .end local v10    # "holdOffset":I
    :cond_3
    move v10, v9

    .line 725
    goto :goto_3

    .line 728
    .restart local v7    # "dx":I
    .restart local v10    # "holdOffset":I
    :cond_4
    sub-int v22, v19, v6

    add-int v22, v22, v19

    sub-int v22, v22, v10

    move/from16 v0, v22

    neg-int v8, v0

    goto :goto_4
.end method
