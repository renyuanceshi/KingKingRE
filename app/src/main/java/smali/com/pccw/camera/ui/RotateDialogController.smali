.class public Lcom/pccw/camera/ui/RotateDialogController;
.super Ljava/lang/Object;
.source "RotateDialogController.java"

# interfaces
.implements Lcom/pccw/camera/ui/Rotatable;


# static fields
.field private static final ANIM_DURATION:J = 0x96L

.field private static final TAG:Ljava/lang/String; = "RotateDialogController"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mDialogRootLayout:Landroid/view/View;

.field private mFadeInAnim:Landroid/view/animation/Animation;

.field private mFadeOutAnim:Landroid/view/animation/Animation;

.field private mLayoutResourceID:I

.field private mRotateDialog:Lcom/pccw/camera/ui/RotateLayout;

.field private mRotateDialogButton1:Landroid/widget/TextView;

.field private mRotateDialogButton2:Landroid/widget/TextView;

.field private mRotateDialogButtonLayout:Landroid/view/View;

.field private mRotateDialogSpinner:Landroid/widget/ProgressBar;

.field private mRotateDialogText:Landroid/widget/TextView;

.field private mRotateDialogTitle:Landroid/widget/TextView;

.field private mRotateDialogTitleLayout:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 0
    .param p1, "a"    # Landroid/app/Activity;
    .param p2, "layoutResource"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/pccw/camera/ui/RotateDialogController;->mActivity:Landroid/app/Activity;

    .line 37
    iput p2, p0, Lcom/pccw/camera/ui/RotateDialogController;->mLayoutResourceID:I

    .line 38
    return-void
.end method

.method private fadeInDialog()V
    .locals 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    iget-object v1, p0, Lcom/pccw/camera/ui/RotateDialogController;->mFadeInAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 84
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 85
    return-void
.end method

.method private fadeOutDialog()V
    .locals 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    iget-object v1, p0, Lcom/pccw/camera/ui/RotateDialogController;->mFadeOutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 79
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 80
    return-void
.end method

.method private inflateDialogLayout()V
    .locals 8

    .prologue
    const-wide/16 v6, 0x96

    .line 41
    iget-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    if-nez v3, :cond_0

    .line 42
    iget-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 43
    .local v1, "layoutRoot":Landroid/view/ViewGroup;
    iget-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 44
    .local v0, "inflater":Landroid/view/LayoutInflater;
    iget v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mLayoutResourceID:I

    invoke-virtual {v0, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 45
    .local v2, "v":Landroid/view/View;
    const v3, 0x7f0e01cd

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    .line 46
    const v3, 0x7f0e01ce

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/pccw/camera/ui/RotateLayout;

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialog:Lcom/pccw/camera/ui/RotateLayout;

    .line 47
    const v3, 0x7f0e01cf

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogTitleLayout:Landroid/view/View;

    .line 48
    const v3, 0x7f0e01d5

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButtonLayout:Landroid/view/View;

    .line 49
    const v3, 0x7f0e01d0

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogTitle:Landroid/widget/TextView;

    .line 50
    const v3, 0x7f0e01d3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogSpinner:Landroid/widget/ProgressBar;

    .line 51
    const v3, 0x7f0e01d4

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogText:Landroid/widget/TextView;

    .line 52
    const v3, 0x7f0e01d7

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    .line 53
    const v3, 0x7f0e01d6

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    .line 55
    iget-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mActivity:Landroid/app/Activity;

    const/high16 v4, 0x10a0000

    invoke-static {v3, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mFadeInAnim:Landroid/view/animation/Animation;

    .line 56
    iget-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mActivity:Landroid/app/Activity;

    const v4, 0x10a0001

    invoke-static {v3, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mFadeOutAnim:Landroid/view/animation/Animation;

    .line 57
    iget-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mFadeInAnim:Landroid/view/animation/Animation;

    invoke-virtual {v3, v6, v7}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 58
    iget-object v3, p0, Lcom/pccw/camera/ui/RotateDialogController;->mFadeOutAnim:Landroid/view/animation/Animation;

    invoke-virtual {v3, v6, v7}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 60
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    .end local v1    # "layoutRoot":Landroid/view/ViewGroup;
    .end local v2    # "v":Landroid/view/View;
    :cond_0
    return-void
.end method


# virtual methods
.method public dismissDialog()V
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mDialogRootLayout:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 89
    invoke-direct {p0}, Lcom/pccw/camera/ui/RotateDialogController;->fadeOutDialog()V

    .line 91
    :cond_0
    return-void
.end method

.method public resetRotateDialog()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 69
    invoke-direct {p0}, Lcom/pccw/camera/ui/RotateDialogController;->inflateDialogLayout()V

    .line 70
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogTitleLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 71
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogSpinner:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 72
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 73
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 74
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButtonLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 75
    return-void
.end method

.method public setOrientation(I)V
    .locals 1
    .param p1, "orientation"    # I

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/pccw/camera/ui/RotateDialogController;->inflateDialogLayout()V

    .line 65
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialog:Lcom/pccw/camera/ui/RotateLayout;

    invoke-virtual {v0, p1}, Lcom/pccw/camera/ui/RotateLayout;->setOrientation(I)V

    .line 66
    return-void
.end method

.method public showAlertDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "button1Text"    # Ljava/lang/String;
    .param p4, "r1"    # Ljava/lang/Runnable;
    .param p5, "button2Text"    # Ljava/lang/String;
    .param p6, "r2"    # Ljava/lang/Runnable;

    .prologue
    const/4 v2, 0x0

    .line 95
    invoke-virtual {p0}, Lcom/pccw/camera/ui/RotateDialogController;->resetRotateDialog()V

    .line 97
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogTitleLayout:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 100
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogText:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    if-eqz p3, :cond_0

    .line 103
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 105
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton1:Landroid/widget/TextView;

    new-instance v1, Lcom/pccw/camera/ui/RotateDialogController$1;

    invoke-direct {v1, p0, p4}, Lcom/pccw/camera/ui/RotateDialogController$1;-><init>(Lcom/pccw/camera/ui/RotateDialogController;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButtonLayout:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 115
    :cond_0
    if-eqz p5, :cond_1

    .line 116
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    invoke-virtual {v0, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 118
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButton2:Landroid/widget/TextView;

    new-instance v1, Lcom/pccw/camera/ui/RotateDialogController$2;

    invoke-direct {v1, p0, p6}, Lcom/pccw/camera/ui/RotateDialogController$2;-><init>(Lcom/pccw/camera/ui/RotateDialogController;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogButtonLayout:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 129
    :cond_1
    invoke-direct {p0}, Lcom/pccw/camera/ui/RotateDialogController;->fadeInDialog()V

    .line 130
    return-void
.end method

.method public showWaitingDialog(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 133
    invoke-virtual {p0}, Lcom/pccw/camera/ui/RotateDialogController;->resetRotateDialog()V

    .line 135
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 136
    iget-object v0, p0, Lcom/pccw/camera/ui/RotateDialogController;->mRotateDialogSpinner:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 138
    invoke-direct {p0}, Lcom/pccw/camera/ui/RotateDialogController;->fadeInDialog()V

    .line 139
    return-void
.end method
