.class public Lcom/pccw/sms/util/SMSNumberUtil;
.super Ljava/lang/Object;
.source "SMSNumberUtil.java"


# static fields
.field public static final MAX_NUMBER_LENGTH:I = 0x19

.field private static final hkPrefix:[Ljava/lang/String;

.field private static final iddPrefix:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 13
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "+852"

    aput-object v1, v0, v2

    const-string/jumbo v1, "001852"

    aput-object v1, v0, v3

    sput-object v0, Lcom/pccw/sms/util/SMSNumberUtil;->hkPrefix:[Ljava/lang/String;

    .line 16
    new-array v0, v3, [Ljava/lang/String;

    const-string/jumbo v1, "+"

    aput-object v1, v0, v2

    sput-object v0, Lcom/pccw/sms/util/SMSNumberUtil;->iddPrefix:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-static {p0}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 130
    sget-object v2, Lcom/pccw/sms/util/SMSNumberUtil;->hkPrefix:[Ljava/lang/String;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v0, v2, v1

    .line 131
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 132
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 136
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_0
    return-object p0

    .line 130
    .restart local v0    # "prefix":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static isHKLandlineNumber(Ljava/lang/String;)Z
    .locals 6
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 76
    if-nez p0, :cond_1

    .line 96
    :cond_0
    :goto_0
    return v1

    .line 80
    :cond_1
    invoke-static {p0}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 82
    invoke-static {p0}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 86
    sget-object v3, Lcom/pccw/sms/util/SMSNumberUtil;->hkPrefix:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_1
    if-ge v2, v4, :cond_2

    aget-object v0, v3, v2

    .line 87
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 88
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 93
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_2
    invoke-static {p0}, Lcom/pccw/mobile/util/StringUtil;->isNumeric(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 96
    invoke-static {p0}, Lcom/pccw/mobile/util/MobileNumberUtil;->isHKMobileNumberStart(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 86
    .restart local v0    # "prefix":Ljava/lang/String;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static isHKMobileNumber(Ljava/lang/String;)Z
    .locals 6
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 51
    if-nez p0, :cond_1

    .line 71
    :cond_0
    :goto_0
    return v1

    .line 55
    :cond_1
    invoke-static {p0}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 57
    invoke-static {p0}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 61
    sget-object v3, Lcom/pccw/sms/util/SMSNumberUtil;->hkPrefix:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_1
    if-ge v2, v4, :cond_2

    aget-object v0, v3, v2

    .line 62
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 63
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 68
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_2
    invoke-static {p0}, Lcom/pccw/mobile/util/StringUtil;->isNumeric(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 71
    invoke-static {p0}, Lcom/pccw/mobile/util/MobileNumberUtil;->isHKMobileNumberStart(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 61
    .restart local v0    # "prefix":Ljava/lang/String;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static isInternationalNumber(Ljava/lang/String;)Z
    .locals 6
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 101
    if-nez p0, :cond_1

    .line 125
    :cond_0
    :goto_0
    return v1

    .line 105
    :cond_1
    invoke-static {p0}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 107
    invoke-static {p0}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 111
    sget-object v3, Lcom/pccw/sms/util/SMSNumberUtil;->hkPrefix:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_1
    if-ge v2, v4, :cond_2

    aget-object v0, v3, v2

    .line 112
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 111
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 117
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_2
    sget-object v3, Lcom/pccw/sms/util/SMSNumberUtil;->iddPrefix:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    :goto_2
    if-ge v2, v4, :cond_0

    aget-object v0, v3, v2

    .line 118
    .restart local v0    # "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/pccw/mobile/util/StringUtil;->isNumeric(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 121
    const/4 v1, 0x1

    goto :goto_0

    .line 117
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method public static isValidRecipient(Ljava/lang/String;)Z
    .locals 8
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x8

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 21
    if-nez p0, :cond_1

    .line 47
    :cond_0
    :goto_0
    return v1

    .line 25
    :cond_1
    invoke-static {p0}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 27
    invoke-static {p0}, Lorg/apache/http/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 31
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x19

    if-gt v3, v4, :cond_0

    .line 35
    sget-object v4, Lcom/pccw/sms/util/SMSNumberUtil;->hkPrefix:[Ljava/lang/String;

    array-length v5, v4

    move v3, v1

    :goto_1
    if-ge v3, v5, :cond_5

    aget-object v0, v4, v3

    .line 36
    .local v0, "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 37
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/util/StringUtil;->isNumeric(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v3, v7, :cond_3

    :cond_2
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "992"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0

    .line 35
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 41
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_5
    sget-object v4, Lcom/pccw/sms/util/SMSNumberUtil;->iddPrefix:[Ljava/lang/String;

    array-length v5, v4

    move v3, v1

    :goto_2
    if-ge v3, v5, :cond_7

    aget-object v0, v4, v3

    .line 42
    .restart local v0    # "prefix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/util/StringUtil;->isNumeric(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 41
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 47
    .end local v0    # "prefix":Ljava/lang/String;
    :cond_7
    invoke-static {p0}, Lcom/pccw/mobile/util/StringUtil;->isNumeric(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v3, v7, :cond_9

    :cond_8
    const-string/jumbo v3, "992"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_9
    move v1, v2

    goto/16 :goto_0
.end method

.method public static trimSpace(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 150
    const-string/jumbo v0, " "

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 151
    return-object p0
.end method

.method public static trimSymbol(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 140
    const-string/jumbo v0, " "

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 141
    const-string/jumbo v0, "("

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 142
    const-string/jumbo v0, ")"

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 143
    const-string/jumbo v0, "-"

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 144
    const-string/jumbo v0, "\\u00A0"

    invoke-static {v0}, Lorg/apache/commons/lang/StringEscapeUtils;->unescapeJava(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 146
    return-object p0
.end method
