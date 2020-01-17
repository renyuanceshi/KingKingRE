.class public Lcom/pccw/mobile/sip/service/SMSTypeService;
.super Ljava/lang/Object;
.source "SMSTypeService.java"


# static fields
.field private static final SMS_TYPE_UPDATE_INTERVAL:I = 0xdbba00


# instance fields
.field protected kksmsTypeDAOImpl:Lcom/pccw/database/dao/KKSMSTypeDAOImpl;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/SMSTypeService;->mContext:Landroid/content/Context;

    .line 26
    new-instance v0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/SMSTypeService;->kksmsTypeDAOImpl:Lcom/pccw/database/dao/KKSMSTypeDAOImpl;

    .line 27
    return-void
.end method

.method private getCheckedSMSTypeList(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "rawNumbersList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .local v0, "hkMobileNumberList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .local v1, "internationalNumberList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .local v3, "otherNumberList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v4, "treatedList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 71
    .local v2, "number":Ljava/lang/String;
    invoke-static {v2}, Lcom/pccw/sms/util/SMSNumberUtil;->isHKMobileNumber(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 72
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 73
    :cond_0
    invoke-static {v2}, Lcom/pccw/sms/util/SMSNumberUtil;->isInternationalNumber(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 74
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 76
    :cond_1
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 80
    .end local v2    # "number":Ljava/lang/String;
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 81
    invoke-static {v0}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/pccw/mobile/sip/util/SMSTypeHelper;->callSMSTypeAPI(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 84
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4

    .line 85
    invoke-static {v1}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/pccw/mobile/sip/util/SMSTypeHelper;->createListOfInternationalSMSType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 88
    :cond_4
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5

    .line 89
    invoke-static {v3}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/pccw/mobile/sip/util/SMSTypeHelper;->createListOfUnknownSMSType(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 92
    :cond_5
    return-object v4
.end method

.method private getSMSType(Lcom/pccw/database/entity/KKSMSType;)Lcom/pccw/mobile/sip/SMSType;
    .locals 3
    .param p1, "kkSMSType"    # Lcom/pccw/database/entity/KKSMSType;

    .prologue
    .line 122
    new-instance v0, Lcom/pccw/mobile/sip/SMSType;

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getMsisdn()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getSmsType()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/SMSType;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private isUpdateTimeOvered(Lcom/pccw/database/entity/KKSMSType;Ljava/lang/Long;)Z
    .locals 8
    .param p1, "kkSMSType"    # Lcom/pccw/database/entity/KKSMSType;
    .param p2, "time"    # Ljava/lang/Long;

    .prologue
    .line 108
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string/jumbo v4, "yyyyMMddHHmmss"

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 109
    .local v3, "sdf":Ljava/text/SimpleDateFormat;
    const-wide/16 v0, 0x0

    .line 111
    .local v0, "dbTime":J
    if-eqz p1, :cond_0

    .line 112
    :try_start_0
    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getUpdateTime()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 118
    :cond_0
    :goto_0
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v4, v0

    const-wide/32 v6, 0xdbba00

    cmp-long v4, v4, v6

    if-ltz v4, :cond_1

    const/4 v4, 0x1

    :goto_1
    return v4

    .line 114
    :catch_0
    move-exception v2

    .line 115
    .local v2, "e":Ljava/text/ParseException;
    invoke-virtual {v2}, Ljava/text/ParseException;->printStackTrace()V

    goto :goto_0

    .line 118
    .end local v2    # "e":Ljava/text/ParseException;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private updateDB(Ljava/util/List;Ljava/lang/String;)V
    .locals 5
    .param p2, "updateTime"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 96
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 97
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/pccw/mobile/sip/SMSType;

    .line 98
    .local v2, "s":Lcom/pccw/mobile/sip/SMSType;
    new-instance v1, Lcom/pccw/database/entity/KKSMSType;

    iget-object v3, v2, Lcom/pccw/mobile/sip/SMSType;->msisdn:Ljava/lang/String;

    iget-object v4, v2, Lcom/pccw/mobile/sip/SMSType;->type:Ljava/lang/String;

    invoke-direct {v1, v3, v4, p2}, Lcom/pccw/database/entity/KKSMSType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .local v1, "kktype":Lcom/pccw/database/entity/KKSMSType;
    iget-object v3, v2, Lcom/pccw/mobile/sip/SMSType;->msisdn:Ljava/lang/String;

    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 100
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/SMSTypeService;->kksmsTypeDAOImpl:Lcom/pccw/database/dao/KKSMSTypeDAOImpl;

    invoke-virtual {v3, v1}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->update(Lcom/pccw/database/entity/KKSMSType;)I

    .line 96
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    :cond_0
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/SMSTypeService;->kksmsTypeDAOImpl:Lcom/pccw/database/dao/KKSMSTypeDAOImpl;

    invoke-virtual {v3, v1}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->add(Lcom/pccw/database/entity/KKSMSType;)V

    goto :goto_1

    .line 105
    .end local v1    # "kktype":Lcom/pccw/database/entity/KKSMSType;
    .end local v2    # "s":Lcom/pccw/mobile/sip/SMSType;
    :cond_1
    return-void
.end method


# virtual methods
.method public getSMSTypeList(Ljava/lang/String;)Ljava/util/List;
    .locals 13
    .param p1, "msisdnlist"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 30
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .local v8, "resultTypesList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .local v7, "needCallAPINumberList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 34
    .local v10, "time":J
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string/jumbo v9, "yyyyMMddHHmmss"

    invoke-direct {v2, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 35
    .local v2, "format":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/sql/Date;

    invoke-direct {v1, v10, v11}, Ljava/sql/Date;-><init>(J)V

    .line 36
    .local v1, "d1":Ljava/sql/Date;
    invoke-virtual {v2, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "currentTime":Ljava/lang/String;
    const-string/jumbo v9, ";"

    invoke-virtual {p1, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 40
    .local v6, "msisdnStrings":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v9, v6

    if-ge v3, v9, :cond_2

    .line 41
    iget-object v9, p0, Lcom/pccw/mobile/sip/service/SMSTypeService;->kksmsTypeDAOImpl:Lcom/pccw/database/dao/KKSMSTypeDAOImpl;

    aget-object v12, v6, v3

    invoke-virtual {v9, v12}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/KKSMSType;

    move-result-object v4

    .line 43
    .local v4, "kksmsType":Lcom/pccw/database/entity/KKSMSType;
    if-eqz v4, :cond_0

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-direct {p0, v4, v9}, Lcom/pccw/mobile/sip/service/SMSTypeService;->isUpdateTimeOvered(Lcom/pccw/database/entity/KKSMSType;Ljava/lang/Long;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 44
    :cond_0
    aget-object v9, v6, v3

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 46
    :cond_1
    invoke-direct {p0, v4}, Lcom/pccw/mobile/sip/service/SMSTypeService;->getSMSType(Lcom/pccw/database/entity/KKSMSType;)Lcom/pccw/mobile/sip/SMSType;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 50
    .end local v4    # "kksmsType":Lcom/pccw/database/entity/KKSMSType;
    :cond_2
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_3

    .line 51
    invoke-direct {p0, v7}, Lcom/pccw/mobile/sip/service/SMSTypeService;->getCheckedSMSTypeList(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    .line 53
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    if-eqz v5, :cond_3

    .line 54
    invoke-interface {v8, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 55
    invoke-direct {p0, v5, v0}, Lcom/pccw/mobile/sip/service/SMSTypeService;->updateDB(Ljava/util/List;Ljava/lang/String;)V

    .line 59
    .end local v5    # "list":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    :cond_3
    return-object v8
.end method
