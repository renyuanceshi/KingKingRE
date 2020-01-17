.class public Lcom/orhanobut/logger/CsvFormatStrategy;
.super Ljava/lang/Object;
.source "CsvFormatStrategy.java"

# interfaces
.implements Lcom/orhanobut/logger/FormatStrategy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/orhanobut/logger/CsvFormatStrategy$Builder;
    }
.end annotation


# static fields
.field private static final NEW_LINE:Ljava/lang/String;

.field private static final NEW_LINE_REPLACEMENT:Ljava/lang/String; = " <br> "

.field private static final SEPARATOR:Ljava/lang/String; = ","


# instance fields
.field private final date:Ljava/util/Date;

.field private final dateFormat:Ljava/text/SimpleDateFormat;

.field private final logStrategy:Lcom/orhanobut/logger/LogStrategy;

.field private final tag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string/jumbo v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/orhanobut/logger/CsvFormatStrategy;->NEW_LINE:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/orhanobut/logger/CsvFormatStrategy$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/orhanobut/logger/CsvFormatStrategy$Builder;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iget-object v0, p1, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->date:Ljava/util/Date;

    iput-object v0, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->date:Ljava/util/Date;

    .line 30
    iget-object v0, p1, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->dateFormat:Ljava/text/SimpleDateFormat;

    iput-object v0, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->dateFormat:Ljava/text/SimpleDateFormat;

    .line 31
    iget-object v0, p1, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->logStrategy:Lcom/orhanobut/logger/LogStrategy;

    iput-object v0, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->logStrategy:Lcom/orhanobut/logger/LogStrategy;

    .line 32
    iget-object v0, p1, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;->tag:Ljava/lang/String;

    iput-object v0, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->tag:Ljava/lang/String;

    .line 33
    return-void
.end method

.method synthetic constructor <init>(Lcom/orhanobut/logger/CsvFormatStrategy$Builder;Lcom/orhanobut/logger/CsvFormatStrategy$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/orhanobut/logger/CsvFormatStrategy$Builder;
    .param p2, "x1"    # Lcom/orhanobut/logger/CsvFormatStrategy$1;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/orhanobut/logger/CsvFormatStrategy;-><init>(Lcom/orhanobut/logger/CsvFormatStrategy$Builder;)V

    return-void
.end method

.method private formatTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-static {p1}, Lcom/orhanobut/logger/Utils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->tag:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/orhanobut/logger/Utils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->tag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 79
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->tag:Ljava/lang/String;

    goto :goto_0
.end method

.method public static newBuilder()Lcom/orhanobut/logger/CsvFormatStrategy$Builder;
    .locals 2

    .prologue
    .line 36
    new-instance v0, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/orhanobut/logger/CsvFormatStrategy$Builder;-><init>(Lcom/orhanobut/logger/CsvFormatStrategy$1;)V

    return-object v0
.end method


# virtual methods
.method public log(ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "priority"    # I
    .param p2, "onceOnlyTag"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0, p2}, Lcom/orhanobut/logger/CsvFormatStrategy;->formatTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 42
    .local v1, "tag":Ljava/lang/String;
    iget-object v2, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->date:Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/util/Date;->setTime(J)V

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->date:Ljava/util/Date;

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    const-string/jumbo v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    iget-object v2, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->dateFormat:Ljava/text/SimpleDateFormat;

    iget-object v3, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->date:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    const-string/jumbo v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    invoke-static {p1}, Lcom/orhanobut/logger/Utils;->logLevel(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    const-string/jumbo v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    sget-object v2, Lcom/orhanobut/logger/CsvFormatStrategy;->NEW_LINE:Ljava/lang/String;

    invoke-virtual {p3, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 64
    sget-object v2, Lcom/orhanobut/logger/CsvFormatStrategy;->NEW_LINE:Ljava/lang/String;

    const-string/jumbo v3, " <br> "

    invoke-virtual {p3, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 66
    :cond_0
    const-string/jumbo v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    sget-object v2, Lcom/orhanobut/logger/CsvFormatStrategy;->NEW_LINE:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    iget-object v2, p0, Lcom/orhanobut/logger/CsvFormatStrategy;->logStrategy:Lcom/orhanobut/logger/LogStrategy;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, p1, v1, v3}, Lcom/orhanobut/logger/LogStrategy;->log(ILjava/lang/String;Ljava/lang/String;)V

    .line 73
    return-void
.end method
