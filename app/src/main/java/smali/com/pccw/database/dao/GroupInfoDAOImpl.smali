.class public Lcom/pccw/database/dao/GroupInfoDAOImpl;
.super Ljava/lang/Object;
.source "GroupInfoDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/GroupInfo;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field protected GROUPINFO_TABLE_COLUMN:[Ljava/lang/String;

.field private LOG_TAG:Ljava/lang/String;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string/jumbo v0, "GroupInfoDAOImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 23
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "GROUPID"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "GROUPNAME"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "CREATEDATE"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->GROUPINFO_TABLE_COLUMN:[Ljava/lang/String;

    .line 26
    iput-object p1, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->mContext:Landroid/content/Context;

    .line 27
    return-void
.end method

.method private addResultToGroupInfoList(Ljava/util/ArrayList;Landroid/database/Cursor;)V
    .locals 4
    .param p2, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/GroupInfo;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 166
    .local p1, "groupInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/GroupInfo;>;"
    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 168
    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_0

    .line 170
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->parseGroupInfo(Landroid/database/Cursor;)Lcom/pccw/database/entity/GroupInfo;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    :goto_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 171
    :catch_0
    move-exception v0

    .line 172
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "GroupInfoDAOImpl, fail to add GroupInfo exception="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 176
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/GroupInfo;)V
    .locals 8
    .param p1, "entity"    # Lcom/pccw/database/entity/GroupInfo;

    .prologue
    .line 136
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 137
    .local v1, "values":Landroid/content/ContentValues;
    iget-object v4, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "insert db; from id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/pccw/database/entity/GroupInfo;->getGroupId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " ;group name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/pccw/database/entity/GroupInfo;->getGroupName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iget-object v4, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "  Time Save: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/pccw/database/entity/GroupInfo;->getCreatedate()Ljava/util/Date;

    move-result-object v6

    const-string/jumbo v7, "yyyy-MM-dd HH:mm:ss"

    invoke-static {v6, v7}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStr(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    const-string/jumbo v4, "GROUPID"

    invoke-virtual {p1}, Lcom/pccw/database/entity/GroupInfo;->getGroupId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    const-string/jumbo v4, "GROUPNAME"

    invoke-virtual {p1}, Lcom/pccw/database/entity/GroupInfo;->getGroupName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    const-string/jumbo v4, "CREATEDATE"

    invoke-virtual {p1}, Lcom/pccw/database/entity/GroupInfo;->getCreatedate()Ljava/util/Date;

    move-result-object v5

    const-string/jumbo v6, "yyyy-MM-dd HH:mm:ss"

    invoke-static {v5, v6}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStr(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->open()V

    .line 145
    iget-object v4, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v5, "groupinfo"

    const/4 v6, 0x0

    const/4 v7, 0x5

    invoke-virtual {v4, v5, v6, v1, v7}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v2

    .line 146
    .local v2, "id":J
    iget-object v4, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "GroupInfoDAOImpl, add, added groupInfo with ID="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    .line 153
    .end local v2    # "id":J
    :goto_0
    return-void

    .line 147
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 150
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    throw v4
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 16
    check-cast p1, Lcom/pccw/database/entity/GroupInfo;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->add(Lcom/pccw/database/entity/GroupInfo;)V

    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 163
    return-void
.end method

.method public find(Ljava/lang/String;)Lcom/pccw/database/entity/GroupInfo;
    .locals 11
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "GroupInfo, find, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    const/4 v10, 0x0

    .line 59
    .local v10, "groupInfo":Lcom/pccw/database/entity/GroupInfo;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->open()V

    .line 60
    if-eqz p1, :cond_1

    .line 61
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "groupinfo"

    iget-object v2, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->GROUPINFO_TABLE_COLUMN:[Ljava/lang/String;

    const-string/jumbo v3, "GROUPID=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 63
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 64
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    :try_start_1
    invoke-virtual {p0, v8}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->parseGroupInfo(Landroid/database/Cursor;)Lcom/pccw/database/entity/GroupInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v10

    .line 71
    :goto_0
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    .end local v8    # "cursor":Landroid/database/Cursor;
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    .line 81
    :goto_2
    return-object v10

    .line 68
    .restart local v8    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v9

    .line 69
    .local v9, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "GroupInfo, find, exception="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 76
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v9    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v9

    .line 77
    .restart local v9    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "GroupInfo, find, exception="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 79
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    goto :goto_2

    .line 74
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_5
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "GroupInfo, find, key is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 79
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    throw v0
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 16
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/GroupInfo;

    move-result-object v0

    return-object v0
.end method

.method public list()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/GroupInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 32
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "GroupInfoDAOImpl, list, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .local v10, "groupInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/GroupInfo;>;"
    const-string/jumbo v7, "GROUPNAME ASC"

    .line 37
    .local v7, "orderBy":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->open()V

    .line 38
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "groupinfo"

    iget-object v2, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->GROUPINFO_TABLE_COLUMN:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 39
    .local v8, "cursor":Landroid/database/Cursor;
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "GroupInfoDAOImpl, list, count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    invoke-direct {p0, v10, v8}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->addResultToGroupInfoList(Ljava/util/ArrayList;Landroid/database/Cursor;)V

    .line 41
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    .line 49
    .end local v8    # "cursor":Landroid/database/Cursor;
    :goto_0
    return-object v10

    .line 43
    :catch_0
    move-exception v9

    .line 44
    .local v9, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "GroupInfoDAOImpl, list, exception="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v9}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    goto :goto_0

    .end local v9    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    throw v0
.end method

.method public open()V
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 158
    return-void
.end method

.method protected parseGroupInfo(Landroid/database/Cursor;)Lcom/pccw/database/entity/GroupInfo;
    .locals 5
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 180
    const-string/jumbo v4, "GROUPID"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 181
    .local v1, "groupId":Ljava/lang/String;
    const-string/jumbo v4, "GROUPNAME"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 182
    .local v3, "groupName":Ljava/lang/String;
    const-string/jumbo v4, "CREATEDATE"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/pccw/mobile/util/FormatUtil;->convertStrToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 184
    .local v0, "createDate":Ljava/util/Date;
    new-instance v2, Lcom/pccw/database/entity/GroupInfo;

    invoke-direct {v2, v1, v3, v0}, Lcom/pccw/database/entity/GroupInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 185
    .local v2, "groupInfo":Lcom/pccw/database/entity/GroupInfo;
    return-object v2
.end method

.method public remove(Lcom/pccw/database/entity/GroupInfo;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/GroupInfo;

    .prologue
    .line 115
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 16
    check-cast p1, Lcom/pccw/database/entity/GroupInfo;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->remove(Lcom/pccw/database/entity/GroupInfo;)V

    return-void
.end method

.method public removeByGroupId(Ljava/lang/String;)V
    .locals 8
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 120
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->open()V

    .line 121
    iget-object v2, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "groupinfo"

    const-string/jumbo v4, "GROUPID=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 122
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "GroupInfoDAOImpl, remove, removed number of row="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    .line 130
    .end local v1    # "row":I
    :goto_0
    return-void

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "GroupInfoDAOImpl, remove, exception="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    throw v2
.end method

.method public update(Lcom/pccw/database/entity/GroupInfo;)I
    .locals 1
    .param p1, "entity"    # Lcom/pccw/database/entity/GroupInfo;

    .prologue
    .line 87
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 16
    check-cast p1, Lcom/pccw/database/entity/GroupInfo;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->update(Lcom/pccw/database/entity/GroupInfo;)I

    move-result v0

    return v0
.end method

.method public updateGroupNameAndDate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .locals 8
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "groupName"    # Ljava/lang/String;
    .param p3, "createDate"    # Ljava/util/Date;

    .prologue
    .line 92
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 93
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "GROUPNAME"

    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    const-string/jumbo v3, "CREATEDATE"

    const-string/jumbo v4, "yyyy-MM-dd HH:mm:ss"

    invoke-static {p3, v4}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStr(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    const/4 v1, 0x0

    .line 99
    .local v1, "row":I
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->open()V

    .line 100
    iget-object v3, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "groupinfo"

    const-string/jumbo v5, "GROUPID=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 102
    iget-object v3, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "GroupInfoDAOImpl, updateGroupNameAndDate, updated number of row="

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

    .line 106
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    .line 109
    :goto_0
    return-void

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/GroupInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "GroupInfoDAOImpl, updateGroupNameAndDate, exception="

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

    .line 106
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupInfoDAOImpl;->close()V

    throw v3
.end method
