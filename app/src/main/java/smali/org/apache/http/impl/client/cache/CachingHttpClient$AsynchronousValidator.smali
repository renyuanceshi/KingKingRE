.class Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;
.super Ljava/lang/Object;
.source "CachingHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/client/cache/CachingHttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AsynchronousValidator"
.end annotation


# instance fields
.field private final cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

.field private final cachingClient:Lorg/apache/http/impl/client/cache/CachingHttpClient;

.field private final executor:Ljava/util/concurrent/ExecutorService;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final queued:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/cache/CachingHttpClient;Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .param p1, "cachingClient"    # Lorg/apache/http/impl/client/cache/CachingHttpClient;
    .param p2, "executor"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 1043
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1010
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->log:Lorg/apache/commons/logging/Log;

    .line 1044
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->cachingClient:Lorg/apache/http/impl/client/cache/CachingHttpClient;

    .line 1045
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->executor:Ljava/util/concurrent/ExecutorService;

    .line 1046
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->queued:Ljava/util/Set;

    .line 1047
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    .line 1048
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/client/cache/CachingHttpClient;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 8
    .param p1, "cachingClient"    # Lorg/apache/http/impl/client/cache/CachingHttpClient;
    .param p2, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 1026
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkersCore()I

    move-result v2

    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkersMax()I

    move-result v3

    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkerIdleLifetimeSecs()I

    move-result v0

    int-to-long v4, v0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->getRevalidationQueueSize()I

    move-result v0

    invoke-direct {v7, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    invoke-direct {p0, p1, v1}, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;-><init>(Lorg/apache/http/impl/client/cache/CachingHttpClient;Ljava/util/concurrent/ExecutorService;)V

    .line 1033
    return-void
.end method


# virtual methods
.method getExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 1093
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->executor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method getScheduledIdentifiers()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1089
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->queued:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method declared-synchronized markComplete(Ljava/lang/String;)V
    .locals 1
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 1085
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->queued:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1086
    monitor-exit p0

    return-void

    .line 1085
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized revalidateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 9
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p4, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 1061
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v1, p1, p2, p4}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getVariantURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/lang/String;

    move-result-object v7

    .line 1063
    .local v7, "uri":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->queued:Ljava/util/Set;

    invoke-interface {v1, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1064
    new-instance v0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;

    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->cachingClient:Lorg/apache/http/impl/client/cache/CachingHttpClient;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v7}, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;-><init>(Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;Lorg/apache/http/impl/client/cache/CachingHttpClient;Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1069
    .local v0, "revalidationRequest":Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;
    :try_start_1
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 1070
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->queued:Ljava/util/Set;

    invoke-interface {v1, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1075
    .end local v0    # "revalidationRequest":Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 1071
    .restart local v0    # "revalidationRequest":Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;
    :catch_0
    move-exception v8

    .line 1072
    .local v8, "ree":Ljava/util/concurrent/RejectedExecutionException;
    :try_start_2
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Revalidation for ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "] not scheduled: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 1061
    .end local v0    # "revalidationRequest":Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;
    .end local v7    # "uri":Ljava/lang/String;
    .end local v8    # "ree":Ljava/util/concurrent/RejectedExecutionException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
