.class public Lcom/pccwmobile/common/utilities/ConnectionManagerUtilities;
.super Ljava/lang/Object;
.source "ConnectionManagerUtilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isRoaming(Landroid/content/Context;)Ljava/lang/Boolean;
    .locals 5
    .param p0, "mContext"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 27
    const/4 v2, 0x0

    .line 28
    .local v2, "result":Ljava/lang/Boolean;
    const/4 v0, 0x0

    .line 29
    .local v0, "conMgr":Landroid/net/ConnectivityManager;
    const/4 v1, 0x0

    .line 31
    .local v1, "netInfo":Landroid/net/NetworkInfo;
    const-string/jumbo v3, "connectivity"

    .line 32
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "conMgr":Landroid/net/ConnectivityManager;
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 33
    .restart local v0    # "conMgr":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_0

    .line 35
    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 36
    if-eqz v1, :cond_0

    .line 38
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 40
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 49
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 50
    const/4 v1, 0x0

    .line 52
    return-object v2

    .line 44
    :cond_1
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto :goto_0
.end method

.method public static isUsingMobileData(Landroid/content/Context;)Ljava/lang/Boolean;
    .locals 6
    .param p0, "mContext"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    .line 95
    const/4 v3, 0x0

    .line 96
    .local v3, "result":Ljava/lang/Boolean;
    const/4 v0, 0x0

    .line 97
    .local v0, "conMgr":Landroid/net/ConnectivityManager;
    const/4 v2, 0x0

    .line 98
    .local v2, "mobileInfo":Landroid/net/NetworkInfo;
    const-string/jumbo v4, "connectivity"

    .line 99
    invoke-virtual {p0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "conMgr":Landroid/net/ConnectivityManager;
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 100
    .restart local v0    # "conMgr":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {v0, v5}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v2

    .line 103
    if-eqz v2, :cond_0

    .line 105
    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    .line 106
    .local v1, "isAvailable":Z
    if-eqz v1, :cond_1

    .line 108
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 117
    .end local v1    # "isAvailable":Z
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 118
    const/4 v2, 0x0

    .line 119
    return-object v3

    .line 112
    .restart local v1    # "isAvailable":Z
    :cond_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0
.end method

.method public static isUsingWifi(Landroid/content/Context;)Ljava/lang/Boolean;
    .locals 5
    .param p0, "mContext"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    .line 62
    const/4 v2, 0x0

    .line 63
    .local v2, "result":Ljava/lang/Boolean;
    const/4 v0, 0x0

    .line 64
    .local v0, "conMgr":Landroid/net/ConnectivityManager;
    const/4 v1, 0x0

    .line 66
    .local v1, "netInfo":Landroid/net/NetworkInfo;
    const-string/jumbo v3, "connectivity"

    .line 67
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "conMgr":Landroid/net/ConnectivityManager;
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 68
    .restart local v0    # "conMgr":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {v0, v4}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v1

    .line 72
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 74
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 82
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 83
    const/4 v1, 0x0

    .line 85
    return-object v2

    .line 78
    :cond_1
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto :goto_0
.end method
