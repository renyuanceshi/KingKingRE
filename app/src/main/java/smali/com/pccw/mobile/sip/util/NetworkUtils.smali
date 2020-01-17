.class public Lcom/pccw/mobile/sip/util/NetworkUtils;
.super Ljava/lang/Object;
.source "NetworkUtils.java"


# static fields
.field private static final instance:Lcom/pccw/mobile/sip/util/NetworkUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    new-instance v0, Lcom/pccw/mobile/sip/util/NetworkUtils;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/util/NetworkUtils;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/util/NetworkUtils;->instance:Lcom/pccw/mobile/sip/util/NetworkUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static getInstance()Lcom/pccw/mobile/sip/util/NetworkUtils;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/pccw/mobile/sip/util/NetworkUtils;->instance:Lcom/pccw/mobile/sip/util/NetworkUtils;

    return-object v0
.end method

.method public static isWifiAvailable(Landroid/content/Context;)Z
    .locals 9
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 26
    const-string/jumbo v5, "connectivity"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 28
    .local v1, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 29
    .local v0, "activeNetworkInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v5

    if-ne v5, v6, :cond_1

    move v5, v6

    :goto_0
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 31
    .local v2, "isWiFiNetwork":Ljava/lang/Boolean;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string/jumbo v8, "wifi"

    invoke-virtual {v5, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/wifi/WifiManager;

    .line 32
    .local v4, "wm":Landroid/net/wifi/WifiManager;
    invoke-virtual {v4}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v3

    .line 34
    .local v3, "wi":Landroid/net/wifi/WifiInfo;
    if-eqz v3, :cond_2

    .line 38
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 39
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getIpAddress()I

    move-result v5

    if-eqz v5, :cond_2

    .line 40
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getSupplicantState()Landroid/net/wifi/SupplicantState;

    move-result-object v5

    invoke-static {v5}, Landroid/net/wifi/WifiInfo;->getDetailedStateOf(Landroid/net/wifi/SupplicantState;)Landroid/net/NetworkInfo$DetailedState;

    move-result-object v5

    sget-object v8, Landroid/net/NetworkInfo$DetailedState;->OBTAINING_IPADDR:Landroid/net/NetworkInfo$DetailedState;

    if-eq v5, v8, :cond_0

    .line 41
    invoke-virtual {v3}, Landroid/net/wifi/WifiInfo;->getSupplicantState()Landroid/net/wifi/SupplicantState;

    move-result-object v5

    .line 40
    invoke-static {v5}, Landroid/net/wifi/WifiInfo;->getDetailedStateOf(Landroid/net/wifi/SupplicantState;)Landroid/net/NetworkInfo$DetailedState;

    move-result-object v5

    sget-object v8, Landroid/net/NetworkInfo$DetailedState;->CONNECTED:Landroid/net/NetworkInfo$DetailedState;

    if-ne v5, v8, :cond_2

    .line 45
    :cond_0
    :goto_1
    return v6

    .end local v2    # "isWiFiNetwork":Ljava/lang/Boolean;
    .end local v3    # "wi":Landroid/net/wifi/WifiInfo;
    .end local v4    # "wm":Landroid/net/wifi/WifiManager;
    :cond_1
    move v5, v7

    .line 29
    goto :goto_0

    .restart local v2    # "isWiFiNetwork":Ljava/lang/Boolean;
    .restart local v3    # "wi":Landroid/net/wifi/WifiInfo;
    .restart local v4    # "wm":Landroid/net/wifi/WifiManager;
    :cond_2
    move v6, v7

    .line 45
    goto :goto_1
.end method


# virtual methods
.method public isHomeNetwork(Landroid/content/Context;)Z
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 49
    const-string/jumbo v1, "phone"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 50
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->isNetworkRoaming()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isNoMobile(Landroid/content/Context;)Z
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 54
    const-string/jumbo v1, "phone"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 56
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getPhoneType()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
