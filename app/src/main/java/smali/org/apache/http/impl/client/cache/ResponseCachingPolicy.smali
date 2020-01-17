.class Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;
.super Ljava/lang/Object;
.source "ResponseCachingPolicy.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final AUTH_CACHEABLE_PARAMS:[Ljava/lang/String;

.field private static final cacheableStatuses:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final log:Lorg/apache/commons/logging/Log;

.field private final maxObjectSizeBytes:J

.field private final neverCache1_0ResponsesWithQueryString:Z

.field private final sharedCache:Z

.field private final uncacheableStatuses:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 56
    new-array v0, v6, [Ljava/lang/String;

    const-string/jumbo v1, "s-maxage"

    aput-object v1, v0, v3

    const-string/jumbo v1, "must-revalidate"

    aput-object v1, v0, v4

    const-string/jumbo v1, "public"

    aput-object v1, v0, v5

    sput-object v0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->AUTH_CACHEABLE_PARAMS:[Ljava/lang/String;

    .line 63
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Integer;

    const/16 v2, 0xc8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    const/16 v2, 0xcb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    const/16 v2, 0x12c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    const/16 v2, 0x12d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v6

    const/4 v2, 0x4

    const/16 v3, 0x19a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->cacheableStatuses:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(JZZZ)V
    .locals 5
    .param p1, "maxObjectSizeBytes"    # J
    .param p3, "sharedCache"    # Z
    .param p4, "neverCache1_0ResponsesWithQueryString"    # Z
    .param p5, "allow303Caching"    # Z

    .prologue
    const/16 v2, 0xce

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->log:Lorg/apache/commons/logging/Log;

    .line 85
    iput-wide p1, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->maxObjectSizeBytes:J

    .line 86
    iput-boolean p3, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->sharedCache:Z

    .line 87
    iput-boolean p4, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->neverCache1_0ResponsesWithQueryString:Z

    .line 88
    if-eqz p5, :cond_0

    .line 89
    new-instance v0, Ljava/util/HashSet;

    new-array v1, v4, [Ljava/lang/Integer;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->uncacheableStatuses:Ljava/util/Set;

    .line 95
    :goto_0
    return-void

    .line 92
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Integer;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    const/16 v2, 0x12f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->uncacheableStatuses:Ljava/util/Set;

    goto :goto_0
.end method

.method private expiresHeaderLessOrEqualToDateHeaderAndNoCacheControl(Lorg/apache/http/HttpResponse;)Z
    .locals 6
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v4, 0x0

    .line 276
    const-string/jumbo v5, "Cache-Control"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 289
    :cond_0
    :goto_0
    return v4

    .line 279
    :cond_1
    const-string/jumbo v5, "Expires"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v3

    .line 280
    .local v3, "expiresHdr":Lorg/apache/http/Header;
    const-string/jumbo v5, "Date"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 281
    .local v1, "dateHdr":Lorg/apache/http/Header;
    if-eqz v3, :cond_0

    if-eqz v1, :cond_0

    .line 284
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    .line 285
    .local v2, "expires":Ljava/util/Date;
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 286
    .local v0, "date":Ljava/util/Date;
    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    .line 289
    invoke-virtual {v2, v0}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v2, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    if-eqz v5, :cond_0

    :cond_2
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private from1_0Origin(Lorg/apache/http/HttpResponse;)Z
    .locals 8
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 293
    const-string/jumbo v6, "Via"

    invoke-interface {p1, v6}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v5

    .line 294
    .local v5, "via":Lorg/apache/http/Header;
    if-eqz v5, :cond_1

    .line 295
    invoke-interface {v5}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 296
    .local v1, "elt":Lorg/apache/http/HeaderElement;
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "\\s"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v4, v6, v7

    .line 297
    .local v4, "proto":Ljava/lang/String;
    const-string/jumbo v6, "/"

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 298
    const-string/jumbo v6, "HTTP/1.0"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 304
    .end local v0    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v1    # "elt":Lorg/apache/http/HeaderElement;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "proto":Ljava/lang/String;
    :goto_0
    return v6

    .line 300
    .restart local v0    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v1    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "proto":Ljava/lang/String;
    :cond_0
    const-string/jumbo v6, "1.0"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_0

    .line 304
    .end local v0    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v1    # "elt":Lorg/apache/http/HeaderElement;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "proto":Ljava/lang/String;
    :cond_1
    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/http/HttpVersion;->equals(Ljava/lang/Object;)Z

    move-result v6

    goto :goto_0
.end method

.method private requestProtocolGreaterThanAccepted(Lorg/apache/http/HttpRequest;)Z
    .locals 2
    .param p1, "req"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 308
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    sget-object v1, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-virtual {v0, v1}, Lorg/apache/http/ProtocolVersion;->compareToVersion(Lorg/apache/http/ProtocolVersion;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private unknownStatusCode(I)Z
    .locals 2
    .param p1, "status"    # I

    .prologue
    const/4 v0, 0x0

    .line 171
    const/16 v1, 0x64

    if-lt p1, v1, :cond_1

    const/16 v1, 0x65

    if-gt p1, v1, :cond_1

    .line 186
    :cond_0
    :goto_0
    return v0

    .line 174
    :cond_1
    const/16 v1, 0xc8

    if-lt p1, v1, :cond_2

    const/16 v1, 0xce

    if-le p1, v1, :cond_0

    .line 177
    :cond_2
    const/16 v1, 0x12c

    if-lt p1, v1, :cond_3

    const/16 v1, 0x133

    if-le p1, v1, :cond_0

    .line 180
    :cond_3
    const/16 v1, 0x190

    if-lt p1, v1, :cond_4

    const/16 v1, 0x1a1

    if-le p1, v1, :cond_0

    .line 183
    :cond_4
    const/16 v1, 0x1f4

    if-lt p1, v1, :cond_5

    const/16 v1, 0x1f9

    if-le p1, v1, :cond_0

    .line 186
    :cond_5
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method protected hasCacheControlParameterFrom(Lorg/apache/http/HttpMessage;[Ljava/lang/String;)Z
    .locals 14
    .param p1, "msg"    # Lorg/apache/http/HttpMessage;
    .param p2, "params"    # [Ljava/lang/String;

    .prologue
    .line 204
    const-string/jumbo v13, "Cache-Control"

    invoke-interface {p1, v13}, Lorg/apache/http/HttpMessage;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v3

    .line 205
    .local v3, "cacheControlHeaders":[Lorg/apache/http/Header;
    move-object v0, v3

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v9, v0

    .local v9, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    move v8, v6

    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v6    # "i$":I
    .end local v9    # "len$":I
    .local v8, "i$":I
    :goto_0
    if-ge v8, v9, :cond_3

    aget-object v5, v0, v8

    .line 206
    .local v5, "header":Lorg/apache/http/Header;
    invoke-interface {v5}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v10, v1

    .local v10, "len$":I
    const/4 v6, 0x0

    .end local v8    # "i$":I
    .restart local v6    # "i$":I
    move v7, v6

    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v6    # "i$":I
    .end local v10    # "len$":I
    .local v7, "i$":I
    :goto_1
    if-ge v7, v10, :cond_2

    aget-object v4, v1, v7

    .line 207
    .local v4, "elem":Lorg/apache/http/HeaderElement;
    move-object/from16 v2, p2

    .local v2, "arr$":[Ljava/lang/String;
    array-length v11, v2

    .local v11, "len$":I
    const/4 v6, 0x0

    .end local v7    # "i$":I
    .restart local v6    # "i$":I
    :goto_2
    if-ge v6, v11, :cond_1

    aget-object v12, v2, v6

    .line 208
    .local v12, "param":Ljava/lang/String;
    invoke-interface {v4}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 209
    const/4 v13, 0x1

    .line 214
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v4    # "elem":Lorg/apache/http/HeaderElement;
    .end local v5    # "header":Lorg/apache/http/Header;
    .end local v6    # "i$":I
    .end local v11    # "len$":I
    .end local v12    # "param":Ljava/lang/String;
    :goto_3
    return v13

    .line 207
    .restart local v2    # "arr$":[Ljava/lang/String;
    .restart local v4    # "elem":Lorg/apache/http/HeaderElement;
    .restart local v5    # "header":Lorg/apache/http/Header;
    .restart local v6    # "i$":I
    .restart local v11    # "len$":I
    .restart local v12    # "param":Ljava/lang/String;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 206
    .end local v12    # "param":Ljava/lang/String;
    :cond_1
    add-int/lit8 v6, v7, 0x1

    move v7, v6

    .end local v6    # "i$":I
    .restart local v7    # "i$":I
    goto :goto_1

    .line 205
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v4    # "elem":Lorg/apache/http/HeaderElement;
    .end local v11    # "len$":I
    :cond_2
    add-int/lit8 v6, v8, 0x1

    .end local v7    # "i$":I
    .restart local v6    # "i$":I
    move v8, v6

    .end local v6    # "i$":I
    .restart local v8    # "i$":I
    goto :goto_0

    .line 214
    .end local v5    # "header":Lorg/apache/http/Header;
    :cond_3
    const/4 v13, 0x0

    goto :goto_3
.end method

.method protected isExplicitlyCacheable(Lorg/apache/http/HttpResponse;)Z
    .locals 4
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v1, 0x1

    .line 218
    const-string/jumbo v2, "Expires"

    invoke-interface {p1, v2}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 226
    :goto_0
    return v1

    .line 221
    :cond_0
    const/4 v2, 0x5

    new-array v0, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "max-age"

    aput-object v3, v0, v2

    const-string/jumbo v2, "s-maxage"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "must-revalidate"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "proxy-revalidate"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "public"

    aput-object v2, v0, v1

    .line 226
    .local v0, "cacheableParams":[Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->hasCacheControlParameterFrom(Lorg/apache/http/HttpMessage;[Ljava/lang/String;)Z

    move-result v1

    goto :goto_0
.end method

.method protected isExplicitlyNonCacheable(Lorg/apache/http/HttpResponse;)Z
    .locals 11
    .param p1, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 190
    const-string/jumbo v9, "Cache-Control"

    invoke-interface {p1, v9}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v2

    .line 191
    .local v2, "cacheControlHeaders":[Lorg/apache/http/Header;
    move-object v0, v2

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    move v6, v5

    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    .local v6, "i$":I
    :goto_0
    if-ge v6, v7, :cond_3

    aget-object v4, v0, v6

    .line 192
    .local v4, "header":Lorg/apache/http/Header;
    invoke-interface {v4}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v8, v1

    .local v8, "len$":I
    const/4 v5, 0x0

    .end local v6    # "i$":I
    .restart local v5    # "i$":I
    :goto_1
    if-ge v5, v8, :cond_2

    aget-object v3, v1, v5

    .line 193
    .local v3, "elem":Lorg/apache/http/HeaderElement;
    const-string/jumbo v9, "no-store"

    invoke-interface {v3}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    const-string/jumbo v9, "no-cache"

    invoke-interface {v3}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    iget-boolean v9, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->sharedCache:Z

    if-eqz v9, :cond_1

    const-string/jumbo v9, "private"

    invoke-interface {v3}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 196
    :cond_0
    const/4 v9, 0x1

    .line 200
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v3    # "elem":Lorg/apache/http/HeaderElement;
    .end local v4    # "header":Lorg/apache/http/Header;
    .end local v5    # "i$":I
    .end local v8    # "len$":I
    :goto_2
    return v9

    .line 192
    .restart local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v3    # "elem":Lorg/apache/http/HeaderElement;
    .restart local v4    # "header":Lorg/apache/http/Header;
    .restart local v5    # "i$":I
    .restart local v8    # "len$":I
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 191
    .end local v3    # "elem":Lorg/apache/http/HeaderElement;
    :cond_2
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_0

    .line 200
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v4    # "header":Lorg/apache/http/Header;
    .end local v8    # "len$":I
    :cond_3
    const/4 v9, 0x0

    goto :goto_2
.end method

.method public isResponseCacheable(Ljava/lang/String;Lorg/apache/http/HttpResponse;)Z
    .locals 22
    .param p1, "httpMethod"    # Ljava/lang/String;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 105
    const/4 v5, 0x0

    .line 107
    .local v5, "cacheable":Z
    const-string/jumbo v18, "GET"

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_0

    .line 108
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v18, v0

    const-string/jumbo v19, "Response was not cacheable."

    invoke-interface/range {v18 .. v19}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 109
    const/16 v18, 0x0

    .line 167
    :goto_0
    return v18

    .line 112
    :cond_0
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v16

    .line 113
    .local v16, "status":I
    sget-object v18, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->cacheableStatuses:Ljava/util/Set;

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 115
    const/4 v5, 0x1

    .line 124
    :cond_1
    const-string/jumbo v18, "Content-Length"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v6

    .line 125
    .local v6, "contentLength":Lorg/apache/http/Header;
    if-eqz v6, :cond_4

    .line 126
    invoke-interface {v6}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 127
    .local v7, "contentLengthValue":I
    int-to-long v0, v7

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->maxObjectSizeBytes:J

    move-wide/from16 v20, v0

    cmp-long v18, v18, v20

    if-lez v18, :cond_4

    .line 128
    const/16 v18, 0x0

    goto :goto_0

    .line 116
    .end local v6    # "contentLength":Lorg/apache/http/Header;
    .end local v7    # "contentLengthValue":I
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->uncacheableStatuses:Ljava/util/Set;

    move-object/from16 v18, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_3

    .line 117
    const/16 v18, 0x0

    goto :goto_0

    .line 118
    :cond_3
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->unknownStatusCode(I)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 121
    const/16 v18, 0x0

    goto :goto_0

    .line 132
    .restart local v6    # "contentLength":Lorg/apache/http/Header;
    :cond_4
    const-string/jumbo v18, "Age"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v2

    .line 134
    .local v2, "ageHeaders":[Lorg/apache/http/Header;
    array-length v0, v2

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_5

    .line 135
    const/16 v18, 0x0

    goto :goto_0

    .line 138
    :cond_5
    const-string/jumbo v18, "Expires"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v11

    .line 140
    .local v11, "expiresHeaders":[Lorg/apache/http/Header;
    array-length v0, v11

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_6

    .line 141
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 144
    :cond_6
    const-string/jumbo v18, "Date"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v9

    .line 146
    .local v9, "dateHeaders":[Lorg/apache/http/Header;
    array-length v0, v9

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_7

    .line 147
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 150
    :cond_7
    const/16 v18, 0x0

    aget-object v18, v9, v18

    invoke-interface/range {v18 .. v18}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v8

    .line 151
    .local v8, "date":Ljava/util/Date;
    if-nez v8, :cond_8

    .line 152
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 155
    :cond_8
    const-string/jumbo v18, "Vary"

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v3

    .local v3, "arr$":[Lorg/apache/http/Header;
    array-length v14, v3

    .local v14, "len$":I
    const/4 v12, 0x0

    .local v12, "i$":I
    move v13, v12

    .end local v3    # "arr$":[Lorg/apache/http/Header;
    .end local v12    # "i$":I
    .end local v14    # "len$":I
    .local v13, "i$":I
    :goto_1
    if-ge v13, v14, :cond_b

    aget-object v17, v3, v13

    .line 156
    .local v17, "varyHdr":Lorg/apache/http/Header;
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v4

    .local v4, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v15, v4

    .local v15, "len$":I
    const/4 v12, 0x0

    .end local v13    # "i$":I
    .restart local v12    # "i$":I
    :goto_2
    if-ge v12, v15, :cond_a

    aget-object v10, v4, v12

    .line 157
    .local v10, "elem":Lorg/apache/http/HeaderElement;
    const-string/jumbo v18, "*"

    invoke-interface {v10}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_9

    .line 158
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 156
    :cond_9
    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 155
    .end local v10    # "elem":Lorg/apache/http/HeaderElement;
    :cond_a
    add-int/lit8 v12, v13, 0x1

    move v13, v12

    .end local v12    # "i$":I
    .restart local v13    # "i$":I
    goto :goto_1

    .line 163
    .end local v4    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v15    # "len$":I
    .end local v17    # "varyHdr":Lorg/apache/http/Header;
    :cond_b
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->isExplicitlyNonCacheable(Lorg/apache/http/HttpResponse;)Z

    move-result v18

    if-eqz v18, :cond_c

    .line 164
    const/16 v18, 0x0

    goto/16 :goto_0

    .line 167
    :cond_c
    if-nez v5, :cond_d

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->isExplicitlyCacheable(Lorg/apache/http/HttpResponse;)Z

    move-result v18

    if-eqz v18, :cond_e

    :cond_d
    const/16 v18, 0x1

    goto/16 :goto_0

    :cond_e
    const/16 v18, 0x0

    goto/16 :goto_0
.end method

.method public isResponseCacheable(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;)Z
    .locals 6
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v3, 0x0

    .line 238
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->requestProtocolGreaterThanAccepted(Lorg/apache/http/HttpRequest;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 239
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Response was not cacheable."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 271
    :cond_0
    :goto_0
    return v3

    .line 243
    :cond_1
    const/4 v4, 0x1

    new-array v2, v4, [Ljava/lang/String;

    const-string/jumbo v4, "no-store"

    aput-object v4, v2, v3

    .line 244
    .local v2, "uncacheableRequestDirectives":[Ljava/lang/String;
    invoke-virtual {p0, p1, v2}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->hasCacheControlParameterFrom(Lorg/apache/http/HttpMessage;[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 248
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "?"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 249
    iget-boolean v4, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->neverCache1_0ResponsesWithQueryString:Z

    if-eqz v4, :cond_2

    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->from1_0Origin(Lorg/apache/http/HttpResponse;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 250
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Response was not cacheable as it had a query string."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_0

    .line 252
    :cond_2
    invoke-virtual {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->isExplicitlyCacheable(Lorg/apache/http/HttpResponse;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 253
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Response was not cacheable as it is missing explicit caching headers."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_0

    .line 258
    :cond_3
    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->expiresHeaderLessOrEqualToDateHeaderAndNoCacheControl(Lorg/apache/http/HttpResponse;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 262
    iget-boolean v4, p0, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->sharedCache:Z

    if-eqz v4, :cond_4

    .line 263
    const-string/jumbo v4, "Authorization"

    invoke-interface {p1, v4}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    .line 264
    .local v0, "authNHeaders":[Lorg/apache/http/Header;
    if-eqz v0, :cond_4

    array-length v4, v0

    if-lez v4, :cond_4

    sget-object v4, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->AUTH_CACHEABLE_PARAMS:[Ljava/lang/String;

    invoke-virtual {p0, p2, v4}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->hasCacheControlParameterFrom(Lorg/apache/http/HttpMessage;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 270
    .end local v0    # "authNHeaders":[Lorg/apache/http/Header;
    :cond_4
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 271
    .local v1, "method":Ljava/lang/String;
    invoke-virtual {p0, v1, p2}, Lorg/apache/http/impl/client/cache/ResponseCachingPolicy;->isResponseCacheable(Ljava/lang/String;Lorg/apache/http/HttpResponse;)Z

    move-result v3

    goto :goto_0
.end method
