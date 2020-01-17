.class Lcom/pccw/sms/ChatPageActivity$21;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->setFadingAnimation(ZLandroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/ChatPageActivity;

.field final synthetic val$isFading:Z


# direct methods
.method constructor <init>(Lcom/pccw/sms/ChatPageActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 1388
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$21;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iput-boolean p2, p0, Lcom/pccw/sms/ChatPageActivity$21;->val$isFading:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1400
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity$21;->val$isFading:Z

    if-eqz v0, :cond_1

    .line 1401
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$21;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$3200(Lcom/pccw/sms/ChatPageActivity;)Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1402
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$21;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$3200(Lcom/pccw/sms/ChatPageActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$21;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->removeListAnimation:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1403
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$21;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$3202(Lcom/pccw/sms/ChatPageActivity;Landroid/os/Handler;)Landroid/os/Handler;

    .line 1405
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$21;->this$0:Lcom/pccw/sms/ChatPageActivity;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$3202(Lcom/pccw/sms/ChatPageActivity;Landroid/os/Handler;)Landroid/os/Handler;

    .line 1406
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$21;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$3200(Lcom/pccw/sms/ChatPageActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$21;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->endAnimation:Ljava/lang/Runnable;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1408
    :cond_1
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1396
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 1392
    return-void
.end method
