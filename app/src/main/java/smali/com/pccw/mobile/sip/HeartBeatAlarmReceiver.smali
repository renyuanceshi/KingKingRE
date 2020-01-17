.class public Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "HeartBeatAlarmReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 14
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->getBackendHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver$1;

    invoke-direct {v1, p0, p1}, Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver$1;-><init>(Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 21
    return-void
.end method
