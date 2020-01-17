.class Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;
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
    .line 1453
    iput-object p1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v2, 0x1

    .line 1456
    iget-object v1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1, v2}, Lorg/linphone/DailPadActivity;->access$1600(Lorg/linphone/DailPadActivity;Z)V

    .line 1457
    iget-object v1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1, v2}, Lorg/linphone/DailPadActivity;->access$1100(Lorg/linphone/DailPadActivity;Z)V

    .line 1458
    iget-object v1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, v1, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->getPhone(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 1459
    .local v0, "phone":Ljava/lang/String;
    iget-object v1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$1200(Lorg/linphone/DailPadActivity;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v3, v3, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    const v4, 0x7f070071

    invoke-virtual {v3, v4}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v0, :cond_0

    .line 1460
    invoke-static {v0}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_0
    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1459
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1466
    iget-object v1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, v1, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1470
    new-instance v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v2, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {v1, v2}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;-><init>(Lorg/linphone/DailPadActivity;)V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 1482
    :cond_1
    iget-object v1, p0, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver$4;->this$1:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$1900(Lorg/linphone/DailPadActivity;)V

    .line 1483
    return-void
.end method
