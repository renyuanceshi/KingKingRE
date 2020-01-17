.class public Lcom/pccw/sms/util/ConcatUtil;
.super Ljava/lang/Object;
.source "ConcatUtil.java"


# static fields
.field public static maxCharCountCh:I

.field public static maxCharCountCh2:I

.field public static maxCharCountEn:I

.field public static maxCharCountEn2:I

.field public static maxConcatCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 13
    sput v0, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    .line 14
    sput v0, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh:I

    .line 15
    sput v0, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    .line 16
    sput v0, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn:I

    .line 17
    sput v0, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCharAndConcatCount(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/Integer;
    .locals 9
    .param p0, "cxt"    # Landroid/content/Context;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    .line 96
    const/4 v5, 0x4

    new-array v2, v5, [Ljava/lang/Integer;

    .line 97
    .local v2, "integer":[Ljava/lang/Integer;
    invoke-static {p0}, Lcom/pccw/sms/util/ConcatUtil;->getMaxConcatCount(Landroid/content/Context;)I

    move-result v5

    sput v5, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    .line 98
    invoke-static {p0}, Lcom/pccw/sms/util/ConcatUtil;->getMaxCharCountCh(Landroid/content/Context;)I

    move-result v5

    sput v5, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh:I

    .line 99
    invoke-static {p0}, Lcom/pccw/sms/util/ConcatUtil;->getMaxCharCountCh2(Landroid/content/Context;)I

    move-result v5

    sput v5, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    .line 100
    invoke-static {p0}, Lcom/pccw/sms/util/ConcatUtil;->getMaxCharCountEn(Landroid/content/Context;)I

    move-result v5

    sput v5, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn:I

    .line 101
    invoke-static {p0}, Lcom/pccw/sms/util/ConcatUtil;->getMaxCharCountEn2(Landroid/content/Context;)I

    move-result v5

    sput v5, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    .line 106
    invoke-static {p1}, Lcom/pccw/mobile/util/StringUtil;->isContainChinese(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 107
    sget v3, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh:I

    .line 108
    .local v3, "maxCharCount":I
    sget v4, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    .line 115
    .local v4, "maxCharCount2":I
    :goto_0
    const/4 v1, 0x1

    .line 116
    .local v1, "concatCount":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v3

    if-lez v5, :cond_0

    .line 117
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    div-int/2addr v5, v3

    add-int/lit8 v1, v5, 0x1

    .line 118
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    mul-int/lit8 v6, v4, 0x2

    sub-int/2addr v5, v6

    if-lez v5, :cond_0

    .line 119
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    div-int/2addr v5, v4

    add-int/lit8 v1, v5, 0x1

    .line 122
    :cond_0
    const-string/jumbo v5, "test"

    const-string/jumbo v6, "-------------------"

    invoke-static {v5, v6}, Lcom/pccwmobile/common/utilities/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    if-ne v1, v8, :cond_2

    .line 125
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int v0, v3, v5

    .line 130
    .local v0, "charCount":I
    :goto_1
    const-string/jumbo v5, "test"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "$charCount = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/pccwmobile/common/utilities/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const-string/jumbo v5, "test"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "$concatCount = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/pccwmobile/common/utilities/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v5

    .line 134
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v8

    .line 135
    const/4 v5, 0x2

    sget v6, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    mul-int/2addr v6, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v5

    .line 136
    const/4 v5, 0x3

    sget v6, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v2, v5

    .line 137
    return-object v2

    .line 110
    .end local v0    # "charCount":I
    .end local v1    # "concatCount":I
    .end local v3    # "maxCharCount":I
    .end local v4    # "maxCharCount2":I
    :cond_1
    sget v3, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn:I

    .line 111
    .restart local v3    # "maxCharCount":I
    sget v4, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    .restart local v4    # "maxCharCount2":I
    goto/16 :goto_0

    .line 127
    .restart local v1    # "concatCount":I
    :cond_2
    mul-int v5, v1, v4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    sub-int v0, v5, v6

    .restart local v0    # "charCount":I
    goto :goto_1
.end method

.method public static getDeleteIndex(Ljava/lang/String;Landroid/text/Editable;Ljava/lang/String;II)I
    .locals 6
    .param p0, "beforeStr"    # Ljava/lang/String;
    .param p1, "s"    # Landroid/text/Editable;
    .param p2, "addStr"    # Ljava/lang/String;
    .param p3, "oldConcatCount"    # I
    .param p4, "oldCharCount"    # I

    .prologue
    .line 145
    invoke-static {p0}, Lcom/pccw/mobile/util/StringUtil;->isContainChinese(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 146
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh:I

    .line 147
    .local v1, "maxCharCount":I
    sget v2, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    .line 152
    .local v2, "maxCharCount2":I
    :goto_0
    const/4 v4, 0x1

    if-ne p3, v4, :cond_1

    .line 153
    sub-int v0, v1, p4

    .line 158
    .local v0, "alreadyAddCount":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/pccw/mobile/util/StringUtil;->isContainChinese(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 159
    sget v4, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    sget v5, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    mul-int v3, v4, v5

    .line 163
    .local v3, "maxLength":I
    :goto_2
    sub-int v4, v0, v3

    if-lez v4, :cond_3

    .line 164
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v4

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    .line 166
    :goto_3
    return v4

    .line 149
    .end local v0    # "alreadyAddCount":I
    .end local v1    # "maxCharCount":I
    .end local v2    # "maxCharCount2":I
    .end local v3    # "maxLength":I
    :cond_0
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn:I

    .line 150
    .restart local v1    # "maxCharCount":I
    sget v2, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    .restart local v2    # "maxCharCount2":I
    goto :goto_0

    .line 155
    :cond_1
    mul-int v4, p3, v2

    sub-int v0, v4, p4

    .restart local v0    # "alreadyAddCount":I
    goto :goto_1

    .line 161
    :cond_2
    sget v4, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    sget v5, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    mul-int v3, v4, v5

    .restart local v3    # "maxLength":I
    goto :goto_2

    .line 166
    :cond_3
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v4

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    sub-int v5, v3, v0

    add-int/2addr v4, v5

    goto :goto_3
.end method

.method public static getMaxCharCountCh(Landroid/content/Context;)I
    .locals 3
    .param p0, "cxt"    # Landroid/content/Context;

    .prologue
    .line 46
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh:I

    if-nez v1, :cond_1

    .line 47
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07016e

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "maxCharCountStr":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_2

    .line 50
    :cond_0
    const/16 v1, 0x46

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh:I

    .line 55
    .end local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_1
    :goto_0
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh:I

    return v1

    .line 52
    .restart local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh:I

    goto :goto_0
.end method

.method public static getMaxCharCountCh2(Landroid/content/Context;)I
    .locals 3
    .param p0, "cxt"    # Landroid/content/Context;

    .prologue
    .line 59
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    if-nez v1, :cond_1

    .line 60
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07016f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "maxCharCountStr":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_2

    .line 63
    :cond_0
    const/16 v1, 0x43

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    .line 68
    .end local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_1
    :goto_0
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    return v1

    .line 65
    .restart local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountCh2:I

    goto :goto_0
.end method

.method public static getMaxCharCountEn(Landroid/content/Context;)I
    .locals 3
    .param p0, "cxt"    # Landroid/content/Context;

    .prologue
    .line 20
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn:I

    if-nez v1, :cond_1

    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070170

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 23
    .local v0, "maxCharCountStr":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_2

    .line 24
    :cond_0
    const/16 v1, 0xa0

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn:I

    .line 29
    .end local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_1
    :goto_0
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn:I

    return v1

    .line 26
    .restart local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn:I

    goto :goto_0
.end method

.method public static getMaxCharCountEn2(Landroid/content/Context;)I
    .locals 3
    .param p0, "cxt"    # Landroid/content/Context;

    .prologue
    .line 33
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    if-nez v1, :cond_1

    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070171

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "maxCharCountStr":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_2

    .line 37
    :cond_0
    const/16 v1, 0x99

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    .line 42
    .end local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_1
    :goto_0
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    return v1

    .line 39
    .restart local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxCharCountEn2:I

    goto :goto_0
.end method

.method public static getMaxConcatCount(Landroid/content/Context;)I
    .locals 3
    .param p0, "cxt"    # Landroid/content/Context;

    .prologue
    .line 72
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    if-nez v1, :cond_1

    .line 73
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070172

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "maxCharCountStr":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez v0, :cond_2

    .line 76
    :cond_0
    const/4 v1, 0x5

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    .line 81
    .end local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_1
    :goto_0
    sget v1, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    return v1

    .line 78
    .restart local v0    # "maxCharCountStr":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sput v1, Lcom/pccw/sms/util/ConcatUtil;->maxConcatCount:I

    goto :goto_0
.end method
