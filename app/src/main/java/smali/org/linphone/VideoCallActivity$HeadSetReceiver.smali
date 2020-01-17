.class Lorg/linphone/VideoCallActivity$HeadSetReceiver;
.super Landroid/content/BroadcastReceiver;
.source "VideoCallActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/VideoCallActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeadSetReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/VideoCallActivity;


# direct methods
.method private constructor <init>(Lorg/linphone/VideoCallActivity;)V
    .locals 0

    .prologue
    .line 1217
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$HeadSetReceiver;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/linphone/VideoCallActivity;Lorg/linphone/VideoCallActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/linphone/VideoCallActivity;
    .param p2, "x1"    # Lorg/linphone/VideoCallActivity$1;

    .prologue
    .line 1217
    invoke-direct {p0, p1}, Lorg/linphone/VideoCallActivity$HeadSetReceiver;-><init>(Lorg/linphone/VideoCallActivity;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, -0x1

    .line 1220
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1221
    const-string/jumbo v0, "state"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-nez v0, :cond_2

    .line 1223
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$HeadSetReceiver;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->routeAudioToSpeaker()V

    .line 1229
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$HeadSetReceiver;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->changeIconBackground()V

    .line 1231
    :cond_1
    return-void

    .line 1225
    :cond_2
    const-string/jumbo v0, "state"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 1227
    iget-object v0, p0, Lorg/linphone/VideoCallActivity$HeadSetReceiver;->this$0:Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->routeAudioToReceiver()V

    goto :goto_0
.end method
