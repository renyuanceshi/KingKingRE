.class public Lorg/apache/commons/lang/ArrayUtils;
.super Ljava/lang/Object;
.source "ArrayUtils.java"


# static fields
.field public static final EMPTY_BOOLEAN_ARRAY:[Z

.field public static final EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

.field public static final EMPTY_BYTE_ARRAY:[B

.field public static final EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

.field public static final EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

.field public static final EMPTY_CHAR_ARRAY:[C

.field public static final EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

.field public static final EMPTY_DOUBLE_ARRAY:[D

.field public static final EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

.field public static final EMPTY_FLOAT_ARRAY:[F

.field public static final EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

.field public static final EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

.field public static final EMPTY_INT_ARRAY:[I

.field public static final EMPTY_LONG_ARRAY:[J

.field public static final EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

.field public static final EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

.field public static final EMPTY_SHORT_ARRAY:[S

.field public static final EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

.field public static final EMPTY_STRING_ARRAY:[Ljava/lang/String;

.field public static final INDEX_NOT_FOUND:I = -0x1

.field static class$java$lang$Object:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 55
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 59
    new-array v0, v1, [Ljava/lang/Class;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    .line 63
    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 67
    new-array v0, v1, [J

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    .line 71
    new-array v0, v1, [Ljava/lang/Long;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

    .line 75
    new-array v0, v1, [I

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_INT_ARRAY:[I

    .line 79
    new-array v0, v1, [Ljava/lang/Integer;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

    .line 83
    new-array v0, v1, [S

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    .line 87
    new-array v0, v1, [Ljava/lang/Short;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

    .line 91
    new-array v0, v1, [B

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    .line 95
    new-array v0, v1, [Ljava/lang/Byte;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

    .line 99
    new-array v0, v1, [D

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    .line 103
    new-array v0, v1, [Ljava/lang/Double;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

    .line 107
    new-array v0, v1, [F

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    .line 111
    new-array v0, v1, [Ljava/lang/Float;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

    .line 115
    new-array v0, v1, [Z

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    .line 119
    new-array v0, v1, [Ljava/lang/Boolean;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

    .line 123
    new-array v0, v1, [C

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 127
    new-array v0, v1, [Ljava/lang/Character;

    sput-object v0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    return-void
.end method

.method private static add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 6
    .param p0, "array"    # Ljava/lang/Object;
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;
    .param p3, "clss"    # Ljava/lang/Class;

    .prologue
    const/4 v4, 0x0

    .line 4263
    if-nez p0, :cond_1

    .line 4264
    if-eqz p1, :cond_0

    .line 4265
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ", Length: 0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 4267
    :cond_0
    const/4 v3, 0x1

    invoke-static {p3, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 4268
    .local v0, "joinedArray":Ljava/lang/Object;
    invoke-static {v0, v4, p2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 4281
    .end local v0    # "joinedArray":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 4271
    :cond_1
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    .line 4272
    .local v1, "length":I
    if-gt p1, v1, :cond_2

    if-gez p1, :cond_3

    .line 4273
    :cond_2
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Index: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ", Length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 4275
    :cond_3
    add-int/lit8 v3, v1, 0x1

    invoke-static {p3, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    .line 4276
    .local v2, "result":Ljava/lang/Object;
    invoke-static {p0, v4, v2, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4277
    invoke-static {v2, p1, p2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 4278
    if-ge p1, v1, :cond_4

    .line 4279
    add-int/lit8 v3, p1, 0x1

    sub-int v4, v1, p1

    invoke-static {p0, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_4
    move-object v0, v2

    .line 4281
    goto :goto_0
.end method

.method public static add([BB)[B
    .locals 2
    .param p0, "array"    # [B
    .param p1, "element"    # B

    .prologue
    .line 3776
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    move-object v0, v1

    check-cast v0, [B

    .line 3777
    .local v0, "newArray":[B
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-byte p1, v0, v1

    .line 3778
    return-object v0
.end method

.method public static add([BIB)[B
    .locals 2
    .param p0, "array"    # [B
    .param p1, "index"    # I
    .param p2, "element"    # B

    .prologue
    .line 4093
    new-instance v0, Ljava/lang/Byte;

    invoke-direct {v0, p2}, Ljava/lang/Byte;-><init>(B)V

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method public static add([CC)[C
    .locals 2
    .param p0, "array"    # [C
    .param p1, "element"    # C

    .prologue
    .line 3803
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [C

    move-object v0, v1

    check-cast v0, [C

    .line 3804
    .local v0, "newArray":[C
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-char p1, v0, v1

    .line 3805
    return-object v0
.end method

.method public static add([CIC)[C
    .locals 2
    .param p0, "array"    # [C
    .param p1, "index"    # I
    .param p2, "element"    # C

    .prologue
    .line 4062
    new-instance v0, Ljava/lang/Character;

    invoke-direct {v0, p2}, Ljava/lang/Character;-><init>(C)V

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    return-object v0
.end method

.method public static add([DD)[D
    .locals 3
    .param p0, "array"    # [D
    .param p1, "element"    # D

    .prologue
    .line 3830
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [D

    move-object v0, v1

    check-cast v0, [D

    .line 3831
    .local v0, "newArray":[D
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-wide p1, v0, v1

    .line 3832
    return-object v0
.end method

.method public static add([DID)[D
    .locals 2
    .param p0, "array"    # [D
    .param p1, "index"    # I
    .param p2, "element"    # D

    .prologue
    .line 4248
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p2, p3}, Ljava/lang/Double;-><init>(D)V

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    check-cast v0, [D

    return-object v0
.end method

.method public static add([FF)[F
    .locals 2
    .param p0, "array"    # [F
    .param p1, "element"    # F

    .prologue
    .line 3857
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [F

    move-object v0, v1

    check-cast v0, [F

    .line 3858
    .local v0, "newArray":[F
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput p1, v0, v1

    .line 3859
    return-object v0
.end method

.method public static add([FIF)[F
    .locals 2
    .param p0, "array"    # [F
    .param p1, "index"    # I
    .param p2, "element"    # F

    .prologue
    .line 4217
    new-instance v0, Ljava/lang/Float;

    invoke-direct {v0, p2}, Ljava/lang/Float;-><init>(F)V

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    check-cast v0, [F

    return-object v0
.end method

.method public static add([II)[I
    .locals 2
    .param p0, "array"    # [I
    .param p1, "element"    # I

    .prologue
    .line 3884
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    move-object v0, v1

    check-cast v0, [I

    .line 3885
    .local v0, "newArray":[I
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput p1, v0, v1

    .line 3886
    return-object v0
.end method

.method public static add([III)[I
    .locals 2
    .param p0, "array"    # [I
    .param p1, "index"    # I
    .param p2, "element"    # I

    .prologue
    .line 4155
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p2}, Ljava/lang/Integer;-><init>(I)V

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    check-cast v0, [I

    return-object v0
.end method

.method public static add([JIJ)[J
    .locals 2
    .param p0, "array"    # [J
    .param p1, "index"    # I
    .param p2, "element"    # J

    .prologue
    .line 4186
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p2, p3}, Ljava/lang/Long;-><init>(J)V

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    check-cast v0, [J

    return-object v0
.end method

.method public static add([JJ)[J
    .locals 3
    .param p0, "array"    # [J
    .param p1, "element"    # J

    .prologue
    .line 3911
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [J

    move-object v0, v1

    check-cast v0, [J

    .line 3912
    .local v0, "newArray":[J
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-wide p1, v0, v1

    .line 3913
    return-object v0
.end method

.method public static add([Ljava/lang/Object;ILjava/lang/Object;)[Ljava/lang/Object;
    .locals 4
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;

    .prologue
    .line 3991
    const/4 v0, 0x0

    .line 3992
    .local v0, "clss":Ljava/lang/Class;
    if-eqz p0, :cond_0

    .line 3993
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 3999
    :goto_0
    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    :goto_1
    return-object v1

    .line 3994
    :cond_0
    if-eqz p2, :cond_1

    .line 3995
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 3997
    :cond_1
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    goto :goto_1
.end method

.method public static add([Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 3
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 3715
    if-eqz p0, :cond_0

    .line 3716
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 3722
    .local v1, "type":Ljava/lang/Class;
    :goto_0
    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, [Ljava/lang/Object;

    .line 3723
    .local v0, "newArray":[Ljava/lang/Object;
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aput-object p1, v0, v2

    .line 3724
    return-object v0

    .line 3717
    .end local v0    # "newArray":[Ljava/lang/Object;
    .end local v1    # "type":Ljava/lang/Class;
    :cond_0
    if-eqz p1, :cond_1

    .line 3718
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .restart local v1    # "type":Ljava/lang/Class;
    goto :goto_0

    .line 3720
    .end local v1    # "type":Ljava/lang/Class;
    :cond_1
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v2, :cond_2

    const-string/jumbo v2, "java.lang.Object"

    invoke-static {v2}, Lorg/apache/commons/lang/ArrayUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/lang/ArrayUtils;->class$java$lang$Object:Ljava/lang/Class;

    .restart local v1    # "type":Ljava/lang/Class;
    :goto_1
    goto :goto_0

    .end local v1    # "type":Ljava/lang/Class;
    :cond_2
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_1
.end method

.method public static add([SIS)[S
    .locals 2
    .param p0, "array"    # [S
    .param p1, "index"    # I
    .param p2, "element"    # S

    .prologue
    .line 4124
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, p2}, Ljava/lang/Short;-><init>(S)V

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    check-cast v0, [S

    return-object v0
.end method

.method public static add([SS)[S
    .locals 2
    .param p0, "array"    # [S
    .param p1, "element"    # S

    .prologue
    .line 3938
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [S

    move-object v0, v1

    check-cast v0, [S

    .line 3939
    .local v0, "newArray":[S
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-short p1, v0, v1

    .line 3940
    return-object v0
.end method

.method public static add([ZIZ)[Z
    .locals 2
    .param p0, "array"    # [Z
    .param p1, "index"    # I
    .param p2, "element"    # Z

    .prologue
    .line 4030
    invoke-static {p2}, Lorg/apache/commons/lang/BooleanUtils;->toBooleanObject(Z)Ljava/lang/Boolean;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    check-cast v0, [Z

    return-object v0
.end method

.method public static add([ZZ)[Z
    .locals 2
    .param p0, "array"    # [Z
    .param p1, "element"    # Z

    .prologue
    .line 3749
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Z

    move-object v0, v1

    check-cast v0, [Z

    .line 3750
    .local v0, "newArray":[Z
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-boolean p1, v0, v1

    .line 3751
    return-object v0
.end method

.method public static addAll([B[B)[B
    .locals 4
    .param p0, "array1"    # [B
    .param p1, "array2"    # [B

    .prologue
    const/4 v3, 0x0

    .line 3531
    if-nez p0, :cond_0

    .line 3532
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([B)[B

    move-result-object v0

    .line 3539
    :goto_0
    return-object v0

    .line 3533
    :cond_0
    if-nez p1, :cond_1

    .line 3534
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([B)[B

    move-result-object v0

    goto :goto_0

    .line 3536
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [B

    .line 3537
    .local v0, "joinedArray":[B
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3538
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static addAll([C[C)[C
    .locals 4
    .param p0, "array1"    # [C
    .param p1, "array2"    # [C

    .prologue
    const/4 v3, 0x0

    .line 3502
    if-nez p0, :cond_0

    .line 3503
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([C)[C

    move-result-object v0

    .line 3510
    :goto_0
    return-object v0

    .line 3504
    :cond_0
    if-nez p1, :cond_1

    .line 3505
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([C)[C

    move-result-object v0

    goto :goto_0

    .line 3507
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [C

    .line 3508
    .local v0, "joinedArray":[C
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3509
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static addAll([D[D)[D
    .locals 4
    .param p0, "array1"    # [D
    .param p1, "array2"    # [D

    .prologue
    const/4 v3, 0x0

    .line 3676
    if-nez p0, :cond_0

    .line 3677
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([D)[D

    move-result-object v0

    .line 3684
    :goto_0
    return-object v0

    .line 3678
    :cond_0
    if-nez p1, :cond_1

    .line 3679
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([D)[D

    move-result-object v0

    goto :goto_0

    .line 3681
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [D

    .line 3682
    .local v0, "joinedArray":[D
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3683
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static addAll([F[F)[F
    .locals 4
    .param p0, "array1"    # [F
    .param p1, "array2"    # [F

    .prologue
    const/4 v3, 0x0

    .line 3647
    if-nez p0, :cond_0

    .line 3648
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([F)[F

    move-result-object v0

    .line 3655
    :goto_0
    return-object v0

    .line 3649
    :cond_0
    if-nez p1, :cond_1

    .line 3650
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([F)[F

    move-result-object v0

    goto :goto_0

    .line 3652
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [F

    .line 3653
    .local v0, "joinedArray":[F
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3654
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static addAll([I[I)[I
    .locals 4
    .param p0, "array1"    # [I
    .param p1, "array2"    # [I

    .prologue
    const/4 v3, 0x0

    .line 3589
    if-nez p0, :cond_0

    .line 3590
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([I)[I

    move-result-object v0

    .line 3597
    :goto_0
    return-object v0

    .line 3591
    :cond_0
    if-nez p1, :cond_1

    .line 3592
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([I)[I

    move-result-object v0

    goto :goto_0

    .line 3594
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [I

    .line 3595
    .local v0, "joinedArray":[I
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3596
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static addAll([J[J)[J
    .locals 4
    .param p0, "array1"    # [J
    .param p1, "array2"    # [J

    .prologue
    const/4 v3, 0x0

    .line 3618
    if-nez p0, :cond_0

    .line 3619
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([J)[J

    move-result-object v0

    .line 3626
    :goto_0
    return-object v0

    .line 3620
    :cond_0
    if-nez p1, :cond_1

    .line 3621
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([J)[J

    move-result-object v0

    goto :goto_0

    .line 3623
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [J

    .line 3624
    .local v0, "joinedArray":[J
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3625
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static addAll([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 8
    .param p0, "array1"    # [Ljava/lang/Object;
    .param p1, "array2"    # [Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 3428
    if-nez p0, :cond_0

    .line 3429
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 3452
    :goto_0
    return-object v1

    .line 3430
    :cond_0
    if-nez p1, :cond_1

    .line 3431
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 3433
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    array-length v5, p0

    array-length v6, p1

    add-int/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    move-object v1, v4

    check-cast v1, [Ljava/lang/Object;

    .line 3435
    .local v1, "joinedArray":[Ljava/lang/Object;
    array-length v4, p0

    invoke-static {p0, v7, v1, v7, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3437
    const/4 v4, 0x0

    :try_start_0
    array-length v5, p0

    array-length v6, p1

    invoke-static {p1, v4, v1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/ArrayStoreException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 3438
    :catch_0
    move-exception v0

    .line 3445
    .local v0, "ase":Ljava/lang/ArrayStoreException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 3446
    .local v2, "type1":Ljava/lang/Class;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    .line 3447
    .local v3, "type2":Ljava/lang/Class;
    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 3448
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Cannot store "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " in an array of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 3450
    :cond_2
    throw v0
.end method

.method public static addAll([S[S)[S
    .locals 4
    .param p0, "array1"    # [S
    .param p1, "array2"    # [S

    .prologue
    const/4 v3, 0x0

    .line 3560
    if-nez p0, :cond_0

    .line 3561
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([S)[S

    move-result-object v0

    .line 3568
    :goto_0
    return-object v0

    .line 3562
    :cond_0
    if-nez p1, :cond_1

    .line 3563
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([S)[S

    move-result-object v0

    goto :goto_0

    .line 3565
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [S

    .line 3566
    .local v0, "joinedArray":[S
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3567
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static addAll([Z[Z)[Z
    .locals 4
    .param p0, "array1"    # [Z
    .param p1, "array2"    # [Z

    .prologue
    const/4 v3, 0x0

    .line 3473
    if-nez p0, :cond_0

    .line 3474
    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->clone([Z)[Z

    move-result-object v0

    .line 3481
    :goto_0
    return-object v0

    .line 3475
    :cond_0
    if-nez p1, :cond_1

    .line 3476
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([Z)[Z

    move-result-object v0

    goto :goto_0

    .line 3478
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [Z

    .line 3479
    .local v0, "joinedArray":[Z
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3480
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 3720
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static clone([B)[B
    .locals 1
    .param p0, "array"    # [B

    .prologue
    .line 358
    if-nez p0, :cond_0

    .line 359
    const/4 v0, 0x0

    .line 361
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    goto :goto_0
.end method

.method public static clone([C)[C
    .locals 1
    .param p0, "array"    # [C

    .prologue
    .line 342
    if-nez p0, :cond_0

    .line 343
    const/4 v0, 0x0

    .line 345
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    goto :goto_0
.end method

.method public static clone([D)[D
    .locals 1
    .param p0, "array"    # [D

    .prologue
    .line 374
    if-nez p0, :cond_0

    .line 375
    const/4 v0, 0x0

    .line 377
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    check-cast v0, [D

    goto :goto_0
.end method

.method public static clone([F)[F
    .locals 1
    .param p0, "array"    # [F

    .prologue
    .line 390
    if-nez p0, :cond_0

    .line 391
    const/4 v0, 0x0

    .line 393
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    check-cast v0, [F

    goto :goto_0
.end method

.method public static clone([I)[I
    .locals 1
    .param p0, "array"    # [I

    .prologue
    .line 310
    if-nez p0, :cond_0

    .line 311
    const/4 v0, 0x0

    .line 313
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    check-cast v0, [I

    goto :goto_0
.end method

.method public static clone([J)[J
    .locals 1
    .param p0, "array"    # [J

    .prologue
    .line 294
    if-nez p0, :cond_0

    .line 295
    const/4 v0, 0x0

    .line 297
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    check-cast v0, [J

    goto :goto_0
.end method

.method public static clone([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 278
    if-nez p0, :cond_0

    .line 279
    const/4 v0, 0x0

    .line 281
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    goto :goto_0
.end method

.method public static clone([S)[S
    .locals 1
    .param p0, "array"    # [S

    .prologue
    .line 326
    if-nez p0, :cond_0

    .line 327
    const/4 v0, 0x0

    .line 329
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    check-cast v0, [S

    goto :goto_0
.end method

.method public static clone([Z)[Z
    .locals 1
    .param p0, "array"    # [Z

    .prologue
    .line 406
    if-nez p0, :cond_0

    .line 407
    const/4 v0, 0x0

    .line 409
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    check-cast v0, [Z

    goto :goto_0
.end method

.method public static contains([BB)Z
    .locals 2
    .param p0, "array"    # [B
    .param p1, "valueToFind"    # B

    .prologue
    .line 2195
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([BB)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([CC)Z
    .locals 2
    .param p0, "array"    # [C
    .param p1, "valueToFind"    # C

    .prologue
    .line 2092
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([CC)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([DD)Z
    .locals 3
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D

    .prologue
    .line 2402
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([DD)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([DDD)Z
    .locals 7
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D
    .param p3, "tolerance"    # D

    .prologue
    const/4 v3, 0x0

    .line 2419
    move-object v0, p0

    move-wide v1, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([DDID)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3
.end method

.method public static contains([FF)Z
    .locals 2
    .param p0, "array"    # [F
    .param p1, "valueToFind"    # F

    .prologue
    .line 2522
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([FF)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([II)Z
    .locals 2
    .param p0, "array"    # [I
    .param p1, "valueToFind"    # I

    .prologue
    .line 1881
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([II)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([JJ)Z
    .locals 3
    .param p0, "array"    # [J
    .param p1, "valueToFind"    # J

    .prologue
    .line 1778
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([JJ)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "objectToFind"    # Ljava/lang/Object;

    .prologue
    .line 1675
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([SS)Z
    .locals 2
    .param p0, "array"    # [S
    .param p1, "valueToFind"    # S

    .prologue
    .line 1984
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([SS)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([ZZ)Z
    .locals 2
    .param p0, "array"    # [Z
    .param p1, "valueToFind"    # Z

    .prologue
    .line 2627
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([ZZ)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 5
    .param p0, "array"    # Ljava/lang/Object;
    .param p1, "newArrayComponentType"    # Ljava/lang/Class;

    .prologue
    const/4 v4, 0x0

    .line 3953
    if-eqz p0, :cond_0

    .line 3954
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 3955
    .local v0, "arrayLength":I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 3956
    .local v1, "newArray":Ljava/lang/Object;
    invoke-static {p0, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3959
    .end local v0    # "arrayLength":I
    .end local v1    # "newArray":Ljava/lang/Object;
    :goto_0
    return-object v1

    :cond_0
    const/4 v2, 0x1

    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public static getLength(Ljava/lang/Object;)I
    .locals 1
    .param p0, "array"    # Ljava/lang/Object;

    .prologue
    .line 1323
    if-nez p0, :cond_0

    .line 1324
    const/4 v0, 0x0

    .line 1326
    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method public static hashCode(Ljava/lang/Object;)I
    .locals 1
    .param p0, "array"    # Ljava/lang/Object;

    .prologue
    .line 192
    new-instance v0, Lorg/apache/commons/lang/builder/HashCodeBuilder;

    invoke-direct {v0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;-><init>()V

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/builder/HashCodeBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/builder/HashCodeBuilder;->toHashCode()I

    move-result v0

    return v0
.end method

.method public static indexOf([BB)I
    .locals 1
    .param p0, "array"    # [B
    .param p1, "valueToFind"    # B

    .prologue
    .line 2108
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([BBI)I

    move-result v0

    return v0
.end method

.method public static indexOf([BBI)I
    .locals 3
    .param p0, "array"    # [B
    .param p1, "valueToFind"    # B
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2126
    if-nez p0, :cond_1

    move v0, v1

    .line 2137
    :cond_0
    :goto_0
    return v0

    .line 2129
    :cond_1
    if-gez p2, :cond_2

    .line 2130
    const/4 p2, 0x0

    .line 2132
    :cond_2
    move v0, p2

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 2133
    aget-byte v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2132
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 2137
    goto :goto_0
.end method

.method public static indexOf([CC)I
    .locals 1
    .param p0, "array"    # [C
    .param p1, "valueToFind"    # C

    .prologue
    .line 2001
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([CCI)I

    move-result v0

    return v0
.end method

.method public static indexOf([CCI)I
    .locals 3
    .param p0, "array"    # [C
    .param p1, "valueToFind"    # C
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2020
    if-nez p0, :cond_1

    move v0, v1

    .line 2031
    :cond_0
    :goto_0
    return v0

    .line 2023
    :cond_1
    if-gez p2, :cond_2

    .line 2024
    const/4 p2, 0x0

    .line 2026
    :cond_2
    move v0, p2

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 2027
    aget-char v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2026
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 2031
    goto :goto_0
.end method

.method public static indexOf([DD)I
    .locals 1
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D

    .prologue
    .line 2211
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([DDI)I

    move-result v0

    return v0
.end method

.method public static indexOf([DDD)I
    .locals 7
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D
    .param p3, "tolerance"    # D

    .prologue
    .line 2228
    const/4 v3, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([DDID)I

    move-result v0

    return v0
.end method

.method public static indexOf([DDI)I
    .locals 5
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D
    .param p3, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2246
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([D)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2257
    :cond_0
    :goto_0
    return v0

    .line 2249
    :cond_1
    if-gez p3, :cond_2

    .line 2250
    const/4 p3, 0x0

    .line 2252
    :cond_2
    move v0, p3

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 2253
    aget-wide v2, p0, v0

    cmpl-double v2, p1, v2

    if-eqz v2, :cond_0

    .line 2252
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 2257
    goto :goto_0
.end method

.method public static indexOf([DDID)I
    .locals 8
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D
    .param p3, "startIndex"    # I
    .param p4, "tolerance"    # D

    .prologue
    const/4 v1, -0x1

    .line 2278
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([D)Z

    move-result v6

    if-eqz v6, :cond_1

    move v0, v1

    .line 2291
    :cond_0
    :goto_0
    return v0

    .line 2281
    :cond_1
    if-gez p3, :cond_2

    .line 2282
    const/4 p3, 0x0

    .line 2284
    :cond_2
    sub-double v4, p1, p4

    .line 2285
    .local v4, "min":D
    add-double v2, p1, p4

    .line 2286
    .local v2, "max":D
    move v0, p3

    .local v0, "i":I
    :goto_1
    array-length v6, p0

    if-ge v0, v6, :cond_4

    .line 2287
    aget-wide v6, p0, v0

    cmpl-double v6, v6, v4

    if-ltz v6, :cond_3

    aget-wide v6, p0, v0

    cmpg-double v6, v6, v2

    if-lez v6, :cond_0

    .line 2286
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 2291
    goto :goto_0
.end method

.method public static indexOf([FF)I
    .locals 1
    .param p0, "array"    # [F
    .param p1, "valueToFind"    # F

    .prologue
    .line 2435
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([FFI)I

    move-result v0

    return v0
.end method

.method public static indexOf([FFI)I
    .locals 3
    .param p0, "array"    # [F
    .param p1, "valueToFind"    # F
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2453
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([F)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2464
    :cond_0
    :goto_0
    return v0

    .line 2456
    :cond_1
    if-gez p2, :cond_2

    .line 2457
    const/4 p2, 0x0

    .line 2459
    :cond_2
    move v0, p2

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 2460
    aget v2, p0, v0

    cmpl-float v2, p1, v2

    if-eqz v2, :cond_0

    .line 2459
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 2464
    goto :goto_0
.end method

.method public static indexOf([II)I
    .locals 1
    .param p0, "array"    # [I
    .param p1, "valueToFind"    # I

    .prologue
    .line 1794
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([III)I

    move-result v0

    return v0
.end method

.method public static indexOf([III)I
    .locals 3
    .param p0, "array"    # [I
    .param p1, "valueToFind"    # I
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 1812
    if-nez p0, :cond_1

    move v0, v1

    .line 1823
    :cond_0
    :goto_0
    return v0

    .line 1815
    :cond_1
    if-gez p2, :cond_2

    .line 1816
    const/4 p2, 0x0

    .line 1818
    :cond_2
    move v0, p2

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 1819
    aget v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 1818
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 1823
    goto :goto_0
.end method

.method public static indexOf([JJ)I
    .locals 1
    .param p0, "array"    # [J
    .param p1, "valueToFind"    # J

    .prologue
    .line 1691
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([JJI)I

    move-result v0

    return v0
.end method

.method public static indexOf([JJI)I
    .locals 5
    .param p0, "array"    # [J
    .param p1, "valueToFind"    # J
    .param p3, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 1709
    if-nez p0, :cond_1

    move v0, v1

    .line 1720
    :cond_0
    :goto_0
    return v0

    .line 1712
    :cond_1
    if-gez p3, :cond_2

    .line 1713
    const/4 p3, 0x0

    .line 1715
    :cond_2
    move v0, p3

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 1716
    aget-wide v2, p0, v0

    cmp-long v2, p1, v2

    if-eqz v2, :cond_0

    .line 1715
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 1720
    goto :goto_0
.end method

.method public static indexOf([Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "objectToFind"    # Ljava/lang/Object;

    .prologue
    .line 1572
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([Ljava/lang/Object;Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public static indexOf([Ljava/lang/Object;Ljava/lang/Object;I)I
    .locals 3
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "objectToFind"    # Ljava/lang/Object;
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 1590
    if-nez p0, :cond_1

    move v0, v1

    .line 1609
    :cond_0
    :goto_0
    return v0

    .line 1593
    :cond_1
    if-gez p2, :cond_2

    .line 1594
    const/4 p2, 0x0

    .line 1596
    :cond_2
    if-nez p1, :cond_3

    .line 1597
    move v0, p2

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_4

    .line 1598
    aget-object v2, p0, v0

    if-eqz v2, :cond_0

    .line 1597
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1603
    .end local v0    # "i":I
    :cond_3
    move v0, p2

    .restart local v0    # "i":I
    :goto_2
    array-length v2, p0

    if-ge v0, v2, :cond_4

    .line 1604
    aget-object v2, p0, v0

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1603
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    move v0, v1

    .line 1609
    goto :goto_0
.end method

.method public static indexOf([SS)I
    .locals 1
    .param p0, "array"    # [S
    .param p1, "valueToFind"    # S

    .prologue
    .line 1897
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([SSI)I

    move-result v0

    return v0
.end method

.method public static indexOf([SSI)I
    .locals 3
    .param p0, "array"    # [S
    .param p1, "valueToFind"    # S
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 1915
    if-nez p0, :cond_1

    move v0, v1

    .line 1926
    :cond_0
    :goto_0
    return v0

    .line 1918
    :cond_1
    if-gez p2, :cond_2

    .line 1919
    const/4 p2, 0x0

    .line 1921
    :cond_2
    move v0, p2

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 1922
    aget-short v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 1921
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 1926
    goto :goto_0
.end method

.method public static indexOf([ZZ)I
    .locals 1
    .param p0, "array"    # [Z
    .param p1, "valueToFind"    # Z

    .prologue
    .line 2538
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([ZZI)I

    move-result v0

    return v0
.end method

.method public static indexOf([ZZI)I
    .locals 3
    .param p0, "array"    # [Z
    .param p1, "valueToFind"    # Z
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2557
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([Z)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2568
    :cond_0
    :goto_0
    return v0

    .line 2560
    :cond_1
    if-gez p2, :cond_2

    .line 2561
    const/4 p2, 0x0

    .line 2563
    :cond_2
    move v0, p2

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 2564
    aget-boolean v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2563
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 2568
    goto :goto_0
.end method

.method public static isEmpty([B)Z
    .locals 1
    .param p0, "array"    # [B

    .prologue
    .line 3256
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3257
    :cond_0
    const/4 v0, 0x1

    .line 3259
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([C)Z
    .locals 1
    .param p0, "array"    # [C

    .prologue
    .line 3242
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3243
    :cond_0
    const/4 v0, 0x1

    .line 3245
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([D)Z
    .locals 1
    .param p0, "array"    # [D

    .prologue
    .line 3270
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3271
    :cond_0
    const/4 v0, 0x1

    .line 3273
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([F)Z
    .locals 1
    .param p0, "array"    # [F

    .prologue
    .line 3284
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3285
    :cond_0
    const/4 v0, 0x1

    .line 3287
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([I)Z
    .locals 1
    .param p0, "array"    # [I

    .prologue
    .line 3214
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3215
    :cond_0
    const/4 v0, 0x1

    .line 3217
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([J)Z
    .locals 1
    .param p0, "array"    # [J

    .prologue
    .line 3200
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3201
    :cond_0
    const/4 v0, 0x1

    .line 3203
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([Ljava/lang/Object;)Z
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 3186
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3187
    :cond_0
    const/4 v0, 0x1

    .line 3189
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([S)Z
    .locals 1
    .param p0, "array"    # [S

    .prologue
    .line 3228
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3229
    :cond_0
    const/4 v0, 0x1

    .line 3231
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([Z)Z
    .locals 1
    .param p0, "array"    # [Z

    .prologue
    .line 3298
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3299
    :cond_0
    const/4 v0, 0x1

    .line 3301
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "array1"    # Ljava/lang/Object;
    .param p1, "array2"    # Ljava/lang/Object;

    .prologue
    .line 206
    new-instance v0, Lorg/apache/commons/lang/builder/EqualsBuilder;

    invoke-direct {v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang/builder/EqualsBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang/builder/EqualsBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/builder/EqualsBuilder;->isEquals()Z

    move-result v0

    return v0
.end method

.method public static isNotEmpty([B)Z
    .locals 1
    .param p0, "array"    # [B

    .prologue
    .line 3368
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([C)Z
    .locals 1
    .param p0, "array"    # [C

    .prologue
    .line 3357
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([D)Z
    .locals 1
    .param p0, "array"    # [D

    .prologue
    .line 3379
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([F)Z
    .locals 1
    .param p0, "array"    # [F

    .prologue
    .line 3390
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([I)Z
    .locals 1
    .param p0, "array"    # [I

    .prologue
    .line 3335
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([J)Z
    .locals 1
    .param p0, "array"    # [J

    .prologue
    .line 3324
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([Ljava/lang/Object;)Z
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 3313
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([S)Z
    .locals 1
    .param p0, "array"    # [S

    .prologue
    .line 3346
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([Z)Z
    .locals 1
    .param p0, "array"    # [Z

    .prologue
    .line 3401
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSameLength([B[B)Z
    .locals 2
    .param p0, "array1"    # [B
    .param p1, "array2"    # [B

    .prologue
    .line 1239
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1242
    :cond_2
    const/4 v0, 0x0

    .line 1244
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([C[C)Z
    .locals 2
    .param p0, "array1"    # [C
    .param p1, "array2"    # [C

    .prologue
    .line 1221
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1224
    :cond_2
    const/4 v0, 0x0

    .line 1226
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([D[D)Z
    .locals 2
    .param p0, "array1"    # [D
    .param p1, "array2"    # [D

    .prologue
    .line 1257
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1260
    :cond_2
    const/4 v0, 0x0

    .line 1262
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([F[F)Z
    .locals 2
    .param p0, "array1"    # [F
    .param p1, "array2"    # [F

    .prologue
    .line 1275
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1278
    :cond_2
    const/4 v0, 0x0

    .line 1280
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([I[I)Z
    .locals 2
    .param p0, "array1"    # [I
    .param p1, "array2"    # [I

    .prologue
    .line 1185
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1188
    :cond_2
    const/4 v0, 0x0

    .line 1190
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([J[J)Z
    .locals 2
    .param p0, "array1"    # [J
    .param p1, "array2"    # [J

    .prologue
    .line 1167
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1170
    :cond_2
    const/4 v0, 0x0

    .line 1172
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([Ljava/lang/Object;[Ljava/lang/Object;)Z
    .locals 2
    .param p0, "array1"    # [Ljava/lang/Object;
    .param p1, "array2"    # [Ljava/lang/Object;

    .prologue
    .line 1149
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1152
    :cond_2
    const/4 v0, 0x0

    .line 1154
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([S[S)Z
    .locals 2
    .param p0, "array1"    # [S
    .param p1, "array2"    # [S

    .prologue
    .line 1203
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1206
    :cond_2
    const/4 v0, 0x0

    .line 1208
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([Z[Z)Z
    .locals 2
    .param p0, "array1"    # [Z
    .param p1, "array2"    # [Z

    .prologue
    .line 1293
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1296
    :cond_2
    const/4 v0, 0x0

    .line 1298
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameType(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .param p0, "array1"    # Ljava/lang/Object;
    .param p1, "array2"    # Ljava/lang/Object;

    .prologue
    .line 1339
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1340
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1342
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static lastIndexOf([BB)I
    .locals 1
    .param p0, "array"    # [B
    .param p1, "valueToFind"    # B

    .prologue
    .line 2151
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([BBI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([BBI)I
    .locals 3
    .param p0, "array"    # [B
    .param p1, "valueToFind"    # B
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2169
    if-nez p0, :cond_1

    move v0, v1

    .line 2182
    :cond_0
    :goto_0
    return v0

    .line 2172
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 2173
    goto :goto_0

    .line 2174
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2175
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2177
    :cond_3
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_4

    .line 2178
    aget-byte v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2177
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 2182
    goto :goto_0
.end method

.method public static lastIndexOf([CC)I
    .locals 1
    .param p0, "array"    # [C
    .param p1, "valueToFind"    # C

    .prologue
    .line 2046
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([CCI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([CCI)I
    .locals 3
    .param p0, "array"    # [C
    .param p1, "valueToFind"    # C
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2065
    if-nez p0, :cond_1

    move v0, v1

    .line 2078
    :cond_0
    :goto_0
    return v0

    .line 2068
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 2069
    goto :goto_0

    .line 2070
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2071
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2073
    :cond_3
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_4

    .line 2074
    aget-char v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2073
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 2078
    goto :goto_0
.end method

.method public static lastIndexOf([DD)I
    .locals 1
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D

    .prologue
    .line 2305
    const v0, 0x7fffffff

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([DDI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([DDD)I
    .locals 7
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D
    .param p3, "tolerance"    # D

    .prologue
    .line 2322
    const v3, 0x7fffffff

    move-object v0, p0

    move-wide v1, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([DDID)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([DDI)I
    .locals 5
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D
    .param p3, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2340
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([D)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2353
    :cond_0
    :goto_0
    return v0

    .line 2343
    :cond_1
    if-gez p3, :cond_2

    move v0, v1

    .line 2344
    goto :goto_0

    .line 2345
    :cond_2
    array-length v2, p0

    if-lt p3, v2, :cond_3

    .line 2346
    array-length v2, p0

    add-int/lit8 p3, v2, -0x1

    .line 2348
    :cond_3
    move v0, p3

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_4

    .line 2349
    aget-wide v2, p0, v0

    cmpl-double v2, p1, v2

    if-eqz v2, :cond_0

    .line 2348
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 2353
    goto :goto_0
.end method

.method public static lastIndexOf([DDID)I
    .locals 8
    .param p0, "array"    # [D
    .param p1, "valueToFind"    # D
    .param p3, "startIndex"    # I
    .param p4, "tolerance"    # D

    .prologue
    const/4 v1, -0x1

    .line 2374
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([D)Z

    move-result v6

    if-eqz v6, :cond_1

    move v0, v1

    .line 2389
    :cond_0
    :goto_0
    return v0

    .line 2377
    :cond_1
    if-gez p3, :cond_2

    move v0, v1

    .line 2378
    goto :goto_0

    .line 2379
    :cond_2
    array-length v6, p0

    if-lt p3, v6, :cond_3

    .line 2380
    array-length v6, p0

    add-int/lit8 p3, v6, -0x1

    .line 2382
    :cond_3
    sub-double v4, p1, p4

    .line 2383
    .local v4, "min":D
    add-double v2, p1, p4

    .line 2384
    .local v2, "max":D
    move v0, p3

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_5

    .line 2385
    aget-wide v6, p0, v0

    cmpl-double v6, v6, v4

    if-ltz v6, :cond_4

    aget-wide v6, p0, v0

    cmpg-double v6, v6, v2

    if-lez v6, :cond_0

    .line 2384
    :cond_4
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_5
    move v0, v1

    .line 2389
    goto :goto_0
.end method

.method public static lastIndexOf([FF)I
    .locals 1
    .param p0, "array"    # [F
    .param p1, "valueToFind"    # F

    .prologue
    .line 2478
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([FFI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([FFI)I
    .locals 3
    .param p0, "array"    # [F
    .param p1, "valueToFind"    # F
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2496
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([F)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2509
    :cond_0
    :goto_0
    return v0

    .line 2499
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 2500
    goto :goto_0

    .line 2501
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2502
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2504
    :cond_3
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_4

    .line 2505
    aget v2, p0, v0

    cmpl-float v2, p1, v2

    if-eqz v2, :cond_0

    .line 2504
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 2509
    goto :goto_0
.end method

.method public static lastIndexOf([II)I
    .locals 1
    .param p0, "array"    # [I
    .param p1, "valueToFind"    # I

    .prologue
    .line 1837
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([III)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([III)I
    .locals 3
    .param p0, "array"    # [I
    .param p1, "valueToFind"    # I
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 1855
    if-nez p0, :cond_1

    move v0, v1

    .line 1868
    :cond_0
    :goto_0
    return v0

    .line 1858
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 1859
    goto :goto_0

    .line 1860
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 1861
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 1863
    :cond_3
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_4

    .line 1864
    aget v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 1863
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 1868
    goto :goto_0
.end method

.method public static lastIndexOf([JJ)I
    .locals 1
    .param p0, "array"    # [J
    .param p1, "valueToFind"    # J

    .prologue
    .line 1734
    const v0, 0x7fffffff

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([JJI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([JJI)I
    .locals 5
    .param p0, "array"    # [J
    .param p1, "valueToFind"    # J
    .param p3, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 1752
    if-nez p0, :cond_1

    move v0, v1

    .line 1765
    :cond_0
    :goto_0
    return v0

    .line 1755
    :cond_1
    if-gez p3, :cond_2

    move v0, v1

    .line 1756
    goto :goto_0

    .line 1757
    :cond_2
    array-length v2, p0

    if-lt p3, v2, :cond_3

    .line 1758
    array-length v2, p0

    add-int/lit8 p3, v2, -0x1

    .line 1760
    :cond_3
    move v0, p3

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_4

    .line 1761
    aget-wide v2, p0, v0

    cmp-long v2, p1, v2

    if-eqz v2, :cond_0

    .line 1760
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 1765
    goto :goto_0
.end method

.method public static lastIndexOf([Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "objectToFind"    # Ljava/lang/Object;

    .prologue
    .line 1623
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([Ljava/lang/Object;Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([Ljava/lang/Object;Ljava/lang/Object;I)I
    .locals 3
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "objectToFind"    # Ljava/lang/Object;
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 1641
    if-nez p0, :cond_1

    move v0, v1

    .line 1662
    :cond_0
    :goto_0
    return v0

    .line 1644
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 1645
    goto :goto_0

    .line 1646
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 1647
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 1649
    :cond_3
    if-nez p1, :cond_4

    .line 1650
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_5

    .line 1651
    aget-object v2, p0, v0

    if-eqz v2, :cond_0

    .line 1650
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 1656
    .end local v0    # "i":I
    :cond_4
    move v0, p2

    .restart local v0    # "i":I
    :goto_2
    if-ltz v0, :cond_5

    .line 1657
    aget-object v2, p0, v0

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1656
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_5
    move v0, v1

    .line 1662
    goto :goto_0
.end method

.method public static lastIndexOf([SS)I
    .locals 1
    .param p0, "array"    # [S
    .param p1, "valueToFind"    # S

    .prologue
    .line 1940
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([SSI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([SSI)I
    .locals 3
    .param p0, "array"    # [S
    .param p1, "valueToFind"    # S
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 1958
    if-nez p0, :cond_1

    move v0, v1

    .line 1971
    :cond_0
    :goto_0
    return v0

    .line 1961
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 1962
    goto :goto_0

    .line 1963
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 1964
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 1966
    :cond_3
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_4

    .line 1967
    aget-short v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 1966
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 1971
    goto :goto_0
.end method

.method public static lastIndexOf([ZZ)I
    .locals 1
    .param p0, "array"    # [Z
    .param p1, "valueToFind"    # Z

    .prologue
    .line 2583
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/ArrayUtils;->lastIndexOf([ZZI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([ZZI)I
    .locals 3
    .param p0, "array"    # [Z
    .param p1, "valueToFind"    # Z
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2601
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([Z)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2614
    :cond_0
    :goto_0
    return v0

    .line 2604
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 2605
    goto :goto_0

    .line 2606
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2607
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2609
    :cond_3
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_4

    .line 2610
    aget-boolean v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2609
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_4
    move v0, v1

    .line 2614
    goto :goto_0
.end method

.method public static nullToEmpty([B)[B
    .locals 1
    .param p0, "array"    # [B

    .prologue
    .line 548
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 549
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    .line 551
    .end local p0    # "array":[B
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([C)[C
    .locals 1
    .param p0, "array"    # [C

    .prologue
    .line 528
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 529
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 531
    .end local p0    # "array":[C
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([D)[D
    .locals 1
    .param p0, "array"    # [D

    .prologue
    .line 568
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 569
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    .line 571
    .end local p0    # "array":[D
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([F)[F
    .locals 1
    .param p0, "array"    # [F

    .prologue
    .line 588
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 589
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    .line 591
    .end local p0    # "array":[F
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([I)[I
    .locals 1
    .param p0, "array"    # [I

    .prologue
    .line 488
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 489
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_INT_ARRAY:[I

    .line 491
    .end local p0    # "array":[I
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([J)[J
    .locals 1
    .param p0, "array"    # [J

    .prologue
    .line 468
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 469
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    .line 471
    .end local p0    # "array":[J
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Boolean;)[Ljava/lang/Boolean;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Boolean;

    .prologue
    .line 768
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 769
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

    .line 771
    .end local p0    # "array":[Ljava/lang/Boolean;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Byte;)[Ljava/lang/Byte;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Byte;

    .prologue
    .line 708
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 709
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

    .line 711
    .end local p0    # "array":[Ljava/lang/Byte;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Character;)[Ljava/lang/Character;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Character;

    .prologue
    .line 688
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 689
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

    .line 691
    .end local p0    # "array":[Ljava/lang/Character;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Double;)[Ljava/lang/Double;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Double;

    .prologue
    .line 728
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 729
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

    .line 731
    .end local p0    # "array":[Ljava/lang/Double;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Float;)[Ljava/lang/Float;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Float;

    .prologue
    .line 748
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 749
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

    .line 751
    .end local p0    # "array":[Ljava/lang/Float;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Integer;)[Ljava/lang/Integer;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Integer;

    .prologue
    .line 648
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 649
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

    .line 651
    .end local p0    # "array":[Ljava/lang/Integer;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Long;)[Ljava/lang/Long;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Long;

    .prologue
    .line 628
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 629
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

    .line 631
    .end local p0    # "array":[Ljava/lang/Long;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 428
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 429
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 431
    .end local p0    # "array":[Ljava/lang/Object;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Short;)[Ljava/lang/Short;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Short;

    .prologue
    .line 668
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 669
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

    .line 671
    .end local p0    # "array":[Ljava/lang/Short;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p0, "array"    # [Ljava/lang/String;

    .prologue
    .line 448
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 449
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 451
    .end local p0    # "array":[Ljava/lang/String;
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([S)[S
    .locals 1
    .param p0, "array"    # [S

    .prologue
    .line 508
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 509
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    .line 511
    .end local p0    # "array":[S
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Z)[Z
    .locals 1
    .param p0, "array"    # [Z

    .prologue
    .line 608
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 609
    :cond_0
    sget-object p0, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    .line 611
    .end local p0    # "array":[Z
    :cond_1
    return-object p0
.end method

.method private static remove(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 5
    .param p0, "array"    # Ljava/lang/Object;
    .param p1, "index"    # I

    .prologue
    const/4 v4, 0x0

    .line 4891
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 4892
    .local v0, "length":I
    if-ltz p1, :cond_0

    if-lt p1, v0, :cond_1

    .line 4893
    :cond_0
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ", Length: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 4896
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    add-int/lit8 v3, v0, -0x1

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 4897
    .local v1, "result":Ljava/lang/Object;
    invoke-static {p0, v4, v1, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4898
    add-int/lit8 v2, v0, -0x1

    if-ge p1, v2, :cond_2

    .line 4899
    add-int/lit8 v2, p1, 0x1

    sub-int v3, v0, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {p0, v2, v1, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4902
    :cond_2
    return-object v1
.end method

.method public static remove([BI)[B
    .locals 1
    .param p0, "array"    # [B
    .param p1, "index"    # I

    .prologue
    .line 4443
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    check-cast v0, [B

    return-object v0
.end method

.method public static remove([CI)[C
    .locals 1
    .param p0, "array"    # [C
    .param p1, "index"    # I

    .prologue
    .line 4508
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    return-object v0
.end method

.method public static remove([DI)[D
    .locals 1
    .param p0, "array"    # [D
    .param p1, "index"    # I

    .prologue
    .line 4573
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    check-cast v0, [D

    return-object v0
.end method

.method public static remove([FI)[F
    .locals 1
    .param p0, "array"    # [F
    .param p1, "index"    # I

    .prologue
    .line 4638
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    check-cast v0, [F

    return-object v0
.end method

.method public static remove([II)[I
    .locals 1
    .param p0, "array"    # [I
    .param p1, "index"    # I

    .prologue
    .line 4703
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    check-cast v0, [I

    return-object v0
.end method

.method public static remove([JI)[J
    .locals 1
    .param p0, "array"    # [J
    .param p1, "index"    # I

    .prologue
    .line 4768
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    check-cast v0, [J

    return-object v0
.end method

.method public static remove([Ljava/lang/Object;I)[Ljava/lang/Object;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "index"    # I

    .prologue
    .line 4313
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    return-object v0
.end method

.method public static remove([SI)[S
    .locals 1
    .param p0, "array"    # [S
    .param p1, "index"    # I

    .prologue
    .line 4833
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    check-cast v0, [S

    return-object v0
.end method

.method public static remove([ZI)[Z
    .locals 1
    .param p0, "array"    # [Z
    .param p1, "index"    # I

    .prologue
    .line 4378
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    check-cast v0, [Z

    return-object v0
.end method

.method public static removeElement([BB)[B
    .locals 2
    .param p0, "array"    # [B
    .param p1, "element"    # B

    .prologue
    .line 4472
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([BB)I

    move-result v0

    .line 4473
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4474
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([B)[B

    move-result-object v1

    .line 4476
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([BI)[B

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([CC)[C
    .locals 2
    .param p0, "array"    # [C
    .param p1, "element"    # C

    .prologue
    .line 4537
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([CC)I

    move-result v0

    .line 4538
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4539
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([C)[C

    move-result-object v1

    .line 4541
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([CI)[C

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([DD)[D
    .locals 3
    .param p0, "array"    # [D
    .param p1, "element"    # D

    .prologue
    .line 4602
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([DD)I

    move-result v0

    .line 4603
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4604
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([D)[D

    move-result-object v1

    .line 4606
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([DI)[D

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([FF)[F
    .locals 2
    .param p0, "array"    # [F
    .param p1, "element"    # F

    .prologue
    .line 4667
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([FF)I

    move-result v0

    .line 4668
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4669
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([F)[F

    move-result-object v1

    .line 4671
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([FI)[F

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([II)[I
    .locals 2
    .param p0, "array"    # [I
    .param p1, "element"    # I

    .prologue
    .line 4732
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([II)I

    move-result v0

    .line 4733
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4734
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([I)[I

    move-result-object v1

    .line 4736
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([II)[I

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([JJ)[J
    .locals 3
    .param p0, "array"    # [J
    .param p1, "element"    # J

    .prologue
    .line 4797
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([JJ)I

    move-result v0

    .line 4798
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4799
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([J)[J

    move-result-object v1

    .line 4801
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([JI)[J

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 4342
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 4343
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4344
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 4346
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([SS)[S
    .locals 2
    .param p0, "array"    # [S
    .param p1, "element"    # S

    .prologue
    .line 4862
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([SS)I

    move-result v0

    .line 4863
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4864
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([S)[S

    move-result-object v1

    .line 4866
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([SI)[S

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([ZZ)[Z
    .locals 2
    .param p0, "array"    # [Z
    .param p1, "element"    # Z

    .prologue
    .line 4407
    invoke-static {p0, p1}, Lorg/apache/commons/lang/ArrayUtils;->indexOf([ZZ)I

    move-result v0

    .line 4408
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4409
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->clone([Z)[Z

    move-result-object v1

    .line 4411
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->remove([ZI)[Z

    move-result-object v1

    goto :goto_0
.end method

.method public static reverse([B)V
    .locals 4
    .param p0, "array"    # [B

    .prologue
    .line 1472
    if-nez p0, :cond_1

    .line 1485
    :cond_0
    return-void

    .line 1475
    :cond_1
    const/4 v0, 0x0

    .line 1476
    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1478
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1479
    aget-byte v2, p0, v1

    .line 1480
    .local v2, "tmp":B
    aget-byte v3, p0, v0

    aput-byte v3, p0, v1

    .line 1481
    aput-byte v2, p0, v0

    .line 1482
    add-int/lit8 v1, v1, -0x1

    .line 1483
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([C)V
    .locals 4
    .param p0, "array"    # [C

    .prologue
    .line 1449
    if-nez p0, :cond_1

    .line 1462
    :cond_0
    return-void

    .line 1452
    :cond_1
    const/4 v0, 0x0

    .line 1453
    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1455
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1456
    aget-char v2, p0, v1

    .line 1457
    .local v2, "tmp":C
    aget-char v3, p0, v0

    aput-char v3, p0, v1

    .line 1458
    aput-char v2, p0, v0

    .line 1459
    add-int/lit8 v1, v1, -0x1

    .line 1460
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([D)V
    .locals 6
    .param p0, "array"    # [D

    .prologue
    .line 1495
    if-nez p0, :cond_1

    .line 1508
    :cond_0
    return-void

    .line 1498
    :cond_1
    const/4 v0, 0x0

    .line 1499
    .local v0, "i":I
    array-length v4, p0

    add-int/lit8 v1, v4, -0x1

    .line 1501
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1502
    aget-wide v2, p0, v1

    .line 1503
    .local v2, "tmp":D
    aget-wide v4, p0, v0

    aput-wide v4, p0, v1

    .line 1504
    aput-wide v2, p0, v0

    .line 1505
    add-int/lit8 v1, v1, -0x1

    .line 1506
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([F)V
    .locals 4
    .param p0, "array"    # [F

    .prologue
    .line 1518
    if-nez p0, :cond_1

    .line 1531
    :cond_0
    return-void

    .line 1521
    :cond_1
    const/4 v0, 0x0

    .line 1522
    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1524
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1525
    aget v2, p0, v1

    .line 1526
    .local v2, "tmp":F
    aget v3, p0, v0

    aput v3, p0, v1

    .line 1527
    aput v2, p0, v0

    .line 1528
    add-int/lit8 v1, v1, -0x1

    .line 1529
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([I)V
    .locals 4
    .param p0, "array"    # [I

    .prologue
    .line 1403
    if-nez p0, :cond_1

    .line 1416
    :cond_0
    return-void

    .line 1406
    :cond_1
    const/4 v0, 0x0

    .line 1407
    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1409
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1410
    aget v2, p0, v1

    .line 1411
    .local v2, "tmp":I
    aget v3, p0, v0

    aput v3, p0, v1

    .line 1412
    aput v2, p0, v0

    .line 1413
    add-int/lit8 v1, v1, -0x1

    .line 1414
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([J)V
    .locals 6
    .param p0, "array"    # [J

    .prologue
    .line 1380
    if-nez p0, :cond_1

    .line 1393
    :cond_0
    return-void

    .line 1383
    :cond_1
    const/4 v0, 0x0

    .line 1384
    .local v0, "i":I
    array-length v4, p0

    add-int/lit8 v1, v4, -0x1

    .line 1386
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1387
    aget-wide v2, p0, v1

    .line 1388
    .local v2, "tmp":J
    aget-wide v4, p0, v0

    aput-wide v4, p0, v1

    .line 1389
    aput-wide v2, p0, v0

    .line 1390
    add-int/lit8 v1, v1, -0x1

    .line 1391
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([Ljava/lang/Object;)V
    .locals 4
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 1357
    if-nez p0, :cond_1

    .line 1370
    :cond_0
    return-void

    .line 1360
    :cond_1
    const/4 v0, 0x0

    .line 1361
    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1363
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1364
    aget-object v2, p0, v1

    .line 1365
    .local v2, "tmp":Ljava/lang/Object;
    aget-object v3, p0, v0

    aput-object v3, p0, v1

    .line 1366
    aput-object v2, p0, v0

    .line 1367
    add-int/lit8 v1, v1, -0x1

    .line 1368
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([S)V
    .locals 4
    .param p0, "array"    # [S

    .prologue
    .line 1426
    if-nez p0, :cond_1

    .line 1439
    :cond_0
    return-void

    .line 1429
    :cond_1
    const/4 v0, 0x0

    .line 1430
    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1432
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1433
    aget-short v2, p0, v1

    .line 1434
    .local v2, "tmp":S
    aget-short v3, p0, v0

    aput-short v3, p0, v1

    .line 1435
    aput-short v2, p0, v0

    .line 1436
    add-int/lit8 v1, v1, -0x1

    .line 1437
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([Z)V
    .locals 4
    .param p0, "array"    # [Z

    .prologue
    .line 1541
    if-nez p0, :cond_1

    .line 1554
    :cond_0
    return-void

    .line 1544
    :cond_1
    const/4 v0, 0x0

    .line 1545
    .local v0, "i":I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1547
    .local v1, "j":I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1548
    aget-boolean v2, p0, v1

    .line 1549
    .local v2, "tmp":Z
    aget-boolean v3, p0, v0

    aput-boolean v3, p0, v1

    .line 1550
    aput-boolean v2, p0, v0

    .line 1551
    add-int/lit8 v1, v1, -0x1

    .line 1552
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static subarray([BII)[B
    .locals 3
    .param p0, "array"    # [B
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    .line 999
    if-nez p0, :cond_0

    .line 1000
    const/4 v1, 0x0

    .line 1015
    :goto_0
    return-object v1

    .line 1002
    :cond_0
    if-gez p1, :cond_1

    .line 1003
    const/4 p1, 0x0

    .line 1005
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1006
    array-length p2, p0

    .line 1008
    :cond_2
    sub-int v0, p2, p1

    .line 1009
    .local v0, "newSize":I
    if-gtz v0, :cond_3

    .line 1010
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    goto :goto_0

    .line 1013
    :cond_3
    new-array v1, v0, [B

    .line 1014
    .local v1, "subarray":[B
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([CII)[C
    .locals 3
    .param p0, "array"    # [C
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    .line 960
    if-nez p0, :cond_0

    .line 961
    const/4 v1, 0x0

    .line 976
    :goto_0
    return-object v1

    .line 963
    :cond_0
    if-gez p1, :cond_1

    .line 964
    const/4 p1, 0x0

    .line 966
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 967
    array-length p2, p0

    .line 969
    :cond_2
    sub-int v0, p2, p1

    .line 970
    .local v0, "newSize":I
    if-gtz v0, :cond_3

    .line 971
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    goto :goto_0

    .line 974
    :cond_3
    new-array v1, v0, [C

    .line 975
    .local v1, "subarray":[C
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([DII)[D
    .locals 3
    .param p0, "array"    # [D
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    .line 1038
    if-nez p0, :cond_0

    .line 1039
    const/4 v1, 0x0

    .line 1054
    :goto_0
    return-object v1

    .line 1041
    :cond_0
    if-gez p1, :cond_1

    .line 1042
    const/4 p1, 0x0

    .line 1044
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1045
    array-length p2, p0

    .line 1047
    :cond_2
    sub-int v0, p2, p1

    .line 1048
    .local v0, "newSize":I
    if-gtz v0, :cond_3

    .line 1049
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    goto :goto_0

    .line 1052
    :cond_3
    new-array v1, v0, [D

    .line 1053
    .local v1, "subarray":[D
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([FII)[F
    .locals 3
    .param p0, "array"    # [F
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    .line 1077
    if-nez p0, :cond_0

    .line 1078
    const/4 v1, 0x0

    .line 1093
    :goto_0
    return-object v1

    .line 1080
    :cond_0
    if-gez p1, :cond_1

    .line 1081
    const/4 p1, 0x0

    .line 1083
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1084
    array-length p2, p0

    .line 1086
    :cond_2
    sub-int v0, p2, p1

    .line 1087
    .local v0, "newSize":I
    if-gtz v0, :cond_3

    .line 1088
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    goto :goto_0

    .line 1091
    :cond_3
    new-array v1, v0, [F

    .line 1092
    .local v1, "subarray":[F
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([III)[I
    .locals 3
    .param p0, "array"    # [I
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    .line 882
    if-nez p0, :cond_0

    .line 883
    const/4 v1, 0x0

    .line 898
    :goto_0
    return-object v1

    .line 885
    :cond_0
    if-gez p1, :cond_1

    .line 886
    const/4 p1, 0x0

    .line 888
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 889
    array-length p2, p0

    .line 891
    :cond_2
    sub-int v0, p2, p1

    .line 892
    .local v0, "newSize":I
    if-gtz v0, :cond_3

    .line 893
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_INT_ARRAY:[I

    goto :goto_0

    .line 896
    :cond_3
    new-array v1, v0, [I

    .line 897
    .local v1, "subarray":[I
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([JII)[J
    .locals 3
    .param p0, "array"    # [J
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    .line 843
    if-nez p0, :cond_0

    .line 844
    const/4 v1, 0x0

    .line 859
    :goto_0
    return-object v1

    .line 846
    :cond_0
    if-gez p1, :cond_1

    .line 847
    const/4 p1, 0x0

    .line 849
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 850
    array-length p2, p0

    .line 852
    :cond_2
    sub-int v0, p2, p1

    .line 853
    .local v0, "newSize":I
    if-gtz v0, :cond_3

    .line 854
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    goto :goto_0

    .line 857
    :cond_3
    new-array v1, v0, [J

    .line 858
    .local v1, "subarray":[J
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([Ljava/lang/Object;II)[Ljava/lang/Object;
    .locals 5
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    const/4 v4, 0x0

    .line 804
    if-nez p0, :cond_0

    .line 805
    const/4 v3, 0x0

    .line 820
    :goto_0
    return-object v3

    .line 807
    :cond_0
    if-gez p1, :cond_1

    .line 808
    const/4 p1, 0x0

    .line 810
    :cond_1
    array-length v3, p0

    if-le p2, v3, :cond_2

    .line 811
    array-length p2, p0

    .line 813
    :cond_2
    sub-int v0, p2, p1

    .line 814
    .local v0, "newSize":I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 815
    .local v2, "type":Ljava/lang/Class;
    if-gtz v0, :cond_3

    .line 816
    invoke-static {v2, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    check-cast v3, [Ljava/lang/Object;

    goto :goto_0

    .line 818
    :cond_3
    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object v1, v3

    check-cast v1, [Ljava/lang/Object;

    .line 819
    .local v1, "subarray":[Ljava/lang/Object;
    invoke-static {p0, p1, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v3, v1

    .line 820
    goto :goto_0
.end method

.method public static subarray([SII)[S
    .locals 3
    .param p0, "array"    # [S
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    .line 921
    if-nez p0, :cond_0

    .line 922
    const/4 v1, 0x0

    .line 937
    :goto_0
    return-object v1

    .line 924
    :cond_0
    if-gez p1, :cond_1

    .line 925
    const/4 p1, 0x0

    .line 927
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 928
    array-length p2, p0

    .line 930
    :cond_2
    sub-int v0, p2, p1

    .line 931
    .local v0, "newSize":I
    if-gtz v0, :cond_3

    .line 932
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    goto :goto_0

    .line 935
    :cond_3
    new-array v1, v0, [S

    .line 936
    .local v1, "subarray":[S
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([ZII)[Z
    .locals 3
    .param p0, "array"    # [Z
    .param p1, "startIndexInclusive"    # I
    .param p2, "endIndexExclusive"    # I

    .prologue
    .line 1116
    if-nez p0, :cond_0

    .line 1117
    const/4 v1, 0x0

    .line 1132
    :goto_0
    return-object v1

    .line 1119
    :cond_0
    if-gez p1, :cond_1

    .line 1120
    const/4 p1, 0x0

    .line 1122
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1123
    array-length p2, p0

    .line 1125
    :cond_2
    sub-int v0, p2, p1

    .line 1126
    .local v0, "newSize":I
    if-gtz v0, :cond_3

    .line 1127
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    goto :goto_0

    .line 1130
    :cond_3
    new-array v1, v0, [Z

    .line 1131
    .local v1, "subarray":[Z
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static toMap([Ljava/lang/Object;)Ljava/util/Map;
    .locals 8
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 237
    if-nez p0, :cond_1

    .line 238
    const/4 v2, 0x0

    .line 260
    :cond_0
    return-object v2

    .line 240
    :cond_1
    new-instance v2, Ljava/util/HashMap;

    array-length v4, p0

    int-to-double v4, v4

    const-wide/high16 v6, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v4, v6

    double-to-int v4, v4

    invoke-direct {v2, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 241
    .local v2, "map":Ljava/util/Map;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, p0

    if-ge v1, v4, :cond_0

    .line 242
    aget-object v3, p0, v1

    .line 243
    .local v3, "object":Ljava/lang/Object;
    instance-of v4, v3, Ljava/util/Map$Entry;

    if-eqz v4, :cond_2

    move-object v0, v3

    .line 244
    check-cast v0, Ljava/util/Map$Entry;

    .line 245
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 241
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 246
    :cond_2
    instance-of v4, v3, [Ljava/lang/Object;

    if-eqz v4, :cond_4

    move-object v4, v3

    .line 247
    check-cast v4, [Ljava/lang/Object;

    move-object v0, v4

    check-cast v0, [Ljava/lang/Object;

    .line 248
    .local v0, "entry":[Ljava/lang/Object;
    array-length v4, v0

    const/4 v5, 0x2

    if-ge v4, v5, :cond_3

    .line 249
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Array element "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ", \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\', has a length less than 2"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 253
    :cond_3
    const/4 v4, 0x0

    aget-object v4, v0, v4

    const/4 v5, 0x1

    aget-object v5, v0, v5

    invoke-interface {v2, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 255
    .end local v0    # "entry":[Ljava/lang/Object;
    :cond_4
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Array element "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ", \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\', is neither of type Map.Entry nor an Array"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static toObject([Z)[Ljava/lang/Boolean;
    .locals 3
    .param p0, "array"    # [Z

    .prologue
    .line 3165
    if-nez p0, :cond_1

    .line 3166
    const/4 v1, 0x0

    .line 3174
    :cond_0
    :goto_0
    return-object v1

    .line 3167
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3168
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

    goto :goto_0

    .line 3170
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Boolean;

    .line 3171
    .local v1, "result":[Ljava/lang/Boolean;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3172
    aget-boolean v2, p0, v0

    if-eqz v2, :cond_3

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_2
    aput-object v2, v1, v0

    .line 3171
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3172
    :cond_3
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_2
.end method

.method public static toObject([B)[Ljava/lang/Byte;
    .locals 4
    .param p0, "array"    # [B

    .prologue
    .line 2961
    if-nez p0, :cond_1

    .line 2962
    const/4 v1, 0x0

    .line 2970
    :cond_0
    :goto_0
    return-object v1

    .line 2963
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2964
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

    goto :goto_0

    .line 2966
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Byte;

    .line 2967
    .local v1, "result":[Ljava/lang/Byte;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2968
    new-instance v2, Ljava/lang/Byte;

    aget-byte v3, p0, v0

    invoke-direct {v2, v3}, Ljava/lang/Byte;-><init>(B)V

    aput-object v2, v1, v0

    .line 2967
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([C)[Ljava/lang/Character;
    .locals 4
    .param p0, "array"    # [C

    .prologue
    .line 2689
    if-nez p0, :cond_1

    .line 2690
    const/4 v1, 0x0

    .line 2698
    :cond_0
    :goto_0
    return-object v1

    .line 2691
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2692
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

    goto :goto_0

    .line 2694
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Character;

    .line 2695
    .local v1, "result":[Ljava/lang/Character;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2696
    new-instance v2, Ljava/lang/Character;

    aget-char v3, p0, v0

    invoke-direct {v2, v3}, Ljava/lang/Character;-><init>(C)V

    aput-object v2, v1, v0

    .line 2695
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([D)[Ljava/lang/Double;
    .locals 6
    .param p0, "array"    # [D

    .prologue
    .line 3029
    if-nez p0, :cond_1

    .line 3030
    const/4 v1, 0x0

    .line 3038
    :cond_0
    :goto_0
    return-object v1

    .line 3031
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3032
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

    goto :goto_0

    .line 3034
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Double;

    .line 3035
    .local v1, "result":[Ljava/lang/Double;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3036
    new-instance v2, Ljava/lang/Double;

    aget-wide v4, p0, v0

    invoke-direct {v2, v4, v5}, Ljava/lang/Double;-><init>(D)V

    aput-object v2, v1, v0

    .line 3035
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([F)[Ljava/lang/Float;
    .locals 4
    .param p0, "array"    # [F

    .prologue
    .line 3097
    if-nez p0, :cond_1

    .line 3098
    const/4 v1, 0x0

    .line 3106
    :cond_0
    :goto_0
    return-object v1

    .line 3099
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3100
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

    goto :goto_0

    .line 3102
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Float;

    .line 3103
    .local v1, "result":[Ljava/lang/Float;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3104
    new-instance v2, Ljava/lang/Float;

    aget v3, p0, v0

    invoke-direct {v2, v3}, Ljava/lang/Float;-><init>(F)V

    aput-object v2, v1, v0

    .line 3103
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([I)[Ljava/lang/Integer;
    .locals 4
    .param p0, "array"    # [I

    .prologue
    .line 2825
    if-nez p0, :cond_1

    .line 2826
    const/4 v1, 0x0

    .line 2834
    :cond_0
    :goto_0
    return-object v1

    .line 2827
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2828
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

    goto :goto_0

    .line 2830
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Integer;

    .line 2831
    .local v1, "result":[Ljava/lang/Integer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2832
    new-instance v2, Ljava/lang/Integer;

    aget v3, p0, v0

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    aput-object v2, v1, v0

    .line 2831
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([J)[Ljava/lang/Long;
    .locals 6
    .param p0, "array"    # [J

    .prologue
    .line 2757
    if-nez p0, :cond_1

    .line 2758
    const/4 v1, 0x0

    .line 2766
    :cond_0
    :goto_0
    return-object v1

    .line 2759
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2760
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

    goto :goto_0

    .line 2762
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Long;

    .line 2763
    .local v1, "result":[Ljava/lang/Long;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2764
    new-instance v2, Ljava/lang/Long;

    aget-wide v4, p0, v0

    invoke-direct {v2, v4, v5}, Ljava/lang/Long;-><init>(J)V

    aput-object v2, v1, v0

    .line 2763
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([S)[Ljava/lang/Short;
    .locals 4
    .param p0, "array"    # [S

    .prologue
    .line 2893
    if-nez p0, :cond_1

    .line 2894
    const/4 v1, 0x0

    .line 2902
    :cond_0
    :goto_0
    return-object v1

    .line 2895
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2896
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

    goto :goto_0

    .line 2898
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Short;

    .line 2899
    .local v1, "result":[Ljava/lang/Short;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2900
    new-instance v2, Ljava/lang/Short;

    aget-short v3, p0, v0

    invoke-direct {v2, v3}, Ljava/lang/Short;-><init>(S)V

    aput-object v2, v1, v0

    .line 2899
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Byte;)[B
    .locals 3
    .param p0, "array"    # [Ljava/lang/Byte;

    .prologue
    .line 2917
    if-nez p0, :cond_1

    .line 2918
    const/4 v1, 0x0

    .line 2926
    :cond_0
    :goto_0
    return-object v1

    .line 2919
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2920
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    goto :goto_0

    .line 2922
    :cond_2
    array-length v2, p0

    new-array v1, v2, [B

    .line 2923
    .local v1, "result":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2924
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v2

    aput-byte v2, v1, v0

    .line 2923
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Byte;B)[B
    .locals 4
    .param p0, "array"    # [Ljava/lang/Byte;
    .param p1, "valueForNull"    # B

    .prologue
    .line 2939
    if-nez p0, :cond_1

    .line 2940
    const/4 v2, 0x0

    .line 2949
    :cond_0
    :goto_0
    return-object v2

    .line 2941
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2942
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    goto :goto_0

    .line 2944
    :cond_2
    array-length v3, p0

    new-array v2, v3, [B

    .line 2945
    .local v2, "result":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2946
    aget-object v0, p0, v1

    .line 2947
    .local v0, "b":Ljava/lang/Byte;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput-byte v3, v2, v1

    .line 2945
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2947
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Character;)[C
    .locals 3
    .param p0, "array"    # [Ljava/lang/Character;

    .prologue
    .line 2645
    if-nez p0, :cond_1

    .line 2646
    const/4 v1, 0x0

    .line 2654
    :cond_0
    :goto_0
    return-object v1

    .line 2647
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2648
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    goto :goto_0

    .line 2650
    :cond_2
    array-length v2, p0

    new-array v1, v2, [C

    .line 2651
    .local v1, "result":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2652
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    aput-char v2, v1, v0

    .line 2651
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Character;C)[C
    .locals 4
    .param p0, "array"    # [Ljava/lang/Character;
    .param p1, "valueForNull"    # C

    .prologue
    .line 2667
    if-nez p0, :cond_1

    .line 2668
    const/4 v2, 0x0

    .line 2677
    :cond_0
    :goto_0
    return-object v2

    .line 2669
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2670
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    goto :goto_0

    .line 2672
    :cond_2
    array-length v3, p0

    new-array v2, v3, [C

    .line 2673
    .local v2, "result":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2674
    aget-object v0, p0, v1

    .line 2675
    .local v0, "b":Ljava/lang/Character;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput-char v3, v2, v1

    .line 2673
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2675
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Double;)[D
    .locals 4
    .param p0, "array"    # [Ljava/lang/Double;

    .prologue
    .line 2985
    if-nez p0, :cond_1

    .line 2986
    const/4 v1, 0x0

    .line 2994
    :cond_0
    :goto_0
    return-object v1

    .line 2987
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2988
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    goto :goto_0

    .line 2990
    :cond_2
    array-length v2, p0

    new-array v1, v2, [D

    .line 2991
    .local v1, "result":[D
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2992
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 2991
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Double;D)[D
    .locals 7
    .param p0, "array"    # [Ljava/lang/Double;
    .param p1, "valueForNull"    # D

    .prologue
    .line 3007
    if-nez p0, :cond_1

    .line 3008
    const/4 v2, 0x0

    .line 3017
    :cond_0
    :goto_0
    return-object v2

    .line 3009
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 3010
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    goto :goto_0

    .line 3012
    :cond_2
    array-length v3, p0

    new-array v2, v3, [D

    .line 3013
    .local v2, "result":[D
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 3014
    aget-object v0, p0, v1

    .line 3015
    .local v0, "b":Ljava/lang/Double;
    if-nez v0, :cond_3

    move-wide v4, p1

    :goto_2
    aput-wide v4, v2, v1

    .line 3013
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3015
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Float;)[F
    .locals 3
    .param p0, "array"    # [Ljava/lang/Float;

    .prologue
    .line 3053
    if-nez p0, :cond_1

    .line 3054
    const/4 v1, 0x0

    .line 3062
    :cond_0
    :goto_0
    return-object v1

    .line 3055
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3056
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    goto :goto_0

    .line 3058
    :cond_2
    array-length v2, p0

    new-array v1, v2, [F

    .line 3059
    .local v1, "result":[F
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3060
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    aput v2, v1, v0

    .line 3059
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Float;F)[F
    .locals 4
    .param p0, "array"    # [Ljava/lang/Float;
    .param p1, "valueForNull"    # F

    .prologue
    .line 3075
    if-nez p0, :cond_1

    .line 3076
    const/4 v2, 0x0

    .line 3085
    :cond_0
    :goto_0
    return-object v2

    .line 3077
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 3078
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    goto :goto_0

    .line 3080
    :cond_2
    array-length v3, p0

    new-array v2, v3, [F

    .line 3081
    .local v2, "result":[F
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 3082
    aget-object v0, p0, v1

    .line 3083
    .local v0, "b":Ljava/lang/Float;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput v3, v2, v1

    .line 3081
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3083
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Integer;)[I
    .locals 3
    .param p0, "array"    # [Ljava/lang/Integer;

    .prologue
    .line 2781
    if-nez p0, :cond_1

    .line 2782
    const/4 v1, 0x0

    .line 2790
    :cond_0
    :goto_0
    return-object v1

    .line 2783
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2784
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_INT_ARRAY:[I

    goto :goto_0

    .line 2786
    :cond_2
    array-length v2, p0

    new-array v1, v2, [I

    .line 2787
    .local v1, "result":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2788
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, v1, v0

    .line 2787
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Integer;I)[I
    .locals 4
    .param p0, "array"    # [Ljava/lang/Integer;
    .param p1, "valueForNull"    # I

    .prologue
    .line 2803
    if-nez p0, :cond_1

    .line 2804
    const/4 v2, 0x0

    .line 2813
    :cond_0
    :goto_0
    return-object v2

    .line 2805
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2806
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_INT_ARRAY:[I

    goto :goto_0

    .line 2808
    :cond_2
    array-length v3, p0

    new-array v2, v3, [I

    .line 2809
    .local v2, "result":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2810
    aget-object v0, p0, v1

    .line 2811
    .local v0, "b":Ljava/lang/Integer;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput v3, v2, v1

    .line 2809
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2811
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Long;)[J
    .locals 4
    .param p0, "array"    # [Ljava/lang/Long;

    .prologue
    .line 2713
    if-nez p0, :cond_1

    .line 2714
    const/4 v1, 0x0

    .line 2722
    :cond_0
    :goto_0
    return-object v1

    .line 2715
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2716
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    goto :goto_0

    .line 2718
    :cond_2
    array-length v2, p0

    new-array v1, v2, [J

    .line 2719
    .local v1, "result":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2720
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 2719
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Long;J)[J
    .locals 7
    .param p0, "array"    # [Ljava/lang/Long;
    .param p1, "valueForNull"    # J

    .prologue
    .line 2735
    if-nez p0, :cond_1

    .line 2736
    const/4 v2, 0x0

    .line 2745
    :cond_0
    :goto_0
    return-object v2

    .line 2737
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2738
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    goto :goto_0

    .line 2740
    :cond_2
    array-length v3, p0

    new-array v2, v3, [J

    .line 2741
    .local v2, "result":[J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2742
    aget-object v0, p0, v1

    .line 2743
    .local v0, "b":Ljava/lang/Long;
    if-nez v0, :cond_3

    move-wide v4, p1

    :goto_2
    aput-wide v4, v2, v1

    .line 2741
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2743
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Short;)[S
    .locals 3
    .param p0, "array"    # [Ljava/lang/Short;

    .prologue
    .line 2849
    if-nez p0, :cond_1

    .line 2850
    const/4 v1, 0x0

    .line 2858
    :cond_0
    :goto_0
    return-object v1

    .line 2851
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2852
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    goto :goto_0

    .line 2854
    :cond_2
    array-length v2, p0

    new-array v1, v2, [S

    .line 2855
    .local v1, "result":[S
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2856
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Short;->shortValue()S

    move-result v2

    aput-short v2, v1, v0

    .line 2855
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Short;S)[S
    .locals 4
    .param p0, "array"    # [Ljava/lang/Short;
    .param p1, "valueForNull"    # S

    .prologue
    .line 2871
    if-nez p0, :cond_1

    .line 2872
    const/4 v2, 0x0

    .line 2881
    :cond_0
    :goto_0
    return-object v2

    .line 2873
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2874
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    goto :goto_0

    .line 2876
    :cond_2
    array-length v3, p0

    new-array v2, v3, [S

    .line 2877
    .local v2, "result":[S
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2878
    aget-object v0, p0, v1

    .line 2879
    .local v0, "b":Ljava/lang/Short;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput-short v3, v2, v1

    .line 2877
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2879
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Short;->shortValue()S

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Boolean;)[Z
    .locals 3
    .param p0, "array"    # [Ljava/lang/Boolean;

    .prologue
    .line 3121
    if-nez p0, :cond_1

    .line 3122
    const/4 v1, 0x0

    .line 3130
    :cond_0
    :goto_0
    return-object v1

    .line 3123
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3124
    sget-object v1, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    goto :goto_0

    .line 3126
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Z

    .line 3127
    .local v1, "result":[Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3128
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    aput-boolean v2, v1, v0

    .line 3127
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Boolean;Z)[Z
    .locals 4
    .param p0, "array"    # [Ljava/lang/Boolean;
    .param p1, "valueForNull"    # Z

    .prologue
    .line 3143
    if-nez p0, :cond_1

    .line 3144
    const/4 v2, 0x0

    .line 3153
    :cond_0
    :goto_0
    return-object v2

    .line 3145
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 3146
    sget-object v2, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    goto :goto_0

    .line 3148
    :cond_2
    array-length v3, p0

    new-array v2, v3, [Z

    .line 3149
    .local v2, "result":[Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 3150
    aget-object v0, p0, v1

    .line 3151
    .local v0, "b":Ljava/lang/Boolean;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput-boolean v3, v2, v1

    .line 3149
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3151
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_2
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "array"    # Ljava/lang/Object;

    .prologue
    .line 161
    const-string/jumbo v0, "{}"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/ArrayUtils;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "array"    # Ljava/lang/Object;
    .param p1, "stringIfNull"    # Ljava/lang/String;

    .prologue
    .line 177
    if-nez p0, :cond_0

    .line 180
    .end local p1    # "stringIfNull":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "stringIfNull":Ljava/lang/String;
    :cond_0
    new-instance v0, Lorg/apache/commons/lang/builder/ToStringBuilder;

    sget-object v1, Lorg/apache/commons/lang/builder/ToStringStyle;->SIMPLE_STYLE:Lorg/apache/commons/lang/builder/ToStringStyle;

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/lang/builder/ToStringBuilder;-><init>(Ljava/lang/Object;Lorg/apache/commons/lang/builder/ToStringStyle;)V

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang/builder/ToStringBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang/builder/ToStringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang/builder/ToStringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method
