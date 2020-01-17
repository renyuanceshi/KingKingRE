.class public Lorg/apache/http/impl/client/cache/CachingHttpClient;
.super Ljava/lang/Object;
.source "CachingHttpClient.java"

# interfaces
.implements Lorg/apache/http/client/HttpClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidationRequest;,
        Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# static fields
.field public static final CACHE_RESPONSE_STATUS:Ljava/lang/String; = "http.cache.response.status"

.field private static final SUPPORTS_RANGE_AND_CONTENT_RANGE_HEADERS:Z


# instance fields
.field private final asynchRevalidator:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

.field private final backend:Lorg/apache/http/client/HttpClient;

.field private final cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

.field private final cacheableRequestPolicy:Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

.field private final conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final maxObjectSizeBytes:J

.field private final requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

.field private final responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

.field private final responseCachingPolicy:Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

.field private final responseCompliance:Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

.field private final responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

.field private final sharedCache:Z

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
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 195
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v1, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    invoke-direct {v1}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>()V

    new-instance v2, Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-direct {v2}, Lorg/apache/http/impl/client/cache/CacheConfig;-><init>()V

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 198
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;)V
    .locals 2
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;

    .prologue
    .line 219
    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>()V

    new-instance v1, Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-direct {v1}, Lorg/apache/http/impl/client/cache/CacheConfig;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/http/impl/client/cache/CachingHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 222
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 2
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;
    .param p2, "storage"    # Lorg/apache/http/client/cache/HttpCacheStorage;
    .param p3, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 269
    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    new-instance v1, Lorg/apache/http/impl/client/cache/HeapResourceFactory;

    invoke-direct {v1}, Lorg/apache/http/impl/client/cache/HeapResourceFactory;-><init>()V

    invoke-direct {v0, v1, p2, p3}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    invoke-direct {p0, p1, v0, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 272
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 1
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;
    .param p2, "resourceFactory"    # Lorg/apache/http/client/cache/ResourceFactory;
    .param p3, "storage"    # Lorg/apache/http/client/cache/HttpCacheStorage;
    .param p4, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 252
    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    invoke-direct {v0, p2, p3, p4}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    invoke-direct {p0, p1, v0, p4}, Lorg/apache/http/impl/client/cache/CachingHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 255
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 1
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;
    .param p2, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 232
    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    invoke-direct {v0, p2}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 235
    return-void
.end method

.method constructor <init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/CacheValidityPolicy;Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;)V
    .locals 4
    .param p1, "backend"    # Lorg/apache/http/client/HttpClient;
    .param p2, "validityPolicy"    # Lorg/apache/http/impl/client/cache/CacheValidityPolicy;
    .param p3, "responseCachingPolicy"    # Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;
    .param p4, "responseCache"    # Lorg/apache/http/impl/client/cache/HttpCache;
    .param p5, "responseGenerator"    # Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;
    .param p6, "cacheableRequestPolicy"    # Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;
    .param p7, "suitabilityChecker"    # Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;
    .param p8, "conditionalRequestBuilder"    # Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;
    .param p9, "responseCompliance"    # Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;
    .param p10, "requestCompliance"    # Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    .prologue
    .line 284
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    new-instance v1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    .line 138
    new-instance v1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    .line 139
    new-instance v1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    .line 141
    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->viaHeaders:Ljava/util/Map;

    .line 161
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    .line 285
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheConfig;-><init>()V

    .line 286
    .local v0, "config":Lorg/apache/http/impl/client/cache/CacheConfig;
    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CacheConfig;->getMaxObjectSize()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->maxObjectSizeBytes:J

    .line 287
    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CacheConfig;->isSharedCache()Z

    move-result v1

    iput-boolean v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->sharedCache:Z

    .line 288
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    .line 289
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    .line 290
    iput-object p3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCachingPolicy:Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

    .line 291
    iput-object p4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    .line 292
    iput-object p5, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    .line 293
    iput-object p6, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheableRequestPolicy:Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

    .line 294
    iput-object p7, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    .line 295
    iput-object p8, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    .line 296
    iput-object p9, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCompliance:Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

    .line 297
    iput-object p10, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    .line 298
    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->makeAsynchronousValidator(Lorg/apache/http/impl/client/cache/CacheConfig;)Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->asynchRevalidator:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    .line 299
    return-void
.end method

.method constructor <init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 7
    .param p1, "client"    # Lorg/apache/http/client/HttpClient;
    .param p2, "cache"    # Lorg/apache/http/impl/client/cache/HttpCache;
    .param p3, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    .line 138
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    .line 139
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    .line 141
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->viaHeaders:Ljava/util/Map;

    .line 161
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    .line 168
    const-string/jumbo v0, "HttpClient"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 169
    const-string/jumbo v0, "HttpCache"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 170
    const-string/jumbo v0, "CacheConfig"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 171
    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/CacheConfig;->getMaxObjectSize()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->maxObjectSizeBytes:J

    .line 172
    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/CacheConfig;->isSharedCache()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->sharedCache:Z

    .line 173
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    .line 174
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    .line 175
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    .line 176
    new-instance v1, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

    iget-wide v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->maxObjectSizeBytes:J

    iget-boolean v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->sharedCache:Z

    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/CacheConfig;->isNeverCacheHTTP10ResponsesWithQuery()Z

    move-result v5

    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/CacheConfig;->is303CachingEnabled()Z

    move-result v6

    invoke-direct/range {v1 .. v6}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;-><init>(JZZZ)V

    iput-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCachingPolicy:Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

    .line 178
    new-instance v0, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;-><init>(Lorg/apache/http/impl/client/cache/CacheValidityPolicy;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    .line 179
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheableRequestPolicy:Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

    .line 180
    new-instance v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0, v1, p3}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;-><init>(Lorg/apache/http/impl/client/cache/CacheValidityPolicy;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    .line 181
    new-instance v0, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    .line 183
    new-instance v0, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCompliance:Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

    .line 184
    new-instance v0, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/CacheConfig;->isWeakETagOnPutDeleteAllowed()Z

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;-><init>(Z)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    .line 186
    invoke-direct {p0, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->makeAsynchronousValidator(Lorg/apache/http/impl/client/cache/CacheConfig;)Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->asynchRevalidator:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    .line 187
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 2
    .param p1, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 207
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v1, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    invoke-direct {v1, p1}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V

    invoke-direct {p0, v0, v1, p1}, Lorg/apache/http/impl/client/cache/CachingHttpClient;-><init>(Lorg/apache/http/client/HttpClient;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 210
    return-void
.end method

.method private alreadyHaveNewerCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z
    .locals 7
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "backendResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v5, 0x0

    .line 977
    const/4 v2, 0x0

    .line 979
    .local v2, "existing":Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_start_0
    iget-object v6, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v6, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->getCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 983
    :goto_0
    if-nez v2, :cond_1

    .line 1001
    :cond_0
    :goto_1
    return v5

    .line 986
    :cond_1
    const-string/jumbo v6, "Date"

    invoke-virtual {v2, v6}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 987
    .local v1, "entryDateHeader":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    .line 990
    const-string/jumbo v6, "Date"

    invoke-interface {p3, v6}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v4

    .line 991
    .local v4, "responseDateHeader":Lorg/apache/http/Header;
    if-eqz v4, :cond_0

    .line 995
    :try_start_1
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 996
    .local v0, "entryDate":Ljava/util/Date;
    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    .line 997
    .local v3, "responseDate":Ljava/util/Date;
    invoke-virtual {v3, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z
    :try_end_1
    .catch Lorg/apache/http/impl/cookie/DateParseException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v5

    goto :goto_1

    .line 998
    .end local v0    # "entryDate":Ljava/util/Date;
    .end local v3    # "responseDate":Ljava/util/Date;
    :catch_0
    move-exception v6

    goto :goto_1

    .line 980
    .end local v1    # "entryDateHeader":Lorg/apache/http/Header;
    .end local v4    # "responseDateHeader":Lorg/apache/http/Header;
    :catch_1
    move-exception v6

    goto :goto_0
.end method

.method private explicitFreshnessRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 22
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    .line 645
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

    .line 646
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

    .line 647
    .local v8, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v18, "max-stale"

    invoke-interface {v8}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 649
    :try_start_0
    invoke-interface {v8}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .line 650
    .local v16, "maxstale":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v4

    .line 651
    .local v4, "age":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v14

    .line 652
    .local v14, "lifetime":J
    sub-long v18, v4, v14

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v20, v0

    cmp-long v18, v18, v20

    if-lez v18, :cond_2

    .line 653
    const/16 v18, 0x1

    .line 664
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

    .line 655
    .restart local v7    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v8    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v9    # "h":Lorg/apache/http/Header;
    .restart local v10    # "i$":I
    .restart local v13    # "len$":I
    :catch_0
    move-exception v17

    .line 656
    .local v17, "nfe":Ljava/lang/NumberFormatException;
    const/16 v18, 0x1

    goto :goto_2

    .line 658
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

    .line 660
    :cond_1
    const/16 v18, 0x1

    goto :goto_2

    .line 646
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 645
    .end local v8    # "elt":Lorg/apache/http/HeaderElement;
    :cond_3
    add-int/lit8 v10, v11, 0x1

    move v11, v10

    .end local v10    # "i$":I
    .restart local v11    # "i$":I
    goto :goto_0

    .line 664
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
    .line 580
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v1, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->flushInvalidatedCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 584
    :goto_0
    return-void

    .line 581
    :catch_0
    move-exception v0

    .line 582
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Unable to flush invalidated entries from cache"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private generateCachedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/HttpResponse;
    .locals 6
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p4, "now"    # Ljava/util/Date;

    .prologue
    .line 589
    const-string/jumbo v1, "If-None-Match"

    invoke-virtual {p1, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "If-Modified-Since"

    invoke-virtual {p1, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 591
    :cond_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p3}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 595
    .local v0, "cachedResponse":Lorg/apache/http/HttpResponse;
    :goto_0
    sget-object v1, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_HIT:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p2, v1}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 596
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v1, p3, p4}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 597
    const-string/jumbo v1, "Warning"

    const-string/jumbo v2, "110 localhost \"Response is stale\""

    invoke-interface {v0, v1, v2}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    :cond_1
    return-object v0

    .line 593
    .end local v0    # "cachedResponse":Lorg/apache/http/HttpResponse;
    :cond_2
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p3}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .restart local v0    # "cachedResponse":Lorg/apache/http/HttpResponse;
    goto :goto_0
.end method

.method private generateGatewayTimeout(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 4
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 612
    sget-object v0, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 613
    new-instance v0, Lorg/apache/http/message/BasicHttpResponse;

    sget-object v1, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v2, 0x1f8

    const-string/jumbo v3, "Gateway Timeout"

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

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

    .line 669
    invoke-interface {p1}, Lorg/apache/http/HttpMessage;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v1

    .line 670
    .local v1, "pv":Lorg/apache/http/ProtocolVersion;
    iget-object v5, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->viaHeaders:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 671
    .local v0, "existingEntry":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 688
    .end local v0    # "existingEntry":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 675
    .restart local v0    # "existingEntry":Ljava/lang/String;
    :cond_0
    const-string/jumbo v5, "org.apache.http.client"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/apache/http/util/VersionInfo;->loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;

    move-result-object v4

    .line 676
    .local v4, "vi":Lorg/apache/http/util/VersionInfo;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lorg/apache/http/util/VersionInfo;->getRelease()Ljava/lang/String;

    move-result-object v2

    .line 679
    .local v2, "release":Ljava/lang/String;
    :goto_1
    const-string/jumbo v5, "http"

    invoke-virtual {v1}, Lorg/apache/http/ProtocolVersion;->getProtocol()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 680
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

    .line 686
    .local v3, "value":Ljava/lang/String;
    :goto_2
    iget-object v5, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->viaHeaders:Ljava/util/Map;

    invoke-interface {v5, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v3

    .line 688
    goto :goto_0

    .line 676
    .end local v2    # "release":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    :cond_1
    const-string/jumbo v2, "UNAVAILABLE"

    goto :goto_1

    .line 683
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
    .line 547
    const/4 v1, 0x0

    .line 549
    .local v1, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v2, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->getVariantCacheEntriesWithEtags(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/util/Map;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 553
    :goto_0
    return-object v1

    .line 550
    :catch_0
    move-exception v0

    .line 551
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, "Unable to retrieve variant entries from cache"

    invoke-interface {v2, v3, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private getFatallyNoncompliantResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 5
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 535
    const/4 v2, 0x0

    .line 536
    .local v2, "fatalErrorResponse":Lorg/apache/http/HttpResponse;
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v4, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->requestIsFatallyNonCompliant(Lorg/apache/http/HttpRequest;)Ljava/util/List;

    move-result-object v1

    .line 538
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

    .line 539
    .local v0, "error":Lorg/apache/http/impl/client/cache/RequestProtocolError;
    sget-object v4, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p2, v4}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 540
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v4, v0}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->getErrorForRequest(Lorg/apache/http/impl/client/cache/RequestProtocolError;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 541
    goto :goto_0

    .line 542
    .end local v0    # "error":Lorg/apache/http/impl/client/cache/RequestProtocolError;
    :cond_0
    return-object v2
.end method

.method private getUpdatedVariantEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/client/cache/Variant;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 10
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "conditionalRequest"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "requestDate"    # Ljava/util/Date;
    .param p4, "responseDate"    # Ljava/util/Date;
    .param p5, "backendResponse"    # Lorg/apache/http/HttpResponse;
    .param p6, "matchingVariant"    # Lorg/apache/http/impl/client/cache/Variant;
    .param p7, "matchedEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 839
    move-object/from16 v9, p7

    .line 841
    .local v9, "responseEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

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

    move-result-object v9

    .line 846
    :goto_0
    return-object v9

    .line 843
    :catch_0
    move-exception v8

    .line 844
    .local v8, "ioe":Ljava/io/IOException;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Could not update cache entry"

    invoke-interface {v0, v1, v8}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private handleAndConsume(Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/HttpResponse;)Ljava/lang/Object;
    .locals 6
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;",
            "Lorg/apache/http/HttpResponse;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Error;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 379
    .local p1, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    :try_start_0
    invoke-interface {p1, p2}, Lorg/apache/http/client/ResponseHandler;->handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 400
    .local v1, "result":Ljava/lang/Object;, "TT;"
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 401
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v0}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 402
    return-object v1

    .line 380
    .end local v0    # "entity":Lorg/apache/http/HttpEntity;
    .end local v1    # "result":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v2

    .line 381
    .local v2, "t":Ljava/lang/Exception;
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 383
    .restart local v0    # "entity":Lorg/apache/http/HttpEntity;
    :try_start_1
    invoke-static {v0}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 389
    :goto_0
    instance-of v4, v2, Ljava/lang/RuntimeException;

    if-eqz v4, :cond_0

    .line 390
    check-cast v2, Ljava/lang/RuntimeException;

    .end local v2    # "t":Ljava/lang/Exception;
    throw v2

    .line 384
    .restart local v2    # "t":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 387
    .local v3, "t2":Ljava/lang/Exception;
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Error consuming content after an exception."

    invoke-interface {v4, v5, v3}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 392
    .end local v3    # "t2":Ljava/lang/Exception;
    :cond_0
    instance-of v4, v2, Ljava/io/IOException;

    if-eqz v4, :cond_1

    .line 393
    check-cast v2, Ljava/io/IOException;

    .end local v2    # "t":Ljava/lang/Exception;
    throw v2

    .line 395
    .restart local v2    # "t":Ljava/lang/Exception;
    :cond_1
    new-instance v4, Ljava/lang/reflect/UndeclaredThrowableException;

    invoke-direct {v4, v2}, Ljava/lang/reflect/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method private handleCacheHit(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;
    .locals 7
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p4, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 460
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->recordCacheHit(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V

    .line 461
    const/4 v6, 0x0

    .line 462
    .local v6, "out":Lorg/apache/http/HttpResponse;
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v5

    .line 463
    .local v5, "now":Ljava/util/Date;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    invoke-virtual {v0, p1, p2, p4, v5}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->canCachedResponseBeUsed(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 464
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Cache hit"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 465
    invoke-direct {p0, p2, p3, p4, v5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->generateCachedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 473
    :goto_0
    if-eqz p3, :cond_0

    .line 474
    const-string/jumbo v0, "http.target_host"

    invoke-interface {p3, v0, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 475
    const-string/jumbo v0, "http.request"

    invoke-interface {p3, v0, p2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 476
    const-string/jumbo v0, "http.response"

    invoke-interface {p3, v0, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 477
    const-string/jumbo v0, "http.request_sent"

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p3, v0, v1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    move-object v0, v6

    .line 479
    :goto_1
    return-object v0

    .line 466
    :cond_1
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->mayCallBackend(Lorg/apache/http/client/methods/HttpRequestWrapper;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 467
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Cache entry not suitable but only-if-cached requested"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 468
    invoke-direct {p0, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->generateGatewayTimeout(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    goto :goto_0

    .line 470
    :cond_2
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Revalidating cache entry"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 471
    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->revalidateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    goto :goto_1
.end method

.method private handleCacheMiss(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 5
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 507
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->recordCacheMiss(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V

    .line 509
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->mayCallBackend(Lorg/apache/http/client/methods/HttpRequestWrapper;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 510
    new-instance v1, Lorg/apache/http/message/BasicHttpResponse;

    sget-object v2, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v3, 0x1f8

    const-string/jumbo v4, "Gateway Timeout"

    invoke-direct {v1, v2, v3, v4}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 520
    :goto_0
    return-object v1

    .line 514
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getExistingCacheVariants(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)Ljava/util/Map;

    move-result-object v0

    .line 516
    .local v0, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 517
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->negotiateResponseFromVariants(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Ljava/util/Map;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    goto :goto_0

    .line 520
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->callBackend(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    goto :goto_0
.end method

.method private handleRevalidationFailure(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/HttpResponse;
    .locals 1
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p4, "now"    # Ljava/util/Date;

    .prologue
    .line 604
    invoke-direct {p0, p1, p3, p4}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->staleResponseNotAllowed(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 605
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->generateGatewayTimeout(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 607
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, p2, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->unvalidatedCacheHit(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    goto :goto_0
.end method

.method private makeAsynchronousValidator(Lorg/apache/http/impl/client/cache/CacheConfig;)Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;
    .locals 1
    .param p1, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 303
    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkersMax()I

    move-result v0

    if-lez v0, :cond_0

    .line 304
    new-instance v0, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    invoke-direct {v0, p0, p1}, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;-><init>(Lorg/apache/http/impl/client/cache/CachingHttpClient;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 306
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private mayCallBackend(Lorg/apache/http/client/methods/HttpRequestWrapper;)Z
    .locals 10
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;

    .prologue
    .line 633
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

    .line 634
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

    .line 635
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v8, "only-if-cached"

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 636
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v9, "Request marked only-if-cached"

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 637
    const/4 v8, 0x0

    .line 641
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v4    # "i$":I
    .end local v7    # "len$":I
    :goto_2
    return v8

    .line 634
    .restart local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v2    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v3    # "h":Lorg/apache/http/Header;
    .restart local v4    # "i$":I
    .restart local v7    # "len$":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 633
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    :cond_1
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_0

    .line 641
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
    .line 565
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 566
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 567
    invoke-virtual {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    .line 568
    .local v0, "rl":Lorg/apache/http/RequestLine;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

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

    .line 570
    .end local v0    # "rl":Lorg/apache/http/RequestLine;
    :cond_0
    return-void
.end method

.method private recordCacheMiss(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V
    .locals 4
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;

    .prologue
    .line 557
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 558
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 559
    invoke-virtual {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    .line 560
    .local v0, "rl":Lorg/apache/http/RequestLine;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

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

    .line 562
    .end local v0    # "rl":Lorg/apache/http/RequestLine;
    :cond_0
    return-void
.end method

.method private recordCacheUpdate(Lorg/apache/http/protocol/HttpContext;)V
    .locals 1
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 573
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->getAndIncrement()J

    .line 574
    sget-object v0, Lorg/apache/http/client/cache/CacheResponseStatus;->VALIDATED:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 575
    return-void
.end method

.method private retryRequestUnconditionally(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;
    .locals 2
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p4, "matchedEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 830
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    invoke-virtual {v1, p2, p4}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;->buildUnconditionalRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v0

    .line 832
    .local v0, "unconditional":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual {p0, p1, v0, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->callBackend(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method private revalidateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/HttpResponse;
    .locals 5
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p4, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p5, "now"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 487
    :try_start_0
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->asynchRevalidator:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    if-eqz v3, :cond_0

    invoke-direct {p0, p2, p4, p5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->staleResponseNotAllowed(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v3, p4, p5}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mayReturnStaleWhileRevalidating(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 490
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v4, "Serving stale with asynchronous revalidation"

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 491
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->generateCachedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 493
    .local v2, "resp":Lorg/apache/http/HttpResponse;
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->asynchRevalidator:Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;

    invoke-virtual {v3, p1, p2, p3, p4}, Lorg/apache/http/impl/client/cache/CachingHttpClient$AsynchronousValidator;->revalidateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 499
    .end local v2    # "resp":Lorg/apache/http/HttpResponse;
    :goto_0
    return-object v2

    .line 497
    :cond_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->revalidateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/ProtocolException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    goto :goto_0

    .line 498
    :catch_0
    move-exception v1

    .line 499
    .local v1, "ioex":Ljava/io/IOException;
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->handleRevalidationFailure(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    goto :goto_0

    .line 500
    .end local v1    # "ioex":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 501
    .local v0, "e":Lorg/apache/http/ProtocolException;
    new-instance v3, Lorg/apache/http/client/ClientProtocolException;

    invoke-direct {v3, v0}, Lorg/apache/http/client/ClientProtocolException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private revalidationResponseIsTooOld(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 5
    .param p1, "backendResponse"    # Lorg/apache/http/HttpResponse;
    .param p2, "cacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 755
    const-string/jumbo v4, "Date"

    invoke-virtual {p2, v4}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 756
    .local v1, "entryDateHeader":Lorg/apache/http/Header;
    const-string/jumbo v4, "Date"

    invoke-interface {p1, v4}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    .line 757
    .local v3, "responseDateHeader":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    if-eqz v3, :cond_0

    .line 759
    :try_start_0
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 760
    .local v0, "entryDate":Ljava/util/Date;
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 761
    .local v2, "respDate":Ljava/util/Date;
    invoke-virtual {v2, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z
    :try_end_0
    .catch Lorg/apache/http/impl/cookie/DateParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    .line 762
    const/4 v4, 0x1

    .line 771
    .end local v0    # "entryDate":Ljava/util/Date;
    .end local v2    # "respDate":Ljava/util/Date;
    :goto_0
    return v4

    .line 764
    :catch_0
    move-exception v4

    .line 771
    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private satisfyFromCache(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 4
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;

    .prologue
    .line 524
    const/4 v0, 0x0

    .line 526
    .local v0, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v2, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->getCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 530
    :goto_0
    return-object v0

    .line 527
    :catch_0
    move-exception v1

    .line 528
    .local v1, "ioe":Ljava/io/IOException;
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, "Unable to retrieve entries from cache"

    invoke-interface {v2, v3, v1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V
    .locals 1
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p2, "value"    # Lorg/apache/http/client/cache/CacheResponseStatus;

    .prologue
    .line 692
    if-eqz p1, :cond_0

    .line 693
    const-string/jumbo v0, "http.cache.response.status"

    invoke-interface {p1, v0, p2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 695
    :cond_0
    return-void
.end method

.method private shouldSendNotModifiedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 2
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "responseEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 860
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

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
    .line 919
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
    .line 627
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mustRevalidate(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->isSharedCache()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->proxyRevalidate(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->explicitFreshnessRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

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
    .line 967
    invoke-interface {p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0x130

    if-ne v1, v2, :cond_0

    .line 968
    const-string/jumbo v1, "If-Modified-Since"

    invoke-interface {p1, v1}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 969
    .local v0, "h":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    .line 970
    const-string/jumbo v1, "Last-Modified"

    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v1, v2}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 973
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
    .line 852
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v1, p1, p2, p3}, Lorg/apache/http/impl/client/cache/HttpCache;->reuseVariantEntryFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/impl/client/cache/Variant;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 856
    :goto_0
    return-void

    .line 853
    :catch_0
    move-exception v0

    .line 854
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Could not update cache entry to reuse variant"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private unvalidatedCacheHit(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;
    .locals 3
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 619
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, p2}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    .line 620
    .local v0, "cachedResponse":Lorg/apache/http/HttpResponse;
    sget-object v1, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_HIT:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p1, v1}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 621
    const-string/jumbo v1, "Warning"

    const-string/jumbo v2, "111 localhost \"Revalidation failed\""

    invoke-interface {v0, v1, v2}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 622
    return-object v0
.end method


# virtual methods
.method callBackend(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 6
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 743
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v3

    .line 745
    .local v3, "requestDate":Ljava/util/Date;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Calling the backend"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 746
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 747
    .local v5, "backendResponse":Lorg/apache/http/HttpResponse;
    const-string/jumbo v0, "Via"

    invoke-direct {p0, v5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v5, v0, v1}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 748
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->handleBackendResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method clientRequestsOurOptions(Lorg/apache/http/HttpRequest;)Z
    .locals 4
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    const/4 v1, 0x0

    .line 723
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    .line 725
    .local v0, "line":Lorg/apache/http/RequestLine;
    const-string/jumbo v2, "OPTIONS"

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 737
    :cond_0
    :goto_0
    return v1

    .line 729
    :cond_1
    const-string/jumbo v2, "*"

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 733
    const-string/jumbo v2, "0"

    const-string/jumbo v3, "Max-Forwards"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 737
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .locals 1
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    .local p3, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .locals 2
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p4, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    .local p3, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1, p2, p4}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 349
    .local v0, "resp":Lorg/apache/http/HttpResponse;
    invoke-direct {p0, p3, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->handleAndConsume(Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/HttpResponse;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;
    .locals 1
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    .local p2, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;
    .locals 2
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Lorg/apache/http/client/ResponseHandler",
            "<+TT;>;",
            "Lorg/apache/http/protocol/HttpContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 370
    .local p2, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<+TT;>;"
    invoke-virtual {p0, p1, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 371
    .local v0, "resp":Lorg/apache/http/HttpResponse;
    invoke-direct {p0, p2, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->handleAndConsume(Lorg/apache/http/client/ResponseHandler;Lorg/apache/http/HttpResponse;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/HttpResponse;
    .locals 2
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    const/4 v0, 0x0

    .line 338
    .local v0, "defaultContext":Lorg/apache/http/protocol/HttpContext;
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 6
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "originalRequest"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 417
    instance-of v4, p2, Lorg/apache/http/client/methods/HttpRequestWrapper;

    if-eqz v4, :cond_1

    move-object v2, p2

    .line 418
    check-cast v2, Lorg/apache/http/client/methods/HttpRequestWrapper;

    .line 422
    .local v2, "request":Lorg/apache/http/client/methods/HttpRequestWrapper;
    :goto_0
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;

    move-result-object v3

    .line 425
    .local v3, "via":Ljava/lang/String;
    sget-object v4, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_MISS:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p3, v4}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 427
    invoke-virtual {p0, v2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->clientRequestsOurOptions(Lorg/apache/http/HttpRequest;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 428
    sget-object v4, Lorg/apache/http/client/cache/CacheResponseStatus;->CACHE_MODULE_RESPONSE:Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-direct {p0, p3, v4}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->setResponseStatus(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/CacheResponseStatus;)V

    .line 429
    new-instance v1, Lorg/apache/http/impl/client/cache/OptionsHttp11Response;

    invoke-direct {v1}, Lorg/apache/http/impl/client/cache/OptionsHttp11Response;-><init>()V

    .line 454
    :cond_0
    :goto_1
    return-object v1

    .line 420
    .end local v2    # "request":Lorg/apache/http/client/methods/HttpRequestWrapper;
    .end local v3    # "via":Ljava/lang/String;
    :cond_1
    invoke-static {p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->wrap(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v2

    .restart local v2    # "request":Lorg/apache/http/client/methods/HttpRequestWrapper;
    goto :goto_0

    .line 432
    .restart local v3    # "via":Ljava/lang/String;
    :cond_2
    invoke-direct {p0, v2, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getFatallyNoncompliantResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 434
    .local v1, "fatalErrorResponse":Lorg/apache/http/HttpResponse;
    if-nez v1, :cond_0

    .line 438
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->requestCompliance:Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;

    invoke-virtual {v4, v2}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->makeRequestCompliant(Lorg/apache/http/client/methods/HttpRequestWrapper;)V

    .line 439
    const-string/jumbo v4, "Via"

    invoke-virtual {v2, v4, v3}, Lorg/apache/http/client/methods/HttpRequestWrapper;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    invoke-direct {p0, p1, v2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->flushEntriesInvalidatedByRequest(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)V

    .line 443
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheableRequestPolicy:Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;

    invoke-virtual {v4, v2}, Lorg/apache/http/impl/client/cache/CacheableRequestPolicy;->isServableFromCache(Lorg/apache/http/HttpRequest;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 444
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Request is not servable from cache"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 445
    invoke-virtual {p0, p1, v2, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->callBackend(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    goto :goto_1

    .line 448
    :cond_3
    invoke-direct {p0, p1, v2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->satisfyFromCache(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v0

    .line 449
    .local v0, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-nez v0, :cond_4

    .line 450
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Cache miss"

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 451
    invoke-direct {p0, p1, v2, p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->handleCacheMiss(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    goto :goto_1

    .line 454
    :cond_4
    invoke-direct {p0, p1, v2, p3, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->handleCacheHit(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    goto :goto_1
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    .locals 2
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    const/4 v0, 0x0

    .line 354
    .local v0, "context":Lorg/apache/http/protocol/HttpContext;
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    return-object v1
.end method

.method public execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 5
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    invoke-interface {p1}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v1

    .line 359
    .local v1, "uri":Ljava/net/URI;
    new-instance v0, Lorg/apache/http/HttpHost;

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ljava/net/URI;->getPort()I

    move-result v3

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v2, v3, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 360
    .local v0, "httpHost":Lorg/apache/http/HttpHost;
    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    return-object v2
.end method

.method public getCacheHits()J
    .locals 2

    .prologue
    .line 315
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheHits:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCacheMisses()J
    .locals 2

    .prologue
    .line 324
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheMisses:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCacheUpdates()J
    .locals 2

    .prologue
    .line 333
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->cacheUpdates:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    return-wide v0
.end method

.method public getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;
    .locals 1

    .prologue
    .line 406
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    return-object v0
.end method

.method getCurrentDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 719
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    return-object v0
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .locals 1

    .prologue
    .line 410
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    return-object v0
.end method

.method handleBackendResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;)Lorg/apache/http/HttpResponse;
    .locals 8
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "requestDate"    # Ljava/util/Date;
    .param p4, "responseDate"    # Ljava/util/Date;
    .param p5, "backendResponse"    # Lorg/apache/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 932
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Handling Backend response"

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 933
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCompliance:Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;

    invoke-virtual {v0, p2, p5}, Lorg/apache/http/impl/client/cache/ResponseProtocolCompliance;->ensureProtocolCompliance(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/HttpResponse;)V

    .line 935
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCachingPolicy:Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;

    invoke-virtual {v0, p2, p5}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->isResponseCacheable(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z

    move-result v6

    .line 936
    .local v6, "cacheable":Z
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v0, p1, p2, p5}, Lorg/apache/http/impl/client/cache/HttpCache;->flushInvalidatedCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V

    .line 937
    if-eqz v6, :cond_1

    invoke-direct {p0, p1, p2, p5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->alreadyHaveNewerCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 940
    :try_start_0
    invoke-direct {p0, p2, p5}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->storeRequestIfModifiedSinceFor304Response(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V

    .line 941
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p5

    move-object v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/HttpCache;->cacheAndReturnResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Ljava/util/Date;Ljava/util/Date;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p5

    .line 954
    .end local p5    # "backendResponse":Lorg/apache/http/HttpResponse;
    :cond_0
    :goto_0
    return-object p5

    .line 943
    .restart local p5    # "backendResponse":Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v7

    .line 944
    .local v7, "ioe":Ljava/io/IOException;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Unable to store entries in cache"

    invoke-interface {v0, v1, v7}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 947
    .end local v7    # "ioe":Ljava/io/IOException;
    :cond_1
    if-nez v6, :cond_0

    .line 949
    :try_start_1
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    invoke-interface {v0, p1, p2}, Lorg/apache/http/impl/client/cache/HttpCache;->flushCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 950
    :catch_1
    move-exception v7

    .line 951
    .restart local v7    # "ioe":Ljava/io/IOException;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v1, "Unable to flush invalid cache entries"

    invoke-interface {v0, v1, v7}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public isSharedCache()Z
    .locals 1

    .prologue
    .line 715
    iget-boolean v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->sharedCache:Z

    return v0
.end method

.method negotiateResponseFromVariants(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Ljava/util/Map;)Lorg/apache/http/HttpResponse;
    .locals 13
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/client/methods/HttpRequestWrapper;",
            "Lorg/apache/http/protocol/HttpContext;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/impl/client/cache/Variant;",
            ">;)",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 777
    .local p4, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    move-object/from16 v0, p4

    invoke-virtual {v1, p2, v0}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;->buildConditionalRequestFromVariants(Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Map;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v3

    .line 780
    .local v3, "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v4

    .line 781
    .local v4, "requestDate":Ljava/util/Date;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    move-object/from16 v0, p3

    invoke-interface {v1, p1, v3, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 782
    .local v6, "backendResponse":Lorg/apache/http/HttpResponse;
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v5

    .line 784
    .local v5, "responseDate":Ljava/util/Date;
    const-string/jumbo v1, "Via"

    invoke-direct {p0, v6}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v6, v1, v2}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 786
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0x130

    if-eq v1, v2, :cond_1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    .line 787
    invoke-virtual/range {v1 .. v6}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->handleBackendResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;)Lorg/apache/http/HttpResponse;

    .end local v3    # "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    move-result-object v9

    .line 824
    :cond_0
    :goto_0
    return-object v9

    .line 790
    .restart local v3    # "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    :cond_1
    const-string/jumbo v1, "ETag"

    invoke-interface {v6, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v12

    .line 791
    .local v12, "resultEtagHeader":Lorg/apache/http/Header;
    if-nez v12, :cond_2

    .line 792
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "304 response did not contain ETag"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 793
    invoke-virtual/range {p0 .. p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->callBackend(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    goto :goto_0

    .line 796
    :cond_2
    invoke-interface {v12}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v11

    .line 797
    .local v11, "resultEtag":Ljava/lang/String;
    move-object/from16 v0, p4

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/http/impl/client/cache/Variant;

    .line 798
    .local v7, "matchingVariant":Lorg/apache/http/impl/client/cache/Variant;
    if-nez v7, :cond_3

    .line 799
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "304 response did not contain ETag matching one sent in If-None-Match"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 800
    invoke-virtual/range {p0 .. p3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->callBackend(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    goto :goto_0

    .line 803
    :cond_3
    invoke-virtual {v7}, Lorg/apache/http/impl/client/cache/Variant;->getEntry()Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v8

    .line 805
    .local v8, "matchedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    invoke-direct {p0, v6, v8}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->revalidationResponseIsTooOld(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 806
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 807
    move-object/from16 v0, p3

    invoke-direct {p0, p1, p2, v0, v8}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->retryRequestUnconditionally(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;

    move-result-object v9

    goto :goto_0

    .line 811
    :cond_4
    move-object/from16 v0, p3

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->recordCacheUpdate(Lorg/apache/http/protocol/HttpContext;)V

    move-object v1, p0

    move-object v2, p1

    .line 813
    invoke-direct/range {v1 .. v8}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getUpdatedVariantEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/client/cache/Variant;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v10

    .line 817
    .local v10, "responseEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, v10}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v9

    .line 818
    .local v9, "resp":Lorg/apache/http/HttpResponse;
    invoke-direct {p0, p1, p2, v7}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->tryToUpdateVariantMap(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/impl/client/cache/Variant;)V

    .line 820
    invoke-direct {p0, p2, v10}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->shouldSendNotModifiedResponse(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 821
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, v10}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v9

    goto :goto_0
.end method

.method revalidateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/HttpResponse;
    .locals 21
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .param p4, "cacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 870
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-virtual {v3, v0, v1}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;->buildConditionalRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v12

    .line 872
    .local v12, "conditionalRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v8

    .line 873
    .local v8, "requestDate":Ljava/util/Date;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-interface {v3, v0, v12, v1}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 874
    .local v7, "backendResponse":Lorg/apache/http/HttpResponse;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v9

    .line 876
    .local v9, "responseDate":Ljava/util/Date;
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v7, v1}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->revalidationResponseIsTooOld(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 877
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 878
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->conditionalRequestBuilder:Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;

    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-virtual {v3, v0, v1}, Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;->buildUnconditionalRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v19

    .line 880
    .local v19, "unconditional":Lorg/apache/http/HttpRequest;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v8

    .line 881
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->backend:Lorg/apache/http/client/HttpClient;

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, p3

    invoke-interface {v3, v0, v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 882
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v9

    .line 885
    .end local v19    # "unconditional":Lorg/apache/http/HttpRequest;
    :cond_0
    const-string/jumbo v3, "Via"

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->generateViaHeader(Lorg/apache/http/HttpMessage;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v7, v3, v4}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 887
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v18

    .line 888
    .local v18, "statusCode":I
    const/16 v3, 0x130

    move/from16 v0, v18

    if-eq v0, v3, :cond_1

    const/16 v3, 0xc8

    move/from16 v0, v18

    if-ne v0, v3, :cond_2

    .line 889
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->recordCacheUpdate(Lorg/apache/http/protocol/HttpContext;)V

    .line 892
    :cond_2
    const/16 v3, 0x130

    move/from16 v0, v18

    if-ne v0, v3, :cond_5

    .line 893
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseCache:Lorg/apache/http/impl/client/cache/HttpCache;

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p4

    invoke-interface/range {v3 .. v9}, Lorg/apache/http/impl/client/cache/HttpCache;->updateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;Ljava/util/Date;Ljava/util/Date;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v20

    .line 895
    .local v20, "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lorg/apache/http/HttpRequest;)Z

    move-result v3

    if-eqz v3, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->suitabilityChecker:Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v3, v0, v1, v4}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->allConditionalsMatch(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 897
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateNotModifiedResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v16

    .line 914
    .end local v20    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_3
    :goto_0
    return-object v16

    .line 899
    .restart local v20    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v16

    goto :goto_0

    .line 902
    .end local v20    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_5
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->staleIfErrorAppliesTo(I)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->getCurrentDate()Ljava/util/Date;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->staleResponseNotAllowed(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v3

    if-nez v3, :cond_6

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->validityPolicy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-virtual {v3, v0, v1, v9}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mayReturnStaleIfError(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 905
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/impl/client/cache/CachingHttpClient;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    move-object/from16 v0, p4

    invoke-virtual {v3, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v16

    .line 906
    .local v16, "cachedResponse":Lorg/apache/http/HttpResponse;
    const-string/jumbo v3, "Warning"

    const-string/jumbo v4, "110 localhost \"Response is stale\""

    move-object/from16 v0, v16

    invoke-interface {v0, v3, v4}, Lorg/apache/http/HttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 907
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v17

    .line 908
    .local v17, "errorBody":Lorg/apache/http/HttpEntity;
    if-eqz v17, :cond_3

    .line 909
    invoke-static/range {v17 .. v17}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    goto :goto_0

    .end local v16    # "cachedResponse":Lorg/apache/http/HttpResponse;
    .end local v17    # "errorBody":Lorg/apache/http/HttpEntity;
    :cond_6
    move-object/from16 v10, p0

    move-object/from16 v11, p1

    move-object v13, v8

    move-object v14, v9

    move-object v15, v7

    .line 914
    invoke-virtual/range {v10 .. v15}, Lorg/apache/http/impl/client/cache/CachingHttpClient;->handleBackendResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;)Lorg/apache/http/HttpResponse;

    move-result-object v16

    goto :goto_0
.end method

.method public supportsRangeAndContentRangeHeaders()Z
    .locals 1

    .prologue
    .line 704
    const/4 v0, 0x0

    return v0
.end method
