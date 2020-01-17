.class public final Lorg/apache/http/conn/routing/RouteTracker;
.super Ljava/lang/Object;
.source "RouteTracker.java"

# interfaces
.implements Lorg/apache/http/conn/routing/RouteInfo;
.implements Ljava/lang/Cloneable;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private connected:Z

.field private layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

.field private final localAddress:Ljava/net/InetAddress;

.field private proxyChain:[Lorg/apache/http/HttpHost;

.field private secure:Z

.field private final targetHost:Lorg/apache/http/HttpHost;

.field private tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;)V
    .locals 1
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "local"    # Ljava/net/InetAddress;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    const-string/jumbo v0, "Target host"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    iput-object p1, p0, Lorg/apache/http/conn/routing/RouteTracker;->targetHost:Lorg/apache/http/HttpHost;

    .line 84
    iput-object p2, p0, Lorg/apache/http/conn/routing/RouteTracker;->localAddress:Ljava/net/InetAddress;

    .line 85
    sget-object v0, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    .line 86
    sget-object v0, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    .line 87
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/routing/HttpRoute;)V
    .locals 2
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;

    .prologue
    .line 108
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/http/conn/routing/RouteTracker;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;)V

    .line 109
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 363
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final connectProxy(Lorg/apache/http/HttpHost;Z)V
    .locals 4
    .param p1, "proxy"    # Lorg/apache/http/HttpHost;
    .param p2, "secure"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 131
    const-string/jumbo v0, "Proxy host"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 132
    iget-boolean v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    const-string/jumbo v3, "Already connected"

    invoke-static {v0, v3}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 133
    iput-boolean v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    .line 134
    new-array v0, v1, [Lorg/apache/http/HttpHost;

    aput-object p1, v0, v2

    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    .line 135
    iput-boolean p2, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    .line 136
    return-void

    :cond_0
    move v0, v2

    .line 132
    goto :goto_0
.end method

.method public final connectTarget(Z)V
    .locals 3
    .param p1, "secure"    # Z

    .prologue
    const/4 v1, 0x1

    .line 118
    iget-boolean v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    const-string/jumbo v2, "Already connected"

    invoke-static {v0, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 119
    iput-boolean v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    .line 120
    iput-boolean p1, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    .line 121
    return-void

    .line 118
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 275
    if-ne p1, p0, :cond_1

    .line 283
    :cond_0
    :goto_0
    return v1

    .line 278
    :cond_1
    instance-of v3, p1, Lorg/apache/http/conn/routing/RouteTracker;

    if-nez v3, :cond_2

    move v1, v2

    .line 279
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 282
    check-cast v0, Lorg/apache/http/conn/routing/RouteTracker;

    .line 283
    .local v0, "that":Lorg/apache/http/conn/routing/RouteTracker;
    iget-boolean v3, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    iget-boolean v4, v0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    if-ne v3, v4, :cond_3

    iget-boolean v3, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    iget-boolean v4, v0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    iget-object v4, v0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    iget-object v4, v0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    if-ne v3, v4, :cond_3

    iget-object v3, p0, Lorg/apache/http/conn/routing/RouteTracker;->targetHost:Lorg/apache/http/HttpHost;

    iget-object v4, v0, Lorg/apache/http/conn/routing/RouteTracker;->targetHost:Lorg/apache/http/HttpHost;

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/apache/http/conn/routing/RouteTracker;->localAddress:Ljava/net/InetAddress;

    iget-object v4, v0, Lorg/apache/http/conn/routing/RouteTracker;->localAddress:Ljava/net/InetAddress;

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    iget-object v4, v0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    invoke-static {v3, v4}, Lorg/apache/http/util/LangUtils;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0
.end method

.method public final getHopCount()I
    .locals 2

    .prologue
    .line 197
    const/4 v0, 0x0

    .line 198
    .local v0, "hops":I
    iget-boolean v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    if-eqz v1, :cond_0

    .line 199
    iget-object v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    if-nez v1, :cond_1

    .line 200
    const/4 v0, 0x1

    .line 205
    :cond_0
    :goto_0
    return v0

    .line 202
    :cond_1
    iget-object v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    array-length v1, v1

    add-int/lit8 v0, v1, 0x1

    goto :goto_0
.end method

.method public final getHopTarget(I)Lorg/apache/http/HttpHost;
    .locals 4
    .param p1, "hop"    # I

    .prologue
    .line 209
    const-string/jumbo v2, "Hop index"

    invoke-static {p1, v2}, Lorg/apache/http/util/Args;->notNegative(ILjava/lang/String;)I

    .line 210
    invoke-virtual {p0}, Lorg/apache/http/conn/routing/RouteTracker;->getHopCount()I

    move-result v0

    .line 211
    .local v0, "hopcount":I
    if-ge p1, v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    const-string/jumbo v3, "Hop index exceeds tracked route length"

    invoke-static {v2, v3}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 212
    const/4 v1, 0x0

    .line 213
    .local v1, "result":Lorg/apache/http/HttpHost;
    add-int/lit8 v2, v0, -0x1

    if-ge p1, v2, :cond_1

    .line 214
    iget-object v2, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    aget-object v1, v2, p1

    .line 219
    :goto_1
    return-object v1

    .line 211
    .end local v1    # "result":Lorg/apache/http/HttpHost;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 216
    .restart local v1    # "result":Lorg/apache/http/HttpHost;
    :cond_1
    iget-object v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->targetHost:Lorg/apache/http/HttpHost;

    goto :goto_1
.end method

.method public final getLayerType()Lorg/apache/http/conn/routing/RouteInfo$LayerType;
    .locals 1

    .prologue
    .line 239
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    return-object v0
.end method

.method public final getLocalAddress()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->localAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public final getProxyHost()Lorg/apache/http/HttpHost;
    .locals 2

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    goto :goto_0
.end method

.method public final getTargetHost()Lorg/apache/http/HttpHost;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->targetHost:Lorg/apache/http/HttpHost;

    return-object v0
.end method

.method public final getTunnelType()Lorg/apache/http/conn/routing/RouteInfo$TunnelType;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    return-object v0
.end method

.method public final hashCode()I
    .locals 6

    .prologue
    .line 304
    const/16 v2, 0x11

    .line 305
    .local v2, "hash":I
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->targetHost:Lorg/apache/http/HttpHost;

    invoke-static {v2, v5}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v2

    .line 306
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->localAddress:Ljava/net/InetAddress;

    invoke-static {v2, v5}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v2

    .line 307
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    if-eqz v5, :cond_0

    .line 308
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    .local v0, "arr$":[Lorg/apache/http/HttpHost;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 309
    .local v1, "element":Lorg/apache/http/HttpHost;
    invoke-static {v2, v1}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v2

    .line 308
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 312
    .end local v0    # "arr$":[Lorg/apache/http/HttpHost;
    .end local v1    # "element":Lorg/apache/http/HttpHost;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_0
    iget-boolean v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    invoke-static {v2, v5}, Lorg/apache/http/util/LangUtils;->hashCode(IZ)I

    move-result v2

    .line 313
    iget-boolean v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    invoke-static {v2, v5}, Lorg/apache/http/util/LangUtils;->hashCode(IZ)I

    move-result v2

    .line 314
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    invoke-static {v2, v5}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v2

    .line 315
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    invoke-static {v2, v5}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v2

    .line 316
    return v2
.end method

.method public final isConnected()Z
    .locals 1

    .prologue
    .line 227
    iget-boolean v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    return v0
.end method

.method public final isLayered()Z
    .locals 2

    .prologue
    .line 243
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    sget-object v1, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->LAYERED:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isSecure()Z
    .locals 1

    .prologue
    .line 247
    iget-boolean v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    return v0
.end method

.method public final isTunnelled()Z
    .locals 2

    .prologue
    .line 235
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    sget-object v1, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->TUNNELLED:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final layerProtocol(Z)V
    .locals 2
    .param p1, "secure"    # Z

    .prologue
    .line 183
    iget-boolean v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    const-string/jumbo v1, "No layered protocol unless connected"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 184
    sget-object v0, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->LAYERED:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    .line 185
    iput-boolean p1, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    .line 186
    return-void
.end method

.method public reset()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 93
    iput-boolean v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    .line 95
    sget-object v0, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    .line 96
    sget-object v0, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->PLAIN:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    .line 97
    iput-boolean v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    .line 98
    return-void
.end method

.method public final toRoute()Lorg/apache/http/conn/routing/HttpRoute;
    .locals 7

    .prologue
    .line 259
    iget-boolean v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/http/conn/routing/HttpRoute;

    iget-object v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->targetHost:Lorg/apache/http/HttpHost;

    iget-object v2, p0, Lorg/apache/http/conn/routing/RouteTracker;->localAddress:Ljava/net/InetAddress;

    iget-object v3, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    iget-boolean v4, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    iget-object v6, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/conn/routing/HttpRoute;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;[Lorg/apache/http/HttpHost;ZLorg/apache/http/conn/routing/RouteInfo$TunnelType;Lorg/apache/http/conn/routing/RouteInfo$LayerType;)V

    goto :goto_0
.end method

.method public final toString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 326
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lorg/apache/http/conn/routing/RouteTracker;->getHopCount()I

    move-result v5

    mul-int/lit8 v5, v5, 0x1e

    add-int/lit8 v5, v5, 0x32

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 328
    .local v1, "cab":Ljava/lang/StringBuilder;
    const-string/jumbo v5, "RouteTracker["

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->localAddress:Ljava/net/InetAddress;

    if-eqz v5, :cond_0

    .line 330
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->localAddress:Ljava/net/InetAddress;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 331
    const-string/jumbo v5, "->"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    :cond_0
    const/16 v5, 0x7b

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 334
    iget-boolean v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    if-eqz v5, :cond_1

    .line 335
    const/16 v5, 0x63

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 337
    :cond_1
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    sget-object v6, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->TUNNELLED:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    if-ne v5, v6, :cond_2

    .line 338
    const/16 v5, 0x74

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 340
    :cond_2
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->layered:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    sget-object v6, Lorg/apache/http/conn/routing/RouteInfo$LayerType;->LAYERED:Lorg/apache/http/conn/routing/RouteInfo$LayerType;

    if-ne v5, v6, :cond_3

    .line 341
    const/16 v5, 0x6c

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 343
    :cond_3
    iget-boolean v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    if-eqz v5, :cond_4

    .line 344
    const/16 v5, 0x73

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 346
    :cond_4
    const-string/jumbo v5, "}->"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    if-eqz v5, :cond_5

    .line 348
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    .local v0, "arr$":[Lorg/apache/http/HttpHost;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_5

    aget-object v2, v0, v3

    .line 349
    .local v2, "element":Lorg/apache/http/HttpHost;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 350
    const-string/jumbo v5, "->"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 353
    .end local v0    # "arr$":[Lorg/apache/http/HttpHost;
    .end local v2    # "element":Lorg/apache/http/HttpHost;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_5
    iget-object v5, p0, Lorg/apache/http/conn/routing/RouteTracker;->targetHost:Lorg/apache/http/HttpHost;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 354
    const/16 v5, 0x5d

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 356
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public final tunnelProxy(Lorg/apache/http/HttpHost;Z)V
    .locals 4
    .param p1, "proxy"    # Lorg/apache/http/HttpHost;
    .param p2, "secure"    # Z

    .prologue
    const/4 v3, 0x0

    .line 161
    const-string/jumbo v1, "Proxy host"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 162
    iget-boolean v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    const-string/jumbo v2, "No tunnel unless connected"

    invoke-static {v1, v2}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 163
    iget-object v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    const-string/jumbo v2, "No tunnel without proxy"

    invoke-static {v1, v2}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 165
    iget-object v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    array-length v1, v1

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Lorg/apache/http/HttpHost;

    .line 166
    .local v0, "proxies":[Lorg/apache/http/HttpHost;
    iget-object v1, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    iget-object v2, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-object p1, v0, v1

    .line 170
    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    .line 171
    iput-boolean p2, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    .line 172
    return-void
.end method

.method public final tunnelTarget(Z)V
    .locals 2
    .param p1, "secure"    # Z

    .prologue
    .line 145
    iget-boolean v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->connected:Z

    const-string/jumbo v1, "No tunnel unless connected"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 146
    iget-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->proxyChain:[Lorg/apache/http/HttpHost;

    const-string/jumbo v1, "No tunnel without proxy"

    invoke-static {v0, v1}, Lorg/apache/http/util/Asserts;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 147
    sget-object v0, Lorg/apache/http/conn/routing/RouteInfo$TunnelType;->TUNNELLED:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    iput-object v0, p0, Lorg/apache/http/conn/routing/RouteTracker;->tunnelled:Lorg/apache/http/conn/routing/RouteInfo$TunnelType;

    .line 148
    iput-boolean p1, p0, Lorg/apache/http/conn/routing/RouteTracker;->secure:Z

    .line 149
    return-void
.end method
