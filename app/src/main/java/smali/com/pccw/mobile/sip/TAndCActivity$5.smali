.class Lcom/pccw/mobile/sip/TAndCActivity$5;
.super Landroid/webkit/WebViewClient;
.source "TAndCActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/TAndCActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/TAndCActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 252
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 307
    :try_start_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$300(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$300(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 308
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$300(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 309
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/TAndCActivity;->access$302(Lcom/pccw/mobile/sip/TAndCActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 311
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$400(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/webkit/WebView;

    move-result-object v0

    if-ne p1, v0, :cond_1

    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/TAndCActivity;->access$600(Lcom/pccw/mobile/sip/TAndCActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/net/URL;->sameFile(Ljava/net/URL;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 317
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$500(Lcom/pccw/mobile/sip/TAndCActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 318
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$000(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 319
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->access$100(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 333
    :cond_1
    :goto_0
    return-void

    .line 331
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "favicon"    # Landroid/graphics/Bitmap;

    .prologue
    .line 257
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 258
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "errorCode"    # I
    .param p3, "description"    # Ljava/lang/String;
    .param p4, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 265
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/TAndCActivity;->access$300(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/app/AlertDialog;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/TAndCActivity;->access$300(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/TAndCActivity;->access$300(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->dismiss()V

    .line 267
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->access$302(Lcom/pccw/mobile/sip/TAndCActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 269
    :cond_0
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/TAndCActivity;->access$400(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/webkit/WebView;

    move-result-object v2

    if-ne p1, v2, :cond_1

    .line 270
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->access$502(Lcom/pccw/mobile/sip/TAndCActivity;Z)Z

    .line 273
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 275
    .local v1, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const v3, 0x7f07006a

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 276
    const v2, 0x7f020436

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 277
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const v3, 0x7f07021b

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 278
    iget-object v2, p0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    const v3, 0x7f07015b

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/TAndCActivity$5$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/TAndCActivity$5$1;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$5;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 286
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 288
    .local v0, "errorDialog":Landroid/app/AlertDialog;
    new-instance v2, Lcom/pccw/mobile/sip/TAndCActivity$5$2;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/TAndCActivity$5$2;-><init>(Lcom/pccw/mobile/sip/TAndCActivity$5;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 298
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 300
    .end local v0    # "errorDialog":Landroid/app/AlertDialog;
    .end local v1    # "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    :cond_1
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 339
    const/4 v0, 0x0

    return v0
.end method
