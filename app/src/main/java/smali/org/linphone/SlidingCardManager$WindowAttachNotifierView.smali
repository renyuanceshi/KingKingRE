.class public Lorg/linphone/SlidingCardManager$WindowAttachNotifierView;
.super Landroid/view/View;
.source "SlidingCardManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/SlidingCardManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WindowAttachNotifierView"
.end annotation


# instance fields
.field private mSlidingCardManager:Lorg/linphone/SlidingCardManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 642
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 643
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 2

    .prologue
    .line 655
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 675
    invoke-virtual {p0}, Lorg/linphone/SlidingCardManager$WindowAttachNotifierView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 679
    .local v0, "viewTreeObserver":Landroid/view/ViewTreeObserver;
    iget-object v1, p0, Lorg/linphone/SlidingCardManager$WindowAttachNotifierView;->mSlidingCardManager:Lorg/linphone/SlidingCardManager;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 682
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 690
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 694
    return-void
.end method

.method public setSlidingCardManager(Lorg/linphone/SlidingCardManager;)V
    .locals 0
    .param p1, "slidingCardManager"    # Lorg/linphone/SlidingCardManager;

    .prologue
    .line 646
    iput-object p1, p0, Lorg/linphone/SlidingCardManager$WindowAttachNotifierView;->mSlidingCardManager:Lorg/linphone/SlidingCardManager;

    .line 647
    return-void
.end method
