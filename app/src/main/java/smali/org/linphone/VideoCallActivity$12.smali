.class Lorg/linphone/VideoCallActivity$12;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/VideoCallActivity;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity;I)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 1201
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$12;->this$0:Lorg/linphone/VideoCallActivity;

    iput p2, p0, Lorg/linphone/VideoCallActivity$12;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 1203
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$12;->this$0:Lorg/linphone/VideoCallActivity;

    iget v3, p0, Lorg/linphone/VideoCallActivity$12;->val$id:I

    invoke-virtual {v2, v3}, Lorg/linphone/VideoCallActivity;->removeDialog(I)V

    .line 1204
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$12;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1200(Lorg/linphone/VideoCallActivity;)Landroid/os/CountDownTimer;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/CountDownTimer;->cancel()V

    .line 1205
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 1206
    .local v0, "lc":Lorg/linphone/core/LinphoneCore;
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$12;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1100(Lorg/linphone/VideoCallActivity;)Lorg/linphone/core/LinphoneCall;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v1

    .line 1207
    .local v1, "params":Lorg/linphone/core/LinphoneCallParams;
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 1208
    iget-object v2, p0, Lorg/linphone/VideoCallActivity$12;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v2}, Lorg/linphone/VideoCallActivity;->access$1100(Lorg/linphone/VideoCallActivity;)Lorg/linphone/core/LinphoneCall;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Lorg/linphone/core/LinphoneCore;->updateCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)I

    .line 1209
    return-void
.end method
