.class public Lorg/apache/http/impl/execchain/MinimalClientExec;
.super Ljava/lang/Object;
.source "MinimalClientExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private final httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

.field private final keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

.field private final reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;


# direct methods
.method public constructor <init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;)V
    .locals 7
    .param p1, "requestExecutor"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p2, "connManager"    # Lorg/apache/http/conn/HttpClientConnectionManager;
    .param p3, "reuseStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p4, "keepAliveStrategy"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MinimalClientExec;->log:Lorg/apache/commons/logging/Log;

    .line 96
    const-string/jumbo v0, "HTTP request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    const-string/jumbo v0, "Client connection manager"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 98
    const-string/jumbo v0, "Connection reuse strategy"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 99
    const-string/jumbo v0, "Connection keep alive strategy"

    invoke-static {p4, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 100
    new-instance v0, Lorg/apache/http/protocol/ImmutableHttpProcessor;

    const/4 v1, 0x4

    new-array v1, v1, [Lorg/apache/http/HttpRequestInterceptor;

    const/4 v2, 0x0

    new-instance v3, Lorg/apache/http/protocol/RequestContent;

    invoke-direct {v3}, Lorg/apache/http/protocol/RequestContent;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Lorg/apache/http/protocol/RequestTargetHost;

    invoke-direct {v3}, Lorg/apache/http/protocol/RequestTargetHost;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x2

    new-instance v3, Lorg/apache/http/client/protocol/RequestClientConnControl;

    invoke-direct {v3}, Lorg/apache/http/client/protocol/RequestClientConnControl;-><init>()V

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-instance v3, Lorg/apache/http/protocol/RequestUserAgent;

    const-string/jumbo v4, "Apache-HttpClient"

    const-string/jumbo v5, "org.apache.http.client"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lorg/apache/http/util/VersionInfo;->getUserAgent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/http/protocol/RequestUserAgent;-><init>(Ljava/lang/String;)V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lorg/apache/http/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/http/HttpRequestInterceptor;)V

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MinimalClientExec;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    .line 106
    iput-object p1, p0, Lorg/apache/http/impl/execchain/MinimalClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 107
    iput-object p2, p0, Lorg/apache/http/impl/execchain/MinimalClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 108
    iput-object p3, p0, Lorg/apache/http/impl/execchain/MinimalClientExec;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 109
    iput-object p4, p0, Lorg/apache/http/impl/execchain/MinimalClientExec;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .line 110
    return-void
.end method

.method static rewriteRequestURI(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V
    .locals 5
    .param p0, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 116
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v1

    .line 117
    .local v1, "uri":Ljava/net/URI;
    if-eqz v1, :cond_0

    .line 119
    invoke-virtual {v1}, Ljava/net/URI;->isAbsolute()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 120
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v1

    .line 124
    :goto_0
    invoke-virtual {p0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setURI(Ljava/net/URI;)V

    .line 129
    :cond_0
    return-void

    .line 122
    :cond_1
    invoke-static {v1}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 126
    .end local v1    # "uri":Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 127
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v2, Lorg/apache/http/ProtocolException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Invalid URI: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 23
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 136
    const-string/jumbo v20, "HTTP route"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 137
    const-string/jumbo v20, "HTTP request"

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 138
    const-string/jumbo v20, "HTTP context"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/apache/http/impl/execchain/MinimalClientExec;->rewriteRequestURI(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Lorg/apache/http/conn/HttpClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ConnectionRequest;

    move-result-object v6

    .line 143
    .local v6, "connRequest":Lorg/apache/http/conn/ConnectionRequest;
    if-eqz p4, :cond_1

    .line 144
    invoke-interface/range {p4 .. p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 145
    invoke-interface {v6}, Lorg/apache/http/conn/ConnectionRequest;->cancel()Z

    .line 146
    new-instance v20, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string/jumbo v21, "Request aborted"

    invoke-direct/range {v20 .. v21}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 148
    :cond_0
    move-object/from16 v0, p4

    invoke-interface {v0, v6}, Lorg/apache/http/client/methods/HttpExecutionAware;->setCancellable(Lorg/apache/http/concurrent/Cancellable;)V

    .line 152
    :cond_1
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v5

    .line 156
    .local v5, "config":Lorg/apache/http/client/config/RequestConfig;
    :try_start_0
    invoke-virtual {v5}, Lorg/apache/http/client/config/RequestConfig;->getConnectionRequestTimeout()I

    move-result v18

    .line 157
    .local v18, "timeout":I
    if-lez v18, :cond_2

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v20, v0

    :goto_0
    sget-object v22, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, v20

    move-object/from16 v2, v22

    invoke-interface {v6, v0, v1, v2}, Lorg/apache/http/conn/ConnectionRequest;->get(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/HttpClientConnection;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v13

    .line 169
    .local v13, "managedConn":Lorg/apache/http/HttpClientConnection;
    new-instance v15, Lorg/apache/http/impl/execchain/ConnectionHolder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v15, v0, v1, v13}, Lorg/apache/http/impl/execchain/ConnectionHolder;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/HttpClientConnection;)V

    .line 171
    .local v15, "releaseTrigger":Lorg/apache/http/impl/execchain/ConnectionHolder;
    if-eqz p4, :cond_5

    .line 172
    :try_start_1
    invoke-interface/range {p4 .. p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v20

    if-eqz v20, :cond_4

    .line 173
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->close()V

    .line 174
    new-instance v20, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string/jumbo v21, "Request aborted"

    invoke-direct/range {v20 .. v21}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v20
    :try_end_1
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_5

    .line 234
    .end local v18    # "timeout":I
    :catch_0
    move-exception v10

    .line 235
    .local v10, "ex":Lorg/apache/http/impl/conn/ConnectionShutdownException;
    new-instance v12, Ljava/io/InterruptedIOException;

    const-string/jumbo v20, "Connection has been shut down"

    move-object/from16 v0, v20

    invoke-direct {v12, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 237
    .local v12, "ioex":Ljava/io/InterruptedIOException;
    invoke-virtual {v12, v10}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 238
    throw v12

    .line 157
    .end local v10    # "ex":Lorg/apache/http/impl/conn/ConnectionShutdownException;
    .end local v12    # "ioex":Ljava/io/InterruptedIOException;
    .end local v13    # "managedConn":Lorg/apache/http/HttpClientConnection;
    .end local v15    # "releaseTrigger":Lorg/apache/http/impl/execchain/ConnectionHolder;
    .restart local v18    # "timeout":I
    :cond_2
    const-wide/16 v20, 0x0

    goto :goto_0

    .line 158
    .end local v18    # "timeout":I
    :catch_1
    move-exception v11

    .line 159
    .local v11, "interrupted":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Thread;->interrupt()V

    .line 160
    new-instance v20, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string/jumbo v21, "Request aborted"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v11}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v20

    .line 161
    .end local v11    # "interrupted":Ljava/lang/InterruptedException;
    :catch_2
    move-exception v10

    .line 162
    .local v10, "ex":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v10}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    .line 163
    .local v4, "cause":Ljava/lang/Throwable;
    if-nez v4, :cond_3

    .line 164
    move-object v4, v10

    .line 166
    :cond_3
    new-instance v20, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string/jumbo v21, "Request execution failed"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v4}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v20

    .line 176
    .end local v4    # "cause":Ljava/lang/Throwable;
    .end local v10    # "ex":Ljava/util/concurrent/ExecutionException;
    .restart local v13    # "managedConn":Lorg/apache/http/HttpClientConnection;
    .restart local v15    # "releaseTrigger":Lorg/apache/http/impl/execchain/ConnectionHolder;
    .restart local v18    # "timeout":I
    :cond_4
    :try_start_2
    move-object/from16 v0, p4

    invoke-interface {v0, v15}, Lorg/apache/http/client/methods/HttpExecutionAware;->setCancellable(Lorg/apache/http/concurrent/Cancellable;)V

    .line 180
    :cond_5
    invoke-interface {v13}, Lorg/apache/http/HttpClientConnection;->isOpen()Z

    move-result v20

    if-nez v20, :cond_6

    .line 181
    invoke-virtual {v5}, Lorg/apache/http/client/config/RequestConfig;->getConnectTimeout()I

    move-result v18

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    move-object/from16 v20, v0

    if-lez v18, :cond_b

    .end local v18    # "timeout":I
    :goto_1
    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move/from16 v2, v18

    move-object/from16 v3, p3

    invoke-interface {v0, v13, v1, v2, v3}, Lorg/apache/http/conn/HttpClientConnectionManager;->connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-interface {v0, v13, v1, v2}, Lorg/apache/http/conn/HttpClientConnectionManager;->routeComplete(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V

    .line 189
    :cond_6
    invoke-virtual {v5}, Lorg/apache/http/client/config/RequestConfig;->getSocketTimeout()I

    move-result v18

    .line 190
    .restart local v18    # "timeout":I
    if-ltz v18, :cond_7

    .line 191
    move/from16 v0, v18

    invoke-interface {v13, v0}, Lorg/apache/http/HttpClientConnection;->setSocketTimeout(I)V

    .line 194
    :cond_7
    const/16 v17, 0x0

    .line 195
    .local v17, "target":Lorg/apache/http/HttpHost;
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v14

    .line 196
    .local v14, "original":Lorg/apache/http/HttpRequest;
    instance-of v0, v14, Lorg/apache/http/client/methods/HttpUriRequest;

    move/from16 v20, v0

    if-eqz v20, :cond_8

    .line 197
    check-cast v14, Lorg/apache/http/client/methods/HttpUriRequest;

    .end local v14    # "original":Lorg/apache/http/HttpRequest;
    invoke-interface {v14}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v19

    .line 198
    .local v19, "uri":Ljava/net/URI;
    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->isAbsolute()Z

    move-result v20

    if-eqz v20, :cond_8

    .line 199
    new-instance v17, Lorg/apache/http/HttpHost;

    .end local v17    # "target":Lorg/apache/http/HttpHost;
    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->getPort()I

    move-result v21

    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 202
    .end local v19    # "uri":Ljava/net/URI;
    .restart local v17    # "target":Lorg/apache/http/HttpHost;
    :cond_8
    if-nez v17, :cond_9

    .line 203
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v17

    .line 206
    :cond_9
    const-string/jumbo v20, "http.target_host"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 207
    const-string/jumbo v20, "http.request"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 208
    const-string/jumbo v20, "http.connection"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v13}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 209
    const-string/jumbo v20, "http.route"

    move-object/from16 v0, p3

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v13, v2}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v16

    .line 213
    .local v16, "response":Lorg/apache/http/HttpResponse;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v20

    if-eqz v20, :cond_c

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/MinimalClientExec;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/conn/ConnectionKeepAliveStrategy;->getKeepAliveDuration(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)J

    move-result-wide v8

    .line 219
    .local v8, "duration":J
    sget-object v20, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v20

    invoke-virtual {v15, v8, v9, v0}, Lorg/apache/http/impl/execchain/ConnectionHolder;->setValidFor(JLjava/util/concurrent/TimeUnit;)V

    .line 220
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->markReusable()V

    .line 226
    .end local v8    # "duration":J
    :goto_2
    invoke-interface/range {v16 .. v16}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    .line 227
    .local v7, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v7, :cond_a

    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v20

    if-nez v20, :cond_d

    .line 229
    :cond_a
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->releaseConnection()V

    .line 230
    const/16 v20, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lorg/apache/http/impl/execchain/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v20

    .line 232
    :goto_3
    return-object v20

    .line 182
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    .end local v16    # "response":Lorg/apache/http/HttpResponse;
    .end local v17    # "target":Lorg/apache/http/HttpHost;
    :cond_b
    const/16 v18, 0x0

    goto/16 :goto_1

    .line 222
    .restart local v16    # "response":Lorg/apache/http/HttpResponse;
    .restart local v17    # "target":Lorg/apache/http/HttpHost;
    :cond_c
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->markNonReusable()V
    :try_end_2
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_5

    goto :goto_2

    .line 239
    .end local v16    # "response":Lorg/apache/http/HttpResponse;
    .end local v17    # "target":Lorg/apache/http/HttpHost;
    .end local v18    # "timeout":I
    :catch_3
    move-exception v10

    .line 240
    .local v10, "ex":Lorg/apache/http/HttpException;
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 241
    throw v10

    .line 232
    .end local v10    # "ex":Lorg/apache/http/HttpException;
    .restart local v7    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v16    # "response":Lorg/apache/http/HttpResponse;
    .restart local v17    # "target":Lorg/apache/http/HttpHost;
    .restart local v18    # "timeout":I
    :cond_d
    :try_start_3
    move-object/from16 v0, v16

    invoke-static {v0, v15}, Lorg/apache/http/impl/execchain/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_3
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_5

    move-result-object v20

    goto :goto_3

    .line 242
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    .end local v16    # "response":Lorg/apache/http/HttpResponse;
    .end local v17    # "target":Lorg/apache/http/HttpHost;
    .end local v18    # "timeout":I
    :catch_4
    move-exception v10

    .line 243
    .local v10, "ex":Ljava/io/IOException;
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 244
    throw v10

    .line 245
    .end local v10    # "ex":Ljava/io/IOException;
    :catch_5
    move-exception v10

    .line 246
    .local v10, "ex":Ljava/lang/RuntimeException;
    invoke-virtual {v15}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 247
    throw v10
.end method
