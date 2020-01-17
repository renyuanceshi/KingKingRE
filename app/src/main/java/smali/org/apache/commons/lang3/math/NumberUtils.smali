.class public Lorg/apache/commons/lang3/math/NumberUtils;
.super Ljava/lang/Object;
.source "NumberUtils.java"


# static fields
.field public static final BYTE_MINUS_ONE:Ljava/lang/Byte;

.field public static final BYTE_ONE:Ljava/lang/Byte;

.field public static final BYTE_ZERO:Ljava/lang/Byte;

.field public static final DOUBLE_MINUS_ONE:Ljava/lang/Double;

.field public static final DOUBLE_ONE:Ljava/lang/Double;

.field public static final DOUBLE_ZERO:Ljava/lang/Double;

.field public static final FLOAT_MINUS_ONE:Ljava/lang/Float;

.field public static final FLOAT_ONE:Ljava/lang/Float;

.field public static final FLOAT_ZERO:Ljava/lang/Float;

.field public static final INTEGER_MINUS_ONE:Ljava/lang/Integer;

.field public static final INTEGER_ONE:Ljava/lang/Integer;

.field public static final INTEGER_ZERO:Ljava/lang/Integer;

.field public static final LONG_MINUS_ONE:Ljava/lang/Long;

.field public static final LONG_ONE:Ljava/lang/Long;

.field public static final LONG_ZERO:Ljava/lang/Long;

.field public static final SHORT_MINUS_ONE:Ljava/lang/Short;

.field public static final SHORT_ONE:Ljava/lang/Short;

.field public static final SHORT_ZERO:Ljava/lang/Short;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 34
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_ZERO:Ljava/lang/Long;

    .line 36
    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_ONE:Ljava/lang/Long;

    .line 38
    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_MINUS_ONE:Ljava/lang/Long;

    .line 40
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    .line 42
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    .line 44
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_MINUS_ONE:Ljava/lang/Integer;

    .line 46
    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_ZERO:Ljava/lang/Short;

    .line 48
    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_ONE:Ljava/lang/Short;

    .line 50
    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_MINUS_ONE:Ljava/lang/Short;

    .line 52
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_ZERO:Ljava/lang/Byte;

    .line 54
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_ONE:Ljava/lang/Byte;

    .line 56
    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_MINUS_ONE:Ljava/lang/Byte;

    .line 58
    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_ZERO:Ljava/lang/Double;

    .line 60
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_ONE:Ljava/lang/Double;

    .line 62
    const-wide/high16 v0, -0x4010000000000000L    # -1.0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_MINUS_ONE:Ljava/lang/Double;

    .line 64
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_ZERO:Ljava/lang/Float;

    .line 66
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_ONE:Ljava/lang/Float;

    .line 68
    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_MINUS_ONE:Ljava/lang/Float;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    return-void
.end method

.method public static createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 759
    if-nez p0, :cond_0

    .line 760
    const/4 v0, 0x0

    .line 773
    :goto_0
    return-object v0

    .line 763
    :cond_0
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 764
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string/jumbo v1, "A blank string is not a valid number"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 766
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "--"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 771
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is not a valid number."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 773
    :cond_2
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;
    .locals 6
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 724
    if-nez p0, :cond_1

    .line 725
    const/4 v3, 0x0

    .line 746
    :cond_0
    :goto_0
    return-object v3

    .line 727
    :cond_1
    const/4 v1, 0x0

    .line 728
    .local v1, "pos":I
    const/16 v2, 0xa

    .line 729
    .local v2, "radix":I
    const/4 v0, 0x0

    .line 730
    .local v0, "negate":Z
    const-string/jumbo v4, "-"

    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 731
    const/4 v0, 0x1

    .line 732
    const/4 v1, 0x1

    .line 734
    :cond_2
    const-string/jumbo v4, "0x"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-nez v4, :cond_3

    const-string/jumbo v4, "0x"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 735
    :cond_3
    const/16 v2, 0x10

    .line 736
    add-int/lit8 v1, v1, 0x2

    .line 745
    :cond_4
    :goto_1
    new-instance v3, Ljava/math/BigInteger;

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    .line 746
    .local v3, "value":Ljava/math/BigInteger;
    if-eqz v0, :cond_0

    invoke-virtual {v3}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v3

    goto :goto_0

    .line 737
    .end local v3    # "value":Ljava/math/BigInteger;
    :cond_5
    const-string/jumbo v4, "#"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 738
    const/16 v2, 0x10

    .line 739
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 740
    :cond_6
    const-string/jumbo v4, "0"

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v5, v1, 0x1

    if-le v4, v5, :cond_4

    .line 741
    const/16 v2, 0x8

    .line 742
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static createDouble(Ljava/lang/String;)Ljava/lang/Double;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 672
    if-nez p0, :cond_0

    .line 673
    const/4 v0, 0x0

    .line 675
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0
.end method

.method public static createFloat(Ljava/lang/String;)Ljava/lang/Float;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 656
    if-nez p0, :cond_0

    .line 657
    const/4 v0, 0x0

    .line 659
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0
.end method

.method public static createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 689
    if-nez p0, :cond_0

    .line 690
    const/4 v0, 0x0

    .line 693
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method public static createLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 707
    if-nez p0, :cond_0

    .line 708
    const/4 v0, 0x0

    .line 710
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Long;->decode(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0
.end method

.method public static createNumber(Ljava/lang/String;)Ljava/lang/Number;
    .locals 28
    .param p0, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 451
    if-nez p0, :cond_1

    .line 452
    const/4 v11, 0x0

    .line 622
    :cond_0
    :goto_0
    return-object v11

    .line 454
    :cond_1
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v24

    if-eqz v24, :cond_2

    .line 455
    new-instance v24, Ljava/lang/NumberFormatException;

    const-string/jumbo v25, "A blank string is not a valid number"

    invoke-direct/range {v24 .. v25}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 458
    :cond_2
    const/16 v24, 0x6

    move/from16 v0, v24

    new-array v14, v0, [Ljava/lang/String;

    const/16 v24, 0x0

    const-string/jumbo v25, "0x"

    aput-object v25, v14, v24

    const/16 v24, 0x1

    const-string/jumbo v25, "0X"

    aput-object v25, v14, v24

    const/16 v24, 0x2

    const-string/jumbo v25, "-0x"

    aput-object v25, v14, v24

    const/16 v24, 0x3

    const-string/jumbo v25, "-0X"

    aput-object v25, v14, v24

    const/16 v24, 0x4

    const-string/jumbo v25, "#"

    aput-object v25, v14, v24

    const/16 v24, 0x5

    const-string/jumbo v25, "-#"

    aput-object v25, v14, v24

    .line 459
    .local v14, "hex_prefixes":[Ljava/lang/String;
    const/16 v23, 0x0

    .line 460
    .local v23, "pfxLen":I
    move-object v5, v14

    .local v5, "arr$":[Ljava/lang/String;
    array-length v0, v5

    move/from16 v18, v0

    .local v18, "len$":I
    const/16 v16, 0x0

    .local v16, "i$":I
    :goto_1
    move/from16 v0, v16

    move/from16 v1, v18

    if-ge v0, v1, :cond_3

    aget-object v22, v5, v16

    .line 461
    .local v22, "pfx":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_4

    .line 462
    invoke-virtual/range {v22 .. v22}, Ljava/lang/String;->length()I

    move-result v24

    add-int v23, v23, v24

    .line 466
    .end local v22    # "pfx":Ljava/lang/String;
    :cond_3
    if-lez v23, :cond_a

    .line 467
    const/4 v12, 0x0

    .line 468
    .local v12, "firstSigDigit":C
    move/from16 v15, v23

    .local v15, "i":I
    :goto_2
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    move/from16 v0, v24

    if-ge v15, v0, :cond_5

    .line 469
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v12

    .line 470
    const/16 v24, 0x30

    move/from16 v0, v24

    if-ne v12, v0, :cond_5

    .line 471
    add-int/lit8 v23, v23, 0x1

    .line 468
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 460
    .end local v12    # "firstSigDigit":C
    .end local v15    # "i":I
    .restart local v22    # "pfx":Ljava/lang/String;
    :cond_4
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 476
    .end local v22    # "pfx":Ljava/lang/String;
    .restart local v12    # "firstSigDigit":C
    .restart local v15    # "i":I
    :cond_5
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    sub-int v13, v24, v23

    .line 477
    .local v13, "hexDigits":I
    const/16 v24, 0x10

    move/from16 v0, v24

    if-gt v13, v0, :cond_6

    const/16 v24, 0x10

    move/from16 v0, v24

    if-ne v13, v0, :cond_7

    const/16 v24, 0x37

    move/from16 v0, v24

    if-le v12, v0, :cond_7

    .line 478
    :cond_6
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v11

    goto/16 :goto_0

    .line 480
    :cond_7
    const/16 v24, 0x8

    move/from16 v0, v24

    if-gt v13, v0, :cond_8

    const/16 v24, 0x8

    move/from16 v0, v24

    if-ne v13, v0, :cond_9

    const/16 v24, 0x37

    move/from16 v0, v24

    if-le v12, v0, :cond_9

    .line 481
    :cond_8
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v11

    goto/16 :goto_0

    .line 483
    :cond_9
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v11

    goto/16 :goto_0

    .line 485
    .end local v12    # "firstSigDigit":C
    .end local v13    # "hexDigits":I
    .end local v15    # "i":I
    :cond_a
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    add-int/lit8 v24, v24, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v17

    .line 489
    .local v17, "lastChar":C
    const/16 v24, 0x2e

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 490
    .local v8, "decPos":I
    const/16 v24, 0x65

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v24

    const/16 v25, 0x45

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v25

    add-int v24, v24, v25

    add-int/lit8 v10, v24, 0x1

    .line 494
    .local v10, "expPos":I
    const/16 v20, 0x0

    .line 495
    .local v20, "numDecimals":I
    const/16 v24, -0x1

    move/from16 v0, v24

    if-le v8, v0, :cond_e

    .line 497
    const/16 v24, -0x1

    move/from16 v0, v24

    if-le v10, v0, :cond_d

    .line 498
    if-lt v10, v8, :cond_b

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    move/from16 v0, v24

    if-le v10, v0, :cond_c

    .line 499
    :cond_b
    new-instance v24, Ljava/lang/NumberFormatException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string/jumbo v26, " is not a valid number."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 501
    :cond_c
    add-int/lit8 v24, v8, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 505
    .local v7, "dec":Ljava/lang/String;
    :goto_3
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    .line 506
    .local v19, "mant":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v20

    .line 518
    :goto_4
    invoke-static/range {v17 .. v17}, Ljava/lang/Character;->isDigit(C)Z

    move-result v24

    if-nez v24, :cond_19

    const/16 v24, 0x2e

    move/from16 v0, v17

    move/from16 v1, v24

    if-eq v0, v1, :cond_19

    .line 519
    const/16 v24, -0x1

    move/from16 v0, v24

    if-le v10, v0, :cond_11

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    add-int/lit8 v24, v24, -0x1

    move/from16 v0, v24

    if-ge v10, v0, :cond_11

    .line 520
    add-int/lit8 v24, v10, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v25

    add-int/lit8 v25, v25, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 525
    .local v9, "exp":Ljava/lang/String;
    :goto_5
    const/16 v24, 0x0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v25

    add-int/lit8 v25, v25, -0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v21

    .line 526
    .local v21, "numeric":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_12

    invoke-static {v9}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_12

    const/4 v4, 0x1

    .line 527
    .local v4, "allZeros":Z
    :goto_6
    sparse-switch v17, :sswitch_data_0

    .line 573
    :goto_7
    new-instance v24, Ljava/lang/NumberFormatException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string/jumbo v26, " is not a valid number."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 503
    .end local v4    # "allZeros":Z
    .end local v7    # "dec":Ljava/lang/String;
    .end local v9    # "exp":Ljava/lang/String;
    .end local v19    # "mant":Ljava/lang/String;
    .end local v21    # "numeric":Ljava/lang/String;
    :cond_d
    add-int/lit8 v24, v8, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .restart local v7    # "dec":Ljava/lang/String;
    goto/16 :goto_3

    .line 508
    .end local v7    # "dec":Ljava/lang/String;
    :cond_e
    const/16 v24, -0x1

    move/from16 v0, v24

    if-le v10, v0, :cond_10

    .line 509
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    move/from16 v0, v24

    if-le v10, v0, :cond_f

    .line 510
    new-instance v24, Ljava/lang/NumberFormatException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string/jumbo v26, " is not a valid number."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 512
    :cond_f
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    .line 516
    .restart local v19    # "mant":Ljava/lang/String;
    :goto_8
    const/4 v7, 0x0

    .restart local v7    # "dec":Ljava/lang/String;
    goto/16 :goto_4

    .line 514
    .end local v7    # "dec":Ljava/lang/String;
    .end local v19    # "mant":Ljava/lang/String;
    :cond_10
    move-object/from16 v19, p0

    .restart local v19    # "mant":Ljava/lang/String;
    goto :goto_8

    .line 522
    .restart local v7    # "dec":Ljava/lang/String;
    :cond_11
    const/4 v9, 0x0

    .restart local v9    # "exp":Ljava/lang/String;
    goto/16 :goto_5

    .line 526
    .restart local v21    # "numeric":Ljava/lang/String;
    :cond_12
    const/4 v4, 0x0

    goto :goto_6

    .line 530
    .restart local v4    # "allZeros":Z
    :sswitch_0
    if-nez v7, :cond_15

    if-nez v9, :cond_15

    const/16 v24, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v24

    const/16 v25, 0x2d

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_13

    const/16 v24, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v24

    if-nez v24, :cond_14

    :cond_13
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_15

    .line 534
    :cond_14
    :try_start_0
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v11

    goto/16 :goto_0

    .line 535
    :catch_0
    move-exception v24

    .line 538
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v11

    goto/16 :goto_0

    .line 541
    :cond_15
    new-instance v24, Ljava/lang/NumberFormatException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string/jumbo v26, " is not a valid number."

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 545
    :sswitch_1
    :try_start_1
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/lang3/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v11

    .line 546
    .local v11, "f":Ljava/lang/Float;
    invoke-virtual {v11}, Ljava/lang/Float;->isInfinite()Z

    move-result v24

    if-nez v24, :cond_16

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_7

    move-result v24

    const/16 v25, 0x0

    cmpl-float v24, v24, v25

    if-nez v24, :cond_0

    if-nez v4, :cond_0

    .line 559
    .end local v11    # "f":Ljava/lang/Float;
    :cond_16
    :goto_9
    :sswitch_2
    :try_start_2
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/lang3/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v6

    .line 560
    .local v6, "d":Ljava/lang/Double;
    invoke-virtual {v6}, Ljava/lang/Double;->isInfinite()Z

    move-result v24

    if-nez v24, :cond_18

    invoke-virtual {v6}, Ljava/lang/Double;->floatValue()F
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    move-result v24

    move/from16 v0, v24

    float-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide/16 v26, 0x0

    cmpl-double v24, v24, v26

    if-nez v24, :cond_17

    if-eqz v4, :cond_18

    :cond_17
    move-object v11, v6

    .line 561
    goto/16 :goto_0

    .line 563
    .end local v6    # "d":Ljava/lang/Double;
    :catch_1
    move-exception v24

    .line 567
    :cond_18
    :try_start_3
    invoke-static/range {v21 .. v21}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_5

    move-result-object v11

    goto/16 :goto_0

    .line 579
    .end local v4    # "allZeros":Z
    .end local v9    # "exp":Ljava/lang/String;
    .end local v21    # "numeric":Ljava/lang/String;
    :cond_19
    const/16 v24, -0x1

    move/from16 v0, v24

    if-le v10, v0, :cond_1a

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v24

    add-int/lit8 v24, v24, -0x1

    move/from16 v0, v24

    if-ge v10, v0, :cond_1a

    .line 580
    add-int/lit8 v24, v10, 0x1

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v25

    move-object/from16 v0, p0

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 584
    .restart local v9    # "exp":Ljava/lang/String;
    :goto_a
    if-nez v7, :cond_1b

    if-nez v9, :cond_1b

    .line 587
    :try_start_4
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v11

    goto/16 :goto_0

    .line 582
    .end local v9    # "exp":Ljava/lang/String;
    :cond_1a
    const/4 v9, 0x0

    .restart local v9    # "exp":Ljava/lang/String;
    goto :goto_a

    .line 588
    :catch_2
    move-exception v24

    .line 592
    :try_start_5
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_3

    move-result-object v11

    goto/16 :goto_0

    .line 593
    :catch_3
    move-exception v24

    .line 596
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v11

    goto/16 :goto_0

    .line 600
    :cond_1b
    invoke-static/range {v19 .. v19}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_1e

    invoke-static {v9}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_1e

    const/4 v4, 0x1

    .line 602
    .restart local v4    # "allZeros":Z
    :goto_b
    const/16 v24, 0x7

    move/from16 v0, v20

    move/from16 v1, v24

    if-gt v0, v1, :cond_1c

    .line 603
    :try_start_6
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v11

    .line 604
    .restart local v11    # "f":Ljava/lang/Float;
    invoke-virtual {v11}, Ljava/lang/Float;->isInfinite()Z

    move-result v24

    if-nez v24, :cond_1c

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_6

    move-result v24

    const/16 v25, 0x0

    cmpl-float v24, v24, v25

    if-nez v24, :cond_0

    if-nez v4, :cond_0

    .line 612
    .end local v11    # "f":Ljava/lang/Float;
    :cond_1c
    :goto_c
    const/16 v24, 0x10

    move/from16 v0, v20

    move/from16 v1, v24

    if-gt v0, v1, :cond_1f

    .line 613
    :try_start_7
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v6

    .line 614
    .restart local v6    # "d":Ljava/lang/Double;
    invoke-virtual {v6}, Ljava/lang/Double;->isInfinite()Z

    move-result v24

    if-nez v24, :cond_1f

    invoke-virtual {v6}, Ljava/lang/Double;->doubleValue()D
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_4

    move-result-wide v24

    const-wide/16 v26, 0x0

    cmpl-double v24, v24, v26

    if-nez v24, :cond_1d

    if-eqz v4, :cond_1f

    :cond_1d
    move-object v11, v6

    .line 615
    goto/16 :goto_0

    .line 600
    .end local v4    # "allZeros":Z
    .end local v6    # "d":Ljava/lang/Double;
    :cond_1e
    const/4 v4, 0x0

    goto :goto_b

    .line 618
    .restart local v4    # "allZeros":Z
    :catch_4
    move-exception v24

    .line 622
    :cond_1f
    invoke-static/range {p0 .. p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v11

    goto/16 :goto_0

    .line 568
    .restart local v21    # "numeric":Ljava/lang/String;
    :catch_5
    move-exception v24

    goto/16 :goto_7

    .line 608
    .end local v21    # "numeric":Ljava/lang/String;
    :catch_6
    move-exception v24

    goto :goto_c

    .line 552
    .restart local v21    # "numeric":Ljava/lang/String;
    :catch_7
    move-exception v24

    goto/16 :goto_9

    .line 527
    :sswitch_data_0
    .sparse-switch
        0x44 -> :sswitch_2
        0x46 -> :sswitch_1
        0x4c -> :sswitch_0
        0x64 -> :sswitch_2
        0x66 -> :sswitch_1
        0x6c -> :sswitch_0
    .end sparse-switch
.end method

.method private static isAllZeros(Ljava/lang/String;)Z
    .locals 5
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 634
    if-nez p0, :cond_1

    .line 642
    :cond_0
    :goto_0
    return v1

    .line 637
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_1
    if-ltz v0, :cond_3

    .line 638
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-eq v3, v4, :cond_2

    move v1, v2

    .line 639
    goto :goto_0

    .line 637
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 642
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public static isDigits(Ljava/lang/String;)Z
    .locals 3
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 1310
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1318
    :cond_0
    :goto_0
    return v1

    .line 1313
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 1314
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1313
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1318
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static isNumber(Ljava/lang/String;)Z
    .locals 15
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/16 v14, 0x2d

    const/16 v13, 0x39

    const/16 v12, 0x30

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1335
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1433
    :cond_0
    :goto_0
    return v9

    .line 1338
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 1339
    .local v1, "chars":[C
    array-length v7, v1

    .line 1340
    .local v7, "sz":I
    const/4 v4, 0x0

    .line 1341
    .local v4, "hasExp":Z
    const/4 v3, 0x0

    .line 1342
    .local v3, "hasDecPoint":Z
    const/4 v0, 0x0

    .line 1343
    .local v0, "allowSigns":Z
    const/4 v2, 0x0

    .line 1345
    .local v2, "foundDigit":Z
    aget-char v10, v1, v9

    if-ne v10, v14, :cond_5

    move v6, v8

    .line 1346
    .local v6, "start":I
    :goto_1
    add-int/lit8 v10, v6, 0x1

    if-le v7, v10, :cond_7

    aget-char v10, v1, v6

    if-ne v10, v12, :cond_7

    add-int/lit8 v10, v6, 0x1

    aget-char v10, v1, v10

    const/16 v11, 0x78

    if-ne v10, v11, :cond_7

    .line 1347
    add-int/lit8 v5, v6, 0x2

    .line 1348
    .local v5, "i":I
    if-eq v5, v7, :cond_0

    .line 1352
    :goto_2
    array-length v10, v1

    if-ge v5, v10, :cond_6

    .line 1353
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_2

    aget-char v10, v1, v5

    if-le v10, v13, :cond_4

    :cond_2
    aget-char v10, v1, v5

    const/16 v11, 0x61

    if-lt v10, v11, :cond_3

    aget-char v10, v1, v5

    const/16 v11, 0x66

    if-le v10, v11, :cond_4

    :cond_3
    aget-char v10, v1, v5

    const/16 v11, 0x41

    if-lt v10, v11, :cond_0

    aget-char v10, v1, v5

    const/16 v11, 0x46

    if-gt v10, v11, :cond_0

    .line 1352
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .end local v5    # "i":I
    .end local v6    # "start":I
    :cond_5
    move v6, v9

    .line 1345
    goto :goto_1

    .restart local v5    # "i":I
    .restart local v6    # "start":I
    :cond_6
    move v9, v8

    .line 1359
    goto :goto_0

    .line 1361
    .end local v5    # "i":I
    :cond_7
    add-int/lit8 v7, v7, -0x1

    .line 1363
    move v5, v6

    .line 1366
    .restart local v5    # "i":I
    :goto_3
    if-lt v5, v7, :cond_8

    add-int/lit8 v10, v7, 0x1

    if-ge v5, v10, :cond_e

    if-eqz v0, :cond_e

    if-nez v2, :cond_e

    .line 1367
    :cond_8
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_9

    aget-char v10, v1, v5

    if-gt v10, v13, :cond_9

    .line 1368
    const/4 v2, 0x1

    .line 1369
    const/4 v0, 0x0

    .line 1397
    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 1371
    :cond_9
    aget-char v10, v1, v5

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_a

    .line 1372
    if-nez v3, :cond_0

    if-nez v4, :cond_0

    .line 1376
    const/4 v3, 0x1

    goto :goto_4

    .line 1377
    :cond_a
    aget-char v10, v1, v5

    const/16 v11, 0x65

    if-eq v10, v11, :cond_b

    aget-char v10, v1, v5

    const/16 v11, 0x45

    if-ne v10, v11, :cond_c

    .line 1379
    :cond_b
    if-nez v4, :cond_0

    .line 1383
    if-eqz v2, :cond_0

    .line 1386
    const/4 v4, 0x1

    .line 1387
    const/4 v0, 0x1

    goto :goto_4

    .line 1388
    :cond_c
    aget-char v10, v1, v5

    const/16 v11, 0x2b

    if-eq v10, v11, :cond_d

    aget-char v10, v1, v5

    if-ne v10, v14, :cond_0

    .line 1389
    :cond_d
    if-eqz v0, :cond_0

    .line 1392
    const/4 v0, 0x0

    .line 1393
    const/4 v2, 0x0

    goto :goto_4

    .line 1399
    :cond_e
    array-length v10, v1

    if-ge v5, v10, :cond_15

    .line 1400
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_f

    aget-char v10, v1, v5

    if-gt v10, v13, :cond_f

    move v9, v8

    .line 1402
    goto/16 :goto_0

    .line 1404
    :cond_f
    aget-char v10, v1, v5

    const/16 v11, 0x65

    if-eq v10, v11, :cond_0

    aget-char v10, v1, v5

    const/16 v11, 0x45

    if-eq v10, v11, :cond_0

    .line 1408
    aget-char v10, v1, v5

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_10

    .line 1409
    if-nez v3, :cond_0

    if-nez v4, :cond_0

    move v9, v2

    .line 1414
    goto/16 :goto_0

    .line 1416
    :cond_10
    if-nez v0, :cond_12

    aget-char v10, v1, v5

    const/16 v11, 0x64

    if-eq v10, v11, :cond_11

    aget-char v10, v1, v5

    const/16 v11, 0x44

    if-eq v10, v11, :cond_11

    aget-char v10, v1, v5

    const/16 v11, 0x66

    if-eq v10, v11, :cond_11

    aget-char v10, v1, v5

    const/16 v11, 0x46

    if-ne v10, v11, :cond_12

    :cond_11
    move v9, v2

    .line 1421
    goto/16 :goto_0

    .line 1423
    :cond_12
    aget-char v10, v1, v5

    const/16 v11, 0x6c

    if-eq v10, v11, :cond_13

    aget-char v10, v1, v5

    const/16 v11, 0x4c

    if-ne v10, v11, :cond_0

    .line 1426
    :cond_13
    if-eqz v2, :cond_14

    if-nez v4, :cond_14

    if-nez v3, :cond_14

    :goto_5
    move v9, v8

    goto/16 :goto_0

    :cond_14
    move v8, v9

    goto :goto_5

    .line 1433
    :cond_15
    if-nez v0, :cond_16

    if-eqz v2, :cond_16

    :goto_6
    move v9, v8

    goto/16 :goto_0

    :cond_16
    move v8, v9

    goto :goto_6
.end method

.method public static max(BBB)B
    .locals 0
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .prologue
    .line 1257
    if-le p1, p0, :cond_0

    .line 1258
    move p0, p1

    .line 1260
    :cond_0
    if-le p2, p0, :cond_1

    .line 1261
    move p0, p2

    .line 1263
    :cond_1
    return p0
.end method

.method public static max([B)B
    .locals 3
    .param p0, "array"    # [B

    .prologue
    .line 1005
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1008
    const/4 v2, 0x0

    aget-byte v1, p0, v2

    .line 1009
    .local v1, "max":B
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 1010
    aget-byte v2, p0, v0

    if-le v2, v1, :cond_0

    .line 1011
    aget-byte v1, p0, v0

    .line 1009
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1015
    :cond_1
    return v1
.end method

.method public static max(DDD)D
    .locals 2
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .prologue
    .line 1279
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static max([D)D
    .locals 6
    .param p0, "array"    # [D

    .prologue
    .line 1029
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1032
    const/4 v1, 0x0

    aget-wide v2, p0, v1

    .line 1033
    .local v2, "max":D
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 1034
    aget-wide v4, p0, v0

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1035
    const-wide/high16 v2, 0x7ff8000000000000L    # Double.NaN

    .line 1042
    .end local v2    # "max":D
    :cond_0
    return-wide v2

    .line 1037
    .restart local v2    # "max":D
    :cond_1
    aget-wide v4, p0, v0

    cmpl-double v1, v4, v2

    if-lez v1, :cond_2

    .line 1038
    aget-wide v2, p0, v0

    .line 1033
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static max(FFF)F
    .locals 1
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F

    .prologue
    .line 1295
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public static max([F)F
    .locals 3
    .param p0, "array"    # [F

    .prologue
    .line 1056
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 1059
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 1060
    .local v1, "max":F
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 1061
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1062
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 1069
    .end local v1    # "max":F
    :cond_0
    return v1

    .line 1064
    .restart local v1    # "max":F
    :cond_1
    aget v2, p0, v0

    cmpl-float v2, v2, v1

    if-lez v2, :cond_2

    .line 1065
    aget v1, p0, v0

    .line 1060
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static max(III)I
    .locals 0
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .prologue
    .line 1221
    if-le p1, p0, :cond_0

    .line 1222
    move p0, p1

    .line 1224
    :cond_0
    if-le p2, p0, :cond_1

    .line 1225
    move p0, p2

    .line 1227
    :cond_1
    return p0
.end method

.method public static max([I)I
    .locals 3
    .param p0, "array"    # [I

    .prologue
    .line 959
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 962
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 963
    .local v1, "max":I
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 964
    aget v2, p0, v0

    if-le v2, v1, :cond_0

    .line 965
    aget v1, p0, v0

    .line 963
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 969
    :cond_1
    return v1
.end method

.method public static max(JJJ)J
    .locals 2
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .prologue
    .line 1203
    cmp-long v0, p2, p0

    if-lez v0, :cond_0

    .line 1204
    move-wide p0, p2

    .line 1206
    :cond_0
    cmp-long v0, p4, p0

    if-lez v0, :cond_1

    .line 1207
    move-wide p0, p4

    .line 1209
    :cond_1
    return-wide p0
.end method

.method public static max([J)J
    .locals 6
    .param p0, "array"    # [J

    .prologue
    .line 936
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 939
    const/4 v1, 0x0

    aget-wide v2, p0, v1

    .line 940
    .local v2, "max":J
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 941
    aget-wide v4, p0, v0

    cmp-long v1, v4, v2

    if-lez v1, :cond_0

    .line 942
    aget-wide v2, p0, v0

    .line 940
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 946
    :cond_1
    return-wide v2
.end method

.method public static max(SSS)S
    .locals 0
    .param p0, "a"    # S
    .param p1, "b"    # S
    .param p2, "c"    # S

    .prologue
    .line 1239
    if-le p1, p0, :cond_0

    .line 1240
    move p0, p1

    .line 1242
    :cond_0
    if-le p2, p0, :cond_1

    .line 1243
    move p0, p2

    .line 1245
    :cond_1
    return p0
.end method

.method public static max([S)S
    .locals 3
    .param p0, "array"    # [S

    .prologue
    .line 982
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 985
    const/4 v2, 0x0

    aget-short v1, p0, v2

    .line 986
    .local v1, "max":S
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 987
    aget-short v2, p0, v0

    if-le v2, v1, :cond_0

    .line 988
    aget-short v1, p0, v0

    .line 986
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 992
    :cond_1
    return v1
.end method

.method public static min(BBB)B
    .locals 0
    .param p0, "a"    # B
    .param p1, "b"    # B
    .param p2, "c"    # B

    .prologue
    .line 1151
    if-ge p1, p0, :cond_0

    .line 1152
    move p0, p1

    .line 1154
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1155
    move p0, p2

    .line 1157
    :cond_1
    return p0
.end method

.method public static min([B)B
    .locals 3
    .param p0, "array"    # [B

    .prologue
    .line 857
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 860
    const/4 v2, 0x0

    aget-byte v1, p0, v2

    .line 861
    .local v1, "min":B
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 862
    aget-byte v2, p0, v0

    if-ge v2, v1, :cond_0

    .line 863
    aget-byte v1, p0, v0

    .line 861
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 867
    :cond_1
    return v1
.end method

.method public static min(DDD)D
    .locals 2
    .param p0, "a"    # D
    .param p2, "b"    # D
    .param p4, "c"    # D

    .prologue
    .line 1173
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static min([D)D
    .locals 6
    .param p0, "array"    # [D

    .prologue
    .line 881
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 884
    const/4 v1, 0x0

    aget-wide v2, p0, v1

    .line 885
    .local v2, "min":D
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    .line 886
    aget-wide v4, p0, v0

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 887
    const-wide/high16 v2, 0x7ff8000000000000L    # Double.NaN

    .line 894
    .end local v2    # "min":D
    :cond_0
    return-wide v2

    .line 889
    .restart local v2    # "min":D
    :cond_1
    aget-wide v4, p0, v0

    cmpg-double v1, v4, v2

    if-gez v1, :cond_2

    .line 890
    aget-wide v2, p0, v0

    .line 885
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static min(FFF)F
    .locals 1
    .param p0, "a"    # F
    .param p1, "b"    # F
    .param p2, "c"    # F

    .prologue
    .line 1189
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public static min([F)F
    .locals 3
    .param p0, "array"    # [F

    .prologue
    .line 908
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 911
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 912
    .local v1, "min":F
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 913
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 914
    const/high16 v1, 0x7fc00000    # Float.NaN

    .line 921
    .end local v1    # "min":F
    :cond_0
    return v1

    .line 916
    .restart local v1    # "min":F
    :cond_1
    aget v2, p0, v0

    cmpg-float v2, v2, v1

    if-gez v2, :cond_2

    .line 917
    aget v1, p0, v0

    .line 912
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static min(III)I
    .locals 0
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I

    .prologue
    .line 1115
    if-ge p1, p0, :cond_0

    .line 1116
    move p0, p1

    .line 1118
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1119
    move p0, p2

    .line 1121
    :cond_1
    return p0
.end method

.method public static min([I)I
    .locals 3
    .param p0, "array"    # [I

    .prologue
    .line 811
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 814
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 815
    .local v1, "min":I
    const/4 v0, 0x1

    .local v0, "j":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 816
    aget v2, p0, v0

    if-ge v2, v1, :cond_0

    .line 817
    aget v1, p0, v0

    .line 815
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 821
    :cond_1
    return v1
.end method

.method public static min(JJJ)J
    .locals 2
    .param p0, "a"    # J
    .param p2, "b"    # J
    .param p4, "c"    # J

    .prologue
    .line 1097
    cmp-long v0, p2, p0

    if-gez v0, :cond_0

    .line 1098
    move-wide p0, p2

    .line 1100
    :cond_0
    cmp-long v0, p4, p0

    if-gez v0, :cond_1

    .line 1101
    move-wide p0, p4

    .line 1103
    :cond_1
    return-wide p0
.end method

.method public static min([J)J
    .locals 6
    .param p0, "array"    # [J

    .prologue
    .line 788
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 791
    const/4 v1, 0x0

    aget-wide v2, p0, v1

    .line 792
    .local v2, "min":J
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 793
    aget-wide v4, p0, v0

    cmp-long v1, v4, v2

    if-gez v1, :cond_0

    .line 794
    aget-wide v2, p0, v0

    .line 792
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 798
    :cond_1
    return-wide v2
.end method

.method public static min(SSS)S
    .locals 0
    .param p0, "a"    # S
    .param p1, "b"    # S
    .param p2, "c"    # S

    .prologue
    .line 1133
    if-ge p1, p0, :cond_0

    .line 1134
    move p0, p1

    .line 1136
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1137
    move p0, p2

    .line 1139
    :cond_1
    return p0
.end method

.method public static min([S)S
    .locals 3
    .param p0, "array"    # [S

    .prologue
    .line 834
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->validateArray(Ljava/lang/Object;)V

    .line 837
    const/4 v2, 0x0

    aget-short v1, p0, v2

    .line 838
    .local v1, "min":S
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 839
    aget-short v2, p0, v0

    if-ge v2, v1, :cond_0

    .line 840
    aget-short v1, p0, v0

    .line 838
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 844
    :cond_1
    return v1
.end method

.method public static toByte(Ljava/lang/String;)B
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 303
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toByte(Ljava/lang/String;B)B

    move-result v0

    return v0
.end method

.method public static toByte(Ljava/lang/String;B)B
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # B

    .prologue
    .line 324
    if-nez p0, :cond_0

    .line 330
    .end local p1    # "defaultValue":B
    :goto_0
    return p1

    .line 328
    .restart local p1    # "defaultValue":B
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    goto :goto_0

    .line 329
    :catch_0
    move-exception v0

    .line 330
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toDouble(Ljava/lang/String;)D
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 251
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/math/NumberUtils;->toDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static toDouble(Ljava/lang/String;D)D
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # D

    .prologue
    .line 274
    if-nez p0, :cond_0

    .line 280
    .end local p1    # "defaultValue":D
    :goto_0
    return-wide p1

    .line 278
    .restart local p1    # "defaultValue":D
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide p1

    goto :goto_0

    .line 279
    :catch_0
    move-exception v0

    .line 280
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toFloat(Ljava/lang/String;)F
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 199
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toFloat(Ljava/lang/String;F)F

    move-result v0

    return v0
.end method

.method public static toFloat(Ljava/lang/String;F)F
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # F

    .prologue
    .line 222
    if-nez p0, :cond_0

    .line 228
    .end local p1    # "defaultValue":F
    :goto_0
    return p1

    .line 226
    .restart local p1    # "defaultValue":F
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    goto :goto_0

    .line 227
    :catch_0
    move-exception v0

    .line 228
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toInt(Ljava/lang/String;)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 100
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static toInt(Ljava/lang/String;I)I
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # I

    .prologue
    .line 121
    if-nez p0, :cond_0

    .line 127
    .end local p1    # "defaultValue":I
    :goto_0
    return p1

    .line 125
    .restart local p1    # "defaultValue":I
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    goto :goto_0

    .line 126
    :catch_0
    move-exception v0

    .line 127
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toLong(Ljava/lang/String;)J
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 149
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/math/NumberUtils;->toLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static toLong(Ljava/lang/String;J)J
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # J

    .prologue
    .line 170
    if-nez p0, :cond_0

    .line 176
    .end local p1    # "defaultValue":J
    :goto_0
    return-wide p1

    .line 174
    .restart local p1    # "defaultValue":J
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide p1

    goto :goto_0

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toShort(Ljava/lang/String;)S
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 352
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toShort(Ljava/lang/String;S)S

    move-result v0

    return v0
.end method

.method public static toShort(Ljava/lang/String;S)S
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultValue"    # S

    .prologue
    .line 373
    if-nez p0, :cond_0

    .line 379
    .end local p1    # "defaultValue":S
    :goto_0
    return p1

    .line 377
    .restart local p1    # "defaultValue":S
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    goto :goto_0

    .line 378
    :catch_0
    move-exception v0

    .line 379
    .local v0, "nfe":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method private static validateArray(Ljava/lang/Object;)V
    .locals 2
    .param p0, "array"    # Ljava/lang/Object;

    .prologue
    .line 1079
    if-nez p0, :cond_0

    .line 1080
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1081
    :cond_0
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    if-nez v0, :cond_1

    .line 1082
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Array cannot be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1084
    :cond_1
    return-void
.end method
