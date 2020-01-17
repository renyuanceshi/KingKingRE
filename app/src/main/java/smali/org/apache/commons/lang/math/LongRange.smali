.class public final Lorg/apache/commons/lang/math/LongRange;
.super Lorg/apache/commons/lang/math/Range;
.source "LongRange.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4158bbcfe9f0L


# instance fields
.field private transient hashCode:I

.field private final max:J

.field private transient maxObject:Ljava/lang/Long;

.field private final min:J

.field private transient minObject:Ljava/lang/Long;

.field private transient toString:Ljava/lang/String;


# direct methods
.method public constructor <init>(J)V
    .locals 3
    .param p1, "number"    # J

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->toString:Ljava/lang/String;

    .line 71
    iput-wide p1, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    .line 72
    iput-wide p1, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    .line 73
    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 3
    .param p1, "number1"    # J
    .param p3, "number2"    # J

    .prologue
    const/4 v1, 0x0

    .line 107
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->toString:Ljava/lang/String;

    .line 108
    cmp-long v0, p3, p1

    if-gez v0, :cond_0

    .line 109
    iput-wide p3, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    .line 110
    iput-wide p1, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    .line 115
    :goto_0
    return-void

    .line 112
    :cond_0
    iput-wide p1, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    .line 113
    iput-wide p3, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/Number;)V
    .locals 2
    .param p1, "number"    # Ljava/lang/Number;

    .prologue
    const/4 v1, 0x0

    .line 84
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->toString:Ljava/lang/String;

    .line 85
    if-nez p1, :cond_0

    .line 86
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    .line 89
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    .line 90
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_1

    move-object v0, p1

    .line 91
    check-cast v0, Ljava/lang/Long;

    iput-object v0, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    .line 92
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "number":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    .line 94
    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/Number;Ljava/lang/Number;)V
    .locals 6
    .param p1, "number1"    # Ljava/lang/Number;
    .param p2, "number2"    # Ljava/lang/Number;

    .prologue
    const/4 v5, 0x0

    .line 129
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v5, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    .line 53
    iput-object v5, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    .line 57
    const/4 v4, 0x0

    iput v4, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    .line 61
    iput-object v5, p0, Lorg/apache/commons/lang/math/LongRange;->toString:Ljava/lang/String;

    .line 130
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 131
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "The numbers must not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 133
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 134
    .local v0, "number1val":J
    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    .line 135
    .local v2, "number2val":J
    cmp-long v4, v2, v0

    if-gez v4, :cond_4

    .line 136
    iput-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    .line 137
    iput-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    .line 138
    instance-of v4, p2, Ljava/lang/Long;

    if-eqz v4, :cond_2

    .line 139
    check-cast p2, Ljava/lang/Long;

    .end local p2    # "number2":Ljava/lang/Number;
    iput-object p2, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    .line 141
    :cond_2
    instance-of v4, p1, Ljava/lang/Long;

    if-eqz v4, :cond_3

    .line 142
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "number1":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    .line 154
    :cond_3
    :goto_0
    return-void

    .line 145
    .restart local p1    # "number1":Ljava/lang/Number;
    .restart local p2    # "number2":Ljava/lang/Number;
    :cond_4
    iput-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    .line 146
    iput-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    .line 147
    instance-of v4, p1, Ljava/lang/Long;

    if-eqz v4, :cond_5

    .line 148
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "number1":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    .line 150
    :cond_5
    instance-of v4, p2, Ljava/lang/Long;

    if-eqz v4, :cond_3

    .line 151
    check-cast p2, Ljava/lang/Long;

    .end local p2    # "number2":Ljava/lang/Number;
    iput-object p2, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    goto :goto_0
.end method


# virtual methods
.method public containsLong(J)Z
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 298
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    cmp-long v0, p1, v0

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
    .line 280
    if-nez p1, :cond_0

    .line 281
    const/4 v0, 0x0

    .line 283
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/math/LongRange;->containsLong(J)Z

    move-result v0

    goto :goto_0
.end method

.method public containsRange(Lorg/apache/commons/lang/math/Range;)Z
    .locals 4
    .param p1, "range"    # Lorg/apache/commons/lang/math/Range;

    .prologue
    const/4 v0, 0x0

    .line 315
    if-nez p1, :cond_1

    .line 318
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMinimumLong()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/lang/math/LongRange;->containsLong(J)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMaximumLong()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/lang/math/LongRange;->containsLong(J)Z

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

    .line 352
    if-ne p1, p0, :cond_1

    .line 359
    :cond_0
    :goto_0
    return v1

    .line 355
    :cond_1
    instance-of v3, p1, Lorg/apache/commons/lang/math/LongRange;

    if-nez v3, :cond_2

    move v1, v2

    .line 356
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 358
    check-cast v0, Lorg/apache/commons/lang/math/LongRange;

    .line 359
    .local v0, "range":Lorg/apache/commons/lang/math/LongRange;
    iget-wide v4, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    iget-wide v6, v0, Lorg/apache/commons/lang/math/LongRange;->min:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_3

    iget-wide v4, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    iget-wide v6, v0, Lorg/apache/commons/lang/math/LongRange;->max:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0
.end method

.method public getMaximumDouble()D
    .locals 2

    .prologue
    .line 253
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    long-to-double v0, v0

    return-wide v0
.end method

.method public getMaximumFloat()F
    .locals 2

    .prologue
    .line 264
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    long-to-float v0, v0

    return v0
.end method

.method public getMaximumInteger()I
    .locals 2

    .prologue
    .line 242
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    long-to-int v0, v0

    return v0
.end method

.method public getMaximumLong()J
    .locals 2

    .prologue
    .line 231
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    return-wide v0
.end method

.method public getMaximumNumber()Ljava/lang/Number;
    .locals 4

    .prologue
    .line 219
    iget-object v0, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    if-nez v0, :cond_0

    .line 220
    new-instance v0, Ljava/lang/Long;

    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    invoke-direct {v0, v2, v3}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    .line 222
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/math/LongRange;->maxObject:Ljava/lang/Long;

    return-object v0
.end method

.method public getMinimumDouble()D
    .locals 2

    .prologue
    .line 199
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    long-to-double v0, v0

    return-wide v0
.end method

.method public getMinimumFloat()F
    .locals 2

    .prologue
    .line 210
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    long-to-float v0, v0

    return v0
.end method

.method public getMinimumInteger()I
    .locals 2

    .prologue
    .line 188
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    long-to-int v0, v0

    return v0
.end method

.method public getMinimumLong()J
    .locals 2

    .prologue
    .line 177
    iget-wide v0, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    return-wide v0
.end method

.method public getMinimumNumber()Ljava/lang/Number;
    .locals 4

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    if-nez v0, :cond_0

    .line 166
    new-instance v0, Ljava/lang/Long;

    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    invoke-direct {v0, v2, v3}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    .line 168
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/math/LongRange;->minObject:Ljava/lang/Long;

    return-object v0
.end method

.method public hashCode()I
    .locals 7

    .prologue
    const/16 v6, 0x20

    .line 368
    iget v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    if-nez v0, :cond_0

    .line 369
    const/16 v0, 0x11

    iput v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    .line 370
    iget v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    .line 371
    iget v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    iget-wide v4, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    shr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    .line 372
    iget v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    iget-wide v4, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    shr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v1, v2

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    .line 374
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/math/LongRange;->hashCode:I

    return v0
.end method

.method public overlapsRange(Lorg/apache/commons/lang/math/Range;)Z
    .locals 4
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
    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    invoke-virtual {p1, v2, v3}, Lorg/apache/commons/lang/math/Range;->containsLong(J)Z

    move-result v1

    if-nez v1, :cond_2

    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    invoke-virtual {p1, v2, v3}, Lorg/apache/commons/lang/math/Range;->containsLong(J)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMinimumLong()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/lang/math/LongRange;->containsLong(J)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public toArray()[J
    .locals 6

    .prologue
    .line 404
    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    iget-wide v4, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    long-to-int v2, v2

    new-array v0, v2, [J

    .line 405
    .local v0, "array":[J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 406
    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    int-to-long v4, v1

    add-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 405
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 408
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 385
    iget-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->toString:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 386
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 387
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "Range["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 388
    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->min:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 389
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 390
    iget-wide v2, p0, Lorg/apache/commons/lang/math/LongRange;->max:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    .line 391
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 392
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->toString:Ljava/lang/String;

    .line 394
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/lang/math/LongRange;->toString:Ljava/lang/String;

    return-object v1
.end method
