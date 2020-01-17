.class public Lorg/apache/commons/lang/text/ExtendedMessageFormat;
.super Ljava/text/MessageFormat;
.source "ExtendedMessageFormat.java"


# static fields
.field private static final DUMMY_PATTERN:Ljava/lang/String; = ""

.field private static final END_FE:C = '}'

.field private static final ESCAPED_QUOTE:Ljava/lang/String; = "\'\'"

.field private static final QUOTE:C = '\''

.field private static final START_FE:C = '{'

.field private static final START_FMT:C = ','

.field private static final serialVersionUID:J = -0x20c7ae6efb1e381fL


# instance fields
.field private final registry:Ljava/util/Map;

.field private toPattern:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Locale;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 101
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;Ljava/util/Map;)V

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Locale;Ljava/util/Map;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "registry"    # Ljava/util/Map;

    .prologue
    .line 124
    const-string/jumbo v0, ""

    invoke-direct {p0, v0}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    .line 125
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->setLocale(Ljava/util/Locale;)V

    .line 126
    iput-object p3, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->registry:Ljava/util/Map;

    .line 127
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->applyPattern(Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "registry"    # Ljava/util/Map;

    .prologue
    .line 112
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;Ljava/util/Map;)V

    .line 113
    return-void
.end method

.method private appendQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Ljava/lang/StringBuffer;Z)Ljava/lang/StringBuffer;
    .locals 8
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;
    .param p3, "appendTo"    # Ljava/lang/StringBuffer;
    .param p4, "escapingOn"    # Z

    .prologue
    const/4 v4, 0x0

    const/16 v7, 0x27

    .line 419
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    .line 420
    .local v3, "start":I
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 421
    .local v0, "c":[C
    if-eqz p4, :cond_2

    aget-char v5, v0, v3

    if-ne v5, v7, :cond_2

    .line 422
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    .line 423
    if-nez p3, :cond_1

    .line 437
    :cond_0
    :goto_0
    return-object v4

    .line 423
    :cond_1
    invoke-virtual {p3, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    goto :goto_0

    .line 425
    :cond_2
    move v2, v3

    .line 426
    .local v2, "lastHold":I
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v1

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 427
    if-eqz p4, :cond_3

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "\'\'"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 428
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-virtual {p3, v0, v2, v5}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 430
    const-string/jumbo v5, "\'\'"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v1

    invoke-virtual {p2, v5}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 431
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v2

    .line 426
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 434
    :cond_3
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v5

    aget-char v5, v0, v5

    packed-switch v5, :pswitch_data_0

    .line 440
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto :goto_2

    .line 436
    :pswitch_0
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    .line 437
    if-eqz p3, :cond_0

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {p3, v0, v2, v4}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    move-result-object v4

    goto :goto_0

    .line 443
    :cond_4
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unterminated quoted string at position "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 434
    :pswitch_data_0
    .packed-switch 0x27
        :pswitch_0
    .end packed-switch
.end method

.method private containsElements(Ljava/util/Collection;)Z
    .locals 3
    .param p1, "coll"    # Ljava/util/Collection;

    .prologue
    const/4 v1, 0x0

    .line 465
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 473
    :cond_0
    :goto_0
    return v1

    .line 468
    :cond_1
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 469
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 470
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private getFormat(Ljava/lang/String;)Ljava/text/Format;
    .locals 5
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 247
    iget-object v4, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->registry:Ljava/util/Map;

    if-eqz v4, :cond_1

    .line 248
    move-object v3, p1

    .line 249
    .local v3, "name":Ljava/lang/String;
    const/4 v0, 0x0

    .line 250
    .local v0, "args":Ljava/lang/String;
    const/16 v4, 0x2c

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 251
    .local v2, "i":I
    if-lez v2, :cond_0

    .line 252
    const/4 v4, 0x0

    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 253
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 255
    :cond_0
    iget-object v4, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->registry:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang/text/FormatFactory;

    .line 256
    .local v1, "factory":Lorg/apache/commons/lang/text/FormatFactory;
    if-eqz v1, :cond_1

    .line 257
    invoke-virtual {p0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->getLocale()Ljava/util/Locale;

    move-result-object v4

    invoke-interface {v1, v3, v0, v4}, Lorg/apache/commons/lang/text/FormatFactory;->getFormat(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/text/Format;

    move-result-object v4

    .line 260
    .end local v0    # "args":Ljava/lang/String;
    .end local v1    # "factory":Lorg/apache/commons/lang/text/FormatFactory;
    .end local v2    # "i":I
    .end local v3    # "name":Ljava/lang/String;
    :goto_0
    return-object v4

    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method private getQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Z)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;
    .param p3, "escapingOn"    # Z

    .prologue
    .line 456
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->appendQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Ljava/lang/StringBuffer;Z)Ljava/lang/StringBuffer;

    .line 457
    return-void
.end method

.method private insertFormats(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 9
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "customPatterns"    # Ljava/util/ArrayList;

    .prologue
    const/4 v8, 0x0

    .line 345
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->containsElements(Ljava/util/Collection;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 378
    .end local p1    # "pattern":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 348
    .restart local p1    # "pattern":Ljava/lang/String;
    :cond_0
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    mul-int/lit8 v6, v6, 0x2

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 349
    .local v5, "sb":Ljava/lang/StringBuffer;
    new-instance v4, Ljava/text/ParsePosition;

    invoke-direct {v4, v8}, Ljava/text/ParsePosition;-><init>(I)V

    .line 350
    .local v4, "pos":Ljava/text/ParsePosition;
    const/4 v3, -0x1

    .line 351
    .local v3, "fe":I
    const/4 v2, 0x0

    .line 352
    .local v2, "depth":I
    :cond_1
    :goto_1
    invoke-virtual {v4}, Ljava/text/ParsePosition;->getIndex()I

    move-result v6

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v6, v7, :cond_2

    .line 353
    invoke-virtual {v4}, Ljava/text/ParsePosition;->getIndex()I

    move-result v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 354
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_0

    .line 374
    :goto_2
    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 375
    invoke-direct {p0, v4}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto :goto_1

    .line 356
    :sswitch_0
    invoke-direct {p0, p1, v4, v5, v8}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->appendQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Ljava/lang/StringBuffer;Z)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 359
    :sswitch_1
    add-int/lit8 v2, v2, 0x1

    .line 360
    const/4 v6, 0x1

    if-ne v2, v6, :cond_1

    .line 361
    add-int/lit8 v3, v3, 0x1

    .line 362
    const/16 v6, 0x7b

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-direct {p0, v4}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    move-result-object v7

    invoke-direct {p0, p1, v7}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->readArgumentIndex(Ljava/lang/String;Ljava/text/ParsePosition;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 364
    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 365
    .local v1, "customPattern":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 366
    const/16 v6, 0x2c

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 371
    .end local v1    # "customPattern":Ljava/lang/String;
    :sswitch_2
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    .line 378
    .end local v0    # "c":C
    :cond_2
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 354
    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_0
        0x7b -> :sswitch_1
        0x7d -> :sswitch_2
    .end sparse-switch
.end method

.method private next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;
    .locals 1
    .param p1, "pos"    # Ljava/text/ParsePosition;

    .prologue
    .line 403
    invoke-virtual {p1}, Ljava/text/ParsePosition;->getIndex()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 404
    return-object p1
.end method

.method private parseFormatDescription(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/String;
    .locals 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    .line 313
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v1

    .line 314
    .local v1, "start":I
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 315
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v2

    .line 316
    .local v2, "text":I
    const/4 v0, 0x1

    .line 317
    .local v0, "depth":I
    :goto_0
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 318
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 317
    :cond_0
    :goto_1
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto :goto_0

    .line 320
    :sswitch_0
    add-int/lit8 v0, v0, 0x1

    .line 321
    goto :goto_1

    .line 323
    :sswitch_1
    add-int/lit8 v0, v0, -0x1

    .line 324
    if-nez v0, :cond_0

    .line 325
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 329
    :sswitch_2
    const/4 v3, 0x0

    invoke-direct {p0, p1, p2, v3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->getQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Z)V

    goto :goto_1

    .line 333
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unterminated format element at position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 318
    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_2
        0x7b -> :sswitch_0
        0x7d -> :sswitch_1
    .end sparse-switch
.end method

.method private readArgumentIndex(Ljava/lang/String;Ljava/text/ParsePosition;)I
    .locals 8
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    const/16 v7, 0x7d

    const/16 v6, 0x2c

    .line 271
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    .line 272
    .local v3, "start":I
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 273
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 274
    .local v2, "result":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 275
    .local v1, "error":Z
    :goto_0
    if-nez v1, :cond_4

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 276
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 277
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 278
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 279
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 280
    if-eq v0, v6, :cond_0

    if-eq v0, v7, :cond_0

    .line 281
    const/4 v1, 0x1

    .line 275
    :goto_1
    invoke-direct {p0, p2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto :goto_0

    .line 285
    :cond_0
    if-eq v0, v6, :cond_1

    if-ne v0, v7, :cond_2

    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 287
    :try_start_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    return v4

    .line 288
    :catch_0
    move-exception v4

    .line 293
    :cond_2
    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-nez v4, :cond_3

    const/4 v1, 0x1

    .line 294
    :goto_2
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 293
    :cond_3
    const/4 v1, 0x0

    goto :goto_2

    .line 296
    .end local v0    # "c":C
    :cond_4
    if-eqz v1, :cond_5

    .line 297
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Invalid format argument index at position "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v6

    invoke-virtual {p1, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 301
    :cond_5
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unterminated format element at position "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V
    .locals 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    .line 388
    const/4 v1, 0x0

    .line 389
    .local v1, "len":I
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 391
    .local v0, "buffer":[C
    :cond_0
    invoke-static {}, Lorg/apache/commons/lang/text/StrMatcher;->splitMatcher()Lorg/apache/commons/lang/text/StrMatcher;

    move-result-object v2

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v3

    invoke-virtual {v2, v0, v3}, Lorg/apache/commons/lang/text/StrMatcher;->isMatch([CI)I

    move-result v1

    .line 392
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p2, v2}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 393
    if-lez v1, :cond_1

    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_0

    .line 394
    :cond_1
    return-void
.end method


# virtual methods
.method public final applyPattern(Ljava/lang/String;)V
    .locals 21
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 143
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->registry:Ljava/util/Map;

    move-object/from16 v18, v0

    if-nez v18, :cond_1

    .line 144
    invoke-super/range {p0 .. p1}, Ljava/text/MessageFormat;->applyPattern(Ljava/lang/String;)V

    .line 145
    invoke-super/range {p0 .. p0}, Ljava/text/MessageFormat;->toPattern()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->toPattern:Ljava/lang/String;

    .line 206
    :cond_0
    :goto_0
    return-void

    .line 148
    :cond_1
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .local v10, "foundFormats":Ljava/util/ArrayList;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v9, "foundDescriptions":Ljava/util/ArrayList;
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 152
    .local v17, "stripCustom":Ljava/lang/StringBuffer;
    new-instance v15, Ljava/text/ParsePosition;

    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-direct {v15, v0}, Ljava/text/ParsePosition;-><init>(I)V

    .line 153
    .local v15, "pos":Ljava/text/ParsePosition;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    .line 154
    .local v4, "c":[C
    const/4 v6, 0x0

    .line 155
    .local v6, "fmtCount":I
    :goto_1
    invoke-virtual {v15}, Ljava/text/ParsePosition;->getIndex()I

    move-result v18

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v19

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_7

    .line 156
    invoke-virtual {v15}, Ljava/text/ParsePosition;->getIndex()I

    move-result v18

    aget-char v18, v4, v18

    sparse-switch v18, :sswitch_data_0

    .line 187
    :cond_2
    invoke-virtual {v15}, Ljava/text/ParsePosition;->getIndex()I

    move-result v18

    aget-char v18, v4, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 188
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    goto :goto_1

    .line 158
    :sswitch_0
    const/16 v18, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    move/from16 v3, v18

    invoke-direct {v0, v1, v15, v2, v3}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->appendQuotedString(Ljava/lang/String;Ljava/text/ParsePosition;Ljava/lang/StringBuffer;Z)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 161
    :sswitch_1
    add-int/lit8 v6, v6, 0x1

    .line 162
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v15}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 163
    invoke-virtual {v15}, Ljava/text/ParsePosition;->getIndex()I

    move-result v16

    .line 164
    .local v16, "start":I
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->readArgumentIndex(Ljava/lang/String;Ljava/text/ParsePosition;)I

    move-result v12

    .line 165
    .local v12, "index":I
    const/16 v18, 0x7b

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 166
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v15}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->seekNonWs(Ljava/lang/String;Ljava/text/ParsePosition;)V

    .line 167
    const/4 v7, 0x0

    .line 168
    .local v7, "format":Ljava/text/Format;
    const/4 v8, 0x0

    .line 169
    .local v8, "formatDescription":Ljava/lang/String;
    invoke-virtual {v15}, Ljava/text/ParsePosition;->getIndex()I

    move-result v18

    aget-char v18, v4, v18

    const/16 v19, 0x2c

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_3

    .line 170
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->next(Ljava/text/ParsePosition;)Ljava/text/ParsePosition;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->parseFormatDescription(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/String;

    move-result-object v8

    .line 172
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->getFormat(Ljava/lang/String;)Ljava/text/Format;

    move-result-object v7

    .line 173
    if-nez v7, :cond_3

    .line 174
    const/16 v18, 0x2c

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    :cond_3
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    if-nez v7, :cond_4

    const/4 v8, 0x0

    .end local v8    # "formatDescription":Ljava/lang/String;
    :cond_4
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-ne v0, v6, :cond_5

    const/16 v18, 0x1

    :goto_2
    invoke-static/range {v18 .. v18}, Lorg/apache/commons/lang/Validate;->isTrue(Z)V

    .line 180
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v18

    move/from16 v0, v18

    if-ne v0, v6, :cond_6

    const/16 v18, 0x1

    :goto_3
    invoke-static/range {v18 .. v18}, Lorg/apache/commons/lang/Validate;->isTrue(Z)V

    .line 181
    invoke-virtual {v15}, Ljava/text/ParsePosition;->getIndex()I

    move-result v18

    aget-char v18, v4, v18

    const/16 v19, 0x7d

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_2

    .line 182
    new-instance v18, Ljava/lang/IllegalArgumentException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v20, "Unreadable format element at position "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 179
    :cond_5
    const/16 v18, 0x0

    goto :goto_2

    .line 180
    :cond_6
    const/16 v18, 0x0

    goto :goto_3

    .line 191
    .end local v7    # "format":Ljava/text/Format;
    .end local v12    # "index":I
    .end local v16    # "start":I
    :cond_7
    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-super {v0, v1}, Ljava/text/MessageFormat;->applyPattern(Ljava/lang/String;)V

    .line 192
    invoke-super/range {p0 .. p0}, Ljava/text/MessageFormat;->toPattern()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v9}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->insertFormats(Ljava/lang/String;Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->toPattern:Ljava/lang/String;

    .line 193
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->containsElements(Ljava/util/Collection;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 194
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->getFormats()[Ljava/text/Format;

    move-result-object v14

    .line 197
    .local v14, "origFormats":[Ljava/text/Format;
    const/4 v11, 0x0

    .line 198
    .local v11, "i":I
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "it":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_9

    .line 199
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/text/Format;

    .line 200
    .local v5, "f":Ljava/text/Format;
    if-eqz v5, :cond_8

    .line 201
    aput-object v5, v14, v11

    .line 198
    :cond_8
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 204
    .end local v5    # "f":Ljava/text/Format;
    :cond_9
    move-object/from16 v0, p0

    invoke-super {v0, v14}, Ljava/text/MessageFormat;->setFormats([Ljava/text/Format;)V

    goto/16 :goto_0

    .line 156
    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_0
        0x7b -> :sswitch_1
    .end sparse-switch
.end method

.method public setFormat(ILjava/text/Format;)V
    .locals 1
    .param p1, "formatElementIndex"    # I
    .param p2, "newFormat"    # Ljava/text/Format;

    .prologue
    .line 213
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setFormatByArgumentIndex(ILjava/text/Format;)V
    .locals 1
    .param p1, "argumentIndex"    # I
    .param p2, "newFormat"    # Ljava/text/Format;

    .prologue
    .line 221
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setFormats([Ljava/text/Format;)V
    .locals 1
    .param p1, "newFormats"    # [Ljava/text/Format;

    .prologue
    .line 229
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public setFormatsByArgumentIndex([Ljava/text/Format;)V
    .locals 1
    .param p1, "newFormats"    # [Ljava/text/Format;

    .prologue
    .line 237
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public toPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/apache/commons/lang/text/ExtendedMessageFormat;->toPattern:Ljava/lang/String;

    return-object v0
.end method
