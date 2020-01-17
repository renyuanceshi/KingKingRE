.class public final Lorg/apache/commons/lang/math/DoubleRange;
.super Lorg/apache/commons/lang/math/Range;
.source "DoubleRange.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4158bbcfea04L


# instance fields
.field private transient hashCode:I

.field private final max:D

.field private transient maxObject:Ljava/lang/Double;

.field private final min:D

.field private transient minObject:Ljava/lang/Double;

.field private transient toString:Ljava/lang/String;


# direct methods
.method public constructor <init>(D)V
    .locals 3
    .param p1, "number"    # D

    .prologue
    const/4 v1, 0x0

    .line 71
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->toString:Ljava/lang/String;

    .line 72
    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must not be NaN"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_0
    iput-wide p1, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    .line 76
    iput-wide p1, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    .line 77
    return-void
.end method

.method public constructor <init>(DD)V
    .locals 3
    .param p1, "number1"    # D
    .param p3, "number2"    # D

    .prologue
    const/4 v1, 0x0

    .line 116
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->toString:Ljava/lang/String;

    .line 117
    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p3, p4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 118
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The numbers must not be NaN"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_1
    cmpg-double v0, p3, p1

    if-gez v0, :cond_2

    .line 121
    iput-wide p3, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    .line 122
    iput-wide p1, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    .line 127
    :goto_0
    return-void

    .line 124
    :cond_2
    iput-wide p1, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    .line 125
    iput-wide p3, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/Number;)V
    .locals 2
    .param p1, "number"    # Ljava/lang/Number;

    .prologue
    const/4 v1, 0x0

    .line 89
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->toString:Ljava/lang/String;

    .line 90
    if-nez p1, :cond_0

    .line 91
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    .line 94
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    .line 95
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_1

    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 96
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must not be NaN"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_2
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_3

    move-object v0, p1

    .line 99
    check-cast v0, Ljava/lang/Double;

    iput-object v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    .line 100
    check-cast p1, Ljava/lang/Double;

    .end local p1    # "number":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    .line 102
    :cond_3
    return-void
.end method

.method public constructor <init>(Ljava/lang/Number;Ljava/lang/Number;)V
    .locals 6
    .param p1, "number1"    # Ljava/lang/Number;
    .param p2, "number2"    # Ljava/lang/Number;

    .prologue
    const/4 v5, 0x0

    .line 142
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v5, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    .line 53
    iput-object v5, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    .line 57
    const/4 v4, 0x0

    iput v4, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    .line 61
    iput-object v5, p0, Lorg/apache/commons/lang/math/DoubleRange;->toString:Ljava/lang/String;

    .line 143
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 144
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "The numbers must not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 146
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 147
    .local v0, "number1val":D
    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 148
    .local v2, "number2val":D
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 149
    :cond_2
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "The numbers must not be NaN"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 151
    :cond_3
    cmpg-double v4, v2, v0

    if-gez v4, :cond_6

    .line 152
    iput-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    .line 153
    iput-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    .line 154
    instance-of v4, p2, Ljava/lang/Double;

    if-eqz v4, :cond_4

    .line 155
    check-cast p2, Ljava/lang/Double;

    .end local p2    # "number2":Ljava/lang/Number;
    iput-object p2, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    .line 157
    :cond_4
    instance-of v4, p1, Ljava/lang/Double;

    if-eqz v4, :cond_5

    .line 158
    check-cast p1, Ljava/lang/Double;

    .end local p1    # "number1":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    .line 170
    :cond_5
    :goto_0
    return-void

    .line 161
    .restart local p1    # "number1":Ljava/lang/Number;
    .restart local p2    # "number2":Ljava/lang/Number;
    :cond_6
    iput-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    .line 162
    iput-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    .line 163
    instance-of v4, p1, Ljava/lang/Double;

    if-eqz v4, :cond_7

    .line 164
    check-cast p1, Ljava/lang/Double;

    .end local p1    # "number1":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    .line 166
    :cond_7
    instance-of v4, p2, Ljava/lang/Double;

    if-eqz v4, :cond_5

    .line 167
    check-cast p2, Ljava/lang/Double;

    .end local p2    # "number2":Ljava/lang/Number;
    iput-object p2, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    goto :goto_0
.end method


# virtual methods
.method public containsDouble(D)Z
    .locals 3
    .param p1, "value"    # D

    .prologue
    .line 314
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    cmpl-double v0, p1, v0

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    cmpg-double v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsNumber(Ljava/lang/Number;)Z
    .locals 2
    .param p1, "number"    # Ljava/lang/Number;

    .prologue
    .line 296
    if-nez p1, :cond_0

    .line 297
    const/4 v0, 0x0

    .line 299
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/math/DoubleRange;->containsDouble(D)Z

    move-result v0

    goto :goto_0
.end method

.method public containsRange(Lorg/apache/commons/lang/math/Range;)Z
    .locals 4
    .param p1, "range"    # Lorg/apache/commons/lang/math/Range;

    .prologue
    const/4 v0, 0x0

    .line 331
    if-nez p1, :cond_1

    .line 334
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMinimumDouble()D

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/lang/math/DoubleRange;->containsDouble(D)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMaximumDouble()D

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/lang/math/DoubleRange;->containsDouble(D)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 368
    if-ne p1, p0, :cond_1

    .line 375
    :cond_0
    :goto_0
    return v1

    .line 371
    :cond_1
    instance-of v3, p1, Lorg/apache/commons/lang/math/DoubleRange;

    if-nez v3, :cond_2

    move v1, v2

    .line 372
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 374
    check-cast v0, Lorg/apache/commons/lang/math/DoubleRange;

    .line 375
    .local v0, "range":Lorg/apache/commons/lang/math/DoubleRange;
    iget-wide v4, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    iget-wide v6, v0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-nez v3, :cond_3

    iget-wide v4, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v4

    iget-wide v6, v0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0
.end method

.method public getMaximumDouble()D
    .locals 2

    .prologue
    .line 269
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    return-wide v0
.end method

.method public getMaximumFloat()F
    .locals 2

    .prologue
    .line 280
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    double-to-float v0, v0

    return v0
.end method

.method public getMaximumInteger()I
    .locals 2

    .prologue
    .line 260
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    double-to-int v0, v0

    return v0
.end method

.method public getMaximumLong()J
    .locals 2

    .prologue
    .line 249
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    double-to-long v0, v0

    return-wide v0
.end method

.method public getMaximumNumber()Ljava/lang/Number;
    .locals 4

    .prologue
    .line 235
    iget-object v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 236
    new-instance v0, Ljava/lang/Double;

    iget-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    invoke-direct {v0, v2, v3}, Ljava/lang/Double;-><init>(D)V

    iput-object v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    .line 238
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->maxObject:Ljava/lang/Double;

    return-object v0
.end method

.method public getMinimumDouble()D
    .locals 2

    .prologue
    .line 215
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    return-wide v0
.end method

.method public getMinimumFloat()F
    .locals 2

    .prologue
    .line 226
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    double-to-float v0, v0

    return v0
.end method

.method public getMinimumInteger()I
    .locals 2

    .prologue
    .line 206
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    double-to-int v0, v0

    return v0
.end method

.method public getMinimumLong()J
    .locals 2

    .prologue
    .line 195
    iget-wide v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    double-to-long v0, v0

    return-wide v0
.end method

.method public getMinimumNumber()Ljava/lang/Number;
    .locals 4

    .prologue
    .line 181
    iget-object v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    if-nez v0, :cond_0

    .line 182
    new-instance v0, Ljava/lang/Double;

    iget-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    invoke-direct {v0, v2, v3}, Ljava/lang/Double;-><init>(D)V

    iput-object v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    .line 184
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/math/DoubleRange;->minObject:Ljava/lang/Double;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .prologue
    const/16 v6, 0x20

    .line 385
    iget v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    if-nez v2, :cond_0

    .line 386
    const/16 v2, 0x11

    iput v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    .line 387
    iget v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    mul-int/lit8 v2, v2, 0x25

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    .line 388
    iget-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 389
    .local v0, "lng":J
    iget v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    mul-int/lit8 v2, v2, 0x25

    shr-long v4, v0, v6

    xor-long/2addr v4, v0

    long-to-int v3, v4

    add-int/2addr v2, v3

    iput v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    .line 390
    iget-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    .line 391
    iget v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    mul-int/lit8 v2, v2, 0x25

    shr-long v4, v0, v6

    xor-long/2addr v4, v0

    long-to-int v3, v4

    add-int/2addr v2, v3

    iput v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    .line 393
    .end local v0    # "lng":J
    :cond_0
    iget v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->hashCode:I

    return v2
.end method

.method public overlapsRange(Lorg/apache/commons/lang/math/Range;)Z
    .locals 4
    .param p1, "range"    # Lorg/apache/commons/lang/math/Range;

    .prologue
    const/4 v0, 0x0

    .line 348
    if-nez p1, :cond_1

    .line 351
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    invoke-virtual {p1, v2, v3}, Lorg/apache/commons/lang/math/Range;->containsDouble(D)Z

    move-result v1

    if-nez v1, :cond_2

    iget-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    invoke-virtual {p1, v2, v3}, Lorg/apache/commons/lang/math/Range;->containsDouble(D)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMinimumDouble()D

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/lang/math/DoubleRange;->containsDouble(D)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 404
    iget-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->toString:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 405
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 406
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "Range["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 407
    iget-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->min:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    .line 408
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 409
    iget-wide v2, p0, Lorg/apache/commons/lang/math/DoubleRange;->max:D

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->append(D)Ljava/lang/StringBuffer;

    .line 410
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 411
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->toString:Ljava/lang/String;

    .line 413
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/lang/math/DoubleRange;->toString:Ljava/lang/String;

    return-object v1
.end method
