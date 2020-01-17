.class Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$1;
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


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    .prologue
    .line 602
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$1;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 606
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_0

    .line 607
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$1;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    iget-object v1, v1, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 609
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 610
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$1;->this$1:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    iget-object v0, v0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->finish()V

    .line 611
    return-void
.end method
