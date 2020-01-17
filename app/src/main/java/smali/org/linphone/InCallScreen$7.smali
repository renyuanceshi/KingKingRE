.class Lorg/linphone/InCallScreen$7;
.super Ljava/lang/Object;
.source "InCallScreen.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->refreshAudioRouteActions(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen;

.field final synthetic val$isInit:Z


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen;Z)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 660
    iput-object p1, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    iput-boolean p2, p0, Lorg/linphone/InCallScreen$7;->val$isInit:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/16 v1, 0x8

    const/4 v2, 0x0

    .line 663
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    iget-boolean v0, v0, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    if-eqz v0, :cond_1

    .line 666
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$900(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ToggleButton;->setVisibility(I)V

    .line 667
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$1000(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setVisibility(I)V

    .line 668
    iget-boolean v0, p0, Lorg/linphone/InCallScreen$7;->val$isInit:Z

    if-nez v0, :cond_0

    .line 670
    const-wide/16 v0, 0xbb8

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 680
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$400(Lorg/linphone/InCallScreen;)V

    .line 699
    :goto_1
    return-void

    .line 685
    :cond_1
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$900(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setVisibility(I)V

    .line 686
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$1000(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ToggleButton;->setVisibility(I)V

    .line 687
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$1000(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 688
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$500(Lorg/linphone/InCallScreen;)V

    goto :goto_1

    .line 691
    :cond_2
    invoke-static {}, Lorg/linphone/core/Hacks;->needAudioPathRecovery()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 692
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$1100(Lorg/linphone/InCallScreen;)Landroid/media/AudioManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 693
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$1100(Lorg/linphone/InCallScreen;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    .line 696
    :cond_3
    iget-object v0, p0, Lorg/linphone/InCallScreen$7;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v0}, Lorg/linphone/InCallScreen;->access$600(Lorg/linphone/InCallScreen;)V

    goto :goto_1

    .line 671
    :catch_0
    move-exception v0

    goto :goto_0
.end method
