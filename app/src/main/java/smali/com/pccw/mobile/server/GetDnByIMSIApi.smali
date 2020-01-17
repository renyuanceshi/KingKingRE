.class public Lcom/pccw/mobile/server/GetDnByIMSIApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "GetDnByIMSIApi.java"


# instance fields
.field private context:Landroid/content/Context;

.field private encryptedImsi:Ljava/lang/String;

.field private response:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "encryptedImsi"    # Ljava/lang/String;

    .prologue
    .line 20
    new-instance v0, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/GetDnByIMSIXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 21
    iput-object p2, p0, Lcom/pccw/mobile/server/GetDnByIMSIApi;->context:Landroid/content/Context;

    .line 22
    iput-object p3, p0, Lcom/pccw/mobile/server/GetDnByIMSIApi;->encryptedImsi:Ljava/lang/String;

    .line 23
    iput-object p1, p0, Lcom/pccw/mobile/server/GetDnByIMSIApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 24
    new-instance v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/GetDnByIMSIApi;->response:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    .line 25
    return-void
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v8, 0x2

    .line 32
    const/4 v1, 0x0

    .line 33
    .local v1, "hlContent":Ljava/lang/String;
    const/4 v3, 0x0

    .line 34
    .local v3, "retryCount":I
    const/4 v2, 0x1

    .line 35
    .local v2, "needTry":Z
    :goto_0
    if-ge v3, v8, :cond_0

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget-object v5, p0, Lcom/pccw/mobile/server/GetDnByIMSIApi;->context:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 37
    :try_start_0
    const-string/jumbo v4, "https://sip.pccwmobile.com/voip02/getDImsi.do"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "imsi"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/pccw/mobile/server/GetDnByIMSIApi;->encryptedImsi:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 45
    const/4 v2, 0x0

    goto :goto_0

    .line 50
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v3, v3, 0x1

    .line 57
    goto :goto_0

    .line 59
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-object v1
.end method
