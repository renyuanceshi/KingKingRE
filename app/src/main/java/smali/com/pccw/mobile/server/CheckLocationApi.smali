.class public Lcom/pccw/mobile/server/CheckLocationApi;
.super Lcom/pccw/mobile/server/api/ApiServerConnection;
.source "CheckLocationApi.java"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/mobile/server/api/ApiResponseListener;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    new-instance v0, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;

    invoke-direct {v0}, Lcom/pccw/mobile/server/xml/CheckLocationXmlHandler;-><init>()V

    invoke-direct {p0, v0}, Lcom/pccw/mobile/server/api/ApiServerConnection;-><init>(Lcom/pccw/mobile/server/xml/ApiXmlDefaultHandler;)V

    .line 19
    iput-object p2, p0, Lcom/pccw/mobile/server/CheckLocationApi;->context:Landroid/content/Context;

    .line 20
    iput-object p1, p0, Lcom/pccw/mobile/server/CheckLocationApi;->apiResponseListener:Lcom/pccw/mobile/server/api/ApiResponseListener;

    .line 21
    return-void
.end method


# virtual methods
.method public postToServer()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v9, 0x2

    .line 25
    const/4 v1, 0x0

    .line 26
    .local v1, "hlContent":Ljava/lang/String;
    const/4 v3, 0x0

    .line 27
    .local v3, "retryCount":I
    const/4 v2, 0x1

    .line 29
    .local v2, "retry":Z
    :cond_0
    :goto_0
    if-eqz v2, :cond_1

    if-ge v3, v9, :cond_1

    .line 30
    const/4 v2, 0x0

    .line 32
    :try_start_0
    iget-object v5, p0, Lcom/pccw/mobile/server/CheckLocationApi;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v6, p0, Lcom/pccw/mobile/server/CheckLocationApi;->context:Landroid/content/Context;

    .line 33
    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    .line 32
    invoke-virtual {v5, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    iget-object v4, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 34
    .local v4, "versionName":Ljava/lang/String;
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v5

    iget-object v6, p0, Lcom/pccw/mobile/server/CheckLocationApi;->context:Landroid/content/Context;

    invoke-virtual {v5, v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 35
    const-string/jumbo v5, "https://sip.pccwmobile.com/voip02/checkLocation.do"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string/jumbo v8, "version"

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v4, v6, v7

    const/4 v7, 0x2

    const-string/jumbo v8, "os"

    aput-object v8, v6, v7

    const/4 v7, 0x3

    const-string/jumbo v8, "Android"

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 38
    .end local v4    # "versionName":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 39
    .local v0, "ex":Ljava/lang/Exception;
    add-int/lit8 v3, v3, 0x1

    .line 40
    const/4 v2, 0x1

    .line 45
    goto :goto_0

    .line 47
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    if-eqz v2, :cond_2

    .line 53
    :cond_2
    return-object v1
.end method
