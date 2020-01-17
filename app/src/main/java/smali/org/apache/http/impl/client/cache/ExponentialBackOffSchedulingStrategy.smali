.class public Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;
.super Ljava/lang/Object;
.source "ExponentialBackOffSchedulingStrategy.java"

# interfaces
.implements Lorg/apache/http/impl/client/cache/SchedulingStrategy;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field public static final DEFAULT_BACK_OFF_RATE:J = 0xaL

.field public static final DEFAULT_INITIAL_EXPIRY_IN_MILLIS:J

.field public static final DEFAULT_MAX_EXPIRY_IN_MILLIS:J


# instance fields
.field private final backOffRate:J

.field private final executor:Ljava/util/concurrent/ScheduledExecutorService;

.field private final initialExpiryInMillis:J

.field private final maxExpiryInMillis:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 61
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x6

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->DEFAULT_INITIAL_EXPIRY_IN_MILLIS:J

    .line 62
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/32 v2, 0x15180

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->DEFAULT_MAX_EXPIRY_IN_MILLIS:J

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/ScheduledExecutorService;JJJ)V
    .locals 2
    .param p1, "executor"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p2, "backOffRate"    # J
    .param p4, "initialExpiryInMillis"    # J
    .param p6, "maxExpiryInMillis"    # J

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    const-string/jumbo v0, "executor"

    invoke-static {v0, p1}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->checkNotNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ScheduledExecutorService;

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    .line 121
    const-string/jumbo v0, "backOffRate"

    invoke-static {v0, p2, p3}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->checkNotNegative(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->backOffRate:J

    .line 122
    const-string/jumbo v0, "initialExpiryInMillis"

    invoke-static {v0, p4, p5}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->checkNotNegative(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->initialExpiryInMillis:J

    .line 123
    const-string/jumbo v0, "maxExpiryInMillis"

    invoke-static {v0, p6, p7}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->checkNotNegative(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->maxExpiryInMillis:J

    .line 124
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 8
    .param p1, "cacheConfig"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 79
    const-wide/16 v2, 0xa

    sget-wide v4, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->DEFAULT_INITIAL_EXPIRY_IN_MILLIS:J

    sget-wide v6, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->DEFAULT_MAX_EXPIRY_IN_MILLIS:J

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;JJJ)V

    .line 83
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/client/cache/CacheConfig;JJJ)V
    .locals 8
    .param p1, "cacheConfig"    # Lorg/apache/http/impl/client/cache/CacheConfig;
    .param p2, "backOffRate"    # J
    .param p4, "initialExpiryInMillis"    # J
    .param p6, "maxExpiryInMillis"    # J

    .prologue
    .line 101
    invoke-static {p1}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->createThreadPoolFromCacheConfig(Lorg/apache/http/impl/client/cache/CacheConfig;)Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v1

    move-object v0, p0

    move-wide v2, p2

    move-wide v4, p4

    move-wide v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;-><init>(Ljava/util/concurrent/ScheduledExecutorService;JJJ)V

    .line 105
    return-void
.end method

.method protected static checkNotNegative(Ljava/lang/String;J)J
    .locals 3
    .param p0, "parameterName"    # Ljava/lang/String;
    .param p1, "value"    # J

    .prologue
    .line 169
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 170
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " may not be negative"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 172
    :cond_0
    return-wide p1
.end method

.method protected static checkNotNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p0, "parameterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 162
    .local p1, "value":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_0

    .line 163
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " may not be null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_0
    return-object p1
.end method

.method private static createThreadPoolFromCacheConfig(Lorg/apache/http/impl/client/cache/CacheConfig;)Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    .locals 2
    .param p0, "cacheConfig"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 109
    new-instance v0, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkersMax()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    .line 111
    .local v0, "scheduledThreadPoolExecutor":Ljava/util/concurrent/ScheduledThreadPoolExecutor;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->setExecuteExistingDelayedTasksAfterShutdownPolicy(Z)V

    .line 112
    return-object v0
.end method


# virtual methods
.method protected calculateDelayInMillis(I)J
    .locals 8
    .param p1, "consecutiveFailedAttempts"    # I

    .prologue
    .line 151
    if-lez p1, :cond_0

    .line 152
    iget-wide v2, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->initialExpiryInMillis:J

    long-to-double v2, v2

    iget-wide v4, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->backOffRate:J

    long-to-double v4, v4

    add-int/lit8 v6, p1, -0x1

    int-to-double v6, v6

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    mul-double/2addr v2, v4

    double-to-long v0, v2

    .line 154
    .local v0, "delayInSeconds":J
    iget-wide v2, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->maxExpiryInMillis:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 157
    .end local v0    # "delayInSeconds":J
    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 136
    return-void
.end method

.method public getBackOffRate()J
    .locals 2

    .prologue
    .line 139
    iget-wide v0, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->backOffRate:J

    return-wide v0
.end method

.method public getInitialExpiryInMillis()J
    .locals 2

    .prologue
    .line 143
    iget-wide v0, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->initialExpiryInMillis:J

    return-wide v0
.end method

.method public getMaxExpiryInMillis()J
    .locals 2

    .prologue
    .line 147
    iget-wide v0, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->maxExpiryInMillis:J

    return-wide v0
.end method

.method public schedule(Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;)V
    .locals 5
    .param p1, "revalidationRequest"    # Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;

    .prologue
    .line 128
    const-string/jumbo v1, "revalidationRequest"

    invoke-static {v1, p1}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->checkNotNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/AsynchronousValidationRequest;->getConsecutiveFailedAttempts()I

    move-result v0

    .line 130
    .local v0, "consecutiveFailedAttempts":I
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->calculateDelayInMillis(I)J

    move-result-wide v2

    .line 131
    .local v2, "delayInMillis":J
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/ExponentialBackOffSchedulingStrategy;->executor:Ljava/util/concurrent/ScheduledExecutorService;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, p1, v2, v3, v4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 132
    return-void
.end method
