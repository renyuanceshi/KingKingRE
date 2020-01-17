.class Lorg/apache/http/impl/client/cache/ConditionalRequestBuilder;
.super Ljava/lang/Object;
.source "ConditionalRequestBuilder.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public buildConditionalRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/HttpRequestWrapper;
    .locals 15
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "cacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 58
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v13

    invoke-static {v13}, Lorg/apache/http/client/methods/HttpRequestWrapper;->wrap(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v12

    .line 59
    .local v12, "newRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeaders([Lorg/apache/http/Header;)V

    .line 60
    const-string/jumbo v13, "ETag"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    .line 61
    .local v3, "eTag":Lorg/apache/http/Header;
    if-eqz v3, :cond_0

    .line 62
    const-string/jumbo v13, "If-None-Match"

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    :cond_0
    const-string/jumbo v13, "Last-Modified"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v8

    .line 65
    .local v8, "lastModified":Lorg/apache/http/Header;
    if-eqz v8, :cond_1

    .line 66
    const-string/jumbo v13, "If-Modified-Since"

    invoke-interface {v8}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    :cond_1
    const/4 v11, 0x0

    .line 69
    .local v11, "mustRevalidate":Z
    const-string/jumbo v13, "Cache-Control"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lorg/apache/http/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/Header;
    array-length v9, v1

    .local v9, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    move v7, v6

    .end local v1    # "arr$":[Lorg/apache/http/Header;
    .end local v6    # "i$":I
    .end local v9    # "len$":I
    .local v7, "i$":I
    :goto_0
    if-ge v7, v9, :cond_5

    aget-object v5, v1, v7

    .line 70
    .local v5, "h":Lorg/apache/http/Header;
    invoke-interface {v5}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v2

    .local v2, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v10, v2

    .local v10, "len$":I
    const/4 v6, 0x0

    .end local v7    # "i$":I
    .restart local v6    # "i$":I
    :goto_1
    if-ge v6, v10, :cond_3

    aget-object v4, v2, v6

    .line 71
    .local v4, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v13, "must-revalidate"

    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_2

    const-string/jumbo v13, "proxy-revalidate"

    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 73
    :cond_2
    const/4 v11, 0x1

    .line 69
    .end local v4    # "elt":Lorg/apache/http/HeaderElement;
    :cond_3
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    .end local v6    # "i$":I
    .restart local v7    # "i$":I
    goto :goto_0

    .line 70
    .end local v7    # "i$":I
    .restart local v4    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v6    # "i$":I
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 78
    .end local v2    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v4    # "elt":Lorg/apache/http/HeaderElement;
    .end local v5    # "h":Lorg/apache/http/Header;
    .end local v6    # "i$":I
    .end local v10    # "len$":I
    .restart local v7    # "i$":I
    :cond_5
    if-eqz v11, :cond_6

    .line 79
    const-string/jumbo v13, "Cache-Control"

    const-string/jumbo v14, "max-age=0"

    invoke-virtual {v12, v13, v14}, Lorg/apache/http/client/methods/HttpRequestWrapper;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    :cond_6
    return-object v12
.end method

.method public buildConditionalRequestFromVariants(Lorg/apache/http/client/methods/HttpRequestWrapper;Ljava/util/Map;)Lorg/apache/http/client/methods/HttpRequestWrapper;
    .locals 7
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/methods/HttpRequestWrapper;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/http/impl/client/cache/Variant;",
            ">;)",
            "Lorg/apache/http/client/methods/HttpRequestWrapper;"
        }
    .end annotation

    .prologue
    .line 98
    .local p2, "variants":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/apache/http/impl/client/cache/Variant;>;"
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/client/methods/HttpRequestWrapper;->wrap(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v4

    .line 99
    .local v4, "newRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeaders([Lorg/apache/http/Header;)V

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .local v1, "etags":Ljava/lang/StringBuilder;
    const/4 v2, 0x1

    .line 104
    .local v2, "first":Z
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 105
    .local v0, "etag":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 106
    const-string/jumbo v5, ","

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    :cond_0
    const/4 v2, 0x0

    .line 109
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 112
    .end local v0    # "etag":Ljava/lang/String;
    :cond_1
    const-string/jumbo v5, "If-None-Match"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    return-object v4
.end method

.method public buildUnconditionalRequest(Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/methods/HttpRequestWrapper;
    .locals 3
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 128
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->wrap(Lorg/apache/http/HttpRequest;)Lorg/apache/http/client/methods/HttpRequestWrapper;

    move-result-object v0

    .line 129
    .local v0, "newRequest":Lorg/apache/http/client/methods/HttpRequestWrapper;
    invoke-virtual {p1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setHeaders([Lorg/apache/http/Header;)V

    .line 130
    const-string/jumbo v1, "Cache-Control"

    const-string/jumbo v2, "no-cache"

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const-string/jumbo v1, "Pragma"

    const-string/jumbo v2, "no-cache"

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    const-string/jumbo v1, "If-Range"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 133
    const-string/jumbo v1, "If-Match"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 134
    const-string/jumbo v1, "If-None-Match"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 135
    const-string/jumbo v1, "If-Unmodified-Since"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 136
    const-string/jumbo v1, "If-Modified-Since"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 137
    return-object v0
.end method
