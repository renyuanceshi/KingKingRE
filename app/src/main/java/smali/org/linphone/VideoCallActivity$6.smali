.class Lorg/linphone/VideoCallActivity$6;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/VideoCallActivity;
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
    .line 715
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$6;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 717
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 718
    .local v0, "lc":Lorg/linphone/core/LinphoneCore;
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$6;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1100(Lorg/linphone/VideoCallActivity;)Lorg/linphone/core/LinphoneCall;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v1

    .line 719
    .local v1, "params":Lorg/linphone/core/LinphoneCallParams;
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 720
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$6;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1100(Lorg/linphone/VideoCallActivity;)Lorg/linphone/core/LinphoneCall;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Lorg/linphone/core/LinphoneCore;->updateCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)I

    .line 721
    return-void
.end method
