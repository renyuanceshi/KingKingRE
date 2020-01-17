.class Lorg/apache/http/impl/client/cache/BasicHttpCache;
.super Ljava/lang/Object;
.source "BasicHttpCache.java"

# interfaces
.implements Lorg/apache/http/impl/client/cache/HttpCache;


# static fields
.field private static final safeRequestMethods:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final cacheEntryUpdater:Lorg/apache/http/impl/client/cache/CacheEntryUpdater;

.field private final cacheInvalidator:Lorg/apache/http/client/cache/HttpCacheInvalidator;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final maxObjectSizeBytes:J

.field private final resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

.field private final responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

.field private final storage:Lorg/apache/http/client/cache/HttpCacheStorage;

.field private final uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 59
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "HEAD"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "GET"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "OPTIONS"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "TRACE"

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->safeRequestMethods:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 110
    sget-object v0, Lorg/apache/http/impl/client/cache/CacheConfig;->DEFAULT:Lorg/apache/http/impl/client/cache/CacheConfig;

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 1
    .param p1, "resourceFactory"    # Lorg/apache/http/client/cache/ResourceFactory;
    .param p2, "storage"    # Lorg/apache/http/client/cache/HttpCacheStorage;
    .param p3, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 102
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;-><init>()V

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/CacheKeyGenerator;)V

    .line 103
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/CacheKeyGenerator;)V
    .locals 6
    .param p1, "resourceFactory"    # Lorg/apache/http/client/cache/ResourceFactory;
    .param p2, "storage"    # Lorg/apache/http/client/cache/HttpCacheStorage;
    .param p3, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;
    .param p4, "uriExtractor"    # Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    .prologue
    .line 94
    new-instance v5, Lorg/apache/http/impl/client/cache/CacheInvalidator;

    invoke-direct {v5, p4, p2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;-><init>(Lorg/apache/http/impl/client/cache/CacheKeyGenerator;Lorg/apache/http/client/cache/HttpCacheStorage;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/CacheKeyGenerator;Lorg/apache/http/client/cache/HttpCacheInvalidator;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/CacheKeyGenerator;Lorg/apache/http/client/cache/HttpCacheInvalidator;)V
    .locals 2
    .param p1, "resourceFactory"    # Lorg/apache/http/client/cache/ResourceFactory;
    .param p2, "storage"    # Lorg/apache/http/client/cache/HttpCacheStorage;
    .param p3, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;
    .param p4, "uriExtractor"    # Lorg/apache/http/impl/client/cache/CacheKeyGenerator;
    .param p5, "cacheInvalidator"    # Lorg/apache/http/client/cache/HttpCacheInvalidator;

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->log:Lorg/apache/commons/logging/Log;

    .line 80
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    .line 81
    iput-object p4, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    .line 82
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;-><init>(Lorg/apache/http/client/cache/ResourceFactory;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->cacheEntryUpdater:Lorg/apache/http/impl/client/cache/CacheEntryUpdater;

    .line 83
    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/CacheConfig;->getMaxObjectSize()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->maxObjectSizeBytes:J

    .line 84
    new-instance v0, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    .line 85
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    .line 86
    iput-object p5, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->cacheInvalidator:Lorg/apache/http/client/cache/HttpCacheInvalidator;

    .line 87
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 2
    .param p1, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 106
    new-instance v0, Lorg/apache/http/impl/client/cache/HeapResourceFactory;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/HeapResourceFactory;-><init>()V

    new-instance v1, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;

    invoke-direct {v1, p1}, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V

    invoke-direct {p0, v0, v1, p1}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 107
    return-void
.end method

.method static synthetic access$000(Lorg/apache/http/impl/client/cache/BasicHttpCache;)Lorg/apache/http/impl/client/cache/CacheKeyGenerator;
    .locals 1
    .param p0, "x0"    # Lorg/apache/http/impl/client/cache/BasicHttpCache;

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    return-object v0
.end method

.method private addVariantWithEtag(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .param p1, "variantKey"    # Ljava/lang/String;
    .param p2, "variantCacheKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/impl/client/cache/Variant;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    .local p3, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v2, p2}, Lorg/apache/http/client/cache/HttpCacheStorage;->getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v0

    .line 366
    .local v0, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-nez v0, :cond_1

    .line 374
    :cond_0
    :goto_0
    return-void

    .line 369
    :cond_1
    const-string/jumbo v2, "ETag"

    invoke-virtual {v0, v2}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 370
    .local v1, "etagHeader":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    .line 373
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/apache/http/impl/client/cache/Variant;

    invoke-direct {v3, p1, p2, v0}, Lorg/apache/http/impl/client/cache/Variant;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    invoke-interface {p3, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public cacheAndReturnResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Ljava/util/Date;Ljava/util/Date;)Lorg/apache/http/HttpResponse;
    .locals 6
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "originResponse"    # Lorg/apache/http/HttpResponse;
    .param p4, "requestSent"    # Ljava/util/Date;
    .param p5, "responseReceived"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 279
    invoke-static {p3}, Lorg/apache/http/impl/client/cache/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->cacheAndReturnResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/CloseableHttpResponse;Ljava/util/Date;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public cacheAndReturnResponse(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/CloseableHttpResponse;Ljava/util/Date;Ljava/util/Date;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 8
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "originResponse"    # Lorg/apache/http/client/methods/CloseableHttpResponse;
    .param p4, "requestSent"    # Ljava/util/Date;
    .param p5, "responseReceived"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 291
    const/4 v6, 0x1

    .line 292
    .local v6, "closeOriginResponse":Z
    invoke-virtual {p0, p2, p3}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->getResponseReader(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/CloseableHttpResponse;)Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;

    move-result-object v7

    .line 294
    .local v7, "responseReader":Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;
    :try_start_0
    invoke-virtual {v7}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->readResponse()V

    .line 296
    invoke-virtual {v7}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->isLimitReached()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 297
    const/4 v6, 0x0

    .line 298
    invoke-virtual {v7}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->getReconstructedResponse()Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 315
    if-eqz v6, :cond_0

    .line 316
    invoke-interface {p3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    :cond_0
    :goto_0
    return-object v1

    .line 301
    :cond_1
    :try_start_1
    invoke-virtual {v7}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v5

    .line 302
    .local v5, "resource":Lorg/apache/http/client/cache/Resource;
    invoke-virtual {p0, p3, v5}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->isIncompleteResponse(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/Resource;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 303
    invoke-virtual {p0, p3, v5}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->generateIncompleteResponseError(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/Resource;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 315
    if-eqz v6, :cond_0

    .line 316
    invoke-interface {p3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    goto :goto_0

    .line 306
    :cond_2
    :try_start_2
    new-instance v0, Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-interface {p3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-interface {p3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v4

    move-object v1, p4

    move-object v2, p5

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/client/cache/HttpCacheEntry;-><init>(Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/StatusLine;[Lorg/apache/http/Header;Lorg/apache/http/client/cache/Resource;)V

    .line 312
    .local v0, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storeInCache(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 313
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->responseGenerator:Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;

    invoke-virtual {v1, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v1

    .line 315
    if-eqz v6, :cond_0

    .line 316
    invoke-interface {p3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    goto :goto_0

    .line 315
    .end local v0    # "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v5    # "resource":Lorg/apache/http/client/cache/Resource;
    :catchall_0
    move-exception v1

    if-eqz v6, :cond_3

    .line 316
    invoke-interface {p3}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    :cond_3
    throw v1
.end method

.method doGetUpdatedParentEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 8
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "existing"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p4, "variantKey"    # Ljava/lang/String;
    .param p5, "variantCacheKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    move-object v7, p2

    .line 231
    .local v7, "src":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-nez v7, :cond_0

    .line 232
    move-object v7, p3

    .line 235
    :cond_0
    const/4 v5, 0x0

    .line 236
    .local v5, "resource":Lorg/apache/http/client/cache/Resource;
    invoke-virtual {v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 237
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    invoke-virtual {v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lorg/apache/http/client/cache/ResourceFactory;->copy(Ljava/lang/String;Lorg/apache/http/client/cache/Resource;)Lorg/apache/http/client/cache/Resource;

    move-result-object v5

    .line 239
    :cond_1
    new-instance v6, Ljava/util/HashMap;

    invoke-virtual {v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getVariantMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {v6, v0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 240
    .local v6, "variantMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v6, p4, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    new-instance v0, Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-virtual {v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getRequestDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResponseDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-virtual {v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v4

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/client/cache/HttpCacheEntry;-><init>(Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/StatusLine;[Lorg/apache/http/Header;Lorg/apache/http/client/cache/Resource;Ljava/util/Map;)V

    return-object v0
.end method

.method public flushCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)V
    .locals 3
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    sget-object v1, Lorg/apache/http/impl/client/cache/BasicHttpCache;->safeRequestMethods:Ljava/util/Set;

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 116
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v1, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "uri":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v1, v0}, Lorg/apache/http/client/cache/HttpCacheStorage;->removeEntry(Ljava/lang/String;)V

    .line 119
    .end local v0    # "uri":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public flushInvalidatedCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)V
    .locals 1
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 344
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->cacheInvalidator:Lorg/apache/http/client/cache/HttpCacheInvalidator;

    invoke-interface {v0, p1, p2}, Lorg/apache/http/client/cache/HttpCacheInvalidator;->flushInvalidatedCacheEntries(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)V

    .line 345
    return-void
.end method

.method public flushInvalidatedCacheEntriesFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V
    .locals 2
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 122
    sget-object v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->safeRequestMethods:Ljava/util/Set;

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 123
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->cacheInvalidator:Lorg/apache/http/client/cache/HttpCacheInvalidator;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/client/cache/HttpCacheInvalidator;->flushInvalidatedCacheEntries(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V

    .line 125
    :cond_0
    return-void
.end method

.method generateIncompleteResponseError(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/Resource;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 10
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "resource"    # Lorg/apache/http/client/cache/Resource;

    .prologue
    .line 211
    const-string/jumbo v4, "Content-Length"

    invoke-interface {p1, v4}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 212
    .local v0, "contentLength":I
    new-instance v1, Lorg/apache/http/message/BasicHttpResponse;

    sget-object v4, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v5, 0x1f6

    const-string/jumbo v6, "Bad Gateway"

    invoke-direct {v1, v4, v5, v6}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 214
    .local v1, "error":Lorg/apache/http/HttpResponse;
    const-string/jumbo v4, "Content-Type"

    const-string/jumbo v5, "text/plain;charset=UTF-8"

    invoke-interface {v1, v4, v5}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    const-string/jumbo v4, "Received incomplete response with Content-Length %d but actual body length %d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-interface {p2}, Lorg/apache/http/client/cache/Resource;->length()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 218
    .local v2, "msg":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    .line 219
    .local v3, "msgBytes":[B
    const-string/jumbo v4, "Content-Length"

    array-length v5, v3

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    new-instance v4, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v4, v3}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    invoke-interface {v1, v4}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 221
    invoke-static {v1}, Lorg/apache/http/impl/client/cache/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v4

    return-object v4
.end method

.method public getCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 5
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 328
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    iget-object v4, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v4, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/http/client/cache/HttpCacheStorage;->getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v0

    .line 329
    .local v0, "root":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-nez v0, :cond_1

    move-object v0, v2

    .line 339
    .end local v0    # "root":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_0
    :goto_0
    return-object v0

    .line 332
    .restart local v0    # "root":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_1
    invoke-virtual {v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->hasVariants()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 335
    invoke-virtual {v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->getVariantMap()Ljava/util/Map;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v4, p2, v0}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getVariantKey(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 336
    .local v1, "variantCacheKey":Ljava/lang/String;
    if-nez v1, :cond_2

    move-object v0, v2

    .line 337
    goto :goto_0

    .line 339
    :cond_2
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v2, v1}, Lorg/apache/http/client/cache/HttpCacheStorage;->getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v0

    goto :goto_0
.end method

.method getResponseReader(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/CloseableHttpResponse;)Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;
    .locals 6
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "backEndResponse"    # Lorg/apache/http/client/methods/CloseableHttpResponse;

    .prologue
    .line 323
    new-instance v0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    iget-wide v2, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->maxObjectSizeBytes:J

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;-><init>(Lorg/apache/http/client/cache/ResourceFactory;JLorg/apache/http/HttpRequest;Lorg/apache/http/client/methods/CloseableHttpResponse;)V

    return-object v0
.end method

.method public getVariantCacheEntriesWithEtags(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/util/Map;
    .locals 8
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpHost;",
            "Lorg/apache/http/HttpRequest;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/impl/client/cache/Variant;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 350
    .local v5, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    iget-object v6, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    iget-object v7, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v7, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/http/client/cache/HttpCacheStorage;->getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v1

    .line 351
    .local v1, "root":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/apache/http/client/cache/HttpCacheEntry;->hasVariants()Z

    move-result v6

    if-nez v6, :cond_1

    .line 359
    :cond_0
    return-object v5

    .line 354
    :cond_1
    invoke-virtual {v1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getVariantMap()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 355
    .local v2, "variant":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 356
    .local v4, "variantKey":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 357
    .local v3, "variantCacheKey":Ljava/lang/String;
    invoke-direct {p0, v4, v3, v5}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->addVariantWithEtag(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0
.end method

.method isIncompleteResponse(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/Resource;)Z
    .locals 10
    .param p1, "resp"    # Lorg/apache/http/HttpResponse;
    .param p2, "resource"    # Lorg/apache/http/client/cache/Resource;

    .prologue
    const/4 v4, 0x0

    .line 191
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 192
    .local v3, "status":I
    const/16 v5, 0xc8

    if-eq v3, v5, :cond_1

    const/16 v5, 0xce

    if-eq v3, v5, :cond_1

    .line 206
    :cond_0
    :goto_0
    return v4

    .line 196
    :cond_1
    const-string/jumbo v5, "Content-Length"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 197
    .local v1, "hdr":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    .line 202
    :try_start_0
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 206
    .local v0, "contentLength":I
    invoke-interface {p2}, Lorg/apache/http/client/cache/Resource;->length()J

    move-result-wide v6

    int-to-long v8, v0

    cmp-long v5, v6, v8

    if-gez v5, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    .line 203
    .end local v0    # "contentLength":I
    :catch_0
    move-exception v2

    .line 204
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public reuseVariantEntryFor(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/impl/client/cache/Variant;)V
    .locals 9
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "req"    # Lorg/apache/http/HttpRequest;
    .param p3, "variant"    # Lorg/apache/http/impl/client/cache/Variant;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v1, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v7

    .line 171
    .local v7, "parentCacheKey":Ljava/lang/String;
    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/Variant;->getEntry()Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v3

    .line 172
    .local v3, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v1, p2, v3}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getVariantKey(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/lang/String;

    move-result-object v4

    .line 173
    .local v4, "variantKey":Ljava/lang/String;
    invoke-virtual {p3}, Lorg/apache/http/impl/client/cache/Variant;->getCacheKey()Ljava/lang/String;

    move-result-object v5

    .line 175
    .local v5, "variantCacheKey":Ljava/lang/String;
    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache$2;

    move-object v1, p0

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/BasicHttpCache$2;-><init>(Lorg/apache/http/impl/client/cache/BasicHttpCache;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    .local v0, "callback":Lorg/apache/http/client/cache/HttpCacheUpdateCallback;
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v1, v7, v0}, Lorg/apache/http/client/cache/HttpCacheStorage;->updateEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheUpdateCallback;)V
    :try_end_0
    .catch Lorg/apache/http/client/cache/HttpCacheUpdateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    :goto_0
    return-void

    .line 185
    :catch_0
    move-exception v6

    .line 186
    .local v6, "e":Lorg/apache/http/client/cache/HttpCacheUpdateException;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Could not update key ["

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v8, "]"

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v6}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method storeInCache(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 1
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-virtual {p3}, Lorg/apache/http/client/cache/HttpCacheEntry;->hasVariants()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storeVariantEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 134
    :goto_0
    return-void

    .line 132
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storeNonVariantEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    goto :goto_0
.end method

.method storeNonVariantEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 2
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "req"    # Lorg/apache/http/HttpRequest;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v1, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "uri":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v1, v0, p3}, Lorg/apache/http/client/cache/HttpCacheStorage;->putEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 140
    return-void
.end method

.method storeVariantEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 7
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "req"    # Lorg/apache/http/HttpRequest;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v4, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v2

    .line 147
    .local v2, "parentURI":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->uriExtractor:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v4, p1, p2, p3}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getVariantURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/lang/String;

    move-result-object v3

    .line 148
    .local v3, "variantURI":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v4, v3, p3}, Lorg/apache/http/client/cache/HttpCacheStorage;->putEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 150
    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache$1;

    invoke-direct {v0, p0, p2, p3, v3}, Lorg/apache/http/impl/client/cache/BasicHttpCache$1;-><init>(Lorg/apache/http/impl/client/cache/BasicHttpCache;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;)V

    .line 162
    .local v0, "callback":Lorg/apache/http/client/cache/HttpCacheUpdateCallback;
    :try_start_0
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v4, v2, v0}, Lorg/apache/http/client/cache/HttpCacheStorage;->updateEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheUpdateCallback;)V
    :try_end_0
    .catch Lorg/apache/http/client/cache/HttpCacheUpdateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :goto_0
    return-void

    .line 163
    :catch_0
    move-exception v1

    .line 164
    .local v1, "e":Lorg/apache/http/client/cache/HttpCacheUpdateException;
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Could not update key ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public updateCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;Ljava/util/Date;Ljava/util/Date;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 7
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "stale"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p4, "originResponse"    # Lorg/apache/http/HttpResponse;
    .param p5, "requestSent"    # Ljava/util/Date;
    .param p6, "responseReceived"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 253
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->cacheEntryUpdater:Lorg/apache/http/impl/client/cache/CacheEntryUpdater;

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v1

    move-object v2, p3

    move-object v3, p5

    move-object v4, p6

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->updateCacheEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v6

    .line 259
    .local v6, "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    invoke-virtual {p0, p1, p2, v6}, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storeInCache(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 260
    return-object v6
.end method

.method public updateVariantCacheEntry(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpResponse;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 7
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "stale"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p4, "originResponse"    # Lorg/apache/http/HttpResponse;
    .param p5, "requestSent"    # Ljava/util/Date;
    .param p6, "responseReceived"    # Ljava/util/Date;
    .param p7, "cacheKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 266
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->cacheEntryUpdater:Lorg/apache/http/impl/client/cache/CacheEntryUpdater;

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v1

    move-object v2, p3

    move-object v3, p5

    move-object v4, p6

    move-object v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/CacheEntryUpdater;->updateCacheEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v6

    .line 272
    .local v6, "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCache;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v0, p7, v6}, Lorg/apache/http/client/cache/HttpCacheStorage;->putEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 273
    return-object v6
.end method
