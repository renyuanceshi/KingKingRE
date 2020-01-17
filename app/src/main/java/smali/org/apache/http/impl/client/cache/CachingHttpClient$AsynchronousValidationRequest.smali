.class Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;
.super Ljava/lang/Object;
.source "CachingHttpClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/client/cache/CachingHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AsynchronousValidationRequest"
.end annotation


# instance fields
.field private final cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

.field private final cachingClient:Lorg/apache/http/impl/client/cache/CachingHttpClient;

.field private final context:Lorg/apache/http/protocol/HttpContext;

.field private final identifier:Ljava/lang/String;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final parent:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

.field private final request:Lorg/apache/http/client/methods/HttpRequestWrapper;

.field private final target:Lorg/apache/http/HttpHost;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;Lorg/apache/http/impl/client/cache/CachingHttpClient;Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;)V
    .locals 1
    .param p1, "parent"    # Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;
    .param p2, "cachingClient"    # Lorg/apache/http/impl/client/cache/CachingHttpClient;
    .param p3, "target"    # Lorg/apache/http/HttpHost;
    .param p4, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p5, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p6, "cacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p7, "identifier"    # Ljava/lang/String;

    .prologue
    .line 1123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1106
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->log:Lorg/apache/commons/logging/Log;

    .line 1124
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    .line 1125
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->cachingClient:Lorg/apache/http/impl/client/cache/CachingHttpClient;

    .line 1126
    iput-object p3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->target:Lorg/apache/http/HttpHost;

    .line 1127
    iput-object p4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->request:Lorg/apache/http/client/methods/HttpRequestWrapper;

    .line 1128
    iput-object p5, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->context:Lorg/apache/http/protocol/HttpContext;

    .line 1129
    iput-object p6, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    .line 1130
    iput-object p7, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    .line 1131
    return-void
.end method


# virtual methods
.method getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1146
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public run()V
    .locals 7

    .prologue
    .line 1135
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->cachingClient:Lorg/apache/http/impl/client/cache/CachingHttpClient;

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->target:Lorg/apache/http/HttpHost;

    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->request:Lorg/apache/http/client/methods/HttpRequestWrapper;

    iget-object v5, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->context:Lorg/apache/http/protocol/HttpContext;

    iget-object v6, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-virtual {v2, v3, v4, v5, v6}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->revalidateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/ProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1141
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->markComplete(Ljava/lang/String;)V

    .line 1143
    :goto_0
    return-void

    .line 1136
    :catch_0
    move-exception v0

    .line 1137
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_1
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Asynchronous revalidation failed due to exception: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1141
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->markComplete(Ljava/lang/String;)V

    goto :goto_0

    .line 1138
    .end local v0    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 1139
    .local v1, "pe":Lorg/apache/http/ProtocolException;
    :try_start_2
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "ProtocolException thrown during asynchronous revalidation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1141
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->markComplete(Ljava/lang/String;)V

    goto :goto_0

    .end local v1    # "pe":Lorg/apache/http/ProtocolException;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->parent:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;->identifier:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->markComplete(Ljava/lang/String;)V

    throw v2
.end method
