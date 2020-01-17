.class public Lcom/pccw/mobile/server/GetDnByImsiSyncApi;
.super Lcom/pccw/mobile/server/api/SyncApiServerConnection;
.source "GetDnByImsiSyncApi.java"


# instance fields
.field private context:Landroid/content/Context;

.field private encryptedImsi:Ljava/lang/String;

.field private response:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "encryptedImsi"    # Ljava/lang/String;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/SyncApiServerConnection;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->context:Landroid/content/Context;

    .line 21
    iput-object p2, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->encryptedImsi:Ljava/lang/String;

    .line 22
    new-instance v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->response:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    .line 23
    return-void
.end method


# virtual methods
.method public XmlElement(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 2
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 65
    if-nez p2, :cond_0

    .line 75
    :goto_0
    return-void

    .line 67
    :cond_0
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 68
    iget-object v0, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->response:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;->resultcode:Ljava/lang/String;

    .line 74
    :cond_1
    :goto_1
    const/4 p2, 0x0

    .line 75
    goto :goto_0

    .line 69
    :cond_2
    const-string/jumbo v0, "dn"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 70
    iget-object v0, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->response:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;->msisdn:Ljava/lang/String;

    goto :goto_1

    .line 71
    :cond_3
    const-string/jumbo v0, "message"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 72
    iget-object v0, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->response:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;->message:Ljava/lang/String;

    goto :goto_1
.end method

.method public postToServer()Lcom/pccw/mobile/server/api/ApiResponse;
    .locals 9

    .prologue
    const/4 v8, 0x2

    .line 30
    const/4 v3, 0x0

    .line 31
    .local v3, "retryCount":I
    const/4 v2, 0x1

    .line 32
    .local v2, "needTry":Z
    :goto_0
    if-ge v3, v8, :cond_0

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget-object v5, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->context:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 35
    :try_start_0
    const-string/jumbo v1, ""

    .line 36
    .local v1, "hlContent":Ljava/lang/String;
    const-string/jumbo v4, "https://sip.pccwmobile.com/voip02/getDImsi.do"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "imsi"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->encryptedImsi:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 44
    invoke-virtual {p0, v1}, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->apiResponseXmlHandler(Ljava/lang/String;)V

    .line 45
    const/4 v2, 0x0

    .line 50
    iget-object v4, p0, Lcom/pccw/mobile/server/GetDnByImsiSyncApi;->response:Lcom/pccw/mobile/server/response/GetDnByIMSIResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .end local v1    # "hlContent":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 51
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v3, v3, 0x1

    .line 58
    goto :goto_0

    .line 60
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v4, 0x0

    goto :goto_1
.end method
