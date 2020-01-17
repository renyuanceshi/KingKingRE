.class Lcom/pccw/mobile/sip/service/MobileSipService$3;
.super Ljava/lang/Object;
.source "MobileSipService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/service/MobileSipService;->handleSuccesLoginResponse(Landroid/os/Handler;Landroid/content/Context;Lcom/pccw/mobile/sip/service/LoginResponse;)V
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
    .line 1089
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$3;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iput-object p2, p0, Lcom/pccw/mobile/sip/service/MobileSipService$3;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1093
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$3;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$3;->val$ctx:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$200(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    .line 1094
    return-void
.end method
