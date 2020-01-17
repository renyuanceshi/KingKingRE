.class Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;
.super Ljava/lang/Object;
.source "CachedResponseSuitabilityChecker.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final heuristicCoefficient:F

.field private final heuristicDefaultLifetime:J

.field private final log:Lorg/apache/commons/logging/Log;

.field private final sharedCache:Z

.field private final useHeuristicCaching:Z

.field private final validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 1
    .param p1, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 71
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;-><init>(Lorg/apache/http/impl/client/cache/CacheValidityPolicy;Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 72
    return-void
.end method

.method constructor <init>(Lorg/apache/http/impl/client/cache/CacheValidityPolicy;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 2
    .param p1, "validityStrategy"    # Lorg/apache/http/impl/client/cache/CacheValidityPolicy;
    .param p2, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    .line 63
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    .line 64
    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->isSharedCache()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->sharedCache:Z

    .line 65
    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->isHeuristicCachingEnabled()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->useHeuristicCaching:Z

    .line 66
    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->getHeuristicCoefficient()F

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->heuristicCoefficient:F

    .line 67
    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->getHeuristicDefaultLifetime()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->heuristicDefaultLifetime:J

    .line 68
    return-void
.end method

.method private etagValidatorMatches(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 13
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 293
    const-string/jumbo v12, "ETag"

    invoke-virtual {p2, v12}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v4

    .line 294
    .local v4, "etagHeader":Lorg/apache/http/Header;
    if-eqz v4, :cond_2

    invoke-interface {v4}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 295
    .local v3, "etag":Ljava/lang/String;
    :goto_0
    const-string/jumbo v12, "If-None-Match"

    invoke-interface {p1, v12}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v8

    .line 296
    .local v8, "ifNoneMatch":[Lorg/apache/http/Header;
    if-eqz v8, :cond_5

    .line 297
    move-object v0, v8

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v9, v0

    .local v9, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    move v7, v6

    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v6    # "i$":I
    .end local v9    # "len$":I
    .local v7, "i$":I
    :goto_1
    if-ge v7, v9, :cond_5

    aget-object v5, v0, v7

    .line 298
    .local v5, "h":Lorg/apache/http/Header;
    invoke-interface {v5}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v10, v1

    .local v10, "len$":I
    const/4 v6, 0x0

    .end local v7    # "i$":I
    .restart local v6    # "i$":I
    :goto_2
    if-ge v6, v10, :cond_4

    aget-object v2, v1, v6

    .line 299
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 300
    .local v11, "reqEtag":Ljava/lang/String;
    const-string/jumbo v12, "*"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    if-nez v3, :cond_1

    :cond_0
    invoke-virtual {v11, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 302
    :cond_1
    const/4 v12, 0x1

    .line 307
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v5    # "h":Lorg/apache/http/Header;
    .end local v6    # "i$":I
    .end local v10    # "len$":I
    .end local v11    # "reqEtag":Ljava/lang/String;
    :goto_3
    return v12

    .line 294
    .end local v3    # "etag":Ljava/lang/String;
    .end local v8    # "ifNoneMatch":[Lorg/apache/http/Header;
    :cond_2
    const/4 v3, 0x0

    goto :goto_0

    .line 298
    .restart local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v2    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v3    # "etag":Ljava/lang/String;
    .restart local v5    # "h":Lorg/apache/http/Header;
    .restart local v6    # "i$":I
    .restart local v8    # "ifNoneMatch":[Lorg/apache/http/Header;
    .restart local v10    # "len$":I
    .restart local v11    # "reqEtag":Ljava/lang/String;
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 297
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v11    # "reqEtag":Ljava/lang/String;
    :cond_4
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    .end local v6    # "i$":I
    .restart local v7    # "i$":I
    goto :goto_1

    .line 307
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v5    # "h":Lorg/apache/http/Header;
    .end local v7    # "i$":I
    .end local v10    # "len$":I
    :cond_5
    const/4 v12, 0x0

    goto :goto_3
.end method

.method private getMaxStale(Lorg/apache/http/HttpRequest;)J
    .locals 18
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 104
    const-wide/16 v10, -0x1

    .line 105
    .local v10, "maxstale":J
    const-string/jumbo v13, "Cache-Control"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v2

    .local v2, "arr$":[Lorg/apache/http/Header;
    array-length v8, v2

    .local v8, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    move v7, v6

    .end local v2    # "arr$":[Lorg/apache/http/Header;
    .end local v6    # "i$":I
    .end local v8    # "len$":I
    .local v7, "i$":I
    :goto_0
    if-ge v7, v8, :cond_6

    aget-object v5, v2, v7

    .line 106
    .local v5, "h":Lorg/apache/http/Header;
    invoke-interface {v5}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v3

    .local v3, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v9, v3

    .local v9, "len$":I
    const/4 v6, 0x0

    .end local v7    # "i$":I
    .restart local v6    # "i$":I
    :goto_1
    if-ge v6, v9, :cond_5

    aget-object v4, v3, v6

    .line 107
    .local v4, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v13, "max-stale"

    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 108
    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_0

    const-string/jumbo v13, ""

    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    :cond_0
    const-wide/16 v16, -0x1

    cmp-long v13, v10, v16

    if-nez v13, :cond_2

    .line 110
    const-wide v10, 0x7fffffffffffffffL

    .line 106
    :cond_1
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 113
    :cond_2
    :try_start_0
    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v14

    .line 114
    .local v14, "val":J
    const-wide/16 v16, 0x0

    cmp-long v13, v14, v16

    if-gez v13, :cond_3

    .line 115
    const-wide/16 v14, 0x0

    .line 117
    :cond_3
    const-wide/16 v16, -0x1

    cmp-long v13, v10, v16

    if-eqz v13, :cond_4

    cmp-long v13, v14, v10

    if-gez v13, :cond_1

    .line 118
    :cond_4
    move-wide v10, v14

    goto :goto_2

    .line 120
    .end local v14    # "val":J
    :catch_0
    move-exception v12

    .line 122
    .local v12, "nfe":Ljava/lang/NumberFormatException;
    const-wide/16 v10, 0x0

    goto :goto_2

    .line 105
    .end local v4    # "elt":Lorg/apache/http/HeaderElement;
    .end local v12    # "nfe":Ljava/lang/NumberFormatException;
    :cond_5
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    .end local v6    # "i$":I
    .restart local v7    # "i$":I
    goto :goto_0

    .line 128
    .end local v3    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v5    # "h":Lorg/apache/http/Header;
    .end local v9    # "len$":I
    :cond_6
    return-wide v10
.end method

.method private hasSupportedEtagValidator(Lorg/apache/http/HttpRequest;)Z
    .locals 1
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 279
    const-string/jumbo v0, "If-None-Match"

    invoke-interface {p1, v0}, Lorg/apache/http/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private hasSupportedLastModifiedValidator(Lorg/apache/http/HttpRequest;)Z
    .locals 1
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 283
    const-string/jumbo v0, "If-Modified-Since"

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->hasValidDateField(Lorg/apache/http/HttpRequest;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private hasUnsupportedConditionalHeaders(Lorg/apache/http/HttpRequest;)Z
    .locals 1
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 273
    const-string/jumbo v0, "If-Range"

    invoke-interface {p1, v0}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "If-Match"

    invoke-interface {p1, v0}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "If-Unmodified-Since"

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->hasValidDateField(Lorg/apache/http/HttpRequest;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private hasValidDateField(Lorg/apache/http/HttpRequest;Ljava/lang/String;)Z
    .locals 7
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "headerName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 340
    invoke-interface {p1, p2}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 341
    .local v2, "h":Lorg/apache/http/Header;
    invoke-interface {v2}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 342
    .local v1, "date":Ljava/util/Date;
    if-eqz v1, :cond_0

    const/4 v5, 0x1

    .line 344
    .end local v1    # "date":Ljava/util/Date;
    .end local v2    # "h":Lorg/apache/http/Header;
    :cond_0
    return v5
.end method

.method private isFreshEnough(Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpRequest;Ljava/util/Date;)Z
    .locals 10
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 75
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p1, p3}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->isResponseFresh(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 89
    :cond_0
    :goto_0
    return v8

    .line 78
    :cond_1
    iget-boolean v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->useHeuristicCaching:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    iget v3, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->heuristicCoefficient:F

    iget-wide v4, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->heuristicDefaultLifetime:J

    move-object v1, p1

    move-object v2, p3

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->isResponseHeuristicallyFresh(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;FJ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 82
    :cond_2
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->originInsistsOnFreshness(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v8, v9

    .line 83
    goto :goto_0

    .line 85
    :cond_3
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->getMaxStale(Lorg/apache/http/HttpRequest;)J

    move-result-wide v6

    .line 86
    .local v6, "maxstale":J
    const-wide/16 v0, -0x1

    cmp-long v0, v6, v0

    if-nez v0, :cond_4

    move v8, v9

    .line 87
    goto :goto_0

    .line 89
    :cond_4
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v0, p1, p3}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    cmp-long v0, v6, v0

    if-lez v0, :cond_5

    move v0, v8

    :goto_1
    move v8, v0

    goto :goto_0

    :cond_5
    move v0, v9

    goto :goto_1
.end method

.method private lastModifiedValidatorMatches(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 9
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    const/4 v7, 0x0

    .line 319
    const-string/jumbo v8, "Last-Modified"

    invoke-virtual {p2, v8}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v5

    .line 320
    .local v5, "lastModifiedHeader":Lorg/apache/http/Header;
    const/4 v4, 0x0

    .line 321
    .local v4, "lastModified":Ljava/util/Date;
    if-eqz v5, :cond_0

    .line 322
    invoke-interface {v5}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    .line 324
    :cond_0
    if-nez v4, :cond_2

    .line 336
    :cond_1
    :goto_0
    return v7

    .line 328
    :cond_2
    const-string/jumbo v8, "If-Modified-Since"

    invoke-interface {p1, v8}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v6, :cond_4

    aget-object v1, v0, v2

    .line 329
    .local v1, "h":Lorg/apache/http/Header;
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    .line 330
    .local v3, "ifModifiedSince":Ljava/util/Date;
    if-eqz v3, :cond_3

    .line 331
    invoke-virtual {v3, p3}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v8

    if-nez v8, :cond_1

    invoke-virtual {v4, v3}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 328
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 336
    .end local v1    # "h":Lorg/apache/http/Header;
    .end local v3    # "ifModifiedSince":Ljava/util/Date;
    :cond_4
    const/4 v7, 0x1

    goto :goto_0
.end method

.method private originInsistsOnFreshness(Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 4
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 93
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v2, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mustRevalidate(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 99
    :cond_0
    :goto_0
    return v0

    .line 96
    :cond_1
    iget-boolean v2, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->sharedCache:Z

    if-eqz v2, :cond_0

    .line 99
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v2, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->proxyRevalidate(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    const-string/jumbo v3, "s-maxage"

    invoke-virtual {v2, p1, v3}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->hasCacheControlDirective(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_2
    move v0, v1

    goto :goto_0
.end method


# virtual methods
.method public allConditionalsMatch(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 7
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 253
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->hasSupportedEtagValidator(Lorg/apache/http/HttpRequest;)Z

    move-result v1

    .line 254
    .local v1, "hasEtagValidator":Z
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->hasSupportedLastModifiedValidator(Lorg/apache/http/HttpRequest;)Z

    move-result v2

    .line 256
    .local v2, "hasLastModifiedValidator":Z
    if-eqz v1, :cond_1

    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->etagValidatorMatches(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v6

    if-eqz v6, :cond_1

    move v0, v5

    .line 257
    .local v0, "etagValidatorMatches":Z
    :goto_0
    if-eqz v2, :cond_2

    invoke-direct {p0, p1, p2, p3}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->lastModifiedValidatorMatches(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v3, v5

    .line 259
    .local v3, "lastModifiedValidatorMatches":Z
    :goto_1
    if-eqz v1, :cond_3

    if-eqz v2, :cond_3

    if-eqz v0, :cond_0

    if-nez v3, :cond_3

    .line 269
    :cond_0
    :goto_2
    return v4

    .end local v0    # "etagValidatorMatches":Z
    .end local v3    # "lastModifiedValidatorMatches":Z
    :cond_1
    move v0, v4

    .line 256
    goto :goto_0

    .restart local v0    # "etagValidatorMatches":Z
    :cond_2
    move v3, v4

    .line 257
    goto :goto_1

    .line 262
    .restart local v3    # "lastModifiedValidatorMatches":Z
    :cond_3
    if-eqz v1, :cond_4

    if-eqz v0, :cond_0

    .line 266
    :cond_4
    if-eqz v2, :cond_5

    if-eqz v3, :cond_0

    :cond_5
    move v4, v5

    .line 269
    goto :goto_2
.end method

.method public canCachedResponseBeUsed(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 26
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p4, "now"    # Ljava/util/Date;

    .prologue
    .line 147
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->isFreshEnough(Lorg/apache/http/client/cache/HttpCacheEntry;Lorg/apache/http/HttpRequest;Ljava/util/Date;)Z

    move-result v19

    if-nez v19, :cond_0

    .line 148
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Cache entry was not fresh enough"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 149
    const/16 v19, 0x0

    .line 233
    :goto_0
    return v19

    .line 152
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->contentLengthHeaderMatchesActualLength(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v19

    if-nez v19, :cond_1

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Cache entry Content-Length and header information do not match"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 154
    const/16 v19, 0x0

    goto :goto_0

    .line 157
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->hasUnsupportedConditionalHeaders(Lorg/apache/http/HttpRequest;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 158
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Request contained conditional headers we don\'t handle"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 159
    const/16 v19, 0x0

    goto :goto_0

    .line 162
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lorg/apache/http/HttpRequest;)Z

    move-result v19

    if-nez v19, :cond_3

    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/cache/HttpCacheEntry;->getStatusCode()I

    move-result v19

    const/16 v22, 0x130

    move/from16 v0, v19

    move/from16 v1, v22

    if-ne v0, v1, :cond_3

    .line 163
    const/16 v19, 0x0

    goto :goto_0

    .line 166
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->isConditional(Lorg/apache/http/HttpRequest;)Z

    move-result v19

    if-eqz v19, :cond_4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->allConditionalsMatch(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z

    move-result v19

    if-nez v19, :cond_4

    .line 167
    const/16 v19, 0x0

    goto :goto_0

    .line 170
    :cond_4
    const-string/jumbo v19, "Cache-Control"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v6

    .local v6, "arr$":[Lorg/apache/http/Header;
    array-length v15, v6

    .local v15, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    move v14, v11

    .end local v6    # "arr$":[Lorg/apache/http/Header;
    .end local v11    # "i$":I
    .end local v15    # "len$":I
    .local v14, "i$":I
    :goto_1
    if-ge v14, v15, :cond_c

    aget-object v8, v6, v14

    .line 171
    .local v8, "ccHdr":Lorg/apache/http/Header;
    invoke-interface {v8}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v7

    .local v7, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v0, v7

    move/from16 v16, v0

    .local v16, "len$":I
    const/4 v11, 0x0

    .end local v14    # "i$":I
    .restart local v11    # "i$":I
    :goto_2
    move/from16 v0, v16

    if-ge v11, v0, :cond_b

    aget-object v9, v7, v11

    .line 172
    .local v9, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v19, "no-cache"

    invoke-interface {v9}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Response contained NO CACHE directive, cache was not suitable"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 174
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 177
    :cond_5
    const-string/jumbo v19, "no-store"

    invoke-interface {v9}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 178
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Response contained NO STORE directive, cache was not suitable"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 179
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 182
    :cond_6
    const-string/jumbo v19, "max-age"

    invoke-interface {v9}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 184
    :try_start_0
    invoke-interface {v9}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    .line 185
    .local v17, "maxage":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v22

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v24, v0

    cmp-long v19, v22, v24

    if-lez v19, :cond_7

    .line 186
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Response from cache was NOT suitable due to max age"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 189
    .end local v17    # "maxage":I
    :catch_0
    move-exception v10

    .line 191
    .local v10, "ex":Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Response from cache was malformed"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v10}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 192
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 196
    .end local v10    # "ex":Ljava/lang/NumberFormatException;
    :cond_7
    const-string/jumbo v19, "max-stale"

    invoke-interface {v9}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_8

    .line 198
    :try_start_1
    invoke-interface {v9}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    .line 199
    .local v18, "maxstale":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v22

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v24, v0

    cmp-long v19, v22, v24

    if-lez v19, :cond_8

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Response from cache was not suitable due to Max stale freshness"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 201
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 203
    .end local v18    # "maxstale":I
    :catch_1
    move-exception v10

    .line 205
    .restart local v10    # "ex":Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Response from cache was malformed: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v10}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 206
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 210
    .end local v10    # "ex":Ljava/lang/NumberFormatException;
    :cond_8
    const-string/jumbo v19, "min-fresh"

    invoke-interface {v9}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_a

    .line 212
    :try_start_2
    invoke-interface {v9}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v20

    .line 213
    .local v20, "minfresh":J
    const-wide/16 v22, 0x0

    cmp-long v19, v20, v22

    if-gez v19, :cond_9

    .line 214
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 216
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v4

    .line 217
    .local v4, "age":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v12

    .line 218
    .local v12, "freshness":J
    sub-long v22, v12, v4

    cmp-long v19, v22, v20

    if-gez v19, :cond_a

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Response from cache was not suitable due to min fresh freshness requirement"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2

    .line 221
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 223
    .end local v4    # "age":J
    .end local v12    # "freshness":J
    .end local v20    # "minfresh":J
    :catch_2
    move-exception v10

    .line 225
    .restart local v10    # "ex":Ljava/lang/NumberFormatException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "Response from cache was malformed: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v10}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 226
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 171
    .end local v10    # "ex":Ljava/lang/NumberFormatException;
    :cond_a
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_2

    .line 170
    .end local v9    # "elt":Lorg/apache/http/HeaderElement;
    :cond_b
    add-int/lit8 v11, v14, 0x1

    move v14, v11

    .end local v11    # "i$":I
    .restart local v14    # "i$":I
    goto/16 :goto_1

    .line 232
    .end local v7    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v8    # "ccHdr":Lorg/apache/http/Header;
    .end local v16    # "len$":I
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v19, v0

    const-string/jumbo v22, "Response from cache was suitable"

    move-object/from16 v0, v19

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 233
    const/16 v19, 0x1

    goto/16 :goto_0
.end method

.method public isConditional(Lorg/apache/http/HttpRequest;)Z
    .locals 1
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 242
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->hasSupportedEtagValidator(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/CachedResponseSuitabilityChecker;->hasSupportedLastModifiedValidator(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
