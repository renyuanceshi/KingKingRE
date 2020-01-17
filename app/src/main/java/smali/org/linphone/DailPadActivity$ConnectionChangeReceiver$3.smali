.class Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$3;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    .prologue
    .line 1438
    iput-object p1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$3;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1441
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-eqz v0, :cond_0

    .line 1442
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$3;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0, v2}, Lorg/linphone/DailPadActivity;->access$1600(Lorg/linphone/DailPadActivity;Z)V

    .line 1443
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$3;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/linphone/DailPadActivity;->access$1100(Lorg/linphone/DailPadActivity;Z)V

    .line 1445
    iget-object v0, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$3;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v0, v0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v0, v2}, Lorg/linphone/DailPadActivity;->on(Landroid/content/Context;Z)V

    .line 1449
    :cond_0
    return-void
.end method
