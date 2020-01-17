.class public Lcom/pccw/mobile/server/IMRegistrationApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "IMRegistrationApi.java"


# instance fields
.field private context:Landroid/content/Context;

.field private deviceID:Ljava/lang/String;

.field private encryptedImsi:Ljava/lang/String;

.field private msisdn:Ljava/lang/String;

.field private osVersion:Ljava/lang/String;

.field private otp:Ljava/lang/String;

.field private pnsToken:Ljava/lang/String;

.field private simType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "encryptedImsi"    # Ljava/lang/String;
    .param p4, "msisdn"    # Ljava/lang/String;
    .param p5, "otp"    # Ljava/lang/String;
    .param p6, "pnsToken"    # Ljava/lang/String;
    .param p7, "osVersion"    # Ljava/lang/String;
    .param p8, "simType"    # Ljava/lang/String;
    .param p9, "deviceID"    # Ljava/lang/String;

    .prologue
    .line 26
    new-instance v0, Lcom/pccw/mobile/server/xml/IMRegistrationXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/IMRegistrationXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 27
    iput-object p2, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->context:Landroid/content/Context;

    .line 28
    iput-object p3, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->encryptedImsi:Ljava/lang/String;

    .line 29
    iput-object p4, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->msisdn:Ljava/lang/String;

    .line 30
    iput-object p5, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->otp:Ljava/lang/String;

    .line 31
    iput-object p6, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->pnsToken:Ljava/lang/String;

    .line 32
    iput-object p7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->osVersion:Ljava/lang/String;

    .line 33
    iput-object p8, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->simType:Ljava/lang/String;

    .line 34
    iput-object p9, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->deviceID:Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 36
    return-void
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v8, 0x2

    .line 43
    const/4 v1, 0x0

    .line 44
    .local v1, "hlContent":Ljava/lang/String;
    const/4 v3, 0x0

    .line 45
    .local v3, "retryCount":I
    const/4 v2, 0x1

    .line 46
    .local v2, "needTry":Z
    :goto_0
    if-ge v3, v8, :cond_2

    if-eqz v2, :cond_2

    .line 47
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget-object v5, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->context:Landroid/content/Context;

    invoke-virtual {v4, v5}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 50
    :try_start_0
    iget-object v4, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->msisdn:Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->msisdn:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_1

    .line 53
    :cond_0
    const-string/jumbo v4, "https://sip.pccwmobile.com/kkim/api/registration.do"

    const/16 v5, 0xc

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "imsi"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->encryptedImsi:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string/jumbo v7, "pnsToken"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->pnsToken:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string/jumbo v7, "os"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string/jumbo v7, "android"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string/jumbo v7, "osVersion"

    aput-object v7, v5, v6

    const/4 v6, 0x7

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->osVersion:Ljava/lang/String;

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const-string/jumbo v7, "simType"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->simType:Ljava/lang/String;

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string/jumbo v7, "deviceID"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->deviceID:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 66
    :goto_1
    const/4 v2, 0x0

    goto :goto_0

    .line 59
    :cond_1
    const-string/jumbo v4, "https://sip.pccwmobile.com/kkim/api/registration.do"

    const/16 v5, 0xe

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "msisdn"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->msisdn:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string/jumbo v7, "otp"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->otp:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string/jumbo v7, "pnsToken"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->pnsToken:Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string/jumbo v7, "os"

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const-string/jumbo v7, "android"

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const-string/jumbo v7, "osVersion"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->osVersion:Ljava/lang/String;

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string/jumbo v7, "simType"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->simType:Ljava/lang/String;

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string/jumbo v7, "deviceID"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    iget-object v7, p0, Lcom/pccw/mobile/server/IMRegistrationApi;->deviceID:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_1

    .line 71
    :catch_0
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/Exception;
    add-int/lit8 v3, v3, 0x1

    .line 78
    goto/16 :goto_0

    .line 80
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    return-object v1
.end method
