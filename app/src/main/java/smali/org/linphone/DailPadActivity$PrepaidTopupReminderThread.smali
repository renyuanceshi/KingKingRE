.class public Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;
.super Landroid/os/AsyncTask;
.source "DailPadActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/linphone/DailPadActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "PrepaidTopupReminderThread"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;",
        ">;"
    }
.end annotation


# instance fields
.field checkPrepaidBalanceResponse:Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

.field final synthetic this$0:Lorg/linphone/DailPadActivity;


# direct methods
.method public constructor <init>(Lorg/linphone/DailPadActivity;)V
    .locals 1
    .param p1, "this$0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 1226
    iput-object p1, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 1228
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->checkPrepaidBalanceResponse:Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;
    .locals 6
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    .line 1233
    new-instance v1, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$1;

    invoke-direct {v1, p0}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$1;-><init>(Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;)V

    .line 1248
    .local v1, "checkPrepaidBalanceResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    :try_start_0
    new-instance v0, Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;

    iget-object v3, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v3, v3, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1, v3}, Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;-><init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;)V

    .line 1250
    .local v0, "checkPrepaidBalanceApi":Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, ""

    aput-object v5, v3, v4

    invoke-virtual {v0, v3}, Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v3

    invoke-virtual {v3}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1259
    .end local v0    # "checkPrepaidBalanceApi":Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;
    :goto_0
    iget-object v3, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->checkPrepaidBalanceResponse:Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    return-object v3

    .line 1251
    :catch_0
    move-exception v2

    .line 1253
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 1254
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v2

    .line 1256
    .local v2, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v2}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1226
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->doInBackground([Ljava/lang/Void;)Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    move-result-object v0

    return-object v0
.end method

.method public onPostExecute(Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;)V
    .locals 2
    .param p1, "result"    # Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    .prologue
    .line 1267
    if-eqz p1, :cond_1

    const-string/jumbo v0, "0"

    iget-object v1, p1, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;->resultcode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1268
    const-string/jumbo v0, "true"

    iget-object v1, p1, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;->lower_than_threshold:Ljava/lang/String;

    .line 1269
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1270
    invoke-virtual {p0, p1}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->showPrepaidTopUpReminderDialog(Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;)V

    .line 1271
    iget-object v0, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v0}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1296
    :cond_0
    :goto_0
    return-void

    .line 1281
    :cond_1
    if-eqz p1, :cond_0

    const-string/jumbo v0, "0"

    iget-object v1, p1, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;->resultcode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1226
    check-cast p1, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    invoke-virtual {p0, p1}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->onPostExecute(Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;)V

    return-void
.end method

.method protected showPrepaidTopUpReminderDialog(Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;)V
    .locals 11
    .param p1, "result"    # Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;

    .prologue
    .line 1299
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v8}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v8

    if-eqz v8, :cond_0

    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v8}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1300
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v8}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog;->dismiss()V

    .line 1302
    :cond_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v8, v8, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-direct {v1, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1303
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v8, v8, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v8}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    .line 1304
    .local v4, "inflater":Landroid/view/LayoutInflater;
    const v8, 0x7f040071

    const/4 v9, 0x0

    invoke-virtual {v4, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v7

    .line 1305
    .local v7, "prepaid_topup_view":Landroid/view/View;
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v8, v8, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 1306
    .local v5, "msisdn":Ljava/lang/String;
    iget-object v0, p1, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;->balance:Ljava/lang/String;

    .line 1310
    .local v0, "balance":Ljava/lang/String;
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    const v9, 0x7f0701e5

    invoke-virtual {v8, v9}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "MSISDN_VALUE"

    invoke-virtual {v8, v9, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "BALANCE_VALUE"

    const-string/jumbo v10, "10"

    .line 1311
    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1310
    invoke-virtual {v1, v8}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1312
    const v8, 0x7f020436

    invoke-virtual {v1, v8}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const v9, 0x7f07006a

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1313
    invoke-virtual {v1, v7}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 1314
    const v8, 0x7f0e01cb

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 1315
    .local v2, "call_topup":Landroid/widget/Button;
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v8, v8, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1316
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    const v9, 0x7f0701e0

    invoke-virtual {v8, v9}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1322
    :goto_0
    const v8, 0x7f0e01cc

    .line 1323
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 1324
    .local v3, "cancel_topup":Landroid/widget/Button;
    const v8, 0x7f0e01ca

    .line 1325
    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    .line 1326
    .local v6, "online_topup":Landroid/widget/Button;
    new-instance v8, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;

    invoke-direct {v8, p0}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$2;-><init>(Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;)V

    invoke-virtual {v2, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1348
    new-instance v8, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$3;

    invoke-direct {v8, p0}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$3;-><init>(Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;)V

    invoke-virtual {v3, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1355
    new-instance v8, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;

    invoke-direct {v8, p0}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread$4;-><init>(Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;)V

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1370
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/linphone/DailPadActivity;->access$1702(Lorg/linphone/DailPadActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 1371
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    invoke-static {v8}, Lorg/linphone/DailPadActivity;->access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    .line 1372
    return-void

    .line 1317
    .end local v3    # "cancel_topup":Landroid/widget/Button;
    .end local v6    # "online_topup":Landroid/widget/Button;
    :cond_1
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v8, v8, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 1318
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    const v9, 0x7f0701e1

    invoke-virtual {v8, v9}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1320
    :cond_2
    iget-object v8, p0, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->this$0:Lorg/linphone/DailPadActivity;

    const v9, 0x7f0701e2

    invoke-virtual {v8, v9}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
