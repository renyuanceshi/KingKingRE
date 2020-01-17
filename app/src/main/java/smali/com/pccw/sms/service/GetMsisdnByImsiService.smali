.class public Lcom/pccw/sms/service/GetMsisdnByImsiService;
.super Ljava/lang/Object;
.source "GetMsisdnByImsiService.java"


# instance fields
.field ctx:Landroid/content/Context;

.field getMsisdnByImsilistener:Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;


# direct methods
.method public constructor <init>(Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;Landroid/content/Context;)V
    .locals 0
    .param p1, "getMsisdnByImsilistener"    # Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/pccw/sms/service/GetMsisdnByImsiService;->getMsisdnByImsilistener:Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;

    .line 22
    iput-object p2, p0, Lcom/pccw/sms/service/GetMsisdnByImsiService;->ctx:Landroid/content/Context;

    .line 23
    return-void
.end method


# virtual methods
.method public callApiAndStoreDnToPreference(Ljava/lang/String;)V
    .locals 5
    .param p1, "encryptedImsi"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/pccw/exception/NoNetworkException;
        }
    .end annotation

    .prologue
    .line 27
    iget-object v2, p0, Lcom/pccw/sms/service/GetMsisdnByImsiService;->ctx:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 28
    new-instance v2, Lcom/pccw/exception/NoNetworkException;

    const-string/jumbo v3, "Error:No Network"

    invoke-direct {v2, v3}, Lcom/pccw/exception/NoNetworkException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 31
    :cond_0
    new-instance v1, Lcom/pccw/sms/service/GetMsisdnByImsiService$1;

    invoke-direct {v1, p0}, Lcom/pccw/sms/service/GetMsisdnByImsiService$1;-><init>(Lcom/pccw/sms/service/GetMsisdnByImsiService;)V

    .line 46
    .local v1, "listener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    new-instance v0, Lcom/pccw/mobile/server/GetDnByIMSIApi;

    iget-object v2, p0, Lcom/pccw/sms/service/GetMsisdnByImsiService;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1, v2, p1}, Lcom/pccw/mobile/server/GetDnByIMSIApi;-><init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;)V

    .line 47
    .local v0, "api":Lcom/pccw/mobile/server/GetDnByIMSIApi;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, ""

    aput-object v4, v2, v3

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/server/GetDnByIMSIApi;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 49
    return-void
.end method
