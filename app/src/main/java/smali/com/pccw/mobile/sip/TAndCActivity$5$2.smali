.class Lcom/pccw/mobile/sip/TAndCActivity$5$2;
.super Ljava/lang/Object;
.source "TAndCActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/TAndCActivity$5;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/TAndCActivity$5;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/TAndCActivity$5;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/TAndCActivity$5;

    .prologue
    .line 288
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity$5$2;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "di"    # Landroid/content/DialogInterface;

    .prologue
    .line 291
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_0

    .line 292
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity$5$2;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$5;

    iget-object v1, v1, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5$2;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$5;

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 294
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity$5$2;->this$1:Lcom/pccw/mobile/sip/TAndCActivity$5;

    iget-object v0, v0, Lcom/pccw/mobile/sip/TAndCActivity$5;->this$0:Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity;->finish()V

    .line 295
    :cond_1
    return-void
.end method
