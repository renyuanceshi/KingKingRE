.class Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DailPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/DailPadActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectionChangeReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;


# direct methods
.method private constructor <init>(Lorg/linphone/DailPadActivity;)V
    .locals 0

    .prologue
    .line 1406
    iput-object p1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/linphone/DailPadActivity;Lorg/linphone/DailPadActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/linphone/DailPadActivity;
    .param p2, "x1"    # Lorg/linphone/DailPadActivity$1;

    .prologue
    .line 1406
    invoke-direct {p0, p1}, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;-><init>(Lorg/linphone/DailPadActivity;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1411
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.pccw.mobile.sip.intent.logindisconnected"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1413
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    new-instance v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$1;

    invoke-direct {v1, p0}, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$1;-><init>(Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1510
    :cond_0
    :goto_0
    return-void

    .line 1424
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.pccw.mobile.sip.intent.logindisconnecting"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1426
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    new-instance v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$2;

    invoke-direct {v1, p0}, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$2;-><init>(Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1436
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.pccw.mobile.sip.intent.loginfinished"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1438
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    new-instance v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$3;

    invoke-direct {v1, p0}, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$3;-><init>(Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1451
    :cond_3
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.pccw.mobile.sip.intent.callforwardsucceed"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1453
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    new-instance v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;

    invoke-direct {v1, p0}, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;-><init>(Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1485
    :cond_4
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.pccw.mobile.sip.intent.reloginprocessing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1487
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    new-instance v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$5;

    invoke-direct {v1, p0}, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$5;-><init>(Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 1497
    :cond_5
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.pccw.mobile.sip.intent.autologinprocessing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1499
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    new-instance v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;

    invoke-direct {v1, p0}, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$6;-><init>(Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto/16 :goto_0
.end method
