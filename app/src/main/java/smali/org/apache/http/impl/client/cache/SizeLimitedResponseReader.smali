.class Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;
.super Ljava/lang/Object;
.source "SizeLimitedResponseReader.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private consumed:Z

.field private instream:Ljava/io/InputStream;

.field private limit:Lorg/apache/http/client/cache/InputLimit;

.field private final maxResponseSizeBytes:J

.field private final request:Lorg/apache/http/HttpRequest;

.field private resource:Lorg/apache/http/client/cache/Resource;

.field private final resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

.field private final response:Lorg/apache/http/client/methods/CloseableHttpResponse;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/cache/ResourceFactory;JLorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/CloseableHttpResponse;)V
    .locals 0
    .param p1, "resourceFactory"    # Lorg/apache/http/client/cache/ResourceFactory;
    .param p2, "maxResponseSizeBytes"    # J
    .param p4, "request"    # Lorg/apache/http/HttpRequest;
    .param p5, "response"    # Lorg/apache/http/client/methods/CloseableHttpResponse;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    .line 70
    iput-wide p2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->maxResponseSizeBytes:J

    .line 71
    iput-object p4, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->request:Lorg/apache/http/HttpRequest;

    .line 72
    iput-object p5, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->response:Lorg/apache/http/client/methods/CloseableHttpResponse;

    .line 73
    return-void
.end method

.method static synthetic access$000(Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 1
    .param p0, "x0"    # Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->response:Lorg/apache/http/client/methods/CloseableHttpResponse;

    return-object v0
.end method

.method private doConsume()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->ensureNotConsumed()V

    .line 95
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->consumed:Z

    .line 97
    new-instance v2, Lorg/apache/http/client/cache/InputLimit;

    iget-wide v4, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->maxResponseSizeBytes:J

    invoke-direct {v2, v4, v5}, Lorg/apache/http/client/cache/InputLimit;-><init>(J)V

    iput-object v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->limit:Lorg/apache/http/client/cache/InputLimit;

    .line 99
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->response:Lorg/apache/http/client/methods/CloseableHttpResponse;

    invoke-interface {v2}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 100
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-nez v0, :cond_1

    .line 112
    :cond_0
    :goto_0
    return-void

    .line 103
    :cond_1
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->request:Lorg/apache/http/HttpRequest;

    invoke-interface {v2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v1

    .line 104
    .local v1, "uri":Ljava/lang/String;
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->instream:Ljava/io/InputStream;

    .line 106
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->instream:Ljava/io/InputStream;

    iget-object v4, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->limit:Lorg/apache/http/client/cache/InputLimit;

    invoke-interface {v2, v1, v3, v4}, Lorg/apache/http/client/cache/ResourceFactory;->generate(Ljava/lang/String;Ljava/io/InputStream;Lorg/apache/http/client/cache/InputLimit;)Lorg/apache/http/client/cache/Resource;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->resource:Lorg/apache/http/client/cache/Resource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->limit:Lorg/apache/http/client/cache/InputLimit;

    invoke-virtual {v2}, Lorg/apache/http/client/cache/InputLimit;->isReached()Z

    move-result v2

    if-nez v2, :cond_0

    .line 109
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->instream:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    goto :goto_0

    .line 108
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->limit:Lorg/apache/http/client/cache/InputLimit;

    invoke-virtual {v3}, Lorg/apache/http/client/cache/InputLimit;->isReached()Z

    move-result v3

    if-nez v3, :cond_2

    .line 109
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->instream:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_2
    throw v2
.end method

.method private ensureConsumed()V
    .locals 2

    .prologue
    .line 88
    iget-boolean v0, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->consumed:Z

    if-nez v0, :cond_0

    .line 89
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Response has not been consumed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_0
    return-void
.end method

.method private ensureNotConsumed()V
    .locals 2

    .prologue
    .line 82
    iget-boolean v0, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->consumed:Z

    if-eqz v0, :cond_0

    .line 83
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Response has already been consumed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_0
    return-void
.end method


# virtual methods
.method getReconstructedResponse()Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    invoke-direct {p0}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->ensureConsumed()V

    .line 126
    new-instance v2, Lorg/apache/http/message/BasicHttpResponse;

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->response:Lorg/apache/http/client/methods/CloseableHttpResponse;

    invoke-interface {v3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/StatusLine;)V

    .line 127
    .local v2, "reconstructed":Lorg/apache/http/HttpResponse;
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->response:Lorg/apache/http/client/methods/CloseableHttpResponse;

    invoke-interface {v3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/http/HttpResponse;->setHeaders([Lorg/apache/http/Header;)V

    .line 129
    new-instance v0, Lorg/apache/http/impl/client/cache/CombinedEntity;

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->resource:Lorg/apache/http/client/cache/Resource;

    iget-object v4, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->instream:Ljava/io/InputStream;

    invoke-direct {v0, v3, v4}, Lorg/apache/http/impl/client/cache/CombinedEntity;-><init>(Lorg/apache/http/client/cache/Resource;Ljava/io/InputStream;)V

    .line 130
    .local v0, "combinedEntity":Lorg/apache/http/impl/client/cache/CombinedEntity;
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->response:Lorg/apache/http/client/methods/CloseableHttpResponse;

    invoke-interface {v3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 131
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v1, :cond_0

    .line 132
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/http/impl/client/cache/CombinedEntity;->setContentType(Lorg/apache/http/Header;)V

    .line 133
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/http/impl/client/cache/CombinedEntity;->setContentEncoding(Lorg/apache/http/Header;)V

    .line 134
    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->isChunked()Z

    move-result v3

    invoke-virtual {v0, v3}, Lorg/apache/http/impl/client/cache/CombinedEntity;->setChunked(Z)V

    .line 136
    :cond_0
    invoke-interface {v2, v0}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 137
    const-class v3, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Lorg/apache/http/client/methods/CloseableHttpResponse;

    aput-object v6, v4, v5

    new-instance v5, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader$1;

    invoke-direct {v5, p0, v2}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader$1;-><init>(Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;Lorg/apache/http/HttpResponse;)V

    invoke-static {v3, v4, v5}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/http/client/methods/CloseableHttpResponse;

    return-object v3
.end method

.method getResource()Lorg/apache/http/client/cache/Resource;
    .locals 1

    .prologue
    .line 120
    invoke-direct {p0}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->ensureConsumed()V

    .line 121
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->resource:Lorg/apache/http/client/cache/Resource;

    return-object v0
.end method

.method isLimitReached()Z
    .locals 1

    .prologue
    .line 115
    invoke-direct {p0}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->ensureConsumed()V

    .line 116
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->limit:Lorg/apache/http/client/cache/InputLimit;

    invoke-virtual {v0}, Lorg/apache/http/client/cache/InputLimit;->isReached()Z

    move-result v0

    return v0
.end method

.method protected readResponse()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    iget-boolean v0, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->consumed:Z

    if-nez v0, :cond_0

    .line 77
    invoke-direct {p0}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->doConsume()V

    .line 79
    :cond_0
    return-void
.end method
