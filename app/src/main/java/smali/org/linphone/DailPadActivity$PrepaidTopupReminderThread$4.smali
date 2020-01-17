.class Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;
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
    .line 1355
    iput-object p1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1357
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    iget-object v3, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v3, v3, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v3, v3, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1358
    iget-object v2, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v2, v2, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    iget-object v3, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v3, v3, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v3, v3, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const v4, 0x7f07006b

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 1359
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 1365
    :goto_0
    iget-object v2, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1366
    iget-object v2, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->dismiss()V

    .line 1368
    :cond_0
    return-void

    .line 1361
    :cond_1
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    iget-object v3, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v3, v3, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v3, v3, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->generateTopupURL(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 1362
    .local v1, "url":Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1363
    .local v0, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;->this$1:Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    iget-object v2, v2, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-virtual {v2, v0}, Lorg/linphone/DailPadActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
