.class public Lorg/apache/commons/lang/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field public static final EMPTY:Ljava/lang/String; = ""

.field public static final INDEX_NOT_FOUND:I = -0x1

.field private static final PAD_LIMIT:I = 0x2000


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    return-void
.end method

.method public static abbreviate(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "maxWidth"    # I

    .prologue
    .line 5785
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/StringUtils;->abbreviate(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static abbreviate(Ljava/lang/String;II)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "maxWidth"    # I

    .prologue
    const/4 v2, 0x4

    .line 5824
    if-nez p0, :cond_1

    .line 5825
    const/4 p0, 0x0

    .line 5848
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 5827
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    if-ge p2, v2, :cond_2

    .line 5828
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum abbreviation width is 4"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 5830
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, p2, :cond_0

    .line 5833
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le p1, v0, :cond_3

    .line 5834
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    .line 5836
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 v1, p2, -0x3

    if-ge v0, v1, :cond_4

    .line 5837
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v1, p2, -0x3

    sub-int p1, v0, v1

    .line 5839
    :cond_4
    if-gt p1, v2, :cond_5

    .line 5840
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    add-int/lit8 v2, p2, -0x3

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 5842
    :cond_5
    const/4 v0, 0x7

    if-ge p2, v0, :cond_6

    .line 5843
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Minimum abbreviation width with offset is 7"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 5845
    :cond_6
    add-int/lit8 v0, p2, -0x3

    add-int/2addr v0, p1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_7

    .line 5846
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v2, p2, -0x3

    invoke-static {v1, v2}, Lorg/apache/commons/lang/StringUtils;->abbreviate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 5848
    :cond_7
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v2, p2, -0x3

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0
.end method

.method public static abbreviateMiddle(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "middle"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 5881
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 5898
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 5885
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge p2, v4, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    if-lt p2, v4, :cond_0

    .line 5889
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int v3, p2, v4

    .line 5890
    .local v3, "targetSting":I
    div-int/lit8 v4, v3, 0x2

    rem-int/lit8 v5, v3, 0x2

    add-int v2, v4, v5

    .line 5891
    .local v2, "startOffset":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v5, v3, 0x2

    sub-int v1, v4, v5

    .line 5893
    .local v1, "endOffset":I
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 5894
    .local v0, "builder":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 5895
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 5896
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 5898
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static capitalise(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5115
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static capitaliseAllWords(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5224
    invoke-static {p0}, Lorg/apache/commons/lang/WordUtils;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5096
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "strLen":I
    if-nez v0, :cond_1

    .line 5099
    .end local v0    # "strLen":I
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .restart local v0    # "strLen":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, v0}, Ljava/lang/StringBuffer;-><init>(I)V

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static center(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I

    .prologue
    .line 4890
    const/16 v0, 0x20

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->center(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static center(Ljava/lang/String;IC)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "padChar"    # C

    .prologue
    .line 4918
    if-eqz p0, :cond_0

    if-gtz p1, :cond_1

    .line 4928
    :cond_0
    :goto_0
    return-object p0

    .line 4921
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 4922
    .local v1, "strLen":I
    sub-int v0, p1, v1

    .line 4923
    .local v0, "pads":I
    if-lez v0, :cond_0

    .line 4926
    div-int/lit8 v2, v0, 0x2

    add-int/2addr v2, v1

    invoke-static {p0, v2, p2}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    .line 4927
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang/StringUtils;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    .line 4928
    goto :goto_0
.end method

.method public static center(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "padStr"    # Ljava/lang/String;

    .prologue
    .line 4958
    if-eqz p0, :cond_0

    if-gtz p1, :cond_1

    .line 4971
    :cond_0
    :goto_0
    return-object p0

    .line 4961
    :cond_1
    invoke-static {p2}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 4962
    const-string/jumbo p2, " "

    .line 4964
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 4965
    .local v1, "strLen":I
    sub-int v0, p1, v1

    .line 4966
    .local v0, "pads":I
    if-lez v0, :cond_0

    .line 4969
    div-int/lit8 v2, v0, 0x2

    add-int/2addr v2, v1

    invoke-static {p0, v2, p2}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 4970
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang/StringUtils;->rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 4971
    goto :goto_0
.end method

.method public static chomp(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0xa

    const/4 v6, 0x0

    const/16 v5, 0xd

    .line 4250
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 4272
    .end local p0    # "str":Ljava/lang/String;
    .local v1, "last":C
    .local v2, "lastIdx":I
    :cond_0
    :goto_0
    return-object p0

    .line 4254
    .end local v1    # "last":C
    .end local v2    # "lastIdx":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 4255
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 4256
    .local v0, "ch":C
    if-eq v0, v5, :cond_2

    if-ne v0, v7, :cond_0

    .line 4257
    :cond_2
    const-string/jumbo p0, ""

    goto :goto_0

    .line 4262
    .end local v0    # "ch":C
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 4263
    .restart local v2    # "lastIdx":I
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 4265
    .restart local v1    # "last":C
    if-ne v1, v7, :cond_5

    .line 4266
    add-int/lit8 v3, v2, -0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_4

    .line 4267
    add-int/lit8 v2, v2, -0x1

    .line 4272
    :cond_4
    :goto_1
    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4269
    :cond_5
    if-eq v1, v5, :cond_4

    .line 4270
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static chomp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 4302
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p1, :cond_1

    .line 4308
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 4305
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4306
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static chompLast(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 4322
    const-string/jumbo v0, "\n"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->chompLast(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static chompLast(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 4336
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 4343
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 4339
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 4340
    .local v0, "sub":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4341
    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static chop(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 4434
    if-nez p0, :cond_1

    .line 4435
    const/4 v2, 0x0

    .line 4449
    :cond_0
    :goto_0
    return-object v2

    .line 4437
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 4438
    .local v3, "strLen":I
    const/4 v4, 0x2

    if-ge v3, v4, :cond_2

    .line 4439
    const-string/jumbo v2, ""

    goto :goto_0

    .line 4441
    :cond_2
    add-int/lit8 v1, v3, -0x1

    .line 4442
    .local v1, "lastIdx":I
    invoke-virtual {p0, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 4443
    .local v2, "ret":Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 4444
    .local v0, "last":C
    const/16 v4, 0xa

    if-ne v0, v4, :cond_0

    .line 4445
    add-int/lit8 v4, v1, -0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0xd

    if-ne v4, v5, :cond_0

    .line 4446
    add-int/lit8 v4, v1, -0x1

    invoke-virtual {v2, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static chopNewline(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 4463
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .line 4464
    .local v1, "lastIdx":I
    if-gtz v1, :cond_0

    .line 4465
    const-string/jumbo v2, ""

    .line 4475
    :goto_0
    return-object v2

    .line 4467
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 4468
    .local v0, "last":C
    const/16 v2, 0xa

    if-ne v0, v2, :cond_2

    .line 4469
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_1

    .line 4470
    add-int/lit8 v1, v1, -0x1

    .line 4475
    :cond_1
    :goto_1
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 4473
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static clean(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 282
    if-nez p0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static concatenate([Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 3050
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static contains(Ljava/lang/String;C)Z
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChar"    # C

    .prologue
    const/4 v0, 0x0

    .line 1234
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1237
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static contains(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 1262
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1265
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static containsAny(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChars"    # Ljava/lang/String;

    .prologue
    .line 1441
    if-nez p1, :cond_0

    .line 1442
    const/4 v0, 0x0

    .line 1444
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->containsAny(Ljava/lang/String;[C)Z

    move-result v0

    goto :goto_0
.end method

.method public static containsAny(Ljava/lang/String;[C)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChars"    # [C

    .prologue
    const/4 v3, 0x0

    .line 1399
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    if-eqz p1, :cond_0

    array-length v4, p1

    if-nez v4, :cond_1

    .line 1410
    :cond_0
    :goto_0
    return v3

    .line 1402
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 1403
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1404
    .local v0, "ch":C
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    array-length v4, p1

    if-ge v2, v4, :cond_3

    .line 1405
    aget-char v4, p1, v2

    if-ne v4, v0, :cond_2

    .line 1406
    const/4 v3, 0x1

    goto :goto_0

    .line 1404
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1402
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static containsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 1292
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1302
    :cond_0
    :goto_0
    return v4

    .line 1295
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 1296
    .local v5, "len":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v6, v0, v5

    .line 1297
    .local v6, "max":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-gt v2, v6, :cond_0

    move-object v0, p0

    move-object v3, p1

    .line 1298
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_2

    move v4, v1

    .line 1299
    goto :goto_0

    .line 1297
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static containsNone(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "invalidChars"    # Ljava/lang/String;

    .prologue
    .line 1651
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1652
    :cond_0
    const/4 v0, 0x1

    .line 1654
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->containsNone(Ljava/lang/String;[C)Z

    move-result v0

    goto :goto_0
.end method

.method public static containsNone(Ljava/lang/String;[C)Z
    .locals 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "invalidChars"    # [C

    .prologue
    const/4 v5, 0x1

    .line 1612
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1625
    :cond_0
    :goto_0
    return v5

    .line 1615
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 1616
    .local v3, "strSize":I
    array-length v4, p1

    .line 1617
    .local v4, "validSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v3, :cond_0

    .line 1618
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1619
    .local v0, "ch":C
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    if-ge v2, v4, :cond_3

    .line 1620
    aget-char v6, p1, v2

    if-ne v6, v0, :cond_2

    .line 1621
    const/4 v5, 0x0

    goto :goto_0

    .line 1619
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1617
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static containsOnly(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "validChars"    # Ljava/lang/String;

    .prologue
    .line 1581
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1582
    :cond_0
    const/4 v0, 0x0

    .line 1584
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->containsOnly(Ljava/lang/String;[C)Z

    move-result v0

    goto :goto_0
.end method

.method public static containsOnly(Ljava/lang/String;[C)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "valid"    # [C

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1546
    if-eqz p1, :cond_0

    if-nez p0, :cond_2

    :cond_0
    move v0, v1

    .line 1555
    :cond_1
    :goto_0
    return v0

    .line 1549
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_1

    .line 1552
    array-length v2, p1

    if-nez v2, :cond_3

    move v0, v1

    .line 1553
    goto :goto_0

    .line 1555
    :cond_3
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringUtils;->indexOfAnyBut(Ljava/lang/String;[C)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    move v0, v1

    goto :goto_0
.end method

.method public static countMatches(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "sub"    # Ljava/lang/String;

    .prologue
    .line 5249
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 5250
    :cond_0
    const/4 v0, 0x0

    .line 5258
    :cond_1
    return v0

    .line 5252
    :cond_2
    const/4 v0, 0x0

    .line 5253
    .local v0, "count":I
    const/4 v1, 0x0

    .line 5254
    .local v1, "idx":I
    :goto_0
    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 5255
    add-int/lit8 v0, v0, 0x1

    .line 5256
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0
.end method

.method public static defaultIfEmpty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultStr"    # Ljava/lang/String;

    .prologue
    .line 5658
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .end local p1    # "defaultStr":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "defaultStr":Ljava/lang/String;
    :cond_0
    move-object p1, p0

    goto :goto_0
.end method

.method public static defaultString(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5616
    if-nez p0, :cond_0

    const-string/jumbo p0, ""

    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public static defaultString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultStr"    # Ljava/lang/String;

    .prologue
    .line 5637
    if-nez p0, :cond_0

    .end local p1    # "defaultStr":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "defaultStr":Ljava/lang/String;
    :cond_0
    move-object p1, p0

    goto :goto_0
.end method

.method public static deleteSpaces(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 3406
    if-nez p0, :cond_0

    .line 3407
    const/4 v0, 0x0

    .line 3409
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, " \t\r\n\u0008"

    invoke-static {p0, v0}, Lorg/apache/commons/lang/CharSetUtils;->delete(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 3427
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3441
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 3430
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 3431
    .local v4, "sz":I
    new-array v0, v4, [C

    .line 3432
    .local v0, "chs":[C
    const/4 v1, 0x0

    .line 3433
    .local v1, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    move v2, v1

    .end local v1    # "count":I
    .local v2, "count":I
    :goto_1
    if-ge v3, v4, :cond_2

    .line 3434
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    if-nez v5, :cond_3

    .line 3435
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "count":I
    .restart local v1    # "count":I
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v0, v2

    .line 3433
    :goto_2
    add-int/lit8 v3, v3, 0x1

    move v2, v1

    .end local v1    # "count":I
    .restart local v2    # "count":I
    goto :goto_1

    .line 3438
    :cond_2
    if-eq v2, v4, :cond_0

    .line 3441
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    const/4 v5, 0x0

    invoke-direct {p0, v0, v5, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .restart local p0    # "str":Ljava/lang/String;
    :cond_3
    move v1, v2

    .end local v2    # "count":I
    .restart local v1    # "count":I
    goto :goto_2
.end method

.method public static difference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "str2"    # Ljava/lang/String;

    .prologue
    .line 5929
    if-nez p0, :cond_0

    .line 5939
    .end local p1    # "str2":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 5932
    .restart local p1    # "str2":Ljava/lang/String;
    :cond_0
    if-nez p1, :cond_1

    move-object p1, p0

    .line 5933
    goto :goto_0

    .line 5935
    :cond_1
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringUtils;->indexOfDifference(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 5936
    .local v0, "at":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 5937
    const-string/jumbo p1, ""

    goto :goto_0

    .line 5939
    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static endsWith(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 6392
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->endsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static endsWith(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "suffix"    # Ljava/lang/String;
    .param p2, "ignoreCase"    # Z

    .prologue
    const/4 v4, 0x0

    .line 6433
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    .line 6434
    :cond_0
    if-nez p0, :cond_1

    if-nez p1, :cond_1

    const/4 v4, 0x1

    .line 6440
    :cond_1
    :goto_0
    return v4

    .line 6436
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 6439
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v2, v0, v1

    .line 6440
    .local v2, "strOffset":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    move v1, p2

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v4

    goto :goto_0
.end method

.method public static endsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 6418
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->endsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static equals(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "str2"    # Ljava/lang/String;

    .prologue
    .line 656
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "str2"    # Ljava/lang/String;

    .prologue
    .line 681
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static escape(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 4497
    invoke-static {p0}, Lorg/apache/commons/lang/StringEscapeUtils;->escapeJava(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getChomp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 4359
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 4360
    .local v0, "idx":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    if-ne v0, v1, :cond_0

    .line 4365
    .end local p1    # "sep":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 4362
    .restart local p1    # "sep":Ljava/lang/String;
    :cond_0
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 4363
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 4365
    :cond_1
    const-string/jumbo p1, ""

    goto :goto_0
.end method

.method public static getCommonPrefix([Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "strs"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 6107
    if-eqz p0, :cond_0

    array-length v1, p0

    if-nez v1, :cond_1

    .line 6108
    :cond_0
    const-string/jumbo v1, ""

    .line 6122
    :goto_0
    return-object v1

    .line 6110
    :cond_1
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->indexOfDifference([Ljava/lang/String;)I

    move-result v0

    .line 6111
    .local v0, "smallestIndexOfDiff":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 6113
    aget-object v1, p0, v2

    if-nez v1, :cond_2

    .line 6114
    const-string/jumbo v1, ""

    goto :goto_0

    .line 6116
    :cond_2
    aget-object v1, p0, v2

    goto :goto_0

    .line 6117
    :cond_3
    if-nez v0, :cond_4

    .line 6119
    const-string/jumbo v1, ""

    goto :goto_0

    .line 6122
    :cond_4
    aget-object v1, p0, v2

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getLevenshteinDistance(Ljava/lang/String;Ljava/lang/String;)I
    .locals 13
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "t"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 6163
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 6164
    :cond_0
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "Strings must not be null"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 6184
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 6185
    .local v6, "n":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 6187
    .local v5, "m":I
    if-nez v6, :cond_2

    move v10, v5

    .line 6236
    :goto_0
    return v10

    .line 6189
    :cond_2
    if-nez v5, :cond_3

    move v10, v6

    .line 6190
    goto :goto_0

    .line 6193
    :cond_3
    if-le v6, v5, :cond_4

    .line 6195
    move-object v9, p0

    .line 6196
    .local v9, "tmp":Ljava/lang/String;
    move-object p0, p1

    .line 6197
    move-object p1, v9

    .line 6198
    move v6, v5

    .line 6199
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 6202
    .end local v9    # "tmp":Ljava/lang/String;
    :cond_4
    add-int/lit8 v11, v6, 0x1

    new-array v7, v11, [I

    .line 6203
    .local v7, "p":[I
    add-int/lit8 v11, v6, 0x1

    new-array v2, v11, [I

    .line 6214
    .local v2, "d":[I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-gt v3, v6, :cond_5

    .line 6215
    aput v3, v7, v3

    .line 6214
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 6218
    :cond_5
    const/4 v4, 0x1

    .local v4, "j":I
    :goto_2
    if-gt v4, v5, :cond_8

    .line 6219
    add-int/lit8 v11, v4, -0x1

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 6220
    .local v8, "t_j":C
    aput v4, v2, v10

    .line 6222
    const/4 v3, 0x1

    :goto_3
    if-gt v3, v6, :cond_7

    .line 6223
    add-int/lit8 v11, v3, -0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    if-ne v11, v8, :cond_6

    move v1, v10

    .line 6225
    .local v1, "cost":I
    :goto_4
    add-int/lit8 v11, v3, -0x1

    aget v11, v2, v11

    add-int/lit8 v11, v11, 0x1

    aget v12, v7, v3

    add-int/lit8 v12, v12, 0x1

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    add-int/lit8 v12, v3, -0x1

    aget v12, v7, v12

    add-int/2addr v12, v1

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    aput v11, v2, v3

    .line 6222
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 6223
    .end local v1    # "cost":I
    :cond_6
    const/4 v1, 0x1

    goto :goto_4

    .line 6229
    :cond_7
    move-object v0, v7

    .line 6230
    .local v0, "_d":[I
    move-object v7, v2

    .line 6231
    move-object v2, v0

    .line 6218
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 6236
    .end local v0    # "_d":[I
    .end local v8    # "t_j":C
    :cond_8
    aget v10, v7, v6

    goto :goto_0
.end method

.method public static getNestedString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 2292
    invoke-static {p0, p1, p1}, Lorg/apache/commons/lang/StringUtils;->substringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getNestedString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "open"    # Ljava/lang/String;
    .param p2, "close"    # Ljava/lang/String;

    .prologue
    .line 2322
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang/StringUtils;->substringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPrechomp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 4401
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 4402
    .local v0, "idx":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4403
    const-string/jumbo v1, ""

    .line 4405
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static indexOf(Ljava/lang/String;C)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChar"    # C

    .prologue
    .line 706
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 707
    const/4 v0, -0x1

    .line 709
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOf(Ljava/lang/String;CI)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChar"    # C
    .param p2, "startPos"    # I

    .prologue
    .line 738
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 739
    const/4 v0, -0x1

    .line 741
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOf(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;

    .prologue
    .line 767
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 768
    :cond_0
    const/4 v0, -0x1

    .line 770
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOf(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "startPos"    # I

    .prologue
    .line 879
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 880
    :cond_0
    const/4 v0, -0x1

    .line 886
    :goto_0
    return v0

    .line 883
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lt p2, v0, :cond_2

    .line 884
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0

    .line 886
    :cond_2
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOfAny(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChars"    # Ljava/lang/String;

    .prologue
    .line 1367
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1368
    :cond_0
    const/4 v0, -0x1

    .line 1370
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->indexOfAny(Ljava/lang/String;[C)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOfAny(Ljava/lang/String;[C)I
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChars"    # [C

    .prologue
    const/4 v3, -0x1

    .line 1330
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([C)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_0
    move v1, v3

    .line 1341
    :cond_1
    :goto_0
    return v1

    .line 1333
    :cond_2
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_4

    .line 1334
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1335
    .local v0, "ch":C
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    array-length v4, p1

    if-ge v2, v4, :cond_3

    .line 1336
    aget-char v4, p1, v2

    if-eq v4, v0, :cond_1

    .line 1335
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1333
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0    # "ch":C
    .end local v2    # "j":I
    :cond_4
    move v1, v3

    .line 1341
    goto :goto_0
.end method

.method public static indexOfAny(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStrs"    # [Ljava/lang/String;

    .prologue
    const/4 v5, -0x1

    .line 1686
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    :cond_0
    move v1, v5

    .line 1710
    :cond_1
    :goto_0
    return v1

    .line 1689
    :cond_2
    array-length v3, p1

    .line 1692
    .local v3, "sz":I
    const v1, 0x7fffffff

    .line 1694
    .local v1, "ret":I
    const/4 v4, 0x0

    .line 1695
    .local v4, "tmp":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v3, :cond_5

    .line 1696
    aget-object v2, p1, v0

    .line 1697
    .local v2, "search":Ljava/lang/String;
    if-nez v2, :cond_4

    .line 1695
    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1700
    :cond_4
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 1701
    if-eq v4, v5, :cond_3

    .line 1705
    if-ge v4, v1, :cond_3

    .line 1706
    move v1, v4

    goto :goto_2

    .line 1710
    .end local v2    # "search":Ljava/lang/String;
    :cond_5
    const v6, 0x7fffffff

    if-ne v1, v6, :cond_1

    move v1, v5

    goto :goto_0
.end method

.method public static indexOfAnyBut(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChars"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 1510
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    move v0, v1

    .line 1518
    :cond_1
    :goto_0
    return v0

    .line 1513
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 1514
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_1

    .line 1513
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 1518
    goto :goto_0
.end method

.method public static indexOfAnyBut(Ljava/lang/String;[C)I
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChars"    # [C

    .prologue
    const/4 v3, -0x1

    .line 1472
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([C)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_0
    move v1, v3

    .line 1484
    :cond_1
    :goto_0
    return v1

    .line 1475
    :cond_2
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_4

    .line 1476
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1477
    .local v0, "ch":C
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    array-length v4, p1

    if-ge v2, v4, :cond_1

    .line 1478
    aget-char v4, p1, v2

    if-ne v4, v0, :cond_3

    .line 1475
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1477
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v0    # "ch":C
    .end local v2    # "j":I
    :cond_4
    move v1, v3

    .line 1484
    goto :goto_0
.end method

.method public static indexOfDifference(Ljava/lang/String;Ljava/lang/String;)I
    .locals 4
    .param p0, "str1"    # Ljava/lang/String;
    .param p1, "str2"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 5966
    if-ne p0, p1, :cond_1

    move v0, v1

    .line 5981
    :cond_0
    :goto_0
    return v0

    .line 5969
    :cond_1
    if-eqz p0, :cond_2

    if-nez p1, :cond_3

    .line 5970
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 5973
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 5974
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_5

    .line 5978
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    move v0, v1

    .line 5981
    goto :goto_0

    .line 5973
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOfDifference([Ljava/lang/String;)I
    .locals 14
    .param p0, "strs"    # [Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    const/4 v11, -0x1

    .line 6016
    if-eqz p0, :cond_0

    array-length v12, p0

    const/4 v13, 0x1

    if-gt v12, v13, :cond_2

    :cond_0
    move v8, v11

    .line 6070
    :cond_1
    :goto_0
    return v8

    .line 6019
    :cond_2
    const/4 v1, 0x0

    .line 6020
    .local v1, "anyStringNull":Z
    const/4 v0, 0x1

    .line 6021
    .local v0, "allStringsNull":Z
    array-length v2, p0

    .line 6022
    .local v2, "arrayLen":I
    const v8, 0x7fffffff

    .line 6023
    .local v8, "shortestStrLen":I
    const/4 v7, 0x0

    .line 6028
    .local v7, "longestStrLen":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v2, :cond_4

    .line 6029
    aget-object v12, p0, v6

    if-nez v12, :cond_3

    .line 6030
    const/4 v1, 0x1

    .line 6031
    const/4 v8, 0x0

    .line 6028
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 6033
    :cond_3
    const/4 v0, 0x0

    .line 6034
    aget-object v12, p0, v6

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    invoke-static {v12, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 6035
    aget-object v12, p0, v6

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    invoke-static {v12, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    goto :goto_2

    .line 6040
    :cond_4
    if-nez v0, :cond_5

    if-nez v7, :cond_6

    if-nez v1, :cond_6

    :cond_5
    move v8, v11

    .line 6041
    goto :goto_0

    .line 6045
    :cond_6
    if-nez v8, :cond_7

    move v8, v10

    .line 6046
    goto :goto_0

    .line 6050
    :cond_7
    const/4 v5, -0x1

    .line 6051
    .local v5, "firstDiff":I
    const/4 v9, 0x0

    .local v9, "stringPos":I
    :goto_3
    if-ge v9, v8, :cond_9

    .line 6052
    aget-object v12, p0, v10

    invoke-virtual {v12, v9}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 6053
    .local v4, "comparisonChar":C
    const/4 v3, 0x1

    .local v3, "arrayPos":I
    :goto_4
    if-ge v3, v2, :cond_8

    .line 6054
    aget-object v12, p0, v3

    invoke-virtual {v12, v9}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-eq v12, v4, :cond_b

    .line 6055
    move v5, v9

    .line 6059
    :cond_8
    if-eq v5, v11, :cond_c

    .line 6064
    .end local v3    # "arrayPos":I
    .end local v4    # "comparisonChar":C
    :cond_9
    if-ne v5, v11, :cond_a

    if-ne v8, v7, :cond_1

    :cond_a
    move v8, v5

    .line 6070
    goto :goto_0

    .line 6053
    .restart local v3    # "arrayPos":I
    .restart local v4    # "comparisonChar":C
    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 6051
    :cond_c
    add-int/lit8 v9, v9, 0x1

    goto :goto_3
.end method

.method public static indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;

    .prologue
    .line 914
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "startPos"    # I

    .prologue
    const/4 v7, -0x1

    .line 949
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    :cond_0
    move v2, v7

    .line 967
    :cond_1
    :goto_0
    return v2

    .line 952
    :cond_2
    if-gez p2, :cond_3

    .line 953
    const/4 p2, 0x0

    .line 955
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v6, v0, 0x1

    .line 956
    .local v6, "endLimit":I
    if-le p2, v6, :cond_4

    move v2, v7

    .line 957
    goto :goto_0

    .line 959
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_5

    move v2, p2

    .line 960
    goto :goto_0

    .line 962
    :cond_5
    move v2, p2

    .local v2, "i":I
    :goto_1
    if-ge v2, v6, :cond_6

    .line 963
    const/4 v1, 0x1

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-nez v0, :cond_1

    .line 962
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_6
    move v2, v7

    .line 967
    goto :goto_0
.end method

.method public static isAllLowerCase(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5554
    if-eqz p0, :cond_0

    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 5563
    :cond_0
    :goto_0
    return v2

    .line 5557
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5558
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 5559
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5558
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5563
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isAllUpperCase(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5585
    if-eqz p0, :cond_0

    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 5594
    :cond_0
    :goto_0
    return v2

    .line 5588
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5589
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 5590
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5589
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5594
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isAlpha(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5282
    if-nez p0, :cond_1

    .line 5291
    :cond_0
    :goto_0
    return v2

    .line 5285
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5286
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 5287
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5286
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5291
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isAlphaSpace(Ljava/lang/String;)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5316
    if-nez p0, :cond_1

    .line 5325
    :cond_0
    :goto_0
    return v2

    .line 5319
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5320
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 5321
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    .line 5320
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5325
    :cond_3
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isAlphanumeric(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5349
    if-nez p0, :cond_1

    .line 5358
    :cond_0
    :goto_0
    return v2

    .line 5352
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5353
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 5354
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5353
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5358
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isAlphanumericSpace(Ljava/lang/String;)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5383
    if-nez p0, :cond_1

    .line 5392
    :cond_0
    :goto_0
    return v2

    .line 5386
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5387
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 5388
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    .line 5387
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5392
    :cond_3
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isAsciiPrintable(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5421
    if-nez p0, :cond_1

    .line 5430
    :cond_0
    :goto_0
    return v2

    .line 5424
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5425
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 5426
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lorg/apache/commons/lang/CharUtils;->isAsciiPrintable(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5425
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5430
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isBlank(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 229
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .local v1, "strLen":I
    if-nez v1, :cond_1

    .line 237
    .end local v1    # "strLen":I
    :cond_0
    :goto_0
    return v2

    .line 232
    .restart local v1    # "strLen":I
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_0

    .line 233
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_2

    .line 234
    const/4 v2, 0x0

    goto :goto_0

    .line 232
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isEmpty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 191
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotBlank(Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 257
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty(Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 209
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNumeric(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5455
    if-nez p0, :cond_1

    .line 5464
    :cond_0
    :goto_0
    return v2

    .line 5458
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5459
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 5460
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5459
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5464
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isNumericSpace(Ljava/lang/String;)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5491
    if-nez p0, :cond_1

    .line 5500
    :cond_0
    :goto_0
    return v2

    .line 5494
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5495
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 5496
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    .line 5495
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5500
    :cond_3
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static isWhitespace(Ljava/lang/String;)Z
    .locals 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 5523
    if-nez p0, :cond_1

    .line 5532
    :cond_0
    :goto_0
    return v2

    .line 5526
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 5527
    .local v1, "sz":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 5528
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5527
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 5532
    :cond_2
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public static join(Ljava/util/Collection;C)Ljava/lang/String;
    .locals 1
    .param p0, "collection"    # Ljava/util/Collection;
    .param p1, "separator"    # C

    .prologue
    .line 3350
    if-nez p0, :cond_0

    .line 3351
    const/4 v0, 0x0

    .line 3353
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/commons/lang/StringUtils;->join(Ljava/util/Iterator;C)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "collection"    # Ljava/util/Collection;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 3371
    if-nez p0, :cond_0

    .line 3372
    const/4 v0, 0x0

    .line 3374
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/commons/lang/StringUtils;->join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static join(Ljava/util/Iterator;C)Ljava/lang/String;
    .locals 4
    .param p0, "iterator"    # Ljava/util/Iterator;
    .param p1, "separator"    # C

    .prologue
    .line 3262
    if-nez p0, :cond_0

    .line 3263
    const/4 v3, 0x0

    .line 3287
    :goto_0
    return-object v3

    .line 3265
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3266
    const-string/jumbo v3, ""

    goto :goto_0

    .line 3268
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 3269
    .local v1, "first":Ljava/lang/Object;
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 3270
    invoke-static {v1}, Lorg/apache/commons/lang/ObjectUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 3274
    :cond_2
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v3, 0x100

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 3275
    .local v0, "buf":Ljava/lang/StringBuffer;
    if-eqz v1, :cond_3

    .line 3276
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 3279
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 3280
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 3281
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 3282
    .local v2, "obj":Ljava/lang/Object;
    if-eqz v2, :cond_3

    .line 3283
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 3287
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "iterator"    # Ljava/util/Iterator;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 3306
    if-nez p0, :cond_0

    .line 3307
    const/4 v3, 0x0

    .line 3332
    :goto_0
    return-object v3

    .line 3309
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3310
    const-string/jumbo v3, ""

    goto :goto_0

    .line 3312
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 3313
    .local v1, "first":Ljava/lang/Object;
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 3314
    invoke-static {v1}, Lorg/apache/commons/lang/ObjectUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 3318
    :cond_2
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v3, 0x100

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 3319
    .local v0, "buf":Ljava/lang/StringBuffer;
    if-eqz v1, :cond_3

    .line 3320
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 3323
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 3324
    if-eqz p1, :cond_4

    .line 3325
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3327
    :cond_4
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 3328
    .local v2, "obj":Ljava/lang/Object;
    if-eqz v2, :cond_3

    .line 3329
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 3332
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static join([Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "array"    # [Ljava/lang/Object;

    .prologue
    .line 3074
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join([Ljava/lang/Object;C)Ljava/lang/String;
    .locals 2
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "separator"    # C

    .prologue
    .line 3100
    if-nez p0, :cond_0

    .line 3101
    const/4 v0, 0x0

    .line 3104
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/StringUtils;->join([Ljava/lang/Object;CII)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static join([Ljava/lang/Object;CII)Ljava/lang/String;
    .locals 4
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "separator"    # C
    .param p2, "startIndex"    # I
    .param p3, "endIndex"    # I

    .prologue
    .line 3134
    if-nez p0, :cond_0

    .line 3135
    const/4 v3, 0x0

    .line 3153
    :goto_0
    return-object v3

    .line 3137
    :cond_0
    sub-int v1, p3, p2

    .line 3138
    .local v1, "bufSize":I
    if-gtz v1, :cond_1

    .line 3139
    const-string/jumbo v3, ""

    goto :goto_0

    .line 3142
    :cond_1
    aget-object v3, p0, p2

    if-nez v3, :cond_4

    const/16 v3, 0x10

    :goto_1
    add-int/lit8 v3, v3, 0x1

    mul-int/2addr v1, v3

    .line 3143
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 3145
    .local v0, "buf":Ljava/lang/StringBuffer;
    move v2, p2

    .local v2, "i":I
    :goto_2
    if-ge v2, p3, :cond_5

    .line 3146
    if-le v2, p2, :cond_2

    .line 3147
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 3149
    :cond_2
    aget-object v3, p0, v2

    if-eqz v3, :cond_3

    .line 3150
    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 3145
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 3142
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    :cond_4
    aget-object v3, p0, p2

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_1

    .line 3153
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v2    # "i":I
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 3181
    if-nez p0, :cond_0

    .line 3182
    const/4 v0, 0x0

    .line 3184
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static join([Ljava/lang/Object;Ljava/lang/String;II)Ljava/lang/String;
    .locals 5
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "separator"    # Ljava/lang/String;
    .param p2, "startIndex"    # I
    .param p3, "endIndex"    # I

    .prologue
    .line 3215
    if-nez p0, :cond_0

    .line 3216
    const/4 v3, 0x0

    .line 3242
    :goto_0
    return-object v3

    .line 3218
    :cond_0
    if-nez p1, :cond_1

    .line 3219
    const-string/jumbo p1, ""

    .line 3224
    :cond_1
    sub-int v1, p3, p2

    .line 3225
    .local v1, "bufSize":I
    if-gtz v1, :cond_2

    .line 3226
    const-string/jumbo v3, ""

    goto :goto_0

    .line 3229
    :cond_2
    aget-object v3, p0, p2

    if-nez v3, :cond_5

    const/16 v3, 0x10

    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    mul-int/2addr v1, v3

    .line 3232
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 3234
    .local v0, "buf":Ljava/lang/StringBuffer;
    move v2, p2

    .local v2, "i":I
    :goto_2
    if-ge v2, p3, :cond_6

    .line 3235
    if-le v2, p2, :cond_3

    .line 3236
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3238
    :cond_3
    aget-object v3, p0, v2

    if-eqz v3, :cond_4

    .line 3239
    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 3234
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 3229
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "i":I
    :cond_5
    aget-object v3, p0, p2

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_1

    .line 3242
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v2    # "i":I
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static lastIndexOf(Ljava/lang/String;C)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChar"    # C

    .prologue
    .line 992
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 993
    const/4 v0, -0x1

    .line 995
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOf(Ljava/lang/String;CI)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChar"    # C
    .param p2, "startPos"    # I

    .prologue
    .line 1026
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1027
    const/4 v0, -0x1

    .line 1029
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOf(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;

    .prologue
    .line 1055
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1056
    :cond_0
    const/4 v0, -0x1

    .line 1058
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOf(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "startPos"    # I

    .prologue
    .line 1127
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1128
    :cond_0
    const/4 v0, -0x1

    .line 1130
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOfAny(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStrs"    # [Ljava/lang/String;

    .prologue
    .line 1739
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    .line 1740
    :cond_0
    const/4 v1, -0x1

    .line 1755
    :cond_1
    return v1

    .line 1742
    :cond_2
    array-length v3, p1

    .line 1743
    .local v3, "sz":I
    const/4 v1, -0x1

    .line 1744
    .local v1, "ret":I
    const/4 v4, 0x0

    .line 1745
    .local v4, "tmp":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_1

    .line 1746
    aget-object v2, p1, v0

    .line 1747
    .local v2, "search":Ljava/lang/String;
    if-nez v2, :cond_4

    .line 1745
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1750
    :cond_4
    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    .line 1751
    if-le v4, v1, :cond_3

    .line 1752
    move v1, v4

    goto :goto_1
.end method

.method public static lastIndexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;

    .prologue
    .line 1156
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1157
    :cond_0
    const/4 v0, -0x1

    .line 1159
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->lastIndexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "startPos"    # I

    .prologue
    const/4 v6, -0x1

    .line 1191
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    :cond_0
    move v2, v6

    .line 1209
    :cond_1
    :goto_0
    return v2

    .line 1194
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    if-le p2, v0, :cond_3

    .line 1195
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int p2, v0, v1

    .line 1197
    :cond_3
    if-gez p2, :cond_4

    move v2, v6

    .line 1198
    goto :goto_0

    .line 1200
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_5

    move v2, p2

    .line 1201
    goto :goto_0

    .line 1204
    :cond_5
    move v2, p2

    .local v2, "i":I
    :goto_1
    if-ltz v2, :cond_6

    .line 1205
    const/4 v1, 0x1

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1204
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_6
    move v2, v6

    .line 1209
    goto :goto_0
.end method

.method public static lastOrdinalIndexOf(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "ordinal"    # I

    .prologue
    .line 1095
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/StringUtils;->ordinalIndexOf(Ljava/lang/String;Ljava/lang/String;IZ)I

    move-result v0

    return v0
.end method

.method public static left(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "len"    # I

    .prologue
    .line 1895
    if-nez p0, :cond_1

    .line 1896
    const/4 p0, 0x0

    .line 1904
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 1898
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    if-gez p1, :cond_2

    .line 1899
    const-string/jumbo p0, ""

    goto :goto_0

    .line 1901
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 1904
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static leftPad(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I

    .prologue
    .line 4760
    const/16 v0, 0x20

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static leftPad(Ljava/lang/String;IC)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "padChar"    # C

    .prologue
    .line 4785
    if-nez p0, :cond_1

    .line 4786
    const/4 p0, 0x0

    .line 4795
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 4788
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v0, p1, v1

    .line 4789
    .local v0, "pads":I
    if-lez v0, :cond_0

    .line 4792
    const/16 v1, 0x2000

    if-le v0, v1, :cond_2

    .line 4793
    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4795
    :cond_2
    invoke-static {v0, p2}, Lorg/apache/commons/lang/StringUtils;->padding(IC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static leftPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "padStr"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 4822
    if-nez p0, :cond_1

    .line 4823
    const/4 p0, 0x0

    .line 4848
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 4825
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-static {p2}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 4826
    const-string/jumbo p2, " "

    .line 4828
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 4829
    .local v2, "padLen":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 4830
    .local v5, "strLen":I
    sub-int v4, p1, v5

    .line 4831
    .local v4, "pads":I
    if-lez v4, :cond_0

    .line 4834
    const/4 v6, 0x1

    if-ne v2, v6, :cond_3

    const/16 v6, 0x2000

    if-gt v4, v6, :cond_3

    .line 4835
    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {p0, p1, v6}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4838
    :cond_3
    if-ne v4, v2, :cond_4

    .line 4839
    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4840
    :cond_4
    if-ge v4, v2, :cond_5

    .line 4841
    invoke-virtual {p2, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4843
    :cond_5
    new-array v3, v4, [C

    .line 4844
    .local v3, "padding":[C
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 4845
    .local v1, "padChars":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v4, :cond_6

    .line 4846
    rem-int v6, v0, v2

    aget-char v6, v1, v6

    aput-char v6, v3, v0

    .line 4845
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 4848
    :cond_6
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v3}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v6, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static length(Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 4861
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0
.end method

.method public static lowerCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5045
    if-nez p0, :cond_0

    .line 5046
    const/4 v0, 0x0

    .line 5048
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static lowerCase(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 5068
    if-nez p0, :cond_0

    .line 5069
    const/4 v0, 0x0

    .line 5071
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static mid(Ljava/lang/String;II)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 1965
    if-nez p0, :cond_0

    .line 1966
    const/4 v0, 0x0

    .line 1977
    :goto_0
    return-object v0

    .line 1968
    :cond_0
    if-ltz p2, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le p1, v0, :cond_2

    .line 1969
    :cond_1
    const-string/jumbo v0, ""

    goto :goto_0

    .line 1971
    :cond_2
    if-gez p1, :cond_3

    .line 1972
    const/4 p1, 0x0

    .line 1974
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int v1, p1, p2

    if-gt v0, v1, :cond_4

    .line 1975
    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1977
    :cond_4
    add-int v0, p1, p2

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static ordinalIndexOf(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "ordinal"    # I

    .prologue
    .line 807
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/StringUtils;->ordinalIndexOf(Ljava/lang/String;Ljava/lang/String;IZ)I

    move-result v0

    return v0
.end method

.method private static ordinalIndexOf(Ljava/lang/String;Ljava/lang/String;IZ)I
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "ordinal"    # I
    .param p3, "lastIndex"    # Z

    .prologue
    const/4 v1, -0x1

    .line 825
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-gtz p2, :cond_1

    .line 844
    :cond_0
    :goto_0
    return v1

    .line 828
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    .line 829
    if-eqz p3, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    :goto_1
    move v1, v2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 831
    :cond_3
    const/4 v0, 0x0

    .line 832
    .local v0, "found":I
    if-eqz p3, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 834
    .local v1, "index":I
    :cond_4
    if-eqz p3, :cond_5

    .line 835
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v1

    .line 839
    :goto_2
    if-ltz v1, :cond_0

    .line 842
    add-int/lit8 v0, v0, 0x1

    .line 843
    if-lt v0, p2, :cond_4

    goto :goto_0

    .line 837
    :cond_5
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_2
.end method

.method public static overlay(Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "overlay"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 4191
    if-nez p0, :cond_0

    .line 4192
    const/4 v2, 0x0

    .line 4215
    :goto_0
    return-object v2

    .line 4194
    :cond_0
    if-nez p1, :cond_1

    .line 4195
    const-string/jumbo p1, ""

    .line 4197
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 4198
    .local v0, "len":I
    if-gez p2, :cond_2

    .line 4199
    const/4 p2, 0x0

    .line 4201
    :cond_2
    if-le p2, v0, :cond_3

    .line 4202
    move p2, v0

    .line 4204
    :cond_3
    if-gez p3, :cond_4

    .line 4205
    const/4 p3, 0x0

    .line 4207
    :cond_4
    if-le p3, v0, :cond_5

    .line 4208
    move p3, v0

    .line 4210
    :cond_5
    if-le p2, p3, :cond_6

    .line 4211
    move v1, p2

    .line 4212
    .local v1, "temp":I
    move p2, p3

    .line 4213
    move p3, v1

    .line 4215
    .end local v1    # "temp":I
    :cond_6
    new-instance v2, Ljava/lang/StringBuffer;

    add-int v3, v0, p2

    sub-int/2addr v3, p3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0, p3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static overlayString(Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;
    .locals 3
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "overlay"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 4154
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, p2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    sub-int/2addr v1, p3

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0, p3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static padding(IC)Ljava/lang/String;
    .locals 5
    .param p0, "repeat"    # I
    .param p1, "padChar"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    .prologue
    .line 4618
    if-gez p0, :cond_0

    .line 4619
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Cannot pad a negative amount: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 4621
    :cond_0
    new-array v0, p0, [C

    .line 4622
    .local v0, "buf":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 4623
    aput-char p1, v0, v1

    .line 4622
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4625
    :cond_1
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method

.method public static prechomp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "sep"    # Ljava/lang/String;

    .prologue
    .line 4381
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 4382
    .local v0, "idx":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4385
    .end local p0    # "str":Ljava/lang/String;
    :goto_0
    return-object p0

    .restart local p0    # "str":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static remove(Ljava/lang/String;C)Ljava/lang/String;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "remove"    # C

    .prologue
    .line 3635
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_1

    .line 3645
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 3638
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 3639
    .local v0, "chars":[C
    const/4 v2, 0x0

    .line 3640
    .local v2, "pos":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v4, v0

    if-ge v1, v4, :cond_3

    .line 3641
    aget-char v4, v0, v1

    if-eq v4, p1, :cond_2

    .line 3642
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "pos":I
    .local v3, "pos":I
    aget-char v4, v0, v1

    aput-char v4, v0, v2

    move v2, v3

    .line 3640
    .end local v3    # "pos":I
    .restart local v2    # "pos":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3645
    :cond_3
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-direct {p0, v0, v4, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public static remove(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "remove"    # Ljava/lang/String;

    .prologue
    .line 3609
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3612
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    const-string/jumbo v0, ""

    const/4 v1, -0x1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static removeEnd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "remove"    # Ljava/lang/String;

    .prologue
    .line 3540
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3546
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 3543
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3544
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static removeEndIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "remove"    # Ljava/lang/String;

    .prologue
    .line 3576
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3582
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 3579
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringUtils;->endsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3580
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static removeStart(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "remove"    # Ljava/lang/String;

    .prologue
    .line 3471
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3477
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 3474
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3475
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static removeStartIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "remove"    # Ljava/lang/String;

    .prologue
    .line 3506
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3512
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 3509
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringUtils;->startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3510
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static repeat(Ljava/lang/String;I)Ljava/lang/String;
    .locals 12
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "repeat"    # I

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 4524
    if-nez p0, :cond_1

    .line 4525
    const/4 p0, 0x0

    .line 4561
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 4527
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    if-gtz p1, :cond_2

    .line 4528
    const-string/jumbo p0, ""

    goto :goto_0

    .line 4530
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 4531
    .local v5, "inputLength":I
    if-eq p1, v11, :cond_0

    if-eqz v5, :cond_0

    .line 4534
    if-ne v5, v11, :cond_3

    const/16 v9, 0x2000

    if-gt p1, v9, :cond_3

    .line 4535
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {p1, v9}, Lorg/apache/commons/lang/StringUtils;->padding(IC)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4538
    :cond_3
    mul-int v8, v5, p1

    .line 4539
    .local v8, "outputLength":I
    packed-switch v5, :pswitch_data_0

    .line 4557
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v8}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 4558
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, p1, :cond_6

    .line 4559
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4558
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 4541
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v4    # "i":I
    :pswitch_0
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 4542
    .local v1, "ch":C
    new-array v6, v8, [C

    .line 4543
    .local v6, "output1":[C
    add-int/lit8 v4, p1, -0x1

    .restart local v4    # "i":I
    :goto_2
    if-ltz v4, :cond_4

    .line 4544
    aput-char v1, v6, v4

    .line 4543
    add-int/lit8 v4, v4, -0x1

    goto :goto_2

    .line 4546
    :cond_4
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    invoke-direct {p0, v6}, Ljava/lang/String;-><init>([C)V

    goto :goto_0

    .line 4548
    .end local v1    # "ch":C
    .end local v4    # "i":I
    .end local v6    # "output1":[C
    .restart local p0    # "str":Ljava/lang/String;
    :pswitch_1
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 4549
    .local v2, "ch0":C
    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 4550
    .local v3, "ch1":C
    new-array v7, v8, [C

    .line 4551
    .local v7, "output2":[C
    mul-int/lit8 v9, p1, 0x2

    add-int/lit8 v4, v9, -0x2

    .restart local v4    # "i":I
    :goto_3
    if-ltz v4, :cond_5

    .line 4552
    aput-char v2, v7, v4

    .line 4553
    add-int/lit8 v9, v4, 0x1

    aput-char v3, v7, v9

    .line 4551
    add-int/lit8 v4, v4, -0x1

    add-int/lit8 v4, v4, -0x1

    goto :goto_3

    .line 4555
    :cond_5
    new-instance p0, Ljava/lang/String;

    .end local p0    # "str":Ljava/lang/String;
    invoke-direct {p0, v7}, Ljava/lang/String;-><init>([C)V

    goto :goto_0

    .line 4561
    .end local v2    # "ch0":C
    .end local v3    # "ch1":C
    .end local v7    # "output2":[C
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local p0    # "str":Ljava/lang/String;
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4539
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static repeat(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;
    .param p2, "repeat"    # I

    .prologue
    .line 4585
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 4586
    :cond_0
    invoke-static {p0, p2}, Lorg/apache/commons/lang/StringUtils;->repeat(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 4590
    :goto_0
    return-object v1

    .line 4589
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Lorg/apache/commons/lang/StringUtils;->repeat(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 4590
    .local v0, "result":Ljava/lang/String;
    invoke-static {v0, p1}, Lorg/apache/commons/lang/StringUtils;->removeEnd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "searchString"    # Ljava/lang/String;
    .param p2, "replacement"    # Ljava/lang/String;

    .prologue
    .line 3701
    const/4 v0, -0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 8
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "searchString"    # Ljava/lang/String;
    .param p2, "replacement"    # Ljava/lang/String;
    .param p3, "max"    # I

    .prologue
    const/16 v5, 0x40

    const/4 v7, -0x1

    .line 3733
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 3755
    .end local p0    # "text":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 3736
    .restart local p0    # "text":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    .line 3737
    .local v4, "start":I
    invoke-virtual {p0, p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 3738
    .local v1, "end":I
    if-eq v1, v7, :cond_0

    .line 3741
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 3742
    .local v3, "replLength":I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    sub-int v2, v6, v3

    .line 3743
    .local v2, "increase":I
    if-gez v2, :cond_2

    const/4 v2, 0x0

    .line 3744
    :cond_2
    if-gez p3, :cond_5

    const/16 v5, 0x10

    :cond_3
    :goto_1
    mul-int/2addr v2, v5

    .line 3745
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v2

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 3746
    .local v0, "buf":Ljava/lang/StringBuffer;
    :goto_2
    if-eq v1, v7, :cond_4

    .line 3747
    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3748
    add-int v4, v1, v3

    .line 3749
    add-int/lit8 p3, p3, -0x1

    if-nez p3, :cond_6

    .line 3754
    :cond_4
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3755
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 3744
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    :cond_5
    if-gt p3, v5, :cond_3

    move v5, p3

    goto :goto_1

    .line 3752
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    :cond_6
    invoke-virtual {p0, p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_2
.end method

.method public static replaceChars(Ljava/lang/String;CC)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChar"    # C
    .param p2, "replaceChar"    # C

    .prologue
    .line 4055
    if-nez p0, :cond_0

    .line 4056
    const/4 v0, 0x0

    .line 4058
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static replaceChars(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "searchChars"    # Ljava/lang/String;
    .param p2, "replaceChars"    # Ljava/lang/String;

    .prologue
    .line 4098
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 4123
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 4101
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    if-nez p2, :cond_2

    .line 4102
    const-string/jumbo p2, ""

    .line 4104
    :cond_2
    const/4 v4, 0x0

    .line 4105
    .local v4, "modified":Z
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    .line 4106
    .local v5, "replaceCharsLength":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 4107
    .local v6, "strLength":I
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 4108
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v6, :cond_5

    .line 4109
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 4110
    .local v1, "ch":C
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 4111
    .local v3, "index":I
    if-ltz v3, :cond_4

    .line 4112
    const/4 v4, 0x1

    .line 4113
    if-ge v3, v5, :cond_3

    .line 4114
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 4108
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4117
    :cond_4
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 4120
    .end local v1    # "ch":C
    .end local v3    # "index":I
    :cond_5
    if-eqz v4, :cond_0

    .line 4121
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "searchList"    # [Ljava/lang/String;
    .param p2, "replacementList"    # [Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 3798
    invoke-static {p0, p1, p2, v0, v0}, Lorg/apache/commons/lang/StringUtils;->replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZI)Ljava/lang/String;
    .locals 20
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "searchList"    # [Ljava/lang/String;
    .param p2, "replacementList"    # [Ljava/lang/String;
    .param p3, "repeat"    # Z
    .param p4, "timeToLive"    # I

    .prologue
    .line 3908
    if-eqz p0, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    if-eqz v17, :cond_0

    if-eqz p1, :cond_0

    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0

    if-eqz v17, :cond_0

    if-eqz p2, :cond_0

    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v17, v0

    if-nez v17, :cond_1

    .line 4029
    .end local p0    # "text":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 3915
    .restart local p0    # "text":Ljava/lang/String;
    :cond_1
    if-gez p4, :cond_2

    .line 3916
    new-instance v17, Ljava/lang/IllegalStateException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "TimeToLive of "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " is less than 0: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 3919
    :cond_2
    move-object/from16 v0, p1

    array-length v12, v0

    .line 3920
    .local v12, "searchLength":I
    move-object/from16 v0, p2

    array-length v10, v0

    .line 3923
    .local v10, "replacementLength":I
    if-eq v12, v10, :cond_3

    .line 3924
    new-instance v17, Ljava/lang/IllegalArgumentException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v19, "Search and Replace array lengths don\'t match: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string/jumbo v19, " vs "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 3931
    :cond_3
    new-array v8, v12, [Z

    .line 3934
    .local v8, "noMoreMatchesForReplIndex":[Z
    const/4 v15, -0x1

    .line 3935
    .local v15, "textIndex":I
    const/4 v9, -0x1

    .line 3936
    .local v9, "replaceIndex":I
    const/4 v14, -0x1

    .line 3940
    .local v14, "tempIndex":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v12, :cond_8

    .line 3941
    aget-boolean v17, v8, v6

    if-nez v17, :cond_4

    aget-object v17, p1, v6

    if-eqz v17, :cond_4

    aget-object v17, p1, v6

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-eqz v17, :cond_4

    aget-object v17, p2, v6

    if-nez v17, :cond_5

    .line 3940
    :cond_4
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 3946
    :cond_5
    aget-object v17, p1, v6

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    .line 3949
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v14, v0, :cond_6

    .line 3950
    const/16 v17, 0x1

    aput-boolean v17, v8, v6

    goto :goto_2

    .line 3952
    :cond_6
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_7

    if-ge v14, v15, :cond_4

    .line 3953
    :cond_7
    move v15, v14

    .line 3954
    move v9, v6

    goto :goto_2

    .line 3961
    :cond_8
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_0

    .line 3965
    const/4 v13, 0x0

    .line 3968
    .local v13, "start":I
    const/4 v7, 0x0

    .line 3971
    .local v7, "increase":I
    const/4 v6, 0x0

    :goto_3
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v6, v0, :cond_b

    .line 3972
    aget-object v17, p1, v6

    if-eqz v17, :cond_9

    aget-object v17, p2, v6

    if-nez v17, :cond_a

    .line 3971
    :cond_9
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 3975
    :cond_a
    aget-object v17, p2, v6

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    aget-object v18, p1, v6

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v18

    sub-int v5, v17, v18

    .line 3976
    .local v5, "greater":I
    if-lez v5, :cond_9

    .line 3977
    mul-int/lit8 v17, v5, 0x3

    add-int v7, v7, v17

    goto :goto_4

    .line 3981
    .end local v5    # "greater":I
    :cond_b
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    div-int/lit8 v17, v17, 0x5

    move/from16 v0, v17

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 3983
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    add-int v17, v17, v7

    move/from16 v0, v17

    invoke-direct {v4, v0}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 3985
    .local v4, "buf":Ljava/lang/StringBuffer;
    :cond_c
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_12

    .line 3987
    move v6, v13

    :goto_5
    if-ge v6, v15, :cond_d

    .line 3988
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 3987
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 3990
    :cond_d
    aget-object v17, p2, v9

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3992
    aget-object v17, p1, v9

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    add-int v13, v15, v17

    .line 3994
    const/4 v15, -0x1

    .line 3995
    const/4 v9, -0x1

    .line 3996
    const/4 v14, -0x1

    .line 3999
    const/4 v6, 0x0

    :goto_6
    if-ge v6, v12, :cond_c

    .line 4000
    aget-boolean v17, v8, v6

    if-nez v17, :cond_e

    aget-object v17, p1, v6

    if-eqz v17, :cond_e

    aget-object v17, p1, v6

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-eqz v17, :cond_e

    aget-object v17, p2, v6

    if-nez v17, :cond_f

    .line 3999
    :cond_e
    :goto_7
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 4005
    :cond_f
    aget-object v17, p1, v6

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    .line 4008
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v14, v0, :cond_10

    .line 4009
    const/16 v17, 0x1

    aput-boolean v17, v8, v6

    goto :goto_7

    .line 4011
    :cond_10
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_11

    if-ge v14, v15, :cond_e

    .line 4012
    :cond_11
    move v15, v14

    .line 4013
    move v9, v6

    goto :goto_7

    .line 4020
    :cond_12
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v16

    .line 4021
    .local v16, "textLength":I
    move v6, v13

    :goto_8
    move/from16 v0, v16

    if-ge v6, v0, :cond_13

    .line 4022
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 4021
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    .line 4024
    :cond_13
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    .line 4025
    .local v11, "result":Ljava/lang/String;
    if-nez p3, :cond_14

    move-object/from16 p0, v11

    .line 4026
    goto/16 :goto_0

    .line 4029
    :cond_14
    add-int/lit8 v17, p4, -0x1

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, v17

    invoke-static {v11, v0, v1, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0
.end method

.method public static replaceEachRepeatedly(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "searchList"    # [Ljava/lang/String;
    .param p2, "replacementList"    # [Ljava/lang/String;

    .prologue
    .line 3849
    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 3850
    .local v0, "timeToLive":I
    :goto_0
    const/4 v1, 0x1

    invoke-static {p0, p1, p2, v1, v0}, Lorg/apache/commons/lang/StringUtils;->replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 3849
    .end local v0    # "timeToLive":I
    :cond_0
    array-length v0, p1

    goto :goto_0
.end method

.method public static replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "searchString"    # Ljava/lang/String;
    .param p2, "replacement"    # Ljava/lang/String;

    .prologue
    .line 3674
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static reverse(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5678
    if-nez p0, :cond_0

    .line 5679
    const/4 v0, 0x0

    .line 5681
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, p0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->reverse()Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static reverseDelimited(Ljava/lang/String;C)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChar"    # C

    .prologue
    .line 5704
    if-nez p0, :cond_0

    .line 5705
    const/4 v1, 0x0

    .line 5711
    :goto_0
    return-object v1

    .line 5709
    :cond_0
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringUtils;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v0

    .line 5710
    .local v0, "strs":[Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/commons/lang/ArrayUtils;->reverse([Ljava/lang/Object;)V

    .line 5711
    invoke-static {v0, p1}, Lorg/apache/commons/lang/StringUtils;->join([Ljava/lang/Object;C)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static reverseDelimitedString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChars"    # Ljava/lang/String;

    .prologue
    .line 5737
    if-nez p0, :cond_0

    .line 5738
    const/4 v1, 0x0

    .line 5747
    :goto_0
    return-object v1

    .line 5742
    :cond_0
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 5743
    .local v0, "strs":[Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/commons/lang/ArrayUtils;->reverse([Ljava/lang/Object;)V

    .line 5744
    if-nez p1, :cond_1

    .line 5745
    const/16 v1, 0x20

    invoke-static {v0, v1}, Lorg/apache/commons/lang/StringUtils;->join([Ljava/lang/Object;C)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 5747
    :cond_1
    invoke-static {v0, p1}, Lorg/apache/commons/lang/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static right(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "len"    # I

    .prologue
    .line 1928
    if-nez p0, :cond_1

    .line 1929
    const/4 p0, 0x0

    .line 1937
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 1931
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    if-gez p1, :cond_2

    .line 1932
    const-string/jumbo p0, ""

    goto :goto_0

    .line 1934
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 1937
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, p1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static rightPad(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I

    .prologue
    .line 4648
    const/16 v0, 0x20

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static rightPad(Ljava/lang/String;IC)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "padChar"    # C

    .prologue
    .line 4673
    if-nez p0, :cond_1

    .line 4674
    const/4 p0, 0x0

    .line 4683
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 4676
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v0, p1, v1

    .line 4677
    .local v0, "pads":I
    if-lez v0, :cond_0

    .line 4680
    const/16 v1, 0x2000

    if-le v0, v1, :cond_2

    .line 4681
    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lorg/apache/commons/lang/StringUtils;->rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4683
    :cond_2
    invoke-static {v0, p2}, Lorg/apache/commons/lang/StringUtils;->padding(IC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "size"    # I
    .param p2, "padStr"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 4710
    if-nez p0, :cond_1

    .line 4711
    const/4 p0, 0x0

    .line 4736
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 4713
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-static {p2}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 4714
    const-string/jumbo p2, " "

    .line 4716
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 4717
    .local v2, "padLen":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 4718
    .local v5, "strLen":I
    sub-int v4, p1, v5

    .line 4719
    .local v4, "pads":I
    if-lez v4, :cond_0

    .line 4722
    const/4 v6, 0x1

    if-ne v2, v6, :cond_3

    const/16 v6, 0x2000

    if-gt v4, v6, :cond_3

    .line 4723
    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {p0, p1, v6}, Lorg/apache/commons/lang/StringUtils;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4726
    :cond_3
    if-ne v4, v2, :cond_4

    .line 4727
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4728
    :cond_4
    if-ge v4, v2, :cond_5

    .line 4729
    invoke-virtual {p2, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4731
    :cond_5
    new-array v3, v4, [C

    .line 4732
    .local v3, "padding":[C
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 4733
    .local v1, "padChars":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v4, :cond_6

    .line 4734
    rem-int v6, v0, v2

    aget-char v6, v1, v6

    aput-char v6, v3, v0

    .line 4733
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 4736
    :cond_6
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v3}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {p0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static split(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 2350
    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/StringUtils;->split(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static split(Ljava/lang/String;C)[Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChar"    # C

    .prologue
    .line 2378
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->splitWorker(Ljava/lang/String;CZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChars"    # Ljava/lang/String;

    .prologue
    .line 2407
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static split(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChars"    # Ljava/lang/String;
    .param p2, "max"    # I

    .prologue
    .line 2441
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByCharacterType(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 2952
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->splitByCharacterType(Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static splitByCharacterType(Ljava/lang/String;Z)[Ljava/lang/String;
    .locals 9
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "camelCase"    # Z

    .prologue
    .line 2998
    if-nez p0, :cond_0

    .line 2999
    const/4 v7, 0x0

    .line 3026
    :goto_0
    return-object v7

    .line 3001
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_1

    .line 3002
    sget-object v7, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 3004
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 3005
    .local v0, "c":[C
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3006
    .local v2, "list":Ljava/util/List;
    const/4 v5, 0x0

    .line 3007
    .local v5, "tokenStart":I
    aget-char v7, v0, v5

    invoke-static {v7}, Ljava/lang/Character;->getType(C)I

    move-result v1

    .line 3008
    .local v1, "currentType":I
    add-int/lit8 v4, v5, 0x1

    .local v4, "pos":I
    :goto_1
    array-length v7, v0

    if-ge v4, v7, :cond_5

    .line 3009
    aget-char v7, v0, v4

    invoke-static {v7}, Ljava/lang/Character;->getType(C)I

    move-result v6

    .line 3010
    .local v6, "type":I
    if-ne v6, v1, :cond_2

    .line 3008
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 3013
    :cond_2
    if-eqz p1, :cond_4

    const/4 v7, 0x2

    if-ne v6, v7, :cond_4

    const/4 v7, 0x1

    if-ne v1, v7, :cond_4

    .line 3014
    add-int/lit8 v3, v4, -0x1

    .line 3015
    .local v3, "newTokenStart":I
    if-eq v3, v5, :cond_3

    .line 3016
    new-instance v7, Ljava/lang/String;

    sub-int v8, v3, v5

    invoke-direct {v7, v0, v5, v8}, Ljava/lang/String;-><init>([CII)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3017
    move v5, v3

    .line 3023
    .end local v3    # "newTokenStart":I
    :cond_3
    :goto_3
    move v1, v6

    goto :goto_2

    .line 3020
    :cond_4
    new-instance v7, Ljava/lang/String;

    sub-int v8, v4, v5

    invoke-direct {v7, v0, v5, v8}, Ljava/lang/String;-><init>([CII)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3021
    move v5, v4

    goto :goto_3

    .line 3025
    .end local v6    # "type":I
    :cond_5
    new-instance v7, Ljava/lang/String;

    array-length v8, v0

    sub-int/2addr v8, v5

    invoke-direct {v7, v0, v5, v8}, Ljava/lang/String;-><init>([CII)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3026
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v2, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    check-cast v7, [Ljava/lang/String;

    goto :goto_0
.end method

.method public static splitByCharacterTypeCamelCase(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 2980
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->splitByCharacterType(Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByWholeSeparator(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 2468
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/StringUtils;->splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByWholeSeparator(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;
    .param p2, "max"    # I

    .prologue
    .line 2499
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/StringUtils;->splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByWholeSeparatorPreserveAllTokens(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 2528
    const/4 v0, -0x1

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/StringUtils;->splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByWholeSeparatorPreserveAllTokens(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;
    .param p2, "max"    # I

    .prologue
    .line 2561
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/StringUtils;->splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;
    .locals 8
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;
    .param p2, "max"    # I
    .param p3, "preserveAllTokens"    # Z

    .prologue
    const/4 v6, 0x0

    .line 2581
    if-nez p0, :cond_0

    .line 2642
    :goto_0
    return-object v6

    .line 2585
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 2587
    .local v2, "len":I
    if-nez v2, :cond_1

    .line 2588
    sget-object v6, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 2591
    :cond_1
    if-eqz p1, :cond_2

    const-string/jumbo v7, ""

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 2593
    :cond_2
    invoke-static {p0, v6, p2, p3}, Lorg/apache/commons/lang/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 2596
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 2598
    .local v4, "separatorLength":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 2599
    .local v5, "substrings":Ljava/util/ArrayList;
    const/4 v3, 0x0

    .line 2600
    .local v3, "numberOfSubstrings":I
    const/4 v0, 0x0

    .line 2601
    .local v0, "beg":I
    const/4 v1, 0x0

    .line 2602
    .local v1, "end":I
    :goto_1
    if-ge v1, v2, :cond_9

    .line 2603
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 2605
    const/4 v6, -0x1

    if-le v1, v6, :cond_8

    .line 2606
    if-le v1, v0, :cond_5

    .line 2607
    add-int/lit8 v3, v3, 0x1

    .line 2609
    if-ne v3, p2, :cond_4

    .line 2610
    move v1, v2

    .line 2611
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2615
    :cond_4
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2620
    add-int v0, v1, v4

    goto :goto_1

    .line 2624
    :cond_5
    if-eqz p3, :cond_6

    .line 2625
    add-int/lit8 v3, v3, 0x1

    .line 2626
    if-ne v3, p2, :cond_7

    .line 2627
    move v1, v2

    .line 2628
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2633
    :cond_6
    :goto_2
    add-int v0, v1, v4

    goto :goto_1

    .line 2630
    :cond_7
    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 2637
    :cond_8
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2638
    move v1, v2

    goto :goto_1

    .line 2642
    :cond_9
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    check-cast v6, [Ljava/lang/String;

    goto :goto_0
.end method

.method public static splitPreserveAllTokens(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 2671
    const/4 v0, 0x0

    const/4 v1, -0x1

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitPreserveAllTokens(Ljava/lang/String;C)[Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChar"    # C

    .prologue
    .line 2707
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->splitWorker(Ljava/lang/String;CZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitPreserveAllTokens(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChars"    # Ljava/lang/String;

    .prologue
    .line 2790
    const/4 v0, -0x1

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitPreserveAllTokens(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChars"    # Ljava/lang/String;
    .param p2, "max"    # I

    .prologue
    .line 2830
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static splitWorker(Ljava/lang/String;CZ)[Ljava/lang/String;
    .locals 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChar"    # C
    .param p2, "preserveAllTokens"    # Z

    .prologue
    .line 2725
    if-nez p0, :cond_0

    .line 2726
    const/4 v6, 0x0

    .line 2753
    :goto_0
    return-object v6

    .line 2728
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 2729
    .local v2, "len":I
    if-nez v2, :cond_1

    .line 2730
    sget-object v6, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 2732
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2733
    .local v3, "list":Ljava/util/List;
    const/4 v0, 0x0

    .local v0, "i":I
    const/4 v5, 0x0

    .line 2734
    .local v5, "start":I
    const/4 v4, 0x0

    .line 2735
    .local v4, "match":Z
    const/4 v1, 0x0

    .line 2736
    .local v1, "lastMatch":Z
    :goto_1
    if-ge v0, v2, :cond_5

    .line 2737
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, p1, :cond_4

    .line 2738
    if-nez v4, :cond_2

    if-eqz p2, :cond_3

    .line 2739
    :cond_2
    invoke-virtual {p0, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2740
    const/4 v4, 0x0

    .line 2741
    const/4 v1, 0x1

    .line 2743
    :cond_3
    add-int/lit8 v0, v0, 0x1

    move v5, v0

    .line 2744
    goto :goto_1

    .line 2746
    :cond_4
    const/4 v1, 0x0

    .line 2747
    const/4 v4, 0x1

    .line 2748
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2750
    :cond_5
    if-nez v4, :cond_6

    if-eqz p2, :cond_7

    if-eqz v1, :cond_7

    .line 2751
    :cond_6
    invoke-virtual {p0, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2753
    :cond_7
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/String;

    invoke-interface {v3, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    check-cast v6, [Ljava/lang/String;

    goto :goto_0
.end method

.method private static splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;
    .locals 11
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separatorChars"    # Ljava/lang/String;
    .param p2, "max"    # I
    .param p3, "preserveAllTokens"    # Z

    .prologue
    .line 2852
    if-nez p0, :cond_0

    .line 2853
    const/4 v9, 0x0

    .line 2929
    :goto_0
    return-object v9

    .line 2855
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 2856
    .local v2, "len":I
    if-nez v2, :cond_1

    .line 2857
    sget-object v9, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 2859
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2860
    .local v3, "list":Ljava/util/List;
    const/4 v6, 0x1

    .line 2861
    .local v6, "sizePlus1":I
    const/4 v0, 0x0

    .local v0, "i":I
    const/4 v8, 0x0

    .line 2862
    .local v8, "start":I
    const/4 v4, 0x0

    .line 2863
    .local v4, "match":Z
    const/4 v1, 0x0

    .line 2864
    .local v1, "lastMatch":Z
    if-nez p1, :cond_5

    move v7, v6

    .line 2866
    .end local v6    # "sizePlus1":I
    .local v7, "sizePlus1":I
    :goto_1
    if-ge v0, v2, :cond_10

    .line 2867
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 2868
    if-nez v4, :cond_2

    if-eqz p3, :cond_13

    .line 2869
    :cond_2
    const/4 v1, 0x1

    .line 2870
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    if-ne v7, p2, :cond_3

    .line 2871
    move v0, v2

    .line 2872
    const/4 v1, 0x0

    .line 2874
    :cond_3
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2875
    const/4 v4, 0x0

    .line 2877
    :goto_2
    add-int/lit8 v0, v0, 0x1

    move v8, v0

    move v7, v6

    .line 2878
    .end local v6    # "sizePlus1":I
    .restart local v7    # "sizePlus1":I
    goto :goto_1

    .line 2880
    :cond_4
    const/4 v1, 0x0

    .line 2881
    const/4 v4, 0x1

    .line 2882
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2884
    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_12

    .line 2886
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .local v5, "sep":C
    move v7, v6

    .line 2887
    .end local v6    # "sizePlus1":I
    .restart local v7    # "sizePlus1":I
    :goto_3
    if-ge v0, v2, :cond_9

    .line 2888
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v5, :cond_8

    .line 2889
    if-nez v4, :cond_6

    if-eqz p3, :cond_11

    .line 2890
    :cond_6
    const/4 v1, 0x1

    .line 2891
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    if-ne v7, p2, :cond_7

    .line 2892
    move v0, v2

    .line 2893
    const/4 v1, 0x0

    .line 2895
    :cond_7
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2896
    const/4 v4, 0x0

    .line 2898
    :goto_4
    add-int/lit8 v0, v0, 0x1

    move v8, v0

    move v7, v6

    .line 2899
    .end local v6    # "sizePlus1":I
    .restart local v7    # "sizePlus1":I
    goto :goto_3

    .line 2901
    :cond_8
    const/4 v1, 0x0

    .line 2902
    const/4 v4, 0x1

    .line 2903
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_9
    move v6, v7

    .line 2926
    .end local v5    # "sep":C
    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    :goto_5
    if-nez v4, :cond_a

    if-eqz p3, :cond_b

    if-eqz v1, :cond_b

    .line 2927
    :cond_a
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2929
    :cond_b
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v3, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    check-cast v9, [Ljava/lang/String;

    goto/16 :goto_0

    .line 2907
    .end local v6    # "sizePlus1":I
    .restart local v7    # "sizePlus1":I
    :goto_6
    if-ge v0, v2, :cond_10

    .line 2908
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {p1, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-ltz v9, :cond_e

    .line 2909
    if-nez v4, :cond_c

    if-eqz p3, :cond_f

    .line 2910
    :cond_c
    const/4 v1, 0x1

    .line 2911
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    if-ne v7, p2, :cond_d

    .line 2912
    move v0, v2

    .line 2913
    const/4 v1, 0x0

    .line 2915
    :cond_d
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2916
    const/4 v4, 0x0

    .line 2918
    :goto_7
    add-int/lit8 v0, v0, 0x1

    move v8, v0

    move v7, v6

    .line 2919
    .end local v6    # "sizePlus1":I
    .restart local v7    # "sizePlus1":I
    goto :goto_6

    .line 2921
    :cond_e
    const/4 v1, 0x0

    .line 2922
    const/4 v4, 0x1

    .line 2923
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_f
    move v6, v7

    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    goto :goto_7

    .end local v6    # "sizePlus1":I
    .restart local v7    # "sizePlus1":I
    :cond_10
    move v6, v7

    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    goto :goto_5

    .end local v6    # "sizePlus1":I
    .restart local v5    # "sep":C
    .restart local v7    # "sizePlus1":I
    :cond_11
    move v6, v7

    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    goto :goto_4

    .end local v5    # "sep":C
    :cond_12
    move v7, v6

    .end local v6    # "sizePlus1":I
    .restart local v7    # "sizePlus1":I
    goto :goto_6

    :cond_13
    move v6, v7

    .end local v7    # "sizePlus1":I
    .restart local v6    # "sizePlus1":I
    goto/16 :goto_2
.end method

.method public static startsWith(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 6285
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 6
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "ignoreCase"    # Z

    .prologue
    const/4 v2, 0x0

    .line 6325
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    .line 6326
    :cond_0
    if-nez p0, :cond_1

    if-nez p1, :cond_1

    const/4 v2, 0x1

    .line 6331
    :cond_1
    :goto_0
    return v2

    .line 6328
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 6331
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    move v1, p2

    move-object v3, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v2

    goto :goto_0
.end method

.method public static startsWithAny(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 4
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "searchStrings"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 6354
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 6363
    :cond_0
    :goto_0
    return v2

    .line 6357
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, p1

    if-ge v0, v3, :cond_0

    .line 6358
    aget-object v1, p1, v0

    .line 6359
    .local v1, "searchString":Ljava/lang/String;
    invoke-static {p0, v1}, Lorg/apache/commons/lang/StringUtils;->startsWith(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 6360
    const/4 v2, 0x1

    goto :goto_0

    .line 6357
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 6310
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/StringUtils;->startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static strip(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 389
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "stripChars"    # Ljava/lang/String;

    .prologue
    .line 476
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 480
    .end local p0    # "str":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 479
    .restart local p0    # "str":Ljava/lang/String;
    :cond_0
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringUtils;->stripStart(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 480
    invoke-static {p0, p1}, Lorg/apache/commons/lang/StringUtils;->stripEnd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static stripAll([Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p0, "strs"    # [Ljava/lang/String;

    .prologue
    .line 593
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->stripAll([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static stripAll([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .param p0, "strs"    # [Ljava/lang/String;
    .param p1, "stripChars"    # Ljava/lang/String;

    .prologue
    .line 623
    if-eqz p0, :cond_0

    array-length v2, p0

    .local v2, "strsLen":I
    if-nez v2, :cond_2

    .end local v2    # "strsLen":I
    :cond_0
    move-object v1, p0

    .line 630
    :cond_1
    return-object v1

    .line 626
    .restart local v2    # "strsLen":I
    :cond_2
    new-array v1, v2, [Ljava/lang/String;

    .line 627
    .local v1, "newArr":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 628
    aget-object v3, p0, v0

    invoke-static {v3, p1}, Lorg/apache/commons/lang/StringUtils;->strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 627
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static stripEnd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "stripChars"    # Ljava/lang/String;

    .prologue
    .line 553
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "end":I
    if-nez v0, :cond_1

    .line 568
    .end local v0    # "end":I
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 557
    .restart local v0    # "end":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    if-nez p1, :cond_2

    .line 558
    :goto_1
    if-eqz v0, :cond_3

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 559
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 561
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 564
    :goto_2
    if-eqz v0, :cond_3

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 565
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    .line 568
    :cond_3
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static stripStart(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "stripChars"    # Ljava/lang/String;

    .prologue
    .line 509
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .local v1, "strLen":I
    if-nez v1, :cond_1

    .line 524
    .end local v1    # "strLen":I
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 512
    .restart local v1    # "strLen":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    const/4 v0, 0x0

    .line 513
    .local v0, "start":I
    if-nez p1, :cond_2

    .line 514
    :goto_1
    if-eq v0, v1, :cond_3

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 515
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 517
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 520
    :goto_2
    if-eq v0, v1, :cond_3

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 521
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 524
    :cond_3
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static stripToEmpty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 446
    if-nez p0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static stripToNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 416
    if-nez p0, :cond_0

    .line 420
    .end local p0    # "str":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 419
    .restart local p0    # "str":Ljava/lang/String;
    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang/StringUtils;->strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 420
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    move-object p0, v0

    .end local p0    # "str":Ljava/lang/String;
    :cond_1
    move-object v0, p0

    goto :goto_0
.end method

.method public static substring(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "start"    # I

    .prologue
    .line 1785
    if-nez p0, :cond_0

    .line 1786
    const/4 v0, 0x0

    .line 1801
    :goto_0
    return-object v0

    .line 1790
    :cond_0
    if-gez p1, :cond_1

    .line 1791
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p1, v0

    .line 1794
    :cond_1
    if-gez p1, :cond_2

    .line 1795
    const/4 p1, 0x0

    .line 1797
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le p1, v0, :cond_3

    .line 1798
    const-string/jumbo v0, ""

    goto :goto_0

    .line 1801
    :cond_3
    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static substring(Ljava/lang/String;II)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 1840
    if-nez p0, :cond_0

    .line 1841
    const/4 v0, 0x0

    .line 1869
    :goto_0
    return-object v0

    .line 1845
    :cond_0
    if-gez p2, :cond_1

    .line 1846
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p2, v0

    .line 1848
    :cond_1
    if-gez p1, :cond_2

    .line 1849
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p1, v0

    .line 1853
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le p2, v0, :cond_3

    .line 1854
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    .line 1858
    :cond_3
    if-le p1, p2, :cond_4

    .line 1859
    const-string/jumbo v0, ""

    goto :goto_0

    .line 1862
    :cond_4
    if-gez p1, :cond_5

    .line 1863
    const/4 p1, 0x0

    .line 1865
    :cond_5
    if-gez p2, :cond_6

    .line 1866
    const/4 p2, 0x0

    .line 1869
    :cond_6
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static substringAfter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 2052
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2062
    .end local p0    # "str":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 2055
    .restart local p0    # "str":Ljava/lang/String;
    :cond_0
    if-nez p1, :cond_1

    .line 2056
    const-string/jumbo p0, ""

    goto :goto_0

    .line 2058
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 2059
    .local v0, "pos":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 2060
    const-string/jumbo p0, ""

    goto :goto_0

    .line 2062
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringAfterLast(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 2133
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2143
    .end local p0    # "str":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 2136
    .restart local p0    # "str":Ljava/lang/String;
    :cond_0
    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2137
    const-string/jumbo p0, ""

    goto :goto_0

    .line 2139
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 2140
    .local v0, "pos":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    if-ne v0, v1, :cond_3

    .line 2141
    :cond_2
    const-string/jumbo p0, ""

    goto :goto_0

    .line 2143
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringBefore(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 2010
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez p1, :cond_1

    .line 2020
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 2013
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 2014
    const-string/jumbo p0, ""

    goto :goto_0

    .line 2016
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 2017
    .local v0, "pos":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 2020
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringBeforeLast(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 2093
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2100
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 2096
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 2097
    .local v0, "pos":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 2100
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringBetween(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 2170
    invoke-static {p0, p1, p1}, Lorg/apache/commons/lang/StringUtils;->substringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static substringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "open"    # Ljava/lang/String;
    .param p2, "close"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 2201
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 2211
    :cond_0
    :goto_0
    return-object v2

    .line 2204
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 2205
    .local v1, "start":I
    if-eq v1, v4, :cond_0

    .line 2206
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {p0, p2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 2207
    .local v0, "end":I
    if-eq v0, v4, :cond_0

    .line 2208
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static substringsBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "open"    # Ljava/lang/String;
    .param p2, "close"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 2237
    if-eqz p0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-static {p2}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2264
    :cond_0
    :goto_0
    return-object v7

    .line 2240
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 2241
    .local v6, "strLen":I
    if-nez v6, :cond_2

    .line 2242
    sget-object v7, Lorg/apache/commons/lang/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 2244
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    .line 2245
    .local v0, "closeLen":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 2246
    .local v3, "openLen":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2247
    .local v2, "list":Ljava/util/List;
    const/4 v4, 0x0

    .line 2248
    .local v4, "pos":I
    :goto_1
    sub-int v8, v6, v0

    if-ge v4, v8, :cond_3

    .line 2249
    invoke-virtual {p0, p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 2250
    .local v5, "start":I
    if-gez v5, :cond_4

    .line 2261
    .end local v5    # "start":I
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 2264
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v2, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    check-cast v7, [Ljava/lang/String;

    goto :goto_0

    .line 2253
    .restart local v5    # "start":I
    :cond_4
    add-int/2addr v5, v3

    .line 2254
    invoke-virtual {p0, p2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 2255
    .local v1, "end":I
    if-ltz v1, :cond_3

    .line 2258
    invoke-virtual {p0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2259
    add-int v4, v1, v0

    .line 2260
    goto :goto_1
.end method

.method public static swapCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5191
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .local v3, "strLen":I
    if-nez v3, :cond_1

    .line 5208
    .end local v3    # "strLen":I
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 5194
    .restart local v3    # "strLen":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 5196
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 5197
    .local v1, "ch":C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_5

    .line 5198
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 5199
    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 5200
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    .line 5206
    :cond_2
    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 5197
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 5201
    :cond_3
    invoke-static {v1}, Ljava/lang/Character;->isTitleCase(C)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 5202
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    goto :goto_2

    .line 5203
    :cond_4
    invoke-static {v1}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 5204
    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    goto :goto_2

    .line 5208
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static trim(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 309
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static trimToEmpty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 361
    if-nez p0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static trimToNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 335
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "ts":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    .end local v0    # "ts":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static uncapitalise(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5159
    invoke-static {p0}, Lorg/apache/commons/lang/StringUtils;->uncapitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static uncapitalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 5140
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "strLen":I
    if-nez v0, :cond_1

    .line 5143
    .end local v0    # "strLen":I
    .end local p0    # "str":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .restart local v0    # "strLen":I
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, v0}, Ljava/lang/StringBuffer;-><init>(I)V

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static upperCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 4996
    if-nez p0, :cond_0

    .line 4997
    const/4 v0, 0x0

    .line 4999
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static upperCase(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 5019
    if-nez p0, :cond_0

    .line 5020
    const/4 v0, 0x0

    .line 5022
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
