.class public Lcom/pccw/mobile/server/CheckNumberTypeApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "CheckNumberTypeApi.java"


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private context:Landroid/content/Context;

.field private encryptedImsi:Ljava/lang/String;

.field private msisdn:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 15
    const-class v0, Lcom/pccw/mobile/server/CheckNumberTypeApi;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "encryptedImsi"    # Ljava/lang/String;
    .param p4, "msisdn"    # Ljava/lang/String;

    .prologue
    .line 22
    new-instance v0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 23
    iput-object p2, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->context:Landroid/content/Context;

    .line 24
    iput-object p3, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->encryptedImsi:Ljava/lang/String;

    .line 25
    iput-object p4, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->msisdn:Ljava/lang/String;

    .line 26
    iput-object p1, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 27
    return-void
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 13

    .prologue
    const/4 v12, 0x2

    const/4 v8, 0x0

    .line 34
    const/4 v2, 0x0

    .line 35
    .local v2, "hlContent":Ljava/lang/String;
    const/4 v4, 0x0

    .line 36
    .local v4, "retryCount":I
    const/4 v3, 0x1

    .line 37
    .local v3, "needTry":Z
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v7

    iget-object v9, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->context:Landroid/content/Context;

    invoke-virtual {v7, v9}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 38
    :goto_0
    if-ge v4, v12, :cond_5

    if-eqz v3, :cond_5

    .line 39
    sget-object v7, Lcom/pccw/mobile/server/CheckNumberTypeApi;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "postToServer: "

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    :try_start_0
    iget-object v7, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->msisdn:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->msisdn:Ljava/lang/String;

    if-nez v7, :cond_1

    .line 42
    :cond_0
    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/getNumberType.do"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "imsi"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->encryptedImsi:Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-string/jumbo v11, "encrypted"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const-string/jumbo v11, "1"

    aput-object v11, v9, v10

    invoke-static {v7, v9}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 80
    :goto_1
    const/4 v3, 0x0

    goto :goto_0

    .line 49
    :cond_1
    const/16 v7, 0x8

    new-array v0, v7, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string/jumbo v9, "000"

    aput-object v9, v0, v7

    const/4 v7, 0x1

    const-string/jumbo v9, "001"

    aput-object v9, v0, v7

    const/4 v7, 0x2

    const-string/jumbo v9, "010"

    aput-object v9, v0, v7

    const/4 v7, 0x3

    const-string/jumbo v9, "011"

    aput-object v9, v0, v7

    const/4 v7, 0x4

    const-string/jumbo v9, "100"

    aput-object v9, v0, v7

    const/4 v7, 0x5

    const-string/jumbo v9, "101"

    aput-object v9, v0, v7

    const/4 v7, 0x6

    const-string/jumbo v9, "110"

    aput-object v9, v0, v7

    const/4 v7, 0x7

    const-string/jumbo v9, "111"

    aput-object v9, v0, v7

    .line 53
    .local v0, "array":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 55
    .local v6, "testXmlCodeFound":Z
    array-length v9, v0

    move v7, v8

    :goto_2
    if-ge v7, v9, :cond_2

    aget-object v5, v0, v7

    .line 56
    .local v5, "s":Ljava/lang/String;
    iget-object v10, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->msisdn:Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 57
    const/4 v6, 0x1

    .line 62
    .end local v5    # "s":Ljava/lang/String;
    :cond_2
    if-eqz v6, :cond_4

    .line 63
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "http://202.4.201.24/voip/test/2Nprepaid/2Nprepaid"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v9, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->msisdn:Ljava/lang/String;

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, ".xml"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Object;

    .line 64
    invoke-static {v7, v9}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 55
    .restart local v5    # "s":Ljava/lang/String;
    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 67
    .end local v5    # "s":Ljava/lang/String;
    :cond_4
    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/getNumberType.do"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "msisdn"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/pccw/mobile/server/CheckNumberTypeApi;->msisdn:Ljava/lang/String;

    aput-object v11, v9, v10

    invoke-static {v7, v9}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto/16 :goto_1

    .line 84
    .end local v0    # "array":[Ljava/lang/String;
    .end local v6    # "testXmlCodeFound":Z
    :catch_0
    move-exception v1

    .line 90
    .local v1, "e":Ljava/lang/Exception;
    add-int/lit8 v4, v4, 0x1

    .line 91
    goto/16 :goto_0

    .line 95
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_5
    return-object v2
.end method
