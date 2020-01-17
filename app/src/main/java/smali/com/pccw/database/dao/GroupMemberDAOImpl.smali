.class public Lcom/pccw/database/dao/GroupMemberDAOImpl;
.super Ljava/lang/Object;
.source "GroupMemberDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/GroupMember;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field protected static userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;


# instance fields
.field protected GROUPMEMBER_TABLE_COLUMNS:[Ljava/lang/String;

.field public LOG_TAG:Ljava/lang/String;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string/jumbo v0, "GroupMemberDAOImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 24
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 28
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "GROUPID"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "MEMBERID"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "MEMBERUSERNAME"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->GROUPMEMBER_TABLE_COLUMNS:[Ljava/lang/String;

    .line 31
    iput-object p1, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->mContext:Landroid/content/Context;

    .line 32
    new-instance v0, Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    .line 33
    return-void
.end method

.method private getPhoneNumberLookUpKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "memberUserName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v8, 0x2

    .line 223
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .local v7, "lookUpKey":Ljava/lang/StringBuilder;
    iget-object v0, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->URI:Landroid/net/Uri;

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v5, "data1"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 226
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 227
    const-string/jumbo v0, " ("

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_2

    .line 229
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    :cond_0
    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 233
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, ", \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 237
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 238
    const-string/jumbo v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/GroupMember;)V
    .locals 6
    .param p1, "entity"    # Lcom/pccw/database/entity/GroupMember;

    .prologue
    .line 130
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 131
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v3, "GROUPID"

    invoke-virtual {p1}, Lcom/pccw/database/entity/GroupMember;->getGroupId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    const-string/jumbo v3, "MEMBERUSERNAME"

    invoke-virtual {p1}, Lcom/pccw/database/entity/GroupMember;->getMemberUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->open()V

    .line 136
    iget-object v3, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "groupmember"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 137
    .local v0, "groupMemberId":J
    iget-object v3, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "GroupMemberDAOImpl, add, added ID="

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

    .line 142
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    .line 144
    .end local v0    # "groupMemberId":J
    :goto_0
    return-void

    .line 139
    :catch_0
    move-exception v3

    .line 142
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    throw v3
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 20
    check-cast p1, Lcom/pccw/database/entity/GroupMember;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->add(Lcom/pccw/database/entity/GroupMember;)V

    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 154
    return-void
.end method

.method public find(Ljava/lang/Integer;)Lcom/pccw/database/entity/GroupMember;
    .locals 1
    .param p1, "key"    # Ljava/lang/Integer;

    .prologue
    .line 44
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 20
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->find(Ljava/lang/Integer;)Lcom/pccw/database/entity/GroupMember;

    move-result-object v0

    return-object v0
.end method

.method public getGroupMemberByGroupId(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 8
    .param p1, "groupId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/GroupMember;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    iget-object v5, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "GroupMemberDAOImpl, querying group members for group Id: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v3, "groupMemberList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/GroupMember;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "SELECT MEMBERID , GROUPID ,MEMBERUSERNAME FROM groupmember WHERE GROUPID=\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 55
    .local v4, "query":Ljava/lang/String;
    iget-object v5, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "GroupMemberDAOImpl, query="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->open()V

    .line 59
    iget-object v5, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 60
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 62
    iget-object v5, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "GroupMemberDAOImpl, count="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_0

    .line 66
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->parseGroupMember(Landroid/database/Cursor;)Lcom/pccw/database/entity/GroupMember;

    move-result-object v2

    .line 67
    .local v2, "groupMember":Lcom/pccw/database/entity/GroupMember;
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .end local v2    # "groupMember":Lcom/pccw/database/entity/GroupMember;
    :goto_1
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 76
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 77
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v5, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "GroupMemberDAOImpl, exception="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 79
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    .line 81
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v3

    .line 69
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v1

    .line 70
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v5, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "GroupMemberDAOImpl, fail : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 79
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    throw v5

    .line 75
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 79
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    goto :goto_2
.end method

.method public list()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/GroupMember;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, 0x0

    return-object v0
.end method

.method public open()V
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 149
    return-void
.end method

.method protected parseGroupMember(Landroid/database/Cursor;)Lcom/pccw/database/entity/GroupMember;
    .locals 25
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 160
    const/16 v16, 0x0

    .line 161
    .local v16, "isChecked":Z
    const/4 v15, 0x0

    .line 162
    .local v15, "groupMember":Lcom/pccw/database/entity/GroupMember;
    const/4 v3, 0x3

    new-array v9, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "_id"

    aput-object v4, v9, v3

    const/4 v3, 0x1

    const-string/jumbo v4, "data1"

    aput-object v4, v9, v3

    const/4 v3, 0x2

    const-string/jumbo v4, "lookup"

    aput-object v4, v9, v3

    .line 165
    .local v9, "PROJECTION":[Ljava/lang/String;
    const-string/jumbo v3, "MEMBERID"

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    .line 166
    .local v18, "memberId":I
    const-string/jumbo v3, "GROUPID"

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 167
    .local v14, "groupId":Ljava/lang/String;
    const-string/jumbo v3, "MEMBERUSERNAME"

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 168
    .local v19, "memberUserName":Ljava/lang/String;
    const/16 v23, 0x0

    .line 169
    .local v23, "profileImagePath":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 170
    .local v20, "nickName":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->getPhoneNumberLookUpKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 171
    .local v17, "lookUpKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ;groupId="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ;memberUserName"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    sget-object v3, Lcom/pccw/database/dao/GroupMemberDAOImpl;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v24

    .line 175
    .local v24, "userInfo":Lcom/pccw/database/entity/UserInfo;
    if-eqz v24, :cond_0

    .line 177
    invoke-virtual/range {v24 .. v24}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v23

    .line 180
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v5, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "lookup IN "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const-string/jumbo v8, "display_name"

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 181
    .local v10, "contactCursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 182
    :cond_1
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_6

    if-nez v16, :cond_6

    .line 183
    const/4 v3, 0x0

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 184
    .local v11, "contactId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v6, "contact_id = ?"

    const/4 v5, 0x1

    new-array v7, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v11, v7, v5

    const/4 v8, 0x0

    move-object v5, v9

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v22

    .line 186
    .local v22, "numCursor":Landroid/database/Cursor;
    if-eqz v22, :cond_1

    .line 190
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToFirst()Z

    .line 191
    :goto_1
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_5

    .line 192
    const-string/jumbo v3, "data1"

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 193
    .local v21, "normNumber":Ljava/lang/String;
    if-eqz v21, :cond_3

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 196
    const/4 v3, 0x1

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 197
    .local v13, "displayName":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    if-eqz v13, :cond_2

    .line 198
    move-object/from16 v20, v13

    .line 199
    const/16 v16, 0x1

    .line 202
    :cond_2
    const/4 v3, 0x2

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    const-string/jumbo v12, ""

    .line 203
    .local v12, "contactProfileImagePath":Ljava/lang/String;
    :goto_2
    const-string/jumbo v3, ""

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    if-eqz v12, :cond_3

    .line 204
    move-object/from16 v23, v12

    .line 209
    .end local v12    # "contactProfileImagePath":Ljava/lang/String;
    .end local v13    # "displayName":Ljava/lang/String;
    :cond_3
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 202
    .restart local v13    # "displayName":Ljava/lang/String;
    :cond_4
    const/4 v3, 0x2

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    goto :goto_2

    .line 211
    .end local v13    # "displayName":Ljava/lang/String;
    .end local v21    # "normNumber":Ljava/lang/String;
    :cond_5
    invoke-interface/range {v22 .. v22}, Landroid/database/Cursor;->close()V

    .line 212
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 214
    .end local v11    # "contactId":Ljava/lang/String;
    .end local v22    # "numCursor":Landroid/database/Cursor;
    :cond_6
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 216
    new-instance v15, Lcom/pccw/database/entity/GroupMember;

    .end local v15    # "groupMember":Lcom/pccw/database/entity/GroupMember;
    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v23

    invoke-direct {v15, v14, v0, v1, v2}, Lcom/pccw/database/entity/GroupMember;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    .restart local v15    # "groupMember":Lcom/pccw/database/entity/GroupMember;
    move/from16 v0, v18

    invoke-virtual {v15, v0}, Lcom/pccw/database/entity/GroupMember;->setMemberId(I)V

    .line 219
    return-object v15
.end method

.method public remove(Lcom/pccw/database/entity/GroupMember;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/GroupMember;

    .prologue
    .line 95
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 20
    check-cast p1, Lcom/pccw/database/entity/GroupMember;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->remove(Lcom/pccw/database/entity/GroupMember;)V

    return-void
.end method

.method public removeByGroupId(Ljava/lang/String;)V
    .locals 8
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 100
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->open()V

    .line 101
    iget-object v2, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v3, "groupmember"

    const-string/jumbo v4, "GROUPID=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 102
    .local v1, "row":I
    iget-object v2, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "GroupMemberDAOImpl, remove, removed number of row="

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

    .line 108
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    .line 111
    .end local v1    # "row":I
    :goto_0
    return-void

    .line 104
    :catch_0
    move-exception v0

    .line 105
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v2, p0, Lcom/pccw/database/dao/GroupMemberDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "GroupMemberDAOImpl, remove, exception="

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

    .line 108
    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->close()V

    throw v2
.end method

.method public update(Lcom/pccw/database/entity/GroupMember;)I
    .locals 1
    .param p1, "entity"    # Lcom/pccw/database/entity/GroupMember;

    .prologue
    .line 88
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 20
    check-cast p1, Lcom/pccw/database/entity/GroupMember;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/GroupMemberDAOImpl;->update(Lcom/pccw/database/entity/GroupMember;)I

    move-result v0

    return v0
.end method
