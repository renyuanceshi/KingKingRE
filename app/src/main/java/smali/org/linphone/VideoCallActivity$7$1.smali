.class Lorg/linphone/VideoCallActivity$7$1;
.super Landroid/os/CountDownTimer;
.source "VideoCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity$7;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/VideoCallActivity$7;


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity$7;JJ)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/VideoCallActivity$7;
    .param p2, "x0"    # J
    .param p4, "x1"    # J

    .prologue
    .line 768
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$7$1;->this$1:Lorg/linphone/VideoCallActivity$7;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .prologue
    .line 773
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$7$1;->this$1:Lorg/linphone/VideoCallActivity$7;

    iget-object v0, v0, Lorg/linphone/VideoCallActivity$7;->this$0:Lorg/linphone/VideoCallActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/linphone/VideoCallActivity;->removeDialog(I)V

    .line 774
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$7$1;->this$1:Lorg/linphone/VideoCallActivity$7;

    iget-object v0, v0, Lorg/linphone/VideoCallActivity$7;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-static {v0}, Lorg/linphone/VideoCallActivity;->access$1200(Lorg/linphone/VideoCallActivity;)Landroid/os/CountDownTimer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 775
    return-void
.end method

.method public onTick(J)V
    .locals 0
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 770
    return-void
.end method
