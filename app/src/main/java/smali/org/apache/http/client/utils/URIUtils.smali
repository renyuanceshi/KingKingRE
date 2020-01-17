.class public Lorg/apache/http/client/utils/URIUtils;
.super Ljava/lang/Object;
.source "URIUtils.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 425
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 426
    return-void
.end method

.method public static createURI(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/net/URI;
    .locals 3
    .param p0, "scheme"    # Ljava/lang/String;
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "path"    # Ljava/lang/String;
    .param p4, "query"    # Ljava/lang/String;
    .param p5, "fragment"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v0, "buffer":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_1

    .line 87
    if-eqz p0, :cond_0

    .line 88
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    const-string/jumbo v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    if-lez p2, :cond_1

    .line 93
    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    :cond_1
    if-eqz p3, :cond_2

    const-string/jumbo v1, "/"

    invoke-virtual {p3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 98
    :cond_2
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 100
    :cond_3
    if-eqz p3, :cond_4

    .line 101
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    :cond_4
    if-eqz p4, :cond_5

    .line 104
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 105
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_5
    if-eqz p5, :cond_6

    .line 108
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_6
    new-instance v1, Ljava/net/URI;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method public static extractHost(Ljava/net/URI;)Lorg/apache/http/HttpHost;
    .locals 11
    .param p0, "uri"    # Ljava/net/URI;

    .prologue
    .line 324
    if-nez p0, :cond_1

    .line 325
    const/4 v8, 0x0

    .line 373
    :cond_0
    :goto_0
    return-object v8

    .line 327
    :cond_1
    const/4 v8, 0x0

    .line 328
    .local v8, "target":Lorg/apache/http/HttpHost;
    invoke-virtual {p0}, Ljava/net/URI;->isAbsolute()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 329
    invoke-virtual {p0}, Ljava/net/URI;->getPort()I

    move-result v5

    .line 330
    .local v5, "port":I
    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 331
    .local v2, "host":Ljava/lang/String;
    if-nez v2, :cond_6

    .line 333
    invoke-virtual {p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v2

    .line 334
    if-eqz v2, :cond_6

    .line 336
    const/16 v9, 0x40

    invoke-virtual {v2, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 337
    .local v0, "at":I
    if-ltz v0, :cond_2

    .line 338
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v10, v0, 0x1

    if-le v9, v10, :cond_3

    .line 339
    add-int/lit8 v9, v0, 0x1

    invoke-virtual {v2, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 345
    :cond_2
    :goto_1
    if-eqz v2, :cond_6

    .line 346
    const/16 v9, 0x3a

    invoke-virtual {v2, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 347
    .local v1, "colon":I
    if-ltz v1, :cond_6

    .line 348
    add-int/lit8 v6, v1, 0x1

    .line 349
    .local v6, "pos":I
    const/4 v4, 0x0

    .line 350
    .local v4, "len":I
    move v3, v6

    .local v3, "i":I
    :goto_2
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v3, v9, :cond_4

    .line 351
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isDigit(C)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 352
    add-int/lit8 v4, v4, 0x1

    .line 350
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 341
    .end local v1    # "colon":I
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v6    # "pos":I
    :cond_3
    const/4 v2, 0x0

    goto :goto_1

    .line 357
    .restart local v1    # "colon":I
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    .restart local v6    # "pos":I
    :cond_4
    if-lez v4, :cond_5

    .line 359
    add-int v9, v6, v4

    :try_start_0
    invoke-virtual {v2, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 363
    :cond_5
    :goto_3
    const/4 v9, 0x0

    invoke-virtual {v2, v9, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 368
    .end local v0    # "at":I
    .end local v1    # "colon":I
    .end local v3    # "i":I
    .end local v4    # "len":I
    .end local v6    # "pos":I
    :cond_6
    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v7

    .line 369
    .local v7, "scheme":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 370
    new-instance v8, Lorg/apache/http/HttpHost;

    .end local v8    # "target":Lorg/apache/http/HttpHost;
    invoke-direct {v8, v2, v5, v7}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .restart local v8    # "target":Lorg/apache/http/HttpHost;
    goto :goto_0

    .line 360
    .end local v7    # "scheme":Ljava/lang/String;
    .restart local v0    # "at":I
    .restart local v1    # "colon":I
    .restart local v3    # "i":I
    .restart local v4    # "len":I
    .restart local v6    # "pos":I
    :catch_0
    move-exception v9

    goto :goto_3
.end method

.method private static normalizeSyntax(Ljava/net/URI;)Ljava/net/URI;
    .locals 18
    .param p0, "uri"    # Ljava/net/URI;

    .prologue
    .line 262
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->isOpaque()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_2

    :cond_0
    move-object/from16 v1, p0

    .line 308
    :cond_1
    :goto_0
    return-object v1

    .line 266
    :cond_2
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->isAbsolute()Z

    move-result v4

    const-string/jumbo v5, "Base URI must be absolute"

    invoke-static {v4, v5}, Lorg/apache/http/util/Args;->check(ZLjava/lang/String;)V

    .line 267
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_4

    const-string/jumbo v17, ""

    .line 268
    .local v17, "path":Ljava/lang/String;
    :goto_1
    const-string/jumbo v4, "/"

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 269
    .local v11, "inputSegments":[Ljava/lang/String;
    new-instance v16, Ljava/util/Stack;

    invoke-direct/range {v16 .. v16}, Ljava/util/Stack;-><init>()V

    .line 270
    .local v16, "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    move-object v7, v11

    .local v7, "arr$":[Ljava/lang/String;
    array-length v12, v7

    .local v12, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_2
    if-ge v9, v12, :cond_7

    aget-object v10, v7, v9

    .line 271
    .local v10, "inputSegment":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_3

    const-string/jumbo v4, "."

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 270
    :cond_3
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 267
    .end local v7    # "arr$":[Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v10    # "inputSegment":Ljava/lang/String;
    .end local v11    # "inputSegments":[Ljava/lang/String;
    .end local v12    # "len$":I
    .end local v16    # "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    .end local v17    # "path":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v17

    goto :goto_1

    .line 274
    .restart local v7    # "arr$":[Ljava/lang/String;
    .restart local v9    # "i$":I
    .restart local v10    # "inputSegment":Ljava/lang/String;
    .restart local v11    # "inputSegments":[Ljava/lang/String;
    .restart local v12    # "len$":I
    .restart local v16    # "outputSegments":Ljava/util/Stack;, "Ljava/util/Stack<Ljava/lang/String;>;"
    .restart local v17    # "path":Ljava/lang/String;
    :cond_5
    const-string/jumbo v4, ".."

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 275
    invoke-virtual/range {v16 .. v16}, Ljava/util/Stack;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 276
    invoke-virtual/range {v16 .. v16}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    goto :goto_3

    .line 279
    :cond_6
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 282
    .end local v10    # "inputSegment":Ljava/lang/String;
    :cond_7
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 283
    .local v14, "outputBuffer":Ljava/lang/StringBuilder;
    invoke-virtual/range {v16 .. v16}, Ljava/util/Stack;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 284
    .local v15, "outputSegment":Ljava/lang/String;
    const/16 v4, 0x2f

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 286
    .end local v15    # "outputSegment":Ljava/lang/String;
    :cond_8
    const/16 v4, 0x2f

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v4, v5, :cond_9

    .line 288
    const/16 v4, 0x2f

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 291
    :cond_9
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 292
    .local v2, "scheme":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getAuthority()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 293
    .local v3, "auth":Ljava/lang/String;
    new-instance v1, Ljava/net/URI;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    .local v1, "ref":Ljava/net/URI;
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_a

    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 298
    :cond_a
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v13, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 300
    .local v13, "normalized":Ljava/lang/StringBuilder;
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_b

    .line 302
    const/16 v4, 0x3f

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    :cond_b
    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_c

    .line 306
    const/16 v4, 0x23

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    :cond_c
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto/16 :goto_0

    .line 309
    .end local v1    # "ref":Ljava/net/URI;
    .end local v2    # "scheme":Ljava/lang/String;
    .end local v3    # "auth":Ljava/lang/String;
    .end local v13    # "normalized":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v8

    .line 310
    .local v8, "e":Ljava/net/URISyntaxException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static resolve(Ljava/net/URI;Ljava/lang/String;)Ljava/net/URI;
    .locals 1
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/lang/String;

    .prologue
    .line 207
    invoke-static {p1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/http/client/utils/URIUtils;->resolve(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public static resolve(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;
    .locals 7
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/net/URI;

    .prologue
    const/4 v5, 0x0

    .line 219
    const-string/jumbo v6, "Base URI"

    invoke-static {p0, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 220
    const-string/jumbo v6, "Reference URI"

    invoke-static {p1, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 221
    move-object v1, p1

    .line 222
    .local v1, "ref":Ljava/net/URI;
    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v4

    .line 223
    .local v4, "s":Ljava/lang/String;
    const-string/jumbo v6, "?"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 224
    invoke-static {p0, v1}, Lorg/apache/http/client/utils/URIUtils;->resolveReferenceStartingWithQueryString(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;

    move-result-object v5

    .line 236
    :goto_0
    return-object v5

    .line 226
    :cond_0
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_3

    const/4 v0, 0x1

    .line 227
    .local v0, "emptyReference":Z
    :goto_1
    if-eqz v0, :cond_1

    .line 228
    const-string/jumbo v6, "#"

    invoke-static {v6}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    .line 230
    :cond_1
    invoke-virtual {p0, v1}, Ljava/net/URI;->resolve(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v2

    .line 231
    .local v2, "resolved":Ljava/net/URI;
    if-eqz v0, :cond_2

    .line 232
    invoke-virtual {v2}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "resolvedString":Ljava/lang/String;
    const/16 v6, 0x23

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    .line 236
    .end local v3    # "resolvedString":Ljava/lang/String;
    :cond_2
    invoke-static {v2}, Lorg/apache/http/client/utils/URIUtils;->normalizeSyntax(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v5

    goto :goto_0

    .end local v0    # "emptyReference":Z
    .end local v2    # "resolved":Ljava/net/URI;
    :cond_3
    move v0, v5

    .line 226
    goto :goto_1
.end method

.method public static resolve(Ljava/net/URI;Lorg/apache/http/HttpHost;Ljava/util/List;)Ljava/net/URI;
    .locals 4
    .param p0, "originalURI"    # Ljava/net/URI;
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            "Lorg/apache/http/HttpHost;",
            "Ljava/util/List",
            "<",
            "Ljava/net/URI;",
            ">;)",
            "Ljava/net/URI;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 396
    .local p2, "redirects":Ljava/util/List;, "Ljava/util/List<Ljava/net/URI;>;"
    const-string/jumbo v3, "Request URI"

    invoke-static {p0, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 398
    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 399
    :cond_0
    new-instance v2, Lorg/apache/http/client/utils/URIBuilder;

    invoke-direct {v2, p0}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 410
    .local v2, "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    :goto_0
    invoke-virtual {v2}, Lorg/apache/http/client/utils/URIBuilder;->getFragment()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    .line 411
    invoke-virtual {p0}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 414
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {v2}, Lorg/apache/http/client/utils/URIBuilder;->isAbsolute()Z

    move-result v3

    if-nez v3, :cond_2

    .line 415
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 416
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 417
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;->setPort(I)Lorg/apache/http/client/utils/URIBuilder;

    .line 419
    :cond_2
    invoke-virtual {v2}, Lorg/apache/http/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object v3

    return-object v3

    .line 401
    .end local v2    # "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    :cond_3
    new-instance v2, Lorg/apache/http/client/utils/URIBuilder;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URI;

    invoke-direct {v2, v3}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 402
    .restart local v2    # "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    invoke-virtual {v2}, Lorg/apache/http/client/utils/URIBuilder;->getFragment()Ljava/lang/String;

    move-result-object v0

    .line 404
    .local v0, "frag":Ljava/lang/String;
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_1
    if-nez v0, :cond_4

    if-ltz v1, :cond_4

    .line 405
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URI;

    invoke-virtual {v3}, Ljava/net/URI;->getFragment()Ljava/lang/String;

    move-result-object v0

    .line 404
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 407
    :cond_4
    invoke-virtual {v2, v0}, Lorg/apache/http/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    goto :goto_0
.end method

.method private static resolveReferenceStartingWithQueryString(Ljava/net/URI;Ljava/net/URI;)Ljava/net/URI;
    .locals 4
    .param p0, "baseURI"    # Ljava/net/URI;
    .param p1, "reference"    # Ljava/net/URI;

    .prologue
    const/16 v3, 0x3f

    .line 248
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "baseUri":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-le v1, v2, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 251
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    return-object v1
.end method

.method public static rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    .locals 4
    .param p0, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 180
    const-string/jumbo v1, "URI"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 181
    invoke-virtual {p0}, Ljava/net/URI;->isOpaque()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 195
    .end local p0    # "uri":Ljava/net/URI;
    :goto_0
    return-object p0

    .line 184
    .restart local p0    # "uri":Ljava/net/URI;
    :cond_0
    new-instance v0, Lorg/apache/http/client/utils/URIBuilder;

    invoke-direct {v0, p0}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 185
    .local v0, "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 186
    invoke-virtual {v0, v3}, Lorg/apache/http/client/utils/URIBuilder;->setUserInfo(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 188
    :cond_1
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 189
    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setPath(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 191
    :cond_2
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 192
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getHost()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 194
    :cond_3
    invoke-virtual {v0, v3}, Lorg/apache/http/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 195
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object p0

    goto :goto_0
.end method

.method public static rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;)Ljava/net/URI;
    .locals 1
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 165
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public static rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;
    .locals 3
    .param p0, "uri"    # Ljava/net/URI;
    .param p1, "target"    # Lorg/apache/http/HttpHost;
    .param p2, "dropFragment"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 134
    const-string/jumbo v1, "URI"

    invoke-static {p0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 135
    invoke-virtual {p0}, Ljava/net/URI;->isOpaque()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    .end local p0    # "uri":Ljava/net/URI;
    :goto_0
    return-object p0

    .line 138
    .restart local p0    # "uri":Ljava/net/URI;
    :cond_0
    new-instance v0, Lorg/apache/http/client/utils/URIBuilder;

    invoke-direct {v0, p0}, Lorg/apache/http/client/utils/URIBuilder;-><init>(Ljava/net/URI;)V

    .line 139
    .local v0, "uribuilder":Lorg/apache/http/client/utils/URIBuilder;
    if-eqz p1, :cond_3

    .line 140
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 141
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 142
    invoke-virtual {p1}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setPort(I)Lorg/apache/http/client/utils/URIBuilder;

    .line 148
    :goto_1
    if-eqz p2, :cond_1

    .line 149
    invoke-virtual {v0, v2}, Lorg/apache/http/client/utils/URIBuilder;->setFragment(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 151
    :cond_1
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 152
    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setPath(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 154
    :cond_2
    invoke-virtual {v0}, Lorg/apache/http/client/utils/URIBuilder;->build()Ljava/net/URI;

    move-result-object p0

    goto :goto_0

    .line 144
    :cond_3
    invoke-virtual {v0, v2}, Lorg/apache/http/client/utils/URIBuilder;->setScheme(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 145
    invoke-virtual {v0, v2}, Lorg/apache/http/client/utils/URIBuilder;->setHost(Ljava/lang/String;)Lorg/apache/http/client/utils/URIBuilder;

    .line 146
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/utils/URIBuilder;->setPort(I)Lorg/apache/http/client/utils/URIBuilder;

    goto :goto_1
.end method
