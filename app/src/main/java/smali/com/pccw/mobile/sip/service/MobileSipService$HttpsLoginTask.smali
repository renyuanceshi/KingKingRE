.class Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;
.super Ljava/util/TimerTask;
.source "MobileSipService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/service/MobileSipService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HttpsLoginTask"
.end annotation


# instance fields
.field private ctx:Landroid/content/Context;

.field private handler:Landroid/os/Handler;

.field final synthetic this$0:Lcom/pccw/mobile/sip/service/MobileSipService;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;Landroid/os/Handler;)V
    .locals 0
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "handler"    # Landroid/os/Handler;

    .prologue
    .line 399
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 400
    iput-object p2, p0, Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;->ctx:Landroid/content/Context;

    .line 401
    iput-object p3, p0, Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;->handler:Landroid/os/Handler;

    .line 402
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 406
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;->handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;->ctx:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$000(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/os/Handler;Landroid/content/Context;)V

    .line 407
    return-void
.end method
