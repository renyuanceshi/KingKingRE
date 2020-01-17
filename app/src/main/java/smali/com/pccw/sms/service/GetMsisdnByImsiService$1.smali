.class Lcom/pccw/sms/service/GetMsisdnByImsiService$1;
.super Ljava/lang/Object;
.source "GetMsisdnByImsiService.java"

# interfaces
.implements Lcom/pccw/mobile/server/api/ApiResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/service/GetMsisdnByImsiService;->callApiAndStoreDnToPreference(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/service/GetMsisdnByImsiService;


# direct methods
.method constructor <init>(Lcom/pccw/sms/service/GetMsisdnByImsiService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/service/GetMsisdnByImsiService;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/pccw/sms/service/GetMsisdnByImsiService$1;->this$0:Lcom/pccw/sms/service/GetMsisdnByImsiService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponseFailed()V
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/pccw/sms/service/GetMsisdnByImsiService$1;->this$0:Lcom/pccw/sms/service/GetMsisdnByImsiService;

    iget-object v0, v0, Lcom/pccw/sms/service/GetMsisdnByImsiService;->getMsisdnByImsilistener:Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;

    invoke-interface {v0}, Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;->onCallFail()V

    .line 44
    return-void
.end method

.method public onResponseSuccess(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 3
    .param p1, "response"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 35
    move-object v0, p1

    check-cast v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    .line 36
    .local v0, "resp":Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;
    iget-object v1, p0, Lcom/pccw/sms/service/GetMsisdnByImsiService$1;->this$0:Lcom/pccw/sms/service/GetMsisdnByImsiService;

    iget-object v1, v1, Lcom/pccw/sms/service/GetMsisdnByImsiService;->ctx:Landroid/content/Context;

    iget-object v2, v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;->msisdn:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/ClientStateManager;->setRegisteredNumber(Landroid/content/Context;Ljava/lang/String;)Z

    .line 37
    iget-object v1, p0, Lcom/pccw/sms/service/GetMsisdnByImsiService$1;->this$0:Lcom/pccw/sms/service/GetMsisdnByImsiService;

    iget-object v1, v1, Lcom/pccw/sms/service/GetMsisdnByImsiService;->getMsisdnByImsilistener:Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;

    iget-object v2, v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;->msisdn:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;->onCallSuccess(Ljava/lang/String;)V

    .line 38
    return-void
.end method
