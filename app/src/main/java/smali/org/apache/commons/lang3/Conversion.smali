.class public Lorg/apache/commons/lang3/Conversion;
.super Ljava/lang/Object;
.source "Conversion.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    const-class v0, Lorg/apache/commons/lang3/Conversion;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/apache/commons/lang3/Conversion;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static binaryBeMsb0ToHexDigit([Z)C
    .locals 1
    .param p0, "src"    # [Z

    .prologue
    .line 492
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/Conversion;->binaryBeMsb0ToHexDigit([ZI)C

    move-result v0

    return v0
.end method

.method public static binaryBeMsb0ToHexDigit([ZI)C
    .locals 8
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I

    .prologue
    const/4 v4, 0x4

    const/4 v7, 0x1

    const/4 v6, 0x2

    const/4 v5, 0x3

    .line 512
    array-length v3, p0

    if-nez v3, :cond_0

    .line 513
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "Cannot convert an empty array."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 515
    :cond_0
    array-length v3, p0

    add-int/lit8 v3, v3, -0x1

    sub-int v0, v3, p1

    .line 516
    .local v0, "beSrcPos":I
    add-int/lit8 v3, v0, 0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 517
    .local v2, "srcLen":I
    new-array v1, v4, [Z

    .line 518
    .local v1, "paddedSrc":[Z
    add-int/lit8 v3, v0, 0x1

    sub-int/2addr v3, v2

    rsub-int/lit8 v4, v2, 0x4

    invoke-static {p0, v3, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 519
    move-object p0, v1

    .line 520
    const/4 p1, 0x0

    .line 521
    aget-boolean v3, p0, p1

    if-eqz v3, :cond_8

    .line 522
    array-length v3, p0

    if-le v3, v7, :cond_4

    aget-boolean v3, p0, v7

    if-eqz v3, :cond_4

    .line 523
    array-length v3, p0

    if-le v3, v6, :cond_2

    aget-boolean v3, p0, v6

    if-eqz v3, :cond_2

    .line 524
    array-length v3, p0

    if-le v3, v5, :cond_1

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_1

    .line 525
    const/16 v3, 0x66

    .line 577
    :goto_0
    return v3

    .line 527
    :cond_1
    const/16 v3, 0x65

    goto :goto_0

    .line 530
    :cond_2
    array-length v3, p0

    if-le v3, v5, :cond_3

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_3

    .line 531
    const/16 v3, 0x64

    goto :goto_0

    .line 533
    :cond_3
    const/16 v3, 0x63

    goto :goto_0

    .line 537
    :cond_4
    array-length v3, p0

    if-le v3, v6, :cond_6

    aget-boolean v3, p0, v6

    if-eqz v3, :cond_6

    .line 538
    array-length v3, p0

    if-le v3, v5, :cond_5

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_5

    .line 539
    const/16 v3, 0x62

    goto :goto_0

    .line 541
    :cond_5
    const/16 v3, 0x61

    goto :goto_0

    .line 544
    :cond_6
    array-length v3, p0

    if-le v3, v5, :cond_7

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_7

    .line 545
    const/16 v3, 0x39

    goto :goto_0

    .line 547
    :cond_7
    const/16 v3, 0x38

    goto :goto_0

    .line 552
    :cond_8
    array-length v3, p0

    if-le v3, v7, :cond_c

    aget-boolean v3, p0, v7

    if-eqz v3, :cond_c

    .line 553
    array-length v3, p0

    if-le v3, v6, :cond_a

    aget-boolean v3, p0, v6

    if-eqz v3, :cond_a

    .line 554
    array-length v3, p0

    if-le v3, v5, :cond_9

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_9

    .line 555
    const/16 v3, 0x37

    goto :goto_0

    .line 557
    :cond_9
    const/16 v3, 0x36

    goto :goto_0

    .line 560
    :cond_a
    array-length v3, p0

    if-le v3, v5, :cond_b

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_b

    .line 561
    const/16 v3, 0x35

    goto :goto_0

    .line 563
    :cond_b
    const/16 v3, 0x34

    goto :goto_0

    .line 567
    :cond_c
    array-length v3, p0

    if-le v3, v6, :cond_e

    aget-boolean v3, p0, v6

    if-eqz v3, :cond_e

    .line 568
    array-length v3, p0

    if-le v3, v5, :cond_d

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_d

    .line 569
    const/16 v3, 0x33

    goto :goto_0

    .line 571
    :cond_d
    const/16 v3, 0x32

    goto :goto_0

    .line 574
    :cond_e
    array-length v3, p0

    if-le v3, v5, :cond_f

    aget-boolean v3, p0, v5

    if-eqz v3, :cond_f

    .line 575
    const/16 v3, 0x31

    goto :goto_0

    .line 577
    :cond_f
    const/16 v3, 0x30

    goto :goto_0
.end method

.method public static binaryToByte([ZIBII)B
    .locals 8
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # B
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    const/4 v6, 0x1

    .line 1152
    array-length v5, p0

    if-nez v5, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p4, :cond_2

    .line 1166
    .end local p2    # "dstInit":B
    :cond_1
    :goto_0
    return p2

    .line 1155
    .restart local p2    # "dstInit":B
    :cond_2
    add-int/lit8 v5, p4, -0x1

    add-int/2addr v5, p3

    const/16 v7, 0x8

    if-lt v5, v7, :cond_3

    .line 1156
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "nBools-1+dstPos is greather or equal to than 8"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1158
    :cond_3
    move v3, p2

    .line 1159
    .local v3, "out":B
    const/4 v4, 0x0

    .line 1160
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_5

    .line 1161
    mul-int/lit8 v5, v1, 0x1

    add-int v4, v5, p3

    .line 1162
    add-int v5, v1, p1

    aget-boolean v5, p0, v5

    if-eqz v5, :cond_4

    move v5, v6

    :goto_2
    shl-int v0, v5, v4

    .line 1163
    .local v0, "bits":I
    shl-int v2, v6, v4

    .line 1164
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-byte v3, v5

    .line 1160
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1162
    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    :cond_5
    move p2, v3

    .line 1166
    goto :goto_0
.end method

.method public static binaryToHexDigit([Z)C
    .locals 1
    .param p0, "src"    # [Z

    .prologue
    .line 282
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/Conversion;->binaryToHexDigit([ZI)C

    move-result v0

    return v0
.end method

.method public static binaryToHexDigit([ZI)C
    .locals 2
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I

    .prologue
    .line 301
    array-length v0, p0

    if-nez v0, :cond_0

    .line 302
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Cannot convert an empty array."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 304
    :cond_0
    array-length v0, p0

    add-int/lit8 v1, p1, 0x3

    if-le v0, v1, :cond_8

    add-int/lit8 v0, p1, 0x3

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_8

    .line 305
    array-length v0, p0

    add-int/lit8 v1, p1, 0x2

    if-le v0, v1, :cond_4

    add-int/lit8 v0, p1, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_4

    .line 306
    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-le v0, v1, :cond_2

    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_2

    .line 307
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_1

    .line 308
    const/16 v0, 0x66

    .line 360
    :goto_0
    return v0

    .line 310
    :cond_1
    const/16 v0, 0x65

    goto :goto_0

    .line 313
    :cond_2
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_3

    .line 314
    const/16 v0, 0x64

    goto :goto_0

    .line 316
    :cond_3
    const/16 v0, 0x63

    goto :goto_0

    .line 320
    :cond_4
    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-le v0, v1, :cond_6

    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_6

    .line 321
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_5

    .line 322
    const/16 v0, 0x62

    goto :goto_0

    .line 324
    :cond_5
    const/16 v0, 0x61

    goto :goto_0

    .line 327
    :cond_6
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_7

    .line 328
    const/16 v0, 0x39

    goto :goto_0

    .line 330
    :cond_7
    const/16 v0, 0x38

    goto :goto_0

    .line 335
    :cond_8
    array-length v0, p0

    add-int/lit8 v1, p1, 0x2

    if-le v0, v1, :cond_c

    add-int/lit8 v0, p1, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_c

    .line 336
    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-le v0, v1, :cond_a

    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_a

    .line 337
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_9

    .line 338
    const/16 v0, 0x37

    goto :goto_0

    .line 340
    :cond_9
    const/16 v0, 0x36

    goto :goto_0

    .line 343
    :cond_a
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_b

    .line 344
    const/16 v0, 0x35

    goto :goto_0

    .line 346
    :cond_b
    const/16 v0, 0x34

    goto :goto_0

    .line 350
    :cond_c
    array-length v0, p0

    add-int/lit8 v1, p1, 0x1

    if-le v0, v1, :cond_e

    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_e

    .line 351
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_d

    .line 352
    const/16 v0, 0x33

    goto :goto_0

    .line 354
    :cond_d
    const/16 v0, 0x32

    goto :goto_0

    .line 357
    :cond_e
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_f

    .line 358
    const/16 v0, 0x31

    goto :goto_0

    .line 360
    :cond_f
    const/16 v0, 0x30

    goto :goto_0
.end method

.method public static binaryToHexDigitMsb0_4bits([Z)C
    .locals 1
    .param p0, "src"    # [Z

    .prologue
    .line 383
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/Conversion;->binaryToHexDigitMsb0_4bits([ZI)C

    move-result v0

    return v0
.end method

.method public static binaryToHexDigitMsb0_4bits([ZI)C
    .locals 3
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I

    .prologue
    .line 404
    array-length v0, p0

    const/16 v1, 0x8

    if-le v0, v1, :cond_0

    .line 405
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "src.length>8: src.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 407
    :cond_0
    array-length v0, p0

    sub-int/2addr v0, p1

    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    .line 408
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "src.length-srcPos<4: src.length="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", srcPos="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 413
    :cond_1
    add-int/lit8 v0, p1, 0x3

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_9

    .line 414
    add-int/lit8 v0, p1, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_5

    .line 415
    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_3

    .line 416
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_2

    .line 417
    const/16 v0, 0x66

    .line 469
    :goto_0
    return v0

    .line 419
    :cond_2
    const/16 v0, 0x37

    goto :goto_0

    .line 422
    :cond_3
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_4

    .line 423
    const/16 v0, 0x62

    goto :goto_0

    .line 425
    :cond_4
    const/16 v0, 0x33

    goto :goto_0

    .line 429
    :cond_5
    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_7

    .line 430
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_6

    .line 431
    const/16 v0, 0x64

    goto :goto_0

    .line 433
    :cond_6
    const/16 v0, 0x35

    goto :goto_0

    .line 436
    :cond_7
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_8

    .line 437
    const/16 v0, 0x39

    goto :goto_0

    .line 439
    :cond_8
    const/16 v0, 0x31

    goto :goto_0

    .line 444
    :cond_9
    add-int/lit8 v0, p1, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_d

    .line 445
    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_b

    .line 446
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_a

    .line 447
    const/16 v0, 0x65

    goto :goto_0

    .line 449
    :cond_a
    const/16 v0, 0x36

    goto :goto_0

    .line 452
    :cond_b
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_c

    .line 453
    const/16 v0, 0x61

    goto :goto_0

    .line 455
    :cond_c
    const/16 v0, 0x32

    goto :goto_0

    .line 459
    :cond_d
    add-int/lit8 v0, p1, 0x1

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_f

    .line 460
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_e

    .line 461
    const/16 v0, 0x63

    goto :goto_0

    .line 463
    :cond_e
    const/16 v0, 0x34

    goto :goto_0

    .line 466
    :cond_f
    aget-boolean v0, p0, p1

    if-eqz v0, :cond_10

    .line 467
    const/16 v0, 0x38

    goto :goto_0

    .line 469
    :cond_10
    const/16 v0, 0x30

    goto :goto_0
.end method

.method public static binaryToInt([ZIIII)I
    .locals 8
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # I
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    const/4 v6, 0x1

    .line 1078
    array-length v5, p0

    if-nez v5, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p4, :cond_2

    .line 1093
    .end local p2    # "dstInit":I
    :cond_1
    :goto_0
    return p2

    .line 1081
    .restart local p2    # "dstInit":I
    :cond_2
    add-int/lit8 v5, p4, -0x1

    add-int/2addr v5, p3

    const/16 v7, 0x20

    if-lt v5, v7, :cond_3

    .line 1082
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "nBools-1+dstPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1085
    :cond_3
    move v3, p2

    .line 1086
    .local v3, "out":I
    const/4 v4, 0x0

    .line 1087
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_5

    .line 1088
    mul-int/lit8 v5, v1, 0x1

    add-int v4, v5, p3

    .line 1089
    add-int v5, v1, p1

    aget-boolean v5, p0, v5

    if-eqz v5, :cond_4

    move v5, v6

    :goto_2
    shl-int v0, v5, v4

    .line 1090
    .local v0, "bits":I
    shl-int v2, v6, v4

    .line 1091
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int v3, v5, v0

    .line 1087
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1089
    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    :cond_5
    move p2, v3

    .line 1093
    goto :goto_0
.end method

.method public static binaryToLong([ZIJII)J
    .locals 10
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nBools"    # I

    .prologue
    .line 1042
    array-length v8, p0

    if-nez v8, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p5, :cond_2

    .line 1057
    .end local p2    # "dstInit":J
    :cond_1
    :goto_0
    return-wide p2

    .line 1045
    .restart local p2    # "dstInit":J
    :cond_2
    add-int/lit8 v8, p5, -0x1

    add-int/2addr v8, p4

    const/16 v9, 0x40

    if-lt v8, v9, :cond_3

    .line 1046
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v9, "nBools-1+dstPos is greather or equal to than 64"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1049
    :cond_3
    move-wide v6, p2

    .line 1050
    .local v6, "out":J
    const/4 v3, 0x0

    .line 1051
    .local v3, "shift":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, p5, :cond_5

    .line 1052
    mul-int/lit8 v8, v2, 0x1

    add-int v3, v8, p4

    .line 1053
    add-int v8, v2, p1

    aget-boolean v8, p0, v8

    if-eqz v8, :cond_4

    const-wide/16 v8, 0x1

    :goto_2
    shl-long v0, v8, v3

    .line 1054
    .local v0, "bits":J
    const-wide/16 v8, 0x1

    shl-long v4, v8, v3

    .line 1055
    .local v4, "mask":J
    const-wide/16 v8, -0x1

    xor-long/2addr v8, v4

    and-long/2addr v8, v6

    or-long v6, v8, v0

    .line 1051
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1053
    .end local v0    # "bits":J
    .end local v4    # "mask":J
    :cond_4
    const-wide/16 v8, 0x0

    goto :goto_2

    :cond_5
    move-wide p2, v6

    .line 1057
    goto :goto_0
.end method

.method public static binaryToShort([ZISII)S
    .locals 8
    .param p0, "src"    # [Z
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # S
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    const/4 v6, 0x1

    .line 1115
    array-length v5, p0

    if-nez v5, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p4, :cond_2

    .line 1130
    .end local p2    # "dstInit":S
    :cond_1
    :goto_0
    return p2

    .line 1118
    .restart local p2    # "dstInit":S
    :cond_2
    add-int/lit8 v5, p4, -0x1

    add-int/2addr v5, p3

    const/16 v7, 0x10

    if-lt v5, v7, :cond_3

    .line 1119
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "nBools-1+dstPos is greather or equal to than 16"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1122
    :cond_3
    move v3, p2

    .line 1123
    .local v3, "out":S
    const/4 v4, 0x0

    .line 1124
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_5

    .line 1125
    mul-int/lit8 v5, v1, 0x1

    add-int v4, v5, p3

    .line 1126
    add-int v5, v1, p1

    aget-boolean v5, p0, v5

    if-eqz v5, :cond_4

    move v5, v6

    :goto_2
    shl-int v0, v5, v4

    .line 1127
    .local v0, "bits":I
    shl-int v2, v6, v4

    .line 1128
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-short v3, v5

    .line 1124
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1126
    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    :cond_5
    move p2, v3

    .line 1130
    goto :goto_0
.end method

.method public static byteArrayToInt([BIIII)I
    .locals 7
    .param p0, "src"    # [B
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # I
    .param p3, "dstPos"    # I
    .param p4, "nBytes"    # I

    .prologue
    .line 832
    array-length v5, p0

    if-nez v5, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p4, :cond_2

    .line 847
    .end local p2    # "dstInit":I
    :cond_1
    :goto_0
    return p2

    .line 835
    .restart local p2    # "dstInit":I
    :cond_2
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x8

    add-int/2addr v5, p3

    const/16 v6, 0x20

    if-lt v5, v6, :cond_3

    .line 836
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nBytes-1)*8+dstPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 839
    :cond_3
    move v3, p2

    .line 840
    .local v3, "out":I
    const/4 v4, 0x0

    .line 841
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_4

    .line 842
    mul-int/lit8 v5, v1, 0x8

    add-int v4, v5, p3

    .line 843
    add-int v5, v1, p1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int v0, v5, v4

    .line 844
    .local v0, "bits":I
    const/16 v5, 0xff

    shl-int v2, v5, v4

    .line 845
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int v3, v5, v0

    .line 841
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_4
    move p2, v3

    .line 847
    goto :goto_0
.end method

.method public static byteArrayToLong([BIJII)J
    .locals 14
    .param p0, "src"    # [B
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nBytes"    # I

    .prologue
    .line 796
    array-length v10, p0

    if-nez v10, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p5, :cond_2

    .line 811
    .end local p2    # "dstInit":J
    :cond_1
    :goto_0
    return-wide p2

    .line 799
    .restart local p2    # "dstInit":J
    :cond_2
    add-int/lit8 v10, p5, -0x1

    mul-int/lit8 v10, v10, 0x8

    add-int v10, v10, p4

    const/16 v11, 0x40

    if-lt v10, v11, :cond_3

    .line 800
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "(nBytes-1)*8+dstPos is greather or equal to than 64"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 803
    :cond_3
    move-wide/from16 v8, p2

    .line 804
    .local v8, "out":J
    const/4 v5, 0x0

    .line 805
    .local v5, "shift":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    move/from16 v0, p5

    if-ge v4, v0, :cond_4

    .line 806
    mul-int/lit8 v10, v4, 0x8

    add-int v5, v10, p4

    .line 807
    const-wide/16 v10, 0xff

    add-int v12, v4, p1

    aget-byte v12, p0, v12

    int-to-long v12, v12

    and-long/2addr v10, v12

    shl-long v2, v10, v5

    .line 808
    .local v2, "bits":J
    const-wide/16 v10, 0xff

    shl-long v6, v10, v5

    .line 809
    .local v6, "mask":J
    const-wide/16 v10, -0x1

    xor-long/2addr v10, v6

    and-long/2addr v10, v8

    or-long v8, v10, v2

    .line 805
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v2    # "bits":J
    .end local v6    # "mask":J
    :cond_4
    move-wide/from16 p2, v8

    .line 811
    goto :goto_0
.end method

.method public static byteArrayToShort([BISII)S
    .locals 7
    .param p0, "src"    # [B
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # S
    .param p3, "dstPos"    # I
    .param p4, "nBytes"    # I

    .prologue
    .line 869
    array-length v5, p0

    if-nez v5, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p4, :cond_2

    .line 884
    .end local p2    # "dstInit":S
    :cond_1
    :goto_0
    return p2

    .line 872
    .restart local p2    # "dstInit":S
    :cond_2
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x8

    add-int/2addr v5, p3

    const/16 v6, 0x10

    if-lt v5, v6, :cond_3

    .line 873
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nBytes-1)*8+dstPos is greather or equal to than 16"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 876
    :cond_3
    move v3, p2

    .line 877
    .local v3, "out":S
    const/4 v4, 0x0

    .line 878
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_4

    .line 879
    mul-int/lit8 v5, v1, 0x8

    add-int v4, v5, p3

    .line 880
    add-int v5, v1, p1

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    shl-int v0, v5, v4

    .line 881
    .local v0, "bits":I
    const/16 v5, 0xff

    shl-int v2, v5, v4

    .line 882
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-short v3, v5

    .line 878
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_4
    move p2, v3

    .line 884
    goto :goto_0
.end method

.method public static byteArrayToUuid([BI)Ljava/util/UUID;
    .locals 10
    .param p0, "src"    # [B
    .param p1, "srcPos"    # I

    .prologue
    const-wide/16 v2, 0x0

    const/16 v5, 0x8

    const/4 v4, 0x0

    .line 1711
    array-length v0, p0

    sub-int/2addr v0, p1

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 1712
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Need at least 16 bytes for UUID"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1714
    :cond_0
    new-instance v6, Ljava/util/UUID;

    move-object v0, p0

    move v1, p1

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/Conversion;->byteArrayToLong([BIJII)J

    move-result-wide v8

    add-int/lit8 v1, p1, 0x8

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/Conversion;->byteArrayToLong([BIJII)J

    move-result-wide v0

    invoke-direct {v6, v8, v9, v0, v1}, Ljava/util/UUID;-><init>(JJ)V

    return-object v6
.end method

.method public static byteToBinary(BI[ZII)[Z
    .locals 4
    .param p0, "src"    # B
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [Z
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    .line 1653
    if-nez p4, :cond_1

    .line 1664
    :cond_0
    return-object p2

    .line 1656
    :cond_1
    add-int/lit8 v2, p4, -0x1

    add-int/2addr v2, p1

    const/16 v3, 0x8

    if-lt v2, v3, :cond_2

    .line 1657
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "nBools-1+srcPos is greather or equal to than 8"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1659
    :cond_2
    const/4 v1, 0x0

    .line 1660
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_0

    .line 1661
    mul-int/lit8 v2, v0, 0x1

    add-int v1, v2, p1

    .line 1662
    add-int v3, p3, v0

    shr-int v2, p0, v1

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    :goto_1
    aput-boolean v2, p2, v3

    .line 1660
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1662
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static byteToHex(BILjava/lang/String;II)Ljava/lang/String;
    .locals 7
    .param p0, "src"    # B
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # Ljava/lang/String;
    .param p3, "dstPos"    # I
    .param p4, "nHexs"    # I

    .prologue
    .line 1508
    if-nez p4, :cond_0

    .line 1528
    .end local p2    # "dstInit":Ljava/lang/String;
    :goto_0
    return-object p2

    .line 1511
    .restart local p2    # "dstInit":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p1

    const/16 v6, 0x8

    if-lt v5, v6, :cond_1

    .line 1512
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nHexs-1)*4+srcPos is greather or equal to than 8"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1515
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1516
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1517
    .local v4, "shift":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1518
    .local v0, "append":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, p4, :cond_3

    .line 1519
    mul-int/lit8 v5, v2, 0x4

    add-int v4, v5, p1

    .line 1520
    shr-int v5, p0, v4

    and-int/lit8 v1, v5, 0xf

    .line 1521
    .local v1, "bits":I
    add-int v5, p3, v2

    if-ne v5, v0, :cond_2

    .line 1522
    add-int/lit8 v0, v0, 0x1

    .line 1523
    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1518
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1525
    :cond_2
    add-int v5, p3, v2

    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_2

    .line 1528
    .end local v1    # "bits":I
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method public static hexDigitMsb0ToBinary(C)[Z
    .locals 3
    .param p0, "hexDigit"    # C

    .prologue
    const/4 v0, 0x4

    .line 221
    sparse-switch p0, :sswitch_data_0

    .line 261
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cannot interpret \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' as a hexadecimal digit"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 223
    :sswitch_0
    new-array v0, v0, [Z

    fill-array-data v0, :array_0

    .line 259
    :goto_0
    return-object v0

    .line 225
    :sswitch_1
    new-array v0, v0, [Z

    fill-array-data v0, :array_1

    goto :goto_0

    .line 227
    :sswitch_2
    new-array v0, v0, [Z

    fill-array-data v0, :array_2

    goto :goto_0

    .line 229
    :sswitch_3
    new-array v0, v0, [Z

    fill-array-data v0, :array_3

    goto :goto_0

    .line 231
    :sswitch_4
    new-array v0, v0, [Z

    fill-array-data v0, :array_4

    goto :goto_0

    .line 233
    :sswitch_5
    new-array v0, v0, [Z

    fill-array-data v0, :array_5

    goto :goto_0

    .line 235
    :sswitch_6
    new-array v0, v0, [Z

    fill-array-data v0, :array_6

    goto :goto_0

    .line 237
    :sswitch_7
    new-array v0, v0, [Z

    fill-array-data v0, :array_7

    goto :goto_0

    .line 239
    :sswitch_8
    new-array v0, v0, [Z

    fill-array-data v0, :array_8

    goto :goto_0

    .line 241
    :sswitch_9
    new-array v0, v0, [Z

    fill-array-data v0, :array_9

    goto :goto_0

    .line 244
    :sswitch_a
    new-array v0, v0, [Z

    fill-array-data v0, :array_a

    goto :goto_0

    .line 247
    :sswitch_b
    new-array v0, v0, [Z

    fill-array-data v0, :array_b

    goto :goto_0

    .line 250
    :sswitch_c
    new-array v0, v0, [Z

    fill-array-data v0, :array_c

    goto :goto_0

    .line 253
    :sswitch_d
    new-array v0, v0, [Z

    fill-array-data v0, :array_d

    goto :goto_0

    .line 256
    :sswitch_e
    new-array v0, v0, [Z

    fill-array-data v0, :array_e

    goto :goto_0

    .line 259
    :sswitch_f
    new-array v0, v0, [Z

    fill-array-data v0, :array_f

    goto :goto_0

    .line 221
    nop

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_0
        0x31 -> :sswitch_1
        0x32 -> :sswitch_2
        0x33 -> :sswitch_3
        0x34 -> :sswitch_4
        0x35 -> :sswitch_5
        0x36 -> :sswitch_6
        0x37 -> :sswitch_7
        0x38 -> :sswitch_8
        0x39 -> :sswitch_9
        0x41 -> :sswitch_a
        0x42 -> :sswitch_b
        0x43 -> :sswitch_c
        0x44 -> :sswitch_d
        0x45 -> :sswitch_e
        0x46 -> :sswitch_f
        0x61 -> :sswitch_a
        0x62 -> :sswitch_b
        0x63 -> :sswitch_c
        0x64 -> :sswitch_d
        0x65 -> :sswitch_e
        0x66 -> :sswitch_f
    .end sparse-switch

    .line 223
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 225
    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 227
    :array_2
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 229
    :array_3
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x1t
    .end array-data

    .line 231
    :array_4
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 233
    :array_5
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x1t
    .end array-data

    .line 235
    :array_6
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 237
    :array_7
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 239
    :array_8
    .array-data 1
        0x1t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 241
    :array_9
    .array-data 1
        0x1t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 244
    :array_a
    .array-data 1
        0x1t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 247
    :array_b
    .array-data 1
        0x1t
        0x0t
        0x1t
        0x1t
    .end array-data

    .line 250
    :array_c
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 253
    :array_d
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x1t
    .end array-data

    .line 256
    :array_e
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 259
    :array_f
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method public static hexDigitMsb0ToInt(C)I
    .locals 3
    .param p0, "hexDigit"    # C

    .prologue
    .line 101
    sparse-switch p0, :sswitch_data_0

    .line 141
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cannot interpret \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' as a hexadecimal digit"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :sswitch_0
    const/4 v0, 0x0

    .line 139
    :goto_0
    return v0

    .line 105
    :sswitch_1
    const/16 v0, 0x8

    goto :goto_0

    .line 107
    :sswitch_2
    const/4 v0, 0x4

    goto :goto_0

    .line 109
    :sswitch_3
    const/16 v0, 0xc

    goto :goto_0

    .line 111
    :sswitch_4
    const/4 v0, 0x2

    goto :goto_0

    .line 113
    :sswitch_5
    const/16 v0, 0xa

    goto :goto_0

    .line 115
    :sswitch_6
    const/4 v0, 0x6

    goto :goto_0

    .line 117
    :sswitch_7
    const/16 v0, 0xe

    goto :goto_0

    .line 119
    :sswitch_8
    const/4 v0, 0x1

    goto :goto_0

    .line 121
    :sswitch_9
    const/16 v0, 0x9

    goto :goto_0

    .line 124
    :sswitch_a
    const/4 v0, 0x5

    goto :goto_0

    .line 127
    :sswitch_b
    const/16 v0, 0xd

    goto :goto_0

    .line 130
    :sswitch_c
    const/4 v0, 0x3

    goto :goto_0

    .line 133
    :sswitch_d
    const/16 v0, 0xb

    goto :goto_0

    .line 136
    :sswitch_e
    const/4 v0, 0x7

    goto :goto_0

    .line 139
    :sswitch_f
    const/16 v0, 0xf

    goto :goto_0

    .line 101
    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_0
        0x31 -> :sswitch_1
        0x32 -> :sswitch_2
        0x33 -> :sswitch_3
        0x34 -> :sswitch_4
        0x35 -> :sswitch_5
        0x36 -> :sswitch_6
        0x37 -> :sswitch_7
        0x38 -> :sswitch_8
        0x39 -> :sswitch_9
        0x41 -> :sswitch_a
        0x42 -> :sswitch_b
        0x43 -> :sswitch_c
        0x44 -> :sswitch_d
        0x45 -> :sswitch_e
        0x46 -> :sswitch_f
        0x61 -> :sswitch_a
        0x62 -> :sswitch_b
        0x63 -> :sswitch_c
        0x64 -> :sswitch_d
        0x65 -> :sswitch_e
        0x66 -> :sswitch_f
    .end sparse-switch
.end method

.method public static hexDigitToBinary(C)[Z
    .locals 3
    .param p0, "hexDigit"    # C

    .prologue
    const/4 v0, 0x4

    .line 161
    sparse-switch p0, :sswitch_data_0

    .line 201
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Cannot interpret \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' as a hexadecimal digit"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 163
    :sswitch_0
    new-array v0, v0, [Z

    fill-array-data v0, :array_0

    .line 199
    :goto_0
    return-object v0

    .line 165
    :sswitch_1
    new-array v0, v0, [Z

    fill-array-data v0, :array_1

    goto :goto_0

    .line 167
    :sswitch_2
    new-array v0, v0, [Z

    fill-array-data v0, :array_2

    goto :goto_0

    .line 169
    :sswitch_3
    new-array v0, v0, [Z

    fill-array-data v0, :array_3

    goto :goto_0

    .line 171
    :sswitch_4
    new-array v0, v0, [Z

    fill-array-data v0, :array_4

    goto :goto_0

    .line 173
    :sswitch_5
    new-array v0, v0, [Z

    fill-array-data v0, :array_5

    goto :goto_0

    .line 175
    :sswitch_6
    new-array v0, v0, [Z

    fill-array-data v0, :array_6

    goto :goto_0

    .line 177
    :sswitch_7
    new-array v0, v0, [Z

    fill-array-data v0, :array_7

    goto :goto_0

    .line 179
    :sswitch_8
    new-array v0, v0, [Z

    fill-array-data v0, :array_8

    goto :goto_0

    .line 181
    :sswitch_9
    new-array v0, v0, [Z

    fill-array-data v0, :array_9

    goto :goto_0

    .line 184
    :sswitch_a
    new-array v0, v0, [Z

    fill-array-data v0, :array_a

    goto :goto_0

    .line 187
    :sswitch_b
    new-array v0, v0, [Z

    fill-array-data v0, :array_b

    goto :goto_0

    .line 190
    :sswitch_c
    new-array v0, v0, [Z

    fill-array-data v0, :array_c

    goto :goto_0

    .line 193
    :sswitch_d
    new-array v0, v0, [Z

    fill-array-data v0, :array_d

    goto :goto_0

    .line 196
    :sswitch_e
    new-array v0, v0, [Z

    fill-array-data v0, :array_e

    goto :goto_0

    .line 199
    :sswitch_f
    new-array v0, v0, [Z

    fill-array-data v0, :array_f

    goto :goto_0

    .line 161
    nop

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_0
        0x31 -> :sswitch_1
        0x32 -> :sswitch_2
        0x33 -> :sswitch_3
        0x34 -> :sswitch_4
        0x35 -> :sswitch_5
        0x36 -> :sswitch_6
        0x37 -> :sswitch_7
        0x38 -> :sswitch_8
        0x39 -> :sswitch_9
        0x41 -> :sswitch_a
        0x42 -> :sswitch_b
        0x43 -> :sswitch_c
        0x44 -> :sswitch_d
        0x45 -> :sswitch_e
        0x46 -> :sswitch_f
        0x61 -> :sswitch_a
        0x62 -> :sswitch_b
        0x63 -> :sswitch_c
        0x64 -> :sswitch_d
        0x65 -> :sswitch_e
        0x66 -> :sswitch_f
    .end sparse-switch

    .line 163
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 165
    :array_1
    .array-data 1
        0x1t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 167
    :array_2
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 169
    :array_3
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x0t
    .end array-data

    .line 171
    :array_4
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 173
    :array_5
    .array-data 1
        0x1t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 175
    :array_6
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 177
    :array_7
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x0t
    .end array-data

    .line 179
    :array_8
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 181
    :array_9
    .array-data 1
        0x1t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 184
    :array_a
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x1t
    .end array-data

    .line 187
    :array_b
    .array-data 1
        0x1t
        0x1t
        0x0t
        0x1t
    .end array-data

    .line 190
    :array_c
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x1t
    .end array-data

    .line 193
    :array_d
    .array-data 1
        0x1t
        0x0t
        0x1t
        0x1t
    .end array-data

    .line 196
    :array_e
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 199
    :array_f
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method public static hexDigitToInt(C)I
    .locals 4
    .param p0, "hexDigit"    # C

    .prologue
    .line 79
    const/16 v1, 0x10

    invoke-static {p0, v1}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    .line 80
    .local v0, "digit":I
    if-gez v0, :cond_0

    .line 81
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Cannot interpret \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\' as a hexadecimal digit"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 85
    :cond_0
    return v0
.end method

.method public static hexToByte(Ljava/lang/String;IBII)B
    .locals 7
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # B
    .param p3, "dstPos"    # I
    .param p4, "nHex"    # I

    .prologue
    .line 1005
    if-nez p4, :cond_0

    .line 1020
    .end local p2    # "dstInit":B
    :goto_0
    return p2

    .line 1008
    .restart local p2    # "dstInit":B
    :cond_0
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p3

    const/16 v6, 0x8

    if-lt v5, v6, :cond_1

    .line 1009
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nHexs-1)*4+dstPos is greather or equal to than 8"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1012
    :cond_1
    move v3, p2

    .line 1013
    .local v3, "out":B
    const/4 v4, 0x0

    .line 1014
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_2

    .line 1015
    mul-int/lit8 v5, v1, 0x4

    add-int v4, v5, p3

    .line 1016
    add-int v5, v1, p1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/lang3/Conversion;->hexDigitToInt(C)I

    move-result v5

    and-int/lit8 v5, v5, 0xf

    shl-int v0, v5, v4

    .line 1017
    .local v0, "bits":I
    const/16 v5, 0xf

    shl-int v2, v5, v4

    .line 1018
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-byte v3, v5

    .line 1014
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_2
    move p2, v3

    .line 1020
    goto :goto_0
.end method

.method public static hexToInt(Ljava/lang/String;IIII)I
    .locals 7
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # I
    .param p3, "dstPos"    # I
    .param p4, "nHex"    # I

    .prologue
    .line 937
    if-nez p4, :cond_0

    .line 952
    .end local p2    # "dstInit":I
    :goto_0
    return p2

    .line 940
    .restart local p2    # "dstInit":I
    :cond_0
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p3

    const/16 v6, 0x20

    if-lt v5, v6, :cond_1

    .line 941
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nHexs-1)*4+dstPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 944
    :cond_1
    move v3, p2

    .line 945
    .local v3, "out":I
    const/4 v4, 0x0

    .line 946
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_2

    .line 947
    mul-int/lit8 v5, v1, 0x4

    add-int v4, v5, p3

    .line 948
    add-int v5, v1, p1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/lang3/Conversion;->hexDigitToInt(C)I

    move-result v5

    and-int/lit8 v5, v5, 0xf

    shl-int v0, v5, v4

    .line 949
    .local v0, "bits":I
    const/16 v5, 0xf

    shl-int v2, v5, v4

    .line 950
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int v3, v5, v0

    .line 946
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_2
    move p2, v3

    .line 952
    goto :goto_0
.end method

.method public static hexToLong(Ljava/lang/String;IJII)J
    .locals 14
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nHex"    # I

    .prologue
    .line 903
    if-nez p5, :cond_0

    .line 918
    .end local p2    # "dstInit":J
    :goto_0
    return-wide p2

    .line 906
    .restart local p2    # "dstInit":J
    :cond_0
    add-int/lit8 v10, p5, -0x1

    mul-int/lit8 v10, v10, 0x4

    add-int v10, v10, p4

    const/16 v11, 0x40

    if-lt v10, v11, :cond_1

    .line 907
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "(nHexs-1)*4+dstPos is greather or equal to than 64"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 910
    :cond_1
    move-wide/from16 v8, p2

    .line 911
    .local v8, "out":J
    const/4 v5, 0x0

    .line 912
    .local v5, "shift":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    move/from16 v0, p5

    if-ge v4, v0, :cond_2

    .line 913
    mul-int/lit8 v10, v4, 0x4

    add-int v5, v10, p4

    .line 914
    const-wide/16 v10, 0xf

    add-int v12, v4, p1

    invoke-virtual {p0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Lorg/apache/commons/lang3/Conversion;->hexDigitToInt(C)I

    move-result v12

    int-to-long v12, v12

    and-long/2addr v10, v12

    shl-long v2, v10, v5

    .line 915
    .local v2, "bits":J
    const-wide/16 v10, 0xf

    shl-long v6, v10, v5

    .line 916
    .local v6, "mask":J
    const-wide/16 v10, -0x1

    xor-long/2addr v10, v6

    and-long/2addr v10, v8

    or-long v8, v10, v2

    .line 912
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v2    # "bits":J
    .end local v6    # "mask":J
    :cond_2
    move-wide/from16 p2, v8

    .line 918
    goto :goto_0
.end method

.method public static hexToShort(Ljava/lang/String;ISII)S
    .locals 7
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # S
    .param p3, "dstPos"    # I
    .param p4, "nHex"    # I

    .prologue
    .line 971
    if-nez p4, :cond_0

    .line 986
    .end local p2    # "dstInit":S
    :goto_0
    return p2

    .line 974
    .restart local p2    # "dstInit":S
    :cond_0
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p3

    const/16 v6, 0x10

    if-lt v5, v6, :cond_1

    .line 975
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nHexs-1)*4+dstPos is greather or equal to than 16"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 978
    :cond_1
    move v3, p2

    .line 979
    .local v3, "out":S
    const/4 v4, 0x0

    .line 980
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_2

    .line 981
    mul-int/lit8 v5, v1, 0x4

    add-int v4, v5, p3

    .line 982
    add-int v5, v1, p1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lorg/apache/commons/lang3/Conversion;->hexDigitToInt(C)I

    move-result v5

    and-int/lit8 v5, v5, 0xf

    shl-int v0, v5, v4

    .line 983
    .local v0, "bits":I
    const/16 v5, 0xf

    shl-int v2, v5, v4

    .line 984
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int/2addr v5, v0

    int-to-short v3, v5

    .line 980
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_2
    move p2, v3

    .line 986
    goto :goto_0
.end method

.method public static intArrayToLong([IIJII)J
    .locals 14
    .param p0, "src"    # [I
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nInts"    # I

    .prologue
    .line 685
    array-length v10, p0

    if-nez v10, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p5, :cond_2

    .line 700
    .end local p2    # "dstInit":J
    :cond_1
    :goto_0
    return-wide p2

    .line 688
    .restart local p2    # "dstInit":J
    :cond_2
    add-int/lit8 v10, p5, -0x1

    mul-int/lit8 v10, v10, 0x20

    add-int v10, v10, p4

    const/16 v11, 0x40

    if-lt v10, v11, :cond_3

    .line 689
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "(nInts-1)*32+dstPos is greather or equal to than 64"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 692
    :cond_3
    move-wide/from16 v8, p2

    .line 693
    .local v8, "out":J
    const/4 v5, 0x0

    .line 694
    .local v5, "shift":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    move/from16 v0, p5

    if-ge v4, v0, :cond_4

    .line 695
    mul-int/lit8 v10, v4, 0x20

    add-int v5, v10, p4

    .line 696
    const-wide v10, 0xffffffffL

    add-int v12, v4, p1

    aget v12, p0, v12

    int-to-long v12, v12

    and-long/2addr v10, v12

    shl-long v2, v10, v5

    .line 697
    .local v2, "bits":J
    const-wide v10, 0xffffffffL

    shl-long v6, v10, v5

    .line 698
    .local v6, "mask":J
    const-wide/16 v10, -0x1

    xor-long/2addr v10, v6

    and-long/2addr v10, v8

    or-long v8, v10, v2

    .line 694
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v2    # "bits":J
    .end local v6    # "mask":J
    :cond_4
    move-wide/from16 p2, v8

    .line 700
    goto :goto_0
.end method

.method public static intToBinary(II[ZII)[Z
    .locals 4
    .param p0, "src"    # I
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [Z
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    .line 1584
    if-nez p4, :cond_1

    .line 1596
    :cond_0
    return-object p2

    .line 1587
    :cond_1
    add-int/lit8 v2, p4, -0x1

    add-int/2addr v2, p1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_2

    .line 1588
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "nBools-1+srcPos is greather or equal to than 32"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1591
    :cond_2
    const/4 v1, 0x0

    .line 1592
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_0

    .line 1593
    mul-int/lit8 v2, v0, 0x1

    add-int v1, v2, p1

    .line 1594
    add-int v3, p3, v0

    shr-int v2, p0, v1

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    :goto_1
    aput-boolean v2, p2, v3

    .line 1592
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1594
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static intToByteArray(II[BII)[B
    .locals 4
    .param p0, "src"    # I
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [B
    .param p3, "dstPos"    # I
    .param p4, "nBytes"    # I

    .prologue
    .line 1322
    if-nez p4, :cond_1

    .line 1334
    :cond_0
    return-object p2

    .line 1325
    :cond_1
    add-int/lit8 v2, p4, -0x1

    mul-int/lit8 v2, v2, 0x8

    add-int/2addr v2, p1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_2

    .line 1326
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "(nBytes-1)*8+srcPos is greather or equal to than 32"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1329
    :cond_2
    const/4 v1, 0x0

    .line 1330
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_0

    .line 1331
    mul-int/lit8 v2, v0, 0x8

    add-int v1, v2, p1

    .line 1332
    add-int v2, p3, v0

    shr-int v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 1330
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static intToHex(IILjava/lang/String;II)Ljava/lang/String;
    .locals 7
    .param p0, "src"    # I
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # Ljava/lang/String;
    .param p3, "dstPos"    # I
    .param p4, "nHexs"    # I

    .prologue
    .line 1428
    if-nez p4, :cond_0

    .line 1448
    .end local p2    # "dstInit":Ljava/lang/String;
    :goto_0
    return-object p2

    .line 1431
    .restart local p2    # "dstInit":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p1

    const/16 v6, 0x20

    if-lt v5, v6, :cond_1

    .line 1432
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nHexs-1)*4+srcPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1435
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1436
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1437
    .local v4, "shift":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1438
    .local v0, "append":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, p4, :cond_3

    .line 1439
    mul-int/lit8 v5, v2, 0x4

    add-int v4, v5, p1

    .line 1440
    shr-int v5, p0, v4

    and-int/lit8 v1, v5, 0xf

    .line 1441
    .local v1, "bits":I
    add-int v5, p3, v2

    if-ne v5, v0, :cond_2

    .line 1442
    add-int/lit8 v0, v0, 0x1

    .line 1443
    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1438
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1445
    :cond_2
    add-int v5, p3, v2

    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_2

    .line 1448
    .end local v1    # "bits":I
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method public static intToHexDigit(I)C
    .locals 4
    .param p0, "nibble"    # I

    .prologue
    .line 603
    const/16 v1, 0x10

    invoke-static {p0, v1}, Ljava/lang/Character;->forDigit(II)C

    move-result v0

    .line 604
    .local v0, "c":C
    if-nez v0, :cond_0

    .line 605
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "nibble value not between 0 and 15: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 607
    :cond_0
    return v0
.end method

.method public static intToHexDigitMsb0(I)C
    .locals 3
    .param p0, "nibble"    # I

    .prologue
    .line 629
    packed-switch p0, :pswitch_data_0

    .line 663
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "nibble value not between 0 and 15: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 631
    :pswitch_0
    const/16 v0, 0x30

    .line 661
    :goto_0
    return v0

    .line 633
    :pswitch_1
    const/16 v0, 0x38

    goto :goto_0

    .line 635
    :pswitch_2
    const/16 v0, 0x34

    goto :goto_0

    .line 637
    :pswitch_3
    const/16 v0, 0x63

    goto :goto_0

    .line 639
    :pswitch_4
    const/16 v0, 0x32

    goto :goto_0

    .line 641
    :pswitch_5
    const/16 v0, 0x61

    goto :goto_0

    .line 643
    :pswitch_6
    const/16 v0, 0x36

    goto :goto_0

    .line 645
    :pswitch_7
    const/16 v0, 0x65

    goto :goto_0

    .line 647
    :pswitch_8
    const/16 v0, 0x31

    goto :goto_0

    .line 649
    :pswitch_9
    const/16 v0, 0x39

    goto :goto_0

    .line 651
    :pswitch_a
    const/16 v0, 0x35

    goto :goto_0

    .line 653
    :pswitch_b
    const/16 v0, 0x64

    goto :goto_0

    .line 655
    :pswitch_c
    const/16 v0, 0x33

    goto :goto_0

    .line 657
    :pswitch_d
    const/16 v0, 0x62

    goto :goto_0

    .line 659
    :pswitch_e
    const/16 v0, 0x37

    goto :goto_0

    .line 661
    :pswitch_f
    const/16 v0, 0x66

    goto :goto_0

    .line 629
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
    .end packed-switch
.end method

.method public static intToShortArray(II[SII)[S
    .locals 5
    .param p0, "src"    # I
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [S
    .param p3, "dstPos"    # I
    .param p4, "nShorts"    # I

    .prologue
    .line 1255
    if-nez p4, :cond_1

    .line 1267
    :cond_0
    return-object p2

    .line 1258
    :cond_1
    add-int/lit8 v2, p4, -0x1

    mul-int/lit8 v2, v2, 0x10

    add-int/2addr v2, p1

    const/16 v3, 0x20

    if-lt v2, v3, :cond_2

    .line 1259
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "(nShorts-1)*16+srcPos is greather or equal to than 32"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1262
    :cond_2
    const/4 v1, 0x0

    .line 1263
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_0

    .line 1264
    mul-int/lit8 v2, v0, 0x10

    add-int v1, v2, p1

    .line 1265
    add-int v2, p3, v0

    const v3, 0xffff

    shr-int v4, p0, v1

    and-int/2addr v3, v4

    int-to-short v3, v3

    aput-short v3, p2, v2

    .line 1263
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static longToBinary(JI[ZII)[Z
    .locals 8
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dst"    # [Z
    .param p4, "dstPos"    # I
    .param p5, "nBools"    # I

    .prologue
    .line 1550
    if-nez p5, :cond_1

    .line 1562
    :cond_0
    return-object p3

    .line 1553
    :cond_1
    add-int/lit8 v2, p5, -0x1

    add-int/2addr v2, p2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_2

    .line 1554
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "nBools-1+srcPos is greather or equal to than 64"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1557
    :cond_2
    const/4 v1, 0x0

    .line 1558
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p5, :cond_0

    .line 1559
    mul-int/lit8 v2, v0, 0x1

    add-int v1, v2, p2

    .line 1560
    add-int v3, p4, v0

    const-wide/16 v4, 0x1

    shr-long v6, p0, v1

    and-long/2addr v4, v6

    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    :goto_1
    aput-boolean v2, p3, v3

    .line 1558
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1560
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static longToByteArray(JI[BII)[B
    .locals 8
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dst"    # [B
    .param p4, "dstPos"    # I
    .param p5, "nBytes"    # I

    .prologue
    .line 1289
    if-nez p5, :cond_1

    .line 1301
    :cond_0
    return-object p3

    .line 1292
    :cond_1
    add-int/lit8 v2, p5, -0x1

    mul-int/lit8 v2, v2, 0x8

    add-int/2addr v2, p2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_2

    .line 1293
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "(nBytes-1)*8+srcPos is greather or equal to than 64"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1296
    :cond_2
    const/4 v1, 0x0

    .line 1297
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p5, :cond_0

    .line 1298
    mul-int/lit8 v2, v0, 0x8

    add-int v1, v2, p2

    .line 1299
    add-int v2, p4, v0

    const-wide/16 v4, 0xff

    shr-long v6, p0, v1

    and-long/2addr v4, v6

    long-to-int v3, v4

    int-to-byte v3, v3

    aput-byte v3, p3, v2

    .line 1297
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static longToHex(JILjava/lang/String;II)Ljava/lang/String;
    .locals 10
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dstInit"    # Ljava/lang/String;
    .param p4, "dstPos"    # I
    .param p5, "nHexs"    # I

    .prologue
    .line 1388
    if-nez p5, :cond_0

    .line 1408
    .end local p3    # "dstInit":Ljava/lang/String;
    :goto_0
    return-object p3

    .line 1391
    .restart local p3    # "dstInit":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, p5, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p2

    const/16 v6, 0x40

    if-lt v5, v6, :cond_1

    .line 1392
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nHexs-1)*4+srcPos is greather or equal to than 64"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1395
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1396
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1397
    .local v4, "shift":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1398
    .local v0, "append":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, p5, :cond_3

    .line 1399
    mul-int/lit8 v5, v2, 0x4

    add-int v4, v5, p2

    .line 1400
    const-wide/16 v6, 0xf

    shr-long v8, p0, v4

    and-long/2addr v6, v8

    long-to-int v1, v6

    .line 1401
    .local v1, "bits":I
    add-int v5, p4, v2

    if-ne v5, v0, :cond_2

    .line 1402
    add-int/lit8 v0, v0, 0x1

    .line 1403
    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1398
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1405
    :cond_2
    add-int v5, p4, v2

    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_2

    .line 1408
    .end local v1    # "bits":I
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_0
.end method

.method public static longToIntArray(JI[III)[I
    .locals 8
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dst"    # [I
    .param p4, "dstPos"    # I
    .param p5, "nInts"    # I

    .prologue
    .line 1187
    if-nez p5, :cond_1

    .line 1199
    :cond_0
    return-object p3

    .line 1190
    :cond_1
    add-int/lit8 v2, p5, -0x1

    mul-int/lit8 v2, v2, 0x20

    add-int/2addr v2, p2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_2

    .line 1191
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "(nInts-1)*32+srcPos is greather or equal to than 64"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1194
    :cond_2
    const/4 v1, 0x0

    .line 1195
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p5, :cond_0

    .line 1196
    mul-int/lit8 v2, v0, 0x20

    add-int v1, v2, p2

    .line 1197
    add-int v2, p4, v0

    const-wide/16 v4, -0x1

    shr-long v6, p0, v1

    and-long/2addr v4, v6

    long-to-int v3, v4

    aput v3, p3, v2

    .line 1195
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static longToShortArray(JI[SII)[S
    .locals 8
    .param p0, "src"    # J
    .param p2, "srcPos"    # I
    .param p3, "dst"    # [S
    .param p4, "dstPos"    # I
    .param p5, "nShorts"    # I

    .prologue
    .line 1221
    if-nez p5, :cond_1

    .line 1233
    :cond_0
    return-object p3

    .line 1224
    :cond_1
    add-int/lit8 v2, p5, -0x1

    mul-int/lit8 v2, v2, 0x10

    add-int/2addr v2, p2

    const/16 v3, 0x40

    if-lt v2, v3, :cond_2

    .line 1225
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "(nShorts-1)*16+srcPos is greather or equal to than 64"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1228
    :cond_2
    const/4 v1, 0x0

    .line 1229
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p5, :cond_0

    .line 1230
    mul-int/lit8 v2, v0, 0x10

    add-int v1, v2, p2

    .line 1231
    add-int v2, p4, v0

    const-wide/32 v4, 0xffff

    shr-long v6, p0, v1

    and-long/2addr v4, v6

    long-to-int v3, v4

    int-to-short v3, v3

    aput-short v3, p3, v2

    .line 1229
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static shortArrayToInt([SIIII)I
    .locals 8
    .param p0, "src"    # [S
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # I
    .param p3, "dstPos"    # I
    .param p4, "nShorts"    # I

    .prologue
    const v7, 0xffff

    .line 759
    array-length v5, p0

    if-nez v5, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p4, :cond_2

    .line 774
    .end local p2    # "dstInit":I
    :cond_1
    :goto_0
    return p2

    .line 762
    .restart local p2    # "dstInit":I
    :cond_2
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x10

    add-int/2addr v5, p3

    const/16 v6, 0x20

    if-lt v5, v6, :cond_3

    .line 763
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nShorts-1)*16+dstPos is greather or equal to than 32"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 766
    :cond_3
    move v3, p2

    .line 767
    .local v3, "out":I
    const/4 v4, 0x0

    .line 768
    .local v4, "shift":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p4, :cond_4

    .line 769
    mul-int/lit8 v5, v1, 0x10

    add-int v4, v5, p3

    .line 770
    add-int v5, v1, p1

    aget-short v5, p0, v5

    and-int/2addr v5, v7

    shl-int v0, v5, v4

    .line 771
    .local v0, "bits":I
    shl-int v2, v7, v4

    .line 772
    .local v2, "mask":I
    xor-int/lit8 v5, v2, -0x1

    and-int/2addr v5, v3

    or-int v3, v5, v0

    .line 768
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0    # "bits":I
    .end local v2    # "mask":I
    :cond_4
    move p2, v3

    .line 774
    goto :goto_0
.end method

.method public static shortArrayToLong([SIJII)J
    .locals 14
    .param p0, "src"    # [S
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # J
    .param p4, "dstPos"    # I
    .param p5, "nShorts"    # I

    .prologue
    .line 722
    array-length v10, p0

    if-nez v10, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    if-nez p5, :cond_2

    .line 737
    .end local p2    # "dstInit":J
    :cond_1
    :goto_0
    return-wide p2

    .line 725
    .restart local p2    # "dstInit":J
    :cond_2
    add-int/lit8 v10, p5, -0x1

    mul-int/lit8 v10, v10, 0x10

    add-int v10, v10, p4

    const/16 v11, 0x40

    if-lt v10, v11, :cond_3

    .line 726
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v11, "(nShorts-1)*16+dstPos is greather or equal to than 64"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 729
    :cond_3
    move-wide/from16 v8, p2

    .line 730
    .local v8, "out":J
    const/4 v5, 0x0

    .line 731
    .local v5, "shift":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    move/from16 v0, p5

    if-ge v4, v0, :cond_4

    .line 732
    mul-int/lit8 v10, v4, 0x10

    add-int v5, v10, p4

    .line 733
    const-wide/32 v10, 0xffff

    add-int v12, v4, p1

    aget-short v12, p0, v12

    int-to-long v12, v12

    and-long/2addr v10, v12

    shl-long v2, v10, v5

    .line 734
    .local v2, "bits":J
    const-wide/32 v10, 0xffff

    shl-long v6, v10, v5

    .line 735
    .local v6, "mask":J
    const-wide/16 v10, -0x1

    xor-long/2addr v10, v6

    and-long/2addr v10, v8

    or-long v8, v10, v2

    .line 731
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v2    # "bits":J
    .end local v6    # "mask":J
    :cond_4
    move-wide/from16 p2, v8

    .line 737
    goto :goto_0
.end method

.method public static shortToBinary(SI[ZII)[Z
    .locals 4
    .param p0, "src"    # S
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [Z
    .param p3, "dstPos"    # I
    .param p4, "nBools"    # I

    .prologue
    .line 1618
    if-nez p4, :cond_1

    .line 1631
    :cond_0
    return-object p2

    .line 1621
    :cond_1
    add-int/lit8 v2, p4, -0x1

    add-int/2addr v2, p1

    const/16 v3, 0x10

    if-lt v2, v3, :cond_2

    .line 1622
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "nBools-1+srcPos is greather or equal to than 16"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1625
    :cond_2
    const/4 v1, 0x0

    .line 1626
    .local v1, "shift":I
    sget-boolean v2, Lorg/apache/commons/lang3/Conversion;->$assertionsDisabled:Z

    if-nez v2, :cond_3

    add-int/lit8 v2, p4, -0x1

    mul-int/lit8 v2, v2, 0x1

    rsub-int/lit8 v3, p1, 0x10

    if-lt v2, v3, :cond_3

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 1627
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_0

    .line 1628
    mul-int/lit8 v2, v0, 0x1

    add-int v1, v2, p1

    .line 1629
    add-int v3, p3, v0

    shr-int v2, p0, v1

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_4

    const/4 v2, 0x1

    :goto_1
    aput-boolean v2, p2, v3

    .line 1627
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1629
    :cond_4
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static shortToByteArray(SI[BII)[B
    .locals 4
    .param p0, "src"    # S
    .param p1, "srcPos"    # I
    .param p2, "dst"    # [B
    .param p3, "dstPos"    # I
    .param p4, "nBytes"    # I

    .prologue
    .line 1356
    if-nez p4, :cond_1

    .line 1368
    :cond_0
    return-object p2

    .line 1359
    :cond_1
    add-int/lit8 v2, p4, -0x1

    mul-int/lit8 v2, v2, 0x8

    add-int/2addr v2, p1

    const/16 v3, 0x10

    if-lt v2, v3, :cond_2

    .line 1360
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "(nBytes-1)*8+srcPos is greather or equal to than 16"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1363
    :cond_2
    const/4 v1, 0x0

    .line 1364
    .local v1, "shift":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p4, :cond_0

    .line 1365
    mul-int/lit8 v2, v0, 0x8

    add-int v1, v2, p1

    .line 1366
    add-int v2, p3, v0

    shr-int v3, p0, v1

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, p2, v2

    .line 1364
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static shortToHex(SILjava/lang/String;II)Ljava/lang/String;
    .locals 7
    .param p0, "src"    # S
    .param p1, "srcPos"    # I
    .param p2, "dstInit"    # Ljava/lang/String;
    .param p3, "dstPos"    # I
    .param p4, "nHexs"    # I

    .prologue
    .line 1468
    if-nez p4, :cond_0

    .line 1488
    .end local p2    # "dstInit":Ljava/lang/String;
    :goto_0
    return-object p2

    .line 1471
    .restart local p2    # "dstInit":Ljava/lang/String;
    :cond_0
    add-int/lit8 v5, p4, -0x1

    mul-int/lit8 v5, v5, 0x4

    add-int/2addr v5, p1

    const/16 v6, 0x10

    if-lt v5, v6, :cond_1

    .line 1472
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v6, "(nHexs-1)*4+srcPos is greather or equal to than 16"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1475
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1476
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 1477
    .local v4, "shift":I
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1478
    .local v0, "append":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, p4, :cond_3

    .line 1479
    mul-int/lit8 v5, v2, 0x4

    add-int v4, v5, p1

    .line 1480
    shr-int v5, p0, v4

    and-int/lit8 v1, v5, 0xf

    .line 1481
    .local v1, "bits":I
    add-int v5, p3, v2

    if-ne v5, v0, :cond_2

    .line 1482
    add-int/lit8 v0, v0, 0x1

    .line 1483
    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1478
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1485
    :cond_2
    add-int v5, p3, v2

    invoke-static {v1}, Lorg/apache/commons/lang3/Conversion;->intToHexDigit(I)C

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_2

    .line 1488
    .end local v1    # "bits":I
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method public static uuidToByteArray(Ljava/util/UUID;[BII)[B
    .locals 7
    .param p0, "src"    # Ljava/util/UUID;
    .param p1, "dst"    # [B
    .param p2, "dstPos"    # I
    .param p3, "nBytes"    # I

    .prologue
    const/4 v2, 0x0

    const/16 v6, 0x8

    .line 1684
    if-nez p3, :cond_1

    .line 1694
    :cond_0
    :goto_0
    return-object p1

    .line 1687
    :cond_1
    const/16 v0, 0x10

    if-le p3, v0, :cond_2

    .line 1688
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "nBytes is greather than 16"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1690
    :cond_2
    invoke-virtual {p0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    if-le p3, v6, :cond_3

    move v5, v6

    :goto_1
    move-object v3, p1

    move v4, p2

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/Conversion;->longToByteArray(JI[BII)[B

    .line 1691
    if-lt p3, v6, :cond_0

    .line 1692
    invoke-virtual {p0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    add-int/lit8 v4, p2, 0x8

    add-int/lit8 v5, p3, -0x8

    move-object v3, p1

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/Conversion;->longToByteArray(JI[BII)[B

    goto :goto_0

    :cond_3
    move v5, p3

    .line 1690
    goto :goto_1
.end method
