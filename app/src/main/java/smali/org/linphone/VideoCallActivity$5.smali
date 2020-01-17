.class Lorg/linphone/VideoCallActivity$5;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mCurrentCall:Lorg/linphone/core/LinphoneCall;

.field final synthetic this$0:Lorg/linphone/VideoCallActivity;


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity;)V
    .locals 1
    .param p1, "this$0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 603
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$5;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 604
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/VideoCallActivity$5;->mCurrentCall:Lorg/linphone/core/LinphoneCall;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 607
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$5;->mCurrentCall:Lorg/linphone/core/LinphoneCall;

    if-nez v2, :cond_0

    .line 608
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$5;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2, v3}, Lorg/linphone/VideoCallActivity;->access$902(Lorg/linphone/VideoCallActivity;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 620
    :goto_0
    return-void

    .line 611
    :cond_0
    const/4 v1, 0x0

    .line 612
    .local v1, "oldQuality":I
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$5;->mCurrentCall:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getCurrentQuality()F

    move-result v0

    .line 613
    .local v0, "newQuality":F
    float-to-int v2, v0

    if-eq v2, v1, :cond_1

    .line 616
    :cond_1
    sget-boolean v2, Lorg/linphone/VideoCallActivity;->launched:Z

    if-eqz v2, :cond_2

    .line 617
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$5;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1000(Lorg/linphone/VideoCallActivity;)Landroid/os/Handler;

    move-result-object v2

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, p0, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 619
    :cond_2
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$5;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2, v3}, Lorg/linphone/VideoCallActivity;->access$902(Lorg/linphone/VideoCallActivity;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    goto :goto_0
.end method
