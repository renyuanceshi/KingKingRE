.class public Lcom/pccw/mobile/server/SendSMSSyncApi;
.super Lcom/pccw/mobile/server/api/SyncApiServerConnection;
.source "SendSMSSyncApi.java"


# instance fields
.field private context:Landroid/content/Context;

.field private message:Ljava/lang/String;

.field private recipientlist:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private response:Lcom/pccw/mobile/server/response/SendSMSResponse;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "recipient"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/SyncApiServerConnection;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->context:Landroid/content/Context;

    .line 39
    invoke-virtual {p0, p2}, Lcom/pccw/mobile/server/SendSMSSyncApi;->getArrayListForOneRecipient(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->recipientlist:Ljava/util/ArrayList;

    .line 40
    iput-object p3, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->message:Ljava/lang/String;

    .line 41
    new-instance v0, Lcom/pccw/mobile/server/response/SendSMSResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/server/response/SendSMSResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->response:Lcom/pccw/mobile/server/response/SendSMSResponse;

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 30
    .local p2, "recipientlist":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/SyncApiServerConnection;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->context:Landroid/content/Context;

    .line 32
    iput-object p2, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->recipientlist:Ljava/util/ArrayList;

    .line 33
    iput-object p3, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->message:Ljava/lang/String;

    .line 34
    new-instance v0, Lcom/pccw/mobile/server/response/SendSMSResponse;

    invoke-direct {v0}, Lcom/pccw/mobile/server/response/SendSMSResponse;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->response:Lcom/pccw/mobile/server/response/SendSMSResponse;

    .line 35
    return-void
.end method

.method private getAESResult(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "sender"    # Ljava/lang/String;
    .param p2, "recipients"    # Ljava/lang/String;

    .prologue
    .line 109
    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string/jumbo v7, "yyyyMMddHHmmss"

    invoke-direct {v4, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 110
    .local v4, "format":Ljava/text/SimpleDateFormat;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 111
    .local v8, "time":J
    new-instance v1, Ljava/sql/Date;

    invoke-direct {v1, v8, v9}, Ljava/sql/Date;-><init>(J)V

    .line 112
    .local v1, "d1":Ljava/sql/Date;
    invoke-virtual {v4, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    .line 113
    .local v6, "t1":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 115
    .local v3, "entity":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v10, "KingKing"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/pccw/mobile/sip/util/M5DUtils;->ecodeByMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 116
    .local v5, "m5dResult":Ljava/lang/String;
    const-string/jumbo v0, ""

    .line 119
    .local v0, "aesResult":Ljava/lang/String;
    :try_start_0
    invoke-static {v5, v3}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 125
    :goto_0
    return-object v0

    .line 121
    :catch_0
    move-exception v2

    .line 122
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getSender()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->getPhoneWithHKCountryCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public XmlElement(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .locals 2
    .param p1, "localName"    # Ljava/lang/String;
    .param p2, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 129
    const-string/jumbo v0, "resultcode"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 130
    iget-object v0, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->response:Lcom/pccw/mobile/server/response/SendSMSResponse;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/SendSMSResponse;->resultCode:Ljava/lang/String;

    .line 136
    :cond_0
    :goto_0
    return-void

    .line 131
    :cond_1
    const-string/jumbo v0, "message"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 132
    iget-object v0, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->response:Lcom/pccw/mobile/server/response/SendSMSResponse;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/SendSMSResponse;->message:Ljava/lang/String;

    goto :goto_0

    .line 133
    :cond_2
    const-string/jumbo v0, "msgid"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->response:Lcom/pccw/mobile/server/response/SendSMSResponse;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/pccw/mobile/server/response/SendSMSResponse;->serverMessageId:Ljava/lang/String;

    goto :goto_0
.end method

.method public getArrayListForOneRecipient(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .param p1, "recipient"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v0, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    return-object v0
.end method

.method public postToServer()Lcom/pccw/mobile/server/api/ApiResponse;
    .locals 13

    .prologue
    const/4 v12, 0x2

    .line 51
    const/4 v5, 0x0

    .line 52
    .local v5, "retryCount":I
    const/4 v4, 0x1

    .line 54
    .local v4, "retry":Z
    invoke-direct {p0}, Lcom/pccw/mobile/server/SendSMSSyncApi;->getSender()Ljava/lang/String;

    move-result-object v7

    .line 55
    .local v7, "sender":Ljava/lang/String;
    iget-object v8, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->recipientlist:Ljava/util/ArrayList;

    invoke-static {v8}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, "recipientString":Ljava/lang/String;
    invoke-direct {p0, v7, v3}, Lcom/pccw/mobile/server/SendSMSSyncApi;->getAESResult(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 58
    .local v2, "r":Ljava/lang/String;
    :cond_0
    :goto_0
    if-eqz v4, :cond_3

    if-ge v5, v12, :cond_3

    .line 59
    const/4 v4, 0x0

    .line 60
    const/4 v1, 0x0

    .line 62
    .local v1, "hlContent":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v8

    iget-object v9, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->context:Landroid/content/Context;

    invoke-virtual {v8, v9}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 63
    const-string/jumbo v8, "KKSMS"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "sender="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " rec="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " msg="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->message:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " r="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const-string/jumbo v8, "https://sip.pccwmobile.com/voip02/deliverSMS.do"

    const/16 v9, 0x8

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "sender"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object v7, v9, v10

    const/4 v10, 0x2

    const-string/jumbo v11, "recipientlist"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    aput-object v3, v9, v10

    const/4 v10, 0x4

    const-string/jumbo v11, "msg"

    aput-object v11, v9, v10

    const/4 v10, 0x5

    iget-object v11, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->message:Ljava/lang/String;

    aput-object v11, v9, v10

    const/4 v10, 0x6

    const-string/jumbo v11, "r"

    aput-object v11, v9, v10

    const/4 v10, 0x7

    aput-object v2, v9, v10

    invoke-static {v8, v9}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 74
    :cond_1
    :goto_1
    if-nez v4, :cond_0

    .line 75
    invoke-static {v1}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 77
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/pccw/mobile/server/SendSMSSyncApi;->apiResponseXmlHandler(Ljava/lang/String;)V

    .line 78
    iget-object v8, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->response:Lcom/pccw/mobile/server/response/SendSMSResponse;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->response:Lcom/pccw/mobile/server/response/SendSMSResponse;

    iget-object v8, v8, Lcom/pccw/mobile/server/response/SendSMSResponse;->resultCode:Ljava/lang/String;

    const-string/jumbo v9, "0"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 79
    iget-object v8, p0, Lcom/pccw/mobile/server/SendSMSSyncApi;->response:Lcom/pccw/mobile/server/response/SendSMSResponse;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 100
    .end local v1    # "hlContent":Ljava/lang/String;
    :goto_2
    return-object v8

    .line 66
    .restart local v1    # "hlContent":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 67
    .local v0, "ex":Ljava/lang/Exception;
    add-int/lit8 v5, v5, 0x1

    .line 68
    const/4 v4, 0x1

    goto :goto_1

    .line 81
    .end local v0    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v6

    .line 82
    .local v6, "se":Ljava/lang/Exception;
    const/4 v4, 0x1

    .line 83
    add-int/lit8 v5, v5, 0x1

    .line 84
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0

    .line 87
    .end local v6    # "se":Ljava/lang/Exception;
    :cond_2
    const/4 v4, 0x1

    .line 88
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0

    .line 94
    .end local v1    # "hlContent":Ljava/lang/String;
    :cond_3
    if-eqz v4, :cond_4

    .line 100
    :cond_4
    const/4 v8, 0x0

    goto :goto_2
.end method
