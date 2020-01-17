.class public Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;
.super Ljava/lang/Object;
.source "ServiceUnavailableRetryExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

.field private final retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/ServiceUnavailableRetryStrategy;)V
    .locals 1
    .param p1, "requestExecutor"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "retryStrategy"    # Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->log:Lorg/apache/commons/logging/Log;

    .line 69
    const-string/jumbo v0, "HTTP request executor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    const-string/jumbo v0, "Retry strategy"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    iput-object p1, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 72
    iput-object p2, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    .line 73
    return-void
.end method


# virtual methods
.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 10
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
    invoke-virtual {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v3

    .line 81
    .local v3, "origheaders":[Lorg/apache/http/Header;
    const/4 v0, 0x1

    .line 82
    .local v0, "c":I
    :goto_0
    iget-object v7, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->requestExecutor:Lorg/apache/http/impl/execchain/ClientExecChain;

    invoke-interface {v7, p1, p2, p3, p4}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v6

    .line 85
    .local v6, "response":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_start_0
    iget-object v7, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    invoke-interface {v7, v6, v0, p3}, Lorg/apache/http/client/ServiceUnavailableRetryStrategy;->retryRequest(Lorg/apache/http/HttpResponse;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 86
    invoke-interface {v6}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 87
    iget-object v7, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->retryStrategy:Lorg/apache/http/client/ServiceUnavailableRetryStrategy;

    invoke-interface {v7}, Lorg/apache/http/client/ServiceUnavailableRetryStrategy;->getRetryInterval()J
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-wide v4

    .line 88
    .local v4, "nextInterval":J
    const-wide/16 v8, 0x0

    cmp-long v7, v4, v8

    if-lez v7, :cond_0

    .line 90
    :try_start_1
    iget-object v7, p0, Lorg/apache/http/impl/execchain/ServiceUnavailableRetryExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Wait for "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 91
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 97
    :cond_0
    :try_start_2
    invoke-virtual {p2, v3}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeaders([Lorg/apache/http/Header;)V

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 92
    :catch_0
    move-exception v1

    .line 93
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->interrupt()V

    .line 94
    new-instance v7, Ljava/io/InterruptedIOException;

    invoke-direct {v7}, Ljava/io/InterruptedIOException;-><init>()V

    throw v7
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 101
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v4    # "nextInterval":J
    :catch_1
    move-exception v2

    .line 102
    .local v2, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v6}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 103
    throw v2

    .line 99
    .end local v2    # "ex":Ljava/lang/RuntimeException;
    :cond_1
    return-object v6
.end method
