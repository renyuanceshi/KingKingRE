.class Lorg/linphone/InCallScreen$15;
.super Ljava/util/TimerTask;
.source "InCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->startConferenceCall(Lorg/linphone/core/LinphoneCall;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen;


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 1875
    iput-object p1, p0, Lorg/linphone/InCallScreen$15;->this$0:Lorg/linphone/InCallScreen;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1878
    iget-object v1, p0, Lorg/linphone/InCallScreen$15;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v1}, Lorg/linphone/InCallScreen;->access$1400(Lorg/linphone/InCallScreen;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1882
    :try_start_0
    iget-object v1, p0, Lorg/linphone/InCallScreen$15;->this$0:Lorg/linphone/InCallScreen;

    invoke-static {v1}, Lorg/linphone/InCallScreen;->access$1500(Lorg/linphone/InCallScreen;)Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->terminateAllCalls()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1890
    :cond_0
    :goto_0
    return-void

    .line 1883
    :catch_0
    move-exception v0

    .line 1887
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/linphone/InCallScreen$15;->this$0:Lorg/linphone/InCallScreen;

    invoke-virtual {v1}, Lorg/linphone/InCallScreen;->finish()V

    goto :goto_0
.end method
