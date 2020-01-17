.class public Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "CheckPrepaidBalanceApi.java"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    new-instance v0, Lcom/pccw/mobile/server/xml/CheckPrepaidBalanceXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/CheckPrepaidBalanceXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 23
    iput-object p2, p0, Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;->context:Landroid/content/Context;

    .line 24
    iput-object p1, p0, Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 25
    return-void
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v11, 0x2

    const/4 v6, 0x0

    .line 30
    const-string/jumbo v3, ""

    .line 31
    .local v3, "registeredPrepaidNum":Ljava/lang/String;
    const-string/jumbo v2, ""

    .line 32
    .local v2, "prepaidPassword":Ljava/lang/String;
    const/4 v1, 0x0

    .line 33
    .local v1, "hlContent":Ljava/lang/String;
    const/4 v5, 0x0

    .line 34
    .local v5, "retryCount":I
    const/4 v4, 0x1

    .line 36
    .local v4, "retry":Z
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v7

    iget-object v8, p0, Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;->context:Landroid/content/Context;

    invoke-virtual {v7, v8}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 103
    :cond_0
    :goto_0
    return-object v6

    .line 42
    :cond_1
    iget-object v7, p0, Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 43
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_0

    .line 51
    iget-object v7, p0, Lcom/pccw/mobile/server/CheckPrepaidBalanceApi;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredPrepaidNumberPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 52
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_0

    .line 60
    :cond_2
    if-eqz v4, :cond_0

    if-ge v5, v11, :cond_0

    .line 62
    :try_start_0
    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/checkPrepaidBalance.do"

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string/jumbo v10, "msisdn"

    aput-object v10, v8, v9

    const/4 v9, 0x1

    aput-object v3, v8, v9

    const/4 v9, 0x2

    const-string/jumbo v10, "password"

    aput-object v10, v8, v9

    const/4 v9, 0x3

    aput-object v2, v8, v9

    invoke-static {v7, v8}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 64
    invoke-static {v1}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z
    :try_end_0
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v7

    if-eqz v7, :cond_3

    .line 65
    const/4 v4, 0x0

    .line 92
    :goto_1
    if-nez v4, :cond_2

    invoke-static {v1}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    move-object v6, v1

    .line 94
    goto :goto_0

    .line 72
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 79
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Lcom/pccw/mobile/sip/util/NetworkException;
    goto :goto_0

    .line 85
    .end local v0    # "e":Lcom/pccw/mobile/sip/util/NetworkException;
    :catch_1
    move-exception v0

    .line 89
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_0
.end method
