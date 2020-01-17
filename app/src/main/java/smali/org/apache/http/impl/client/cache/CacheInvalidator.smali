.class Lorg/apache/http/impl/client/cache/CacheInvalidator;
.super Ljava/lang/Object;
.source "CacheInvalidator.java"

# interfaces
.implements Lorg/apache/http/client/cache/HttpCacheInvalidator;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final storage:Lorg/apache/http/client/cache/HttpCacheStorage;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/client/cache/CacheKeyGenerator;Lorg/apache/http/client/cache/HttpCacheStorage;)V
    .locals 1
    .param p1, "uriExtractor"    # Lorg/apache/http/impl/client/cache/CacheKeyGenerator;
    .param p2, "storage"    # Lorg/apache/http/client/cache/HttpCacheStorage;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->log:Lorg/apache/commons/logging/Log;

    .line 72
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    .line 73
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    .line 74
    return-void
.end method

.method private flushEntry(Ljava/lang/String;)V
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 120
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v1, p1}, Lorg/apache/http/client/cache/HttpCacheStorage;->removeEntry(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 124
    :goto_0
    return-void

    .line 121
    :catch_0
    move-exception v0

    .line 122
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "unable to flush cache entry"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private flushLocationCacheEntry(Ljava/net/URL;Lorg/apache/http/HttpResponse;Ljava/net/URL;)V
    .locals 4
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "location"    # Ljava/net/URL;

    .prologue
    .line 218
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {p3}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "cacheKey":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v1

    .line 220
    .local v1, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-nez v1, :cond_1

    .line 235
    :cond_0
    :goto_0
    return-void

    .line 227
    :cond_1
    invoke-direct {p0, p2, v1}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->responseDateOlderThanEntryDate(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 230
    invoke-direct {p0, p2, v1}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->responseAndEntryEtagsDiffer(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 234
    invoke-virtual {p0, p1, p3}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushUriIfSameHost(Ljava/net/URL;Ljava/net/URL;)V

    goto :goto_0
.end method

.method private getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 164
    const/4 v0, 0x0

    .line 166
    .local v0, "absURL":Ljava/net/URL;
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "absURL":Ljava/net/URL;
    .local v1, "absURL":Ljava/net/URL;
    move-object v0, v1

    .line 170
    .end local v1    # "absURL":Ljava/net/URL;
    .restart local v0    # "absURL":Ljava/net/URL;
    :goto_0
    return-object v0

    .line 167
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private getContentLocationURL(Ljava/net/URL;Lorg/apache/http/HttpResponse;)Ljava/net/URL;
    .locals 4
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 238
    const-string/jumbo v3, "Content-Location"

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 239
    .local v1, "clHeader":Lorg/apache/http/Header;
    if-nez v1, :cond_1

    .line 240
    const/4 v0, 0x0

    .line 247
    :cond_0
    :goto_0
    return-object v0

    .line 242
    :cond_1
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 243
    .local v2, "contentLocation":Ljava/lang/String;
    invoke-direct {p0, v2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 244
    .local v0, "canonURL":Ljava/net/URL;
    if-nez v0, :cond_0

    .line 247
    invoke-direct {p0, p1, v2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getRelativeURL(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    goto :goto_0
.end method

.method private getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 3
    .param p1, "theUri"    # Ljava/lang/String;

    .prologue
    .line 128
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    invoke-interface {v1, p1}, Lorg/apache/http/client/cache/HttpCacheStorage;->getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 132
    :goto_0
    return-object v1

    .line 129
    :catch_0
    move-exception v0

    .line 130
    .local v0, "ioe":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "could not retrieve entry from storage"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 132
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getLocationURL(Ljava/net/URL;Lorg/apache/http/HttpResponse;)Ljava/net/URL;
    .locals 4
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 251
    const-string/jumbo v3, "Location"

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 252
    .local v1, "clHeader":Lorg/apache/http/Header;
    if-nez v1, :cond_1

    .line 253
    const/4 v0, 0x0

    .line 260
    :cond_0
    :goto_0
    return-object v0

    .line 255
    :cond_1
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    .line 256
    .local v2, "location":Ljava/lang/String;
    invoke-direct {p0, v2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 257
    .local v0, "canonURL":Ljava/net/URL;
    if-nez v0, :cond_0

    .line 260
    invoke-direct {p0, p1, v2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getRelativeURL(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    goto :goto_0
.end method

.method private getRelativeURL(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;
    .locals 3
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "relUri"    # Ljava/lang/String;

    .prologue
    .line 174
    const/4 v0, 0x0

    .line 176
    .local v0, "relURL":Ljava/net/URL;
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1, p2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "relURL":Ljava/net/URL;
    .local v1, "relURL":Ljava/net/URL;
    move-object v0, v1

    .line 180
    .end local v1    # "relURL":Ljava/net/URL;
    .restart local v0    # "relURL":Ljava/net/URL;
    :goto_0
    return-object v0

    .line 177
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private notGetOrHeadRequest(Ljava/lang/String;)Z
    .locals 1
    .param p1, "method"    # Ljava/lang/String;

    .prologue
    .line 189
    const-string/jumbo v0, "GET"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "HEAD"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private responseAndEntryEtagsDiffer(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 5
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    const/4 v2, 0x0

    .line 265
    const-string/jumbo v3, "ETag"

    invoke-virtual {p2, v3}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 266
    .local v0, "entryEtag":Lorg/apache/http/Header;
    const-string/jumbo v3, "ETag"

    invoke-interface {p1, v3}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 267
    .local v1, "responseEtag":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    if-nez v1, :cond_1

    .line 270
    :cond_0
    :goto_0
    return v2

    :cond_1
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0
.end method

.method private responseDateOlderThanEntryDate(Lorg/apache/http/HttpResponse;Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 6
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    const/4 v4, 0x0

    .line 275
    const-string/jumbo v5, "Date"

    invoke-virtual {p2, v5}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 276
    .local v1, "entryDateHeader":Lorg/apache/http/Header;
    const-string/jumbo v5, "Date"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    .line 277
    .local v3, "responseDateHeader":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    if-nez v3, :cond_1

    .line 286
    :cond_0
    :goto_0
    return v4

    .line 281
    :cond_1
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 282
    .local v0, "entryDate":Ljava/util/Date;
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 283
    .local v2, "responseDate":Ljava/util/Date;
    if-eqz v0, :cond_0

    if-eqz v2, :cond_0

    .line 286
    invoke-virtual {v2, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v4

    goto :goto_0
.end method


# virtual methods
.method protected flushAbsoluteUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)Z
    .locals 2
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 155
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 156
    .local v0, "absURL":Ljava/net/URL;
    if-nez v0, :cond_0

    .line 157
    const/4 v1, 0x0

    .line 160
    :goto_0
    return v1

    .line 159
    :cond_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushUriIfSameHost(Ljava/net/URL;Ljava/net/URL;)V

    .line 160
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public flushInvalidatedCacheEntries(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)V
    .locals 11
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "req"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 84
    invoke-virtual {p0, p2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->requestShouldNotBeCached(Lorg/apache/http/HttpRequest;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 85
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v9, "Request should not be cached"

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 87
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v8, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v6

    .line 89
    .local v6, "theUri":Ljava/lang/String;
    invoke-direct {p0, v6}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v4

    .line 91
    .local v4, "parent":Lorg/apache/http/client/cache/HttpCacheEntry;
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->log:Lorg/apache/commons/logging/Log;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "parent entry: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 93
    if-eqz v4, :cond_1

    .line 94
    invoke-virtual {v4}, Lorg/apache/http/client/cache/HttpCacheEntry;->getVariantMap()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 95
    .local v7, "variantURI":Ljava/lang/String;
    invoke-direct {p0, v7}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushEntry(Ljava/lang/String;)V

    goto :goto_0

    .line 97
    .end local v7    # "variantURI":Ljava/lang/String;
    :cond_0
    invoke-direct {p0, v6}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushEntry(Ljava/lang/String;)V

    .line 99
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-direct {p0, v6}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v5

    .line 100
    .local v5, "reqURL":Ljava/net/URL;
    if-nez v5, :cond_3

    .line 101
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v9, "Couldn\'t transform request into valid URL"

    invoke-interface {v8, v9}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 116
    .end local v4    # "parent":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v5    # "reqURL":Ljava/net/URL;
    .end local v6    # "theUri":Ljava/lang/String;
    :cond_2
    :goto_1
    return-void

    .line 104
    .restart local v4    # "parent":Lorg/apache/http/client/cache/HttpCacheEntry;
    .restart local v5    # "reqURL":Ljava/net/URL;
    .restart local v6    # "theUri":Ljava/lang/String;
    :cond_3
    const-string/jumbo v8, "Content-Location"

    invoke-interface {p2, v8}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 105
    .local v0, "clHdr":Lorg/apache/http/Header;
    if-eqz v0, :cond_4

    .line 106
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "contentLocation":Ljava/lang/String;
    invoke-virtual {p0, v5, v1}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushAbsoluteUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_4

    .line 108
    invoke-virtual {p0, v5, v1}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushRelativeUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)V

    .line 111
    .end local v1    # "contentLocation":Ljava/lang/String;
    :cond_4
    const-string/jumbo v8, "Location"

    invoke-interface {p2, v8}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    .line 112
    .local v3, "lHdr":Lorg/apache/http/Header;
    if-eqz v3, :cond_2

    .line 113
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v5, v8}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushAbsoluteUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)Z

    goto :goto_1
.end method

.method public flushInvalidatedCacheEntries(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)V
    .locals 5
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 198
    invoke-interface {p3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v3

    .line 199
    .local v3, "status":I
    const/16 v4, 0xc8

    if-lt v3, v4, :cond_0

    const/16 v4, 0x12b

    if-le v3, v4, :cond_1

    .line 214
    :cond_0
    :goto_0
    return-void

    .line 202
    :cond_1
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {v4, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    .line 203
    .local v2, "reqURL":Ljava/net/URL;
    if-eqz v2, :cond_0

    .line 206
    invoke-direct {p0, v2, p3}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getContentLocationURL(Ljava/net/URL;Lorg/apache/http/HttpResponse;)Ljava/net/URL;

    move-result-object v0

    .line 207
    .local v0, "contentLocation":Ljava/net/URL;
    if-eqz v0, :cond_2

    .line 208
    invoke-direct {p0, v2, p3, v0}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushLocationCacheEntry(Ljava/net/URL;Lorg/apache/http/HttpResponse;Ljava/net/URL;)V

    .line 210
    :cond_2
    invoke-direct {p0, v2, p3}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getLocationURL(Ljava/net/URL;Lorg/apache/http/HttpResponse;)Ljava/net/URL;

    move-result-object v1

    .line 211
    .local v1, "location":Ljava/net/URL;
    if-eqz v1, :cond_0

    .line 212
    invoke-direct {p0, v2, p3, v1}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushLocationCacheEntry(Ljava/net/URL;Lorg/apache/http/HttpResponse;Ljava/net/URL;)V

    goto :goto_0
.end method

.method protected flushRelativeUriFromSameHost(Ljava/net/URL;Ljava/lang/String;)V
    .locals 1
    .param p1, "reqURL"    # Ljava/net/URL;
    .param p2, "relUri"    # Ljava/lang/String;

    .prologue
    .line 146
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getRelativeURL(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 147
    .local v0, "relURL":Ljava/net/URL;
    if-nez v0, :cond_0

    .line 151
    :goto_0
    return-void

    .line 150
    :cond_0
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushUriIfSameHost(Ljava/net/URL;Ljava/net/URL;)V

    goto :goto_0
.end method

.method protected flushUriIfSameHost(Ljava/net/URL;Ljava/net/URL;)V
    .locals 3
    .param p1, "requestURL"    # Ljava/net/URL;
    .param p2, "targetURL"    # Ljava/net/URL;

    .prologue
    .line 136
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CacheInvalidator;->cacheKeyGenerator:Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-virtual {p2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->getAbsoluteURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    .line 137
    .local v0, "canonicalTarget":Ljava/net/URL;
    if-nez v0, :cond_1

    .line 143
    :cond_0
    :goto_0
    return-void

    .line 140
    :cond_1
    invoke-virtual {v0}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 141
    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->flushEntry(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected requestShouldNotBeCached(Lorg/apache/http/HttpRequest;)Z
    .locals 2
    .param p1, "req"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 184
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "method":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/CacheInvalidator;->notGetOrHeadRequest(Ljava/lang/String;)Z

    move-result v1

    return v1
.end method
