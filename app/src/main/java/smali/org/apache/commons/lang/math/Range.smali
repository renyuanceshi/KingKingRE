.class public abstract Lorg/apache/commons/lang/math/Range;
.super Ljava/lang/Object;
.source "Range.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    return-void
.end method


# virtual methods
.method public containsDouble(D)Z
    .locals 5
    .param p1, "value"    # D

    .prologue
    .line 270
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumDouble()D

    move-result-wide v2

    invoke-static {v2, v3, p1, p2}, Lorg/apache/commons/lang/math/NumberUtils;->compare(DD)I

    move-result v1

    .line 271
    .local v1, "compareMin":I
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumDouble()D

    move-result-wide v2

    invoke-static {v2, v3, p1, p2}, Lorg/apache/commons/lang/math/NumberUtils;->compare(DD)I

    move-result v0

    .line 272
    .local v0, "compareMax":I
    if-gtz v1, :cond_0

    if-ltz v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public containsDouble(Ljava/lang/Number;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/Number;

    .prologue
    .line 252
    if-nez p1, :cond_0

    .line 253
    const/4 v0, 0x0

    .line 255
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/math/Range;->containsDouble(D)Z

    move-result v0

    goto :goto_0
.end method

.method public containsFloat(F)Z
    .locals 3
    .param p1, "value"    # F

    .prologue
    .line 306
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumFloat()F

    move-result v2

    invoke-static {v2, p1}, Lorg/apache/commons/lang/math/NumberUtils;->compare(FF)I

    move-result v1

    .line 307
    .local v1, "compareMin":I
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumFloat()F

    move-result v2

    invoke-static {v2, p1}, Lorg/apache/commons/lang/math/NumberUtils;->compare(FF)I

    move-result v0

    .line 308
    .local v0, "compareMax":I
    if-gtz v1, :cond_0

    if-ltz v0, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public containsFloat(Ljava/lang/Number;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Number;

    .prologue
    .line 288
    if-nez p1, :cond_0

    .line 289
    const/4 v0, 0x0

    .line 291
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/math/Range;->containsFloat(F)Z

    move-result v0

    goto :goto_0
.end method

.method public containsInteger(I)Z
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 236
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumInteger()I

    move-result v0

    if-lt p1, v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumInteger()I

    move-result v0

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsInteger(Ljava/lang/Number;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Number;

    .prologue
    .line 218
    if-nez p1, :cond_0

    .line 219
    const/4 v0, 0x0

    .line 221
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/math/Range;->containsInteger(I)Z

    move-result v0

    goto :goto_0
.end method

.method public containsLong(J)Z
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 202
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumLong()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumLong()J

    move-result-wide v0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsLong(Ljava/lang/Number;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/Number;

    .prologue
    .line 184
    if-nez p1, :cond_0

    .line 185
    const/4 v0, 0x0

    .line 187
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/math/Range;->containsLong(J)Z

    move-result v0

    goto :goto_0
.end method

.method public abstract containsNumber(Ljava/lang/Number;)Z
.end method

.method public containsRange(Lorg/apache/commons/lang/math/Range;)Z
    .locals 2
    .param p1, "range"    # Lorg/apache/commons/lang/math/Range;

    .prologue
    const/4 v0, 0x0

    .line 332
    if-nez p1, :cond_1

    .line 335
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/math/Range;->containsNumber(Ljava/lang/Number;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/math/Range;->containsNumber(Ljava/lang/Number;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 382
    if-ne p1, p0, :cond_1

    .line 388
    :cond_0
    :goto_0
    return v1

    .line 384
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 385
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 387
    check-cast v0, Lorg/apache/commons/lang/math/Range;

    .line 388
    .local v0, "range":Lorg/apache/commons/lang/math/Range;
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0
.end method

.method public getMaximumDouble()D
    .locals 2

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getMaximumFloat()F
    .locals 1

    .prologue
    .line 149
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    return v0
.end method

.method public getMaximumInteger()I
    .locals 1

    .prologue
    .line 125
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    return v0
.end method

.method public getMaximumLong()J
    .locals 2

    .prologue
    .line 113
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public abstract getMaximumNumber()Ljava/lang/Number;
.end method

.method public getMinimumDouble()D
    .locals 2

    .prologue
    .line 82
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    return-wide v0
.end method

.method public getMinimumFloat()F
    .locals 1

    .prologue
    .line 94
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    return v0
.end method

.method public getMinimumInteger()I
    .locals 1

    .prologue
    .line 70
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    return v0
.end method

.method public getMinimumLong()J
    .locals 2

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public abstract getMinimumNumber()Ljava/lang/Number;
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 403
    const/16 v0, 0x11

    .line 404
    .local v0, "result":I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x275

    .line 405
    mul-int/lit8 v1, v0, 0x25

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 406
    mul-int/lit8 v1, v0, 0x25

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 407
    return v0
.end method

.method public overlapsRange(Lorg/apache/commons/lang/math/Range;)Z
    .locals 2
    .param p1, "range"    # Lorg/apache/commons/lang/math/Range;

    .prologue
    const/4 v0, 0x0

    .line 358
    if-nez p1, :cond_1

    .line 361
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/commons/lang/math/Range;->containsNumber(Ljava/lang/Number;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/commons/lang/math/Range;->containsNumber(Ljava/lang/Number;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/math/Range;->containsNumber(Ljava/lang/Number;)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 422
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 423
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "Range["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 424
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMinimumNumber()Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 425
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 426
    invoke-virtual {p0}, Lorg/apache/commons/lang/math/Range;->getMaximumNumber()Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 427
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 428
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
