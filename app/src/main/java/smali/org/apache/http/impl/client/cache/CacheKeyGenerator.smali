.class Lorg/apache/http/impl/client/cache/CacheKeyGenerator;
.super Ljava/lang/Object;
.source "CacheKeyGenerator.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final BASE_URI:Ljava/net/URI;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const-string/jumbo v0, "http://example.com/"

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->BASE_URI:Ljava/net/URI;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private canonicalizePort(ILjava/lang/String;)I
    .locals 2
    .param p1, "port"    # I
    .param p2, "protocol"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 91
    if-ne p1, v1, :cond_1

    const-string/jumbo v0, "http"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 92
    const/16 p1, 0x50

    .line 96
    .end local p1    # "port":I
    :cond_0
    :goto_0
    return p1

    .line 93
    .restart local p1    # "port":I
    :cond_1
    if-ne p1, v1, :cond_0

    const-string/jumbo v0, "https"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    const/16 p1, 0x1bb

    goto :goto_0
.end method

.method private isRelativeRequest(Lorg/apache/http/HttpRequest;)Z
    .locals 2
    .param p1, "req"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 100
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "requestUri":Ljava/lang/String;
    const-string/jumbo v1, "*"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 73
    :try_start_0
    sget-object v10, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->BASE_URI:Ljava/net/URI;

    invoke-static {v10, p1}, Lorg/apache/http/client/utils/URIUtils;->resolve(Ljava/net/URI;Ljava/lang/String;)Ljava/net/URI;

    move-result-object v3

    .line 74
    .local v3, "normalized":Ljava/net/URI;
    new-instance v9, Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 75
    .local v9, "u":Ljava/net/URL;
    invoke-virtual {v9}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    .line 76
    .local v7, "protocol":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 77
    .local v2, "hostname":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URL;->getPort()I

    move-result v10

    invoke-direct {p0, v10, v7}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->canonicalizePort(ILjava/lang/String;)I

    move-result v6

    .line 78
    .local v6, "port":I
    invoke-virtual {v9}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 79
    .local v5, "path":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v8

    .line 80
    .local v8, "query":Ljava/lang/String;
    if-eqz v8, :cond_0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "?"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "file":Ljava/lang/String;
    :goto_0
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v7, v2, v6, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 82
    .local v4, "out":Ljava/net/URL;
    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object p1

    .line 86
    .end local v1    # "file":Ljava/lang/String;
    .end local v2    # "hostname":Ljava/lang/String;
    .end local v3    # "normalized":Ljava/net/URI;
    .end local v4    # "out":Ljava/net/URL;
    .end local v5    # "path":Ljava/lang/String;
    .end local v6    # "port":I
    .end local v7    # "protocol":Ljava/lang/String;
    .end local v8    # "query":Ljava/lang/String;
    .end local v9    # "u":Ljava/net/URL;
    .end local p1    # "uri":Ljava/lang/String;
    :goto_1
    return-object p1

    .restart local v2    # "hostname":Ljava/lang/String;
    .restart local v3    # "normalized":Ljava/net/URI;
    .restart local v5    # "path":Ljava/lang/String;
    .restart local v6    # "port":I
    .restart local v7    # "protocol":Ljava/lang/String;
    .restart local v8    # "query":Ljava/lang/String;
    .restart local v9    # "u":Ljava/net/URL;
    .restart local p1    # "uri":Ljava/lang/String;
    :cond_0
    move-object v1, v5

    .line 80
    goto :goto_0

    .line 83
    .end local v2    # "hostname":Ljava/lang/String;
    .end local v3    # "normalized":Ljava/net/URI;
    .end local v5    # "path":Ljava/lang/String;
    .end local v6    # "port":I
    .end local v7    # "protocol":Ljava/lang/String;
    .end local v8    # "query":Ljava/lang/String;
    .end local v9    # "u":Ljava/net/URL;
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    goto :goto_1

    .line 85
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .line 86
    .local v0, "e":Ljava/net/MalformedURLException;
    goto :goto_1
.end method

.method protected getFullHeaderValue([Lorg/apache/http/Header;)Ljava/lang/String;
    .locals 7
    .param p1, "headers"    # [Lorg/apache/http/Header;

    .prologue
    .line 105
    if-nez p1, :cond_0

    .line 106
    const-string/jumbo v6, ""

    .line 119
    :goto_0
    return-object v6

    .line 109
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v6, ""

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .local v1, "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x1

    .line 111
    .local v2, "first":Z
    move-object v0, p1

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v5, :cond_2

    aget-object v3, v0, v4

    .line 112
    .local v3, "hdr":Lorg/apache/http/Header;
    if-nez v2, :cond_1

    .line 113
    const-string/jumbo v6, ", "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    :cond_1
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    const/4 v2, 0x0

    .line 111
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 119
    .end local v3    # "hdr":Lorg/apache/http/Header;
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0
.end method

.method public getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;
    .locals 4
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "req"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 65
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->isRelativeRequest(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    const-string/jumbo v0, "%s%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->canonicalizeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getVariantKey(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/lang/String;
    .locals 16
    .param p1, "req"    # Lorg/apache/http/HttpRequest;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 149
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v12, "variantHeaderNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string/jumbo v14, "Vary"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lorg/apache/http/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/Header;
    array-length v9, v1

    .local v9, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    move v8, v7

    .end local v1    # "arr$":[Lorg/apache/http/Header;
    .end local v7    # "i$":I
    .end local v9    # "len$":I
    .local v8, "i$":I
    :goto_0
    if-ge v8, v9, :cond_1

    aget-object v13, v1, v8

    .line 151
    .local v13, "varyHdr":Lorg/apache/http/Header;
    invoke-interface {v13}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v2

    .local v2, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v10, v2

    .local v10, "len$":I
    const/4 v7, 0x0

    .end local v8    # "i$":I
    .restart local v7    # "i$":I
    :goto_1
    if-ge v7, v10, :cond_0

    aget-object v4, v2, v7

    .line 152
    .local v4, "elt":Lorg/apache/http/HeaderElement;
    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v12, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 150
    .end local v4    # "elt":Lorg/apache/http/HeaderElement;
    :cond_0
    add-int/lit8 v7, v8, 0x1

    move v8, v7

    .end local v7    # "i$":I
    .restart local v8    # "i$":I
    goto :goto_0

    .line 155
    .end local v2    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v10    # "len$":I
    .end local v13    # "varyHdr":Lorg/apache/http/Header;
    :cond_1
    invoke-static {v12}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 159
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v14, "{"

    invoke-direct {v3, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .local v3, "buf":Ljava/lang/StringBuilder;
    const/4 v5, 0x1

    .line 161
    .local v5, "first":Z
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .end local v8    # "i$":I
    .local v7, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 162
    .local v6, "headerName":Ljava/lang/String;
    if-nez v5, :cond_2

    .line 163
    const-string/jumbo v14, "&"

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    :cond_2
    sget-object v14, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v14}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v14

    invoke-static {v6, v14}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    const-string/jumbo v14, "="

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    move-object/from16 v0, p1

    invoke-interface {v0, v6}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getFullHeaderValue([Lorg/apache/http/Header;)Ljava/lang/String;

    move-result-object v14

    sget-object v15, Lorg/apache/http/Consts;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v15}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    const/4 v5, 0x0

    .line 170
    goto :goto_2

    .line 171
    .end local v6    # "headerName":Ljava/lang/String;
    :cond_3
    const-string/jumbo v14, "}"

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    return-object v14

    .line 172
    .end local v3    # "buf":Ljava/lang/StringBuilder;
    .end local v5    # "first":Z
    .end local v7    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v11

    .line 173
    .local v11, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v14, Ljava/lang/RuntimeException;

    const-string/jumbo v15, "couldn\'t encode to UTF-8"

    invoke-direct {v14, v15, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14
.end method

.method public getVariantURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/lang/String;
    .locals 2
    .param p1, "host"    # Lorg/apache/http/HttpHost;
    .param p2, "req"    # Lorg/apache/http/HttpRequest;
    .param p3, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 133
    invoke-virtual {p3}, Lorg/apache/http/client/cache/HttpCacheEntry;->hasVariants()Z

    move-result v0

    if-nez v0, :cond_0

    .line 134
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v0

    .line 136
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p2, p3}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getVariantKey(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;->getURI(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
