.class public Lcom/pccwmobile/common/utilities/DateUtilities;
.super Ljava/lang/Object;
.source "DateUtilities.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertCalendarToString(Ljava/util/Calendar;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 30
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 31
    .local v0, "formatter":Ljava/text/SimpleDateFormat;
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static convertStringToCalendar(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Calendar;
    .locals 4
    .param p0, "dateString"    # Ljava/lang/String;
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 44
    :try_start_0
    new-instance v3, Ljava/text/SimpleDateFormat;

    invoke-direct {v3, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 45
    .local v3, "formatter":Ljava/text/DateFormat;
    invoke-virtual {v3, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 46
    .local v1, "date":Ljava/util/Date;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 47
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .end local v0    # "cal":Ljava/util/Calendar;
    .end local v1    # "date":Ljava/util/Date;
    .end local v3    # "formatter":Ljava/text/DateFormat;
    :goto_0
    return-object v0

    .line 49
    :catch_0
    move-exception v2

    .line 50
    .local v2, "e":Ljava/text/ParseException;
    invoke-virtual {v2}, Ljava/text/ParseException;->printStackTrace()V

    .line 51
    const/4 v0, 0x0

    goto :goto_0
.end method
