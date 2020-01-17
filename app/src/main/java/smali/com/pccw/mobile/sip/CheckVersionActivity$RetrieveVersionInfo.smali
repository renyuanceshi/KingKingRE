.class Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;
.super Landroid/os/AsyncTask;
.source "CheckVersionActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CheckVersionActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RetrieveVersionInfo"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/pccw/mobile/sip/CheckVersionResponse;",
        ">;"
    }
.end annotation


# static fields
.field private static final errorGetNum:I = 0xa

.field private static final errorNoWifi:I = 0x0

.field private static final errorPostpaidBrandInvalid:I = 0x8

.field private static final errorSimExpired:I = 0x5

.field private static final errorSimIdle:I = 0x4

.field private static final errorSimNotAllowKKCSLPostpaid:I = 0x6

.field private static final errorSimNotAllowKKCSLPrepaid:I = 0x7

.field private static final errorSimNotAllowKKPrepaid:I = 0x3


# instance fields
.field private final TAG:Ljava/lang/String;

.field private checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

.field private checkNumberTypeXmlHandler:Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;

.field private errorCodeGetNum:I

.field private errorMessageType:I

.field final synthetic this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;


# direct methods
.method private constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 1

    .prologue
    .line 254
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 255
    const-class v0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->TAG:Ljava/lang/String;

    .line 271
    new-instance v0, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeXmlHandler:Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;

    return-void
.end method

.method synthetic constructor <init>(Lcom/pccw/mobile/sip/CheckVersionActivity;Lcom/pccw/mobile/sip/CheckVersionActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;
    .param p2, "x1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$1;

    .prologue
    .line 254
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    return-void
.end method

.method private CheckAndUpdateMessageVersion(Lcom/pccw/mobile/sip/CheckVersionResponse;)V
    .locals 7
    .param p1, "result"    # Lcom/pccw/mobile/sip/CheckVersionResponse;

    .prologue
    .line 783
    iget-object v3, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url:Ljava/lang/String;

    if-eqz v3, :cond_5

    .line 789
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLOne2freePostpaid(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 790
    sget-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_ONE2FREE:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    .line 791
    .local v0, "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    iget-object v2, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_one2free:Ljava/lang/String;

    .line 792
    .local v2, "messageVersion":Ljava/lang/String;
    iget-object v1, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_one2free:Ljava/lang/String;

    .line 817
    .local v1, "messageUrl":Ljava/lang/String;
    :goto_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    iget-object v3, v3, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    invoke-virtual {v3, v2, v0}, Lcom/pccw/mobile/sip/ServerMessageController;->needUpdateErrorMessageList(Ljava/lang/String;Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 819
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    new-instance v4, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    iget-object v5, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const/4 v6, 0x0

    invoke-direct {v4, v5, v6}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;Lcom/pccw/mobile/sip/CheckVersionActivity$1;)V

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$602(Lcom/pccw/mobile/sip/CheckVersionActivity;Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;)Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    .line 820
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$600(Lcom/pccw/mobile/sip/CheckVersionActivity;)Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    move-result-object v3

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const/4 v5, 0x1

    aput-object v2, v4, v5

    const/4 v5, 0x2

    .line 821
    invoke-virtual {v0}, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    .line 820
    invoke-virtual {v3, v4}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 853
    .end local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    .end local v1    # "messageUrl":Ljava/lang/String;
    .end local v2    # "messageVersion":Ljava/lang/String;
    :goto_1
    return-void

    .line 793
    :cond_0
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL1010Postpaid(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 794
    sget-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_1010:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    .line 795
    .restart local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    iget-object v2, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_1010:Ljava/lang/String;

    .line 796
    .restart local v2    # "messageVersion":Ljava/lang/String;
    iget-object v1, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_1010:Ljava/lang/String;

    .restart local v1    # "messageUrl":Ljava/lang/String;
    goto :goto_0

    .line 797
    .end local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    .end local v1    # "messageUrl":Ljava/lang/String;
    .end local v2    # "messageVersion":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 798
    sget-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_CSL_PREPAID:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    .line 799
    .restart local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    iget-object v2, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version_csl_prepaid:Ljava/lang/String;

    .line 800
    .restart local v2    # "messageVersion":Ljava/lang/String;
    iget-object v1, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url_csl_prepaid:Ljava/lang/String;

    .restart local v1    # "messageUrl":Ljava/lang/String;
    goto :goto_0

    .line 801
    .end local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    .end local v1    # "messageUrl":Ljava/lang/String;
    .end local v2    # "messageVersion":Ljava/lang/String;
    :cond_2
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKT(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 802
    sget-object v0, Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;->TYPE_PCCW:Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;

    .line 803
    .restart local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    iget-object v2, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_version:Ljava/lang/String;

    .line 804
    .restart local v2    # "messageVersion":Ljava/lang/String;
    iget-object v1, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->msg_url:Ljava/lang/String;

    .restart local v1    # "messageUrl":Ljava/lang/String;
    goto :goto_0

    .line 808
    .end local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    .end local v1    # "messageUrl":Ljava/lang/String;
    .end local v2    # "messageVersion":Ljava/lang/String;
    :cond_3
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$500(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    goto :goto_1

    .line 827
    .restart local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    .restart local v1    # "messageUrl":Ljava/lang/String;
    .restart local v2    # "messageVersion":Ljava/lang/String;
    :cond_4
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$500(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    goto :goto_1

    .line 852
    .end local v0    # "messageListType":Lcom/pccw/mobile/sip/ServerMessageController$MessageListType;
    .end local v1    # "messageUrl":Ljava/lang/String;
    .end local v2    # "messageVersion":Ljava/lang/String;
    :cond_5
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$500(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    goto :goto_1
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;Lcom/pccw/mobile/sip/CheckVersionResponse;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;
    .param p1, "x1"    # Lcom/pccw/mobile/sip/CheckVersionResponse;

    .prologue
    .line 254
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNewTAndCVersion(Lcom/pccw/mobile/sip/CheckVersionResponse;)V

    return-void
.end method

.method private apiResponseXmlHandler(Ljava/lang/String;)V
    .locals 6
    .param p1, "hlContent"    # Ljava/lang/String;

    .prologue
    .line 546
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    .line 547
    .local v2, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v1

    .line 548
    .local v1, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v1}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v3

    .line 549
    .local v3, "xr":Lorg/xml/sax/XMLReader;
    iget-object v4, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeXmlHandler:Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;

    invoke-interface {v3, v4}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 550
    new-instance v4, Lorg/xml/sax/InputSource;

    new-instance v5, Ljava/io/StringReader;

    invoke-direct {v5, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v3, v4}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 554
    .end local v1    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v2    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v3    # "xr":Lorg/xml/sax/XMLReader;
    :goto_0
    return-void

    .line 551
    :catch_0
    move-exception v0

    .line 552
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 551
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_1
.end method

.method private checkNewTAndCVersion(Lcom/pccw/mobile/sip/CheckVersionResponse;)V
    .locals 2
    .param p1, "result"    # Lcom/pccw/mobile/sip/CheckVersionResponse;

    .prologue
    .line 767
    sget v0, Lcom/pccw/mobile/sip/TAndCActivity;->T_AND_C_NEW_VERSION_NOT_AVAILABLE:I

    .line 772
    .local v0, "checkNewTAndCVersionResult":I
    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {p1, v1}, Lcom/pccw/mobile/sip/TAndCActivity;->checkTAndCVersion(Lcom/pccw/mobile/sip/CheckVersionResponse;Landroid/content/Context;)I

    move-result v0

    .line 777
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->CheckAndUpdateMessageVersion(Lcom/pccw/mobile/sip/CheckVersionResponse;)V

    .line 779
    return-void
.end method

.method private checkNumberType(Ljava/lang/String;Ljava/lang/String;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;
    .locals 13
    .param p1, "encryptedImsi"    # Ljava/lang/String;
    .param p2, "msisdn"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x2

    const/4 v8, 0x0

    .line 478
    const/4 v2, 0x0

    .line 479
    .local v2, "hlContent":Ljava/lang/String;
    const/4 v4, 0x0

    .line 480
    .local v4, "retryCount":I
    const/4 v3, 0x1

    .line 481
    .local v3, "needTry":Z
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v7

    iget-object v9, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v7, v9}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 482
    :goto_0
    if-ge v4, v12, :cond_4

    if-eqz v3, :cond_4

    .line 483
    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "postToServer: "

    invoke-static {v7, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 485
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_0

    .line 486
    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/getNumberType.do"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "imsi"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object p1, v9, v10

    const/4 v10, 0x2

    const-string/jumbo v11, "encrypted"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const-string/jumbo v11, "1"

    aput-object v11, v9, v10

    invoke-static {v7, v9}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 524
    :goto_1
    const/4 v3, 0x0

    goto :goto_0

    .line 493
    :cond_0
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

    .line 497
    .local v0, "array":[Ljava/lang/String;
    const/4 v6, 0x0

    .line 499
    .local v6, "testXmlCodeFound":Z
    array-length v9, v0

    move v7, v8

    :goto_2
    if-ge v7, v9, :cond_1

    aget-object v5, v0, v7

    .line 500
    .local v5, "s":Ljava/lang/String;
    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 501
    const/4 v6, 0x1

    .line 506
    .end local v5    # "s":Ljava/lang/String;
    :cond_1
    if-eqz v6, :cond_3

    .line 507
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "http://202.4.201.24/voip/test/2Nprepaid/2Nprepaid"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, ".xml"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Object;

    .line 508
    invoke-static {v7, v9}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 499
    .restart local v5    # "s":Ljava/lang/String;
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 511
    .end local v5    # "s":Ljava/lang/String;
    :cond_3
    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/getNumberType.do"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "msisdn"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object p2, v9, v10

    invoke-static {v7, v9}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_1

    .line 528
    .end local v0    # "array":[Ljava/lang/String;
    .end local v6    # "testXmlCodeFound":Z
    :catch_0
    move-exception v1

    .line 534
    .local v1, "e":Ljava/lang/Exception;
    add-int/lit8 v4, v4, 0x1

    .line 535
    goto/16 :goto_0

    .line 538
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 539
    invoke-direct {p0, v2}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->apiResponseXmlHandler(Ljava/lang/String;)V

    .line 541
    :cond_5
    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeXmlHandler:Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;

    invoke-virtual {v7}, Lcom/pccw/mobile/server/xml/CheckNumberTypeXmlHandler;->getResponse()Lcom/pccw/mobile/server/api/ApiResponse;

    move-result-object v7

    check-cast v7, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    return-object v7
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/pccw/mobile/sip/CheckVersionResponse;
    .locals 9
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v8, 0x3

    const/4 v5, 0x1

    const/16 v7, 0xa

    const/16 v6, 0x63

    const/4 v2, 0x0

    .line 280
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    iget-object v4, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v3, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 283
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 455
    :goto_0
    const-wide/32 v4, 0x6ddd00

    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v4, v5, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->access$300(JLandroid/content/Context;)Lcom/pccw/mobile/sip/CheckVersionResponse;

    move-result-object v1

    .line 458
    .local v1, "result":Lcom/pccw/mobile/sip/CheckVersionResponse;
    if-nez v1, :cond_0

    .line 462
    iput v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    .line 463
    iput v6, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorCodeGetNum:I

    move-object v1, v2

    .line 470
    .end local v1    # "result":Lcom/pccw/mobile/sip/CheckVersionResponse;
    :cond_0
    :goto_1
    return-object v1

    .line 290
    :cond_1
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3, v5}, Lcom/pccw/mobile/sip/ClientStateManager;->checkSimState(Landroid/content/Context;Z)I

    move-result v3

    if-ne v3, v5, :cond_2

    .line 291
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->updatePrefForSimChange(Landroid/content/Context;)V

    .line 296
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    iget v3, v3, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v3, :cond_2

    .line 301
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    iget-object v4, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v3, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 305
    :cond_2
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isOperatorPccw(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    .line 306
    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isOperatorCSL(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 307
    :cond_3
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    .line 308
    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedPccwImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 313
    .local v0, "encryptedImsi":Ljava/lang/String;
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_5

    :cond_4
    move-object v1, v2

    .line 317
    goto :goto_1

    .line 335
    :cond_5
    const-string/jumbo v3, ""

    invoke-direct {p0, v0, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberType(Ljava/lang/String;Ljava/lang/String;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .line 337
    const-string/jumbo v3, "APITT"

    const-string/jumbo v4, "check CheckNumberTypeResponse"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    if-nez v3, :cond_6

    .line 344
    iput v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    .line 345
    iput v6, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorCodeGetNum:I

    move-object v1, v2

    .line 346
    goto :goto_1

    .line 347
    :cond_6
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    const-string/jumbo v4, "postpaid"

    .line 348
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 349
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->operator:Ljava/lang/String;

    const-string/jumbo v4, "hkt"

    .line 350
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 352
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const/4 v4, 0x2

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 358
    :cond_7
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowkk:Ljava/lang/String;

    const-string/jumbo v4, "false"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 362
    const/4 v3, 0x6

    iput v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    move-object v1, v2

    .line 363
    goto/16 :goto_1

    .line 366
    :cond_8
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->brand:Ljava/lang/String;

    const-string/jumbo v4, "one2free"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 368
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const/4 v4, 0x5

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 371
    :cond_9
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->brand:Ljava/lang/String;

    const-string/jumbo v4, "1010"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 373
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const/4 v4, 0x6

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 380
    :cond_a
    const/16 v3, 0x8

    iput v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    move-object v1, v2

    .line 381
    goto/16 :goto_1

    .line 384
    :cond_b
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    const-string/jumbo v4, "prepaid"

    .line 385
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 392
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowRS:Ljava/lang/String;

    const-string/jumbo v4, "true"

    .line 393
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_c

    .line 397
    iput v8, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    move-object v1, v2

    .line 398
    goto/16 :goto_1

    .line 399
    :cond_c
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->status:Ljava/lang/String;

    const-string/jumbo v4, "active"

    .line 400
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_e

    .line 402
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->status:Ljava/lang/String;

    const-string/jumbo v4, "idle"

    .line 403
    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 407
    const/4 v3, 0x4

    iput v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    :goto_2
    move-object v1, v2

    .line 415
    goto/16 :goto_1

    .line 412
    :cond_d
    const/4 v3, 0x5

    iput v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    goto :goto_2

    .line 418
    :cond_e
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simClass:Ljava/lang/String;

    const-string/jumbo v4, "Hello"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 420
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const/4 v4, 0x4

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 421
    :cond_f
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simClass:Ljava/lang/String;

    const-string/jumbo v4, "Normal"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 423
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3, v8}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 424
    :cond_10
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simClass:Ljava/lang/String;

    const-string/jumbo v4, "csl"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 426
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const/4 v4, 0x7

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 429
    :cond_11
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3, v6}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 435
    :cond_12
    iput v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    .line 436
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 437
    iput v6, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorCodeGetNum:I

    :goto_3
    move-object v1, v2

    .line 440
    goto/16 :goto_1

    .line 439
    :cond_13
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    iget-object v3, v3, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorCodeGetNum:I

    goto :goto_3

    .line 442
    .end local v0    # "encryptedImsi":Ljava/lang/String;
    :cond_14
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isSecondOperatorSim(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 444
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3, v6}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 450
    :cond_15
    iget-object v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-static {v3, v6}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidPrepaidMode(Landroid/content/Context;I)Z

    goto/16 :goto_0

    .line 469
    :cond_16
    const/4 v3, 0x0

    iput v3, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    move-object v1, v2

    .line 470
    goto/16 :goto_1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 254
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->doInBackground([Ljava/lang/Void;)Lcom/pccw/mobile/sip/CheckVersionResponse;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/pccw/mobile/sip/CheckVersionResponse;)V
    .locals 10
    .param p1, "result"    # Lcom/pccw/mobile/sip/CheckVersionResponse;

    .prologue
    .line 559
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->isCancelled()Z

    move-result v7

    if-nez v7, :cond_1

    .line 560
    if-eqz p1, :cond_4

    iget-object v7, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->resultcode:Ljava/lang/String;

    const-string/jumbo v8, "0"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 562
    const-string/jumbo v5, "0.0.0"

    .line 563
    .local v5, "tcurrentVersion":Ljava/lang/String;
    const/4 v6, 0x0

    .line 565
    .local v6, "tnewVersion":Ljava/lang/String;
    :try_start_0
    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v7}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    .line 566
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v7

    iget-object v5, v7, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 572
    :goto_0
    iget-object v6, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->app_version:Ljava/lang/String;

    .line 573
    if-nez v6, :cond_0

    .line 574
    move-object v6, v5

    .line 576
    :cond_0
    move-object v0, v5

    .line 577
    .local v0, "currentVersion":Ljava/lang/String;
    move-object v4, v6

    .line 578
    .local v4, "newVersion":Ljava/lang/String;
    invoke-static {v0, v4}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerMajorVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 580
    new-instance v7, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {v7, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v8, 0x1080027

    .line 581
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f0701c2

    .line 582
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f0701c1

    .line 583
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const/4 v8, 0x0

    .line 584
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f070231

    new-instance v9, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$2;

    invoke-direct {v9, p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$2;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;Lcom/pccw/mobile/sip/CheckVersionResponse;)V

    .line 585
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f0701c3

    new-instance v9, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$1;

    invoke-direct {v9, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$1;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;)V

    .line 601
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 613
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 764
    .end local v0    # "currentVersion":Ljava/lang/String;
    .end local v4    # "newVersion":Ljava/lang/String;
    .end local v5    # "tcurrentVersion":Ljava/lang/String;
    .end local v6    # "tnewVersion":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 615
    .restart local v0    # "currentVersion":Ljava/lang/String;
    .restart local v4    # "newVersion":Ljava/lang/String;
    .restart local v5    # "tcurrentVersion":Ljava/lang/String;
    .restart local v6    # "tnewVersion":Ljava/lang/String;
    :cond_2
    invoke-static {v0, v4}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerMinorVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 617
    new-instance v7, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {v7, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v8, 0x1080027

    .line 618
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f0701c2

    .line 619
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f0701c1

    .line 620
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const/4 v8, 0x1

    .line 621
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f070231

    new-instance v9, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;

    invoke-direct {v9, p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$4;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;Lcom/pccw/mobile/sip/CheckVersionResponse;)V

    .line 622
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f0701c3

    new-instance v9, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$3;

    invoke-direct {v9, p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$3;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;Lcom/pccw/mobile/sip/CheckVersionResponse;)V

    .line 638
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 652
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    .line 657
    :cond_3
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->checkNewTAndCVersion(Lcom/pccw/mobile/sip/CheckVersionResponse;)V

    goto :goto_1

    .line 659
    .end local v0    # "currentVersion":Ljava/lang/String;
    .end local v4    # "newVersion":Ljava/lang/String;
    .end local v5    # "tcurrentVersion":Ljava/lang/String;
    .end local v6    # "tnewVersion":Ljava/lang/String;
    :cond_4
    if-eqz p1, :cond_5

    .line 660
    const-string/jumbo v7, "check_version_error_"

    iget-object v8, p1, Lcom/pccw/mobile/sip/CheckVersionResponse;->resultcode:Ljava/lang/String;

    iget-object v9, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    .line 661
    invoke-virtual {v9}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 660
    invoke-static {v7, v8, v9}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 663
    .local v3, "errorMessage":Ljava/lang/String;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {v2, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 665
    .local v2, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const v8, 0x7f07006a

    .line 666
    invoke-virtual {v7, v8}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 665
    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 667
    const v7, 0x7f020436

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 668
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 669
    const v7, 0x104000a

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 671
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 673
    .local v1, "errorDialog":Landroid/app/AlertDialog;
    new-instance v7, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$5;

    invoke-direct {v7, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$5;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;)V

    invoke-virtual {v1, v7}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 690
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_1

    .line 693
    .end local v1    # "errorDialog":Landroid/app/AlertDialog;
    .end local v2    # "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    .end local v3    # "errorMessage":Ljava/lang/String;
    :cond_5
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {v2, v7}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 695
    .restart local v2    # "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const v8, 0x7f07006a

    .line 696
    invoke-virtual {v7, v8}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 695
    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 697
    const v7, 0x7f020436

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 699
    iget v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorMessageType:I

    packed-switch v7, :pswitch_data_0

    .line 739
    :pswitch_0
    const v7, 0x7f0700aa

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 740
    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    const v8, 0x7f07015b

    .line 741
    invoke-virtual {v7, v8}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$6;

    invoke-direct {v8, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$6;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;)V

    .line 740
    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 751
    :goto_2
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 752
    .restart local v1    # "errorDialog":Landroid/app/AlertDialog;
    new-instance v7, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$7;

    invoke-direct {v7, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo$7;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;)V

    invoke-virtual {v1, v7}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 759
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_1

    .line 701
    .end local v1    # "errorDialog":Landroid/app/AlertDialog;
    :pswitch_1
    const v7, 0x7f070150

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 702
    const v7, 0x104000a

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 705
    :pswitch_2
    const v7, 0x7f070158

    .line 706
    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 707
    const v7, 0x104000a

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 710
    :pswitch_3
    const v7, 0x7f070157

    .line 711
    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 712
    const v7, 0x104000a

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 715
    :pswitch_4
    const-string/jumbo v7, "get_number_info_not_allow_csl_postpaid"

    const-string/jumbo v8, ""

    iget-object v9, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    .line 717
    invoke-virtual {v9}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 715
    invoke-static {v7, v8, v9}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 718
    const v7, 0x104000a

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 721
    :pswitch_5
    const-string/jumbo v7, "get_number_info_not_allow_csl_prepaid"

    const-string/jumbo v8, ""

    iget-object v9, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    .line 723
    invoke-virtual {v9}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 721
    invoke-static {v7, v8, v9}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 724
    const v7, 0x104000a

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_2

    .line 727
    :pswitch_6
    const-string/jumbo v7, "get_number_info_brand_invalid"

    const-string/jumbo v8, ""

    iget-object v9, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    .line 729
    invoke-virtual {v9}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 727
    invoke-static {v7, v8, v9}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 730
    const v7, 0x104000a

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto/16 :goto_2

    .line 733
    :pswitch_7
    const-string/jumbo v7, "get_number_info_error_"

    iget v8, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->errorCodeGetNum:I

    .line 734
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->this$0:Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-virtual {v9}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    .line 733
    invoke-static {v7, v8, v9}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 735
    .restart local v3    # "errorMessage":Ljava/lang/String;
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 736
    const v7, 0x104000a

    const/4 v8, 0x0

    invoke-virtual {v2, v7, v8}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto/16 :goto_2

    .line 567
    .end local v2    # "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    .end local v3    # "errorMessage":Ljava/lang/String;
    .restart local v5    # "tcurrentVersion":Ljava/lang/String;
    .restart local v6    # "tnewVersion":Ljava/lang/String;
    :catch_0
    move-exception v7

    goto/16 :goto_0

    .line 699
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_7
    .end packed-switch
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 254
    check-cast p1, Lcom/pccw/mobile/sip/CheckVersionResponse;

    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->onPostExecute(Lcom/pccw/mobile/sip/CheckVersionResponse;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 275
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 276
    return-void
.end method
