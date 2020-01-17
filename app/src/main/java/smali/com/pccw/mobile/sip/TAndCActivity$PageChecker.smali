.class Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;
.super Landroid/os/AsyncTask;
.source "TAndCActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/TAndCActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PageChecker"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private appContext:Landroid/content/Context;

.field private errorDialog:Landroid/app/AlertDialog;

.field final synthetic this$0:Lcom/pccw/mobile/sip/TAndCActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity;Landroid/app/Activity;)V
    .locals 1
    .param p2, "act"    # Landroid/app/Activity;

    .prologue
    .line 381
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 379
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialog:Landroid/app/AlertDialog;

    .line 382
    iput-object p2, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->activity:Landroid/app/Activity;

    .line 383
    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->appContext:Landroid/content/Context;

    .line 384
    return-void
.end method

.method static synthetic access$1700(Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    .prologue
    .line 375
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->activity:Landroid/app/Activity;

    return-object v0
.end method


# virtual methods
.method public varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 7
    .param p1, "v"    # [Ljava/lang/Void;

    .prologue
    .line 388
    const/4 v2, 0x0

    .line 389
    .local v2, "result":Z
    invoke-static {}, Ljava/net/HttpURLConnection;->getFollowRedirects()Z

    move-result v1

    .line 390
    .local v1, "originalRedirect":Z
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/net/HttpURLConnection;->setFollowRedirects(Z)V

    .line 394
    :try_start_0
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->appContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLOne2freePostpaid(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 395
    iget-object v5, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "zh"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$700()Ljava/lang/String;

    move-result-object v4

    :goto_0
    invoke-static {v5, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->access$602(Lcom/pccw/mobile/sip/TAndCActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 407
    :goto_1
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v4}, Lcom/pccw/mobile/sip/TAndCActivity;->access$600(Lcom/pccw/mobile/sip/TAndCActivity;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_a

    .line 408
    new-instance v3, Ljava/net/URL;

    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v4}, Lcom/pccw/mobile/sip/TAndCActivity;->access$600(Lcom/pccw/mobile/sip/TAndCActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 413
    .local v3, "targetURL":Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    .local v0, "con":Ljava/net/HttpURLConnection;
    :try_start_1
    const-string/jumbo v4, "HEAD"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 416
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 417
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_0

    .line 418
    const/4 v2, 0x1

    .line 423
    :cond_0
    :try_start_2
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 429
    .end local v0    # "con":Ljava/net/HttpURLConnection;
    .end local v3    # "targetURL":Ljava/net/URL;
    :goto_2
    invoke-static {v1}, Ljava/net/HttpURLConnection;->setFollowRedirects(Z)V

    .line 430
    new-instance v4, Ljava/lang/Boolean;

    invoke-direct {v4, v2}, Ljava/lang/Boolean;-><init>(Z)V

    :goto_3
    return-object v4

    .line 395
    :cond_1
    :try_start_3
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$800()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 396
    :cond_2
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->appContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL1010Postpaid(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 397
    iget-object v5, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "zh"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$900()Ljava/lang/String;

    move-result-object v4

    :goto_4
    invoke-static {v5, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->access$602(Lcom/pccw/mobile/sip/TAndCActivity;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_1

    .line 425
    :catch_0
    move-exception v4

    goto :goto_2

    .line 397
    :cond_3
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1000()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    .line 398
    :cond_4
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->appContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 399
    iget-object v5, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "zh"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1100()Ljava/lang/String;

    move-result-object v4

    :goto_5
    invoke-static {v5, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->access$602(Lcom/pccw/mobile/sip/TAndCActivity;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_1

    :cond_5
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1200()Ljava/lang/String;

    move-result-object v4

    goto :goto_5

    .line 400
    :cond_6
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->appContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPrepaid(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 401
    iget-object v5, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "zh"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1300()Ljava/lang/String;

    move-result-object v4

    :goto_6
    invoke-static {v5, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->access$602(Lcom/pccw/mobile/sip/TAndCActivity;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_1

    :cond_7
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1400()Ljava/lang/String;

    move-result-object v4

    goto :goto_6

    .line 404
    :cond_8
    iget-object v5, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "zh"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1500()Ljava/lang/String;

    move-result-object v4

    :goto_7
    invoke-static {v5, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->access$602(Lcom/pccw/mobile/sip/TAndCActivity;Ljava/lang/String;)Ljava/lang/String;

    goto/16 :goto_1

    :cond_9
    invoke-static {}, Lcom/pccw/mobile/sip/TAndCActivity;->access$1600()Ljava/lang/String;

    move-result-object v4

    goto :goto_7

    .line 410
    :cond_a
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    goto/16 :goto_3

    .line 419
    .restart local v0    # "con":Ljava/net/HttpURLConnection;
    .restart local v3    # "targetURL":Ljava/net/URL;
    :catch_1
    move-exception v4

    .line 423
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    goto/16 :goto_2

    :catchall_0
    move-exception v4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
.end method

.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 375
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public errorDialogCleanUp()V
    .locals 1

    .prologue
    .line 478
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 479
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 480
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialog:Landroid/app/AlertDialog;

    .line 482
    :cond_0
    return-void
.end method

.method public onPostExecute(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 435
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 436
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v1}, Lcom/pccw/mobile/sip/TAndCActivity;->access$600(Lcom/pccw/mobile/sip/TAndCActivity;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 437
    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v1}, Lcom/pccw/mobile/sip/TAndCActivity;->access$400(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/webkit/WebView;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/TAndCActivity;->access$600(Lcom/pccw/mobile/sip/TAndCActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 475
    :cond_0
    :goto_0
    return-void

    .line 444
    :cond_1
    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v1}, Lcom/pccw/mobile/sip/TAndCActivity;->access$600(Lcom/pccw/mobile/sip/TAndCActivity;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    .line 445
    invoke-static {}, Lcom/pccw/mobile/sip/CheckVersionActivity;->clearLastSuccessfulCheckResponse()V

    .line 447
    :cond_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 448
    .local v0, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->appContext:Landroid/content/Context;

    const v2, 0x7f07006a

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 449
    const v1, 0x7f020436

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 450
    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->appContext:Landroid/content/Context;

    const v2, 0x7f07021b

    .line 451
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 450
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 452
    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const v2, 0x7f07015b

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker$1;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker$1;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 460
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialog:Landroid/app/AlertDialog;

    .line 462
    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialog:Landroid/app/AlertDialog;

    new-instance v2, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker$2;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker$2;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;)V

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 472
    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 375
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
