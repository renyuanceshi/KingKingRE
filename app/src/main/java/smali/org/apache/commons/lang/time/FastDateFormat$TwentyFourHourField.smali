.class Lorg/apache/commons/lang/time/FastDateFormat$TwentyFourHourField;
.super Ljava/lang/Object;
.source "FastDateFormat.java"

# interfaces
.implements Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang/time/FastDateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TwentyFourHourField"
.end annotation


# instance fields
.field private final mRule:Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;


# direct methods
.method constructor <init>(Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;)V
    .locals 0
    .param p1, "rule"    # Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    .prologue
    .line 1484
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1485
    iput-object p1, p0, Lorg/apache/commons/lang/time/FastDateFormat$TwentyFourHourField;->mRule:Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    .line 1486
    return-void
.end method


# virtual methods
.method public appendTo(Ljava/lang/StringBuffer;I)V
    .locals 1
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "value"    # I

    .prologue
    .line 1510
    iget-object v0, p0, Lorg/apache/commons/lang/time/FastDateFormat$TwentyFourHourField;->mRule:Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;->appendTo(Ljava/lang/StringBuffer;I)V

    .line 1511
    return-void
.end method

.method public appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V
    .locals 2
    .param p1, "buffer"    # Ljava/lang/StringBuffer;
    .param p2, "calendar"    # Ljava/util/Calendar;

    .prologue
    const/16 v1, 0xb

    .line 1499
    invoke-virtual {p2, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 1500
    .local v0, "value":I
    if-nez v0, :cond_0

    .line 1501
    invoke-virtual {p2, v1}, Ljava/util/Calendar;->getMaximum(I)I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 1503
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/lang/time/FastDateFormat$TwentyFourHourField;->mRule:Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    invoke-interface {v1, p1, v0}, Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;->appendTo(Ljava/lang/StringBuffer;I)V

    .line 1504
    return-void
.end method

.method public estimateLength()I
    .locals 1

    .prologue
    .line 1492
    iget-object v0, p0, Lorg/apache/commons/lang/time/FastDateFormat$TwentyFourHourField;->mRule:Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;

    invoke-interface {v0}, Lorg/apache/commons/lang/time/FastDateFormat$NumberRule;->estimateLength()I

    move-result v0

    return v0
.end method
