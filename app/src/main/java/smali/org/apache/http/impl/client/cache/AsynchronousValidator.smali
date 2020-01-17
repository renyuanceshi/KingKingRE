.class Lorg/apache/http/impl/client/cache/AsynchronousValidator;
.super Ljava/lang/Object;
.source "AsynchronousValidator.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private final cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

.field private final failureCache:Lorg/apache/http/impl/client/cache/FailureCache;

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

.field private final schedulingStrategy:Lorg/apache/http/impl/client/cache/SchedulingStrategy;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 1
    .param p1, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 67
    new-instance v0, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/AsynchronousValidator;-><init>(Lorg/apache/http/impl/client/cache/SchedulingStrategy;)V

    .line 68
    return-void
.end method

.method constructor <init>(Lorg/apache/http/impl/client/cache/SchedulingStrategy;)V
    .locals 1
    .param p1, "schedulingStrategy"    # Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->log:Lorg/apache/commons/logging/Log;

    .line 78
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->schedulingStrategy:Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    .line 79
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->queued:Ljava/util/Set;

    .line 80
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    .line 81
    new-instance v0, Lorg/apache/http/impl/client/cache/DefaultFailureCache;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/DefaultFailureCache;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->failureCache:Lorg/apache/http/impl/client/cache/FailureCache;

    .line 82
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->schedulingStrategy:Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    invoke-interface {v0}, Lorg/apache/http/impl/client/cache/SchedulingStrategy;->close()V

    .line 86
    return-void
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
    .line 148
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->queued:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method jobFailed(Ljava/lang/String;)V
    .locals 1
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->failureCache:Lorg/apache/http/impl/client/cache/FailureCache;

    invoke-interface {v0, p1}, Lorg/apache/http/impl/client/cache/FailureCache;->increaseErrorCount(Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method jobSuccessful(Ljava/lang/String;)V
    .locals 1
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 134
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->failureCache:Lorg/apache/http/impl/client/cache/FailureCache;

    invoke-interface {v0, p1}, Lorg/apache/http/impl/client/cache/FailureCache;->resetErrorCount(Ljava/lang/String;)V

    .line 135
    return-void
.end method

.method declared-synchronized markComplete(Ljava/lang/String;)V
    .locals 1
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 124
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->queued:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    monitor-exit p0

    return-void

    .line 124
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized revalidateCacheEntry(Lorg/apache/http/impl/client/cache/CachingExec;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 12
    .param p1, "cachingExec"    # Lorg/apache/http/impl/client/cache/CachingExec;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p3, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p4, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p5, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .param p6, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 99
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual/range {p4 .. p4}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    move-object/from16 v0, p6

    invoke-virtual {v2, v3, p3, v0}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getVariantURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/lang/String;

    move-result-object v9

    .line 101
    .local v9, "uri":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->queued:Ljava/util/Set;

    invoke-interface {v2, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 102
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->failureCache:Lorg/apache/http/impl/client/cache/FailureCache;

    invoke-interface {v2, v9}, Lorg/apache/http/impl/client/cache/FailureCache;->getErrorCount(Ljava/lang/String;)I

    move-result v10

    .line 103
    .local v10, "consecutiveFailedAttempts":I
    new-instance v1, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    invoke-direct/range {v1 .. v10}, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;-><init>(Lorg/apache/http/impl/client/cache/AsynchronousValidator;Lorg/apache/http/impl/client/cache/CachingExec;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    .local v1, "revalidationRequest":Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;
    :try_start_1
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->schedulingStrategy:Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    invoke-interface {v2, v1}, Lorg/apache/http/impl/client/cache/SchedulingStrategy;->schedule(Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;)V

    .line 109
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->queued:Ljava/util/Set;

    invoke-interface {v2, v9}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    .end local v1    # "revalidationRequest":Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;
    .end local v10    # "consecutiveFailedAttempts":I
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 110
    .restart local v1    # "revalidationRequest":Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;
    .restart local v10    # "consecutiveFailedAttempts":I
    :catch_0
    move-exception v11

    .line 111
    .local v11, "ree":Ljava/util/concurrent/RejectedExecutionException;
    :try_start_2
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->log:Lorg/apache/commons/logging/Log;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Revalidation for ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "] not scheduled: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 99
    .end local v1    # "revalidationRequest":Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;
    .end local v9    # "uri":Ljava/lang/String;
    .end local v10    # "consecutiveFailedAttempts":I
    .end local v11    # "ree":Ljava/util/concurrent/RejectedExecutionException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
