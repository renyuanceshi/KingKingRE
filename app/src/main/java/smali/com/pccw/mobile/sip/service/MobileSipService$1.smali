.class Lcom/pccw/mobile/sip/service/MobileSipService$1;
.super Ljava/lang/Object;
.source "MobileSipService.java"

# interfaces
.implements Lcom/pccw/mobile/server/api/ApiResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/service/MobileSipService;->doHttpsLogin(Landroid/os/Handler;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/service/MobileSipService;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/service/MobileSipService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 448
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$1;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponseFailed()V
    .locals 2

    .prologue
    .line 457
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$1;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$102(Lcom/pccw/mobile/sip/service/MobileSipService;Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .line 458
    return-void
.end method

.method public onResponseSuccess(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 1
    .param p1, "response"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 452
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService$1;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    check-cast p1, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .end local p1    # "response":Lcom/pccw/mobile/server/api/ApiResponse;
    invoke-static {v0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$102(Lcom/pccw/mobile/sip/service/MobileSipService;Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .line 453
    return-void
.end method
