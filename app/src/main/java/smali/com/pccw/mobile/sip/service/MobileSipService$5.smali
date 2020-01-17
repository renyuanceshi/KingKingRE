.class Lcom/pccw/mobile/sip/service/MobileSipService$5;
.super Ljava/lang/Object;
.source "MobileSipService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/service/MobileSipService;->doHeartBeat(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 1777
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iput-object p2, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1780
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    if-eqz v0, :cond_0

    .line 1781
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->val$ctx:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    .line 1787
    :goto_0
    return-void

    .line 1782
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-eqz v0, :cond_1

    .line 1783
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->val$ctx:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto :goto_0

    .line 1785
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$5;->val$ctx:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto :goto_0
.end method
