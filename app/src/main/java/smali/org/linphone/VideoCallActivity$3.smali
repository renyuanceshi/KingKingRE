.class Lorg/linphone/VideoCallActivity$3;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->refreshAudioRouteActions(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/VideoCallActivity;

.field final synthetic val$isInit:Z


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 427
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    iput-boolean p2, p0, Lorg/linphone/VideoCallActivity$3;->val$isInit:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 430
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    iget-boolean v0, v0, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    if-eqz v0, :cond_1

    .line 433
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$600(Lorg/linphone/VideoCallActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 434
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$700(Lorg/linphone/VideoCallActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 435
    iget-boolean v0, p0, Lorg/linphone/VideoCallActivity$3;->val$isInit:Z

    if-nez v0, :cond_0

    .line 437
    const-wide/16 v0, 0xbb8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 447
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->routeAudioToBluetooth()V

    .line 459
    :goto_1
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->changeIconBackground()V

    .line 460
    return-void

    .line 452
    :cond_1
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$600(Lorg/linphone/VideoCallActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 453
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$700(Lorg/linphone/VideoCallActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 454
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$800(Lorg/linphone/VideoCallActivity;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 455
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->routeAudioToReceiver()V

    goto :goto_1

    .line 457
    :cond_2
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$3;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->routeAudioToSpeaker()V

    goto :goto_1

    .line 438
    :catch_0
    move-exception v0

    goto :goto_0
.end method
