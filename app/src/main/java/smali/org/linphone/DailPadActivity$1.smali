.class Lorg/linphone/DailPadActivity$1;
.super Landroid/os/Handler;
.source "DailPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/DailPadActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 171
    iput-object p1, p0, Lorg/linphone/DailPadActivity$1;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 173
    iget-object v0, p0, Lorg/linphone/DailPadActivity$1;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$000(Lorg/linphone/DailPadActivity;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 174
    :try_start_0
    iget-object v0, p0, Lorg/linphone/DailPadActivity$1;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$100(Lorg/linphone/DailPadActivity;)Landroid/media/ToneGenerator;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lorg/linphone/DailPadActivity$1;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$100(Lorg/linphone/DailPadActivity;)Landroid/media/ToneGenerator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/ToneGenerator;->stopTone()V

    .line 176
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity$1;->removeMessages(I)V

    .line 179
    monitor-exit v1

    .line 180
    return-void

    .line 179
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
