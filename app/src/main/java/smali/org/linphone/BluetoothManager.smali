.class public Lorg/linphone/BluetoothManager;
.super Landroid/content/BroadcastReceiver;
.source "BluetoothManager.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v9, 0x0

    .line 27
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 29
    .local v0, "action":Ljava/lang/String;
    invoke-static {}, Lorg/linphone/LinphoneService;->instanceOrNull()Lorg/linphone/LinphoneService;

    move-result-object v4

    .line 31
    .local v4, "ls":Lorg/linphone/LinphoneService;
    const-string/jumbo v1, "android.media.SCO_AUDIO_STATE_CHANGED"

    .line 32
    .local v1, "actionScoConnected":Ljava/lang/String;
    const-string/jumbo v8, "android.bluetooth.device.action.ACL_DISCONNECTED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 36
    if-eqz v4, :cond_0

    .line 37
    invoke-virtual {v4}, Lorg/linphone/LinphoneService;->scoDisconnected()V

    .line 38
    invoke-virtual {v4}, Lorg/linphone/LinphoneService;->routeAudioToReceiver()V

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 40
    :cond_1
    const-string/jumbo v8, "android.bluetooth.device.action.ACL_CONNECTED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 47
    if-eqz v4, :cond_0

    .line 48
    invoke-virtual {v4}, Lorg/linphone/LinphoneService;->scoConnected()V

    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 51
    const-string/jumbo v8, "android.media.extra.SCO_AUDIO_STATE"

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v7

    .line 54
    .local v7, "state":I
    const/4 v8, 0x1

    if-ne v7, v8, :cond_3

    .line 55
    if-eqz v4, :cond_0

    goto :goto_0

    .line 58
    :cond_3
    if-nez v7, :cond_0

    .line 59
    if-eqz v4, :cond_0

    goto :goto_0

    .line 67
    .end local v7    # "state":I
    :cond_4
    const-string/jumbo v8, "android.bluetooth.adapter.action.CONNECTION_STATE_CHANGED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 68
    const-string/jumbo v8, "android.bluetooth.adapter.extra.CONNECTION_STATE"

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 73
    .local v3, "currentConnState":I
    if-eqz v4, :cond_0

    const/4 v8, 0x2

    if-ne v3, v8, :cond_0

    .line 74
    invoke-virtual {v4}, Lorg/linphone/LinphoneService;->startBluetooth()V

    .line 75
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v8

    if-eqz v8, :cond_5

    .line 76
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v8

    invoke-virtual {v8, v9}, Lorg/linphone/InCallScreen;->refreshAudioRouteActions(Z)V

    .line 77
    :cond_5
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 78
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v8

    invoke-virtual {v8, v9}, Lorg/linphone/VideoCallActivity;->refreshAudioRouteActions(Z)V

    goto :goto_0

    .line 80
    .end local v3    # "currentConnState":I
    :cond_6
    const-string/jumbo v8, "android.bluetooth.headset.profile.action.AUDIO_STATE_CHANGED"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 81
    const-string/jumbo v8, "android.bluetooth.profile.extra.STATE"

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 82
    .local v5, "newstate":I
    const-string/jumbo v8, "android.bluetooth.profile.extra.PREVIOUS_STATE"

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 87
    .local v6, "prestate":I
    const/16 v8, 0xc

    if-ne v6, v8, :cond_0

    const/16 v8, 0xa

    if-ne v5, v8, :cond_0

    .line 89
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    .line 90
    .local v2, "core":Lorg/linphone/core/LinphoneCore;
    if-eqz v2, :cond_0

    .line 91
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 92
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v8

    invoke-interface {v8}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v8

    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-ne v8, v9, :cond_0

    .line 93
    invoke-virtual {v4}, Lorg/linphone/LinphoneService;->fixBluetoothMediaButton()V

    goto/16 :goto_0
.end method
