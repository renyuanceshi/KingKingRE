.class public Lcom/pccw/database/dao/ResendPerformDAOImpl;
.super Ljava/lang/Object;
.source "ResendPerformDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/ResendMessage;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field CHATID_COLUMN:I

.field ID_COLUMN:I

.field LOCALFILEPATH_COLUMN:I

.field public LOG_TAG:Ljava/lang/String;

.field MESSAGEID_COLUMN:I

.field MESSAGETYPE_COLUMN:I

.field RECIPIENT_COLUMN:I

.field final RESEND_VIEW:Ljava/lang/String;

.field protected context:Landroid/content/Context;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-string/jumbo v0, "ResendMessageDAOImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 16
    const-string/jumbo v0, "resendmediaview"

    iput-object v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->RESEND_VIEW:Ljava/lang/String;

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->ID_COLUMN:I

    .line 20
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->MESSAGEID_COLUMN:I

    .line 21
    const/4 v0, 0x2

    iput v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->RECIPIENT_COLUMN:I

    .line 22
    const/4 v0, 0x3

    iput v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->LOCALFILEPATH_COLUMN:I

    .line 23
    const/4 v0, 0x4

    iput v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->MESSAGETYPE_COLUMN:I

    .line 24
    const/4 v0, 0x5

    iput v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->CHATID_COLUMN:I

    .line 26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 30
    iput-object p1, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->context:Landroid/content/Context;

    .line 31
    return-void
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/ResendMessage;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/ResendMessage;

    .prologue
    .line 91
    return-void
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 13
    check-cast p1, Lcom/pccw/database/entity/ResendMessage;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->add(Lcom/pccw/database/entity/ResendMessage;)V

    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 42
    return-void
.end method

.method public deleteRecordInQueue(I)Z
    .locals 8
    .param p1, "messageId"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 67
    new-array v2, v3, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 69
    .local v2, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->open()V

    .line 72
    :try_start_0
    iget-object v5, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v6, "resendqueue"

    const-string/jumbo v7, "MESSAGEID=?"

    invoke-virtual {v5, v6, v7, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 73
    .local v0, "deleteRowCount":I
    if-lez v0, :cond_0

    .line 74
    iget-object v5, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "ResendEntry Delete Success messageId= "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->close()V

    .line 82
    .end local v0    # "deleteRowCount":I
    :goto_0
    return v3

    .line 77
    .restart local v0    # "deleteRowCount":I
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v5, "ResendEntry Delete Failed"

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->close()V

    move v3, v4

    .line 78
    goto :goto_0

    .line 80
    .end local v0    # "deleteRowCount":I
    :catch_0
    move-exception v1

    .line 81
    .local v1, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 84
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->close()V

    move v3, v4

    .line 82
    goto :goto_0

    .line 84
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->close()V

    throw v3
.end method

.method public find(Ljava/lang/String;)Lcom/pccw/database/entity/ResendMessage;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 103
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 13
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/ResendMessage;

    move-result-object v0

    return-object v0
.end method

.method public getLastRecordInQueue()Lcom/pccw/database/entity/ResendMessage;
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 45
    const-string/jumbo v8, "SELECT * FROM resendqueue ORDER BY _id DESC LIMIT 1"

    .line 47
    .local v8, "lastRecordQuery":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->open()V

    .line 50
    :try_start_0
    iget-object v1, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    invoke-virtual {v1, v8, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 51
    .local v7, "lastRecord":Landroid/database/Cursor;
    if-eqz v7, :cond_0

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 52
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 53
    new-instance v0, Lcom/pccw/database/entity/ResendMessage;

    iget v1, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->MESSAGEID_COLUMN:I

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iget v2, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->RECIPIENT_COLUMN:I

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->LOCALFILEPATH_COLUMN:I

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->MESSAGETYPE_COLUMN:I

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->CHATID_COLUMN:I

    invoke-interface {v7, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    invoke-direct/range {v0 .. v5}, Lcom/pccw/database/entity/ResendMessage;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .local v0, "resendMsg":Lcom/pccw/database/entity/ResendMessage;
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->close()V

    .line 60
    .end local v0    # "resendMsg":Lcom/pccw/database/entity/ResendMessage;
    .end local v7    # "lastRecord":Landroid/database/Cursor;
    :goto_0
    return-object v0

    .line 62
    .restart local v7    # "lastRecord":Landroid/database/Cursor;
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->close()V

    move-object v0, v9

    .line 56
    goto :goto_0

    .line 58
    .end local v7    # "lastRecord":Landroid/database/Cursor;
    :catch_0
    move-exception v6

    .line 59
    .local v6, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->close()V

    move-object v0, v9

    .line 60
    goto :goto_0

    .line 62
    .end local v6    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->close()V

    throw v1
.end method

.method public list()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/ResendMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 96
    const/4 v0, 0x0

    return-object v0
.end method

.method public open()V
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/ResendPerformDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 37
    return-void
.end method

.method public remove(Lcom/pccw/database/entity/ResendMessage;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/ResendMessage;

    .prologue
    .line 118
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 13
    check-cast p1, Lcom/pccw/database/entity/ResendMessage;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->remove(Lcom/pccw/database/entity/ResendMessage;)V

    return-void
.end method

.method public update(Lcom/pccw/database/entity/ResendMessage;)I
    .locals 1
    .param p1, "entity"    # Lcom/pccw/database/entity/ResendMessage;

    .prologue
    .line 110
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 13
    check-cast p1, Lcom/pccw/database/entity/ResendMessage;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/ResendPerformDAOImpl;->update(Lcom/pccw/database/entity/ResendMessage;)I

    move-result v0

    return v0
.end method
