.class Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;
.super Ljava/lang/Object;
.source "CheckVersionActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->onPostExecute(Lcom/pccw/mobile/sip/CheckVersionResponse;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

.field final synthetic val$result:Lcom/pccw/mobile/sip/CheckVersionResponse;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;Lcom/pccw/mobile/sip/CheckVersionResponse;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    .prologue
    .line 623
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;->val$result:Lcom/pccw/mobile/sip/CheckVersionResponse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 626
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    iget v1, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v1, :cond_0

    .line 627
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    iget-object v2, v2, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 630
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;->val$result:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v2, v2, Lcom/pccw/mobile/sip/CheckVersionResponse;->app_link:Ljava/lang/String;

    .line 631
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 632
    .local v0, "i":Landroid/content/Intent;
    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    iget-object v1, v1, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v1, v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    .line 633
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 634
    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    iget-object v1, v1, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->finish()V

    .line 635
    return-void
.end method
