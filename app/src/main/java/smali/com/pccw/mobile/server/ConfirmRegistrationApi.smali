.class public Lcom/pccw/mobile/server/ConfirmRegistrationApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "ConfirmRegistrationApi.java"


# instance fields
.field private context:Landroid/content/Context;

.field private msisdn:Ljava/lang/String;

.field private password:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "msisdn"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;

    .prologue
    .line 22
    new-instance v0, Lcom/pccw/mobile/server/xml/ConfirmRegistrationXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/ConfirmRegistrationXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 23
    iput-object p2, p0, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->context:Landroid/content/Context;

    .line 24
    iput-object p3, p0, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->msisdn:Ljava/lang/String;

    .line 25
    iput-object p4, p0, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->password:Ljava/lang/String;

    .line 26
    iput-object p1, p0, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 27
    return-void
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 11

    .prologue
    const/4 v5, 0x0

    const/4 v10, 0x2

    .line 31
    const/4 v4, 0x0

    .line 32
    .local v4, "retryCount":I
    const/4 v3, 0x1

    .line 34
    .local v3, "needTry":Z
    :goto_0
    if-ge v4, v10, :cond_1

    if-eqz v3, :cond_1

    .line 35
    const/4 v3, 0x0

    .line 36
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-object v7, p0, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->context:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 37
    const/4 v2, 0x0

    .line 38
    .local v2, "hlContent":Ljava/lang/String;
    const/4 v0, 0x0

    .line 40
    .local v0, "deviceId":Ljava/lang/String;
    :try_start_0
    iget-object v6, p0, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 41
    const-string/jumbo v6, "https://sip.pccwmobile.com/voip02/confirmRegistration.do"

    const/4 v7, 0x6

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "msisdn"

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->msisdn:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string/jumbo v9, "password"

    aput-object v9, v7, v8

    const/4 v8, 0x3

    iget-object v9, p0, Lcom/pccw/mobile/server/ConfirmRegistrationApi;->password:Ljava/lang/String;

    aput-object v9, v7, v8

    const/4 v8, 0x4

    const-string/jumbo v9, "deviceID"

    aput-object v9, v7, v8

    const/4 v8, 0x5

    aput-object v0, v7, v8

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 42
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 64
    .end local v0    # "deviceId":Ljava/lang/String;
    .end local v2    # "hlContent":Ljava/lang/String;
    :goto_1
    return-object v2

    .line 47
    .restart local v0    # "deviceId":Ljava/lang/String;
    .restart local v2    # "hlContent":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 48
    .local v1, "e":Ljava/lang/Exception;
    add-int/lit8 v4, v4, 0x1

    .line 49
    const/4 v3, 0x1

    .line 59
    const-wide/16 v6, 0x1f4

    :try_start_1
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 60
    :catch_1
    move-exception v6

    goto :goto_0

    .end local v0    # "deviceId":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "hlContent":Ljava/lang/String;
    :cond_0
    move-object v2, v5

    .line 56
    goto :goto_1

    :cond_1
    move-object v2, v5

    .line 64
    goto :goto_1
.end method
