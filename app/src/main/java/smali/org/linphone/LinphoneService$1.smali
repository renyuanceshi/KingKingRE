.class Lorg/linphone/LinphoneService$1;
.super Ljava/util/TimerTask;
.source "LinphoneService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private lastLoopTime:J

.field final synthetic this$0:Lorg/linphone/LinphoneService;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneService;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 273
    iput-object p1, p0, Lorg/linphone/LinphoneService$1;->this$0:Lorg/linphone/LinphoneService;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 300
    :try_start_0
    iget-object v1, p0, Lorg/linphone/LinphoneService$1;->this$0:Lorg/linphone/LinphoneService;

    invoke-static {v1}, Lorg/linphone/LinphoneService;->access$000(Lorg/linphone/LinphoneService;)Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->iterate()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 307
    :goto_0
    return-void

    .line 301
    :catch_0
    move-exception v0

    .line 304
    .local v0, "e":Ljava/lang/RuntimeException;
    iget-object v1, p0, Lorg/linphone/LinphoneService$1;->this$0:Lorg/linphone/LinphoneService;

    iget-object v1, v1, Lorg/linphone/LinphoneService;->mTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    goto :goto_0
.end method
