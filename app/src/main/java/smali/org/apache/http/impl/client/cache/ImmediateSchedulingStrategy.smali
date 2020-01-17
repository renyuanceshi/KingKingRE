.class public Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;
.super Ljava/lang/Object;
.source "ImmediateSchedulingStrategy.java"

# interfaces
.implements Lorg/apache/http/impl/client/cache/SchedulingStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final executor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1, "executor"    # Ljava/util/concurrent/ExecutorService;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;->executor:Ljava/util/concurrent/ExecutorService;

    .line 68
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 8
    .param p1, "cacheConfig"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 57
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkersCore()I

    move-result v2

    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkersMax()I

    move-result v3

    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkerIdleLifetimeSecs()I

    move-result v0

    int-to-long v4, v0

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/CacheConfig;->getRevalidationQueueSize()I

    move-result v0

    invoke-direct {v7, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    invoke-direct {p0, v1}, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 64
    return-void
.end method


# virtual methods
.method awaitTermination(JLjava/util/concurrent/TimeUnit;)V
    .locals 1
    .param p1, "timeout"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 86
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1, p2, p3}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    .line 87
    return-void
.end method

.method public close()V
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 80
    return-void
.end method

.method public schedule(Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;)V
    .locals 2
    .param p1, "revalidationRequest"    # Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;

    .prologue
    .line 71
    if-nez p1, :cond_0

    .line 72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "AsynchronousValidationRequest may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 76
    return-void
.end method
