.class public Lcom/pccw/mobile/sip/RetryAlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "RetryAlarmReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v1, 0x1

    .line 18
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    if-ne v0, v1, :cond_1

    .line 19
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->doRelogin(Landroid/content/Context;)V

    .line 20
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v1, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginRetryCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginRetryCount:I

    .line 31
    :cond_0
    :goto_0
    return-void

    .line 21
    :cond_1
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-ne v0, v1, :cond_0

    .line 22
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->doAutologin(Landroid/content/Context;)V

    .line 23
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v1, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginRetryCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginRetryCount:I

    goto :goto_0
.end method
