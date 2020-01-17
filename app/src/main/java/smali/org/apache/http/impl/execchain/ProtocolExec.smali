.class public Lorg/apache/http/impl/execchain/ProtocolExec;
.super Ljava/lang/Object;
.source "ProtocolExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/protocol/HttpProcessor;)V
    .locals 1
    .param p1, "requestExecutor"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/execchain/ProtocolExec;->log:Lorg/apache/commons/logging/Log;

    .line 81
    const-string/jumbo v0, "HTTP client request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    const-string/jumbo v0, "HTTP protocol processor"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ProtocolExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 84
    iput-object p2, p0, Lorg/apache/http/impl/execchain/ProtocolExec;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    .line 85
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 20
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
    .line 122
    const-string/jumbo v17, "HTTP route"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 123
    const-string/jumbo v17, "HTTP request"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 124
    const-string/jumbo v17, "HTTP context"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 126
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v7

    .line 127
    .local v7, "original":Lorg/apache/http/HttpRequest;
    const/4 v12, 0x0

    .line 128
    .local v12, "uri":Ljava/net/URI;
    instance-of v0, v7, Lorg/apache/http/client/methods/HttpUriRequest;

    move/from16 v17, v0

    if-eqz v17, :cond_7

    .line 129
    check-cast v7, Lorg/apache/http/client/methods/HttpUriRequest;

    .end local v7    # "original":Lorg/apache/http/HttpRequest;
    invoke-interface {v7}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v12

    .line 142
    :cond_0
    :goto_0
    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setURI(Ljava/net/URI;)V

    .line 145
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/execchain/ProtocolExec;->rewriteRequestURI(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 147
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v8

    .line 148
    .local v8, "params":Lorg/apache/http/params/HttpParams;
    const-string/jumbo v17, "http.virtual-host"

    move-object/from16 v0, v17

    invoke-interface {v8, v0}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/apache/http/HttpHost;

    .line 150
    .local v15, "virtualHost":Lorg/apache/http/HttpHost;
    if-eqz v15, :cond_2

    invoke-virtual {v15}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v17

    const/16 v18, -0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_2

    .line 151
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v9

    .line 152
    .local v9, "port":I
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v9, v0, :cond_1

    .line 153
    new-instance v16, Lorg/apache/http/HttpHost;

    invoke-virtual {v15}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v15}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v9, v2}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v15    # "virtualHost":Lorg/apache/http/HttpHost;
    .local v16, "virtualHost":Lorg/apache/http/HttpHost;
    move-object/from16 v15, v16

    .line 156
    .end local v16    # "virtualHost":Lorg/apache/http/HttpHost;
    .restart local v15    # "virtualHost":Lorg/apache/http/HttpHost;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/ProtocolExec;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_2

    .line 157
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/ProtocolExec;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Using virtual host"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-interface/range {v17 .. v18}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 161
    .end local v9    # "port":I
    :cond_2
    const/4 v11, 0x0

    .line 162
    .local v11, "target":Lorg/apache/http/HttpHost;
    if-eqz v15, :cond_8

    .line 163
    move-object v11, v15

    .line 169
    :cond_3
    :goto_1
    if-nez v11, :cond_4

    .line 170
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v11

    .line 174
    :cond_4
    if-eqz v12, :cond_6

    .line 175
    invoke-virtual {v12}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v14

    .line 176
    .local v14, "userinfo":Ljava/lang/String;
    if-eqz v14, :cond_6

    .line 177
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v5

    .line 178
    .local v5, "credsProvider":Lorg/apache/http/client/CredentialsProvider;
    if-nez v5, :cond_5

    .line 179
    new-instance v5, Lorg/apache/http/impl/client/BasicCredentialsProvider;

    .end local v5    # "credsProvider":Lorg/apache/http/client/CredentialsProvider;
    invoke-direct {v5}, Lorg/apache/http/impl/client/BasicCredentialsProvider;-><init>()V

    .line 180
    .restart local v5    # "credsProvider":Lorg/apache/http/client/CredentialsProvider;
    move-object/from16 v0, p3

    invoke-virtual {v0, v5}, Lorg/apache/http/client/protocol/HttpClientContext;->setCredentialsProvider(Lorg/apache/http/client/CredentialsProvider;)V

    .line 182
    :cond_5
    new-instance v17, Lorg/apache/http/auth/AuthScope;

    move-object/from16 v0, v17

    invoke-direct {v0, v11}, Lorg/apache/http/auth/AuthScope;-><init>(Lorg/apache/http/HttpHost;)V

    new-instance v18, Lorg/apache/http/auth/UsernamePasswordCredentials;

    move-object/from16 v0, v18

    invoke-direct {v0, v14}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v5, v0, v1}, Lorg/apache/http/client/CredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 189
    .end local v5    # "credsProvider":Lorg/apache/http/client/CredentialsProvider;
    .end local v14    # "userinfo":Ljava/lang/String;
    :cond_6
    const-string/jumbo v17, "http.target_host"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v11}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 190
    const-string/jumbo v17, "http.route"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 191
    const-string/jumbo v17, "http.request"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 193
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/ProtocolExec;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/ProtocolExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    invoke-interface {v0, v1, v2, v3, v4}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v10

    .line 199
    .local v10, "response":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_start_0
    const-string/jumbo v17, "http.response"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v10}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/ProtocolExec;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-interface {v0, v10, v1}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lorg/apache/http/HttpException; {:try_start_0 .. :try_end_0} :catch_3

    .line 201
    return-object v10

    .line 131
    .end local v8    # "params":Lorg/apache/http/params/HttpParams;
    .end local v10    # "response":Lorg/apache/http/client/methods/CloseableHttpResponse;
    .end local v11    # "target":Lorg/apache/http/HttpHost;
    .end local v15    # "virtualHost":Lorg/apache/http/HttpHost;
    .restart local v7    # "original":Lorg/apache/http/HttpRequest;
    :cond_7
    invoke-interface {v7}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v13

    .line 133
    .local v13, "uriString":Ljava/lang/String;
    :try_start_1
    invoke-static {v13}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v12

    goto/16 :goto_0

    .line 134
    :catch_0
    move-exception v6

    .line 135
    .local v6, "ex":Ljava/lang/IllegalArgumentException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/ProtocolExec;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v17

    if-eqz v17, :cond_0

    .line 136
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/execchain/ProtocolExec;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v17, v0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v19, "Unable to parse \'"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, "\' as a valid URI; "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string/jumbo v19, "request URI and Host header may be inconsistent"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v0, v1, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 165
    .end local v6    # "ex":Ljava/lang/IllegalArgumentException;
    .end local v7    # "original":Lorg/apache/http/HttpRequest;
    .end local v13    # "uriString":Ljava/lang/String;
    .restart local v8    # "params":Lorg/apache/http/params/HttpParams;
    .restart local v11    # "target":Lorg/apache/http/HttpHost;
    .restart local v15    # "virtualHost":Lorg/apache/http/HttpHost;
    :cond_8
    if-eqz v12, :cond_3

    invoke-virtual {v12}, Ljava/net/URI;->isAbsolute()Z

    move-result v17

    if-eqz v17, :cond_3

    invoke-virtual {v12}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_3

    .line 166
    new-instance v11, Lorg/apache/http/HttpHost;

    .end local v11    # "target":Lorg/apache/http/HttpHost;
    invoke-virtual {v12}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v17

    invoke-virtual {v12}, Ljava/net/URI;->getPort()I

    move-result v18

    invoke-virtual {v12}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    invoke-direct {v11, v0, v1, v2}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .restart local v11    # "target":Lorg/apache/http/HttpHost;
    goto/16 :goto_1

    .line 202
    .restart local v10    # "response":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :catch_1
    move-exception v6

    .line 203
    .local v6, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 204
    throw v6

    .line 205
    .end local v6    # "ex":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v6

    .line 206
    .local v6, "ex":Ljava/io/IOException;
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 207
    throw v6

    .line 208
    .end local v6    # "ex":Ljava/io/IOException;
    :catch_3
    move-exception v6

    .line 209
    .local v6, "ex":Lorg/apache/http/HttpException;
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 210
    throw v6
.end method

.method rewriteRequestURI(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V
    .locals 6
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 91
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v2

    .line 92
    .local v2, "uri":Ljava/net/URI;
    if-eqz v2, :cond_0

    .line 93
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_2

    .line 95
    invoke-virtual {v2}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    if-nez v3, :cond_1

    .line 96
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 97
    .local v1, "target":Lorg/apache/http/HttpHost;
    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v2

    .line 109
    .end local v1    # "target":Lorg/apache/http/HttpHost;
    :goto_0
    invoke-virtual {p1, v2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setURI(Ljava/net/URI;)V

    .line 114
    :cond_0
    return-void

    .line 99
    :cond_1
    invoke-static {v2}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v2

    goto :goto_0

    .line 103
    :cond_2
    invoke-virtual {v2}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 104
    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v2

    goto :goto_0

    .line 106
    :cond_3
    invoke-static {v2}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 111
    .end local v2    # "uri":Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 112
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v3, Lorg/apache/http/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Invalid URI: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
