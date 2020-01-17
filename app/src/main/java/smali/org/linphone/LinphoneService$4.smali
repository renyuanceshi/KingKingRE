.class Lorg/linphone/LinphoneService$4;
.super Ljava/lang/Object;
.source "LinphoneService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneService;->registrationState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneProxyConfig;Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneService;

.field final synthetic val$cfg:Lorg/linphone/core/LinphoneProxyConfig;

.field final synthetic val$lc:Lorg/linphone/core/LinphoneCore;

.field final synthetic val$smessage:Ljava/lang/String;

.field final synthetic val$state:Lorg/linphone/core/LinphoneCore$RegistrationState;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneProxyConfig;Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 548
    iput-object p1, p0, Lorg/linphone/LinphoneService$4;->this$0:Lorg/linphone/LinphoneService;

    iput-object p2, p0, Lorg/linphone/LinphoneService$4;->val$lc:Lorg/linphone/core/LinphoneCore;

    iput-object p3, p0, Lorg/linphone/LinphoneService$4;->val$cfg:Lorg/linphone/core/LinphoneProxyConfig;

    iput-object p4, p0, Lorg/linphone/LinphoneService$4;->val$state:Lorg/linphone/core/LinphoneCore$RegistrationState;

    iput-object p5, p0, Lorg/linphone/LinphoneService$4;->val$smessage:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 553
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 554
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/LinphoneService$4;->val$lc:Lorg/linphone/core/LinphoneCore;

    iget-object v2, p0, Lorg/linphone/LinphoneService$4;->val$cfg:Lorg/linphone/core/LinphoneProxyConfig;

    iget-object v3, p0, Lorg/linphone/LinphoneService$4;->val$state:Lorg/linphone/core/LinphoneCore$RegistrationState;

    iget-object v4, p0, Lorg/linphone/LinphoneService$4;->val$smessage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/linphone/InCallScreen;->registrationState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneProxyConfig;Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V

    .line 556
    :cond_0
    return-void
.end method
