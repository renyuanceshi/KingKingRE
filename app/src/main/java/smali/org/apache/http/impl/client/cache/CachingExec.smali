.class public Lorg/apache/http/impl/client/cache/CachingExec;
.super Ljava/lang/Object;
.source "CachingExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field private static final SUPPORTS_RANGE_AND_CONTENT_RANGE_HEADERS:Z


# instance fields
.field private final asynchRevalidator:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

.field private final backend:Lorg/apache/http/impl/execchain/ClientExecChain;

.field private final cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

.field private final cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheableRequestPolicy:Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

.field private final conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

.field private final responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

.field private final responseCachingPolicy:Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

.field private final responseCompliance:Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

.field private final responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

.field private final suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

.field private final validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

.field private final viaHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/http/ProtocolVersion;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;)V
    .locals 2
    .param p1, "backend"    # Lorg/apache/http/impl/execchain/ClientExecChain;

    .prologue
    .line 157
    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>()V

    sget-object v1, Lorg/apache/http/impl/client/cache/CacheConfig;->DEFAULT:Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/http/impl/client/cache/CachingExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 158
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 1
    .param p1, "backend"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "resourceFactory"    # Lorg/apache/http/client/cache/ResourceFactory;
    .param p3, "storage"    # Lorg/apache/http/client/cache/HttpCacheStorage;
    .param p4, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 153
    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    invoke-direct {v0, p2, p3, p4}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    invoke-direct {p0, p1, v0, p4}, Lorg/apache/http/impl/client/cache/CachingExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 154
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 1
    .param p1, "backend"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "cache"    # Lorg/apache/http/impl/client/cache/HttpCache;
    .param p3, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 121
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/cache/CachingExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/AsynchronousValidator;)V

    .line 122
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/AsynchronousValidator;)V
    .locals 7
    .param p1, "backend"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "cache"    # Lorg/apache/http/impl/client/cache/HttpCache;
    .param p3, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;
    .param p4, "asynchRevalidator"    # Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    .line 96
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    .line 97
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    .line 99
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->viaHeaders:Ljava/util/Map;

    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    .line 130
    const-string/jumbo v0, "HTTP backend"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    const-string/jumbo v0, "HttpCache"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 132
    if-eqz p3, :cond_0

    move-object v0, p3

    :goto_0
    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    .line 133
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->backend:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 134
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    .line 135
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    .line 136
    new-instance v0, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;-><init>(Lorg/apache/http/impl/client/cache/CacheValidityPolicy;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    .line 137
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheableRequestPolicy:Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

    .line 138
    new-instance v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0, v1, p3}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;-><init>(Lorg/apache/http/impl/client/cache/CacheValidityPolicy;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    .line 139
    new-instance v0, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    .line 140
    new-instance v0, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCompliance:Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

    .line 141
    new-instance v0, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/CacheConfig;->isWeakETagOnPutDeleteAllowed()Z

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    .line 142
    new-instance v1, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CacheConfig;->getMaxObjectSize()J

    move-result-wide v2

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CacheConfig;->isSharedCache()Z

    move-result v4

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CacheConfig;->isNeverCacheHTTP10ResponsesWithQuery()Z

    move-result v5

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CacheConfig;->is303CachingEnabled()Z

    move-result v6

    invoke-direct/range {v1 .. v6}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;-><init>(JZZZ)V

    iput-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCachingPolicy:Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

    .line 145
    iput-object p4, p0, Lorg/apache/http/impl/client/cache/CachingExec;->asynchRevalidator:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    .line 146
    return-void

    .line 132
    :cond_0
    sget-object v0, Lorg/apache/http/impl/client/cache/CacheConfig;->DEFAULT:Lorg/apache/http/impl/client/cache/CacheConfig;

    goto :goto_0
.end method

.method constructor <init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheValidityPolicy;Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/AsynchronousValidator;)V
    .locals 2
    .param p1, "backend"    # Lorg/apache/http/impl/execchain/ClientExecChain;
    .param p2, "responseCache"    # Lorg/apache/http/impl/client/cache/HttpCache;
    .param p3, "validityPolicy"    # Lorg/apache/http/impl/client/cache/CacheValidityPolicy;
    .param p4, "responseCachingPolicy"    # Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;
    .param p5, "responseGenerator"    # Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;
    .param p6, "cacheableRequestPolicy"    # Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;
    .param p7, "suitabilityChecker"    # Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;
    .param p8, "conditionalRequestBuilder"    # Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;
    .param p9, "responseCompliance"    # Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;
    .param p10, "requestCompliance"    # Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;
    .param p11, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;
    .param p12, "asynchRevalidator"    # Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    .prologue
    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    .line 96
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    .line 97
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    .line 99
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->viaHeaders:Ljava/util/Map;

    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    .line 173
    if-eqz p11, :cond_0

    .end local p11    # "config":Lorg/apache/http/impl/client/cache/CacheConfig;
    :goto_0
    iput-object p11, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    .line 174
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->backend:Lorg/apache/http/impl/execchain/ClientExecChain;

    .line 175
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    .line 176
    iput-object p3, p0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    .line 177
    iput-object p4, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCachingPolicy:Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

    .line 178
    iput-object p5, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    .line 179
    iput-object p6, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheableRequestPolicy:Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

    .line 180
    iput-object p7, p0, Lorg/apache/http/impl/client/cache/CachingExec;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    .line 181
    iput-object p8, p0, Lorg/apache/http/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    .line 182
    iput-object p9, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCompliance:Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

    .line 183
    iput-object p10, p0, Lorg/apache/http/impl/client/cache/CachingExec;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    .line 184
    iput-object p12, p0, Lorg/apache/http/impl/client/cache/CachingExec;->asynchRevalidator:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    .line 185
    return-void

    .line 173
    .restart local p11    # "config":Lorg/apache/http/impl/client/cache/CacheConfig;
    :cond_0
    sget-object p11, Lorg/apache/http/impl/client/cache/CacheConfig;->DEFAULT:Lorg/apache/http/impl/client/cache/CacheConfig;

    goto :goto_0
.end method

.method private alreadyHaveNewerCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)Z
    .locals 7
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "backendResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v5, 0x0

    .line 845
    const/4 v2, 0x0

    .line 847
    .local v2, "existing":Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_start_0
    iget-object v6, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v6, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->getCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 851
    :goto_0
    if-nez v2, :cond_1

    .line 867
    :cond_0
    :goto_1
    return v5

    .line 854
    :cond_1
    const-string/jumbo v6, "Date"

    invoke-virtual {v2, v6}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 855
    .local v1, "entryDateHeader":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    .line 858
    const-string/jumbo v6, "Date"

    invoke-interface {p3, v6}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v4

    .line 859
    .local v4, "responseDateHeader":Lorg/apache/http/Header;
    if-eqz v4, :cond_0

    .line 862
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 863
    .local v0, "entryDate":Ljava/util/Date;
    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    .line 864
    .local v3, "responseDate":Ljava/util/Date;
    if-eqz v0, :cond_0

    if-eqz v3, :cond_0

    .line 867
    invoke-virtual {v3, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    goto :goto_1

    .line 848
    .end local v0    # "entryDate":Ljava/util/Date;
    .end local v1    # "entryDateHeader":Lorg/apache/http/Header;
    .end local v3    # "responseDate":Ljava/util/Date;
    .end local v4    # "responseDateHeader":Lorg/apache/http/Header;
    :catch_0
    move-exception v6

    goto :goto_0
.end method

.method private explicitFreshnessRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 22
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    .line 482
    const-string/jumbo v18, "Cache-Control"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v6

    .local v6, "arr$":[Lorg/apache/http/Header;
    array-length v12, v6

    .local v12, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    move v11, v10

    .end local v6    # "arr$":[Lorg/apache/http/Header;
    .end local v10    # "i$":I
    .end local v12    # "len$":I
    .local v11, "i$":I
    :goto_0
    if-ge v11, v12, :cond_4

    aget-object v9, v6, v11

    .line 483
    .local v9, "h":Lorg/apache/http/Header;
    invoke-interface {v9}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v7

    .local v7, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v13, v7

    .local v13, "len$":I
    const/4 v10, 0x0

    .end local v11    # "i$":I
    .restart local v10    # "i$":I
    :goto_1
    if-ge v10, v13, :cond_3

    aget-object v8, v7, v10

    .line 484
    .local v8, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v18, "max-stale"

    invoke-interface {v8}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 486
    :try_start_0
    invoke-interface {v8}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .line 487
    .local v16, "maxstale":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v4

    .line 488
    .local v4, "age":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v14

    .line 489
    .local v14, "lifetime":J
    sub-long v18, v4, v14

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v20, v0

    cmp-long v18, v18, v20

    if-lez v18, :cond_2

    .line 490
    const/16 v18, 0x1

    .line 501
    .end local v4    # "age":J
    .end local v7    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v8    # "elt":Lorg/apache/http/HeaderElement;
    .end local v9    # "h":Lorg/apache/http/Header;
    .end local v10    # "i$":I
    .end local v13    # "len$":I
    .end local v14    # "lifetime":J
    .end local v16    # "maxstale":I
    :goto_2
    return v18

    .line 492
    .restart local v7    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v8    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v9    # "h":Lorg/apache/http/Header;
    .restart local v10    # "i$":I
    .restart local v13    # "len$":I
    :catch_0
    move-exception v17

    .line 493
    .local v17, "nfe":Ljava/lang/NumberFormatException;
    const/16 v18, 0x1

    goto :goto_2

    .line 495
    .end local v17    # "nfe":Ljava/lang/NumberFormatException;
    :cond_0
    const-string/jumbo v18, "min-fresh"

    invoke-interface {v8}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_1

    const-string/jumbo v18, "max-age"

    invoke-interface {v8}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 497
    :cond_1
    const/16 v18, 0x1

    goto :goto_2

    .line 483
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 482
    .end local v8    # "elt":Lorg/apache/http/HeaderElement;
    :cond_3
    add-int/lit8 v10, v11, 0x1

    move v11, v10

    .end local v10    # "i$":I
    .restart local v11    # "i$":I
    goto :goto_0

    .line 501
    .end local v7    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v9    # "h":Lorg/apache/http/Header;
    .end local v13    # "len$":I
    :cond_4
    const/16 v18, 0x0

    goto :goto_2
.end method

.method private flushEntriesInvalidatedByRequest(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V
    .locals 3
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;

    .prologue
    .line 407
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v1, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->flushInvalidatedCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 411
    :goto_0
    return-void

    .line 408
    :catch_0
    move-exception v0

    .line 409
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Unable to flush invalidated entries from cache"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private generateCachedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 6
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p4, "now"    # Ljava/util/Date;

    .prologue
    .line 416
    const-string/jumbo v1, "If-None-Match"

    invoke-virtual {p1, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "If-Modified-Since"

    invoke-virtual {p1, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 418
    :cond_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p3}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 422
    .local v0, "cachedResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :goto_0
    sget-object v1, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_HIT:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p2, v1}, Lorg/apache/http/impl/client/cache/CachingExec;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 423
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v1, p3, p4}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 424
    const-string/jumbo v1, "Warning"

    const-string/jumbo v2, "110 localhost \"Response is stale\""

    invoke-interface {v0, v1, v2}, Lorg/apache/http/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    :cond_1
    return-object v0

    .line 420
    .end local v0    # "cachedResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :cond_2
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p3}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .restart local v0    # "cachedResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    goto :goto_0
.end method

.method private generateGatewayTimeout(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 443
    sget-object v0, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CachingExec;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 444
    new-instance v0, Lorg/apache/http/message/BasicHttpResponse;

    sget-object v1, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v2, 0x1f8

    const-string/jumbo v3, "Gateway Timeout"

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    invoke-static {v0}, Lorg/apache/http/impl/client/cache/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method private generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;
    .locals 12
    .param p1, "msg"    # Lorg/apache/http/HttpMessage;

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 506
    invoke-interface {p1}, Lorg/apache/http/HttpMessage;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v1

    .line 507
    .local v1, "pv":Lorg/apache/http/ProtocolVersion;
    iget-object v5, p0, Lorg/apache/http/impl/client/cache/CachingExec;->viaHeaders:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 508
    .local v0, "existingEntry":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 525
    .end local v0    # "existingEntry":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 512
    .restart local v0    # "existingEntry":Ljava/lang/String;
    :cond_0
    const-string/jumbo v5, "org.apache.http.client"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/apache/http/util/VersionInfo;->loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;

    move-result-object v4

    .line 513
    .local v4, "vi":Lorg/apache/http/util/VersionInfo;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lorg/apache/http/util/VersionInfo;->getRelease()Ljava/lang/String;

    move-result-object v2

    .line 516
    .local v2, "release":Ljava/lang/String;
    :goto_1
    const-string/jumbo v5, "http"

    invoke-virtual {v1}, Lorg/apache/http/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 517
    const-string/jumbo v5, "%d.%d localhost (Apache-HttpClient/%s (cache))"

    new-array v6, v11, [Ljava/lang/Object;

    invoke-virtual {v1}, Lorg/apache/http/ProtocolVersion;->getMajor()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v1}, Lorg/apache/http/ProtocolVersion;->getMinor()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    aput-object v2, v6, v10

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 523
    .local v3, "value":Ljava/lang/String;
    :goto_2
    iget-object v5, p0, Lorg/apache/http/impl/client/cache/CachingExec;->viaHeaders:Ljava/util/Map;

    invoke-interface {v5, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v3

    .line 525
    goto :goto_0

    .line 513
    .end local v2    # "release":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_1
    const-string/jumbo v2, "UNAVAILABLE"

    goto :goto_1

    .line 520
    .restart local v2    # "release":Ljava/lang/String;
    :cond_2
    const-string/jumbo v5, "%s/%d.%d localhost (Apache-HttpClient/%s (cache))"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v1}, Lorg/apache/http/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v1}, Lorg/apache/http/ProtocolVersion;->getMajor()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v1}, Lorg/apache/http/ProtocolVersion;->getMinor()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    aput-object v2, v6, v11

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "value":Ljava/lang/String;
    goto :goto_2
.end method

.method private getExistingCacheVariants(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)Ljava/util/Map;
    .locals 4
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/client/methods/HttpRequestWrapper;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/impl/client/cache/Variant;",
            ">;"
        }
    .end annotation

    .prologue
    .line 373
    const/4 v1, 0x0

    .line 375
    .local v1, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v2, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->getVariantCacheEntriesWithEtags(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/util/Map;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 379
    :goto_0
    return-object v1

    .line 376
    :catch_0
    move-exception v0

    .line 377
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, "Unable to retrieve variant entries from cache"

    invoke-interface {v2, v3, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private getFatallyNoncompliantResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 5
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 360
    const/4 v2, 0x0

    .line 361
    .local v2, "fatalErrorResponse":Lorg/apache/http/HttpResponse;
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingExec;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v4, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->requestIsFatallyNonCompliant(Lorg/apache/http/HttpRequest;)Ljava/util/List;

    move-result-object v1

    .line 363
    .local v1, "fatalError":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/impl/client/cache/RequestProtocolError;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/impl/client/cache/RequestProtocolError;

    .line 364
    .local v0, "error":Lorg/apache/http/impl/client/cache/RequestProtocolError;
    sget-object v4, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p2, v4}, Lorg/apache/http/impl/client/cache/CachingExec;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 365
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingExec;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v4, v0}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->getErrorForRequest(Lorg/apache/http/impl/client/cache/RequestProtocolError;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 366
    goto :goto_0

    .line 367
    .end local v0    # "error":Lorg/apache/http/impl/client/cache/RequestProtocolError;
    :cond_0
    return-object v2
.end method

.method private getUpdatedVariantEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/client/methods/CloseableHttpResponse;Lorg/apache/http/impl/client/cache/Variant;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 10
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "conditionalRequest"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "requestDate"    # Ljava/util/Date;
    .param p4, "responseDate"    # Ljava/util/Date;
    .param p5, "backendResponse"    # Lorg/apache/http/client/methods/CloseableHttpResponse;
    .param p6, "matchingVariant"    # Lorg/apache/http/impl/client/cache/Variant;
    .param p7, "matchedEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 700
    move-object/from16 v9, p7

    .line 702
    .local v9, "responseEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-virtual/range {p6 .. p6}, Lorg/apache/http/impl/client/cache/Variant;->getCacheKey()Ljava/lang/String;

    move-result-object v7

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v3, p7

    move-object v4, p5

    move-object v5, p3

    move-object v6, p4

    invoke-interface/range {v0 .. v7}, Lorg/apache/http/impl/client/cache/HttpCache;->updateVariantCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v9

    .line 707
    invoke-interface {p5}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 709
    :goto_0
    return-object v9

    .line 704
    :catch_0
    move-exception v8

    .line 705
    .local v8, "ioe":Ljava/io/IOException;
    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Could not update cache entry"

    invoke-interface {v0, v1, v8}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 707
    invoke-interface {p5}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    goto :goto_0

    .end local v8    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v0

    invoke-interface {p5}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    throw v0
.end method

.method private handleCacheHit(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 9
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .param p5, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 274
    invoke-virtual {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v8

    .line 275
    .local v8, "target":Lorg/apache/http/HttpHost;
    invoke-direct {p0, v8, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->recordCacheHit(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V

    .line 276
    const/4 v7, 0x0

    .line 277
    .local v7, "out":Lorg/apache/http/client/methods/CloseableHttpResponse;
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v6

    .line 278
    .local v6, "now":Ljava/util/Date;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    invoke-virtual {v0, v8, p2, p5, v6}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->canCachedResponseBeUsed(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Cache hit"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 280
    invoke-direct {p0, p2, p3, p5, v6}, Lorg/apache/http/impl/client/cache/CachingExec;->generateCachedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v7

    .line 292
    :goto_0
    const-string/jumbo v0, "http.route"

    invoke-virtual {p3, v0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 293
    const-string/jumbo v0, "http.target_host"

    invoke-virtual {p3, v0, v8}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 294
    const-string/jumbo v0, "http.request"

    invoke-virtual {p3, v0, p2}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 295
    const-string/jumbo v0, "http.response"

    invoke-virtual {p3, v0, v7}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 296
    const-string/jumbo v0, "http.request_sent"

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p3, v0, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    move-object v0, v7

    .line 297
    :goto_1
    return-object v0

    .line 281
    :cond_0
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->mayCallBackend(Lorg/apache/http/client/methods/HttpRequestWrapper;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 282
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Cache entry not suitable but only-if-cached requested"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 283
    invoke-direct {p0, p3}, Lorg/apache/http/impl/client/cache/CachingExec;->generateGatewayTimeout(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v7

    goto :goto_0

    .line 284
    :cond_1
    invoke-virtual {p5}, Lorg/apache/http/client/cache/HttpCacheEntry;->getStatusCode()I

    move-result v0

    const/16 v1, 0x130

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    invoke-virtual {v0, p2}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 286
    :cond_2
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Revalidating cache entry"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 287
    invoke-direct/range {v0 .. v6}, Lorg/apache/http/impl/client/cache/CachingExec;->revalidateCacheEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_1

    .line 289
    :cond_3
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Cache entry not usable; calling backend"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 290
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/http/impl/client/cache/CachingExec;->callBackend(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_1
.end method

.method private handleCacheMiss(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
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
    .line 328
    invoke-virtual {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v6

    .line 329
    .local v6, "target":Lorg/apache/http/HttpHost;
    invoke-direct {p0, v6, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->recordCacheMiss(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V

    .line 331
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->mayCallBackend(Lorg/apache/http/client/methods/HttpRequestWrapper;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 332
    new-instance v0, Lorg/apache/http/message/BasicHttpResponse;

    sget-object v1, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v2, 0x1f8

    const-string/jumbo v3, "Gateway Timeout"

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    invoke-static {v0}, Lorg/apache/http/impl/client/cache/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 343
    :goto_0
    return-object v0

    .line 337
    :cond_0
    invoke-direct {p0, v6, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->getExistingCacheVariants(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)Ljava/util/Map;

    move-result-object v5

    .line 338
    .local v5, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    if-eqz v5, :cond_1

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 339
    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/CachingExec;->negotiateResponseFromVariants(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Ljava/util/Map;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_0

    .line 343
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/http/impl/client/cache/CachingExec;->callBackend(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_0
.end method

.method private handleRevalidationFailure(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 1
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p4, "now"    # Ljava/util/Date;

    .prologue
    .line 434
    invoke-direct {p0, p1, p3, p4}, Lorg/apache/http/impl/client/cache/CachingExec;->staleResponseNotAllowed(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 435
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->generateGatewayTimeout(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 437
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, p2, p3}, Lorg/apache/http/impl/client/cache/CachingExec;->unvalidatedCacheHit(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_0
.end method

.method private mayCallBackend(Lorg/apache/http/client/methods/HttpRequestWrapper;)Z
    .locals 10
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;

    .prologue
    .line 467
    const-string/jumbo v8, "Cache-Control"

    invoke-virtual {p1, v8}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    move v5, v4

    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v4    # "i$":I
    .end local v6    # "len$":I
    .local v5, "i$":I
    :goto_0
    if-ge v5, v6, :cond_2

    aget-object v3, v0, v5

    .line 468
    .local v3, "h":Lorg/apache/http/Header;
    invoke-interface {v3}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v7, v1

    .local v7, "len$":I
    const/4 v4, 0x0

    .end local v5    # "i$":I
    .restart local v4    # "i$":I
    :goto_1
    if-ge v4, v7, :cond_1

    aget-object v2, v1, v4

    .line 469
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v8, "only-if-cached"

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 470
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v9, "Request marked only-if-cached"

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 471
    const/4 v8, 0x0

    .line 475
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v4    # "i$":I
    .end local v7    # "len$":I
    :goto_2
    return v8

    .line 468
    .restart local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v2    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v3    # "h":Lorg/apache/http/Header;
    .restart local v4    # "i$":I
    .restart local v7    # "len$":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 467
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    :cond_1
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_0

    .line 475
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v7    # "len$":I
    :cond_2
    const/4 v8, 0x1

    goto :goto_2
.end method

.method private recordCacheHit(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V
    .locals 4
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;

    .prologue
    .line 391
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 392
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 393
    invoke-virtual {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    .line 394
    .local v0, "rl":Lorg/apache/http/RequestLine;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Cache hit [host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "; uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 396
    .end local v0    # "rl":Lorg/apache/http/RequestLine;
    :cond_0
    return-void
.end method

.method private recordCacheMiss(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V
    .locals 4
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;

    .prologue
    .line 383
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 384
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 385
    invoke-virtual {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    .line 386
    .local v0, "rl":Lorg/apache/http/RequestLine;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Cache miss [host: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "; uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 388
    .end local v0    # "rl":Lorg/apache/http/RequestLine;
    :cond_0
    return-void
.end method

.method private recordCacheUpdate(Lorg/apache/http/protocol/HttpContext;)V
    .locals 1
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 399
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 400
    sget-object v0, Lorg/apache/http/client/cache/CacheResponseStatus;->VALIDATED:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CachingExec;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 401
    return-void
.end method

.method private retryRequestUnconditionally(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 2
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .param p5, "matchedEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 687
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    invoke-virtual {v1, p2, p5}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;->buildUnconditionalRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v0

    .line 689
    .local v0, "unconditional":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual {p0, p1, v0, p3, p4}, Lorg/apache/http/impl/client/cache/CachingExec;->callBackend(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v1

    return-object v1
.end method

.method private revalidateCacheEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 9
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .param p5, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p6, "now"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 309
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->asynchRevalidator:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    if-eqz v0, :cond_0

    invoke-direct {p0, p2, p5, p6}, Lorg/apache/http/impl/client/cache/CachingExec;->staleResponseNotAllowed(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p5, p6}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mayReturnStaleWhileRevalidating(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 312
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Serving stale with asynchronous revalidation"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 313
    invoke-direct {p0, p2, p3, p5, p6}, Lorg/apache/http/impl/client/cache/CachingExec;->generateCachedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v8

    .line 314
    .local v8, "resp":Lorg/apache/http/client/methods/CloseableHttpResponse;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->asynchRevalidator:Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lorg/apache/http/impl/client/cache/AsynchronousValidator;->revalidateCacheEntry(Lorg/apache/http/impl/client/cache/CachingExec;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 319
    .end local v8    # "resp":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :goto_0
    return-object v8

    .line 317
    :cond_0
    invoke-virtual/range {p0 .. p5}, Lorg/apache/http/impl/client/cache/CachingExec;->revalidateCacheEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    goto :goto_0

    .line 318
    :catch_0
    move-exception v7

    .line 319
    .local v7, "ioex":Ljava/io/IOException;
    invoke-direct {p0, p2, p3, p5, p6}, Lorg/apache/http/impl/client/cache/CachingExec;->handleRevalidationFailure(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v8

    goto :goto_0
.end method

.method private revalidationResponseIsTooOld(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 6
    .param p1, "backendResponse"    # Lorg/apache/http/HttpResponse;
    .param p2, "cacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    const/4 v4, 0x0

    .line 591
    const-string/jumbo v5, "Date"

    invoke-virtual {p2, v5}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 592
    .local v1, "entryDateHeader":Lorg/apache/http/Header;
    const-string/jumbo v5, "Date"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    .line 593
    .local v3, "responseDateHeader":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    if-eqz v3, :cond_0

    .line 594
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 595
    .local v0, "entryDate":Ljava/util/Date;
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 596
    .local v2, "respDate":Ljava/util/Date;
    if-eqz v0, :cond_0

    if-nez v2, :cond_1

    .line 607
    .end local v0    # "entryDate":Ljava/util/Date;
    .end local v2    # "respDate":Ljava/util/Date;
    :cond_0
    :goto_0
    return v4

    .line 603
    .restart local v0    # "entryDate":Ljava/util/Date;
    .restart local v2    # "respDate":Ljava/util/Date;
    :cond_1
    invoke-virtual {v2, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 604
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private satisfyFromCache(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 4
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;

    .prologue
    .line 348
    const/4 v0, 0x0

    .line 350
    .local v0, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v2, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->getCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 354
    :goto_0
    return-object v0

    .line 351
    :catch_0
    move-exception v1

    .line 352
    .local v1, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, "Unable to retrieve entries from cache"

    invoke-interface {v2, v3, v1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V
    .locals 1
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p2, "value"    # Lorg/apache/http/client/cache/CacheResponseStatus;

    .prologue
    .line 529
    if-eqz p1, :cond_0

    .line 530
    const-string/jumbo v0, "http.cache.response.status"

    invoke-interface {p1, v0, p2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 532
    :cond_0
    return-void
.end method

.method private shouldSendNotModifiedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 2
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "responseEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 726
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, p1, p2, v1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->allConditionalsMatch(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private staleIfErrorAppliesTo(I)Z
    .locals 1
    .param p1, "statusCode"    # I

    .prologue
    .line 789
    const/16 v0, 0x1f4

    if-eq p1, v0, :cond_0

    const/16 v0, 0x1f6

    if-eq p1, v0, :cond_0

    const/16 v0, 0x1f7

    if-eq p1, v0, :cond_0

    const/16 v0, 0x1f8

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private staleResponseNotAllowed(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 1
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    .line 461
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mustRevalidate(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CacheConfig;->isSharedCache()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->proxyRevalidate(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/http/impl/client/cache/CachingExec;->explicitFreshnessRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private storeRequestIfModifiedSinceFor304Response(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V
    .locals 3
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "backendResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 835
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0x130

    if-ne v1, v2, :cond_0

    .line 836
    const-string/jumbo v1, "If-Modified-Since"

    invoke-interface {p1, v1}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 837
    .local v0, "h":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    .line 838
    const-string/jumbo v1, "Last-Modified"

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 841
    .end local v0    # "h":Lorg/apache/http/Header;
    :cond_0
    return-void
.end method

.method private tryToUpdateVariantMap(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/impl/client/cache/Variant;)V
    .locals 3
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "matchingVariant"    # Lorg/apache/http/impl/client/cache/Variant;

    .prologue
    .line 717
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v1, p1, p2, p3}, Lorg/apache/http/impl/client/cache/HttpCache;->reuseVariantEntryFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/impl/client/cache/Variant;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 721
    :goto_0
    return-void

    .line 718
    :catch_0
    move-exception v0

    .line 719
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Could not update cache entry to reuse variant"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private unvalidatedCacheHit(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 3
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 451
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p2}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 452
    .local v0, "cachedResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    sget-object v1, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_HIT:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v1}, Lorg/apache/http/impl/client/cache/CachingExec;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 453
    const-string/jumbo v1, "Warning"

    const-string/jumbo v2, "111 localhost \"Revalidation failed\""

    invoke-interface {v0, v1, v2}, Lorg/apache/http/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    return-object v0
.end method


# virtual methods
.method callBackend(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 9
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
    .line 572
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v5

    .line 574
    .local v5, "requestDate":Ljava/util/Date;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Calling the backend"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 575
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->backend:Lorg/apache/http/impl/execchain/ClientExecChain;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v7

    .line 577
    .local v7, "backendResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_start_0
    const-string/jumbo v0, "Via"

    invoke-direct {p0, v7}, Lorg/apache/http/impl/client/cache/CachingExec;->generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v7, v0, v1}, Lorg/apache/http/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 578
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v7}, Lorg/apache/http/impl/client/cache/CachingExec;->handleBackendResponse(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/client/methods/CloseableHttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    return-object v0

    .line 580
    :catch_0
    move-exception v8

    .line 581
    .local v8, "ex":Ljava/io/IOException;
    invoke-interface {v7}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 582
    throw v8

    .line 583
    .end local v8    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v8

    .line 584
    .local v8, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v7}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 585
    throw v8
.end method

.method clientRequestsOurOptions(Lorg/apache/http/HttpRequest;)Z
    .locals 4
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    const/4 v1, 0x0

    .line 549
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    .line 551
    .local v0, "line":Lorg/apache/http/RequestLine;
    const-string/jumbo v2, "OPTIONS"

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 563
    :cond_0
    :goto_0
    return v1

    .line 555
    :cond_1
    const-string/jumbo v2, "*"

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 559
    const-string/jumbo v2, "0"

    const-string/jumbo v3, "Max-Forwards"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 563
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 2
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 217
    invoke-static {}, Lorg/apache/http/client/protocol/HttpClientContext;->create()Lorg/apache/http/client/protocol/HttpClientContext;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/apache/http/impl/client/cache/CachingExec;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 1
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 224
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/cache/CachingExec;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 9
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
    .line 233
    invoke-virtual {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v7

    .line 234
    .local v7, "target":Lorg/apache/http/HttpHost;
    invoke-virtual {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/CachingExec;->generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;

    move-result-object v8

    .line 237
    .local v8, "via":Ljava/lang/String;
    sget-object v0, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_MISS:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p3, v0}, Lorg/apache/http/impl/client/cache/CachingExec;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 239
    invoke-virtual {p0, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->clientRequestsOurOptions(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 240
    sget-object v0, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p3, v0}, Lorg/apache/http/impl/client/cache/CachingExec;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 241
    new-instance v0, Lorg/apache/http/impl/client/cache/OptionsHttp11Response;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/OptionsHttp11Response;-><init>()V

    invoke-static {v0}, Lorg/apache/http/impl/client/cache/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 264
    :goto_0
    return-object v0

    .line 244
    :cond_0
    invoke-direct {p0, p2, p3}, Lorg/apache/http/impl/client/cache/CachingExec;->getFatallyNoncompliantResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 245
    .local v6, "fatalErrorResponse":Lorg/apache/http/HttpResponse;
    if-eqz v6, :cond_1

    .line 246
    invoke-static {v6}, Lorg/apache/http/impl/client/cache/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_0

    .line 249
    :cond_1
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v0, p2}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->makeRequestCompliant(Lorg/apache/http/client/methods/HttpRequestWrapper;)V

    .line 250
    const-string/jumbo v0, "Via"

    invoke-virtual {p2, v0, v8}, Lorg/apache/http/client/methods/HttpRequestWrapper;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    invoke-virtual {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->flushEntriesInvalidatedByRequest(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V

    .line 254
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheableRequestPolicy:Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

    invoke-virtual {v0, p2}, Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;->isServableFromCache(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 255
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Request is not servable from cache"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 256
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/http/impl/client/cache/CachingExec;->callBackend(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_0

    .line 259
    :cond_2
    invoke-direct {p0, v7, p2}, Lorg/apache/http/impl/client/cache/CachingExec;->satisfyFromCache(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v5

    .line 260
    .local v5, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-nez v5, :cond_3

    .line 261
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Cache miss"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 262
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/http/impl/client/cache/CachingExec;->handleCacheMiss(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_0

    :cond_3
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 264
    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/CachingExec;->handleCacheHit(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    goto :goto_0
.end method

.method public getCacheHits()J
    .locals 2

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCacheMisses()J
    .locals 2

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCacheUpdates()J
    .locals 2

    .prologue
    .line 211
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method getCurrentDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 545
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    return-object v0
.end method

.method handleBackendResponse(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/client/methods/CloseableHttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 8
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .param p5, "requestDate"    # Ljava/util/Date;
    .param p6, "responseDate"    # Ljava/util/Date;
    .param p7, "backendResponse"    # Lorg/apache/http/client/methods/CloseableHttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 804
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Handling Backend response"

    invoke-interface {v0, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 805
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCompliance:Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

    invoke-virtual {v0, p2, p7}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->ensureProtocolCompliance(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)V

    .line 807
    invoke-virtual {p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 808
    .local v1, "target":Lorg/apache/http/HttpHost;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCachingPolicy:Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

    invoke-virtual {v0, p2, p7}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->isResponseCacheable(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z

    move-result v6

    .line 809
    .local v6, "cacheable":Z
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v0, v1, p2, p7}, Lorg/apache/http/impl/client/cache/HttpCache;->flushInvalidatedCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V

    .line 810
    if-eqz v6, :cond_1

    invoke-direct {p0, v1, p2, p7}, Lorg/apache/http/impl/client/cache/CachingExec;->alreadyHaveNewerCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 811
    invoke-direct {p0, p2, p7}, Lorg/apache/http/impl/client/cache/CachingExec;->storeRequestIfModifiedSinceFor304Response(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V

    .line 812
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    move-object v2, p2

    move-object v3, p7

    move-object v4, p5

    move-object v5, p6

    invoke-interface/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/HttpCache;->cacheAndReturnResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/CloseableHttpResponse;Ljava/util/Date;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object p7

    .line 822
    .end local p7    # "backendResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :cond_0
    :goto_0
    return-object p7

    .line 815
    .restart local p7    # "backendResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :cond_1
    if-nez v6, :cond_0

    .line 817
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v0, v1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->flushCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 818
    :catch_0
    move-exception v7

    .line 819
    .local v7, "ioe":Ljava/io/IOException;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Unable to flush invalid cache entries"

    invoke-interface {v0, v2, v7}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method negotiateResponseFromVariants(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Ljava/util/Map;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 22
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/conn/routing/HttpRoute;",
            "Lorg/apache/http/client/methods/HttpRequestWrapper;",
            "Lorg/apache/http/client/protocol/HttpClientContext;",
            "Lorg/apache/http/client/methods/HttpExecutionAware;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/impl/client/cache/Variant;",
            ">;)",
            "Lorg/apache/http/client/methods/CloseableHttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 616
    .local p5, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v3, v0, v1}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;->buildConditionalRequestFromVariants(Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Map;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v7

    .line 619
    .local v7, "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v8

    .line 620
    .local v8, "requestDate":Ljava/util/Date;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingExec;->backend:Lorg/apache/http/impl/execchain/ClientExecChain;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-interface {v3, v0, v7, v1, v2}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v10

    .line 623
    .local v10, "backendResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v9

    .line 625
    .local v9, "responseDate":Ljava/util/Date;
    const-string/jumbo v3, "Via"

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/apache/http/impl/client/cache/CachingExec;->generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v10, v3, v4}, Lorg/apache/http/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    const/16 v4, 0x130

    if-eq v3, v4, :cond_1

    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    .line 628
    invoke-virtual/range {v3 .. v10}, Lorg/apache/http/impl/client/cache/CachingExec;->handleBackendResponse(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/client/methods/CloseableHttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    .end local v7    # "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    move-result-object v18

    .line 671
    :cond_0
    :goto_0
    return-object v18

    .line 633
    .restart local v7    # "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    :cond_1
    const-string/jumbo v3, "ETag"

    invoke-interface {v10, v3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v21

    .line 634
    .local v21, "resultEtagHeader":Lorg/apache/http/Header;
    if-nez v21, :cond_2

    .line 635
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v4, "304 response did not contain ETag"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 636
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 637
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 638
    invoke-virtual/range {p0 .. p4}, Lorg/apache/http/impl/client/cache/CachingExec;->callBackend(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v18

    goto :goto_0

    .line 641
    :cond_2
    invoke-interface/range {v21 .. v21}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v20

    .line 642
    .local v20, "resultEtag":Ljava/lang/String;
    move-object/from16 v0, p5

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/apache/http/impl/client/cache/Variant;

    .line 643
    .local v11, "matchingVariant":Lorg/apache/http/impl/client/cache/Variant;
    if-nez v11, :cond_3

    .line 644
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingExec;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v4, "304 response did not contain ETag matching one sent in If-None-Match"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 645
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 646
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 647
    invoke-virtual/range {p0 .. p4}, Lorg/apache/http/impl/client/cache/CachingExec;->callBackend(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v18

    goto :goto_0

    .line 650
    :cond_3
    invoke-virtual {v11}, Lorg/apache/http/impl/client/cache/Variant;->getEntry()Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v16

    .line 652
    .local v16, "matchedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v10, v1}, Lorg/apache/http/impl/client/cache/CachingExec;->revalidationResponseIsTooOld(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 653
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 654
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    .line 655
    invoke-direct/range {v11 .. v16}, Lorg/apache/http/impl/client/cache/CachingExec;->retryRequestUnconditionally(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    .end local v11    # "matchingVariant":Lorg/apache/http/impl/client/cache/Variant;
    move-result-object v18

    goto :goto_0

    .line 658
    .restart local v11    # "matchingVariant":Lorg/apache/http/impl/client/cache/Variant;
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CachingExec;->recordCacheUpdate(Lorg/apache/http/protocol/HttpContext;)V

    .line 660
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v6

    move-object/from16 v5, p0

    move-object/from16 v12, v16

    invoke-direct/range {v5 .. v12}, Lorg/apache/http/impl/client/cache/CachingExec;->getUpdatedVariantEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/client/methods/CloseableHttpResponse;Lorg/apache/http/impl/client/cache/Variant;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v19

    .line 663
    .local v19, "responseEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 665
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v18

    .line 666
    .local v18, "resp":Lorg/apache/http/client/methods/CloseableHttpResponse;
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v3, v1, v11}, Lorg/apache/http/impl/client/cache/CachingExec;->tryToUpdateVariantMap(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/impl/client/cache/Variant;)V

    .line 668
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/client/cache/CachingExec;->shouldSendNotModifiedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 669
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v18

    goto/16 :goto_0

    .line 672
    .end local v7    # "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    .end local v9    # "responseDate":Ljava/util/Date;
    .end local v11    # "matchingVariant":Lorg/apache/http/impl/client/cache/Variant;
    .end local v16    # "matchedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v18    # "resp":Lorg/apache/http/client/methods/CloseableHttpResponse;
    .end local v19    # "responseEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v20    # "resultEtag":Ljava/lang/String;
    .end local v21    # "resultEtagHeader":Lorg/apache/http/Header;
    :catch_0
    move-exception v17

    .line 673
    .local v17, "ex":Ljava/io/IOException;
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 674
    throw v17

    .line 675
    .end local v17    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v17

    .line 676
    .local v17, "ex":Ljava/lang/RuntimeException;
    invoke-interface {v10}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 677
    throw v17
.end method

.method revalidateCacheEntry(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 23
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/client/protocol/HttpClientContext;
    .param p4, "execAware"    # Lorg/apache/http/client/methods/HttpExecutionAware;
    .param p5, "cacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 737
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;->buildConditionalRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v13

    .line 739
    .local v13, "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v9

    .line 740
    .local v9, "requestDate":Ljava/util/Date;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->backend:Lorg/apache/http/impl/execchain/ClientExecChain;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-interface {v4, v0, v13, v1, v2}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v8

    .line 742
    .local v8, "backendResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v10

    .line 744
    .local v10, "responseDate":Ljava/util/Date;
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v8, v1}, Lorg/apache/http/impl/client/cache/CachingExec;->revalidationResponseIsTooOld(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 745
    invoke-interface {v8}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 746
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;->buildUnconditionalRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v21

    .line 748
    .local v21, "unconditional":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v9

    .line 749
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->backend:Lorg/apache/http/impl/execchain/ClientExecChain;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-interface {v4, v0, v1, v2, v3}, Lorg/apache/http/impl/execchain/ClientExecChain;->execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v8

    .line 750
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v10

    .line 753
    .end local v21    # "unconditional":Lorg/apache/http/client/methods/HttpRequestWrapper;
    :cond_0
    const-string/jumbo v4, "Via"

    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/apache/http/impl/client/cache/CachingExec;->generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v8, v4, v5}, Lorg/apache/http/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 755
    invoke-interface {v8}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v20

    .line 756
    .local v20, "statusCode":I
    const/16 v4, 0x130

    move/from16 v0, v20

    if-eq v0, v4, :cond_1

    const/16 v4, 0xc8

    move/from16 v0, v20

    if-ne v0, v4, :cond_2

    .line 757
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CachingExec;->recordCacheUpdate(Lorg/apache/http/protocol/HttpContext;)V

    .line 760
    :cond_2
    const/16 v4, 0x130

    move/from16 v0, v20

    if-ne v0, v4, :cond_4

    .line 761
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v5

    move-object/from16 v6, p2

    move-object/from16 v7, p5

    invoke-interface/range {v4 .. v10}, Lorg/apache/http/impl/client/cache/HttpCache;->updateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;Ljava/util/Date;Ljava/util/Date;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v22

    .line 764
    .local v22, "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lorg/apache/http/HttpRequest;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5}, Ljava/util/Date;-><init>()V

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v4, v0, v1, v5}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->allConditionalsMatch(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 766
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v19

    .line 783
    .end local v22    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :goto_0
    return-object v19

    .line 769
    .restart local v22    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v19

    goto :goto_0

    .line 772
    .end local v22    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_4
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CachingExec;->staleIfErrorAppliesTo(I)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingExec;->getCurrentDate()Ljava/util/Date;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2, v4}, Lorg/apache/http/impl/client/cache/CachingExec;->staleResponseNotAllowed(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v4

    if-nez v4, :cond_5

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v0, p2

    move-object/from16 v1, p5

    invoke-virtual {v4, v0, v1, v10}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mayReturnStaleIfError(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 776
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/cache/CachingExec;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, p5

    invoke-virtual {v4, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v19

    .line 777
    .local v19, "cachedResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    const-string/jumbo v4, "Warning"

    const-string/jumbo v5, "110 localhost \"Response is stale\""

    move-object/from16 v0, v19

    invoke-interface {v0, v4, v5}, Lorg/apache/http/client/methods/CloseableHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 780
    invoke-interface {v8}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    goto :goto_0

    .end local v19    # "cachedResponse":Lorg/apache/http/client/methods/CloseableHttpResponse;
    :catchall_0
    move-exception v4

    invoke-interface {v8}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    throw v4

    :cond_5
    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move-object/from16 v16, v9

    move-object/from16 v17, v10

    move-object/from16 v18, v8

    .line 783
    invoke-virtual/range {v11 .. v18}, Lorg/apache/http/impl/client/cache/CachingExec;->handleBackendResponse(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/client/methods/CloseableHttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v19

    goto :goto_0
.end method

.method public supportsRangeAndContentRangeHeaders()Z
    .locals 1

    .prologue
    .line 541
    const/4 v0, 0x0

    return v0
.end method
