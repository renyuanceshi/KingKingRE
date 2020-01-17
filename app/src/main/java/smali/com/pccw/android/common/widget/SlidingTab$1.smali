.class Lcom/pccw/android/common/widget/SlidingTab$1;
.super Ljava/lang/Object;
.source "SlidingTab.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/android/common/widget/SlidingTab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/android/common/widget/SlidingTab;


# direct methods
.method constructor <init>(Lcom/pccw/android/common/widget/SlidingTab;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/android/common/widget/SlidingTab;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/pccw/android/common/widget/SlidingTab$1;->this$0:Lcom/pccw/android/common/widget/SlidingTab;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/pccw/android/common/widget/SlidingTab$1;->this$0:Lcom/pccw/android/common/widget/SlidingTab;

    invoke-static {v0}, Lcom/pccw/android/common/widget/SlidingTab;->access$000(Lcom/pccw/android/common/widget/SlidingTab;)V

    .line 100
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 96
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 92
    return-void
.end method
