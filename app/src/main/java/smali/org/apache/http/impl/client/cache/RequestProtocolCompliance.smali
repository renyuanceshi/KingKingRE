.class Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;
.super Ljava/lang/Object;
.source "RequestProtocolCompliance.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/client/cache/RequestProtocolCompliance$1;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final disallowedWithNoCache:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final weakETagOnPutDeleteAllowed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 69
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "min-fresh"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "max-stale"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "max-age"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->disallowedWithNoCache:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->weakETagOnPutDeleteAllowed:Z

    .line 62
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0
    .param p1, "weakETagOnPutDeleteAllowed"    # Z

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-boolean p1, p0, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->weakETagOnPutDeleteAllowed:Z

    .line 67
    return-void
.end method

.method private add100ContinueHeaderIfMissing(Lorg/apache/http/HttpRequest;)V
    .locals 11
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 244
    const/4 v4, 0x0

    .line 246
    .local v4, "hasHeader":Z
    const-string/jumbo v9, "Expect"

    invoke-interface {p1, v9}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

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
    if-ge v6, v7, :cond_2

    aget-object v3, v0, v6

    .line 247
    .local v3, "h":Lorg/apache/http/Header;
    invoke-interface {v3}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v8, v1

    .local v8, "len$":I
    const/4 v5, 0x0

    .end local v6    # "i$":I
    .restart local v5    # "i$":I
    :goto_1
    if-ge v5, v8, :cond_1

    aget-object v2, v1, v5

    .line 248
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v9, "100-continue"

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 249
    const/4 v4, 0x1

    .line 247
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 246
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    :cond_1
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_0

    .line 254
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v8    # "len$":I
    :cond_2
    if-nez v4, :cond_3

    .line 255
    const-string/jumbo v9, "Expect"

    const-string/jumbo v10, "100-continue"

    invoke-interface {p1, v9, v10}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    :cond_3
    return-void
.end method

.method private addContentTypeHeaderIfMissing(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    .locals 2
    .param p1, "request"    # Lorg/apache/http/HttpEntityEnclosingRequest;

    .prologue
    .line 195
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_0

    .line 196
    invoke-interface {p1}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    check-cast v0, Lorg/apache/http/entity/AbstractHttpEntity;

    sget-object v1, Lorg/apache/http/entity/ContentType;->APPLICATION_OCTET_STREAM:Lorg/apache/http/entity/ContentType;

    invoke-virtual {v1}, Lorg/apache/http/entity/ContentType;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/entity/AbstractHttpEntity;->setContentType(Ljava/lang/String;)V

    .line 199
    :cond_0
    return-void
.end method

.method private buildHeaderFromElements(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/HeaderElement;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 148
    .local p1, "outElts":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/HeaderElement;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, ""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 149
    .local v3, "newHdr":Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 150
    .local v1, "first":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HeaderElement;

    .line 151
    .local v0, "elt":Lorg/apache/http/HeaderElement;
    if-nez v1, :cond_0

    .line 152
    const-string/jumbo v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 154
    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    .line 158
    .end local v0    # "elt":Lorg/apache/http/HeaderElement;
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private decrementOPTIONSMaxForwardsIfGreaterThen0(Lorg/apache/http/HttpRequest;)V
    .locals 4
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 167
    const-string/jumbo v2, "OPTIONS"

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 180
    :cond_0
    :goto_0
    return-void

    .line 171
    :cond_1
    const-string/jumbo v2, "Max-Forwards"

    invoke-interface {p1, v2}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 172
    .local v1, "maxForwards":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    .line 176
    const-string/jumbo v2, "Max-Forwards"

    invoke-interface {p1, v2}, Lorg/apache/http/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    .line 177
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 179
    .local v0, "currentMaxForwards":I
    const-string/jumbo v2, "Max-Forwards"

    add-int/lit8 v3, v0, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Lorg/apache/http/HttpRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private remove100ContinueHeaderIfExists(Lorg/apache/http/HttpRequest;)V
    .locals 14
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 216
    const/4 v6, 0x0

    .line 218
    .local v6, "hasHeader":Z
    const-string/jumbo v12, "Expect"

    invoke-interface {p1, v12}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v4

    .line 219
    .local v4, "expectHeaders":[Lorg/apache/http/Header;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 221
    .local v3, "expectElementsThatAreNot100Continue":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/HeaderElement;>;"
    move-object v0, v4

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v9, v0

    .local v9, "len$":I
    const/4 v7, 0x0

    .local v7, "i$":I
    move v8, v7

    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v7    # "i$":I
    .end local v9    # "len$":I
    .local v8, "i$":I
    :goto_0
    if-ge v8, v9, :cond_3

    aget-object v5, v0, v8

    .line 222
    .local v5, "h":Lorg/apache/http/Header;
    invoke-interface {v5}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v10, v1

    .local v10, "len$":I
    const/4 v7, 0x0

    .end local v8    # "i$":I
    .restart local v7    # "i$":I
    :goto_1
    if-ge v7, v10, :cond_1

    aget-object v2, v1, v7

    .line 223
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v12, "100-continue"

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 224
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 226
    :cond_0
    const/4 v6, 0x1

    goto :goto_2

    .line 230
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    :cond_1
    if-eqz v6, :cond_2

    .line 231
    invoke-interface {p1, v5}, Lorg/apache/http/HttpRequest;->removeHeader(Lorg/apache/http/Header;)V

    .line 232
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/HeaderElement;

    .line 233
    .restart local v2    # "elt":Lorg/apache/http/HeaderElement;
    new-instance v11, Lorg/apache/http/message/BasicHeader;

    const-string/jumbo v12, "Expect"

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v12, v13}, Lorg/apache/http/message/BasicHeader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    .local v11, "newHeader":Lorg/apache/http/message/BasicHeader;
    invoke-interface {p1, v11}, Lorg/apache/http/HttpRequest;->addHeader(Lorg/apache/http/Header;)V

    goto :goto_3

    .line 238
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v11    # "newHeader":Lorg/apache/http/message/BasicHeader;
    .local v7, "i$":I
    :cond_2
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "expectElementsThatAreNot100Continue":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/HeaderElement;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 221
    .restart local v3    # "expectElementsThatAreNot100Continue":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/HeaderElement;>;"
    add-int/lit8 v7, v8, 0x1

    move v8, v7

    .end local v7    # "i$":I
    .restart local v8    # "i$":I
    goto :goto_0

    .line 241
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v5    # "h":Lorg/apache/http/Header;
    .end local v8    # "i$":I
    .end local v10    # "len$":I
    :cond_3
    return-void
.end method

.method private requestContainsNoCacheDirectiveWithFieldName(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/cache/RequestProtocolError;
    .locals 10
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 366
    const-string/jumbo v8, "Cache-Control"

    invoke-interface {p1, v8}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

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

    .line 367
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

    .line 368
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v8, "no-cache"

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 370
    sget-object v8, Lorg/apache/http/impl/client/cache/RequestProtocolError;->NO_CACHE_DIRECTIVE_WITH_FIELD_NAME:Lorg/apache/http/impl/client/cache/RequestProtocolError;

    .line 374
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v4    # "i$":I
    .end local v7    # "len$":I
    :goto_2
    return-object v8

    .line 367
    .restart local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v2    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v3    # "h":Lorg/apache/http/Header;
    .restart local v4    # "i$":I
    .restart local v7    # "len$":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 366
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    :cond_1
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_0

    .line 374
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v7    # "len$":I
    :cond_2
    const/4 v8, 0x0

    goto :goto_2
.end method

.method private requestHasWeakETagAndRange(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/cache/RequestProtocolError;
    .locals 6
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    const/4 v4, 0x0

    .line 312
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    .line 313
    .local v1, "method":Ljava/lang/String;
    const-string/jumbo v5, "GET"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 332
    :cond_0
    :goto_0
    return-object v4

    .line 317
    :cond_1
    const-string/jumbo v5, "Range"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    .line 318
    .local v2, "range":Lorg/apache/http/Header;
    if-eqz v2, :cond_0

    .line 322
    const-string/jumbo v5, "If-Range"

    invoke-interface {p1, v5}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 323
    .local v0, "ifRange":Lorg/apache/http/Header;
    if-eqz v0, :cond_0

    .line 327
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 328
    .local v3, "val":Ljava/lang/String;
    const-string/jumbo v5, "W/"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 329
    sget-object v4, Lorg/apache/http/impl/client/cache/RequestProtocolError;->WEAK_ETAG_AND_RANGE_ERROR:Lorg/apache/http/impl/client/cache/RequestProtocolError;

    goto :goto_0
.end method

.method private requestHasWeekETagForPUTOrDELETEIfMatch(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/cache/RequestProtocolError;
    .locals 7
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    const/4 v5, 0x0

    .line 338
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v2

    .line 339
    .local v2, "method":Ljava/lang/String;
    const-string/jumbo v6, "PUT"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string/jumbo v6, "DELETE"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 362
    :cond_0
    :goto_0
    return-object v5

    .line 344
    :cond_1
    const-string/jumbo v6, "If-Match"

    invoke-interface {p1, v6}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 345
    .local v0, "ifMatch":Lorg/apache/http/Header;
    if-eqz v0, :cond_2

    .line 346
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 347
    .local v3, "val":Ljava/lang/String;
    const-string/jumbo v6, "W/"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 348
    sget-object v5, Lorg/apache/http/impl/client/cache/RequestProtocolError;->WEAK_ETAG_ON_PUTDELETE_METHOD_ERROR:Lorg/apache/http/impl/client/cache/RequestProtocolError;

    goto :goto_0

    .line 351
    .end local v3    # "val":Ljava/lang/String;
    :cond_2
    const-string/jumbo v6, "If-None-Match"

    invoke-interface {p1, v6}, Lorg/apache/http/HttpRequest;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v1

    .line 352
    .local v1, "ifNoneMatch":Lorg/apache/http/Header;
    if-eqz v1, :cond_0

    .line 356
    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 357
    .local v4, "val2":Ljava/lang/String;
    const-string/jumbo v6, "W/"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 358
    sget-object v5, Lorg/apache/http/impl/client/cache/RequestProtocolError;->WEAK_ETAG_ON_PUTDELETE_METHOD_ERROR:Lorg/apache/http/impl/client/cache/RequestProtocolError;

    goto :goto_0
.end method

.method private requestMustNotHaveEntity(Lorg/apache/http/HttpRequest;)Z
    .locals 2
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 162
    const-string/jumbo v0, "TRACE"

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private stripOtherFreshnessDirectivesWithNoCache(Lorg/apache/http/HttpRequest;)V
    .locals 12
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 128
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v8, "outElts":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/HeaderElement;>;"
    const/4 v9, 0x0

    .line 130
    .local v9, "shouldStrip":Z
    const-string/jumbo v10, "Cache-Control"

    invoke-interface {p1, v10}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

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
    if-ge v5, v6, :cond_3

    aget-object v3, v0, v5

    .line 131
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
    if-ge v4, v7, :cond_2

    aget-object v2, v1, v4

    .line 132
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    sget-object v10, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->disallowedWithNoCache:Ljava/util/List;

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 133
    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    :cond_0
    const-string/jumbo v10, "no-cache"

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 136
    const/4 v9, 0x1

    .line 131
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 130
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    :cond_2
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_0

    .line 140
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v7    # "len$":I
    :cond_3
    if-nez v9, :cond_4

    .line 145
    :goto_2
    return-void

    .line 143
    :cond_4
    const-string/jumbo v10, "Cache-Control"

    invoke-interface {p1, v10}, Lorg/apache/http/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    .line 144
    const-string/jumbo v10, "Cache-Control"

    invoke-direct {p0, v8}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->buildHeaderFromElements(Ljava/util/List;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {p1, v10, v11}, Lorg/apache/http/HttpRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method private verifyOPTIONSRequestWithBodyHasContentType(Lorg/apache/http/HttpRequest;)V
    .locals 2
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 183
    const-string/jumbo v0, "OPTIONS"

    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 192
    .end local p1    # "request":Lorg/apache/http/HttpRequest;
    :cond_0
    :goto_0
    return-void

    .line 187
    .restart local p1    # "request":Lorg/apache/http/HttpRequest;
    :cond_1
    instance-of v0, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_0

    .line 191
    check-cast p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p1    # "request":Lorg/apache/http/HttpRequest;
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->addContentTypeHeaderIfMissing(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    goto :goto_0
.end method

.method private verifyRequestWithExpectContinueFlagHas100continueHeader(Lorg/apache/http/HttpRequest;)V
    .locals 1
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 202
    instance-of v0, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_1

    move-object v0, p1

    .line 204
    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    invoke-interface {v0}, Lorg/apache/http/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    invoke-interface {v0}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 206
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->add100ContinueHeaderIfMissing(Lorg/apache/http/HttpRequest;)V

    .line 213
    :goto_0
    return-void

    .line 208
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->remove100ContinueHeaderIfExists(Lorg/apache/http/HttpRequest;)V

    goto :goto_0

    .line 211
    :cond_1
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->remove100ContinueHeaderIfExists(Lorg/apache/http/HttpRequest;)V

    goto :goto_0
.end method


# virtual methods
.method public getErrorForRequest(Lorg/apache/http/impl/client/cache/RequestProtocolError;)Lorg/apache/http/HttpResponse;
    .locals 5
    .param p1, "errorCheck"    # Lorg/apache/http/impl/client/cache/RequestProtocolError;

    .prologue
    const/16 v4, 0x190

    .line 284
    sget-object v0, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance$1;->$SwitchMap$org$apache$http$impl$client$cache$RequestProtocolError:[I

    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/RequestProtocolError;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 304
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "The request was compliant, therefore no error can be generated for it."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 286
    :pswitch_0
    new-instance v0, Lorg/apache/http/message/BasicHttpResponse;

    new-instance v1, Lorg/apache/http/message/BasicStatusLine;

    sget-object v2, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v3, 0x19b

    const-string/jumbo v4, ""

    invoke-direct {v1, v2, v3, v4}, Lorg/apache/http/message/BasicStatusLine;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/StatusLine;)V

    .line 299
    :goto_0
    return-object v0

    .line 290
    :pswitch_1
    new-instance v0, Lorg/apache/http/message/BasicHttpResponse;

    new-instance v1, Lorg/apache/http/message/BasicStatusLine;

    sget-object v2, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const-string/jumbo v3, "Weak eTag not compatible with byte range"

    invoke-direct {v1, v2, v4, v3}, Lorg/apache/http/message/BasicStatusLine;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/StatusLine;)V

    goto :goto_0

    .line 294
    :pswitch_2
    new-instance v0, Lorg/apache/http/message/BasicHttpResponse;

    new-instance v1, Lorg/apache/http/message/BasicStatusLine;

    sget-object v2, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const-string/jumbo v3, "Weak eTag not compatible with PUT or DELETE requests"

    invoke-direct {v1, v2, v4, v3}, Lorg/apache/http/message/BasicStatusLine;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/StatusLine;)V

    goto :goto_0

    .line 299
    :pswitch_3
    new-instance v0, Lorg/apache/http/message/BasicHttpResponse;

    new-instance v1, Lorg/apache/http/message/BasicStatusLine;

    sget-object v2, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const-string/jumbo v3, "No-Cache directive MUST NOT include a field name"

    invoke-direct {v1, v2, v4, v3}, Lorg/apache/http/message/BasicStatusLine;-><init>(Lorg/apache/http/ProtocolVersion;ILjava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/apache/http/message/BasicHttpResponse;-><init>(Lorg/apache/http/StatusLine;)V

    goto :goto_0

    .line 284
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public makeRequestCompliant(Lorg/apache/http/client/methods/HttpRequestWrapper;)V
    .locals 2
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpRequestWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->requestMustNotHaveEntity(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 113
    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/apache/http/HttpEntityEnclosingRequest;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 116
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->verifyRequestWithExpectContinueFlagHas100continueHeader(Lorg/apache/http/HttpRequest;)V

    .line 117
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->verifyOPTIONSRequestWithBodyHasContentType(Lorg/apache/http/HttpRequest;)V

    .line 118
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->decrementOPTIONSMaxForwardsIfGreaterThen0(Lorg/apache/http/HttpRequest;)V

    .line 119
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->stripOtherFreshnessDirectivesWithNoCache(Lorg/apache/http/HttpRequest;)V

    .line 121
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->requestVersionIsTooLow(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->requestMinorVersionIsTooHighMajorVersionsMatch(Lorg/apache/http/HttpRequest;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 123
    :cond_1
    sget-object v0, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-virtual {p1, v0}, Lorg/apache/http/client/methods/HttpRequestWrapper;->setProtocolVersion(Lorg/apache/http/ProtocolVersion;)V

    .line 125
    :cond_2
    return-void
.end method

.method public requestIsFatallyNonCompliant(Lorg/apache/http/HttpRequest;)Ljava/util/List;
    .locals 3
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/HttpRequest;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/impl/client/cache/RequestProtocolError;",
            ">;"
        }
    .end annotation

    .prologue
    .line 80
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v1, "theErrors":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/impl/client/cache/RequestProtocolError;>;"
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->requestHasWeakETagAndRange(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/cache/RequestProtocolError;

    move-result-object v0

    .line 83
    .local v0, "anError":Lorg/apache/http/impl/client/cache/RequestProtocolError;
    if-eqz v0, :cond_0

    .line 84
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    :cond_0
    iget-boolean v2, p0, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->weakETagOnPutDeleteAllowed:Z

    if-nez v2, :cond_1

    .line 88
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->requestHasWeekETagForPUTOrDELETEIfMatch(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/cache/RequestProtocolError;

    move-result-object v0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_1
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/RequestProtocolCompliance;->requestContainsNoCacheDirectiveWithFieldName(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/cache/RequestProtocolError;

    move-result-object v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    :cond_2
    return-object v1
.end method

.method protected requestMinorVersionIsTooHighMajorVersionsMatch(Lorg/apache/http/HttpRequest;)Z
    .locals 4
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    const/4 v1, 0x0

    .line 260
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    .line 261
    .local v0, "requestProtocol":Lorg/apache/http/ProtocolVersion;
    invoke-virtual {v0}, Lorg/apache/http/ProtocolVersion;->getMajor()I

    move-result v2

    sget-object v3, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-virtual {v3}, Lorg/apache/http/HttpVersion;->getMajor()I

    move-result v3

    if-eq v2, v3, :cond_1

    .line 269
    :cond_0
    :goto_0
    return v1

    .line 265
    :cond_1
    invoke-virtual {v0}, Lorg/apache/http/ProtocolVersion;->getMinor()I

    move-result v2

    sget-object v3, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-virtual {v3}, Lorg/apache/http/HttpVersion;->getMinor()I

    move-result v3

    if-le v2, v3, :cond_0

    .line 266
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected requestVersionIsTooLow(Lorg/apache/http/HttpRequest;)Z
    .locals 2
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 273
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    sget-object v1, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-virtual {v0, v1}, Lorg/apache/http/ProtocolVersion;->compareToVersion(Lorg/apache/http/ProtocolVersion;)I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
