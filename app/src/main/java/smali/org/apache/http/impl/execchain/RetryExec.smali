.class public Lorg/apache/http/impl/execchain/RetryExec;
.super Ljava/lang/Object;
.source "RetryExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

.field private final retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/HttpRequestRetryHandler;)V
    .locals 1
    .param p1, "requestExecutor"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    .line 69
    const-string/jumbo v0, "HTTP request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    const-string/jumbo v0, "HTTP request retry handler"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    iput-object p1, p0, Lorg/apache/http/impl/execchain/RetryExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 72
    iput-object p2, p0, Lorg/apache/http/impl/execchain/RetryExec;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    .line 73
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 7
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
    .line 80
    const-string/jumbo v4, "HTTP route"

    invoke-static {p1, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 81
    const-string/jumbo v4, "HTTP request"

    invoke-static {p2, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    const-string/jumbo v4, "HTTP context"

    invoke-static {p3, v4}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 83
    invoke-virtual {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v2

    .line 84
    .local v2, "origheaders":[Lorg/apache/http/Header;
    const/4 v1, 0x1

    .line 86
    .local v1, "execCount":I
    :goto_0
    :try_start_0
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    invoke-interface {v4, p1, p2, p3, p4}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    return-object v4

    .line 87
    :catch_0
    move-exception v0

    .line 88
    .local v0, "ex":Ljava/io/IOException;
    if-eqz p4, :cond_0

    invoke-interface {p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 89
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Request has been aborted"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 90
    throw v0

    .line 92
    :cond_0
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    invoke-interface {v4, v0, v1, p3}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 93
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 94
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "I/O exception ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ") caught when processing request to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 100
    :cond_1
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 101
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 103
    :cond_2
    invoke-static {p2}, Lorg/apache/http/impl/execchain/Proxies;->isRepeatable(Lorg/apache/http/HttpRequest;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 104
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Cannot retry non-repeatable request"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 105
    new-instance v4, Lorg/apache/http/client/NonRepeatableRequestException;

    const-string/jumbo v5, "Cannot retry request with a non-repeatable request entity"

    invoke-direct {v4, v5, v0}, Lorg/apache/http/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 108
    :cond_3
    invoke-virtual {p2, v2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeaders([Lorg/apache/http/Header;)V

    .line 109
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 110
    iget-object v4, p0, Lorg/apache/http/impl/execchain/RetryExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Retrying request to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 84
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 113
    :cond_5
    instance-of v4, v0, Lorg/apache/http/NoHttpResponseException;

    if-eqz v4, :cond_6

    .line 114
    new-instance v3, Lorg/apache/http/NoHttpResponseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " failed to respond"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/http/NoHttpResponseException;-><init>(Ljava/lang/String;)V

    .line 116
    .local v3, "updatedex":Lorg/apache/http/NoHttpResponseException;
    invoke-virtual {v0}, Ljava/io/IOException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/http/NoHttpResponseException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 117
    throw v3

    .line 119
    .end local v3    # "updatedex":Lorg/apache/http/NoHttpResponseException;
    :cond_6
    throw v0
.end method
