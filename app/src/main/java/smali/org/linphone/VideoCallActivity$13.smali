.class Lorg/linphone/VideoCallActivity$13;
.super Ljava/util/TimerTask;
.source "VideoCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->initCallStatsRefresher()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/VideoCallActivity;


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 1307
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$13;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1310
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 1311
    .local v0, "call":Lorg/linphone/core/LinphoneCall;
    if-nez v0, :cond_0

    .line 1312
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$13;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1300(Lorg/linphone/VideoCallActivity;)Ljava/util/Timer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Timer;->cancel()V

    .line 1313
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$13;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1400(Lorg/linphone/VideoCallActivity;)Ljava/util/TimerTask;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/TimerTask;->cancel()Z

    .line 1363
    :goto_0
    return-void

    .line 1316
    :cond_0
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$13;->this$0:Lorg/linphone/VideoCallActivity;

    const v3, 0x7f0e01fa

    invoke-virtual {v2, v3}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1317
    .local v1, "viewStatText":Landroid/widget/TextView;
    if-nez v1, :cond_1

    .line 1318
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$13;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1300(Lorg/linphone/VideoCallActivity;)Ljava/util/Timer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Timer;->cancel()V

    .line 1319
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$13;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1400(Lorg/linphone/VideoCallActivity;)Ljava/util/TimerTask;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/TimerTask;->cancel()Z

    goto :goto_0

    .line 1323
    :cond_1
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$13;->this$0:Lorg/linphone/VideoCallActivity;

    iget-object v2, v2, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    new-instance v3, Lorg/linphone/VideoCallActivity$13$1;

    invoke-direct {v3, p0, v0, v1}, Lorg/linphone/VideoCallActivity$13$1;-><init>(Lorg/linphone/VideoCallActivity$13;Lorg/linphone/core/LinphoneCall;Landroid/widget/TextView;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
