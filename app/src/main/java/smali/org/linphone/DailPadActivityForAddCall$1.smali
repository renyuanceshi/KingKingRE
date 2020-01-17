.class Lorg/linphone/DailPadActivityForAddCall$1;
.super Landroid/os/Handler;
.source "DailPadActivityForAddCall.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/DailPadActivityForAddCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivityForAddCall;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivityForAddCall;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivityForAddCall;

    .prologue
    .line 119
    iput-object p1, p0, Lorg/linphone/DailPadActivityForAddCall$1;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 121
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall$1;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-static {v0}, Lorg/linphone/DailPadActivityForAddCall;->access$000(Lorg/linphone/DailPadActivityForAddCall;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 122
    :try_start_0
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall$1;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-static {v0}, Lorg/linphone/DailPadActivityForAddCall;->access$100(Lorg/linphone/DailPadActivityForAddCall;)Landroid/media/ToneGenerator;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall$1;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    invoke-static {v0}, Lorg/linphone/DailPadActivityForAddCall;->access$100(Lorg/linphone/DailPadActivityForAddCall;)Landroid/media/ToneGenerator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/ToneGenerator;->stopTone()V

    .line 124
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivityForAddCall$1;->removeMessages(I)V

    .line 127
    monitor-exit v1

    .line 128
    return-void

    .line 127
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
