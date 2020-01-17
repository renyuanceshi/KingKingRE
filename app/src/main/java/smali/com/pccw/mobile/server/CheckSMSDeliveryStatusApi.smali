.class public Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "CheckSMSDeliveryStatusApi.java"


# instance fields
.field private context:Landroid/content/Context;

.field private serverMessageId:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/pccw/mobile/server/api/ApiResponseListener;",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 23
    .local p3, "serverMessageId":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/CheckSMSDeliveryStatusXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 24
    iput-object p2, p0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->context:Landroid/content/Context;

    .line 25
    iput-object p1, p0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 26
    iput-object p3, p0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->serverMessageId:Ljava/util/List;

    .line 27
    return-void
.end method

.method private getSender()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->getPhoneWithHKCountryCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 13

    .prologue
    const/4 v7, 0x0

    const/4 v12, 0x2

    .line 31
    const/4 v5, 0x0

    .line 32
    .local v5, "retryCount":I
    const/4 v3, 0x1

    .line 33
    .local v3, "needTry":Z
    invoke-direct {p0}, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->getSender()Ljava/lang/String;

    move-result-object v6

    .line 35
    .local v6, "sender":Ljava/lang/String;
    :goto_0
    if-ge v5, v12, :cond_3

    if-eqz v3, :cond_3

    .line 36
    const/4 v3, 0x0

    .line 37
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v8

    iget-object v9, p0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->context:Landroid/content/Context;

    invoke-virtual {v8, v9}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 38
    const/4 v1, 0x0

    .line 39
    .local v1, "hlContent":Ljava/lang/String;
    iget-object v8, p0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->serverMessageId:Ljava/util/List;

    invoke-static {v8}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    .line 41
    .local v2, "msgIdStr":Ljava/lang/String;
    iget-object v8, p0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->context:Landroid/content/Context;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 42
    const-string/jumbo v4, "CSL"

    .line 49
    .local v4, "operator":Ljava/lang/String;
    :goto_1
    :try_start_0
    const-string/jumbo v8, "https://sip.pccwmobile.com/voip02/smsstatus.do"

    const/4 v9, 0x6

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "msgid"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object v2, v9, v10

    const/4 v10, 0x2

    const-string/jumbo v11, "sender"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    aput-object v6, v9, v10

    const/4 v10, 0x4

    const-string/jumbo v11, "operator"

    aput-object v11, v9, v10

    const/4 v10, 0x5

    aput-object v4, v9, v10

    invoke-static {v8, v9}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 50
    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 71
    .end local v1    # "hlContent":Ljava/lang/String;
    .end local v2    # "msgIdStr":Ljava/lang/String;
    .end local v4    # "operator":Ljava/lang/String;
    :goto_2
    return-object v1

    .line 43
    .restart local v1    # "hlContent":Ljava/lang/String;
    .restart local v2    # "msgIdStr":Ljava/lang/String;
    :cond_0
    iget-object v8, p0, Lcom/pccw/mobile/server/CheckSMSDeliveryStatusApi;->context:Landroid/content/Context;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKT(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 44
    const-string/jumbo v4, "HKT"

    .restart local v4    # "operator":Ljava/lang/String;
    goto :goto_1

    .line 46
    .end local v4    # "operator":Ljava/lang/String;
    :cond_1
    const-string/jumbo v4, "UNKNOWN"

    .restart local v4    # "operator":Ljava/lang/String;
    goto :goto_1

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v5, v5, 0x1

    .line 57
    const/4 v3, 0x1

    .line 66
    const-wide/16 v8, 0x1f4

    :try_start_1
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 67
    :catch_1
    move-exception v8

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "hlContent":Ljava/lang/String;
    .end local v2    # "msgIdStr":Ljava/lang/String;
    .end local v4    # "operator":Ljava/lang/String;
    :cond_2
    move-object v1, v7

    .line 63
    goto :goto_2

    :cond_3
    move-object v1, v7

    .line 71
    goto :goto_2
.end method
