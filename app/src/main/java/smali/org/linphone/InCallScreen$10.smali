.class Lorg/linphone/InCallScreen$10;
.super Ljava/util/TimerTask;
.source "InCallScreen.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/InCallScreen;->configureQualityIndicator(Lorg/linphone/core/LinphoneCall;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/InCallScreen;

.field final synthetic val$call:Lorg/linphone/core/LinphoneCall;


# direct methods
.method constructor <init>(Lorg/linphone/InCallScreen;Lorg/linphone/core/LinphoneCall;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 1300
    iput-object p1, p0, Lorg/linphone/InCallScreen$10;->this$0:Lorg/linphone/InCallScreen;

    iput-object p2, p0, Lorg/linphone/InCallScreen$10;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1303
    iget-object v1, p0, Lorg/linphone/InCallScreen$10;->this$0:Lorg/linphone/InCallScreen;

    iget-boolean v1, v1, Lorg/linphone/InCallScreen;->shouldUpdateQualityIndicator:Z

    if-eqz v1, :cond_1

    .line 1304
    iget-object v1, p0, Lorg/linphone/InCallScreen$10;->val$call:Lorg/linphone/core/LinphoneCall;

    if-eqz v1, :cond_2

    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    iget-object v2, p0, Lorg/linphone/InCallScreen$10;->val$call:Lorg/linphone/core/LinphoneCall;

    .line 1305
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v2

    if-eq v1, v2, :cond_0

    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    iget-object v2, p0, Lorg/linphone/InCallScreen$10;->val$call:Lorg/linphone/core/LinphoneCall;

    .line 1306
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v2

    if-ne v1, v2, :cond_2

    .line 1309
    :cond_0
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 1310
    .local v0, "msg":Landroid/os/Message;
    const/4 v1, 0x6

    iput v1, v0, Landroid/os/Message;->what:I

    .line 1311
    iget-object v1, p0, Lorg/linphone/InCallScreen$10;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCall;->getCurrentQuality()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1312
    iget-object v1, p0, Lorg/linphone/InCallScreen$10;->this$0:Lorg/linphone/InCallScreen;

    iget-object v1, v1, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1318
    .end local v0    # "msg":Landroid/os/Message;
    :cond_1
    :goto_0
    return-void

    .line 1314
    :cond_2
    invoke-virtual {p0}, Lorg/linphone/InCallScreen$10;->cancel()Z

    goto :goto_0
.end method
