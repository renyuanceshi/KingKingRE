.class Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->showPrepaidTopUpReminderDialog(Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    .prologue
    .line 1326
    iput-object p1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1328
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    iget v1, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-eqz v1, :cond_1

    .line 1329
    iget-object v1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, v1, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v2, v2, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const v3, 0x7f0701c5

    .line 1330
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    .line 1329
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 1331
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1343
    :goto_0
    iget-object v1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1344
    iget-object v1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 1346
    :cond_0
    return-void

    .line 1333
    :cond_1
    const-string/jumbo v0, ""

    .line 1334
    .local v0, "topUpNum":Ljava/lang/String;
    iget-object v1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, v1, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1335
    const-string/jumbo v0, "1833808"

    .line 1341
    :cond_2
    :goto_1
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    iget-object v2, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v2, v2, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    goto :goto_0

    .line 1336
    :cond_3
    iget-object v1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, v1, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1337
    const-string/jumbo v0, "1833803"

    goto :goto_1

    .line 1338
    :cond_4
    iget-object v1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v1, v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, v1, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1339
    const-string/jumbo v0, "179179"

    goto :goto_1
.end method
