.class public Lorg/apache/commons/lang/CharSetUtils;
.super Ljava/lang/Object;
.source "CharSetUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public static count(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 163
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 168
    :cond_0
    :goto_0
    return v1

    .line 166
    :cond_1
    const/4 v2, 0x1

    new-array v0, v2, [Ljava/lang/String;

    .line 167
    .local v0, "strs":[Ljava/lang/String;
    aput-object p1, v0, v1

    .line 168
    invoke-static {p0, v0}, Lorg/apache/commons/lang/CharSetUtils;->count(Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_0
.end method

.method public static count(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    .line 186
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 187
    :cond_0
    const/4 v2, 0x0

    .line 198
    :cond_1
    return v2

    .line 189
    :cond_2
    invoke-static {p1}, Lorg/apache/commons/lang/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang/CharSet;

    move-result-object v0

    .line 190
    .local v0, "chars":Lorg/apache/commons/lang/CharSet;
    const/4 v2, 0x0

    .line 191
    .local v2, "count":I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 192
    .local v1, "chrs":[C
    array-length v4, v1

    .line 193
    .local v4, "sz":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 194
    aget-char v5, v1, v3

    invoke-virtual {v0, v5}, Lorg/apache/commons/lang/CharSet;->contains(C)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 195
    add-int/lit8 v2, v2, 0x1

    .line 193
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static delete(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # Ljava/lang/String;

    .prologue
    .line 281
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 286
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 284
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 285
    .local v0, "strs":[Ljava/lang/String;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 286
    invoke-static {p0, v0}, Lorg/apache/commons/lang/CharSetUtils;->delete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static delete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    .line 305
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 308
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/CharSetUtils;->modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static evaluateSet([Ljava/lang/String;)Lorg/apache/commons/lang/CharSet;
    .locals 1
    .param p0, "set"    # [Ljava/lang/String;

    .prologue
    .line 70
    if-nez p0, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 73
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/commons/lang/CharSet;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang/CharSet;-><init>([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static keep(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # Ljava/lang/String;

    .prologue
    .line 223
    if-nez p0, :cond_0

    .line 224
    const/4 v1, 0x0

    .line 231
    :goto_0
    return-object v1

    .line 226
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 227
    :cond_1
    const-string/jumbo v1, ""

    goto :goto_0

    .line 229
    :cond_2
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 230
    .local v0, "strs":[Ljava/lang/String;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 231
    invoke-static {p0, v0}, Lorg/apache/commons/lang/CharSetUtils;->keep(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static keep(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    .line 251
    if-nez p0, :cond_0

    .line 252
    const/4 v0, 0x0

    .line 257
    :goto_0
    return-object v0

    .line 254
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 255
    :cond_1
    const-string/jumbo v0, ""

    goto :goto_0

    .line 257
    :cond_2
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/CharSetUtils;->modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;
    .param p2, "expect"    # Z

    .prologue
    .line 321
    invoke-static {p1}, Lorg/apache/commons/lang/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang/CharSet;

    move-result-object v1

    .line 322
    .local v1, "chars":Lorg/apache/commons/lang/CharSet;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 323
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 324
    .local v2, "chrs":[C
    array-length v4, v2

    .line 325
    .local v4, "sz":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 326
    aget-char v5, v2, v3

    invoke-virtual {v1, v5}, Lorg/apache/commons/lang/CharSet;->contains(C)Z

    move-result v5

    if-ne v5, p2, :cond_0

    .line 327
    aget-char v5, v2, v3

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 325
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 330
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static squeeze(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 102
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 100
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 101
    .local v0, "strs":[Ljava/lang/String;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 102
    invoke-static {p0, v0}, Lorg/apache/commons/lang/CharSetUtils;->squeeze(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static squeeze(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "set"    # [Ljava/lang/String;

    .prologue
    .line 120
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 139
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 123
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-static {p1}, Lorg/apache/commons/lang/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang/CharSet;

    move-result-object v2

    .line 124
    .local v2, "chars":Lorg/apache/commons/lang/CharSet;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-direct {v0, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 125
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    .line 126
    .local v3, "chrs":[C
    array-length v6, v3

    .line 127
    .local v6, "sz":I
    const/16 v5, 0x20

    .line 128
    .local v5, "lastChar":C
    const/16 v1, 0x20

    .line 129
    .local v1, "ch":C
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v6, :cond_3

    .line 130
    aget-char v1, v3, v4

    .line 131
    invoke-virtual {v2, v1}, Lorg/apache/commons/lang/CharSet;->contains(C)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 132
    if-ne v1, v5, :cond_2

    if-eqz v4, :cond_2

    .line 129
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 136
    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 137
    move v5, v1

    goto :goto_2

    .line 139
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static translate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChars"    # Ljava/lang/String;
    .param p2, "replaceChars"    # Ljava/lang/String;

    .prologue
    .line 368
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 387
    .end local p0    # "str":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 371
    .restart local p0    # "str":Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-direct {v0, v7}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 372
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 373
    .local v1, "chrs":[C
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    .line 374
    .local v5, "withChrs":[C
    array-length v4, v1

    .line 375
    .local v4, "sz":I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v6, v7, -0x1

    .line 376
    .local v6, "withMax":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 377
    aget-char v7, v1, v2

    invoke-virtual {p1, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 378
    .local v3, "idx":I
    const/4 v7, -0x1

    if-eq v3, v7, :cond_2

    .line 379
    if-le v3, v6, :cond_1

    .line 380
    move v3, v6

    .line 382
    :cond_1
    aget-char v7, v5, v3

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 376
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 384
    :cond_2
    aget-char v7, v1, v2

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 387
    .end local v3    # "idx":I
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method
