.class public Lcom/pccw/mobile/sip/CheckVersionActivity;
.super Lcom/pccw/mobile/sip/BaseActivity;
.source "CheckVersionActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;,
        Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;,
        Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;
    }
.end annotation


# static fields
.field private static final OS_TYPE:Ljava/lang/String; = "android_default"

.field private static final PLAY_SERVICES_RESOLUTION_REQUEST:I = 0x2328

.field private static lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;


# instance fields
.field imRegResponse:Lcom/pccw/mobile/server/response/IMRegistrationResponse;

.field private isWaitingWifiFinish:Z

.field private messageDownloader:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

.field regid:Ljava/lang/String;

.field private retrieveVersionInfo:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

.field private splashScreenStartTime:J

.field private splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

.field private waitingWifiThr:Ljava/lang/Thread;

.field private wifiManager:Landroid/net/wifi/WifiManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    sput-object v0, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 52
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActivity;-><init>()V

    .line 56
    iput-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->retrieveVersionInfo:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    .line 57
    iput-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->messageDownloader:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    .line 59
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenStartTime:J

    .line 60
    iput-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    .line 64
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->isWaitingWifiFinish:Z

    .line 66
    iput-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->imRegResponse:Lcom/pccw/mobile/server/response/IMRegistrationResponse;

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/CheckVersionActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->isWaitingWifiFinish:Z

    return v0
.end method

.method static synthetic access$002(Lcom/pccw/mobile/sip/CheckVersionActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->isWaitingWifiFinish:Z

    return p1
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->contResume()V

    return-void
.end method

.method static synthetic access$1000(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->gotoNextActivityTask()V

    return-void
.end method

.method static synthetic access$300(JLandroid/content/Context;)Lcom/pccw/mobile/sip/CheckVersionResponse;
    .locals 2
    .param p0, "x0"    # J
    .param p2, "x1"    # Landroid/content/Context;

    .prologue
    .line 52
    invoke-static {p0, p1, p2}, Lcom/pccw/mobile/sip/CheckVersionActivity;->callCheckVersionApi(JLandroid/content/Context;)Lcom/pccw/mobile/sip/CheckVersionResponse;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/CheckVersionActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->gotoNextActivity()V

    return-void
.end method

.method static synthetic access$600(Lcom/pccw/mobile/sip/CheckVersionActivity;)Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->messageDownloader:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    return-object v0
.end method

.method static synthetic access$602(Lcom/pccw/mobile/sip/CheckVersionActivity;Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;)Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;
    .param p1, "x1"    # Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->messageDownloader:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    return-object p1
.end method

.method static synthetic access$900(Lcom/pccw/mobile/sip/CheckVersionActivity;)J
    .locals 2
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CheckVersionActivity;

    .prologue
    .line 52
    iget-wide v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenStartTime:J

    return-wide v0
.end method

.method private static callCheckVersionApi(JLandroid/content/Context;)Lcom/pccw/mobile/sip/CheckVersionResponse;
    .locals 16
    .param p0, "forceCheckTime"    # J
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 859
    sget-object v11, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    if-eqz v11, :cond_1

    .line 860
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    sget-object v11, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-wide v14, v11, Lcom/pccw/mobile/sip/CheckVersionResponse;->timestamp:J

    sub-long/2addr v12, v14

    cmp-long v11, v12, p0

    if-gez v11, :cond_1

    .line 861
    sget-object v5, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    .line 889
    :cond_0
    :goto_0
    return-object v5

    .line 863
    :cond_1
    const/4 v6, 0x0

    .line 864
    .local v6, "retryCount":I
    const/4 v4, 0x1

    .line 865
    .local v4, "needTry":Z
    :goto_1
    const/4 v11, 0x2

    if-ge v6, v11, :cond_2

    if-eqz v4, :cond_2

    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 867
    :try_start_0
    const-string/jumbo v11, "http://sip.pccwmobile.com/voip02/version.do"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string/jumbo v14, "os"

    aput-object v14, v12, v13

    const/4 v13, 0x1

    const-string/jumbo v14, "android_default"

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 869
    .local v3, "hlContent":Ljava/lang/String;
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v8

    .line 870
    .local v8, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v8}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v7

    .line 871
    .local v7, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v7}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v10

    .line 872
    .local v10, "xr":Lorg/xml/sax/XMLReader;
    new-instance v9, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;

    invoke-direct {v9}, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;-><init>()V

    .line 873
    .local v9, "xmlHandler":Lcom/pccw/mobile/sip/CheckVersionXmlHandler;
    invoke-interface {v10, v9}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 874
    new-instance v11, Lorg/xml/sax/InputSource;

    new-instance v12, Ljava/io/StringReader;

    invoke-direct {v12, v3}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v11, v12}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v10, v11}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 875
    iget-object v5, v9, Lcom/pccw/mobile/sip/CheckVersionXmlHandler;->res:Lcom/pccw/mobile/sip/CheckVersionResponse;

    .line 876
    .local v5, "resp":Lcom/pccw/mobile/sip/CheckVersionResponse;
    const/4 v4, 0x0

    .line 877
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v12

    iput-wide v12, v5, Lcom/pccw/mobile/sip/CheckVersionResponse;->timestamp:J

    .line 878
    const-string/jumbo v11, "0"

    iget-object v12, v5, Lcom/pccw/mobile/sip/CheckVersionResponse;->resultcode:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    iget-object v11, v5, Lcom/pccw/mobile/sip/CheckVersionResponse;->app_version:Ljava/lang/String;

    invoke-static {v11}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 879
    sput-object v5, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 883
    .end local v3    # "hlContent":Ljava/lang/String;
    .end local v5    # "resp":Lcom/pccw/mobile/sip/CheckVersionResponse;
    .end local v7    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v8    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v9    # "xmlHandler":Lcom/pccw/mobile/sip/CheckVersionXmlHandler;
    .end local v10    # "xr":Lorg/xml/sax/XMLReader;
    :catch_0
    move-exception v2

    .line 886
    .local v2, "e":Ljava/lang/Exception;
    add-int/lit8 v6, v6, 0x1

    .line 887
    goto :goto_1

    .line 889
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public static canSkipCheckVersion(Landroid/content/Context;)Z
    .locals 14
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 949
    const/4 v0, 0x0

    .line 952
    .local v0, "currentVersion":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v9

    iget-object v0, v9, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 958
    :goto_0
    sget-object v9, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    if-eqz v9, :cond_4

    .line 959
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v9

    iget-object v9, v9, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    .line 960
    invoke-virtual {v9}, Lcom/pccw/mobile/sip/ServerMessageController;->lastMessageDownloadSuccess()Z

    move-result v2

    .line 961
    .local v2, "lastMsgDownloadSucc":Z
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isClientStateRegistered(Landroid/content/Context;)Z

    move-result v4

    .line 962
    .local v4, "registedClientState":Z
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    sget-object v9, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-wide v12, v9, Lcom/pccw/mobile/sip/CheckVersionResponse;->timestamp:J

    sub-long/2addr v10, v12

    const-wide/32 v12, 0x6ddd00

    cmp-long v9, v10, v12

    if-lez v9, :cond_1

    move v1, v7

    .line 964
    .local v1, "forceCheckVersionTimeOver":Z
    :goto_1
    sget-object v9, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    iget-object v9, v9, Lcom/pccw/mobile/sip/CheckVersionResponse;->app_version:Ljava/lang/String;

    invoke-static {v0, v9}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerMajorVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    .line 966
    .local v3, "newerMajorVersion":Z
    invoke-static {p0, v8}, Lcom/pccw/mobile/sip/ClientStateManager;->checkSimState(Landroid/content/Context;Z)I

    move-result v9

    if-ne v9, v7, :cond_2

    move v5, v7

    .line 968
    .local v5, "simChanged":Z
    :goto_2
    if-nez v2, :cond_0

    if-nez v4, :cond_3

    :cond_0
    if-nez v1, :cond_3

    if-nez v3, :cond_3

    if-nez v5, :cond_3

    move v6, v7

    .line 985
    .end local v1    # "forceCheckVersionTimeOver":Z
    .end local v2    # "lastMsgDownloadSucc":Z
    .end local v3    # "newerMajorVersion":Z
    .end local v4    # "registedClientState":Z
    .end local v5    # "simChanged":Z
    :goto_3
    return v6

    .restart local v2    # "lastMsgDownloadSucc":Z
    .restart local v4    # "registedClientState":Z
    :cond_1
    move v1, v8

    .line 962
    goto :goto_1

    .restart local v1    # "forceCheckVersionTimeOver":Z
    .restart local v3    # "newerMajorVersion":Z
    :cond_2
    move v5, v8

    .line 966
    goto :goto_2

    .restart local v5    # "simChanged":Z
    :cond_3
    move v6, v8

    .line 968
    goto :goto_3

    .end local v1    # "forceCheckVersionTimeOver":Z
    .end local v2    # "lastMsgDownloadSucc":Z
    .end local v3    # "newerMajorVersion":Z
    .end local v4    # "registedClientState":Z
    .end local v5    # "simChanged":Z
    :cond_4
    move v6, v8

    .line 985
    goto :goto_3

    .line 953
    :catch_0
    move-exception v9

    goto :goto_0
.end method

.method private checkBattery()V
    .locals 4

    .prologue
    .line 93
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v2, v3, :cond_0

    .line 94
    const-string/jumbo v2, "power"

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 95
    .local v1, "pm":Landroid/os/PowerManager;
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 96
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 97
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "package:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 99
    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    .line 102
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "pm":Landroid/os/PowerManager;
    :cond_0
    return-void
.end method

.method private static checkPlayServices(Landroid/content/Context;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 227
    invoke-static {p0}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    .line 228
    .local v0, "resultCode":I
    if-eqz v0, :cond_0

    .line 242
    const/4 v1, 0x0

    .line 244
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static clearLastSuccessfulCheckResponse()V
    .locals 1

    .prologue
    .line 251
    const/4 v0, 0x0

    sput-object v0, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    .line 252
    return-void
.end method

.method private contResume()V
    .locals 6

    .prologue
    .line 177
    invoke-static {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->canSkipCheckVersion(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/pccw/mobile/sip/CheckVersionActivity;->lastSuccessfulCheckVersionResponse:Lcom/pccw/mobile/sip/CheckVersionResponse;

    if-eqz v2, :cond_0

    .line 179
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->gotoNextActivity()V

    .line 180
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenStartTime:J

    .line 217
    :goto_0
    return-void

    .line 185
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenStartTime:J

    .line 187
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 188
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 190
    .local v1, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f07006a

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 191
    const v2, 0x7f020436

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 192
    const v2, 0x7f07006b

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 193
    const v2, 0x7f07015b

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/pccw/mobile/sip/CheckVersionActivity$2;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$2;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 201
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 203
    .local v0, "errorDialog":Landroid/app/AlertDialog;
    new-instance v2, Lcom/pccw/mobile/sip/CheckVersionActivity$3;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$3;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 210
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 213
    .end local v0    # "errorDialog":Landroid/app/AlertDialog;
    .end local v1    # "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    :cond_1
    new-instance v2, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;Lcom/pccw/mobile/sip/CheckVersionActivity$1;)V

    iput-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->retrieveVersionInfo:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    .line 214
    iget-object v2, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->retrieveVersionInfo:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method private getDnFromServerAndStroeToPreference()V
    .locals 4

    .prologue
    .line 1084
    new-instance v1, Lcom/pccw/mobile/sip/CheckVersionActivity$4;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$4;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    .line 1110
    .local v1, "listener":Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;
    new-instance v2, Lcom/pccw/sms/service/GetMsisdnByImsiService;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lcom/pccw/sms/service/GetMsisdnByImsiService;-><init>(Lcom/pccw/sms/service/listener/IGetMsisdnByImsiListener;Landroid/content/Context;)V

    .line 1112
    .local v2, "service":Lcom/pccw/sms/service/GetMsisdnByImsiService;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedPccwImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/pccw/sms/service/GetMsisdnByImsiService;->callApiAndStoreDnToPreference(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/pccw/exception/NoNetworkException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1116
    :goto_0
    return-void

    .line 1113
    :catch_0
    move-exception v0

    .line 1114
    .local v0, "e":Lcom/pccw/exception/NoNetworkException;
    invoke-virtual {v0}, Lcom/pccw/exception/NoNetworkException;->printStackTrace()V

    goto :goto_0
.end method

.method private gotoNextActivity()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 990
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 991
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->cancel(Z)Z

    .line 992
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 993
    new-instance v0, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;Lcom/pccw/mobile/sip/CheckVersionActivity$1;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    .line 994
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    new-array v1, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 996
    :cond_1
    return-void
.end method

.method private gotoNextActivityTask()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 999
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/pccw/mobile/sip/ClientStateManager;->checkSimState(Landroid/content/Context;Z)I

    move-result v0

    .line 1000
    .local v0, "state":I
    if-eqz v0, :cond_0

    .line 1001
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    iget v1, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v1, :cond_0

    .line 1002
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 1005
    :cond_0
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->checkPostpaidPrepaidMode(Landroid/content/Context;)I

    move-result v1

    const/16 v2, 0x63

    if-ne v1, v2, :cond_2

    .line 1006
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1011
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    .line 1077
    :goto_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1078
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->finish()V

    .line 1079
    :cond_1
    return-void

    .line 1014
    :cond_2
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->checkPostpaidPrepaidMode(Landroid/content/Context;)I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_4

    .line 1015
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 1020
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isGoingToResetPrepaidAccount(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1022
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/pccw/mobile/sip/ClientStateManager;->setIsGoingToResetPrepaidAccount(Landroid/content/Context;Z)Z

    .line 1024
    :cond_3
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1026
    :cond_4
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->checkPostpaidPrepaidMode(Landroid/content/Context;)I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_6

    .line 1027
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 1031
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isGoingToResetPrepaidAccount(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 1033
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/pccw/mobile/sip/ClientStateManager;->setIsGoingToResetPrepaidAccount(Landroid/content/Context;Z)Z

    .line 1035
    :cond_5
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1037
    :cond_6
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->checkPostpaidPrepaidMode(Landroid/content/Context;)I

    move-result v1

    const/4 v2, 0x7

    if-ne v1, v2, :cond_8

    .line 1038
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 1043
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isGoingToResetPrepaidAccount(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 1045
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v3}, Lcom/pccw/mobile/sip/ClientStateManager;->setIsGoingToResetPrepaidAccount(Landroid/content/Context;Z)Z

    .line 1047
    :cond_7
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1049
    :cond_8
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPostpaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1050
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/TAndCActivity;->isHKTPostpaidTAndCRead(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 1054
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1056
    :cond_9
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1057
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/TAndCActivity;->isCSLPostpaidTAndCRead(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 1061
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1063
    :cond_a
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 1064
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/TAndCActivity;->isHKTPrepaidTAndCRead(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_b

    .line 1067
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1068
    :cond_b
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_c

    .line 1069
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/TAndCActivity;->isCSLPrepaidTAndCRead(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_c

    .line 1072
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1074
    :cond_c
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lorg/linphone/LinphoneActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0
.end method

.method private showCannotGetMsisdnAndQuitAppDialog()V
    .locals 5

    .prologue
    .line 1134
    const-string/jumbo v2, "Cannot get nubmer"

    .line 1136
    .local v2, "errorMessage":Ljava/lang/String;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1138
    .local v1, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    const v3, 0x7f07006a

    .line 1139
    invoke-virtual {p0, v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1138
    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1140
    const v3, 0x7f020436

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 1141
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1142
    const v3, 0x104000a

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1144
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1146
    .local v0, "errorDialog":Landroid/app/AlertDialog;
    new-instance v3, Lcom/pccw/mobile/sip/CheckVersionActivity$6;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$6;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1154
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1155
    return-void
.end method

.method private showNoWifiAndQuitAppDialog()V
    .locals 3

    .prologue
    .line 1119
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1121
    .local v0, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f07006a

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1122
    const v1, 0x7f020436

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 1123
    const v1, 0x7f07006b

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1124
    const v1, 0x7f07015b

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/mobile/sip/CheckVersionActivity$5;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$5;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1131
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 74
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 77
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 78
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "android.permission.READ_CONTACTS"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "android.permission.WRITE_CONTACTS"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "android.permission.CAMERA"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "android.permission.RECORD_AUDIO"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "android.permission.ACCESS_FINE_LOCATION"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "android.permission.ACCESS_COARSE_LOCATION"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "android.permission.READ_PHONE_STATE"

    aput-object v2, v0, v1

    const/16 v1, 0x3e8

    invoke-static {p0, v0, v1}, Lcom/pccw/mobile/util/PermissionUtils;->checkAndRequestMorePermissions(Landroid/content/Context;[Ljava/lang/String;I)V

    .line 85
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    if-nez v0, :cond_1

    .line 86
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    new-instance v1, Lcom/pccw/mobile/sip/ServerMessageController;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/ServerMessageController;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    .line 88
    :cond_1
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->checkBattery()V

    .line 90
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 168
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->isWaitingWifiFinish:Z

    .line 169
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->waitingWifiThr:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->waitingWifiThr:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 171
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->waitingWifiThr:Ljava/lang/Thread;

    .line 173
    :cond_0
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onDestroy()V

    .line 174
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 155
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onPause()V

    .line 158
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->retrieveVersionInfo:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->retrieveVersionInfo:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->retrieveVersionInfo:Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity$RetrieveVersionInfo;->cancel(Z)Z

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->messageDownloader:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->messageDownloader:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 161
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->messageDownloader:Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity$MessageDownloader;->cancel(Z)Z

    .line 162
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_2

    .line 163
    iget-object v0, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->splashScreenTimerTask:Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity$SplashScreenTimerTask;->cancel(Z)Z

    .line 164
    :cond_2
    return-void
.end method

.method protected onResume()V
    .locals 3

    .prologue
    .line 106
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onResume()V

    .line 112
    const v1, 0x7f04007b

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CheckVersionActivity;->setContentView(I)V

    .line 113
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "wifi"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    .line 114
    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    .line 115
    .local v0, "wifiEnabled":Z
    if-nez v0, :cond_0

    .line 116
    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->wifiManager:Landroid/net/wifi/WifiManager;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/net/wifi/WifiManager;->setWifiEnabled(Z)Z

    .line 117
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/pccw/mobile/sip/CheckVersionActivity$1;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/CheckVersionActivity$1;-><init>(Lcom/pccw/mobile/sip/CheckVersionActivity;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->waitingWifiThr:Ljava/lang/Thread;

    .line 147
    iget-object v1, p0, Lcom/pccw/mobile/sip/CheckVersionActivity;->waitingWifiThr:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 151
    :goto_0
    return-void

    .line 149
    :cond_0
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CheckVersionActivity;->contResume()V

    goto :goto_0
.end method
