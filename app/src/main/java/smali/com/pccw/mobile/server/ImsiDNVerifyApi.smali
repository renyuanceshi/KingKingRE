.class public Lcom/pccw/mobile/server/ImsiDNVerifyApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "ImsiDNVerifyApi.java"


# instance fields
.field private context:Landroid/content/Context;

.field private encImsi:Ljava/lang/String;

.field private encMsisdn:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "encImsi"    # Ljava/lang/String;
    .param p4, "encMsisdn"    # Ljava/lang/String;

    .prologue
    .line 20
    new-instance v0, Lcom/pccw/mobile/server/xml/ImsiDNVerifyXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/ImsiDNVerifyXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 21
    iput-object p2, p0, Lcom/pccw/mobile/server/ImsiDNVerifyApi;->context:Landroid/content/Context;

    .line 22
    iput-object p3, p0, Lcom/pccw/mobile/server/ImsiDNVerifyApi;->encImsi:Ljava/lang/String;

    .line 23
    iput-object p4, p0, Lcom/pccw/mobile/server/ImsiDNVerifyApi;->encMsisdn:Ljava/lang/String;

    .line 24
    iput-object p1, p0, Lcom/pccw/mobile/server/ImsiDNVerifyApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 25
    return-void
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v9, 0x2

    .line 32
    const/4 v2, 0x0

    .line 33
    .local v2, "hlContent":Ljava/lang/String;
    const/4 v4, 0x0

    .line 34
    .local v4, "retryCount":I
    const/4 v3, 0x1

    .line 35
    .local v3, "needTry":Z
    :goto_0
    if-ge v4, v9, :cond_0

    if-eqz v3, :cond_0

    iget-object v5, p0, Lcom/pccw/mobile/server/ImsiDNVerifyApi;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 40
    :try_start_0
    const-string/jumbo v5, "https://sip.pccwmobile.com/voip02/imsiDVerify.do"

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string/jumbo v8, "imsi"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    iget-object v8, p0, Lcom/pccw/mobile/server/ImsiDNVerifyApi;->encImsi:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    const-string/jumbo v8, "d"

    aput-object v8, v6, v7

    const/4 v7, 0x3

    iget-object v8, p0, Lcom/pccw/mobile/server/ImsiDNVerifyApi;->encMsisdn:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    const-string/jumbo v8, "encrypted"

    aput-object v8, v6, v7

    const/4 v7, 0x5

    const-string/jumbo v8, "1"

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 45
    new-instance v1, Lcom/pccw/mobile/server/xml/ImsiDNVerifyXmlHandler;

    invoke-direct {v1}, Lcom/pccw/mobile/server/xml/ImsiDNVerifyXmlHandler;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .local v1, "handler":Lcom/pccw/mobile/server/xml/ImsiDNVerifyXmlHandler;
    const/4 v3, 0x0

    goto :goto_0

    .line 50
    .end local v1    # "handler":Lcom/pccw/mobile/server/xml/ImsiDNVerifyXmlHandler;
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v4, v4, 0x1

    .line 57
    goto :goto_0

    .line 59
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-object v2
.end method
