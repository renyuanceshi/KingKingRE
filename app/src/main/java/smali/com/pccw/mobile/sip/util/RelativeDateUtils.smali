.class public Lcom/pccw/mobile/sip/util/RelativeDateUtils;
.super Ljava/lang/Object;
.source "RelativeDateUtils.java"


# static fields
.field public static final ABBREV_MONTH_FORMAT:Ljava/lang/String; = "%b"

.field public static final ABBREV_WEEKDAY_FORMAT:Ljava/lang/String; = "%a"

.field public static final DAY_IN_MILLIS:J = 0x5265c00L

.field public static final FORMAT_12HOUR:I = 0x40

.field public static final FORMAT_24HOUR:I = 0x80

.field public static final FORMAT_ABBREV_ALL:I = 0x80000

.field public static final FORMAT_ABBREV_MONTH:I = 0x10000

.field public static final FORMAT_ABBREV_RELATIVE:I = 0x40000

.field public static final FORMAT_ABBREV_TIME:I = 0x4000

.field public static final FORMAT_ABBREV_WEEKDAY:I = 0x8000

.field public static final FORMAT_CAP_AMPM:I = 0x100

.field public static final FORMAT_CAP_MIDNIGHT:I = 0x1000

.field public static final FORMAT_CAP_NOON:I = 0x400

.field public static final FORMAT_CAP_NOON_MIDNIGHT:I = 0x1400

.field public static final FORMAT_NO_MIDNIGHT:I = 0x800

.field public static final FORMAT_NO_MONTH_DAY:I = 0x20

.field public static final FORMAT_NO_NOON:I = 0x200

.field public static final FORMAT_NO_NOON_MIDNIGHT:I = 0xa00

.field public static final FORMAT_NO_YEAR:I = 0x8

.field public static final FORMAT_NUMERIC_DATE:I = 0x20000

.field public static final FORMAT_SHOW_DATE:I = 0x10

.field public static final FORMAT_SHOW_TIME:I = 0x1

.field public static final FORMAT_SHOW_WEEKDAY:I = 0x2

.field public static final FORMAT_SHOW_YEAR:I = 0x4

.field public static final FORMAT_UTC:I = 0x2000

.field public static final HOUR_IN_MILLIS:J = 0x36ee80L

.field public static final HOUR_MINUTE_24:Ljava/lang/String; = "%H:%M"

.field public static final LENGTH_LONG:I = 0xa

.field public static final LENGTH_MEDIUM:I = 0x14

.field public static final LENGTH_SHORT:I = 0x1e

.field public static final LENGTH_SHORTER:I = 0x28

.field public static final LENGTH_SHORTEST:I = 0x32

.field public static final MINUTE_IN_MILLIS:J = 0xea60L

.field public static final MONTH_DAY_FORMAT:Ljava/lang/String; = "%-d"

.field public static final MONTH_FORMAT:Ljava/lang/String; = "%B"

.field public static final NUMERIC_MONTH_FORMAT:Ljava/lang/String; = "%m"

.field public static final SECOND_IN_MILLIS:J = 0x3e8L

.field public static final WEEKDAY_FORMAT:Ljava/lang/String; = "%A"

.field public static final WEEK_IN_MILLIS:J = 0x240c8400L

.field public static final YEAR_FORMAT:Ljava/lang/String; = "%Y"

.field public static final YEAR_FORMAT_TWO_DIGITS:Ljava/lang/String; = "%g"

.field public static final YEAR_IN_MILLIS:J = 0x7528ad000L

.field private static final sDays:[I

.field private static final sMonthsLong:[I

.field private static final sMonthsMedium:[I

.field private static final sMonthsShortest:[I

.field public static final sameMonthTable:[I

.field public static final sameYearTable:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/16 v2, 0x10

    const/16 v1, 0xc

    .line 18
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsLong:[I

    .line 25
    const/16 v0, 0x1f

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sDays:[I

    .line 38
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsMedium:[I

    .line 45
    new-array v0, v1, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsShortest:[I

    .line 112
    new-array v0, v2, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sameYearTable:[I

    .line 135
    new-array v0, v2, [I

    fill-array-data v0, :array_5

    sput-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sameMonthTable:[I

    return-void

    .line 18
    nop

    :array_0
    .array-data 4
        0x7f070188
        0x7f070187
        0x7f07018b
        0x7f070184
        0x7f07018c
        0x7f07018a
        0x7f070189
        0x7f070185
        0x7f07018f
        0x7f07018e
        0x7f07018d
        0x7f070186
    .end array-data

    .line 25
    :array_1
    .array-data 4
        0x7f0700c9
        0x7f0700d4
        0x7f0700df
        0x7f0700e2
        0x7f0700e3
        0x7f0700e4
        0x7f0700e5
        0x7f0700e6
        0x7f0700e7
        0x7f0700ca
        0x7f0700cb
        0x7f0700cc
        0x7f0700cd
        0x7f0700ce
        0x7f0700cf
        0x7f0700d0
        0x7f0700d1
        0x7f0700d2
        0x7f0700d3
        0x7f0700d5
        0x7f0700d6
        0x7f0700d7
        0x7f0700d8
        0x7f0700d9
        0x7f0700da
        0x7f0700db
        0x7f0700dc
        0x7f0700dd
        0x7f0700de
        0x7f0700e0
        0x7f0700e1
    .end array-data

    .line 38
    :array_2
    .array-data 4
        0x7f0701a0
        0x7f07019f
        0x7f0701a3
        0x7f07019c
        0x7f0701a4
        0x7f0701a2
        0x7f0701a1
        0x7f07019d
        0x7f0701a7
        0x7f0701a6
        0x7f0701a5
        0x7f07019e
    .end array-data

    .line 45
    :array_3
    .array-data 4
        0x7f0701ac
        0x7f0701ab
        0x7f0701af
        0x7f0701a8
        0x7f0701b0
        0x7f0701ae
        0x7f0701ad
        0x7f0701a9
        0x7f0701b3
        0x7f0701b2
        0x7f0701b1
        0x7f0701aa
    .end array-data

    .line 112
    :array_4
    .array-data 4
        0x7f070204
        0x7f070209
        0x7f070206
        0x7f07020b
        0x7f070205
        0x7f070208
        0x7f070207
        0x7f07020a
        0x7f0701cb
        0x7f0701d0
        0x7f0701cd
        0x7f0701d2
        0x7f0701cc
        0x7f0701cf
        0x7f0701ce
        0x7f0701d1
    .end array-data

    .line 135
    :array_5
    .array-data 4
        0x7f0701fc
        0x7f070201
        0x7f0701fe
        0x7f070203
        0x7f0701fd
        0x7f070200
        0x7f0701ff
        0x7f070202
        0x7f0701cb
        0x7f0701d0
        0x7f0701cd
        0x7f0701d2
        0x7f0701cc
        0x7f0701cf
        0x7f0701ce
        0x7f0701d1
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatDateRange(Landroid/content/Context;J)Ljava/lang/String;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "milliseconds"    # J

    .prologue
    .line 349
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    .line 350
    .local v0, "date":Ljava/util/Date;
    invoke-virtual {v0}, Ljava/util/Date;->getMonth()I

    move-result v2

    const/16 v3, 0xa

    invoke-static {p0, v2, v3}, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->getMonthString(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v1

    .line 351
    .local v1, "dateRange":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/Date;->getDate()I

    move-result v3

    invoke-static {p0, v3}, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->getDayString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 352
    return-object v1
.end method

.method public static getDayString(Landroid/content/Context;I)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "day"    # I

    .prologue
    .line 245
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 246
    .local v0, "r":Landroid/content/res/Resources;
    sget-object v1, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sDays:[I

    add-int/lit8 v2, p1, -0x1

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getMonthString(Landroid/content/Context;II)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "month"    # I
    .param p2, "abbrev"    # I

    .prologue
    .line 219
    sparse-switch p2, :sswitch_data_0

    .line 236
    sget-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsMedium:[I

    .line 240
    .local v0, "list":[I
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 241
    .local v1, "r":Landroid/content/res/Resources;
    add-int/lit8 v2, p1, 0x0

    aget v2, v0, v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 221
    .end local v0    # "list":[I
    .end local v1    # "r":Landroid/content/res/Resources;
    :sswitch_0
    sget-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsLong:[I

    .line 222
    .restart local v0    # "list":[I
    goto :goto_0

    .line 224
    .end local v0    # "list":[I
    :sswitch_1
    sget-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsMedium:[I

    .line 225
    .restart local v0    # "list":[I
    goto :goto_0

    .line 227
    .end local v0    # "list":[I
    :sswitch_2
    sget-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsMedium:[I

    .line 228
    .restart local v0    # "list":[I
    goto :goto_0

    .line 230
    .end local v0    # "list":[I
    :sswitch_3
    sget-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsMedium:[I

    .line 231
    .restart local v0    # "list":[I
    goto :goto_0

    .line 233
    .end local v0    # "list":[I
    :sswitch_4
    sget-object v0, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->sMonthsShortest:[I

    .line 234
    .restart local v0    # "list":[I
    goto :goto_0

    .line 219
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0x14 -> :sswitch_1
        0x1e -> :sswitch_2
        0x28 -> :sswitch_3
        0x32 -> :sswitch_4
    .end sparse-switch
.end method

.method public static getRelativeTimeSpanString(Landroid/content/Context;JJJI)Ljava/lang/CharSequence;
    .locals 13
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "time"    # J
    .param p3, "now"    # J
    .param p5, "minResolution"    # J
    .param p7, "flags"    # I

    .prologue
    .line 271
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 272
    .local v7, "r":Landroid/content/res/Resources;
    const/high16 v9, 0xc0000

    and-int v9, v9, p7

    if-eqz v9, :cond_0

    const/4 v0, 0x1

    .line 274
    .local v0, "abbrevRelative":Z
    :goto_0
    cmp-long v9, p3, p1

    if-ltz v9, :cond_1

    const/4 v6, 0x1

    .line 275
    .local v6, "past":Z
    :goto_1
    sub-long v10, p3, p1

    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    .line 279
    .local v4, "duration":J
    const-wide/32 v10, 0xea60

    cmp-long v9, v4, v10

    if-gez v9, :cond_5

    const-wide/32 v10, 0xea60

    cmp-long v9, p5, v10

    if-gez v9, :cond_5

    .line 280
    const-wide/16 v10, 0x3e8

    div-long v2, v4, v10

    .line 281
    .local v2, "count":J
    if-eqz v6, :cond_3

    .line 282
    if-eqz v0, :cond_2

    .line 283
    const v8, 0x7f0d0007

    .line 344
    .local v8, "resId":I
    :goto_2
    long-to-int v9, v2

    invoke-virtual {v7, v8, v9}, Landroid/content/res/Resources;->getQuantityString(II)Ljava/lang/String;

    move-result-object v1

    .line 345
    .local v1, "format":Ljava/lang/String;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v1, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .end local v1    # "format":Ljava/lang/String;
    .end local v2    # "count":J
    .end local v8    # "resId":I
    :goto_3
    return-object v9

    .line 272
    .end local v0    # "abbrevRelative":Z
    .end local v4    # "duration":J
    .end local v6    # "past":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 274
    .restart local v0    # "abbrevRelative":Z
    :cond_1
    const/4 v6, 0x0

    goto :goto_1

    .line 285
    .restart local v2    # "count":J
    .restart local v4    # "duration":J
    .restart local v6    # "past":Z
    :cond_2
    const v8, 0x7f0d000f

    .restart local v8    # "resId":I
    goto :goto_2

    .line 288
    .end local v8    # "resId":I
    :cond_3
    if-eqz v0, :cond_4

    .line 289
    const v8, 0x7f0d0003

    .restart local v8    # "resId":I
    goto :goto_2

    .line 291
    .end local v8    # "resId":I
    :cond_4
    const v8, 0x7f0d000b

    .restart local v8    # "resId":I
    goto :goto_2

    .line 294
    .end local v2    # "count":J
    .end local v8    # "resId":I
    :cond_5
    const-wide/32 v10, 0x36ee80

    cmp-long v9, v4, v10

    if-gez v9, :cond_9

    const-wide/32 v10, 0x36ee80

    cmp-long v9, p5, v10

    if-gez v9, :cond_9

    .line 295
    const-wide/32 v10, 0xea60

    div-long v2, v4, v10

    .line 296
    .restart local v2    # "count":J
    if-eqz v6, :cond_7

    .line 297
    if-eqz v0, :cond_6

    .line 298
    const v8, 0x7f0d0006

    .restart local v8    # "resId":I
    goto :goto_2

    .line 300
    .end local v8    # "resId":I
    :cond_6
    const v8, 0x7f0d000e

    .restart local v8    # "resId":I
    goto :goto_2

    .line 303
    .end local v8    # "resId":I
    :cond_7
    if-eqz v0, :cond_8

    .line 304
    const v8, 0x7f0d0002

    .restart local v8    # "resId":I
    goto :goto_2

    .line 306
    .end local v8    # "resId":I
    :cond_8
    const v8, 0x7f0d000a

    .restart local v8    # "resId":I
    goto :goto_2

    .line 309
    .end local v2    # "count":J
    .end local v8    # "resId":I
    :cond_9
    const-wide/32 v10, 0x5265c00

    cmp-long v9, v4, v10

    if-gez v9, :cond_d

    const-wide/32 v10, 0x5265c00

    cmp-long v9, p5, v10

    if-gez v9, :cond_d

    .line 310
    const-wide/32 v10, 0x36ee80

    div-long v2, v4, v10

    .line 311
    .restart local v2    # "count":J
    if-eqz v6, :cond_b

    .line 312
    if-eqz v0, :cond_a

    .line 313
    const v8, 0x7f0d0005

    .restart local v8    # "resId":I
    goto :goto_2

    .line 315
    .end local v8    # "resId":I
    :cond_a
    const v8, 0x7f0d000d

    .restart local v8    # "resId":I
    goto :goto_2

    .line 318
    .end local v8    # "resId":I
    :cond_b
    if-eqz v0, :cond_c

    .line 319
    const v8, 0x7f0d0001

    .restart local v8    # "resId":I
    goto :goto_2

    .line 321
    .end local v8    # "resId":I
    :cond_c
    const v8, 0x7f0d0009

    .restart local v8    # "resId":I
    goto :goto_2

    .line 324
    .end local v2    # "count":J
    .end local v8    # "resId":I
    :cond_d
    const-wide/32 v10, 0x240c8400

    cmp-long v9, v4, v10

    if-gez v9, :cond_11

    const-wide/32 v10, 0x240c8400

    cmp-long v9, p5, v10

    if-gez v9, :cond_11

    .line 325
    const-wide/32 v10, 0x5265c00

    div-long v2, v4, v10

    .line 326
    .restart local v2    # "count":J
    if-eqz v6, :cond_f

    .line 327
    if-eqz v0, :cond_e

    .line 328
    const v8, 0x7f0d0004

    .restart local v8    # "resId":I
    goto/16 :goto_2

    .line 330
    .end local v8    # "resId":I
    :cond_e
    const v8, 0x7f0d000c

    .restart local v8    # "resId":I
    goto/16 :goto_2

    .line 333
    .end local v8    # "resId":I
    :cond_f
    if-eqz v0, :cond_10

    .line 334
    const/high16 v8, 0x7f0d0000

    .restart local v8    # "resId":I
    goto/16 :goto_2

    .line 336
    .end local v8    # "resId":I
    :cond_10
    const v8, 0x7f0d0008

    .restart local v8    # "resId":I
    goto/16 :goto_2

    .line 340
    .end local v2    # "count":J
    .end local v8    # "resId":I
    :cond_11
    invoke-static {p0, p1, p2}, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->formatDateRange(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_3
.end method
