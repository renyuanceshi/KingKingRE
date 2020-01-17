.class public Lcom/pccw/sms/service/AllHistoryIMServer;
.super Ljava/lang/Object;
.source "AllHistoryIMServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/service/AllHistoryIMServer$MixCallLogQuery;
    }
.end annotation


# instance fields
.field private LOG_TAG:Ljava/lang/String;

.field protected context:Landroid/content/Context;

.field protected mAllHistoryTempDAOImpl:Lcom/pccw/database/dao/AllHistoryTempDAOImpl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string/jumbo v0, "AllHistoryIMServer"

    iput-object v0, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->LOG_TAG:Ljava/lang/String;

    .line 26
    iput-object p1, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->context:Landroid/content/Context;

    .line 27
    new-instance v0, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->mAllHistoryTempDAOImpl:Lcom/pccw/database/dao/AllHistoryTempDAOImpl;

    .line 28
    return-void
.end method


# virtual methods
.method public addCallLogAll(Landroid/database/Cursor;)V
    .locals 14
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 36
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .local v9, "allHistoryTempEntities":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/AllHistoryTemp;>;"
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 38
    const/4 v10, 0x1

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 39
    .local v8, "contactnumber":Ljava/lang/String;
    const/4 v10, 0x2

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 40
    .local v2, "type":I
    new-instance v10, Ljava/util/Date;

    const/4 v11, 0x3

    invoke-interface {p1, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    invoke-direct {v10, v12, v13}, Ljava/util/Date;-><init>(J)V

    const-string/jumbo v11, "yyyy-MM-dd HH:mm:ss"

    invoke-static {v10, v11}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStr(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 41
    .local v3, "date":Ljava/lang/String;
    const/4 v10, 0x4

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 42
    .local v4, "duration":Ljava/lang/String;
    const/4 v10, 0x5

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 43
    .local v5, "cached_name":Ljava/lang/String;
    const/4 v10, 0x2

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 44
    .local v6, "cached_number_type":Ljava/lang/String;
    const/4 v10, 0x7

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 46
    .local v7, "cached_number_label":Ljava/lang/String;
    invoke-static {v8}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "chatNumber":Ljava/lang/String;
    new-instance v0, Lcom/pccw/database/entity/AllHistoryTemp;

    invoke-direct/range {v0 .. v8}, Lcom/pccw/database/entity/AllHistoryTemp;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .local v0, "callLogTempEntity":Lcom/pccw/database/entity/AllHistoryTemp;
    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 52
    .end local v0    # "callLogTempEntity":Lcom/pccw/database/entity/AllHistoryTemp;
    .end local v1    # "chatNumber":Ljava/lang/String;
    .end local v2    # "type":I
    .end local v3    # "date":Ljava/lang/String;
    .end local v4    # "duration":Ljava/lang/String;
    .end local v5    # "cached_name":Ljava/lang/String;
    .end local v6    # "cached_number_type":Ljava/lang/String;
    .end local v7    # "cached_number_label":Ljava/lang/String;
    .end local v8    # "contactnumber":Ljava/lang/String;
    :cond_0
    iget-object v10, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->mAllHistoryTempDAOImpl:Lcom/pccw/database/dao/AllHistoryTempDAOImpl;

    invoke-virtual {v10, v9}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->addList(Ljava/util/ArrayList;)V

    .line 54
    return-void
.end method

.method public clearCallLogAll()V
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->mAllHistoryTempDAOImpl:Lcom/pccw/database/dao/AllHistoryTempDAOImpl;

    invoke-virtual {v0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->removeAllFromCallLogTemp()V

    .line 32
    iget-object v0, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->mAllHistoryTempDAOImpl:Lcom/pccw/database/dao/AllHistoryTempDAOImpl;

    invoke-virtual {v0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->dropAllHistoryCombinedView()V

    .line 33
    return-void
.end method

.method public getAllHistoryCursor()Landroid/database/Cursor;
    .locals 9

    .prologue
    const/4 v3, 0x0

    .line 63
    iget-object v0, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->mAllHistoryTempDAOImpl:Lcom/pccw/database/dao/AllHistoryTempDAOImpl;

    invoke-virtual {v0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->removeAllFromCallLogTemp()V

    .line 64
    iget-object v0, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->mAllHistoryTempDAOImpl:Lcom/pccw/database/dao/AllHistoryTempDAOImpl;

    invoke-virtual {v0}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->dropAllHistoryCombinedView()V

    .line 66
    iget-object v0, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/pccw/sms/service/AllHistoryIMServer$MixCallLogQuery;->URI:Landroid/net/Uri;

    sget-object v2, Lcom/pccw/sms/service/AllHistoryIMServer$MixCallLogQuery;->PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 68
    .local v6, "cursor":Landroid/database/Cursor;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v8, "ss":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;>;"
    invoke-virtual {p0, v6}, Lcom/pccw/sms/service/AllHistoryIMServer;->addCallLogAll(Landroid/database/Cursor;)V

    .line 71
    invoke-virtual {p0}, Lcom/pccw/sms/service/AllHistoryIMServer;->getAllHistoryViewCursor()Landroid/database/Cursor;

    move-result-object v7

    .line 73
    .local v7, "cursor1":Landroid/database/Cursor;
    return-object v7
.end method

.method public getAllHistoryViewCursor()Landroid/database/Cursor;
    .locals 2

    .prologue
    .line 57
    iget-object v1, p0, Lcom/pccw/sms/service/AllHistoryIMServer;->mAllHistoryTempDAOImpl:Lcom/pccw/database/dao/AllHistoryTempDAOImpl;

    invoke-virtual {v1}, Lcom/pccw/database/dao/AllHistoryTempDAOImpl;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 58
    .local v0, "cursor":Landroid/database/Cursor;
    return-object v0
.end method
