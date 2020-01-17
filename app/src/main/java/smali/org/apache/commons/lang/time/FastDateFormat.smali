.class public Lorg/apache/commons/lang/time/FastDateFormat;
.super Ljava/text/Format;
.source "FastDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang/time/FastDateFormat$Pair;,
        Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneDisplayKey;,
        Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNumberRule;,
        Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNameRule;,
        Lorg/apache/commons/lang/time/FastDateFormat$TwentyFourHourField;,
        Lorg/apache/commons/lang/time/FastDateFormat$TwelveHourField;,
        Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitMonthField;,
        Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitYearField;,
        Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitNumberField;,
        Lorg/apache/commons/lang/time/FastDateFormat$PaddedNumberField;,
        Lorg/apache/commons/lang/time/FastDateFormat$UnpaddedMonthField;,
        Lorg/apache/commons/lang/time/FastDateFormat$UnpaddedNumberField;,
        Lorg/apache/commons/lang/time/FastDateFormat$TextField;,
        Lorg/apache/commons/lang/time/FastDateFormat$StringLiteral;,
        Lorg/apache/commons/lang/time/FastDateFormat$CharacterLiteral;,
        Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;,
        Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    }
.end annotation


# static fields
.field public static final FULL:I = 0x0

.field public static final LONG:I = 0x1

.field public static final MEDIUM:I = 0x2

.field public static final SHORT:I = 0x3

.field private static final cDateInstanceCache:Ljava/util/Map;

.field private static final cDateTimeInstanceCache:Ljava/util/Map;

.field private static cDefaultPattern:Ljava/lang/String; = null

.field private static final cInstanceCache:Ljava/util/Map;

.field private static final cTimeInstanceCache:Ljava/util/Map;

.field private static final cTimeZoneDisplayCache:Ljava/util/Map;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final mLocale:Ljava/util/Locale;

.field private final mLocaleForced:Z

.field private transient mMaxLengthEstimate:I

.field private final mPattern:Ljava/lang/String;

.field private transient mRules:[Lorg/apache/commons/lang/time/FastDateFormat$Rule;

.field private final mTimeZone:Ljava/util/TimeZone;

.field private final mTimeZoneForced:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x7

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang/time/FastDateFormat;->cInstanceCache:Ljava/util/Map;

    .line 111
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang/time/FastDateFormat;->cDateInstanceCache:Ljava/util/Map;

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang/time/FastDateFormat;->cTimeInstanceCache:Ljava/util/Map;

    .line 113
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang/time/FastDateFormat;->cDateTimeInstanceCache:Ljava/util/Map;

    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang/time/FastDateFormat;->cTimeZoneDisplayCache:Ljava/util/Map;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)V
    .locals 3
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "timeZone"    # Ljava/util/TimeZone;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 534
    invoke-direct {p0}, Ljava/text/Format;-><init>()V

    .line 535
    if-nez p1, :cond_0

    .line 536
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "The pattern must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 538
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    .line 540
    if-eqz p2, :cond_3

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZoneForced:Z

    .line 541
    if-nez p2, :cond_1

    .line 542
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object p2

    .line 544
    :cond_1
    iput-object p2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    .line 546
    if-eqz p3, :cond_4

    :goto_1
    iput-boolean v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocaleForced:Z

    .line 547
    if-nez p3, :cond_2

    .line 548
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    .line 550
    :cond_2
    iput-object p3, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    .line 551
    return-void

    :cond_3
    move v0, v2

    .line 540
    goto :goto_0

    :cond_4
    move v1, v2

    .line 546
    goto :goto_1
.end method

.method public static getDateInstance(I)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "style"    # I

    .prologue
    const/4 v0, 0x0

    .line 234
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->getDateInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getDateInstance(ILjava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "style"    # I
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 249
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/FastDateFormat;->getDateInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getDateInstance(ILjava/util/TimeZone;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "style"    # I
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 265
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->getDateInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getDateInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 10
    .param p0, "style"    # I
    .param p1, "timeZone"    # Ljava/util/TimeZone;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 280
    const-class v7, Lorg/apache/commons/lang/time/FastDateFormat;

    monitor-enter v7

    :try_start_0
    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p0}, Ljava/lang/Integer;-><init>(I)V

    .line 281
    .local v3, "key":Ljava/lang/Integer;
    if-eqz p1, :cond_2

    .line 282
    new-instance v4, Lorg/apache/commons/lang/time/FastDateFormat$Pair;

    invoke-direct {v4, v3, p1}, Lorg/apache/commons/lang/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 285
    .end local v3    # "key":Ljava/lang/Integer;
    :goto_0
    if-nez p2, :cond_0

    .line 286
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    .line 289
    :cond_0
    new-instance v3, Lorg/apache/commons/lang/time/FastDateFormat$Pair;

    invoke-direct {v3, v4, p2}, Lorg/apache/commons/lang/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 291
    .local v3, "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    sget-object v6, Lorg/apache/commons/lang/time/FastDateFormat;->cDateInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang/time/FastDateFormat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 292
    .local v1, "format":Lorg/apache/commons/lang/time/FastDateFormat;
    if-nez v1, :cond_1

    .line 294
    :try_start_1
    invoke-static {p0, p2}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    check-cast v2, Ljava/text/SimpleDateFormat;

    .line 295
    .local v2, "formatter":Ljava/text/SimpleDateFormat;
    invoke-virtual {v2}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    .line 296
    .local v5, "pattern":Ljava/lang/String;
    invoke-static {v5, p1, p2}, Lorg/apache/commons/lang/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v1

    .line 297
    sget-object v6, Lorg/apache/commons/lang/time/FastDateFormat;->cDateInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 303
    .end local v2    # "formatter":Ljava/text/SimpleDateFormat;
    .end local v5    # "pattern":Ljava/lang/String;
    :cond_1
    monitor-exit v7

    return-object v1

    .line 299
    :catch_0
    move-exception v0

    .line 300
    .local v0, "ex":Ljava/lang/ClassCastException;
    :try_start_2
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "No date pattern for locale: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 280
    .end local v0    # "ex":Ljava/lang/ClassCastException;
    .end local v1    # "format":Lorg/apache/commons/lang/time/FastDateFormat;
    .end local v3    # "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6

    .local v3, "key":Ljava/lang/Integer;
    :cond_2
    move-object v4, v3

    .local v4, "key":Ljava/lang/Object;
    goto :goto_0
.end method

.method public static getDateTimeInstance(II)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "dateStyle"    # I
    .param p1, "timeStyle"    # I

    .prologue
    const/4 v0, 0x0

    .line 406
    invoke-static {p0, p1, v0, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->getDateTimeInstance(IILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getDateTimeInstance(IILjava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "dateStyle"    # I
    .param p1, "timeStyle"    # I
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 423
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lorg/apache/commons/lang/time/FastDateFormat;->getDateTimeInstance(IILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getDateTimeInstance(IILjava/util/TimeZone;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "dateStyle"    # I
    .param p1, "timeStyle"    # I
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 441
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->getDateTimeInstance(IILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getDateTimeInstance(IILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 10
    .param p0, "dateStyle"    # I
    .param p1, "timeStyle"    # I
    .param p2, "timeZone"    # Ljava/util/TimeZone;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 459
    const-class v7, Lorg/apache/commons/lang/time/FastDateFormat;

    monitor-enter v7

    :try_start_0
    new-instance v3, Lorg/apache/commons/lang/time/FastDateFormat$Pair;

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, p0}, Ljava/lang/Integer;-><init>(I)V

    new-instance v8, Ljava/lang/Integer;

    invoke-direct {v8, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {v3, v6, v8}, Lorg/apache/commons/lang/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 460
    .local v3, "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    if-eqz p2, :cond_2

    .line 461
    new-instance v4, Lorg/apache/commons/lang/time/FastDateFormat$Pair;

    invoke-direct {v4, v3, p2}, Lorg/apache/commons/lang/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 463
    .end local v3    # "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    .local v4, "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    :goto_0
    if-nez p3, :cond_0

    .line 464
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    .line 466
    :cond_0
    new-instance v3, Lorg/apache/commons/lang/time/FastDateFormat$Pair;

    invoke-direct {v3, v4, p3}, Lorg/apache/commons/lang/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 468
    .end local v4    # "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    .restart local v3    # "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    sget-object v6, Lorg/apache/commons/lang/time/FastDateFormat;->cDateTimeInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang/time/FastDateFormat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 469
    .local v1, "format":Lorg/apache/commons/lang/time/FastDateFormat;
    if-nez v1, :cond_1

    .line 471
    :try_start_1
    invoke-static {p0, p1, p3}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    check-cast v2, Ljava/text/SimpleDateFormat;

    .line 473
    .local v2, "formatter":Ljava/text/SimpleDateFormat;
    invoke-virtual {v2}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    .line 474
    .local v5, "pattern":Ljava/lang/String;
    invoke-static {v5, p2, p3}, Lorg/apache/commons/lang/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v1

    .line 475
    sget-object v6, Lorg/apache/commons/lang/time/FastDateFormat;->cDateTimeInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 481
    .end local v2    # "formatter":Ljava/text/SimpleDateFormat;
    .end local v5    # "pattern":Ljava/lang/String;
    :cond_1
    monitor-exit v7

    return-object v1

    .line 477
    :catch_0
    move-exception v0

    .line 478
    .local v0, "ex":Ljava/lang/ClassCastException;
    :try_start_2
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "No date time pattern for locale: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 459
    .end local v0    # "ex":Ljava/lang/ClassCastException;
    .end local v1    # "format":Lorg/apache/commons/lang/time/FastDateFormat;
    .end local v3    # "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6

    .restart local v3    # "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    :cond_2
    move-object v4, v3

    .end local v3    # "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    .restart local v4    # "key":Lorg/apache/commons/lang/time/FastDateFormat$Pair;
    goto :goto_0
.end method

.method private static declared-synchronized getDefaultPattern()Ljava/lang/String;
    .locals 2

    .prologue
    .line 512
    const-class v1, Lorg/apache/commons/lang/time/FastDateFormat;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/apache/commons/lang/time/FastDateFormat;->cDefaultPattern:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 513
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0}, Ljava/text/SimpleDateFormat;-><init>()V

    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang/time/FastDateFormat;->cDefaultPattern:Ljava/lang/String;

    .line 515
    :cond_0
    sget-object v0, Lorg/apache/commons/lang/time/FastDateFormat;->cDefaultPattern:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 512
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getInstance()Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 153
    invoke-static {}, Lorg/apache/commons/lang/time/FastDateFormat;->getDefaultPattern()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lorg/apache/commons/lang/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/String;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 166
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/String;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 195
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/String;Ljava/util/TimeZone;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 181
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 4
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "timeZone"    # Ljava/util/TimeZone;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 212
    const-class v3, Lorg/apache/commons/lang/time/FastDateFormat;

    monitor-enter v3

    :try_start_0
    new-instance v0, Lorg/apache/commons/lang/time/FastDateFormat;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/lang/time/FastDateFormat;-><init>(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 213
    .local v0, "emptyFormat":Lorg/apache/commons/lang/time/FastDateFormat;
    sget-object v2, Lorg/apache/commons/lang/time/FastDateFormat;->cInstanceCache:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang/time/FastDateFormat;

    .line 214
    .local v1, "format":Lorg/apache/commons/lang/time/FastDateFormat;
    if-nez v1, :cond_0

    .line 215
    move-object v1, v0

    .line 216
    invoke-virtual {v1}, Lorg/apache/commons/lang/time/FastDateFormat;->init()V

    .line 217
    sget-object v2, Lorg/apache/commons/lang/time/FastDateFormat;->cInstanceCache:Ljava/util/Map;

    invoke-interface {v2, v1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    :cond_0
    monitor-exit v3

    return-object v1

    .line 212
    .end local v0    # "emptyFormat":Lorg/apache/commons/lang/time/FastDateFormat;
    .end local v1    # "format":Lorg/apache/commons/lang/time/FastDateFormat;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public static getTimeInstance(I)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "style"    # I

    .prologue
    const/4 v0, 0x0

    .line 318
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->getTimeInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getTimeInstance(ILjava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "style"    # I
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 333
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang/time/FastDateFormat;->getTimeInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getTimeInstance(ILjava/util/TimeZone;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 1
    .param p0, "style"    # I
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 349
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->getTimeInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getTimeInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;
    .locals 10
    .param p0, "style"    # I
    .param p1, "timeZone"    # Ljava/util/TimeZone;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    .line 365
    const-class v7, Lorg/apache/commons/lang/time/FastDateFormat;

    monitor-enter v7

    :try_start_0
    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p0}, Ljava/lang/Integer;-><init>(I)V

    .line 366
    .local v3, "key":Ljava/lang/Integer;
    if-eqz p1, :cond_3

    .line 367
    new-instance v4, Lorg/apache/commons/lang/time/FastDateFormat$Pair;

    invoke-direct {v4, v3, p1}, Lorg/apache/commons/lang/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 369
    .end local v3    # "key":Ljava/lang/Integer;
    :goto_0
    if-eqz p2, :cond_2

    .line 370
    new-instance v3, Lorg/apache/commons/lang/time/FastDateFormat$Pair;

    invoke-direct {v3, v4, p2}, Lorg/apache/commons/lang/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 373
    :goto_1
    sget-object v6, Lorg/apache/commons/lang/time/FastDateFormat;->cTimeInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang/time/FastDateFormat;

    .line 374
    .local v1, "format":Lorg/apache/commons/lang/time/FastDateFormat;
    if-nez v1, :cond_1

    .line 375
    if-nez p2, :cond_0

    .line 376
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object p2

    .line 380
    :cond_0
    :try_start_1
    invoke-static {p0, p2}, Ljava/text/DateFormat;->getTimeInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    check-cast v2, Ljava/text/SimpleDateFormat;

    .line 381
    .local v2, "formatter":Ljava/text/SimpleDateFormat;
    invoke-virtual {v2}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    .line 382
    .local v5, "pattern":Ljava/lang/String;
    invoke-static {v5, p1, p2}, Lorg/apache/commons/lang/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang/time/FastDateFormat;

    move-result-object v1

    .line 383
    sget-object v6, Lorg/apache/commons/lang/time/FastDateFormat;->cTimeInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 389
    .end local v2    # "formatter":Ljava/text/SimpleDateFormat;
    .end local v5    # "pattern":Ljava/lang/String;
    :cond_1
    monitor-exit v7

    return-object v1

    .line 385
    :catch_0
    move-exception v0

    .line 386
    .local v0, "ex":Ljava/lang/ClassCastException;
    :try_start_2
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "No date pattern for locale: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 365
    .end local v0    # "ex":Ljava/lang/ClassCastException;
    .end local v1    # "format":Lorg/apache/commons/lang/time/FastDateFormat;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6

    :cond_2
    move-object v3, v4

    goto :goto_1

    .restart local v3    # "key":Ljava/lang/Integer;
    :cond_3
    move-object v4, v3

    .local v4, "key":Ljava/lang/Object;
    goto :goto_0
.end method

.method static declared-synchronized getTimeZoneDisplay(Ljava/util/TimeZone;ZILjava/util/Locale;)Ljava/lang/String;
    .locals 4
    .param p0, "tz"    # Ljava/util/TimeZone;
    .param p1, "daylight"    # Z
    .param p2, "style"    # I
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 496
    const-class v3, Lorg/apache/commons/lang/time/FastDateFormat;

    monitor-enter v3

    :try_start_0
    new-instance v0, Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneDisplayKey;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneDisplayKey;-><init>(Ljava/util/TimeZone;ZILjava/util/Locale;)V

    .line 497
    .local v0, "key":Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneDisplayKey;
    sget-object v2, Lorg/apache/commons/lang/time/FastDateFormat;->cTimeZoneDisplayCache:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 498
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 500
    invoke-virtual {p0, p1, p2, p3}, Ljava/util/TimeZone;->getDisplayName(ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 501
    sget-object v2, Lorg/apache/commons/lang/time/FastDateFormat;->cTimeZoneDisplayCache:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 503
    :cond_0
    monitor-exit v3

    return-object v1

    .line 496
    .end local v0    # "key":Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneDisplayKey;
    .end local v1    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1027
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 1028
    invoke-virtual {p0}, Lorg/apache/commons/lang/time/FastDateFormat;->init()V

    .line 1029
    return-void
.end method


# virtual methods
.method protected applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 4
    .param p1, "calendar"    # Ljava/util/Calendar;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 886
    iget-object v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang/time/FastDateFormat$Rule;

    .line 887
    .local v2, "rules":[Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    iget-object v3, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang/time/FastDateFormat$Rule;

    array-length v1, v3

    .line 888
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 889
    aget-object v3, v2, v0

    invoke-interface {v3, p2, p1}, Lorg/apache/commons/lang/time/FastDateFormat$Rule;->appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V

    .line 888
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 891
    :cond_0
    return-object p2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 976
    instance-of v2, p1, Lorg/apache/commons/lang/time/FastDateFormat;

    if-nez v2, :cond_1

    .line 989
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 979
    check-cast v0, Lorg/apache/commons/lang/time/FastDateFormat;

    .line 980
    .local v0, "other":Lorg/apache/commons/lang/time/FastDateFormat;
    iget-object v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_2
    iget-object v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    iget-object v3, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    iget-object v3, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_3
    iget-object v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    iget-object v3, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    iget-object v3, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_4
    iget-boolean v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZoneForced:Z

    iget-boolean v3, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZoneForced:Z

    if-ne v2, v3, :cond_0

    iget-boolean v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocaleForced:Z

    iget-boolean v3, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocaleForced:Z

    if-ne v2, v3, :cond_0

    .line 987
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public format(J)Ljava/lang/String;
    .locals 1
    .param p1, "millis"    # J

    .prologue
    .line 808
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 830
    new-instance v0, Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mMaxLengthEstimate:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang/time/FastDateFormat;->format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Date;)Ljava/lang/String;
    .locals 3
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 818
    new-instance v0, Ljava/util/GregorianCalendar;

    iget-object v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-direct {v0, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 819
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 820
    new-instance v1, Ljava/lang/StringBuffer;

    iget v2, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mMaxLengthEstimate:I

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang/time/FastDateFormat;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public format(JLjava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 1
    .param p1, "millis"    # J
    .param p3, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 843
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v0, p3}, Lorg/apache/commons/lang/time/FastDateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "toAppendTo"    # Ljava/lang/StringBuffer;
    .param p3, "pos"    # Ljava/text/FieldPosition;

    .prologue
    .line 788
    instance-of v0, p1, Ljava/util/Date;

    if-eqz v0, :cond_0

    .line 789
    check-cast p1, Ljava/util/Date;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/time/FastDateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 793
    :goto_0
    return-object v0

    .line 790
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Ljava/util/Calendar;

    if-eqz v0, :cond_1

    .line 791
    check-cast p1, Ljava/util/Calendar;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/time/FastDateFormat;->format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    goto :goto_0

    .line 792
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_2

    .line 793
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/apache/commons/lang/time/FastDateFormat;->format(JLjava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    goto :goto_0

    .line 795
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Unknown class: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-nez p1, :cond_3

    const-string/jumbo v0, "<null>"

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 1
    .param p1, "calendar"    # Ljava/util/Calendar;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 869
    iget-boolean v0, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZoneForced:Z

    if-eqz v0, :cond_0

    .line 870
    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 871
    invoke-virtual {p1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "calendar":Ljava/util/Calendar;
    check-cast p1, Ljava/util/Calendar;

    .line 872
    .restart local p1    # "calendar":Ljava/util/Calendar;
    iget-object v0, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 874
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang/time/FastDateFormat;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 2
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 855
    new-instance v0, Ljava/util/GregorianCalendar;

    iget-object v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-direct {v0, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 856
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 857
    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/lang/time/FastDateFormat;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v1

    return-object v1
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 1

    .prologue
    .line 951
    iget-object v0, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    return-object v0
.end method

.method public getMaxLengthEstimate()I
    .locals 1

    .prologue
    .line 964
    iget v0, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mMaxLengthEstimate:I

    return v0
.end method

.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 917
    iget-object v0, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .locals 1

    .prologue
    .line 931
    iget-object v0, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    return-object v0
.end method

.method public getTimeZoneOverridesCalendar()Z
    .locals 1

    .prologue
    .line 942
    iget-boolean v0, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZoneForced:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 998
    const/4 v0, 0x0

    .line 999
    .local v0, "total":I
    iget-object v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1000
    iget-object v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1001
    iget-boolean v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZoneForced:Z

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    add-int/2addr v0, v1

    .line 1002
    iget-object v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1003
    iget-boolean v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocaleForced:Z

    if-eqz v1, :cond_1

    :goto_1
    add-int/2addr v0, v2

    .line 1004
    return v0

    :cond_0
    move v1, v3

    .line 1001
    goto :goto_0

    :cond_1
    move v2, v3

    .line 1003
    goto :goto_1
.end method

.method protected init()V
    .locals 4

    .prologue
    .line 557
    invoke-virtual {p0}, Lorg/apache/commons/lang/time/FastDateFormat;->parsePattern()Ljava/util/List;

    move-result-object v2

    .line 558
    .local v2, "rulesList":Ljava/util/List;
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/apache/commons/lang/time/FastDateFormat$Rule;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/apache/commons/lang/time/FastDateFormat$Rule;

    check-cast v3, [Lorg/apache/commons/lang/time/FastDateFormat$Rule;

    iput-object v3, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang/time/FastDateFormat$Rule;

    .line 560
    const/4 v1, 0x0

    .line 561
    .local v1, "len":I
    iget-object v3, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang/time/FastDateFormat$Rule;

    array-length v0, v3

    .local v0, "i":I
    :goto_0
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_0

    .line 562
    iget-object v3, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang/time/FastDateFormat$Rule;

    aget-object v3, v3, v0

    invoke-interface {v3}, Lorg/apache/commons/lang/time/FastDateFormat$Rule;->estimateLength()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0

    .line 565
    :cond_0
    iput v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mMaxLengthEstimate:I

    .line 566
    return-void
.end method

.method public parseObject(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Object;
    .locals 1
    .param p1, "source"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;

    .prologue
    const/4 v0, 0x0

    .line 904
    invoke-virtual {p2, v0}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 905
    invoke-virtual {p2, v0}, Ljava/text/ParsePosition;->setErrorIndex(I)V

    .line 906
    const/4 v0, 0x0

    return-object v0
.end method

.method protected parsePattern()Ljava/util/List;
    .locals 24

    .prologue
    .line 577
    new-instance v16, Ljava/text/DateFormatSymbols;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    move-object/from16 v20, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/text/DateFormatSymbols;-><init>(Ljava/util/Locale;)V

    .line 578
    .local v16, "symbols":Ljava/text/DateFormatSymbols;
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 580
    .local v12, "rules":Ljava/util/List;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getEras()[Ljava/lang/String;

    move-result-object v5

    .line 581
    .local v5, "ERAs":[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getMonths()[Ljava/lang/String;

    move-result-object v10

    .line 582
    .local v10, "months":[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getShortMonths()[Ljava/lang/String;

    move-result-object v13

    .line 583
    .local v13, "shortMonths":[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getWeekdays()[Ljava/lang/String;

    move-result-object v19

    .line 584
    .local v19, "weekdays":[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getShortWeekdays()[Ljava/lang/String;

    move-result-object v14

    .line 585
    .local v14, "shortWeekdays":[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v4

    .line 587
    .local v4, "AmPmStrings":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v9

    .line 588
    .local v9, "length":I
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v8, v0, [I

    .line 590
    .local v8, "indexRef":[I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v9, :cond_0

    .line 591
    const/16 v20, 0x0

    aput v7, v8, v20

    .line 592
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v8}, Lorg/apache/commons/lang/time/FastDateFormat;->parseToken(Ljava/lang/String;[I)Ljava/lang/String;

    move-result-object v17

    .line 593
    .local v17, "token":Ljava/lang/String;
    const/16 v20, 0x0

    aget v7, v8, v20

    .line 595
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v18

    .line 596
    .local v18, "tokenLen":I
    if-nez v18, :cond_1

    .line 696
    .end local v17    # "token":Ljava/lang/String;
    .end local v18    # "tokenLen":I
    :cond_0
    return-object v12

    .line 601
    .restart local v17    # "token":Ljava/lang/String;
    .restart local v18    # "tokenLen":I
    :cond_1
    const/16 v20, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 603
    .local v6, "c":C
    sparse-switch v6, :sswitch_data_0

    .line 690
    new-instance v20, Ljava/lang/IllegalArgumentException;

    new-instance v21, Ljava/lang/StringBuffer;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v22, "Illegal pattern component: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 605
    :sswitch_0
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TextField;

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-direct {v11, v0, v5}, Lorg/apache/commons/lang/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .line 693
    .local v11, "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :goto_1
    invoke-interface {v12, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 590
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 608
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_1
    const/16 v20, 0x4

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_2

    .line 609
    const/16 v20, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 611
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :cond_2
    sget-object v11, Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitYearField;->INSTANCE:Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitYearField;

    .line 613
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 615
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_2
    const/16 v20, 0x4

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_3

    .line 616
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TextField;

    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v11, v0, v10}, Lorg/apache/commons/lang/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 617
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :cond_3
    const/16 v20, 0x3

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_4

    .line 618
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TextField;

    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v11, v0, v13}, Lorg/apache/commons/lang/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 619
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :cond_4
    const/16 v20, 0x2

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_5

    .line 620
    sget-object v11, Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitMonthField;->INSTANCE:Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitMonthField;

    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 622
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :cond_5
    sget-object v11, Lorg/apache/commons/lang/time/FastDateFormat$UnpaddedMonthField;->INSTANCE:Lorg/apache/commons/lang/time/FastDateFormat$UnpaddedMonthField;

    .line 624
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 626
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_3
    const/16 v20, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 627
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 629
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_4
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TwelveHourField;

    const/16 v20, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v11, v0}, Lorg/apache/commons/lang/time/FastDateFormat$TwelveHourField;-><init>(Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;)V

    .line 630
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 632
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_5
    const/16 v20, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 633
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto :goto_1

    .line 635
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_6
    const/16 v20, 0xc

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 636
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 638
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_7
    const/16 v20, 0xd

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 639
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 641
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_8
    const/16 v20, 0xe

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 642
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 644
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_9
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TextField;

    const/16 v21, 0x7

    const/16 v20, 0x4

    move/from16 v0, v18

    move/from16 v1, v20

    if-ge v0, v1, :cond_6

    move-object/from16 v20, v14

    :goto_2
    move/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v11, v0, v1}, Lorg/apache/commons/lang/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .line 645
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :cond_6
    move-object/from16 v20, v19

    .line 644
    goto :goto_2

    .line 647
    :sswitch_a
    const/16 v20, 0x6

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 648
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 650
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_b
    const/16 v20, 0x8

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 651
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 653
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_c
    const/16 v20, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 654
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 656
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_d
    const/16 v20, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 657
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 659
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_e
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TextField;

    const/16 v20, 0x9

    move/from16 v0, v20

    invoke-direct {v11, v0, v4}, Lorg/apache/commons/lang/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .line 660
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 662
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_f
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TwentyFourHourField;

    const/16 v20, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v11, v0}, Lorg/apache/commons/lang/time/FastDateFormat$TwentyFourHourField;-><init>(Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;)V

    .line 663
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 665
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_10
    const/16 v20, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 666
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 668
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_11
    const/16 v20, 0x4

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_7

    .line 669
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNameRule;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZoneForced:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v11, v0, v1, v2, v3}, Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNameRule;-><init>(Ljava/util/TimeZone;ZLjava/util/Locale;I)V

    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 671
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :cond_7
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNameRule;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mTimeZoneForced:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v11, v0, v1, v2, v3}, Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNameRule;-><init>(Ljava/util/TimeZone;ZLjava/util/Locale;I)V

    .line 673
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 675
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_12
    const/16 v20, 0x1

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_8

    .line 676
    sget-object v11, Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNumberRule;->INSTANCE_NO_COLON:Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNumberRule;

    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 678
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :cond_8
    sget-object v11, Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNumberRule;->INSTANCE_COLON:Lorg/apache/commons/lang/time/FastDateFormat$TimeZoneNumberRule;

    .line 680
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 682
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :sswitch_13
    const/16 v20, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    .line 683
    .local v15, "sub":Ljava/lang/String;
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v20

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_9

    .line 684
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$CharacterLiteral;

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/String;->charAt(I)C

    move-result v20

    move/from16 v0, v20

    invoke-direct {v11, v0}, Lorg/apache/commons/lang/time/FastDateFormat$CharacterLiteral;-><init>(C)V

    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 686
    .end local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    :cond_9
    new-instance v11, Lorg/apache/commons/lang/time/FastDateFormat$StringLiteral;

    invoke-direct {v11, v15}, Lorg/apache/commons/lang/time/FastDateFormat$StringLiteral;-><init>(Ljava/lang/String;)V

    .line 688
    .restart local v11    # "rule":Lorg/apache/commons/lang/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 603
    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_13
        0x44 -> :sswitch_a
        0x45 -> :sswitch_9
        0x46 -> :sswitch_b
        0x47 -> :sswitch_0
        0x48 -> :sswitch_5
        0x4b -> :sswitch_10
        0x4d -> :sswitch_2
        0x53 -> :sswitch_8
        0x57 -> :sswitch_d
        0x5a -> :sswitch_12
        0x61 -> :sswitch_e
        0x64 -> :sswitch_3
        0x68 -> :sswitch_4
        0x6b -> :sswitch_f
        0x6d -> :sswitch_6
        0x73 -> :sswitch_7
        0x77 -> :sswitch_c
        0x79 -> :sswitch_1
        0x7a -> :sswitch_11
    .end sparse-switch
.end method

.method protected parseToken(Ljava/lang/String;[I)Ljava/lang/String;
    .locals 12
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "indexRef"    # [I

    .prologue
    const/16 v11, 0x61

    const/16 v10, 0x5a

    const/16 v9, 0x41

    const/16 v8, 0x27

    const/4 v6, 0x0

    .line 707
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 709
    .local v0, "buf":Ljava/lang/StringBuffer;
    aget v2, p2, v6

    .line 710
    .local v2, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 712
    .local v4, "length":I
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 713
    .local v1, "c":C
    if-lt v1, v9, :cond_0

    if-le v1, v10, :cond_1

    :cond_0
    if-lt v1, v11, :cond_2

    const/16 v7, 0x7a

    if-gt v1, v7, :cond_2

    .line 716
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 718
    :goto_0
    add-int/lit8 v7, v2, 0x1

    if-ge v7, v4, :cond_8

    .line 719
    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 720
    .local v5, "peek":C
    if-ne v5, v1, :cond_8

    .line 721
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 722
    add-int/lit8 v2, v2, 0x1

    .line 726
    goto :goto_0

    .line 729
    .end local v5    # "peek":C
    :cond_2
    invoke-virtual {v0, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 731
    const/4 v3, 0x0

    .line 733
    .local v3, "inLiteral":Z
    :goto_1
    if-ge v2, v4, :cond_8

    .line 734
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 736
    if-ne v1, v8, :cond_5

    .line 737
    add-int/lit8 v7, v2, 0x1

    if-ge v7, v4, :cond_3

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_3

    .line 739
    add-int/lit8 v2, v2, 0x1

    .line 740
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 733
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 742
    :cond_3
    if-nez v3, :cond_4

    const/4 v3, 0x1

    :goto_3
    goto :goto_2

    :cond_4
    move v3, v6

    goto :goto_3

    .line 744
    :cond_5
    if-nez v3, :cond_9

    if-lt v1, v9, :cond_6

    if-le v1, v10, :cond_7

    :cond_6
    if-lt v1, v11, :cond_9

    const/16 v7, 0x7a

    if-gt v1, v7, :cond_9

    .line 746
    :cond_7
    add-int/lit8 v2, v2, -0x1

    .line 754
    .end local v3    # "inLiteral":Z
    :cond_8
    aput v2, p2, v6

    .line 755
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 749
    .restart local v3    # "inLiteral":Z
    :cond_9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2
.end method

.method protected selectNumberRule(II)Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;
    .locals 1
    .param p1, "field"    # I
    .param p2, "padding"    # I

    .prologue
    .line 766
    packed-switch p2, :pswitch_data_0

    .line 772
    new-instance v0, Lorg/apache/commons/lang/time/FastDateFormat$PaddedNumberField;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/lang/time/FastDateFormat$PaddedNumberField;-><init>(II)V

    :goto_0
    return-object v0

    .line 768
    :pswitch_0
    new-instance v0, Lorg/apache/commons/lang/time/FastDateFormat$UnpaddedNumberField;

    invoke-direct {v0, p1}, Lorg/apache/commons/lang/time/FastDateFormat$UnpaddedNumberField;-><init>(I)V

    goto :goto_0

    .line 770
    :pswitch_1
    new-instance v0, Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitNumberField;

    invoke-direct {v0, p1}, Lorg/apache/commons/lang/time/FastDateFormat$TwoDigitNumberField;-><init>(I)V

    goto :goto_0

    .line 766
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1013
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "FastDateFormat["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/lang/time/FastDateFormat;->mPattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
