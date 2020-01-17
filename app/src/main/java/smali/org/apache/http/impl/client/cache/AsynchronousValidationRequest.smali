.class Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;
.super Ljava/lang/Object;
.source "AsynchronousValidationRequest.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

.field private final cachingExec:Lorg/apache/http/impl/client/cache/CachingExec;

.field private final consecutiveFailedAttempts:I

.field private final context:Lorg/apache/http/client/protocol/HttpClientContext;

.field private final execAware:Lorg/apache/http/client/methods/HttpExecutionAware;

.field private final identifier:Ljava/lang/String;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final parent:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

.field private final request:Lorg/apache/http/client/methods/HttpRequestWrapper;

.field private final route:Lorg/apache/http/conn/routing/HttpRoute;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/cache/AsynchronousValidator;Lorg/apache/http/impl/client/cache/CachingExec;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;I)V
    .locals 1
    .param p1, "parent"    # Lorg/apache/http/impl/client/cache/AsynchronousValidator;
    .param p2, "cachingExec"    # Lorg/apache/http/impl/client/cache/CachingExec;
    .param p3, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p4, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p5, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p6, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .param p7, "cacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p8, "identifier"    # Ljava/lang/String;
    .param p9, "consecutiveFailedAttempts"    # I

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->log:Lorg/apache/commons/logging/Log;

    .line 80
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    .line 81
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->cachingExec:Lorg/apache/http/impl/client/cache/CachingExec;

    .line 82
    iput-object p3, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->route:Lorg/apache/http/conn/routing/HttpRoute;

    .line 83
    iput-object p4, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->request:Lorg/apache/http/client/methods/HttpRequestWrapper;

    .line 84
    iput-object p5, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->context:Lorg/apache/http/client/protocol/HttpClientContext;

    .line 85
    iput-object p6, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->execAware:Lorg/apache/http/client/methods/HttpExecutionAware;

    .line 86
    iput-object p7, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    .line 87
    iput-object p8, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    .line 88
    iput p9, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->consecutiveFailedAttempts:I

    .line 89
    return-void
.end method

.method private isNotServerError(I)Z
    .locals 1
    .param p1, "statusCode"    # I

    .prologue
    .line 137
    const/16 v0, 0x1f4

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isNotStale(Lorg/apache/http/HttpResponse;)Z
    .locals 7
    .param p1, "httpResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 146
    const-string/jumbo v6, "Warning"

    invoke-interface {p1, v6}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v5

    .line 147
    .local v5, "warnings":[Lorg/apache/http/Header;
    if-eqz v5, :cond_2

    .line 149
    move-object v0, v5

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 156
    .local v3, "warning":Lorg/apache/http/Header;
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 157
    .local v4, "warningValue":Ljava/lang/String;
    const-string/jumbo v6, "110"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string/jumbo v6, "111"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 159
    :cond_0
    const/4 v6, 0x0

    .line 163
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "warning":Lorg/apache/http/Header;
    .end local v4    # "warningValue":Ljava/lang/String;
    :goto_1
    return v6

    .line 149
    .restart local v0    # "arr$":[Lorg/apache/http/Header;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v3    # "warning":Lorg/apache/http/Header;
    .restart local v4    # "warningValue":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 163
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "warning":Lorg/apache/http/Header;
    .end local v4    # "warningValue":Ljava/lang/String;
    :cond_2
    const/4 v6, 0x1

    goto :goto_1
.end method


# virtual methods
.method public getConsecutiveFailedAttempts()I
    .locals 1

    .prologue
    .line 175
    iget v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->consecutiveFailedAttempts:I

    return v0
.end method

.method getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method protected revalidateCacheEntry()Z
    .locals 12

    .prologue
    const/4 v11, 0x0

    .line 112
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->cachingExec:Lorg/apache/http/impl/client/cache/CachingExec;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->route:Lorg/apache/http/conn/routing/HttpRoute;

    iget-object v2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->request:Lorg/apache/http/client/methods/HttpRequestWrapper;

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->context:Lorg/apache/http/client/protocol/HttpClientContext;

    iget-object v4, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->execAware:Lorg/apache/http/client/methods/HttpExecutionAware;

    iget-object v5, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/CachingExec;->revalidateCacheEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v6

    .line 114
    .local v6, "httpResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_start_1
    invoke-interface {v6}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v10

    .line 115
    .local v10, "statusCode":I
    invoke-direct {p0, v10}, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->isNotServerError(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v6}, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->isNotStale(Lorg/apache/http/HttpResponse;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 117
    :goto_0
    :try_start_2
    invoke-interface {v6}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    move v11, v0

    .line 127
    .end local v6    # "httpResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    .end local v10    # "statusCode":I
    :goto_1
    return v11

    .restart local v6    # "httpResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    .restart local v10    # "statusCode":I
    :cond_0
    move v0, v11

    .line 115
    goto :goto_0

    .line 117
    .end local v10    # "statusCode":I
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    throw v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_2

    .line 119
    .end local v6    # "httpResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :catch_0
    move-exception v7

    .line 120
    .local v7, "ioe":Ljava/io/IOException;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Asynchronous revalidation failed due to I/O error"

    invoke-interface {v0, v1, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 122
    .end local v7    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v8

    .line 123
    .local v8, "pe":Lorg/apache/http/HttpException;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "HTTP protocol exception during asynchronous revalidation"

    invoke-interface {v0, v1, v8}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 125
    .end local v8    # "pe":Lorg/apache/http/HttpException;
    :catch_2
    move-exception v9

    .line 126
    .local v9, "re":Ljava/lang/RuntimeException;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "RuntimeException thrown during asynchronous revalidation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public run()V
    .locals 3

    .prologue
    .line 93
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->revalidateCacheEntry()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->jobSuccessful(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    :goto_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->markComplete(Ljava/lang/String;)V

    .line 101
    return-void

    .line 96
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->jobFailed(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 99
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    iget-object v2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->markComplete(Ljava/lang/String;)V

    throw v0
.end method
