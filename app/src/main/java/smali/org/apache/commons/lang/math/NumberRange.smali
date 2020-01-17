.class public final Lorg/apache/commons/lang/math/NumberRange;
.super Lorg/apache/commons/lang/math/Range;
.source "NumberRange.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4158bbcfe9e6L


# instance fields
.field private transient hashCode:I

.field private final max:Ljava/lang/Number;

.field private final min:Ljava/lang/Number;

.field private transient toString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Number;)V
    .locals 2
    .param p1, "num"    # Ljava/lang/Number;

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/lang/math/NumberRange;->toString:Ljava/lang/String;

    .line 67
    if-nez p1, :cond_0

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_0
    instance-of v0, p1, Ljava/lang/Comparable;

    if-nez v0, :cond_1

    .line 71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must implement Comparable"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_1
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must not be NaN"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_2
    instance-of v0, p1, Ljava/lang/Float;

    if-eqz v0, :cond_3

    move-object v0, p1

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->isNaN()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The number must not be NaN"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_3
    iput-object p1, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    .line 81
    iput-object p1, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/lang/Number;Ljava/lang/Number;)V
    .locals 3
    .param p1, "num1"    # Ljava/lang/Number;
    .param p2, "num2"    # Ljava/lang/Number;

    .prologue
    .line 102
    invoke-direct {p0}, Lorg/apache/commons/lang/math/Range;-><init>()V

    .line 51
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    .line 55
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/commons/lang/math/NumberRange;->toString:Ljava/lang/String;

    .line 103
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 104
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "The numbers must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_2

    .line 107
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "The numbers must be of the same type"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :cond_2
    instance-of v1, p1, Ljava/lang/Comparable;

    if-nez v1, :cond_3

    .line 110
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "The numbers must implement Comparable"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 112
    :cond_3
    instance-of v1, p1, Ljava/lang/Double;

    if-eqz v1, :cond_5

    move-object v1, p1

    .line 113
    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->isNaN()Z

    move-result v1

    if-nez v1, :cond_4

    move-object v1, p2

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->isNaN()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 114
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "The number must not be NaN"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 116
    :cond_5
    instance-of v1, p1, Ljava/lang/Float;

    if-eqz v1, :cond_7

    move-object v1, p1

    .line 117
    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->isNaN()Z

    move-result v1

    if-nez v1, :cond_6

    move-object v1, p2

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->isNaN()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 118
    :cond_6
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "The number must not be NaN"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_7
    move-object v1, p1

    .line 122
    check-cast v1, Ljava/lang/Comparable;

    invoke-interface {v1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    .line 123
    .local v0, "compare":I
    if-nez v0, :cond_8

    .line 124
    iput-object p1, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    .line 125
    iput-object p1, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    .line 133
    :goto_0
    return-void

    .line 126
    :cond_8
    if-lez v0, :cond_9

    .line 127
    iput-object p2, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    .line 128
    iput-object p1, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    goto :goto_0

    .line 130
    :cond_9
    iput-object p1, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    .line 131
    iput-object p2, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    goto :goto_0
.end method


# virtual methods
.method public containsNumber(Ljava/lang/Number;)Z
    .locals 5
    .param p1, "number"    # Ljava/lang/Number;

    .prologue
    const/4 v3, 0x0

    .line 170
    if-nez p1, :cond_0

    .line 178
    :goto_0
    return v3

    .line 173
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    iget-object v4, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v2, v4, :cond_1

    .line 174
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "The number must be of the same type as the range numbers"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 176
    :cond_1
    iget-object v2, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    check-cast v2, Ljava/lang/Comparable;

    invoke-interface {v2, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v1

    .line 177
    .local v1, "compareMin":I
    iget-object v2, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    check-cast v2, Ljava/lang/Comparable;

    invoke-interface {v2, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    .line 178
    .local v0, "compareMax":I
    if-gtz v1, :cond_2

    if-ltz v0, :cond_2

    const/4 v2, 0x1

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_2
    move v2, v3

    goto :goto_1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 197
    if-ne p1, p0, :cond_1

    .line 204
    :cond_0
    :goto_0
    return v1

    .line 200
    :cond_1
    instance-of v3, p1, Lorg/apache/commons/lang/math/NumberRange;

    if-nez v3, :cond_2

    move v1, v2

    .line 201
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 203
    check-cast v0, Lorg/apache/commons/lang/math/NumberRange;

    .line 204
    .local v0, "range":Lorg/apache/commons/lang/math/NumberRange;
    iget-object v3, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    iget-object v4, v0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    iget-object v4, v0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0
.end method

.method public getMaximumNumber()Ljava/lang/Number;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    return-object v0
.end method

.method public getMinimumNumber()Ljava/lang/Number;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 213
    iget v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    if-nez v0, :cond_0

    .line 214
    const/16 v0, 0x11

    iput v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    .line 215
    iget v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    .line 216
    iget v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    iget-object v1, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    .line 217
    iget v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    mul-int/lit8 v0, v0, 0x25

    iget-object v1, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    .line 219
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang/math/NumberRange;->hashCode:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 230
    iget-object v1, p0, Lorg/apache/commons/lang/math/NumberRange;->toString:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 231
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 232
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, "Range["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 233
    iget-object v1, p0, Lorg/apache/commons/lang/math/NumberRange;->min:Ljava/lang/Number;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 234
    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 235
    iget-object v1, p0, Lorg/apache/commons/lang/math/NumberRange;->max:Ljava/lang/Number;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 236
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang/math/NumberRange;->toString:Ljava/lang/String;

    .line 239
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/lang/math/NumberRange;->toString:Ljava/lang/String;

    return-object v1
.end method
