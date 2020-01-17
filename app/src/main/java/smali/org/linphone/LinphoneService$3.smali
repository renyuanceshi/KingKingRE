.class Lorg/linphone/LinphoneService$3;
.super Ljava/lang/Object;
.source "LinphoneService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneService;->globalState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$GlobalState;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneService;

.field final synthetic val$lc:Lorg/linphone/core/LinphoneCore;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$state:Lorg/linphone/core/LinphoneCore$GlobalState;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$GlobalState;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 476
    iput-object p1, p0, Lorg/linphone/LinphoneService$3;->this$0:Lorg/linphone/LinphoneService;

    iput-object p2, p0, Lorg/linphone/LinphoneService$3;->val$lc:Lorg/linphone/core/LinphoneCore;

    iput-object p3, p0, Lorg/linphone/LinphoneService$3;->val$state:Lorg/linphone/core/LinphoneCore$GlobalState;

    iput-object p4, p0, Lorg/linphone/LinphoneService$3;->val$message:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 479
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/LinphoneService$3;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v2, p0, Lorg/linphone/LinphoneService$3;->val$state:Lorg/linphone/core/LinphoneCore$GlobalState;

    iget-object v3, p0, Lorg/linphone/LinphoneService$3;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3}, Lorg/linphone/InCallScreen;->globalState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$GlobalState;Ljava/lang/String;)V

    .line 481
    return-void
.end method
