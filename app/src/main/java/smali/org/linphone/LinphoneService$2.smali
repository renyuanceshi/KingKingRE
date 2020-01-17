.class Lorg/linphone/LinphoneService$2;
.super Ljava/lang/Object;
.source "LinphoneService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneService;->displayStatus(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneService;

.field final synthetic val$lc:Lorg/linphone/core/LinphoneCore;

.field final synthetic val$message:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 427
    iput-object p1, p0, Lorg/linphone/LinphoneService$2;->this$0:Lorg/linphone/LinphoneService;

    iput-object p2, p0, Lorg/linphone/LinphoneService$2;->val$lc:Lorg/linphone/core/LinphoneCore;

    iput-object p3, p0, Lorg/linphone/LinphoneService$2;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 429
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 431
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/LinphoneService$2;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v2, p0, Lorg/linphone/LinphoneService$2;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/linphone/InCallScreen;->displayStatus(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V

    .line 432
    :cond_0
    return-void
.end method
