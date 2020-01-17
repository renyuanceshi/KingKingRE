.class Lorg/apache/http/impl/client/cache/CacheValidityPolicy;
.super Ljava/lang/Object;
.source "CacheValidityPolicy.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field public static final MAX_AGE:J = 0x80000000L


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method private mayReturnStaleIfError([Lorg/apache/http/Header;J)Z
    .locals 12
    .param p1, "headers"    # [Lorg/apache/http/Header;
    .param p2, "stalenessSecs"    # J

    .prologue
    .line 155
    const/4 v8, 0x0

    .line 156
    .local v8, "result":Z
    move-object v0, p1

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

    .line 157
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
    if-ge v4, v7, :cond_0

    aget-object v2, v1, v4

    .line 158
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v10, "stale-if-error"

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 160
    :try_start_0
    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    .line 161
    .local v9, "staleIfErrorSecs":I
    int-to-long v10, v9

    cmp-long v10, p2, v10

    if-gtz v10, :cond_1

    .line 162
    const/4 v8, 0x1

    .line 156
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v9    # "staleIfErrorSecs":I
    :cond_0
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_0

    .line 165
    .end local v5    # "i$":I
    .restart local v2    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v4    # "i$":I
    :catch_0
    move-exception v10

    .line 157
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 171
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v4    # "i$":I
    .end local v7    # "len$":I
    .restart local v5    # "i$":I
    :cond_2
    return v8
.end method


# virtual methods
.method protected contentLengthHeaderMatchesActualLength(Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 4
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 217
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->hasContentLengthHeader(Lorg/apache/http/client/cache/HttpCacheEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getContentLengthValue(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v0

    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/client/cache/Resource;->length()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getAgeValue(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    .locals 12
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 233
    const-wide/16 v0, 0x0

    .line 234
    .local v0, "ageValue":J
    const-string/jumbo v9, "Age"

    invoke-virtual {p1, v9}, Lorg/apache/http/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v2

    .local v2, "arr$":[Lorg/apache/http/Header;
    array-length v7, v2

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_0
    if-ge v6, v7, :cond_2

    aget-object v3, v2, v6

    .line 237
    .local v3, "hdr":Lorg/apache/http/Header;
    :try_start_0
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 238
    .local v4, "hdrAge":J
    const-wide/16 v10, 0x0

    cmp-long v9, v4, v10

    if-gez v9, :cond_0

    .line 239
    const-wide v4, 0x80000000L

    .line 244
    :cond_0
    :goto_1
    cmp-long v9, v4, v0

    if-lez v9, :cond_1

    move-wide v0, v4

    .line 234
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 241
    .end local v4    # "hdrAge":J
    :catch_0
    move-exception v8

    .line 242
    .local v8, "nfe":Ljava/lang/NumberFormatException;
    const-wide v4, 0x80000000L

    .restart local v4    # "hdrAge":J
    goto :goto_1

    .line 246
    .end local v3    # "hdr":Lorg/apache/http/Header;
    .end local v4    # "hdrAge":J
    .end local v8    # "nfe":Ljava/lang/NumberFormatException;
    :cond_2
    return-wide v0
.end method

.method protected getApparentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    .locals 10
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    const-wide/16 v4, 0x0

    .line 221
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 222
    .local v0, "dateValue":Ljava/util/Date;
    if-nez v0, :cond_1

    .line 223
    const-wide v4, 0x80000000L

    .line 229
    :cond_0
    :goto_0
    return-wide v4

    .line 225
    :cond_1
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResponseDate()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v2, v6, v8

    .line 226
    .local v2, "diff":J
    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    .line 229
    const-wide/16 v4, 0x3e8

    div-long v4, v2, v4

    goto :goto_0
.end method

.method protected getContentLengthValue(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    .locals 5
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    const-wide/16 v2, -0x1

    .line 193
    const-string/jumbo v4, "Content-Length"

    invoke-virtual {p1, v4}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 194
    .local v0, "cl":Lorg/apache/http/Header;
    if-nez v0, :cond_0

    .line 201
    :goto_0
    return-wide v2

    .line 199
    :cond_0
    :try_start_0
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    goto :goto_0

    .line 200
    :catch_0
    move-exception v1

    .line 201
    .local v1, "ex":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method protected getCorrectedInitialAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    .locals 4
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 261
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCorrectedReceivedAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v0

    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getResponseDelaySecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method protected getCorrectedReceivedAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    .locals 5
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 250
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getApparentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v2

    .line 251
    .local v2, "apparentAge":J
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getAgeValue(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v0

    .line 252
    .local v0, "ageValue":J
    cmp-long v4, v2, v0

    if-lez v4, :cond_0

    .end local v2    # "apparentAge":J
    :goto_0
    return-wide v2

    .restart local v2    # "apparentAge":J
    :cond_0
    move-wide v2, v0

    goto :goto_0
.end method

.method public getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J
    .locals 4
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCorrectedInitialAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v0

    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getResidentTimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method protected getDateValue(Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/util/Date;
    .locals 1
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 181
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getDate()Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method protected getExpirationDate(Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/util/Date;
    .locals 2
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 291
    const-string/jumbo v1, "Expires"

    invoke-virtual {p1, v1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 292
    .local v0, "expiresHeader":Lorg/apache/http/Header;
    if-nez v0, :cond_0

    .line 293
    const/4 v1, 0x0

    .line 295
    :goto_0
    return-object v1

    :cond_0
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    goto :goto_0
.end method

.method public getFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    .locals 10
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    const-wide/16 v6, 0x0

    .line 57
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getMaxAge(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v4

    .line 58
    .local v4, "maxage":J
    const-wide/16 v8, -0x1

    cmp-long v8, v4, v8

    if-lez v8, :cond_0

    .line 72
    .end local v4    # "maxage":J
    :goto_0
    return-wide v4

    .line 62
    .restart local v4    # "maxage":J
    :cond_0
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 63
    .local v0, "dateValue":Ljava/util/Date;
    if-nez v0, :cond_1

    move-wide v4, v6

    .line 64
    goto :goto_0

    .line 67
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getExpirationDate(Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/util/Date;

    move-result-object v1

    .line 68
    .local v1, "expiry":Ljava/util/Date;
    if-nez v1, :cond_2

    move-wide v4, v6

    .line 69
    goto :goto_0

    .line 71
    :cond_2
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v2, v6, v8

    .line 72
    .local v2, "diff":J
    const-wide/16 v6, 0x3e8

    div-long v4, v2, v6

    goto :goto_0
.end method

.method public getHeuristicFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;FJ)J
    .locals 11
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "coefficient"    # F
    .param p3, "defaultLifetime"    # J

    .prologue
    const-wide/16 v4, 0x0

    .line 99
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getDate()Ljava/util/Date;

    move-result-object v0

    .line 100
    .local v0, "dateValue":Ljava/util/Date;
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getLastModifiedValue(Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/util/Date;

    move-result-object v1

    .line 102
    .local v1, "lastModifiedValue":Ljava/util/Date;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 103
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long v2, v6, v8

    .line 104
    .local v2, "diff":J
    cmp-long v6, v2, v4

    if-gez v6, :cond_1

    move-wide p3, v4

    .line 110
    .end local v2    # "diff":J
    .end local p3    # "defaultLifetime":J
    :cond_0
    :goto_0
    return-wide p3

    .line 107
    .restart local v2    # "diff":J
    .restart local p3    # "defaultLifetime":J
    :cond_1
    const-wide/16 v4, 0x3e8

    div-long v4, v2, v4

    long-to-float v4, v4

    mul-float/2addr v4, p2

    float-to-long p3, v4

    goto :goto_0
.end method

.method protected getLastModifiedValue(Lorg/apache/http/client/cache/HttpCacheEntry;)Ljava/util/Date;
    .locals 2
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 185
    const-string/jumbo v1, "Last-Modified"

    invoke-virtual {p1, v1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 186
    .local v0, "dateHdr":Lorg/apache/http/Header;
    if-nez v0, :cond_0

    .line 187
    const/4 v1, 0x0

    .line 189
    :goto_0
    return-object v1

    :cond_0
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    goto :goto_0
.end method

.method protected getMaxAge(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    .locals 18
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 270
    const-wide/16 v12, -0x1

    .line 271
    .local v12, "maxage":J
    const-string/jumbo v15, "Cache-Control"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/apache/http/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v2

    .local v2, "arr$":[Lorg/apache/http/Header;
    array-length v10, v2

    .local v10, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    move v9, v8

    .end local v2    # "arr$":[Lorg/apache/http/Header;
    .end local v8    # "i$":I
    .end local v10    # "len$":I
    .local v9, "i$":I
    :goto_0
    if-ge v9, v10, :cond_4

    aget-object v7, v2, v9

    .line 272
    .local v7, "hdr":Lorg/apache/http/Header;
    invoke-interface {v7}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v3

    .local v3, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v11, v3

    .local v11, "len$":I
    const/4 v8, 0x0

    .end local v9    # "i$":I
    .restart local v8    # "i$":I
    :goto_1
    if-ge v8, v11, :cond_3

    aget-object v6, v3, v8

    .line 273
    .local v6, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v15, "max-age"

    invoke-interface {v6}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    const-string/jumbo v15, "s-maxage"

    invoke-interface {v6}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 276
    :cond_0
    :try_start_0
    invoke-interface {v6}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 277
    .local v4, "currMaxAge":J
    const-wide/16 v16, -0x1

    cmp-long v15, v12, v16

    if-eqz v15, :cond_1

    cmp-long v15, v4, v12

    if-gez v15, :cond_2

    .line 278
    :cond_1
    move-wide v12, v4

    .line 272
    .end local v4    # "currMaxAge":J
    :cond_2
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 280
    :catch_0
    move-exception v14

    .line 282
    .local v14, "nfe":Ljava/lang/NumberFormatException;
    const-wide/16 v12, 0x0

    goto :goto_2

    .line 271
    .end local v6    # "elt":Lorg/apache/http/HeaderElement;
    .end local v14    # "nfe":Ljava/lang/NumberFormatException;
    :cond_3
    add-int/lit8 v8, v9, 0x1

    move v9, v8

    .end local v8    # "i$":I
    .restart local v9    # "i$":I
    goto :goto_0

    .line 287
    .end local v3    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v7    # "hdr":Lorg/apache/http/Header;
    .end local v11    # "len$":I
    :cond_4
    return-wide v12
.end method

.method protected getResidentTimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J
    .locals 6
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 265
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResponseDate()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 266
    .local v0, "diff":J
    const-wide/16 v2, 0x3e8

    div-long v2, v0, v2

    return-wide v2
.end method

.method protected getResponseDelaySecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J
    .locals 6
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 256
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResponseDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getRequestDate()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 257
    .local v0, "diff":J
    const-wide/16 v2, 0x3e8

    div-long v2, v0, v2

    return-wide v2
.end method

.method public getStalenessSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J
    .locals 6
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 311
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    .line 312
    .local v0, "age":J
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v2

    .line 313
    .local v2, "freshness":J
    cmp-long v4, v0, v2

    if-gtz v4, :cond_0

    .line 314
    const-wide/16 v4, 0x0

    .line 316
    :goto_0
    return-wide v4

    :cond_0
    sub-long v4, v0, v2

    goto :goto_0
.end method

.method public hasCacheControlDirective(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;)Z
    .locals 9
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "directive"    # Ljava/lang/String;

    .prologue
    .line 300
    const-string/jumbo v8, "Cache-Control"

    invoke-virtual {p1, v8}, Lorg/apache/http/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

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

    .line 301
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

    .line 302
    .local v2, "elt":Lorg/apache/http/HeaderElement;
    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 303
    const/4 v8, 0x1

    .line 307
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v4    # "i$":I
    .end local v7    # "len$":I
    :goto_2
    return v8

    .line 301
    .restart local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v2    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v3    # "h":Lorg/apache/http/Header;
    .restart local v4    # "i$":I
    .restart local v7    # "len$":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 300
    .end local v2    # "elt":Lorg/apache/http/HeaderElement;
    :cond_1
    add-int/lit8 v4, v5, 0x1

    move v5, v4

    .end local v4    # "i$":I
    .restart local v5    # "i$":I
    goto :goto_0

    .line 307
    .end local v1    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v3    # "h":Lorg/apache/http/Header;
    .end local v7    # "len$":I
    :cond_2
    const/4 v8, 0x0

    goto :goto_2
.end method

.method protected hasContentLengthHeader(Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 1
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 206
    const-string/jumbo v0, "Content-Length"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isResponseFresh(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 4
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 76
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isResponseHeuristicallyFresh(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;FJ)Z
    .locals 4
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;
    .param p3, "coefficient"    # F
    .param p4, "defaultLifetime"    # J

    .prologue
    .line 94
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getCurrentAgeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    invoke-virtual {p0, p1, p3, p4, p5}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getHeuristicFreshnessLifetimeSecs(Lorg/apache/http/client/cache/HttpCacheEntry;FJ)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRevalidatable(Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 1
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 114
    const-string/jumbo v0, "ETag"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "Last-Modified"

    invoke-virtual {p1, v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public mayReturnStaleIfError(Lorg/apache/http/HttpRequest;Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 3
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p3, "now"    # Ljava/util/Date;

    .prologue
    .line 147
    invoke-virtual {p0, p2, p3}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J

    move-result-wide v0

    .line 148
    .local v0, "stalenessSecs":J
    const-string/jumbo v2, "Cache-Control"

    invoke-interface {p1, v2}, Lorg/apache/http/HttpRequest;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v2

    invoke-direct {p0, v2, v0, v1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mayReturnStaleIfError([Lorg/apache/http/Header;J)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "Cache-Control"

    invoke-virtual {p2, v2}, Lorg/apache/http/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v2

    invoke-direct {p0, v2, v0, v1}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->mayReturnStaleIfError([Lorg/apache/http/Header;J)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public mayReturnStaleWhileRevalidating(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)Z
    .locals 14
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .param p2, "now"    # Ljava/util/Date;

    .prologue
    .line 127
    const-string/jumbo v9, "Cache-Control"

    invoke-virtual {p1, v9}, Lorg/apache/http/client/cache/HttpCacheEntry;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v1

    .local v1, "arr$":[Lorg/apache/http/Header;
    array-length v7, v1

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    move v6, v5

    .end local v1    # "arr$":[Lorg/apache/http/Header;
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    .local v6, "i$":I
    :goto_0
    if-ge v6, v7, :cond_2

    aget-object v4, v1, v6

    .line 128
    .local v4, "h":Lorg/apache/http/Header;
    invoke-interface {v4}, Lorg/apache/http/Header;->getElements()[Lorg/apache/http/HeaderElement;

    move-result-object v2

    .local v2, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v8, v2

    .local v8, "len$":I
    const/4 v5, 0x0

    .end local v6    # "i$":I
    .restart local v5    # "i$":I
    :goto_1
    if-ge v5, v8, :cond_1

    aget-object v3, v2, v5

    .line 129
    .local v3, "elt":Lorg/apache/http/HeaderElement;
    const-string/jumbo v9, "stale-while-revalidate"

    invoke-interface {v3}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 131
    :try_start_0
    invoke-interface {v3}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 132
    .local v0, "allowedStalenessLifetime":I
    invoke-virtual/range {p0 .. p2}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->getStalenessSecs(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/util/Date;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v10

    int-to-long v12, v0

    cmp-long v9, v10, v12

    if-gtz v9, :cond_0

    .line 133
    const/4 v9, 0x1

    .line 142
    .end local v0    # "allowedStalenessLifetime":I
    .end local v2    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v3    # "elt":Lorg/apache/http/HeaderElement;
    .end local v4    # "h":Lorg/apache/http/Header;
    .end local v5    # "i$":I
    .end local v8    # "len$":I
    :goto_2
    return v9

    .line 135
    .restart local v2    # "arr$":[Lorg/apache/http/HeaderElement;
    .restart local v3    # "elt":Lorg/apache/http/HeaderElement;
    .restart local v4    # "h":Lorg/apache/http/Header;
    .restart local v5    # "i$":I
    .restart local v8    # "len$":I
    :catch_0
    move-exception v9

    .line 128
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 127
    .end local v3    # "elt":Lorg/apache/http/HeaderElement;
    :cond_1
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_0

    .line 142
    .end local v2    # "arr$":[Lorg/apache/http/HeaderElement;
    .end local v4    # "h":Lorg/apache/http/Header;
    .end local v8    # "len$":I
    :cond_2
    const/4 v9, 0x0

    goto :goto_2
.end method

.method public mustRevalidate(Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 1
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 119
    const-string/jumbo v0, "must-revalidate"

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->hasCacheControlDirective(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public proxyRevalidate(Lorg/apache/http/client/cache/HttpCacheEntry;)Z
    .locals 1
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 123
    const-string/jumbo v0, "proxy-revalidate"

    invoke-virtual {p0, p1, v0}, Lorg/apache/http/impl/client/cache/CacheValidityPolicy;->hasCacheControlDirective(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
