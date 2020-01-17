.class public final Lorg/apache/commons/lang/math/IntRange;
.super Lorg/apache/commons/lang/math/Range;
.source "IntRange.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4158bbcfe9faL


# instance fields
.field private transient hashCode:I

.field private final max:I

.field private transient maxObject:Ljava/lang/Integer;

.field private final min:I

.field private transient minObject:Ljava/lang/Integer;

.field private transient toString:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "number"    # I

    .prologue
    const/4 v1, 0x0

    .line 70
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->toString:Ljava/lang/String;

    .line 71
    iput p1, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    .line 72
    iput p1, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    .line 73
    return-void
.end method

.method public constructor <init>(II)V
    .locals 2
    .param p1, "number1"    # I
    .param p2, "number2"    # I

    .prologue
    const/4 v1, 0x0

    .line 106
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->toString:Ljava/lang/String;

    .line 107
    if-ge p2, p1, :cond_0

    .line 108
    iput p2, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    .line 109
    iput p1, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    .line 114
    :goto_0
    return-void

    .line 111
    :cond_0
    iput p1, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    .line 112
    iput p2, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/Number;)V
    .locals 2
    .param p1, "number"    # Ljava/lang/Number;

    .prologue
    const/4 v1, 0x0

    .line 83
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    .line 53
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    .line 57
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    .line 61
    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->toString:Ljava/lang/String;

    .line 84
    if-nez p1, :cond_0

    .line 85
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    .line 88
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    .line 89
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    move-object v0, p1

    .line 90
    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    .line 91
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "number":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    .line 93
    :cond_1
    return-void
.end method

.method public constructor <init>(Ljava/lang/Number;Ljava/lang/Number;)V
    .locals 4
    .param p1, "number1"    # Ljava/lang/Number;
    .param p2, "number2"    # Ljava/lang/Number;

    .prologue
    const/4 v3, 0x0

    .line 128
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 49
    iput-object v3, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    .line 53
    iput-object v3, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    .line 57
    const/4 v2, 0x0

    iput v2, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    .line 61
    iput-object v3, p0, Lorg/apache/commons/lang/math/IntRange;->toString:Ljava/lang/String;

    .line 129
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 130
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "The numbers must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 132
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 133
    .local v0, "number1val":I
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 134
    .local v1, "number2val":I
    if-ge v1, v0, :cond_4

    .line 135
    iput v1, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    .line 136
    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    .line 137
    instance-of v2, p2, Ljava/lang/Integer;

    if-eqz v2, :cond_2

    .line 138
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "number2":Ljava/lang/Number;
    iput-object p2, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    .line 140
    :cond_2
    instance-of v2, p1, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    .line 141
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "number1":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    .line 153
    :cond_3
    :goto_0
    return-void

    .line 144
    .restart local p1    # "number1":Ljava/lang/Number;
    .restart local p2    # "number2":Ljava/lang/Number;
    :cond_4
    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    .line 145
    iput v1, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    .line 146
    instance-of v2, p1, Ljava/lang/Integer;

    if-eqz v2, :cond_5

    .line 147
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "number1":Ljava/lang/Number;
    iput-object p1, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    .line 149
    :cond_5
    instance-of v2, p2, Ljava/lang/Integer;

    if-eqz v2, :cond_3

    .line 150
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "number2":Ljava/lang/Number;
    iput-object p2, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    goto :goto_0
.end method


# virtual methods
.method public containsInteger(I)Z
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 285
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    if-lt p1, v0, :cond_0

    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsNumber(Ljava/lang/Number;)Z
    .locals 1
    .param p1, "number"    # Ljava/lang/Number;

    .prologue
    .line 267
    if-nez p1, :cond_0

    .line 268
    const/4 v0, 0x0

    .line 270
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/math/IntRange;->containsInteger(I)Z

    move-result v0

    goto :goto_0
.end method

.method public containsRange(Lorg/apache/commons/lang/math/Range;)Z
    .locals 2
    .param p1, "range"    # Lorg/apache/commons/lang/math/Range;

    .prologue
    const/4 v0, 0x0

    .line 302
    if-nez p1, :cond_1

    .line 305
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMinimumInteger()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/math/IntRange;->containsInteger(I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMaximumInteger()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/math/IntRange;->containsInteger(I)Z

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

    .line 339
    if-ne p1, p0, :cond_1

    .line 346
    :cond_0
    :goto_0
    return v1

    .line 342
    :cond_1
    instance-of v3, p1, Lorg/apache/commons/lang/math/IntRange;

    if-nez v3, :cond_2

    move v1, v2

    .line 343
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 345
    check-cast v0, Lorg/apache/commons/lang/math/IntRange;

    .line 346
    .local v0, "range":Lorg/apache/commons/lang/math/IntRange;
    iget v3, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    iget v4, v0, Lorg/apache/commons/lang/math/IntRange;->min:I

    if-ne v3, v4, :cond_3

    iget v3, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    iget v4, v0, Lorg/apache/commons/lang/math/IntRange;->max:I

    if-eq v3, v4, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0
.end method

.method public getMaximumDouble()D
    .locals 2

    .prologue
    .line 242
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    int-to-double v0, v0

    return-wide v0
.end method

.method public getMaximumFloat()F
    .locals 1

    .prologue
    .line 251
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    int-to-float v0, v0

    return v0
.end method

.method public getMaximumInteger()I
    .locals 1

    .prologue
    .line 233
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    return v0
.end method

.method public getMaximumLong()J
    .locals 2

    .prologue
    .line 224
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getMaximumNumber()Ljava/lang/Number;
    .locals 2

    .prologue
    .line 212
    iget-object v0, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 213
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    .line 215
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/math/IntRange;->maxObject:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMinimumDouble()D
    .locals 2

    .prologue
    .line 194
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    int-to-double v0, v0

    return-wide v0
.end method

.method public getMinimumFloat()F
    .locals 1

    .prologue
    .line 203
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    int-to-float v0, v0

    return v0
.end method

.method public getMinimumInteger()I
    .locals 1

    .prologue
    .line 185
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    return v0
.end method

.method public getMinimumLong()J
    .locals 2

    .prologue
    .line 176
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public getMinimumNumber()Ljava/lang/Number;
    .locals 2

    .prologue
    .line 164
    iget-object v0, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    if-nez v0, :cond_0

    .line 165
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    .line 167
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang/math/IntRange;->minObject:Ljava/lang/Integer;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 355
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    if-nez v0, :cond_0

    .line 356
    const/16 v0, 0x11

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    .line 357
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    .line 358
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    iget v1, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    .line 359
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    iget v1, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    .line 361
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/math/IntRange;->hashCode:I

    return v0
.end method

.method public overlapsRange(Lorg/apache/commons/lang/math/Range;)Z
    .locals 2
    .param p1, "range"    # Lorg/apache/commons/lang/math/Range;

    .prologue
    const/4 v0, 0x0

    .line 319
    if-nez p1, :cond_1

    .line 322
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    invoke-virtual {p1, v1}, Lorg/apache/commons/lang/math/Range;->containsInteger(I)Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    invoke-virtual {p1, v1}, Lorg/apache/commons/lang/math/Range;->containsInteger(I)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lorg/apache/commons/lang/math/Range;->getMinimumInteger()I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang/math/IntRange;->containsInteger(I)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public toArray()[I
    .locals 4

    .prologue
    .line 391
    iget v2, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    iget v3, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    new-array v0, v2, [I

    .line 392
    .local v0, "array":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 393
    iget v2, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    add-int/2addr v2, v1

    aput v2, v0, v1

    .line 392
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 396
    :cond_0
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 372
    iget-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->toString:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 373
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 374
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "Range["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 375
    iget v1, p0, Lorg/apache/commons/lang/math/IntRange;->min:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 376
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 377
    iget v1, p0, Lorg/apache/commons/lang/math/IntRange;->max:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 378
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 379
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->toString:Ljava/lang/String;

    .line 381
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/lang/math/IntRange;->toString:Ljava/lang/String;

    return-object v1
.end method
