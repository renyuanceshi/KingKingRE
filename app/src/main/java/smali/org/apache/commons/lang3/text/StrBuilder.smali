.class public Lorg/apache/commons/lang3/text/StrBuilder;
.super Ljava/lang/Object;
.source "StrBuilder.java"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Ljava/lang/Appendable;
.implements Ljava/io/Serializable;
.implements Lorg/apache/commons/lang3/builder/Builder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderWriter;,
        Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderReader;,
        Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderTokenizer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/CharSequence;",
        "Ljava/lang/Appendable;",
        "Ljava/io/Serializable;",
        "Lorg/apache/commons/lang3/builder/Builder",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field static final CAPACITY:I = 0x20

.field private static final serialVersionUID:J = 0x69dea51fe8fc7e4bL


# instance fields
.field protected buffer:[C

.field private newLine:Ljava/lang/String;

.field private nullText:Ljava/lang/String;

.field protected size:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 103
    const/16 v0, 0x20

    invoke-direct {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;-><init>(I)V

    .line 104
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "initialCapacity"    # I

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    if-gtz p1, :cond_0

    .line 114
    const/16 p1, 0x20

    .line 116
    :cond_0
    new-array v0, p1, [C

    iput-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 117
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    if-nez p1, :cond_0

    .line 128
    const/16 v0, 0x20

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 133
    :goto_0
    return-void

    .line 130
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x20

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 131
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method private deleteImpl(III)V
    .locals 3
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "len"    # I

    .prologue
    .line 1668
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v2, p2

    invoke-static {v0, p2, v1, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1669
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v0, p3

    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1670
    return-void
.end method

.method private replaceImpl(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 7
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;
    .param p2, "replaceStr"    # Ljava/lang/String;
    .param p3, "from"    # I
    .param p4, "to"    # I
    .param p5, "replaceCount"    # I

    .prologue
    .line 1989
    if-eqz p1, :cond_0

    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v0, :cond_1

    .line 2005
    :cond_0
    return-object p0

    .line 1992
    :cond_1
    if-nez p2, :cond_3

    const/4 v5, 0x0

    .line 1993
    .local v5, "replaceLen":I
    :goto_0
    iget-object v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 1994
    .local v6, "buf":[C
    move v1, p3

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_0

    if-eqz p5, :cond_0

    .line 1995
    invoke-virtual {p1, v6, v1, p3, p4}, Lorg/apache/commons/lang3/text/StrMatcher;->isMatch([CIII)I

    move-result v3

    .line 1996
    .local v3, "removeLen":I
    if-lez v3, :cond_2

    .line 1997
    add-int v2, v1, v3

    move-object v0, p0

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1998
    sub-int v0, p4, v3

    add-int p4, v0, v5

    .line 1999
    add-int v0, v1, v5

    add-int/lit8 v1, v0, -0x1

    .line 2000
    if-lez p5, :cond_2

    .line 2001
    add-int/lit8 p5, p5, -0x1

    .line 1994
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1992
    .end local v1    # "i":I
    .end local v3    # "removeLen":I
    .end local v5    # "replaceLen":I
    .end local v6    # "buf":[C
    :cond_3
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_0
.end method

.method private replaceImpl(IIILjava/lang/String;I)V
    .locals 5
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "removeLen"    # I
    .param p4, "insertStr"    # Ljava/lang/String;
    .param p5, "insertLen"    # I

    .prologue
    .line 1807
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v1, p3

    add-int v0, v1, p5

    .line 1808
    .local v0, "newSize":I
    if-eq p5, p3, :cond_0

    .line 1809
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1810
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v3, p1, p5

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v4, p2

    invoke-static {v1, p2, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1811
    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1813
    :cond_0
    if-lez p5, :cond_1

    .line 1814
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p4, v1, p5, v2, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 1816
    :cond_1
    return-void
.end method


# virtual methods
.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/CharSequence;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 1
    .param p1, "x0"    # Ljava/lang/CharSequence;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/CharSequence;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "ch"    # C

    .prologue
    .line 796
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 797
    .local v0, "len":I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 798
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    aput-char p1, v1, v2

    .line 799
    return-object p0
.end method

.method public append(D)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 839
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(F)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # F

    .prologue
    .line 829
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 809
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(J)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 819
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/CharSequence;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "seq"    # Ljava/lang/CharSequence;

    .prologue
    .line 478
    if-nez p1, :cond_0

    .line 479
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    .line 481
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    goto :goto_0
.end method

.method public append(Ljava/lang/CharSequence;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "seq"    # Ljava/lang/CharSequence;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 496
    if-nez p1, :cond_0

    .line 497
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    .line 499
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    goto :goto_0
.end method

.method public append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 462
    if-nez p1, :cond_0

    .line 463
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    .line 465
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    goto :goto_0
.end method

.method public append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 510
    if-nez p1, :cond_1

    .line 511
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 520
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 513
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 514
    .local v1, "strLen":I
    if-lez v1, :cond_0

    .line 515
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 516
    .local v0, "len":I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 517
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, v2, v1, v3, v0}, Ljava/lang/String;->getChars(II[CI)V

    .line 518
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Ljava/lang/String;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 534
    if-nez p1, :cond_1

    .line 535
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 549
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 537
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    if-ltz p2, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le p2, v1, :cond_3

    .line 538
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v2, "startIndex must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 540
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v1, v2, :cond_5

    .line 541
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v2, "length must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 543
    :cond_5
    if-lez p3, :cond_0

    .line 544
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 545
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 546
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Ljava/lang/String;->getChars(II[CI)V

    .line 547
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public varargs append(Ljava/lang/String;[Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "objs"    # [Ljava/lang/Object;

    .prologue
    .line 562
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "str"    # Ljava/lang/StringBuffer;

    .prologue
    .line 573
    if-nez p1, :cond_1

    .line 574
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 583
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 576
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    .line 577
    .local v1, "strLen":I
    if-lez v1, :cond_0

    .line 578
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 579
    .local v0, "len":I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 580
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, v2, v1, v3, v0}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 581
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/StringBuffer;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 596
    if-nez p1, :cond_1

    .line 597
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 611
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 599
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    if-ltz p2, :cond_2

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-le p2, v1, :cond_3

    .line 600
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v2, "startIndex must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 602
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-le v1, v2, :cond_5

    .line 603
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v2, "length must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 605
    :cond_5
    if-lez p3, :cond_0

    .line 606
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 607
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 608
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 609
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Ljava/lang/StringBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "str"    # Ljava/lang/StringBuilder;

    .prologue
    .line 623
    if-nez p1, :cond_1

    .line 624
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 633
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 626
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    .line 627
    .local v1, "strLen":I
    if-lez v1, :cond_0

    .line 628
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 629
    .local v0, "len":I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 630
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, v2, v1, v3, v0}, Ljava/lang/StringBuilder;->getChars(II[CI)V

    .line 631
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Ljava/lang/StringBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/StringBuilder;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 647
    if-nez p1, :cond_1

    .line 648
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 662
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 650
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    if-ltz p2, :cond_2

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-le p2, v1, :cond_3

    .line 651
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v2, "startIndex must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 653
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-le v1, v2, :cond_5

    .line 654
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v2, "length must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 656
    :cond_5
    if-lez p3, :cond_0

    .line 657
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 658
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 659
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Ljava/lang/StringBuilder;->getChars(II[CI)V

    .line 660
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Lorg/apache/commons/lang3/text/StrBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5
    .param p1, "str"    # Lorg/apache/commons/lang3/text/StrBuilder;

    .prologue
    .line 673
    if-nez p1, :cond_1

    .line 674
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 683
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 676
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v1

    .line 677
    .local v1, "strLen":I
    if-lez v1, :cond_0

    .line 678
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 679
    .local v0, "len":I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 680
    iget-object v2, p1, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {v2, v3, v4, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 681
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Lorg/apache/commons/lang3/text/StrBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Lorg/apache/commons/lang3/text/StrBuilder;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 696
    if-nez p1, :cond_1

    .line 697
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 711
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 699
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    if-ltz p2, :cond_2

    invoke-virtual {p1}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v1

    if-le p2, v1, :cond_3

    .line 700
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v2, "startIndex must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 702
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    invoke-virtual {p1}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v2

    if-le v1, v2, :cond_5

    .line 703
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v2, "length must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 705
    :cond_5
    if-lez p3, :cond_0

    .line 706
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 707
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 708
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->getChars(II[CI)V

    .line 709
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Z)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "value"    # Z

    .prologue
    const/16 v3, 0x65

    .line 770
    if-eqz p1, :cond_0

    .line 771
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 772
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x74

    aput-char v2, v0, v1

    .line 773
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x72

    aput-char v2, v0, v1

    .line 774
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x75

    aput-char v2, v0, v1

    .line 775
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    aput-char v3, v0, v1

    .line 784
    :goto_0
    return-object p0

    .line 777
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x5

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 778
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x66

    aput-char v2, v0, v1

    .line 779
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x61

    aput-char v2, v0, v1

    .line 780
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x6c

    aput-char v2, v0, v1

    .line 781
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x73

    aput-char v2, v0, v1

    .line 782
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    aput-char v3, v0, v1

    goto :goto_0
.end method

.method public append([C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "chars"    # [C

    .prologue
    .line 722
    if-nez p1, :cond_1

    .line 723
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 732
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 725
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    array-length v1, p1

    .line 726
    .local v1, "strLen":I
    if-lez v1, :cond_0

    .line 727
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 728
    .local v0, "len":I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 729
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {p1, v2, v3, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 730
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append([CII)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "chars"    # [C
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 745
    if-nez p1, :cond_1

    .line 746
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 760
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 748
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    if-ltz p2, :cond_2

    array-length v1, p1

    if-le p2, v1, :cond_3

    .line 749
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Invalid startIndex: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 751
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_5

    .line 752
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Invalid length: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 754
    :cond_5
    if-lez p3, :cond_0

    .line 755
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 756
    .local v0, "len":I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 757
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {p1, p2, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 758
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public appendAll(Ljava/lang/Iterable;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 1094
    .local p1, "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    if-eqz p1, :cond_0

    .line 1095
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 1096
    .local v1, "o":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0

    .line 1099
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "o":Ljava/lang/Object;
    :cond_0
    return-object p0
.end method

.method public appendAll(Ljava/util/Iterator;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<*>;)",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 1112
    .local p1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    if-eqz p1, :cond_0

    .line 1113
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1114
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0

    .line 1117
    :cond_0
    return-object p0
.end method

.method public varargs appendAll([Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 1076
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    if-eqz p1, :cond_0

    array-length v4, p1

    if-lez v4, :cond_0

    .line 1077
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 1078
    .local v1, "element":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1077
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1081
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v1    # "element":Ljava/lang/Object;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_0
    return-object p0
.end method

.method public appendFixedWidthPadLeft(IIC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # I
    .param p2, "width"    # I
    .param p3, "padChar"    # C

    .prologue
    .line 1413
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->appendFixedWidthPadLeft(Ljava/lang/Object;IC)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFixedWidthPadLeft(Ljava/lang/Object;IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "width"    # I
    .param p3, "padChar"    # C

    .prologue
    .line 1381
    if-lez p2, :cond_1

    .line 1382
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v4, p2

    invoke-virtual {p0, v4}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1383
    if-nez p1, :cond_2

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->getNullText()Ljava/lang/String;

    move-result-object v2

    .line 1384
    .local v2, "str":Ljava/lang/String;
    :goto_0
    if-nez v2, :cond_0

    .line 1385
    const-string/jumbo v2, ""

    .line 1387
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    .line 1388
    .local v3, "strLen":I
    if-lt v3, p2, :cond_3

    .line 1389
    sub-int v4, v3, p2

    iget-object v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v2, v4, v3, v5, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 1397
    :goto_1
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v4, p2

    iput v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1399
    .end local v2    # "str":Ljava/lang/String;
    .end local v3    # "strLen":I
    :cond_1
    return-object p0

    .line 1383
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1391
    .restart local v2    # "str":Ljava/lang/String;
    .restart local v3    # "strLen":I
    :cond_3
    sub-int v1, p2, v3

    .line 1392
    .local v1, "padLen":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    if-ge v0, v1, :cond_4

    .line 1393
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v5, v0

    aput-char p3, v4, v5

    .line 1392
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1395
    :cond_4
    const/4 v4, 0x0

    iget-object v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v6, v1

    invoke-virtual {v2, v4, v3, v5, v6}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_1
.end method

.method public appendFixedWidthPadRight(IIC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # I
    .param p2, "width"    # I
    .param p3, "padChar"    # C

    .prologue
    .line 1460
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->appendFixedWidthPadRight(Ljava/lang/Object;IC)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFixedWidthPadRight(Ljava/lang/Object;IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "width"    # I
    .param p3, "padChar"    # C

    .prologue
    const/4 v6, 0x0

    .line 1428
    if-lez p2, :cond_2

    .line 1429
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v4, p2

    invoke-virtual {p0, v4}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1430
    if-nez p1, :cond_3

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->getNullText()Ljava/lang/String;

    move-result-object v2

    .line 1431
    .local v2, "str":Ljava/lang/String;
    :goto_0
    if-nez v2, :cond_0

    .line 1432
    const-string/jumbo v2, ""

    .line 1434
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    .line 1435
    .local v3, "strLen":I
    if-lt v3, p2, :cond_4

    .line 1436
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v2, v6, p2, v4, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 1444
    :cond_1
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v4, p2

    iput v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1446
    .end local v2    # "str":Ljava/lang/String;
    .end local v3    # "strLen":I
    :cond_2
    return-object p0

    .line 1430
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1438
    .restart local v2    # "str":Ljava/lang/String;
    .restart local v3    # "strLen":I
    :cond_4
    sub-int v1, p2, v3

    .line 1439
    .local v1, "padLen":I
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v2, v6, v3, v4, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 1440
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_1

    .line 1441
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v5, v3

    add-int/2addr v5, v0

    aput-char p3, v4, v5

    .line 1440
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1

    .prologue
    .line 435
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->newLine:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 436
    sget-object v0, Lorg/apache/commons/lang3/SystemUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 439
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->newLine:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    goto :goto_0
.end method

.method public appendNull()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 451
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    goto :goto_0
.end method

.method public appendPadding(IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "length"    # I
    .param p2, "padChar"    # C

    .prologue
    .line 1359
    if-ltz p1, :cond_0

    .line 1360
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1361
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 1362
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    aput-char p2, v1, v2

    .line 1361
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1365
    .end local v0    # "i":I
    :cond_0
    return-object p0
.end method

.method public appendSeparator(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "separator"    # C

    .prologue
    .line 1270
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1271
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1273
    :cond_0
    return-object p0
.end method

.method public appendSeparator(CC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "standard"    # C
    .param p2, "defaultIfEmpty"    # C

    .prologue
    .line 1288
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1289
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1293
    :goto_0
    return-object p0

    .line 1291
    :cond_0
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method public appendSeparator(CI)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 0
    .param p1, "separator"    # C
    .param p2, "loopIndex"    # I

    .prologue
    .line 1344
    if-lez p2, :cond_0

    .line 1345
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1347
    :cond_0
    return-object p0
.end method

.method public appendSeparator(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 1212
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendSeparator(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendSeparator(Ljava/lang/String;I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 0
    .param p1, "separator"    # Ljava/lang/String;
    .param p2, "loopIndex"    # I

    .prologue
    .line 1317
    if-eqz p1, :cond_0

    if-lez p2, :cond_0

    .line 1318
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1320
    :cond_0
    return-object p0
.end method

.method public appendSeparator(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .param p1, "standard"    # Ljava/lang/String;
    .param p2, "defaultIfEmpty"    # Ljava/lang/String;

    .prologue
    .line 1243
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p2

    .line 1244
    .local v0, "str":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_0

    .line 1245
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1247
    :cond_0
    return-object p0

    .end local v0    # "str":Ljava/lang/String;
    :cond_1
    move-object v0, p1

    .line 1243
    goto :goto_0
.end method

.method public appendWithSeparators(Ljava/lang/Iterable;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .param p2, "separator"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 1154
    .local p1, "iterable":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    if-eqz p1, :cond_1

    .line 1155
    invoke-static {p2}, Lorg/apache/commons/lang3/ObjectUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 1156
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1157
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1158
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1159
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1160
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0

    .line 1164
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_1
    return-object p0
.end method

.method public appendWithSeparators(Ljava/util/Iterator;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p2, "separator"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 1178
    .local p1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    if-eqz p1, :cond_1

    .line 1179
    invoke-static {p2}, Lorg/apache/commons/lang3/ObjectUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 1180
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1181
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1182
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1183
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0

    .line 1187
    :cond_1
    return-object p0
.end method

.method public appendWithSeparators([Ljava/lang/Object;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .param p1, "array"    # [Ljava/lang/Object;
    .param p2, "separator"    # Ljava/lang/String;

    .prologue
    .line 1132
    if-eqz p1, :cond_0

    array-length v1, p1

    if-lez v1, :cond_0

    .line 1133
    invoke-static {p2}, Lorg/apache/commons/lang3/ObjectUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 1134
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1135
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 1136
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1137
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1135
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1140
    .end local v0    # "i":I
    :cond_0
    return-object p0
.end method

.method public appendln(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "ch"    # C

    .prologue
    .line 1017
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(D)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # D

    .prologue
    .line 1061
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(D)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(F)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # F

    .prologue
    .line 1050
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(F)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 1028
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(I)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(J)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 1039
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(J)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 852
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 864
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/String;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 878
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public varargs appendln(Ljava/lang/String;[Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "objs"    # [Ljava/lang/Object;

    .prologue
    .line 891
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;[Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/StringBuffer;

    .prologue
    .line 903
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/StringBuffer;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 943
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/StringBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/StringBuilder;

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/StringBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/StringBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Ljava/lang/StringBuilder;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 929
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/StringBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Lorg/apache/commons/lang3/text/StrBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Lorg/apache/commons/lang3/text/StrBuilder;

    .prologue
    .line 955
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Lorg/apache/commons/lang3/text/StrBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Lorg/apache/commons/lang3/text/StrBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "str"    # Lorg/apache/commons/lang3/text/StrBuilder;
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 969
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Lorg/apache/commons/lang3/text/StrBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Z)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 1006
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Z)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln([C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "chars"    # [C

    .prologue
    .line 981
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append([C)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln([CII)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "chars"    # [C
    .param p2, "startIndex"    # I
    .param p3, "length"    # I

    .prologue
    .line 995
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append([CII)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public asReader()Ljava/io/Reader;
    .locals 1

    .prologue
    .line 2580
    new-instance v0, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderReader;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderReader;-><init>(Lorg/apache/commons/lang3/text/StrBuilder;)V

    return-object v0
.end method

.method public asTokenizer()Lorg/apache/commons/lang3/text/StrTokenizer;
    .locals 1

    .prologue
    .line 2556
    new-instance v0, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderTokenizer;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderTokenizer;-><init>(Lorg/apache/commons/lang3/text/StrBuilder;)V

    return-object v0
.end method

.method public asWriter()Ljava/io/Writer;
    .locals 1

    .prologue
    .line 2605
    new-instance v0, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderWriter;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderWriter;-><init>(Lorg/apache/commons/lang3/text/StrBuilder;)V

    return-object v0
.end method

.method public bridge synthetic build()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->build()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public build()Ljava/lang/String;
    .locals 1

    .prologue
    .line 2763
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public capacity()I
    .locals 1

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    array-length v0, v0

    return v0
.end method

.method public charAt(I)C
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 309
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 310
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 312
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v0, v0, p1

    return v0
.end method

.method public clear()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1

    .prologue
    .line 293
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 294
    return-object p0
.end method

.method public contains(C)Z
    .locals 3
    .param p1, "ch"    # C

    .prologue
    .line 2243
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2244
    .local v1, "thisBuf":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v0, v2, :cond_1

    .line 2245
    aget-char v2, v1, v0

    if-ne v2, p1, :cond_0

    .line 2246
    const/4 v2, 0x1

    .line 2249
    :goto_1
    return v2

    .line 2244
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2249
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 2259
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public contains(Lorg/apache/commons/lang3/text/StrMatcher;)Z
    .locals 2
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;

    .prologue
    const/4 v0, 0x0

    .line 2274
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public delete(II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 1682
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 1683
    sub-int v0, p2, p1

    .line 1684
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 1685
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1687
    :cond_0
    return-object p0
.end method

.method public deleteAll(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "ch"    # C

    .prologue
    .line 1698
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v0, v3, :cond_3

    .line 1699
    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v3, v3, v0

    if-ne v3, p1, :cond_2

    .line 1700
    move v2, v0

    .line 1701
    .local v2, "start":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v0, v3, :cond_1

    .line 1702
    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v3, v3, v0

    if-eq v3, p1, :cond_0

    .line 1706
    :cond_1
    sub-int v1, v0, v2

    .line 1707
    .local v1, "len":I
    invoke-direct {p0, v2, v0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1708
    sub-int/2addr v0, v1

    .line 1698
    .end local v1    # "len":I
    .end local v2    # "start":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1711
    :cond_3
    return-object p0
.end method

.method public deleteAll(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 1738
    if-nez p1, :cond_0

    move v1, v2

    .line 1739
    .local v1, "len":I
    :goto_0
    if-lez v1, :cond_1

    .line 1740
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 1741
    .local v0, "index":I
    :goto_1
    if-ltz v0, :cond_1

    .line 1742
    add-int v2, v0, v1

    invoke-direct {p0, v0, v2, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1743
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1

    .line 1738
    .end local v0    # "index":I
    .end local v1    # "len":I
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_0

    .line 1746
    .restart local v1    # "len":I
    :cond_1
    return-object p0
.end method

.method public deleteAll(Lorg/apache/commons/lang3/text/StrMatcher;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;

    .prologue
    .line 1778
    const/4 v2, 0x0

    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public deleteCharAt(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 343
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_1

    .line 344
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 346
    :cond_1
    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 347
    return-object p0
.end method

.method public deleteFirst(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .param p1, "ch"    # C

    .prologue
    .line 1721
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v0, v1, :cond_0

    .line 1722
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_1

    .line 1723
    add-int/lit8 v1, v0, 0x1

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1727
    :cond_0
    return-object p0

    .line 1721
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public deleteFirst(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 1756
    if-nez p1, :cond_1

    move v1, v2

    .line 1757
    .local v1, "len":I
    :goto_0
    if-lez v1, :cond_0

    .line 1758
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 1759
    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 1760
    add-int v2, v0, v1

    invoke-direct {p0, v0, v2, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1763
    .end local v0    # "index":I
    :cond_0
    return-object p0

    .line 1756
    .end local v1    # "len":I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_0
.end method

.method public deleteFirst(Lorg/apache/commons/lang3/text/StrMatcher;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;

    .prologue
    .line 1792
    const/4 v2, 0x0

    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public endsWith(Ljava/lang/String;)Z
    .locals 7
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2095
    if-nez p1, :cond_1

    .line 2111
    :cond_0
    :goto_0
    return v3

    .line 2098
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2099
    .local v1, "len":I
    if-nez v1, :cond_2

    move v3, v4

    .line 2100
    goto :goto_0

    .line 2102
    :cond_2
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-gt v1, v5, :cond_0

    .line 2105
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int v2, v5, v1

    .line 2106
    .local v2, "pos":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 2107
    iget-object v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v5, v5, v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v5, v6, :cond_0

    .line 2106
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    move v3, v4

    .line 2111
    goto :goto_0
.end method

.method public ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "capacity"    # I

    .prologue
    const/4 v3, 0x0

    .line 234
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    array-length v1, v1

    if-le p1, v1, :cond_0

    .line 235
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 236
    .local v0, "old":[C
    mul-int/lit8 v1, p1, 0x2

    new-array v1, v1, [C

    iput-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 237
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 239
    .end local v0    # "old":[C
    :cond_0
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 2698
    instance-of v0, p1, Lorg/apache/commons/lang3/text/StrBuilder;

    if-eqz v0, :cond_0

    .line 2699
    check-cast p1, Lorg/apache/commons/lang3/text/StrBuilder;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->equals(Lorg/apache/commons/lang3/text/StrBuilder;)Z

    move-result v0

    .line 2701
    :goto_0
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Lorg/apache/commons/lang3/text/StrBuilder;)Z
    .locals 7
    .param p1, "other"    # Lorg/apache/commons/lang3/text/StrBuilder;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 2673
    if-ne p0, p1, :cond_1

    .line 2686
    :cond_0
    :goto_0
    return v3

    .line 2676
    :cond_1
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    iget v6, p1, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-eq v5, v6, :cond_2

    move v3, v4

    .line 2677
    goto :goto_0

    .line 2679
    :cond_2
    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2680
    .local v2, "thisBuf":[C
    iget-object v1, p1, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2681
    .local v1, "otherBuf":[C
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v5, -0x1

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_0

    .line 2682
    aget-char v5, v2, v0

    aget-char v6, v1, v0

    if-eq v5, v6, :cond_3

    move v3, v4

    .line 2683
    goto :goto_0

    .line 2681
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public equalsIgnoreCase(Lorg/apache/commons/lang3/text/StrBuilder;)Z
    .locals 9
    .param p1, "other"    # Lorg/apache/commons/lang3/text/StrBuilder;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 2647
    if-ne p0, p1, :cond_1

    .line 2662
    :cond_0
    :goto_0
    return v5

    .line 2650
    :cond_1
    iget v7, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    iget v8, p1, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-eq v7, v8, :cond_2

    move v5, v6

    .line 2651
    goto :goto_0

    .line 2653
    :cond_2
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2654
    .local v4, "thisBuf":[C
    iget-object v3, p1, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2655
    .local v3, "otherBuf":[C
    iget v7, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v7, -0x1

    .local v2, "i":I
    :goto_1
    if-ltz v2, :cond_0

    .line 2656
    aget-char v0, v4, v2

    .line 2657
    .local v0, "c1":C
    aget-char v1, v3, v2

    .line 2658
    .local v1, "c2":C
    if-eq v0, v1, :cond_3

    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v7

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v8

    if-eq v7, v8, :cond_3

    move v5, v6

    .line 2659
    goto :goto_0

    .line 2655
    :cond_3
    add-int/lit8 v2, v2, -0x1

    goto :goto_1
.end method

.method public getChars(II[CI)V
    .locals 2
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "destination"    # [C
    .param p4, "destinationIndex"    # I

    .prologue
    .line 412
    if-gez p1, :cond_0

    .line 413
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 415
    :cond_0
    if-ltz p2, :cond_1

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    if-le p2, v0, :cond_2

    .line 416
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 418
    :cond_2
    if-le p1, p2, :cond_3

    .line 419
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v1, "end < start"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 421
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    sub-int v1, p2, p1

    invoke-static {v0, p1, p3, p4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 422
    return-void
.end method

.method public getChars([C)[C
    .locals 3
    .param p1, "destination"    # [C

    .prologue
    const/4 v2, 0x0

    .line 393
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 394
    .local v0, "len":I
    if-eqz p1, :cond_0

    array-length v1, p1

    if-ge v1, v0, :cond_1

    .line 395
    :cond_0
    new-array p1, v0, [C

    .line 397
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {v1, v2, p1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 398
    return-object p1
.end method

.method public getNewLineText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->newLine:Ljava/lang/String;

    return-object v0
.end method

.method public getNullText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    .line 2711
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2712
    .local v0, "buf":[C
    const/4 v1, 0x0

    .line 2713
    .local v1, "hash":I
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v3, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_0

    .line 2714
    mul-int/lit8 v3, v1, 0x1f

    aget-char v4, v0, v2

    add-int v1, v3, v4

    .line 2713
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 2716
    :cond_0
    return v1
.end method

.method public indexOf(C)I
    .locals 1
    .param p1, "ch"    # C

    .prologue
    .line 2285
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(CI)I

    move-result v0

    return v0
.end method

.method public indexOf(CI)I
    .locals 4
    .param p1, "ch"    # C
    .param p2, "startIndex"    # I

    .prologue
    const/4 v2, -0x1

    .line 2296
    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 2297
    :cond_0
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v3, :cond_2

    move v0, v2

    .line 2306
    :cond_1
    :goto_0
    return v0

    .line 2300
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2301
    .local v1, "thisBuf":[C
    move v0, p2

    .local v0, "i":I
    :goto_1
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v0, v3, :cond_3

    .line 2302
    aget-char v3, v1, v0

    if-eq v3, p1, :cond_1

    .line 2301
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v0, v2

    .line 2306
    goto :goto_0
.end method

.method public indexOf(Ljava/lang/String;)I
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 2318
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/String;I)I
    .locals 8
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "startIndex"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 2332
    if-gez p2, :cond_0

    move p2, v6

    .line 2333
    :cond_0
    if-eqz p1, :cond_1

    iget v7, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v7, :cond_3

    :cond_1
    move p2, v5

    .line 2357
    .end local p2    # "startIndex":I
    :cond_2
    :goto_0
    return p2

    .line 2336
    .restart local p2    # "startIndex":I
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 2337
    .local v3, "strLen":I
    const/4 v7, 0x1

    if-ne v3, v7, :cond_4

    .line 2338
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {p0, v5, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(CI)I

    move-result p2

    goto :goto_0

    .line 2340
    :cond_4
    if-eqz v3, :cond_2

    .line 2343
    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le v3, v6, :cond_5

    move p2, v5

    .line 2344
    goto :goto_0

    .line 2346
    :cond_5
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2347
    .local v4, "thisBuf":[C
    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v6, v3

    add-int/lit8 v2, v6, 0x1

    .line 2349
    .local v2, "len":I
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ge v0, v2, :cond_8

    .line 2350
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2
    if-ge v1, v3, :cond_7

    .line 2351
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    add-int v7, v0, v1

    aget-char v7, v4, v7

    if-eq v6, v7, :cond_6

    .line 2349
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2350
    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_7
    move p2, v0

    .line 2355
    goto :goto_0

    .end local v1    # "j":I
    :cond_8
    move p2, v5

    .line 2357
    goto :goto_0
.end method

.method public indexOf(Lorg/apache/commons/lang3/text/StrMatcher;)I
    .locals 1
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;

    .prologue
    .line 2371
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I

    move-result v0

    return v0
.end method

.method public indexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I
    .locals 5
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;
    .param p2, "startIndex"    # I

    .prologue
    const/4 v3, -0x1

    .line 2387
    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 2388
    :cond_0
    if-eqz p1, :cond_1

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v4, :cond_3

    :cond_1
    move v1, v3

    .line 2398
    :cond_2
    :goto_0
    return v1

    .line 2391
    :cond_3
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 2392
    .local v2, "len":I
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2393
    .local v0, "buf":[C
    move v1, p2

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_4

    .line 2394
    invoke-virtual {p1, v0, v1, p2, v2}, Lorg/apache/commons/lang3/text/StrMatcher;->isMatch([CIII)I

    move-result v4

    if-gtz v4, :cond_2

    .line 2393
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    move v1, v3

    .line 2398
    goto :goto_0
.end method

.method public insert(IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "index"    # I
    .param p2, "value"    # C

    .prologue
    .line 1602
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1603
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1604
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v3, p1

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1605
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char p2, v0, p1

    .line 1606
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1607
    return-object p0
.end method

.method public insert(ID)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # D

    .prologue
    .line 1655
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(IF)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # F

    .prologue
    .line 1643
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "value"    # I

    .prologue
    .line 1619
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(IJ)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .param p1, "index"    # I
    .param p2, "value"    # J

    .prologue
    .line 1631
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(ILjava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "obj"    # Ljava/lang/Object;

    .prologue
    .line 1474
    if-nez p2, :cond_0

    .line 1475
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    .line 1477
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    goto :goto_0
.end method

.method public insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "index"    # I
    .param p2, "str"    # Ljava/lang/String;

    .prologue
    .line 1490
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1491
    if-nez p2, :cond_0

    .line 1492
    iget-object p2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    .line 1494
    :cond_0
    if-eqz p2, :cond_1

    .line 1495
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    .line 1496
    .local v1, "strLen":I
    if-lez v1, :cond_1

    .line 1497
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int v0, v2, v1

    .line 1498
    .local v0, "newSize":I
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1499
    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v4, p1, v1

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v5, p1

    invoke-static {v2, p1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1500
    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1501
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p2, v2, v1, v3, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 1504
    .end local v0    # "newSize":I
    .end local v1    # "strLen":I
    :cond_1
    return-object p0
.end method

.method public insert(IZ)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "index"    # I
    .param p2, "value"    # Z

    .prologue
    const/16 v5, 0x65

    .line 1571
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1572
    if-eqz p2, :cond_0

    .line 1573
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1574
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v3, p1, 0x4

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1575
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v0, p1, 0x1

    .end local p1    # "index":I
    .local v0, "index":I
    const/16 v2, 0x74

    aput-char v2, v1, p1

    .line 1576
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 p1, v0, 0x1

    .end local v0    # "index":I
    .restart local p1    # "index":I
    const/16 v2, 0x72

    aput-char v2, v1, v0

    .line 1577
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v0, p1, 0x1

    .end local p1    # "index":I
    .restart local v0    # "index":I
    const/16 v2, 0x75

    aput-char v2, v1, p1

    .line 1578
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char v5, v1, v0

    .line 1579
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    move p1, v0

    .line 1590
    .end local v0    # "index":I
    .restart local p1    # "index":I
    :goto_0
    return-object p0

    .line 1581
    :cond_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x5

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1582
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v3, p1, 0x5

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1583
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v0, p1, 0x1

    .end local p1    # "index":I
    .restart local v0    # "index":I
    const/16 v2, 0x66

    aput-char v2, v1, p1

    .line 1584
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 p1, v0, 0x1

    .end local v0    # "index":I
    .restart local p1    # "index":I
    const/16 v2, 0x61

    aput-char v2, v1, v0

    .line 1585
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v0, p1, 0x1

    .end local p1    # "index":I
    .restart local v0    # "index":I
    const/16 v2, 0x6c

    aput-char v2, v1, p1

    .line 1586
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 p1, v0, 0x1

    .end local v0    # "index":I
    .restart local p1    # "index":I
    const/16 v2, 0x73

    aput-char v2, v1, v0

    .line 1587
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char v5, v1, p1

    .line 1588
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x5

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public insert(I[C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5
    .param p1, "index"    # I
    .param p2, "chars"    # [C

    .prologue
    .line 1517
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1518
    if-nez p2, :cond_1

    .line 1519
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 1528
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 1521
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    array-length v0, p2

    .line 1522
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 1523
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1524
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v3, p1, v0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1525
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {p2, v1, v2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1526
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public insert(I[CII)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .param p1, "index"    # I
    .param p2, "chars"    # [C
    .param p3, "offset"    # I
    .param p4, "length"    # I

    .prologue
    .line 1543
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1544
    if-nez p2, :cond_1

    .line 1545
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 1559
    .end local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_0
    :goto_0
    return-object p0

    .line 1547
    .restart local p0    # "this":Lorg/apache/commons/lang3/text/StrBuilder;
    :cond_1
    if-ltz p3, :cond_2

    array-length v0, p2

    if-le p3, v0, :cond_3

    .line 1548
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Invalid offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1550
    :cond_3
    if-ltz p4, :cond_4

    add-int v0, p3, p4

    array-length v1, p2

    if-le v0, v1, :cond_5

    .line 1551
    :cond_4
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Invalid length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1553
    :cond_5
    if-lez p4, :cond_0

    .line 1554
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v0, p4

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1555
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v2, p1, p4

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v3, p1

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1556
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {p2, p3, v0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1557
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v0, p4

    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 278
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lastIndexOf(C)I
    .locals 1
    .param p1, "ch"    # C

    .prologue
    .line 2409
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->lastIndexOf(CI)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(CI)I
    .locals 3
    .param p1, "ch"    # C
    .param p2, "startIndex"    # I

    .prologue
    const/4 v1, -0x1

    .line 2420
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v2, :cond_0

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 p2, v2, -0x1

    .line 2421
    :cond_0
    if-gez p2, :cond_2

    move v0, v1

    .line 2429
    :cond_1
    :goto_0
    return v0

    .line 2424
    :cond_2
    move v0, p2

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_3

    .line 2425
    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v2, v2, v0

    if-eq v2, p1, :cond_1

    .line 2424
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    move v0, v1

    .line 2429
    goto :goto_0
.end method

.method public lastIndexOf(Ljava/lang/String;)I
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 2441
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->lastIndexOf(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(Ljava/lang/String;I)I
    .locals 7
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "startIndex"    # I

    .prologue
    const/4 v3, -0x1

    .line 2455
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v4, :cond_0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 p2, v4, -0x1

    .line 2456
    :cond_0
    if-eqz p1, :cond_1

    if-gez p2, :cond_3

    :cond_1
    move v0, v3

    .line 2478
    :cond_2
    :goto_0
    return v0

    .line 2459
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 2460
    .local v2, "strLen":I
    if-lez v2, :cond_6

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-gt v2, v4, :cond_6

    .line 2461
    const/4 v4, 0x1

    if-ne v2, v4, :cond_4

    .line 2462
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {p0, v3, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->lastIndexOf(CI)I

    move-result v0

    goto :goto_0

    .line 2466
    :cond_4
    sub-int v4, p2, v2

    add-int/lit8 v0, v4, 0x1

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_7

    .line 2467
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_2
    if-ge v1, v2, :cond_2

    .line 2468
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    iget-object v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v6, v0, v1

    aget-char v5, v5, v6

    if-eq v4, v5, :cond_5

    .line 2466
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 2467
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 2475
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_6
    if-nez v2, :cond_7

    move v0, p2

    .line 2476
    goto :goto_0

    :cond_7
    move v0, v3

    .line 2478
    goto :goto_0
.end method

.method public lastIndexOf(Lorg/apache/commons/lang3/text/StrMatcher;)I
    .locals 1
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;

    .prologue
    .line 2492
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->lastIndexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I
    .locals 5
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;
    .param p2, "startIndex"    # I

    .prologue
    const/4 v3, -0x1

    .line 2508
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v4, :cond_0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 p2, v4, -0x1

    .line 2509
    :cond_0
    if-eqz p1, :cond_1

    if-gez p2, :cond_3

    :cond_1
    move v2, v3

    .line 2519
    :cond_2
    :goto_0
    return v2

    .line 2512
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2513
    .local v0, "buf":[C
    add-int/lit8 v1, p2, 0x1

    .line 2514
    .local v1, "endIndex":I
    move v2, p2

    .local v2, "i":I
    :goto_1
    if-ltz v2, :cond_4

    .line 2515
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v2, v4, v1}, Lorg/apache/commons/lang3/text/StrMatcher;->isMatch([CIII)I

    move-result v4

    if-gtz v4, :cond_2

    .line 2514
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    :cond_4
    move v2, v3

    .line 2519
    goto :goto_0
.end method

.method public leftString(I)Ljava/lang/String;
    .locals 4
    .param p1, "length"    # I

    .prologue
    const/4 v3, 0x0

    .line 2175
    if-gtz p1, :cond_0

    .line 2176
    const-string/jumbo v0, ""

    .line 2180
    :goto_0
    return-object v0

    .line 2177
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_1

    .line 2178
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1, v3, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 2180
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-direct {v0, v1, v3, p1}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 188
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    return v0
.end method

.method public midString(II)Ljava/lang/String;
    .locals 3
    .param p1, "index"    # I
    .param p2, "length"    # I

    .prologue
    .line 2223
    if-gez p1, :cond_0

    .line 2224
    const/4 p1, 0x0

    .line 2226
    :cond_0
    if-lez p2, :cond_1

    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_2

    .line 2227
    :cond_1
    const-string/jumbo v0, ""

    .line 2232
    :goto_0
    return-object v0

    .line 2229
    :cond_2
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int v1, p1, p2

    if-gt v0, v1, :cond_3

    .line 2230
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 2232
    :cond_3
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-direct {v0, v1, p1, p2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public minimizeCapacity()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 248
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    array-length v1, v1

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 249
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 250
    .local v0, "old":[C
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v1

    new-array v1, v1, [C

    iput-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 251
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 253
    .end local v0    # "old":[C
    :cond_0
    return-object p0
.end method

.method public replace(IILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I
    .param p3, "replaceStr"    # Ljava/lang/String;

    .prologue
    .line 1830
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 1831
    if-nez p3, :cond_0

    const/4 v5, 0x0

    .line 1832
    .local v5, "insertLen":I
    :goto_0
    sub-int v3, p2, p1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1833
    return-object p0

    .line 1831
    .end local v5    # "insertLen":I
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_0
.end method

.method public replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;
    .param p2, "replaceStr"    # Ljava/lang/String;
    .param p3, "startIndex"    # I
    .param p4, "endIndex"    # I
    .param p5, "replaceCount"    # I

    .prologue
    .line 1967
    invoke-virtual {p0, p3, p4}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p4

    .line 1968
    invoke-direct/range {p0 .. p5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public replaceAll(CC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .param p1, "search"    # C
    .param p2, "replace"    # C

    .prologue
    .line 1846
    if-eq p1, p2, :cond_1

    .line 1847
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v0, v1, :cond_1

    .line 1848
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_0

    .line 1849
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char p2, v1, v0

    .line 1847
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1853
    .end local v0    # "i":I
    :cond_1
    return-object p0
.end method

.method public replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "replaceStr"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 1885
    if-nez p1, :cond_0

    move v3, v0

    .line 1886
    .local v3, "searchLen":I
    :goto_0
    if-lez v3, :cond_2

    .line 1887
    if-nez p2, :cond_1

    move v5, v0

    .line 1888
    .local v5, "replaceLen":I
    :goto_1
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 1889
    .local v1, "index":I
    :goto_2
    if-ltz v1, :cond_2

    .line 1890
    add-int v2, v1, v3

    move-object v0, p0

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1891
    add-int v0, v1, v5

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_2

    .line 1885
    .end local v1    # "index":I
    .end local v3    # "searchLen":I
    .end local v5    # "replaceLen":I
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_0

    .line 1887
    .restart local v3    # "searchLen":I
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_1

    .line 1894
    :cond_2
    return-object p0
.end method

.method public replaceAll(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;
    .param p2, "replaceStr"    # Ljava/lang/String;

    .prologue
    .line 1929
    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public replaceFirst(CC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .param p1, "search"    # C
    .param p2, "replace"    # C

    .prologue
    .line 1865
    if-eq p1, p2, :cond_0

    .line 1866
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v0, v1, :cond_0

    .line 1867
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_1

    .line 1868
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char p2, v1, v0

    .line 1873
    .end local v0    # "i":I
    :cond_0
    return-object p0

    .line 1866
    .restart local v0    # "i":I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public replaceFirst(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "searchStr"    # Ljava/lang/String;
    .param p2, "replaceStr"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 1905
    if-nez p1, :cond_1

    move v3, v5

    .line 1906
    .local v3, "searchLen":I
    :goto_0
    if-lez v3, :cond_0

    .line 1907
    invoke-virtual {p0, p1, v5}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 1908
    .local v1, "index":I
    if-ltz v1, :cond_0

    .line 1909
    if-nez p2, :cond_2

    .line 1910
    .local v5, "replaceLen":I
    :goto_1
    add-int v2, v1, v3

    move-object v0, p0

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1913
    .end local v1    # "index":I
    .end local v5    # "replaceLen":I
    :cond_0
    return-object p0

    .line 1905
    .end local v3    # "searchLen":I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_0

    .line 1909
    .restart local v1    # "index":I
    .restart local v3    # "searchLen":I
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_1
.end method

.method public replaceFirst(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .param p1, "matcher"    # Lorg/apache/commons/lang3/text/StrMatcher;
    .param p2, "replaceStr"    # Ljava/lang/String;

    .prologue
    .line 1944
    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public reverse()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6

    .prologue
    .line 2015
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v5, :cond_1

    .line 2026
    :cond_0
    return-object p0

    .line 2019
    :cond_1
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    div-int/lit8 v1, v5, 0x2

    .line 2020
    .local v1, "half":I
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2021
    .local v0, "buf":[C
    const/4 v2, 0x0

    .local v2, "leftIdx":I
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v3, v5, -0x1

    .local v3, "rightIdx":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 2022
    aget-char v4, v0, v2

    .line 2023
    .local v4, "swap":C
    aget-char v5, v0, v3

    aput-char v5, v0, v2

    .line 2024
    aput-char v4, v0, v3

    .line 2021
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, -0x1

    goto :goto_0
.end method

.method public rightString(I)Ljava/lang/String;
    .locals 4
    .param p1, "length"    # I

    .prologue
    .line 2197
    if-gtz p1, :cond_0

    .line 2198
    const-string/jumbo v0, ""

    .line 2202
    :goto_0
    return-object v0

    .line 2199
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_1

    .line 2200
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 2202
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v2, p1

    invoke-direct {v0, v1, v2, p1}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public setCharAt(IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "index"    # I
    .param p2, "ch"    # C

    .prologue
    .line 326
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 327
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 329
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char p2, v0, p1

    .line 330
    return-object p0
.end method

.method public setLength(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5
    .param p1, "length"    # I

    .prologue
    .line 200
    if-gez p1, :cond_0

    .line 201
    new-instance v3, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v3, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v3

    .line 203
    :cond_0
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge p1, v3, :cond_2

    .line 204
    iput p1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 214
    :cond_1
    return-object p0

    .line 205
    :cond_2
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le p1, v3, :cond_1

    .line 206
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 207
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 208
    .local v2, "oldEnd":I
    move v1, p1

    .line 209
    .local v1, "newEnd":I
    iput p1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 210
    move v0, v2

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 211
    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v4, 0x0

    aput-char v4, v3, v0

    .line 210
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setNewLineText(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 0
    .param p1, "newLine"    # Ljava/lang/String;

    .prologue
    .line 152
    iput-object p1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->newLine:Ljava/lang/String;

    .line 153
    return-object p0
.end method

.method public setNullText(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .param p1, "nullText"    # Ljava/lang/String;

    .prologue
    .line 173
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 174
    const/4 p1, 0x0

    .line 176
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    .line 177
    return-object p0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 266
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    return v0
.end method

.method public startsWith(Ljava/lang/String;)Z
    .locals 6
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2068
    if-nez p1, :cond_1

    .line 2083
    :cond_0
    :goto_0
    return v2

    .line 2071
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2072
    .local v1, "len":I
    if-nez v1, :cond_2

    move v2, v3

    .line 2073
    goto :goto_0

    .line 2075
    :cond_2
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-gt v1, v4, :cond_0

    .line 2078
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 2079
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v4, v4, v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v4, v5, :cond_0

    .line 2078
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v2, v3

    .line 2083
    goto :goto_0
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 2121
    if-gez p1, :cond_0

    .line 2122
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2124
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le p2, v0, :cond_1

    .line 2125
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2127
    :cond_1
    if-le p1, p2, :cond_2

    .line 2128
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    sub-int v1, p2, p1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2130
    :cond_2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public substring(I)Ljava/lang/String;
    .locals 1
    .param p1, "start"    # I

    .prologue
    .line 2141
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public substring(II)Ljava/lang/String;
    .locals 3
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 2158
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 2159
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    sub-int v2, p2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public toCharArray()[C
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 357
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v1, :cond_0

    .line 358
    sget-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 362
    :goto_0
    return-object v0

    .line 360
    :cond_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    new-array v0, v1, [C

    .line 361
    .local v0, "chars":[C
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public toCharArray(II)[C
    .locals 4
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 376
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 377
    sub-int v1, p2, p1

    .line 378
    .local v1, "len":I
    if-nez v1, :cond_0

    .line 379
    sget-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 383
    :goto_0
    return-object v0

    .line 381
    :cond_0
    new-array v0, v1, [C

    .line 382
    .local v0, "chars":[C
    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v3, 0x0

    invoke-static {v2, p1, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 2731
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public toStringBuffer()Ljava/lang/StringBuffer;
    .locals 4

    .prologue
    .line 2741
    new-instance v0, Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public toStringBuilder()Ljava/lang/StringBuilder;
    .locals 4

    .prologue
    .line 2752
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public trim()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5

    .prologue
    const/16 v4, 0x20

    .line 2037
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v3, :cond_1

    .line 2055
    :cond_0
    :goto_0
    return-object p0

    .line 2040
    :cond_1
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 2041
    .local v1, "len":I
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2042
    .local v0, "buf":[C
    const/4 v2, 0x0

    .line 2043
    .local v2, "pos":I
    :goto_1
    if-ge v2, v1, :cond_2

    aget-char v3, v0, v2

    if-gt v3, v4, :cond_2

    .line 2044
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2046
    :cond_2
    :goto_2
    if-ge v2, v1, :cond_3

    add-int/lit8 v3, v1, -0x1

    aget-char v3, v0, v3

    if-gt v3, v4, :cond_3

    .line 2047
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 2049
    :cond_3
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v1, v3, :cond_4

    .line 2050
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {p0, v1, v3}, Lorg/apache/commons/lang3/text/StrBuilder;->delete(II)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 2052
    :cond_4
    if-lez v2, :cond_0

    .line 2053
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->delete(II)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method protected validateIndex(I)V
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 2796
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le p1, v0, :cond_1

    .line 2797
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2799
    :cond_1
    return-void
.end method

.method protected validateRange(II)I
    .locals 2
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 2777
    if-gez p1, :cond_0

    .line 2778
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2780
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le p2, v0, :cond_1

    .line 2781
    iget p2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 2783
    :cond_1
    if-le p1, p2, :cond_2

    .line 2784
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string/jumbo v1, "end < start"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2786
    :cond_2
    return p2
.end method
