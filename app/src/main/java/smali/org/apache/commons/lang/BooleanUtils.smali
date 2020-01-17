.class public Lorg/apache/commons/lang/BooleanUtils;
.super Ljava/lang/Object;
.source "BooleanUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public static isFalse(Ljava/lang/Boolean;)Z
    .locals 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    const/4 v0, 0x0

    .line 126
    if-nez p0, :cond_1

    .line 129
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isNotFalse(Ljava/lang/Boolean;)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 147
    invoke-static {p0}, Lorg/apache/commons/lang/BooleanUtils;->isFalse(Ljava/lang/Boolean;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotTrue(Ljava/lang/Boolean;)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 108
    invoke-static {p0}, Lorg/apache/commons/lang/BooleanUtils;->isTrue(Ljava/lang/Boolean;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isTrue(Ljava/lang/Boolean;)Z
    .locals 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    const/4 v0, 0x0

    .line 87
    if-nez p0, :cond_1

    .line 90
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static negate(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 64
    if-nez p0, :cond_0

    .line 65
    const/4 v0, 0x0

    .line 67
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toBoolean(I)Z
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 226
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static toBoolean(III)Z
    .locals 2
    .param p0, "value"    # I
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I

    .prologue
    .line 287
    if-ne p0, p1, :cond_0

    .line 288
    const/4 v0, 0x1

    .line 290
    :goto_0
    return v0

    .line 289
    :cond_0
    if-ne p0, p2, :cond_1

    .line 290
    const/4 v0, 0x0

    goto :goto_0

    .line 293
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Integer did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/Boolean;)Z
    .locals 2
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    const/4 v0, 0x0

    .line 183
    if-nez p0, :cond_1

    .line 186
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static toBoolean(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Z
    .locals 3
    .param p0, "value"    # Ljava/lang/Integer;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 316
    if-nez p0, :cond_2

    .line 317
    if-nez p1, :cond_1

    .line 325
    :cond_0
    :goto_0
    return v0

    .line 319
    :cond_1
    if-nez p2, :cond_3

    move v0, v1

    .line 320
    goto :goto_0

    .line 322
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 324
    invoke-virtual {p0, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    .line 325
    goto :goto_0

    .line 328
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Integer did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/String;)Z
    .locals 10
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0x45

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 656
    const-string/jumbo v5, "true"

    if-ne p0, v5, :cond_1

    .line 700
    :cond_0
    :goto_0
    return v4

    .line 659
    :cond_1
    if-nez p0, :cond_2

    move v4, v3

    .line 660
    goto :goto_0

    .line 662
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    :cond_3
    move v4, v3

    .line 700
    goto :goto_0

    .line 664
    :pswitch_0
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 665
    .local v1, "ch0":C
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 666
    .local v2, "ch1":C
    const/16 v5, 0x6f

    if-eq v1, v5, :cond_4

    const/16 v5, 0x4f

    if-ne v1, v5, :cond_6

    :cond_4
    const/16 v5, 0x6e

    if-eq v2, v5, :cond_5

    const/16 v5, 0x4e

    if-ne v2, v5, :cond_6

    :cond_5
    move v3, v4

    :cond_6
    move v4, v3

    goto :goto_0

    .line 671
    .end local v1    # "ch0":C
    .end local v2    # "ch1":C
    :pswitch_1
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 672
    .local v0, "ch":C
    const/16 v5, 0x79

    if-ne v0, v5, :cond_9

    .line 673
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x65

    if-eq v5, v6, :cond_7

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v5, v9, :cond_8

    :cond_7
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x73

    if-eq v5, v6, :cond_0

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x53

    if-eq v5, v6, :cond_0

    :cond_8
    move v4, v3

    goto :goto_0

    .line 677
    :cond_9
    const/16 v5, 0x59

    if-ne v0, v5, :cond_c

    .line 678
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v9, :cond_a

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x65

    if-ne v5, v6, :cond_b

    :cond_a
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x53

    if-eq v5, v6, :cond_0

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x73

    if-eq v5, v6, :cond_0

    :cond_b
    move v4, v3

    goto :goto_0

    :cond_c
    move v4, v3

    .line 682
    goto :goto_0

    .line 685
    .end local v0    # "ch":C
    :pswitch_2
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 686
    .restart local v0    # "ch":C
    const/16 v5, 0x74

    if-ne v0, v5, :cond_10

    .line 687
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x72

    if-eq v5, v6, :cond_d

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x52

    if-ne v5, v6, :cond_f

    :cond_d
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x75

    if-eq v5, v6, :cond_e

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x55

    if-ne v5, v6, :cond_f

    :cond_e
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x65

    if-eq v5, v6, :cond_0

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v9, :cond_0

    :cond_f
    move v4, v3

    goto/16 :goto_0

    .line 692
    :cond_10
    const/16 v5, 0x54

    if-ne v0, v5, :cond_3

    .line 693
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x52

    if-eq v5, v6, :cond_11

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x72

    if-ne v5, v6, :cond_13

    :cond_11
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x55

    if-eq v5, v6, :cond_12

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x75

    if-ne v5, v6, :cond_13

    :cond_12
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v5, v9, :cond_0

    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x65

    if-eq v5, v6, :cond_0

    :cond_13
    move v4, v3

    goto/16 :goto_0

    .line 662
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static toBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 722
    if-nez p0, :cond_2

    .line 723
    if-nez p1, :cond_1

    .line 731
    :cond_0
    :goto_0
    return v0

    .line 725
    :cond_1
    if-nez p2, :cond_3

    move v0, v1

    .line 726
    goto :goto_0

    .line 728
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 730
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    .line 731
    goto :goto_0

    .line 734
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The String did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanDefaultIfNull(Ljava/lang/Boolean;Z)Z
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "valueIfNull"    # Z

    .prologue
    .line 203
    if-nez p0, :cond_0

    .line 206
    .end local p1    # "valueIfNull":Z
    :goto_0
    return p1

    .restart local p1    # "valueIfNull":Z
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    move p1, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static toBooleanObject(I)Ljava/lang/Boolean;
    .locals 1
    .param p0, "value"    # I

    .prologue
    .line 244
    if-nez p0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toBooleanObject(IIII)Ljava/lang/Boolean;
    .locals 2
    .param p0, "value"    # I
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I
    .param p3, "nullValue"    # I

    .prologue
    .line 348
    if-ne p0, p1, :cond_0

    .line 349
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 353
    :goto_0
    return-object v0

    .line 350
    :cond_0
    if-ne p0, p2, :cond_1

    .line 351
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 352
    :cond_1
    if-ne p0, p3, :cond_2

    .line 353
    const/4 v0, 0x0

    goto :goto_0

    .line 356
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Integer did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanObject(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "value"    # Ljava/lang/Integer;

    .prologue
    .line 264
    if-nez p0, :cond_0

    .line 265
    const/4 v0, 0x0

    .line 267
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toBooleanObject(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 2
    .param p0, "value"    # Ljava/lang/Integer;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;
    .param p3, "nullValue"    # Ljava/lang/Integer;

    .prologue
    const/4 v0, 0x0

    .line 379
    if-nez p0, :cond_4

    .line 380
    if-nez p1, :cond_1

    .line 381
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 392
    :cond_0
    :goto_0
    return-object v0

    .line 382
    :cond_1
    if-nez p2, :cond_2

    .line 383
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 384
    :cond_2
    if-eqz p3, :cond_0

    .line 395
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The Integer did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 387
    :cond_4
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 388
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 389
    :cond_5
    invoke-virtual {p0, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 390
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 391
    :cond_6
    invoke-virtual {p0, p3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0
.end method

.method public static toBooleanObject(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 563
    const-string/jumbo v0, "true"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 564
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 577
    :goto_0
    return-object v0

    .line 565
    :cond_0
    const-string/jumbo v0, "false"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 566
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 567
    :cond_1
    const-string/jumbo v0, "on"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 568
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 569
    :cond_2
    const-string/jumbo v0, "off"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 570
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 571
    :cond_3
    const-string/jumbo v0, "yes"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 572
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 573
    :cond_4
    const-string/jumbo v0, "no"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 574
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 577
    :cond_5
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toBooleanObject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;
    .param p3, "nullString"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 603
    if-nez p0, :cond_4

    .line 604
    if-nez p1, :cond_1

    .line 605
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 616
    :cond_0
    :goto_0
    return-object v0

    .line 606
    :cond_1
    if-nez p2, :cond_2

    .line 607
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 608
    :cond_2
    if-eqz p3, :cond_0

    .line 619
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The String did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 611
    :cond_4
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 612
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 613
    :cond_5
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 614
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 615
    :cond_6
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0
.end method

.method public static toBooleanObject(Z)Ljava/lang/Boolean;
    .locals 1
    .param p0, "bool"    # Z

    .prologue
    .line 165
    if-eqz p0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toInteger(Ljava/lang/Boolean;III)I
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I
    .param p3, "nullValue"    # I

    .prologue
    .line 486
    if-nez p0, :cond_0

    .line 489
    .end local p1    # "trueValue":I
    .end local p3    # "nullValue":I
    :goto_0
    return p3

    .restart local p1    # "trueValue":I
    .restart local p3    # "nullValue":I
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .end local p1    # "trueValue":I
    :goto_1
    move p3, p1

    goto :goto_0

    .restart local p1    # "trueValue":I
    :cond_1
    move p1, p2

    goto :goto_1
.end method

.method public static toInteger(Z)I
    .locals 1
    .param p0, "bool"    # Z

    .prologue
    .line 413
    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toInteger(ZII)I
    .locals 0
    .param p0, "bool"    # Z
    .param p1, "trueValue"    # I
    .param p2, "falseValue"    # I

    .prologue
    .line 467
    if-eqz p0, :cond_0

    .end local p1    # "trueValue":I
    :goto_0
    return p1

    .restart local p1    # "trueValue":I
    :cond_0
    move p1, p2

    goto :goto_0
.end method

.method public static toIntegerObject(Ljava/lang/Boolean;)Ljava/lang/Integer;
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 447
    if-nez p0, :cond_0

    .line 448
    const/4 v0, 0x0

    .line 450
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public static toIntegerObject(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;
    .param p3, "nullValue"    # Ljava/lang/Integer;

    .prologue
    .line 530
    if-nez p0, :cond_0

    .line 533
    .end local p1    # "trueValue":Ljava/lang/Integer;
    .end local p3    # "nullValue":Ljava/lang/Integer;
    :goto_0
    return-object p3

    .restart local p1    # "trueValue":Ljava/lang/Integer;
    .restart local p3    # "nullValue":Ljava/lang/Integer;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .end local p1    # "trueValue":Ljava/lang/Integer;
    :goto_1
    move-object p3, p1

    goto :goto_0

    .restart local p1    # "trueValue":Ljava/lang/Integer;
    :cond_1
    move-object p1, p2

    goto :goto_1
.end method

.method public static toIntegerObject(Z)Ljava/lang/Integer;
    .locals 1
    .param p0, "bool"    # Z

    .prologue
    .line 429
    if-eqz p0, :cond_0

    sget-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/commons/lang/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public static toIntegerObject(ZLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0
    .param p0, "bool"    # Z
    .param p1, "trueValue"    # Ljava/lang/Integer;
    .param p2, "falseValue"    # Ljava/lang/Integer;

    .prologue
    .line 508
    if-eqz p0, :cond_0

    .end local p1    # "trueValue":Ljava/lang/Integer;
    :goto_0
    return-object p1

    .restart local p1    # "trueValue":Ljava/lang/Integer;
    :cond_0
    move-object p1, p2

    goto :goto_0
.end method

.method public static toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "bool"    # Ljava/lang/Boolean;
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;
    .param p3, "nullString"    # Ljava/lang/String;

    .prologue
    .line 812
    if-nez p0, :cond_0

    .line 815
    .end local p1    # "trueString":Ljava/lang/String;
    .end local p3    # "nullString":Ljava/lang/String;
    :goto_0
    return-object p3

    .restart local p1    # "trueString":Ljava/lang/String;
    .restart local p3    # "nullString":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .end local p1    # "trueString":Ljava/lang/String;
    :goto_1
    move-object p3, p1

    goto :goto_0

    .restart local p1    # "trueString":Ljava/lang/String;
    :cond_1
    move-object p1, p2

    goto :goto_1
.end method

.method public static toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "bool"    # Z
    .param p1, "trueString"    # Ljava/lang/String;
    .param p2, "falseString"    # Ljava/lang/String;

    .prologue
    .line 887
    if-eqz p0, :cond_0

    .end local p1    # "trueString":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "trueString":Ljava/lang/String;
    :cond_0
    move-object p1, p2

    goto :goto_0
.end method

.method public static toStringOnOff(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 772
    const-string/jumbo v0, "on"

    const-string/jumbo v1, "off"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringOnOff(Z)Ljava/lang/String;
    .locals 2
    .param p0, "bool"    # Z

    .prologue
    .line 851
    const-string/jumbo v0, "on"

    const-string/jumbo v1, "off"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringTrueFalse(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 754
    const-string/jumbo v0, "true"

    const-string/jumbo v1, "false"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringTrueFalse(Z)Ljava/lang/String;
    .locals 2
    .param p0, "bool"    # Z

    .prologue
    .line 834
    const-string/jumbo v0, "true"

    const-string/jumbo v1, "false"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringYesNo(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .param p0, "bool"    # Ljava/lang/Boolean;

    .prologue
    .line 790
    const-string/jumbo v0, "yes"

    const-string/jumbo v1, "no"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringYesNo(Z)Ljava/lang/String;
    .locals 2
    .param p0, "bool"    # Z

    .prologue
    .line 868
    const-string/jumbo v0, "yes"

    const-string/jumbo v1, "no"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static xor([Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 4
    .param p0, "array"    # [Ljava/lang/Boolean;

    .prologue
    .line 948
    if-nez p0, :cond_0

    .line 949
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 950
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 951
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Array is empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 953
    :cond_1
    const/4 v1, 0x0

    .line 955
    .local v1, "primitive":[Z
    :try_start_0
    invoke-static {p0}, Lorg/apache/commons/lang/ArrayUtils;->toPrimitive([Ljava/lang/Boolean;)[Z
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 959
    invoke-static {v1}, Lorg/apache/commons/lang/BooleanUtils;->xor([Z)Z

    move-result v2

    if-eqz v2, :cond_2

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v2

    .line 956
    :catch_0
    move-exception v0

    .line 957
    .local v0, "ex":Ljava/lang/NullPointerException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "The array must not contain any null elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 959
    .end local v0    # "ex":Ljava/lang/NullPointerException;
    :cond_2
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static xor([Z)Z
    .locals 5
    .param p0, "array"    # [Z

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 908
    if-nez p0, :cond_0

    .line 909
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 910
    :cond_0
    array-length v4, p0

    if-nez v4, :cond_1

    .line 911
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Array is empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 915
    :cond_1
    const/4 v1, 0x0

    .line 916
    .local v1, "trueCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v4, p0

    if-ge v0, v4, :cond_3

    .line 919
    aget-boolean v4, p0, v0

    if-eqz v4, :cond_2

    .line 920
    if-ge v1, v2, :cond_4

    .line 921
    add-int/lit8 v1, v1, 0x1

    .line 916
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 929
    :cond_3
    if-ne v1, v2, :cond_5

    :goto_1
    move v3, v2

    :cond_4
    return v3

    :cond_5
    move v2, v3

    goto :goto_1
.end method
