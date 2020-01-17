.class public Lorg/apache/commons/lang/time/DurationFormatUtils;
.super Ljava/lang/Object;
.source "DurationFormatUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    }
.end annotation


# static fields
.field static final H:Ljava/lang/Object;

.field public static final ISO_EXTENDED_FORMAT_PATTERN:Ljava/lang/String; = "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

.field static final M:Ljava/lang/Object;

.field static final S:Ljava/lang/Object;

.field static final d:Ljava/lang/Object;

.field static final m:Ljava/lang/Object;

.field static final s:Ljava/lang/Object;

.field static final y:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 476
    const-string/jumbo v0, "y"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    .line 477
    const-string/jumbo v0, "M"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->M:Ljava/lang/Object;

    .line 478
    const-string/jumbo v0, "d"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    .line 479
    const-string/jumbo v0, "H"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    .line 480
    const-string/jumbo v0, "m"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    .line 481
    const-string/jumbo v0, "s"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    .line 482
    const-string/jumbo v0, "S"

    sput-object v0, Lorg/apache/commons/lang/time/DurationFormatUtils;->S:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method static format([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;IIIIIIIZ)Ljava/lang/String;
    .locals 11
    .param p0, "tokens"    # [Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    .param p1, "years"    # I
    .param p2, "months"    # I
    .param p3, "days"    # I
    .param p4, "hours"    # I
    .param p5, "minutes"    # I
    .param p6, "seconds"    # I
    .param p7, "milliseconds"    # I
    .param p8, "padWithZeros"    # Z

    .prologue
    .line 423
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 424
    .local v1, "buffer":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .line 425
    .local v4, "lastOutputSeconds":Z
    array-length v6, p0

    .line 426
    .local v6, "sz":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v6, :cond_11

    .line 427
    aget-object v7, p0, v3

    .line 428
    .local v7, "token":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    invoke-virtual {v7}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->getValue()Ljava/lang/Object;

    move-result-object v8

    .line 429
    .local v8, "value":Ljava/lang/Object;
    invoke-virtual {v7}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->getCount()I

    move-result v2

    .line 430
    .local v2, "count":I
    instance-of v9, v8, Ljava/lang/StringBuffer;

    if-eqz v9, :cond_1

    .line 431
    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 426
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 433
    :cond_1
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    if-ne v8, v9, :cond_3

    .line 434
    if-eqz p8, :cond_2

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v2, v10}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v9

    :goto_2
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 436
    const/4 v4, 0x0

    goto :goto_1

    .line 434
    :cond_2
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_2

    .line 437
    :cond_3
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->M:Ljava/lang/Object;

    if-ne v8, v9, :cond_5

    .line 438
    if-eqz p8, :cond_4

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v2, v10}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v9

    :goto_3
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 440
    const/4 v4, 0x0

    goto :goto_1

    .line 438
    :cond_4
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_3

    .line 441
    :cond_5
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    if-ne v8, v9, :cond_7

    .line 442
    if-eqz p8, :cond_6

    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v2, v10}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v9

    :goto_4
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 444
    const/4 v4, 0x0

    goto :goto_1

    .line 442
    :cond_6
    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_4

    .line 445
    :cond_7
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    if-ne v8, v9, :cond_9

    .line 446
    if-eqz p8, :cond_8

    invoke-static {p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v2, v10}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v9

    :goto_5
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 448
    const/4 v4, 0x0

    goto :goto_1

    .line 446
    :cond_8
    invoke-static {p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_5

    .line 449
    :cond_9
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    if-ne v8, v9, :cond_b

    .line 450
    if-eqz p8, :cond_a

    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v2, v10}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v9

    :goto_6
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 452
    const/4 v4, 0x0

    goto :goto_1

    .line 450
    :cond_a
    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_6

    .line 453
    :cond_b
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    if-ne v8, v9, :cond_d

    .line 454
    if-eqz p8, :cond_c

    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v2, v10}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v9

    :goto_7
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 456
    const/4 v4, 0x1

    goto/16 :goto_1

    .line 454
    :cond_c
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_7

    .line 457
    :cond_d
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->S:Ljava/lang/Object;

    if-ne v8, v9, :cond_0

    .line 458
    if-eqz v4, :cond_f

    .line 459
    move/from16 v0, p7

    add-int/lit16 v0, v0, 0x3e8

    move/from16 p7, v0

    .line 460
    if-eqz p8, :cond_e

    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v2, v10}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v5

    .line 463
    .local v5, "str":Ljava/lang/String;
    :goto_8
    const/4 v9, 0x1

    invoke-virtual {v5, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 469
    .end local v5    # "str":Ljava/lang/String;
    :goto_9
    const/4 v4, 0x0

    goto/16 :goto_1

    .line 460
    :cond_e
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_8

    .line 465
    :cond_f
    if-eqz p8, :cond_10

    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x30

    invoke-static {v9, v2, v10}, Lorg/apache/commons/lang/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v9

    :goto_a
    invoke-virtual {v1, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_9

    :cond_10
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_a

    .line 473
    .end local v2    # "count":I
    .end local v7    # "token":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    .end local v8    # "value":Ljava/lang/Object;
    :cond_11
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    return-object v9
.end method

.method public static formatDuration(JLjava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "durationMillis"    # J
    .param p2, "format"    # Ljava/lang/String;

    .prologue
    .line 111
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDuration(JLjava/lang/String;Z)Ljava/lang/String;
    .locals 12
    .param p0, "durationMillis"    # J
    .param p2, "format"    # Ljava/lang/String;
    .param p3, "padWithZeros"    # Z

    .prologue
    .line 129
    invoke-static {p2}, Lorg/apache/commons/lang/time/DurationFormatUtils;->lexx(Ljava/lang/String;)[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    move-result-object v0

    .line 131
    .local v0, "tokens":[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    const/4 v3, 0x0

    .line 132
    .local v3, "days":I
    const/4 v4, 0x0

    .line 133
    .local v4, "hours":I
    const/4 v5, 0x0

    .line 134
    .local v5, "minutes":I
    const/4 v6, 0x0

    .line 135
    .local v6, "seconds":I
    const/4 v7, 0x0

    .line 137
    .local v7, "milliseconds":I
    sget-object v1, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    const-wide/32 v8, 0x5265c00

    div-long v8, p0, v8

    long-to-int v3, v8

    .line 139
    int-to-long v8, v3

    const-wide/32 v10, 0x5265c00

    mul-long/2addr v8, v10

    sub-long/2addr p0, v8

    .line 141
    :cond_0
    sget-object v1, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 142
    const-wide/32 v8, 0x36ee80

    div-long v8, p0, v8

    long-to-int v4, v8

    .line 143
    int-to-long v8, v4

    const-wide/32 v10, 0x36ee80

    mul-long/2addr v8, v10

    sub-long/2addr p0, v8

    .line 145
    :cond_1
    sget-object v1, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 146
    const-wide/32 v8, 0xea60

    div-long v8, p0, v8

    long-to-int v5, v8

    .line 147
    int-to-long v8, v5

    const-wide/32 v10, 0xea60

    mul-long/2addr v8, v10

    sub-long/2addr p0, v8

    .line 149
    :cond_2
    sget-object v1, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 150
    const-wide/16 v8, 0x3e8

    div-long v8, p0, v8

    long-to-int v6, v8

    .line 151
    int-to-long v8, v6

    const-wide/16 v10, 0x3e8

    mul-long/2addr v8, v10

    sub-long/2addr p0, v8

    .line 153
    :cond_3
    sget-object v1, Lorg/apache/commons/lang/time/DurationFormatUtils;->S:Ljava/lang/Object;

    invoke-static {v0, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 154
    long-to-int v7, p0

    .line 157
    :cond_4
    const/4 v1, 0x0

    const/4 v2, 0x0

    move v8, p3

    invoke-static/range {v0 .. v8}, Lorg/apache/commons/lang/time/DurationFormatUtils;->format([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;IIIIIIIZ)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static formatDurationHMS(J)Ljava/lang/String;
    .locals 2
    .param p0, "durationMillis"    # J

    .prologue
    .line 81
    const-string/jumbo v0, "H:mm:ss.SSS"

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDurationISO(J)Ljava/lang/String;
    .locals 2
    .param p0, "durationMillis"    # J

    .prologue
    .line 96
    const-string/jumbo v0, "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatDurationWords(JZZ)Ljava/lang/String;
    .locals 4
    .param p0, "durationMillis"    # J
    .param p2, "suppressLeadingZeroElements"    # Z
    .param p3, "suppressTrailingZeroElements"    # Z

    .prologue
    .line 179
    const-string/jumbo v2, "d\' days \'H\' hours \'m\' minutes \'s\' seconds\'"

    invoke-static {p0, p1, v2}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatDuration(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, "duration":Ljava/lang/String;
    if-eqz p2, :cond_1

    .line 182
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 183
    const-string/jumbo v2, " 0 days"

    const-string/jumbo v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 184
    .local v1, "tmp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 185
    move-object v0, v1

    .line 186
    const-string/jumbo v2, " 0 hours"

    const-string/jumbo v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 187
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 188
    move-object v0, v1

    .line 189
    const-string/jumbo v2, " 0 minutes"

    const-string/jumbo v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 190
    move-object v0, v1

    .line 191
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 192
    const-string/jumbo v2, " 0 seconds"

    const-string/jumbo v3, ""

    invoke-static {v1, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 196
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_1

    .line 198
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 201
    .end local v1    # "tmp":Ljava/lang/String;
    :cond_1
    if-eqz p3, :cond_2

    .line 202
    const-string/jumbo v2, " 0 seconds"

    const-string/jumbo v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 203
    .restart local v1    # "tmp":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 204
    move-object v0, v1

    .line 205
    const-string/jumbo v2, " 0 minutes"

    const-string/jumbo v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 206
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 207
    move-object v0, v1

    .line 208
    const-string/jumbo v2, " 0 hours"

    const-string/jumbo v3, ""

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 209
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v2, v3, :cond_2

    .line 210
    const-string/jumbo v2, " 0 days"

    const-string/jumbo v3, ""

    invoke-static {v1, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 216
    .end local v1    # "tmp":Ljava/lang/String;
    :cond_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 217
    const-string/jumbo v2, " 1 seconds"

    const-string/jumbo v3, " 1 second"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 218
    const-string/jumbo v2, " 1 minutes"

    const-string/jumbo v3, " 1 minute"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 219
    const-string/jumbo v2, " 1 hours"

    const-string/jumbo v3, " 1 hour"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 220
    const-string/jumbo v2, " 1 days"

    const-string/jumbo v3, " 1 day"

    invoke-static {v0, v2, v3}, Lorg/apache/commons/lang/StringUtils;->replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 221
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static formatPeriod(JJLjava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J
    .param p4, "format"    # Ljava/lang/String;

    .prologue
    .line 248
    const/4 v5, 0x1

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    move-wide v0, p0

    move-wide v2, p2

    move-object v4, p4

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;
    .locals 16
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J
    .param p4, "format"    # Ljava/lang/String;
    .param p5, "padWithZeros"    # Z
    .param p6, "timezone"    # Ljava/util/TimeZone;

    .prologue
    .line 283
    invoke-static/range {p4 .. p4}, Lorg/apache/commons/lang/time/DurationFormatUtils;->lexx(Ljava/lang/String;)[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    move-result-object v2

    .line 287
    .local v2, "tokens":[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    invoke-static/range {p6 .. p6}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v12

    .line 288
    .local v12, "start":Ljava/util/Calendar;
    new-instance v10, Ljava/util/Date;

    move-wide/from16 v0, p0

    invoke-direct {v10, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 289
    invoke-static/range {p6 .. p6}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v11

    .line 290
    .local v11, "end":Ljava/util/Calendar;
    new-instance v10, Ljava/util/Date;

    move-wide/from16 v0, p2

    invoke-direct {v10, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 293
    const/16 v10, 0xe

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/16 v14, 0xe

    invoke-virtual {v12, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    sub-int v9, v10, v14

    .line 294
    .local v9, "milliseconds":I
    const/16 v10, 0xd

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/16 v14, 0xd

    invoke-virtual {v12, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    sub-int v8, v10, v14

    .line 295
    .local v8, "seconds":I
    const/16 v10, 0xc

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/16 v14, 0xc

    invoke-virtual {v12, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    sub-int v7, v10, v14

    .line 296
    .local v7, "minutes":I
    const/16 v10, 0xb

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/16 v14, 0xb

    invoke-virtual {v12, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    sub-int v6, v10, v14

    .line 297
    .local v6, "hours":I
    const/4 v10, 0x5

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/4 v14, 0x5

    invoke-virtual {v12, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    sub-int v5, v10, v14

    .line 298
    .local v5, "days":I
    const/4 v10, 0x2

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/4 v14, 0x2

    invoke-virtual {v12, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    sub-int v4, v10, v14

    .line 299
    .local v4, "months":I
    const/4 v10, 0x1

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/4 v14, 0x1

    invoke-virtual {v12, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    sub-int v3, v10, v14

    .line 302
    .local v3, "years":I
    :goto_0
    if-gez v9, :cond_0

    .line 303
    add-int/lit16 v9, v9, 0x3e8

    .line 304
    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .line 306
    :cond_0
    :goto_1
    if-gez v8, :cond_1

    .line 307
    add-int/lit8 v8, v8, 0x3c

    .line 308
    add-int/lit8 v7, v7, -0x1

    goto :goto_1

    .line 310
    :cond_1
    :goto_2
    if-gez v7, :cond_2

    .line 311
    add-int/lit8 v7, v7, 0x3c

    .line 312
    add-int/lit8 v6, v6, -0x1

    goto :goto_2

    .line 314
    :cond_2
    :goto_3
    if-gez v6, :cond_3

    .line 315
    add-int/lit8 v6, v6, 0x18

    .line 316
    add-int/lit8 v5, v5, -0x1

    goto :goto_3

    .line 319
    :cond_3
    sget-object v10, Lorg/apache/commons/lang/time/DurationFormatUtils;->M:Ljava/lang/Object;

    invoke-static {v2, v10}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 320
    :goto_4
    if-gez v5, :cond_4

    .line 321
    const/4 v10, 0x5

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v10

    add-int/2addr v5, v10

    .line 322
    add-int/lit8 v4, v4, -0x1

    .line 323
    const/4 v10, 0x2

    const/4 v14, 0x1

    invoke-virtual {v12, v10, v14}, Ljava/util/Calendar;->add(II)V

    goto :goto_4

    .line 326
    :cond_4
    :goto_5
    if-gez v4, :cond_5

    .line 327
    add-int/lit8 v4, v4, 0xc

    .line 328
    add-int/lit8 v3, v3, -0x1

    goto :goto_5

    .line 331
    :cond_5
    sget-object v10, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    invoke-static {v2, v10}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_c

    if-eqz v3, :cond_c

    .line 332
    :goto_6
    if-eqz v3, :cond_c

    .line 333
    mul-int/lit8 v10, v3, 0xc

    add-int/2addr v4, v10

    .line 334
    const/4 v3, 0x0

    goto :goto_6

    .line 340
    :cond_6
    sget-object v10, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    invoke-static {v2, v10}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_a

    .line 341
    const/4 v10, 0x1

    invoke-virtual {v11, v10}, Ljava/util/Calendar;->get(I)I

    move-result v13

    .line 342
    .local v13, "target":I
    if-gez v4, :cond_7

    .line 344
    add-int/lit8 v13, v13, -0x1

    .line 347
    :cond_7
    :goto_7
    const/4 v10, 0x1

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    if-eq v10, v13, :cond_9

    .line 348
    const/4 v10, 0x6

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v10

    const/4 v14, 0x6

    invoke-virtual {v12, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    sub-int/2addr v10, v14

    add-int/2addr v5, v10

    .line 351
    instance-of v10, v12, Ljava/util/GregorianCalendar;

    if-eqz v10, :cond_8

    .line 352
    const/4 v10, 0x2

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/4 v14, 0x1

    if-ne v10, v14, :cond_8

    const/4 v10, 0x5

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/16 v14, 0x1d

    if-ne v10, v14, :cond_8

    .line 355
    add-int/lit8 v5, v5, 0x1

    .line 359
    :cond_8
    const/4 v10, 0x1

    const/4 v14, 0x1

    invoke-virtual {v12, v10, v14}, Ljava/util/Calendar;->add(II)V

    .line 361
    const/4 v10, 0x6

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    add-int/2addr v5, v10

    goto :goto_7

    .line 364
    :cond_9
    const/4 v3, 0x0

    .line 367
    .end local v13    # "target":I
    :cond_a
    :goto_8
    const/4 v10, 0x2

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->get(I)I

    move-result v10

    const/4 v14, 0x2

    invoke-virtual {v11, v14}, Ljava/util/Calendar;->get(I)I

    move-result v14

    if-eq v10, v14, :cond_b

    .line 368
    const/4 v10, 0x5

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v10

    add-int/2addr v5, v10

    .line 369
    const/4 v10, 0x2

    const/4 v14, 0x1

    invoke-virtual {v12, v10, v14}, Ljava/util/Calendar;->add(II)V

    goto :goto_8

    .line 372
    :cond_b
    const/4 v4, 0x0

    .line 374
    :goto_9
    if-gez v5, :cond_c

    .line 375
    const/4 v10, 0x5

    invoke-virtual {v12, v10}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v10

    add-int/2addr v5, v10

    .line 376
    add-int/lit8 v4, v4, -0x1

    .line 377
    const/4 v10, 0x2

    const/4 v14, 0x1

    invoke-virtual {v12, v10, v14}, Ljava/util/Calendar;->add(II)V

    goto :goto_9

    .line 386
    :cond_c
    sget-object v10, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    invoke-static {v2, v10}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_d

    .line 387
    mul-int/lit8 v10, v5, 0x18

    add-int/2addr v6, v10

    .line 388
    const/4 v5, 0x0

    .line 390
    :cond_d
    sget-object v10, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    invoke-static {v2, v10}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_e

    .line 391
    mul-int/lit8 v10, v6, 0x3c

    add-int/2addr v7, v10

    .line 392
    const/4 v6, 0x0

    .line 394
    :cond_e
    sget-object v10, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    invoke-static {v2, v10}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_f

    .line 395
    mul-int/lit8 v10, v7, 0x3c

    add-int/2addr v8, v10

    .line 396
    const/4 v7, 0x0

    .line 398
    :cond_f
    sget-object v10, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    invoke-static {v2, v10}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->containsTokenWithValue([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_10

    .line 399
    mul-int/lit16 v10, v8, 0x3e8

    add-int/2addr v9, v10

    .line 400
    const/4 v8, 0x0

    :cond_10
    move/from16 v10, p5

    .line 403
    invoke-static/range {v2 .. v10}, Lorg/apache/commons/lang/time/DurationFormatUtils;->format([Lorg/apache/commons/lang/time/DurationFormatUtils$Token;IIIIIIIZ)Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method

.method public static formatPeriodISO(JJ)Ljava/lang/String;
    .locals 8
    .param p0, "startMillis"    # J
    .param p2, "endMillis"    # J

    .prologue
    .line 235
    const-string/jumbo v4, "\'P\'yyyy\'Y\'M\'M\'d\'DT\'H\'H\'m\'M\'s.S\'S\'"

    const/4 v5, 0x0

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v6

    move-wide v0, p0

    move-wide v2, p2

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang/time/DurationFormatUtils;->formatPeriod(JJLjava/lang/String;ZLjava/util/TimeZone;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static lexx(Ljava/lang/String;)[Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    .locals 11
    .param p0, "format"    # Ljava/lang/String;

    .prologue
    .line 491
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 492
    .local v0, "array":[C
    new-instance v5, Ljava/util/ArrayList;

    array-length v10, v0

    invoke-direct {v5, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 494
    .local v5, "list":Ljava/util/ArrayList;
    const/4 v4, 0x0

    .line 495
    .local v4, "inLiteral":Z
    const/4 v1, 0x0

    .line 496
    .local v1, "buffer":Ljava/lang/StringBuffer;
    const/4 v6, 0x0

    .line 497
    .local v6, "previous":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    array-length v7, v0

    .line 498
    .local v7, "sz":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v7, :cond_5

    .line 499
    aget-char v2, v0, v3

    .line 500
    .local v2, "ch":C
    if-eqz v4, :cond_1

    const/16 v10, 0x27

    if-eq v2, v10, :cond_1

    .line 501
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 498
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 504
    :cond_1
    const/4 v9, 0x0

    .line 505
    .local v9, "value":Ljava/lang/Object;
    sparse-switch v2, :sswitch_data_0

    .line 525
    if-nez v1, :cond_2

    .line 526
    new-instance v1, Ljava/lang/StringBuffer;

    .end local v1    # "buffer":Ljava/lang/StringBuffer;
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 527
    .restart local v1    # "buffer":Ljava/lang/StringBuffer;
    new-instance v10, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    invoke-direct {v10, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 529
    :cond_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 532
    .end local v9    # "value":Ljava/lang/Object;
    :goto_2
    if-eqz v9, :cond_0

    .line 533
    if-eqz v6, :cond_4

    invoke-virtual {v6}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->getValue()Ljava/lang/Object;

    move-result-object v10

    if-ne v10, v9, :cond_4

    .line 534
    invoke-virtual {v6}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;->increment()V

    .line 540
    :goto_3
    const/4 v1, 0x0

    goto :goto_1

    .line 508
    .restart local v9    # "value":Ljava/lang/Object;
    :sswitch_0
    if-eqz v4, :cond_3

    .line 509
    const/4 v1, 0x0

    .line 510
    const/4 v4, 0x0

    goto :goto_2

    .line 512
    :cond_3
    new-instance v1, Ljava/lang/StringBuffer;

    .end local v1    # "buffer":Ljava/lang/StringBuffer;
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 513
    .restart local v1    # "buffer":Ljava/lang/StringBuffer;
    new-instance v10, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    invoke-direct {v10, v1}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 514
    const/4 v4, 0x1

    .line 516
    goto :goto_2

    .line 517
    :sswitch_1
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->y:Ljava/lang/Object;

    goto :goto_2

    .line 518
    :sswitch_2
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->M:Ljava/lang/Object;

    goto :goto_2

    .line 519
    :sswitch_3
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->d:Ljava/lang/Object;

    goto :goto_2

    .line 520
    :sswitch_4
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->H:Ljava/lang/Object;

    goto :goto_2

    .line 521
    :sswitch_5
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->m:Ljava/lang/Object;

    goto :goto_2

    .line 522
    :sswitch_6
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->s:Ljava/lang/Object;

    goto :goto_2

    .line 523
    :sswitch_7
    sget-object v9, Lorg/apache/commons/lang/time/DurationFormatUtils;->S:Ljava/lang/Object;

    goto :goto_2

    .line 536
    .end local v9    # "value":Ljava/lang/Object;
    :cond_4
    new-instance v8, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    invoke-direct {v8, v9}, Lorg/apache/commons/lang/time/DurationFormatUtils$Token;-><init>(Ljava/lang/Object;)V

    .line 537
    .local v8, "token":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 538
    move-object v6, v8

    goto :goto_3

    .line 543
    .end local v2    # "ch":C
    .end local v8    # "token":Lorg/apache/commons/lang/time/DurationFormatUtils$Token;
    :cond_5
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v10

    new-array v10, v10, [Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    check-cast v10, [Lorg/apache/commons/lang/time/DurationFormatUtils$Token;

    return-object v10

    .line 505
    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_0
        0x48 -> :sswitch_4
        0x4d -> :sswitch_2
        0x53 -> :sswitch_7
        0x64 -> :sswitch_3
        0x6d -> :sswitch_5
        0x73 -> :sswitch_6
        0x79 -> :sswitch_1
    .end sparse-switch
.end method
