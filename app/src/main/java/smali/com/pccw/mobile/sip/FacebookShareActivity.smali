.class public Lcom/pccw/mobile/sip/FacebookShareActivity;
.super Ljava/lang/Object;
.source "FacebookShareActivity.java"


# static fields
.field private static final CALL_COUNT_TAG:Ljava/lang/String; = "CallCount"

.field private static final LAST_SHOWING_DATE_TAG:Ljava/lang/String; = "LastShowingDate"

.field private static final SHARE_PREF_TAG:Ljava/lang/String; = "FacebookShare"

.field private static final TAG:Ljava/lang/String; = "FacebookShare"

.field private static final TIME_FORMAT:Ljava/lang/String; = "ddMMyyyy"


# instance fields
.field format:Ljava/text/SimpleDateFormat;

.field private targetDayInterval:I

.field private targetNumOfCall:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "ddMMyyyy"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->format:Ljava/text/SimpleDateFormat;

    .line 37
    const/4 v0, 0x5

    iput v0, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->targetNumOfCall:I

    .line 38
    const/16 v0, 0xe

    iput v0, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->targetDayInterval:I

    return-void
.end method

.method private addCallCount(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 42
    const-string/jumbo v2, "FacebookShare"

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 43
    .local v0, "CountPerf":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "CallCount"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 44
    .local v1, "callCount":I
    add-int/lit8 v2, v1, 0x1

    invoke-direct {p0, p1, v2}, Lcom/pccw/mobile/sip/FacebookShareActivity;->setCallCount(Landroid/content/Context;I)V

    .line 45
    return-void
.end method

.method private countDayInterval(Landroid/content/Context;)I
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/pccw/mobile/sip/FacebookShareActivity;->getCurrentDay()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->getLastShowingDay(Landroid/content/Context;)Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long v2, v4, v6

    .line 109
    .local v2, "diff":J
    const-wide/32 v4, 0x5265c00

    div-long v4, v2, v4

    long-to-int v0, v4

    .line 112
    .local v0, "dayInterval":I
    return v0
.end method

.method private getCallCount(Landroid/content/Context;)I
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 48
    const-string/jumbo v1, "FacebookShare"

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 49
    .local v0, "CountPerf":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "CallCount"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    return v1
.end method

.method private getCurrentDay()Ljava/util/Date;
    .locals 4

    .prologue
    .line 63
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 64
    .local v0, "date":Ljava/util/Date;
    iget-object v3, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->format:Ljava/text/SimpleDateFormat;

    invoke-virtual {v3, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 66
    .local v2, "sdate":Ljava/lang/String;
    :try_start_0
    iget-object v3, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->format:Ljava/text/SimpleDateFormat;

    invoke-virtual {v3, v2}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 73
    :goto_0
    return-object v0

    .line 67
    :catch_0
    move-exception v1

    .line 69
    .local v1, "e":Ljava/text/ParseException;
    invoke-virtual {v1}, Ljava/text/ParseException;->printStackTrace()V

    goto :goto_0
.end method

.method private getLastShowingDay(Landroid/content/Context;)Ljava/util/Date;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 78
    const-string/jumbo v4, "FacebookShare"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 79
    .local v0, "CountPerf":Landroid/content/SharedPreferences;
    const-string/jumbo v4, "LastShowingDate"

    const-string/jumbo v5, "NULL"

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 83
    .local v3, "lastShowingDate":Ljava/lang/String;
    const-string/jumbo v4, "NULL"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 84
    const/4 v1, 0x0

    .line 97
    :goto_0
    return-object v1

    .line 87
    :cond_0
    :try_start_0
    iget-object v4, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->format:Ljava/text/SimpleDateFormat;

    invoke-virtual {v4, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .local v1, "date":Ljava/util/Date;
    goto :goto_0

    .line 88
    .end local v1    # "date":Ljava/util/Date;
    :catch_0
    move-exception v2

    .line 94
    .local v2, "e":Ljava/text/ParseException;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .restart local v1    # "date":Ljava/util/Date;
    goto :goto_0
.end method

.method private isCallCountMet(Landroid/content/Context;)Z
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->getCallCount(Landroid/content/Context;)I

    move-result v0

    iget v1, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->targetNumOfCall:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isDateIntervalMet(Landroid/content/Context;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    .line 116
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->getXmlFromServer(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 117
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->readXml(Landroid/content/Context;)V

    .line 120
    :cond_0
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->isNotPromptBefore(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 125
    :cond_1
    :goto_0
    return v0

    .line 122
    :cond_2
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->countDayInterval(Landroid/content/Context;)I

    move-result v1

    iget v2, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->targetDayInterval:I

    if-ge v1, v2, :cond_1

    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->countDayInterval(Landroid/content/Context;)I

    move-result v1

    if-ltz v1, :cond_1

    .line 125
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isNotPromptBefore(Landroid/content/Context;)Z
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 130
    const-string/jumbo v3, "FacebookShare"

    invoke-virtual {p1, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 131
    .local v0, "CountPerf":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "LastShowingDate"

    const-string/jumbo v4, "NULL"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 132
    .local v1, "lastShowingDate":Ljava/lang/String;
    const-string/jumbo v3, "NULL"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 133
    const/4 v2, 0x1

    .line 135
    :cond_0
    return v2
.end method

.method private readXml(Landroid/content/Context;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 190
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "/facebookshare.xml"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v0, v7}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 192
    .local v0, "fis":Ljava/io/FileInputStream;
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v4

    .line 193
    .local v4, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v4}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v3

    .line 194
    .local v3, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v3}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v6

    .line 195
    .local v6, "xr":Lorg/xml/sax/XMLReader;
    new-instance v5, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;

    invoke-direct {v5}, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;-><init>()V

    .line 196
    .local v5, "xmlHandler":Lcom/pccw/mobile/sip/FacebookShareXmlHandler;
    invoke-interface {v6, v5}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 197
    new-instance v7, Lorg/xml/sax/InputSource;

    invoke-direct {v7, v0}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    invoke-interface {v6, v7}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 198
    invoke-virtual {v5}, Lcom/pccw/mobile/sip/FacebookShareXmlHandler;->response()Lcom/pccw/mobile/sip/FacebookShareXmlResponse;

    move-result-object v1

    .line 200
    .local v1, "resp":Lcom/pccw/mobile/sip/FacebookShareXmlResponse;
    iget-object v7, v1, Lcom/pccw/mobile/sip/FacebookShareXmlResponse;->dayDiff:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iput v7, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->targetDayInterval:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .end local v0    # "fis":Ljava/io/FileInputStream;
    .end local v1    # "resp":Lcom/pccw/mobile/sip/FacebookShareXmlResponse;
    .end local v3    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v4    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v5    # "xmlHandler":Lcom/pccw/mobile/sip/FacebookShareXmlHandler;
    .end local v6    # "xr":Lorg/xml/sax/XMLReader;
    :goto_0
    return-void

    .line 201
    :catch_0
    move-exception v2

    .line 204
    .local v2, "se":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private setCallCount(Landroid/content/Context;I)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "numberOfCall"    # I

    .prologue
    .line 53
    const-string/jumbo v1, "FacebookShare"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 54
    .local v0, "CountPerf":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "CallCount"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 55
    return-void
.end method

.method private setLastShowingDay(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 101
    const-string/jumbo v1, "FacebookShare"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 102
    .local v0, "CountPerf":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "LastShowingDate"

    iget-object v3, p0, Lcom/pccw/mobile/sip/FacebookShareActivity;->format:Ljava/text/SimpleDateFormat;

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 103
    return-void
.end method

.method private shouldShowFacebookDialog(Landroid/content/Context;)Z
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 140
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->isCallCountMet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->isDateIntervalMet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getXmlFromServer(Landroid/content/Context;)Z
    .locals 14
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 212
    const/4 v6, 0x0

    .line 213
    .local v6, "url":Ljava/net/URL;
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v11

    .line 214
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 215
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v11

    .line 216
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 217
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v11

    .line 218
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->PRC:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 220
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    .line 221
    invoke-virtual {v11}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v11

    .line 222
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 224
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v11

    .line 225
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->TAIWAN:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 227
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    .line 228
    invoke-virtual {v11}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v11

    .line 229
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v12

    sget-object v13, Ljava/util/Locale;->TRADITIONAL_CHINESE:Ljava/util/Locale;

    invoke-virtual {v12, v13}, Ljava/util/Locale;->getDisplayLanguage(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 231
    :cond_0
    new-instance v7, Ljava/net/URL;

    const-string/jumbo v11, "https://sip.pccwmobile.com/voip02/sharing/fbPost_ch.xml"

    invoke-direct {v7, v11}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .end local v6    # "url":Ljava/net/URL;
    .local v7, "url":Ljava/net/URL;
    move-object v6, v7

    .line 236
    .end local v7    # "url":Ljava/net/URL;
    .restart local v6    # "url":Ljava/net/URL;
    :goto_0
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v8

    check-cast v8, Ljava/net/HttpURLConnection;

    .line 237
    .local v8, "urlConnection":Ljava/net/HttpURLConnection;
    const-string/jumbo v11, "GET"

    invoke-virtual {v8, v11}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 238
    const/4 v11, 0x1

    invoke-virtual {v8, v11}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 239
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->connect()V

    .line 241
    new-instance v3, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v11

    const-string/jumbo v12, "facebookshare.xml"

    invoke-direct {v3, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 242
    .local v3, "file":Ljava/io/File;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 244
    .local v4, "fileOutput":Ljava/io/FileOutputStream;
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .line 246
    .local v5, "inputStream":Ljava/io/InputStream;
    const/16 v11, 0x400

    new-array v0, v11, [B

    .line 247
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 249
    .local v1, "bufferLength":I
    :goto_1
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_2

    .line 250
    const/4 v11, 0x0

    invoke-virtual {v4, v0, v11, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 261
    .end local v0    # "buffer":[B
    .end local v1    # "bufferLength":I
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "fileOutput":Ljava/io/FileOutputStream;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "urlConnection":Ljava/net/HttpURLConnection;
    :catch_0
    move-exception v2

    .line 262
    .local v2, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v2}, Ljava/net/MalformedURLException;->printStackTrace()V

    .end local v2    # "e":Ljava/net/MalformedURLException;
    :goto_2
    move v9, v10

    .line 267
    :goto_3
    return v9

    .line 233
    :cond_1
    :try_start_1
    new-instance v7, Ljava/net/URL;

    const-string/jumbo v11, "https://sip.pccwmobile.com/voip02/sharing/fbPost_en.xml"

    invoke-direct {v7, v11}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .end local v6    # "url":Ljava/net/URL;
    .restart local v7    # "url":Ljava/net/URL;
    move-object v6, v7

    .end local v7    # "url":Ljava/net/URL;
    .restart local v6    # "url":Ljava/net/URL;
    goto :goto_0

    .line 254
    .restart local v0    # "buffer":[B
    .restart local v1    # "bufferLength":I
    .restart local v3    # "file":Ljava/io/File;
    .restart local v4    # "fileOutput":Ljava/io/FileOutputStream;
    .restart local v5    # "inputStream":Ljava/io/InputStream;
    .restart local v8    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_2
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 263
    .end local v0    # "buffer":[B
    .end local v1    # "bufferLength":I
    .end local v3    # "file":Ljava/io/File;
    .end local v4    # "fileOutput":Ljava/io/FileOutputStream;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v8    # "urlConnection":Ljava/net/HttpURLConnection;
    :catch_1
    move-exception v2

    .line 264
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2
.end method

.method public promptShareToFacebookDialog(Landroid/support/v4/app/FragmentManager;)V
    .locals 4
    .param p1, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 171
    new-instance v2, Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-direct {v2}, Lcom/pccw/mobile/sip/FacebookMainFragment;-><init>()V

    .line 172
    .local v2, "mFacebookFragment":Lcom/pccw/mobile/sip/FacebookMainFragment;
    const-string/jumbo v3, "facebookfrag"

    invoke-virtual {p1, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 175
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 176
    .local v0, "fT":Landroid/support/v4/app/FragmentTransaction;
    const-string/jumbo v3, "facebookfrag"

    invoke-virtual {p1, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 177
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 181
    .end local v0    # "fT":Landroid/support/v4/app/FragmentTransaction;
    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 182
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    const-string/jumbo v3, "facebookfrag"

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 183
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 184
    return-void
.end method

.method public runFacebookShareChecking(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;Z)Z
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fragmentManager"    # Landroid/support/v4/app/FragmentManager;
    .param p3, "cleanCallCount"    # Z

    .prologue
    const/4 v0, 0x0

    .line 145
    if-eqz p3, :cond_1

    .line 149
    invoke-direct {p0, p1, v0}, Lcom/pccw/mobile/sip/FacebookShareActivity;->setCallCount(Landroid/content/Context;I)V

    .line 156
    :goto_0
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->shouldShowFacebookDialog(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 161
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->setLastShowingDay(Landroid/content/Context;)V

    .line 162
    const/4 v0, 0x1

    .line 166
    :cond_0
    return v0

    .line 151
    :cond_1
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/FacebookShareActivity;->addCallCount(Landroid/content/Context;)V

    goto :goto_0
.end method
