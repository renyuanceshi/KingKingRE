.class public Lorg/apache/commons/lang/RandomStringUtils;
.super Ljava/lang/Object;
.source "RandomStringUtils.java"


# static fields
.field private static final RANDOM:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method public static random(I)Ljava/lang/String;
    .locals 1
    .param p0, "count"    # I

    .prologue
    const/4 v0, 0x0

    .line 71
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(IIIZZ)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "letters"    # Z
    .param p4, "numbers"    # Z

    .prologue
    .line 165
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(IIIZZ[C)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "letters"    # Z
    .param p4, "numbers"    # Z
    .param p5, "chars"    # [C

    .prologue
    .line 189
    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;
    .locals 8
    .param p0, "count"    # I
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "letters"    # Z
    .param p4, "numbers"    # Z
    .param p5, "chars"    # [C
    .param p6, "random"    # Ljava/util/Random;

    .prologue
    const v7, 0xdc00

    const v6, 0xd800

    const/16 v5, 0x80

    .line 227
    if-nez p0, :cond_0

    .line 228
    const-string/jumbo v4, ""

    .line 283
    :goto_0
    return-object v4

    .line 229
    :cond_0
    if-gez p0, :cond_1

    .line 230
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Requested random string length "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " is less than 0."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 232
    :cond_1
    if-nez p1, :cond_2

    if-nez p2, :cond_2

    .line 233
    const/16 p2, 0x7b

    .line 234
    const/16 p1, 0x20

    .line 235
    if-nez p3, :cond_2

    if-nez p4, :cond_2

    .line 236
    const/4 p1, 0x0

    .line 237
    const p2, 0x7fffffff

    .line 241
    :cond_2
    new-array v0, p0, [C

    .line 242
    .local v0, "buffer":[C
    sub-int v3, p2, p1

    .local v3, "gap":I
    move v2, p0

    .line 244
    .end local p0    # "count":I
    .local v2, "count":I
    :goto_1
    add-int/lit8 p0, v2, -0x1

    .end local v2    # "count":I
    .restart local p0    # "count":I
    if-eqz v2, :cond_d

    .line 246
    if-nez p5, :cond_6

    .line 247
    invoke-virtual {p6, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v4, p1

    int-to-char v1, v4

    .line 251
    .local v1, "ch":C
    :goto_2
    if-eqz p3, :cond_3

    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v4

    if-nez v4, :cond_5

    :cond_3
    if-eqz p4, :cond_4

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-nez v4, :cond_5

    :cond_4
    if-nez p3, :cond_c

    if-nez p4, :cond_c

    .line 255
    :cond_5
    if-lt v1, v7, :cond_8

    const v4, 0xdfff

    if-gt v1, v4, :cond_8

    .line 256
    if-nez p0, :cond_7

    .line 257
    add-int/lit8 p0, p0, 0x1

    :goto_3
    move v2, p0

    .line 282
    .end local p0    # "count":I
    .restart local v2    # "count":I
    goto :goto_1

    .line 249
    .end local v1    # "ch":C
    .end local v2    # "count":I
    .restart local p0    # "count":I
    :cond_6
    invoke-virtual {p6, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v4, p1

    aget-char v1, p5, v4

    .restart local v1    # "ch":C
    goto :goto_2

    .line 260
    :cond_7
    aput-char v1, v0, p0

    .line 261
    add-int/lit8 p0, p0, -0x1

    .line 262
    invoke-virtual {p6, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v4, v6

    int-to-char v4, v4

    aput-char v4, v0, p0

    goto :goto_3

    .line 264
    :cond_8
    if-lt v1, v6, :cond_a

    const v4, 0xdb7f

    if-gt v1, v4, :cond_a

    .line 265
    if-nez p0, :cond_9

    .line 266
    add-int/lit8 p0, p0, 0x1

    goto :goto_3

    .line 269
    :cond_9
    invoke-virtual {p6, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v4, v7

    int-to-char v4, v4

    aput-char v4, v0, p0

    .line 270
    add-int/lit8 p0, p0, -0x1

    .line 271
    aput-char v1, v0, p0

    goto :goto_3

    .line 273
    :cond_a
    const v4, 0xdb80

    if-lt v1, v4, :cond_b

    const v4, 0xdbff

    if-gt v1, v4, :cond_b

    .line 275
    add-int/lit8 p0, p0, 0x1

    goto :goto_3

    .line 277
    :cond_b
    aput-char v1, v0, p0

    goto :goto_3

    .line 280
    :cond_c
    add-int/lit8 p0, p0, 0x1

    goto :goto_3

    .line 283
    .end local v1    # "ch":C
    :cond_d
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    goto/16 :goto_0
.end method

.method public static random(ILjava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "chars"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 300
    if-nez p1, :cond_0

    .line 301
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v2, v1

    move v3, v1

    move v4, v1

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    .line 303
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/RandomStringUtils;->random(I[C)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static random(IZZ)Ljava/lang/String;
    .locals 1
    .param p0, "count"    # I
    .param p1, "letters"    # Z
    .param p2, "numbers"    # Z

    .prologue
    const/4 v0, 0x0

    .line 145
    invoke-static {p0, v0, v0, p1, p2}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(I[C)Ljava/lang/String;
    .locals 7
    .param p0, "count"    # I
    .param p1, "chars"    # [C

    .prologue
    const/4 v1, 0x0

    .line 319
    if-nez p1, :cond_0

    .line 320
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v2, v1

    move v3, v1

    move v4, v1

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    .line 322
    :goto_0
    return-object v0

    :cond_0
    array-length v2, p1

    sget-object v6, Lorg/apache/commons/lang/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v3, v1

    move v4, v1

    move-object v5, p1

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static randomAlphabetic(I)Ljava/lang/String;
    .locals 2
    .param p0, "count"    # I

    .prologue
    .line 99
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomAlphanumeric(I)Ljava/lang/String;
    .locals 1
    .param p0, "count"    # I

    .prologue
    const/4 v0, 0x1

    .line 113
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomAscii(I)Ljava/lang/String;
    .locals 3
    .param p0, "count"    # I

    .prologue
    const/4 v2, 0x0

    .line 85
    const/16 v0, 0x20

    const/16 v1, 0x7f

    invoke-static {p0, v0, v1, v2, v2}, Lorg/apache/commons/lang/RandomStringUtils;->random(IIIZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomNumeric(I)Ljava/lang/String;
    .locals 2
    .param p0, "count"    # I

    .prologue
    .line 127
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
