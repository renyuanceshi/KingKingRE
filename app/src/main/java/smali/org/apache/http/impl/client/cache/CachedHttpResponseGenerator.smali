.class Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;
.super Ljava/lang/Object;
.source "CachedHttpResponseGenerator.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;-><init>(Lorg/apache/http/impl/client/cache/CacheValidityPolicy;)V

    .line 62
    return-void
.end method

.method constructor <init>(Lorg/apache/http/impl/client/cache/CacheValidityPolicy;)V
    .locals 0
    .param p1, "validityStrategy"    # Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    .line 58
    return-void
.end method

.method private addMissingContentLengthHeader(Lorg/apache/http/HttpResponse;Lorg/apache/http/HttpEntity;)V
    .locals 4
    .param p1, "response"    # Lorg/apache/http/HttpResponse;
    .param p2, "entity"    # Lorg/apache/http/HttpEntity;

    .prologue
    .line 150
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->transferEncodingIsPresent(Lorg/apache/http/HttpResponse;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 160
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    const-string/jumbo v1, "Content-Length"

    invoke-interface {p1, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 155
    .local v0, "contentLength":Lorg/apache/http/Header;
    if-nez v0, :cond_0

    .line 156
    new-instance v0, Lorg/apache/http/message/BasicHeader;

    .end local v0    # "contentLength":Lorg/apache/http/Header;
    const-string/jumbo v1, "Content-Length"

    invoke-interface {p2}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .restart local v0    # "contentLength":Lorg/apache/http/Header;
    invoke-interface {p1, v0}, Lorg/apache/http/HttpResponse;->setHeader(Lorg/apache/http/Header;)V

    goto :goto_0
.end method

.method private transferEncodingIsPresent(Lorg/apache/http/HttpResponse;)Z
    .locals 2
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 163
    const-string/jumbo v1, "Transfer-Encoding"

    invoke-interface {p1, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 164
    .local v0, "hdr":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method generateNotModifiedResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 10
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 103
    new-instance v5, Lorg/apache/http/message/BasicHttpResponse;

    sget-object v7, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v8, 0x130

    const-string/jumbo v9, "Not Modified"

    invoke-direct {v5, v7, v8, v9}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 110
    .local v5, "response":Lorg/apache/http/HttpResponse;
    const-string/jumbo v7, "Date"

    invoke-virtual {p1, v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    .line 111
    .local v2, "dateHeader":Lorg/apache/http/Header;
    if-nez v2, :cond_0

    .line 112
    new-instance v2, Lorg/apache/http/message/BasicHeader;

    .end local v2    # "dateHeader":Lorg/apache/http/Header;
    const-string/jumbo v7, "Date"

    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-static {v8}, Lorg/apache/http/client/utils/DateUtils;->formatDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v7, v8}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .restart local v2    # "dateHeader":Lorg/apache/http/Header;
    :cond_0
    invoke-interface {v5, v2}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    .line 118
    const-string/jumbo v7, "ETag"

    invoke-virtual {p1, v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    .line 119
    .local v3, "etagHeader":Lorg/apache/http/Header;
    if-eqz v3, :cond_1

    .line 120
    invoke-interface {v5, v3}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    .line 123
    :cond_1
    const-string/jumbo v7, "Content-Location"

    invoke-virtual {p1, v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 124
    .local v1, "contentLocationHeader":Lorg/apache/http/Header;
    if-eqz v1, :cond_2

    .line 125
    invoke-interface {v5, v1}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    .line 131
    :cond_2
    const-string/jumbo v7, "Expires"

    invoke-virtual {p1, v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v4

    .line 132
    .local v4, "expiresHeader":Lorg/apache/http/Header;
    if-eqz v4, :cond_3

    .line 133
    invoke-interface {v5, v4}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    .line 136
    :cond_3
    const-string/jumbo v7, "Cache-Control"

    invoke-virtual {p1, v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 137
    .local v0, "cacheControlHeader":Lorg/apache/http/Header;
    if-eqz v0, :cond_4

    .line 138
    invoke-interface {v5, v0}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    .line 141
    :cond_4
    const-string/jumbo v7, "Vary"

    invoke-virtual {p1, v7}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v6

    .line 142
    .local v6, "varyHeader":Lorg/apache/http/Header;
    if-eqz v6, :cond_5

    .line 143
    invoke-interface {v5, v6}, Lorg/apache/http/HttpResponse;->addHeader(Lorg/apache/http/Header;)V

    .line 146
    :cond_5
    invoke-static {v5}, Lorg/apache/http/impl/client/cache/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v7

    return-object v7
.end method

.method generateResponse(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 8
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 73
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 74
    .local v3, "now":Ljava/util/Date;
    new-instance v4, Lorg/apache/http/message/BasicHttpResponse;

    sget-object v5, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getStatusCode()I

    move-result v6

    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getReasonPhrase()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    .line 77
    .local v4, "response":Lorg/apache/http/HttpResponse;
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/http/HttpResponse;->setHeaders([Lorg/apache/http/Header;)V

    .line 79
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 80
    new-instance v2, Lorg/apache/http/impl/client/cache/CacheEntity;

    invoke-direct {v2, p1}, Lorg/apache/http/impl/client/cache/CacheEntity;-><init>(Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 81
    .local v2, "entity":Lorg/apache/http/HttpEntity;
    invoke-direct {p0, v4, v2}, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->addMissingContentLengthHeader(Lorg/apache/http/HttpResponse;Lorg/apache/http/HttpEntity;)V

    .line 82
    invoke-interface {v4, v2}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 85
    .end local v2    # "entity":Lorg/apache/http/HttpEntity;
    :cond_0
    iget-object v5, p0, Lorg/apache/http/impl/client/cache/CachedHttpResponseGenerator;->validityStrategy:Lorg/apache/http/impl/client/cache/CacheValidityPolicy;

    invoke-virtual {v5, p1, v3}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    .line 86
    .local v0, "age":J
    const-wide/16 v6, 0x0

    cmp-long v5, v0, v6

    if-lez v5, :cond_1

    .line 87
    const-wide/32 v6, 0x7fffffff

    cmp-long v5, v0, v6

    if-ltz v5, :cond_2

    .line 88
    const-string/jumbo v5, "Age"

    const-string/jumbo v6, "2147483648"

    invoke-interface {v4, v5, v6}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    :cond_1
    :goto_0
    invoke-static {v4}, Lorg/apache/http/impl/client/cache/Proxies;->enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v5

    return-object v5

    .line 90
    :cond_2
    const-string/jumbo v5, "Age"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    long-to-int v7, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/apache/http/HttpResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
