.class public Lcom/pccw/mobile/server/RoamSaveAuthenApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "RoamSaveAuthenApi.java"


# instance fields
.field private context:Landroid/content/Context;

.field private msisdn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "msisdn"    # Ljava/lang/String;

    .prologue
    .line 19
    new-instance v0, Lcom/pccw/mobile/server/xml/RoamSaveAuthenXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/RoamSaveAuthenXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 20
    iput-object p2, p0, Lcom/pccw/mobile/server/RoamSaveAuthenApi;->context:Landroid/content/Context;

    .line 21
    iput-object p3, p0, Lcom/pccw/mobile/server/RoamSaveAuthenApi;->msisdn:Ljava/lang/String;

    .line 22
    iput-object p1, p0, Lcom/pccw/mobile/server/RoamSaveAuthenApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 23
    return-void
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v9, 0x2

    .line 27
    const/4 v2, 0x0

    .line 28
    .local v2, "hlContent":Ljava/lang/String;
    const/4 v4, 0x0

    .line 29
    .local v4, "retryCount":I
    const/4 v3, 0x1

    .line 31
    .local v3, "needTry":Z
    :goto_0
    if-ge v4, v9, :cond_1

    if-eqz v3, :cond_1

    .line 32
    const/4 v3, 0x0

    .line 33
    iget-object v5, p0, Lcom/pccw/mobile/server/RoamSaveAuthenApi;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 34
    const/4 v0, 0x0

    .line 36
    .local v0, "deviceId":Ljava/lang/String;
    :try_start_0
    iget-object v5, p0, Lcom/pccw/mobile/server/RoamSaveAuthenApi;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 37
    const-string/jumbo v5, "https://sip.pccwmobile.com/roamSaveAuthen02/RoamSaveAuthen"

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string/jumbo v8, "msisdn"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    iget-object v8, p0, Lcom/pccw/mobile/server/RoamSaveAuthenApi;->msisdn:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-string/jumbo v8, "deviceID"

    aput-object v8, v6, v7

    const/4 v7, 0x3

    aput-object v0, v6, v7

    const/4 v7, 0x4

    const-string/jumbo v8, "xmlResponse"

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-string/jumbo v8, "1"

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 38
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 53
    :goto_1
    const-wide/16 v6, 0x1f4

    :try_start_1
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 54
    :catch_0
    move-exception v5

    goto :goto_0

    .line 42
    :catch_1
    move-exception v1

    .line 43
    .local v1, "e":Ljava/lang/Exception;
    add-int/lit8 v4, v4, 0x1

    .line 44
    const/4 v3, 0x1

    goto :goto_1

    .line 50
    .end local v0    # "deviceId":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v2, 0x0

    .line 58
    .end local v2    # "hlContent":Ljava/lang/String;
    :cond_1
    return-object v2
.end method
