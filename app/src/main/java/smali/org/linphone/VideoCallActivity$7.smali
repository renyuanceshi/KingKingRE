.class Lorg/linphone/VideoCallActivity$7;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity;->onClick(Landroid/view/View;)V
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
    .line 764
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$7;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 766
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$7;->this$0:Lorg/linphone/VideoCallActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/linphone/VideoCallActivity;->showDialog(I)V

    .line 768
    iget-object v6, p0, Lorg/linphone/VideoCallActivity$7;->this$0:Lorg/linphone/VideoCallActivity;

    new-instance v0, Lorg/linphone/VideoCallActivity$7$1;

    const-wide/16 v2, 0x2710

    const-wide/16 v4, 0x3e8

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/linphone/VideoCallActivity$7$1;-><init>(Lorg/linphone/VideoCallActivity$7;JJ)V

    .line 776
    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity$7$1;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    .line 768
    invoke-static {v6, v0}, Lorg/linphone/VideoCallActivity;->access$1202(Lorg/linphone/VideoCallActivity;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;

    .line 777
    return-void
.end method
