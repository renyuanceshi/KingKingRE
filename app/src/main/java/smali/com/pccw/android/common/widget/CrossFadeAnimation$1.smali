.class Lcom/pccw/android/common/widget/CrossFadeAnimation$1;
.super Ljava/lang/Object;
.source "CrossFadeAnimation.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/android/common/widget/CrossFadeAnimation;->initializeAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/android/common/widget/CrossFadeAnimation;


# direct methods
.method constructor <init>(Lcom/pccw/android/common/widget/CrossFadeAnimation;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/android/common/widget/CrossFadeAnimation;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation$1;->this$0:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 71
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation$1;->this$0:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    invoke-static {v0}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->access$000(Lcom/pccw/android/common/widget/CrossFadeAnimation;)Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/pccw/android/common/widget/CrossFadeAnimation$CrossFadeAnimationListener;->animationEnds()V

    .line 67
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 62
    return-void
.end method
