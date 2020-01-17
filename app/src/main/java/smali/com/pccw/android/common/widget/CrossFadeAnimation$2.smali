.class Lcom/pccw/android/common/widget/CrossFadeAnimation$2;
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
    .line 74
    iput-object p1, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation$2;->this$0:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation$2;->this$0:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->access$100(Lcom/pccw/android/common/widget/CrossFadeAnimation;Z)V

    .line 77
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation$2;->this$0:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->access$100(Lcom/pccw/android/common/widget/CrossFadeAnimation;Z)V

    .line 81
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/pccw/android/common/widget/CrossFadeAnimation$2;->this$0:Lcom/pccw/android/common/widget/CrossFadeAnimation;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/pccw/android/common/widget/CrossFadeAnimation;->access$100(Lcom/pccw/android/common/widget/CrossFadeAnimation;Z)V

    .line 85
    return-void
.end method
