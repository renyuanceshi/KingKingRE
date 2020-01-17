.class public Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;
.super Ljava/lang/Object;
.source "DefaultHttpRequestRetryHandler.java"

# interfaces
.implements Lorg/apache/http/client/HttpRequestRetryHandler;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;


# instance fields
.field private final nonRetriableClasses:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/io/IOException;",
            ">;>;"
        }
    .end annotation
.end field

.field private final requestSentRetryEnabled:Z

.field private final retryCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;-><init>()V

    sput-object v0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->INSTANCE:Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 121
    const/4 v0, 0x3

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;-><init>(IZ)V

    .line 122
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 3
    .param p1, "retryCount"    # I
    .param p2, "requestSentRetryEnabled"    # Z

    .prologue
    .line 103
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljava/io/InterruptedIOException;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Ljava/net/UnknownHostException;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Ljava/net/ConnectException;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/net/ssl/SSLException;

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;-><init>(IZLjava/util/Collection;)V

    .line 108
    return-void
.end method

.method protected constructor <init>(IZLjava/util/Collection;)V
    .locals 3
    .param p1, "retryCount"    # I
    .param p2, "requestSentRetryEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/io/IOException;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p3, "clazzes":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Class<+Ljava/io/IOException;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput p1, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->retryCount:I

    .line 82
    iput-boolean p2, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->requestSentRetryEnabled:Z

    .line 83
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->nonRetriableClasses:Ljava/util/Set;

    .line 84
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 85
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/io/IOException;>;"
    iget-object v2, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->nonRetriableClasses:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 87
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/io/IOException;>;"
    :cond_0
    return-void
.end method


# virtual methods
.method public getRetryCount()I
    .locals 1

    .prologue
    .line 179
    iget v0, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->retryCount:I

    return v0
.end method

.method protected handleAsIdempotent(Lorg/apache/http/HttpRequest;)Z
    .locals 1
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 186
    instance-of v0, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRequestSentRetryEnabled()Z
    .locals 1

    .prologue
    .line 172
    iget-boolean v0, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->requestSentRetryEnabled:Z

    return v0
.end method

.method protected requestIsAborted(Lorg/apache/http/HttpRequest;)Z
    .locals 2
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 196
    move-object v0, p1

    .line 197
    .local v0, "req":Lorg/apache/http/HttpRequest;
    instance-of v1, p1, Lorg/apache/http/impl/client/RequestWrapper;

    if-eqz v1, :cond_0

    .line 198
    check-cast p1, Lorg/apache/http/impl/client/RequestWrapper;

    .end local p1    # "request":Lorg/apache/http/HttpRequest;
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v0

    .line 200
    :cond_0
    instance-of v1, v0, Lorg/apache/http/client/methods/HttpUriRequest;

    if-eqz v1, :cond_1

    check-cast v0, Lorg/apache/http/client/methods/HttpUriRequest;

    .end local v0    # "req":Lorg/apache/http/HttpRequest;
    invoke-interface {v0}, Lorg/apache/http/client/methods/HttpUriRequest;->isAborted()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z
    .locals 8
    .param p1, "exception"    # Ljava/io/IOException;
    .param p2, "executionCount"    # I
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 131
    const-string/jumbo v6, "Exception parameter"

    invoke-static {p1, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 132
    const-string/jumbo v6, "HTTP context"

    invoke-static {p3, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 133
    iget v6, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->retryCount:I

    if-le p2, v6, :cond_1

    .line 164
    :cond_0
    :goto_0
    return v4

    .line 137
    :cond_1
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->nonRetriableClasses:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 140
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->nonRetriableClasses:Ljava/util/Set;

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 141
    .local v2, "rejectException":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/io/IOException;>;"
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    goto :goto_0

    .line 146
    .end local v2    # "rejectException":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/io/IOException;>;"
    :cond_3
    invoke-static {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v0

    .line 147
    .local v0, "clientContext":Lorg/apache/http/client/protocol/HttpClientContext;
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequest()Lorg/apache/http/HttpRequest;

    move-result-object v3

    .line 149
    .local v3, "request":Lorg/apache/http/HttpRequest;
    invoke-virtual {p0, v3}, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->requestIsAborted(Lorg/apache/http/HttpRequest;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 153
    invoke-virtual {p0, v3}, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->handleAsIdempotent(Lorg/apache/http/HttpRequest;)Z

    move-result v6

    if-eqz v6, :cond_4

    move v4, v5

    .line 155
    goto :goto_0

    .line 158
    :cond_4
    invoke-virtual {v0}, Lorg/apache/http/client/protocol/HttpClientContext;->isRequestSent()Z

    move-result v6

    if-eqz v6, :cond_5

    iget-boolean v6, p0, Lorg/apache/http/impl/client/DefaultHttpRequestRetryHandler;->requestSentRetryEnabled:Z

    if-eqz v6, :cond_0

    :cond_5
    move v4, v5

    .line 161
    goto :goto_0
.end method
