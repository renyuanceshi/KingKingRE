.class Lcom/pccw/mobile/sip/MoreActivity$2;
.super Ljava/lang/Object;
.source "MoreActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/MoreActivity;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/MoreActivity;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/MoreActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/MoreActivity;

    .prologue
    .line 286
    iput-object p1, p0, Lcom/pccw/mobile/sip/MoreActivity$2;->this$0:Lcom/pccw/mobile/sip/MoreActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog0"    # Landroid/content/DialogInterface;
    .param p2, "which0"    # I

    .prologue
    .line 289
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 291
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_0

    .line 292
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/MoreActivity$2;->this$0:Lcom/pccw/mobile/sip/MoreActivity;

    iget-object v1, v1, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 294
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity$2;->this$0:Lcom/pccw/mobile/sip/MoreActivity;

    iget-object v0, v0, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->setJustSwitchAccount(Landroid/content/Context;)Z

    .line 295
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity$2;->this$0:Lcom/pccw/mobile/sip/MoreActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/pccw/mobile/sip/MoreActivity$2;->this$0:Lcom/pccw/mobile/sip/MoreActivity;

    iget-object v2, v2, Lcom/pccw/mobile/sip/MoreActivity;->ctx:Landroid/content/Context;

    const-class v3, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/MoreActivity;->startActivity(Landroid/content/Intent;)V

    .line 296
    iget-object v0, p0, Lcom/pccw/mobile/sip/MoreActivity$2;->this$0:Lcom/pccw/mobile/sip/MoreActivity;

    iget-object v0, v0, Lcom/pccw/mobile/sip/MoreActivity;->activity:Landroid/support/v4/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 297
    return-void
.end method
