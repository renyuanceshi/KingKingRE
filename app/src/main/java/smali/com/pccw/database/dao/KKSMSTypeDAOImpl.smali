.class public Lcom/pccw/database/dao/KKSMSTypeDAOImpl;
.super Ljava/lang/Object;
.source "KKSMSTypeDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/KKSMSType;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field protected KKSMSTYPE_TABLE_COLUMNS:[Ljava/lang/String;

.field public LOG_TAG:Ljava/lang/String;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string/jumbo v0, "KKSMSTypeImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 17
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 19
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "msisdn"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "smsType"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "updateTime"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->KKSMSTYPE_TABLE_COLUMNS:[Ljava/lang/String;

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    const-string/jumbo v0, "KKSMSTypeImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 17
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 19
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "msisdn"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "smsType"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "updateTime"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->KKSMSTYPE_TABLE_COLUMNS:[Ljava/lang/String;

    .line 25
    iput-object p1, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->mContext:Landroid/content/Context;

    .line 26
    return-void
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/KKSMSType;)V
    .locals 6
    .param p1, "entity"    # Lcom/pccw/database/entity/KKSMSType;

    .prologue
    .line 108
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 109
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "msisdn"

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getMsisdn()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    const-string/jumbo v3, "smsType"

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getSmsType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const-string/jumbo v3, "updateTime"

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getUpdateTime()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->open()V

    .line 116
    iget-object v3, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "kksmstype"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 117
    .local v0, "modelId":J
    iget-object v3, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "KKSMSTypeImpl, add, added ID="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    .line 122
    .end local v0    # "modelId":J
    :goto_0
    return-void

    .line 118
    :catch_0
    move-exception v3

    .line 120
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    throw v3
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 15
    check-cast p1, Lcom/pccw/database/entity/KKSMSType;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->add(Lcom/pccw/database/entity/KKSMSType;)V

    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 132
    return-void
.end method

.method public find(Ljava/lang/String;)Lcom/pccw/database/entity/KKSMSType;
    .locals 7
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 62
    new-instance v2, Lcom/pccw/database/entity/KKSMSType;

    invoke-direct {v2}, Lcom/pccw/database/entity/KKSMSType;-><init>()V

    .line 63
    .local v2, "kksmsType":Lcom/pccw/database/entity/KKSMSType;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "SELECT * FROM kksmstype where msisdn = \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 65
    .local v3, "query":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->open()V

    .line 66
    iget-object v5, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 67
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_0

    .line 77
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    .line 79
    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v4

    .line 70
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 71
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/KKSMSType;

    move-result-object v2

    .line 72
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    .end local v0    # "cursor":Landroid/database/Cursor;
    :goto_1
    move-object v4, v2

    .line 79
    goto :goto_0

    .line 74
    :catch_0
    move-exception v1

    .line 75
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v4, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "KKSMSTypeImpl, listKKSMSTypeWithmsisdn, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 77
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    goto :goto_1

    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    throw v4
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 15
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/KKSMSType;

    move-result-object v0

    return-object v0
.end method

.method public list()Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/KKSMSType;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 30
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .local v2, "kksmstypeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/KKSMSType;>;"
    const-string/jumbo v3, "SELECT * FROM kksmstype"

    .line 33
    .local v3, "query":Ljava/lang/String;
    iget-object v5, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "KKSMSTypeImpl, query="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->open()V

    .line 36
    iget-object v5, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 37
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    move-object v2, v4

    .line 57
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v2    # "kksmstypeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/KKSMSType;>;"
    :goto_0
    return-object v2

    .line 40
    .restart local v0    # "cursor":Landroid/database/Cursor;
    .restart local v2    # "kksmstypeList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/KKSMSType;>;"
    :cond_0
    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 41
    iget-object v4, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "KKSMSTypeImpl, list, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-nez v4, :cond_1

    .line 44
    :try_start_2
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/KKSMSType;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 48
    :goto_2
    :try_start_3
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 52
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 53
    .local v1, "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "KKSMSTypeImpl, listKKSMSTypeWithmsisdn, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 55
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    goto :goto_0

    .line 45
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v1

    .line 46
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v4, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "list, fail to add exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 55
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    throw v4

    .line 50
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_1
    :try_start_6
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 55
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    goto :goto_0
.end method

.method public open()V
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 127
    return-void
.end method

.method protected parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/KKSMSType;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 135
    iget-object v4, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v5, "KKSMSTypeImpl started"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const-string/jumbo v4, "msisdn"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "msisdn":Ljava/lang/String;
    const-string/jumbo v4, "smsType"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 138
    .local v2, "type":Ljava/lang/String;
    const-string/jumbo v4, "updateTime"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 139
    .local v3, "updateTime":Ljava/lang/String;
    new-instance v1, Lcom/pccw/database/entity/KKSMSType;

    invoke-direct {v1, v0, v2, v3}, Lcom/pccw/database/entity/KKSMSType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .local v1, "smsType":Lcom/pccw/database/entity/KKSMSType;
    return-object v1
.end method

.method public remove(Lcom/pccw/database/entity/KKSMSType;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/KKSMSType;

    .prologue
    .line 104
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 15
    check-cast p1, Lcom/pccw/database/entity/KKSMSType;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->remove(Lcom/pccw/database/entity/KKSMSType;)V

    return-void
.end method

.method public update(Lcom/pccw/database/entity/KKSMSType;)I
    .locals 9
    .param p1, "entity"    # Lcom/pccw/database/entity/KKSMSType;

    .prologue
    .line 84
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 85
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "msisdn"

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getMsisdn()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const-string/jumbo v3, "smsType"

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getSmsType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const-string/jumbo v3, "updateTime"

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getUpdateTime()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    const/4 v1, 0x0

    .line 90
    .local v1, "row":I
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->open()V

    .line 91
    iget-object v3, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "kksmstype"

    const-string/jumbo v5, "msisdn=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/pccw/database/entity/KKSMSType;->getMsisdn()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 92
    iget-object v3, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "KKSMSTypeImpl, update, updated number of row="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    .line 98
    :goto_0
    return v1

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "KKSMSTypeImpl, update, exception="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->close()V

    throw v3
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 15
    check-cast p1, Lcom/pccw/database/entity/KKSMSType;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/KKSMSTypeDAOImpl;->update(Lcom/pccw/database/entity/KKSMSType;)I

    move-result v0

    return v0
.end method
