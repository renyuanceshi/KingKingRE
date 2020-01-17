.class public Lorg/apache/http/impl/client/SystemDefaultHttpClient;
.super Lorg/apache/http/impl/client/DefaultHttpClient;
.source "SystemDefaultHttpClient.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 116
    invoke-direct {p0, v0, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 117
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/params/HttpParams;)V
    .locals 1
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 113
    return-void
.end method


# virtual methods
.method protected createClientConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .locals 5

    .prologue
    .line 121
    new-instance v0, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;

    invoke-static {}, Lorg/apache/http/impl/conn/SchemeRegistryFactory;->createSystemDefault()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 123
    .local v0, "connmgr":Lorg/apache/http/impl/conn/PoolingClientConnectionManager;
    const-string/jumbo v3, "http.keepAlive"

    const-string/jumbo v4, "true"

    invoke-static {v3, v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 124
    .local v2, "s":Ljava/lang/String;
    const-string/jumbo v3, "true"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 125
    const-string/jumbo v3, "http.maxConnections"

    const-string/jumbo v4, "5"

    invoke-static {v3, v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 126
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 127
    .local v1, "max":I
    invoke-virtual {v0, v1}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->setDefaultMaxPerRoute(I)V

    .line 128
    mul-int/lit8 v3, v1, 0x2

    invoke-virtual {v0, v3}, Lorg/apache/http/impl/conn/PoolingClientConnectionManager;->setMaxTotal(I)V

    .line 130
    .end local v1    # "max":I
    :cond_0
    return-object v0
.end method

.method protected createConnectionReuseStrategy()Lorg/apache/http/ConnectionReuseStrategy;
    .locals 3

    .prologue
    .line 141
    const-string/jumbo v1, "http.keepAlive"

    const-string/jumbo v2, "true"

    invoke-static {v1, v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 142
    .local v0, "s":Ljava/lang/String;
    const-string/jumbo v1, "true"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 143
    new-instance v1, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;

    invoke-direct {v1}, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;-><init>()V

    .line 145
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lorg/apache/http/impl/NoConnectionReuseStrategy;

    invoke-direct {v1}, Lorg/apache/http/impl/NoConnectionReuseStrategy;-><init>()V

    goto :goto_0
.end method

.method protected createHttpRoutePlanner()Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .locals 3

    .prologue
    .line 135
    new-instance v0, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;

    invoke-virtual {p0}, Lorg/apache/http/impl/client/SystemDefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v1

    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/conn/ProxySelectorRoutePlanner;-><init>(Lorg/apache/http/conn/scheme/SchemeRegistry;Ljava/net/ProxySelector;)V

    return-object v0
.end method
