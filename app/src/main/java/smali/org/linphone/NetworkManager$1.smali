.class Lorg/linphone/NetworkManager$1;
.super Ljava/lang/Thread;
.source "NetworkManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/NetworkManager;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/NetworkManager;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lorg/linphone/NetworkManager;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/NetworkManager;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/linphone/NetworkManager$1;->this$0:Lorg/linphone/NetworkManager;

    iput-object p2, p0, Lorg/linphone/NetworkManager$1;->val$intent:Landroid/content/Intent;

    iput-object p3, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 48
    iget-object v6, p0, Lorg/linphone/NetworkManager$1;->val$intent:Landroid/content/Intent;

    const-string/jumbo v7, "networkInfo"

    .line 49
    invoke-virtual {v6, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/net/NetworkInfo;

    .line 57
    .local v3, "lNetworkInfo":Landroid/net/NetworkInfo;
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v6

    if-ne v6, v8, :cond_1

    .line 58
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v6

    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v6, v7}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 64
    iget-object v6, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-static {v6}, Lcom/pccw/pref/SSIDList;->getList(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v5

    .line 65
    .local v5, "ssidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v6, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-static {v6}, Lcom/pccw/mobile/util/SSIDUtil;->getCurrentSSID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 68
    .local v2, "currentSSID":Ljava/lang/String;
    const/4 v1, 0x0

    .line 73
    .local v1, "changeOfWifiAp":Z
    sget-object v6, Lorg/linphone/NetworkManager;->previousSSID:Ljava/lang/String;

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    sget-object v6, Lorg/linphone/NetworkManager;->previousSSID:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 74
    :cond_0
    sput-object v2, Lorg/linphone/NetworkManager;->previousSSID:Ljava/lang/String;

    .line 75
    const/4 v1, 0x1

    .line 80
    :goto_0
    if-eqz v1, :cond_1

    .line 81
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    iget-object v6, p0, Lorg/linphone/NetworkManager$1;->this$0:Lorg/linphone/NetworkManager;

    iget-object v7, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-static {v6, v7}, Lorg/linphone/NetworkManager;->access$000(Lorg/linphone/NetworkManager;Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 84
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    invoke-virtual {v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->isReLoginRunning()Z

    move-result v6

    if-nez v6, :cond_1

    .line 85
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    invoke-virtual {v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning()Z

    move-result v6

    if-nez v6, :cond_1

    .line 86
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget v6, v6, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    const/16 v7, -0x64

    if-ne v6, v7, :cond_1

    .line 87
    iget-object v6, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-static {v6, v8}, Lorg/linphone/DailPadActivity;->on(Landroid/content/Context;Z)V

    .line 88
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iput-boolean v8, v6, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    .line 89
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-object v7, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    .line 120
    .end local v1    # "changeOfWifiAp":Z
    .end local v2    # "currentSSID":Ljava/lang/String;
    .end local v5    # "ssidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_1
    :goto_1
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-object v7, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoStart(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 121
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getType()I

    move-result v6

    if-eq v6, v8, :cond_5

    .line 172
    :cond_2
    :goto_2
    return-void

    .line 77
    .restart local v1    # "changeOfWifiAp":Z
    .restart local v2    # "currentSSID":Ljava/lang/String;
    .restart local v5    # "ssidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_3
    sput-object v2, Lorg/linphone/NetworkManager;->previousSSID:Ljava/lang/String;

    goto :goto_0

    .line 108
    .end local v1    # "changeOfWifiAp":Z
    .end local v2    # "currentSSID":Ljava/lang/String;
    .end local v5    # "ssidList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_4
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v6

    sget-object v7, Landroid/net/NetworkInfo$State;->DISCONNECTED:Landroid/net/NetworkInfo$State;

    invoke-virtual {v6, v7}, Landroid/net/NetworkInfo$State;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 113
    const-string/jumbo v6, ""

    sput-object v6, Lorg/linphone/NetworkManager;->previousSSID:Ljava/lang/String;

    goto :goto_1

    .line 125
    :cond_5
    iget-object v6, p0, Lorg/linphone/NetworkManager$1;->val$intent:Landroid/content/Intent;

    const-string/jumbo v7, "noConnectivity"

    invoke-virtual {v6, v7, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 128
    .local v4, "lNoConnectivity":Ljava/lang/Boolean;
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_6

    .line 129
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v6

    sget-object v7, Landroid/net/NetworkInfo$State;->DISCONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v6, v7, :cond_a

    .line 135
    :cond_6
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 136
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v6

    invoke-virtual {v6}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6, v9}, Lorg/linphone/core/LinphoneCore;->setNetworkReachable(Z)V

    .line 137
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 138
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 141
    .local v0, "call":Lorg/linphone/core/LinphoneCall;
    if-eqz v0, :cond_7

    .line 142
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6, v0}, Lorg/linphone/core/LinphoneCore;->terminateCall(Lorg/linphone/core/LinphoneCall;)V

    .line 147
    .end local v0    # "call":Lorg/linphone/core/LinphoneCall;
    :cond_7
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-boolean v6, v6, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    if-eqz v6, :cond_8

    .line 150
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-object v7, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    goto :goto_2

    .line 151
    :cond_8
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-boolean v6, v6, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-eqz v6, :cond_9

    .line 154
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-object v7, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto :goto_2

    .line 156
    :cond_9
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-object v7, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_2

    .line 159
    :cond_a
    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v6

    sget-object v7, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v6, v7, :cond_2

    .line 160
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-object v7, p0, Lorg/linphone/NetworkManager$1;->val$context:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->isRoaming(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto/16 :goto_2
.end method
