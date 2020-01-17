.class public Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;
.super Ljava/lang/Object;
.source "DefaultClientConnectionOperator.java"

# interfaces
.implements Lorg/apache/http/conn/ClientConnectionOperator;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field protected final dnsResolver:Lorg/apache/http/conn/DnsResolver;

.field private final log:Lorg/apache/commons/logging/Log;

.field protected final schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;


# direct methods
.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;)V
    .locals 1
    .param p1, "schemes"    # Lorg/apache/http/conn/scheme/SchemeRegistry;

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    .line 108
    const-string/jumbo v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 109
    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 110
    new-instance v0, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/SystemDefaultDnsResolver;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    .line 111
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/conn/scheme/SchemeRegistry;Lorg/apache/http/conn/DnsResolver;)V
    .locals 1
    .param p1, "schemes"    # Lorg/apache/http/conn/scheme/SchemeRegistry;
    .param p2, "dnsResolver"    # Lorg/apache/http/conn/DnsResolver;

    .prologue
    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    .line 123
    const-string/jumbo v0, "Scheme registry"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 125
    const-string/jumbo v0, "DNS resolver"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 127
    iput-object p1, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 128
    iput-object p2, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    .line 129
    return-void
.end method

.method private getSchemeRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/scheme/SchemeRegistry;
    .locals 2
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 136
    const-string/jumbo v1, "http.scheme-registry"

    invoke-interface {p1, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 138
    .local v0, "reg":Lorg/apache/http/conn/scheme/SchemeRegistry;
    if-nez v0, :cond_0

    .line 139
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->schemeRegistry:Lorg/apache/http/conn/scheme/SchemeRegistry;

    .line 141
    :cond_0
    return-object v0
.end method


# virtual methods
.method public createConnection()Lorg/apache/http/conn/OperatedClientConnection;
    .locals 1

    .prologue
    .line 132
    new-instance v0, Lorg/apache/http/impl/conn/DefaultClientConnection;

    invoke-direct {v0}, Lorg/apache/http/impl/conn/DefaultClientConnection;-><init>()V

    return-object v0
.end method

.method public openConnection(Lorg/apache/http/conn/OperatedClientConnection;Lorg/apache/http/HttpHost;Ljava/net/InetAddress;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .locals 19
    .param p1, "conn"    # Lorg/apache/http/conn/OperatedClientConnection;
    .param p2, "target"    # Lorg/apache/http/HttpHost;
    .param p3, "local"    # Ljava/net/InetAddress;
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p5, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    const-string/jumbo v16, "Connection"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 151
    const-string/jumbo v16, "Target host"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 152
    const-string/jumbo v16, "HTTP parameters"

    move-object/from16 v0, p5

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 153
    invoke-interface/range {p1 .. p1}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v16

    if-nez v16, :cond_4

    const/16 v16, 0x1

    :goto_0
    const-string/jumbo v17, "Connection must not be open"

    invoke-static/range {v16 .. v17}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 155
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->getSchemeRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v11

    .line 156
    .local v11, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v13

    .line 157
    .local v13, "schm":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v13}, Lorg/apache/http/conn/scheme/Scheme;->getSchemeSocketFactory()Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    move-result-object v14

    .line 159
    .local v14, "sf":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->resolveHostname(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v4

    .line 160
    .local v4, "addresses":[Ljava/net/InetAddress;
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v16

    move/from16 v0, v16

    invoke-virtual {v13, v0}, Lorg/apache/http/conn/scheme/Scheme;->resolvePort(I)I

    move-result v10

    .line 161
    .local v10, "port":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    array-length v0, v4

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v7, v0, :cond_3

    .line 162
    aget-object v3, v4, v7

    .line 163
    .local v3, "address":Ljava/net/InetAddress;
    array-length v0, v4

    move/from16 v16, v0

    add-int/lit8 v16, v16, -0x1

    move/from16 v0, v16

    if-ne v7, v0, :cond_5

    const/4 v8, 0x1

    .line 165
    .local v8, "last":Z
    :goto_2
    move-object/from16 v0, p5

    invoke-interface {v14, v0}, Lorg/apache/http/conn/scheme/SchemeSocketFactory;->createSocket(Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v15

    .line 166
    .local v15, "sock":Ljava/net/Socket;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v0, v15, v1}, Lorg/apache/http/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lorg/apache/http/HttpHost;)V

    .line 168
    new-instance v12, Lorg/apache/http/conn/HttpInetSocketAddress;

    move-object/from16 v0, p2

    invoke-direct {v12, v0, v3, v10}, Lorg/apache/http/conn/HttpInetSocketAddress;-><init>(Lorg/apache/http/HttpHost;Ljava/net/InetAddress;I)V

    .line 169
    .local v12, "remoteAddress":Ljava/net/InetSocketAddress;
    const/4 v9, 0x0

    .line 170
    .local v9, "localAddress":Ljava/net/InetSocketAddress;
    if-eqz p3, :cond_0

    .line 171
    new-instance v9, Ljava/net/InetSocketAddress;

    .end local v9    # "localAddress":Ljava/net/InetSocketAddress;
    const/16 v16, 0x0

    move-object/from16 v0, p3

    move/from16 v1, v16

    invoke-direct {v9, v0, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 173
    .restart local v9    # "localAddress":Ljava/net/InetSocketAddress;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v16

    if-eqz v16, :cond_1

    .line 174
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Connecting to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v16 .. v17}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 177
    :cond_1
    :try_start_0
    move-object/from16 v0, p5

    invoke-interface {v14, v15, v12, v9, v0}, Lorg/apache/http/conn/scheme/SchemeSocketFactory;->connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;Ljava/net/InetSocketAddress;Lorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v5

    .line 178
    .local v5, "connsock":Ljava/net/Socket;
    if-eq v15, v5, :cond_2

    .line 179
    move-object v15, v5

    .line 180
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v0, v15, v1}, Lorg/apache/http/conn/OperatedClientConnection;->opening(Ljava/net/Socket;Lorg/apache/http/HttpHost;)V

    .line 182
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    invoke-virtual {v0, v15, v1, v2}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->prepareSocket(Ljava/net/Socket;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 183
    invoke-interface {v14, v15}, Lorg/apache/http/conn/scheme/SchemeSocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v16

    move-object/from16 v0, p1

    move/from16 v1, v16

    move-object/from16 v2, p5

    invoke-interface {v0, v1, v2}, Lorg/apache/http/conn/OperatedClientConnection;->openCompleted(ZLorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/conn/ConnectTimeoutException; {:try_start_0 .. :try_end_0} :catch_1

    .line 199
    .end local v3    # "address":Ljava/net/InetAddress;
    .end local v5    # "connsock":Ljava/net/Socket;
    .end local v8    # "last":Z
    .end local v9    # "localAddress":Ljava/net/InetSocketAddress;
    .end local v12    # "remoteAddress":Ljava/net/InetSocketAddress;
    .end local v15    # "sock":Ljava/net/Socket;
    :cond_3
    return-void

    .line 153
    .end local v4    # "addresses":[Ljava/net/InetAddress;
    .end local v7    # "i":I
    .end local v10    # "port":I
    .end local v11    # "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v13    # "schm":Lorg/apache/http/conn/scheme/Scheme;
    .end local v14    # "sf":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    :cond_4
    const/16 v16, 0x0

    goto/16 :goto_0

    .line 163
    .restart local v3    # "address":Ljava/net/InetAddress;
    .restart local v4    # "addresses":[Ljava/net/InetAddress;
    .restart local v7    # "i":I
    .restart local v10    # "port":I
    .restart local v11    # "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .restart local v13    # "schm":Lorg/apache/http/conn/scheme/Scheme;
    .restart local v14    # "sf":Lorg/apache/http/conn/scheme/SchemeSocketFactory;
    :cond_5
    const/4 v8, 0x0

    goto :goto_2

    .line 185
    .restart local v8    # "last":Z
    .restart local v9    # "localAddress":Ljava/net/InetSocketAddress;
    .restart local v12    # "remoteAddress":Ljava/net/InetSocketAddress;
    .restart local v15    # "sock":Ljava/net/Socket;
    :catch_0
    move-exception v6

    .line 186
    .local v6, "ex":Ljava/net/ConnectException;
    if-eqz v8, :cond_6

    .line 187
    throw v6

    .line 189
    .end local v6    # "ex":Ljava/net/ConnectException;
    :catch_1
    move-exception v6

    .line 190
    .local v6, "ex":Lorg/apache/http/conn/ConnectTimeoutException;
    if-eqz v8, :cond_6

    .line 191
    throw v6

    .line 194
    .end local v6    # "ex":Lorg/apache/http/conn/ConnectTimeoutException;
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v16

    if-eqz v16, :cond_7

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "Connect to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, " timed out. "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v18, "Connection will be retried using another IP address"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v16 .. v17}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 161
    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1
.end method

.method protected prepareSocket(Ljava/net/Socket;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .locals 2
    .param p1, "sock"    # Ljava/net/Socket;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    invoke-static {p3}, Lorg/apache/http/params/HttpConnectionParams;->getTcpNoDelay(Lorg/apache/http/params/HttpParams;)Z

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    .line 236
    invoke-static {p3}, Lorg/apache/http/params/HttpConnectionParams;->getSoTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 238
    invoke-static {p3}, Lorg/apache/http/params/HttpConnectionParams;->getLinger(Lorg/apache/http/params/HttpParams;)I

    move-result v0

    .line 239
    .local v0, "linger":I
    if-ltz v0, :cond_0

    .line 240
    if-lez v0, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {p1, v1, v0}, Ljava/net/Socket;->setSoLinger(ZI)V

    .line 242
    :cond_0
    return-void

    .line 240
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected resolveHostname(Ljava/lang/String;)[Ljava/net/InetAddress;
    .locals 1
    .param p1, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 259
    iget-object v0, p0, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->dnsResolver:Lorg/apache/http/conn/DnsResolver;

    invoke-interface {v0, p1}, Lorg/apache/http/conn/DnsResolver;->resolve(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public updateSecureConnection(Lorg/apache/http/conn/OperatedClientConnection;Lorg/apache/http/HttpHost;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V
    .locals 7
    .param p1, "conn"    # Lorg/apache/http/conn/OperatedClientConnection;
    .param p2, "target"    # Lorg/apache/http/HttpHost;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p4, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    const-string/jumbo v4, "Connection"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 207
    const-string/jumbo v4, "Target host"

    invoke-static {p2, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 208
    const-string/jumbo v4, "Parameters"

    invoke-static {p4, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 209
    invoke-interface {p1}, Lorg/apache/http/conn/OperatedClientConnection;->isOpen()Z

    move-result v4

    const-string/jumbo v5, "Connection must be open"

    invoke-static {v4, v5}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 211
    invoke-direct {p0, p3}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->getSchemeRegistry(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v1

    .line 212
    .local v1, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v2

    .line 213
    .local v2, "schm":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v2}, Lorg/apache/http/conn/scheme/Scheme;->getSchemeSocketFactory()Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    move-result-object v4

    instance-of v4, v4, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;

    const-string/jumbo v5, "Socket factory must implement SchemeLayeredSocketFactory"

    invoke-static {v4, v5}, Lorg/apache/http/util/Asserts;->check(ZLjava/lang/String;)V

    .line 215
    invoke-virtual {v2}, Lorg/apache/http/conn/scheme/Scheme;->getSchemeSocketFactory()Lorg/apache/http/conn/scheme/SchemeSocketFactory;

    move-result-object v0

    check-cast v0, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;

    .line 216
    .local v0, "lsf":Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;
    invoke-interface {p1}, Lorg/apache/http/conn/OperatedClientConnection;->getSocket()Ljava/net/Socket;

    move-result-object v4

    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p2}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v6

    invoke-virtual {v2, v6}, Lorg/apache/http/conn/scheme/Scheme;->resolvePort(I)I

    move-result v6

    invoke-interface {v0, v4, v5, v6, p4}, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;->createLayeredSocket(Ljava/net/Socket;Ljava/lang/String;ILorg/apache/http/params/HttpParams;)Ljava/net/Socket;

    move-result-object v3

    .line 218
    .local v3, "sock":Ljava/net/Socket;
    invoke-virtual {p0, v3, p3, p4}, Lorg/apache/http/impl/conn/DefaultClientConnectionOperator;->prepareSocket(Ljava/net/Socket;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 219
    invoke-interface {v0, v3}, Lorg/apache/http/conn/scheme/SchemeLayeredSocketFactory;->isSecure(Ljava/net/Socket;)Z

    move-result v4

    invoke-interface {p1, v3, p2, v4, p4}, Lorg/apache/http/conn/OperatedClientConnection;->update(Ljava/net/Socket;Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    .line 220
    return-void
.end method
