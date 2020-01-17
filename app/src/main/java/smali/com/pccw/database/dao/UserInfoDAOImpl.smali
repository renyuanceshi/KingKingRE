.class public Lcom/pccw/database/dao/UserInfoDAOImpl;
.super Ljava/lang/Object;
.source "UserInfoDAOImpl.java"

# interfaces
.implements Lcom/pccw/database/dao/GenericDAO;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/pccw/database/dao/GenericDAO",
        "<",
        "Lcom/pccw/database/entity/UserInfo;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public LOG_TAG:Ljava/lang/String;

.field protected USERINFO_TABLE_COLUMNS:[Ljava/lang/String;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const-string/jumbo v0, "UserInfoImpl"

    iput-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 35
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "NICKNAME"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "USERNAME"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "PHOTO"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->USERINFO_TABLE_COLUMNS:[Ljava/lang/String;

    .line 38
    iput-object p1, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->mContext:Landroid/content/Context;

    .line 39
    return-void
.end method


# virtual methods
.method public add(Lcom/pccw/database/entity/UserInfo;)V
    .locals 6
    .param p1, "entity"    # Lcom/pccw/database/entity/UserInfo;

    .prologue
    .line 299
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 302
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v4, "NICKNAME"

    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    const-string/jumbo v3, ""

    :goto_0
    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    const-string/jumbo v3, "USERNAME"

    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 304
    const-string/jumbo v3, "PHOTO"

    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->open()V

    .line 308
    iget-object v3, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "userinfo"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 309
    .local v0, "modelId":J
    iget-object v3, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "UserInfoImpl, add, added ID="

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

    .line 314
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    .line 317
    .end local v0    # "modelId":J
    :goto_1
    return-void

    .line 302
    :cond_0
    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 311
    :catch_0
    move-exception v3

    .line 314
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    goto :goto_1

    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    throw v3
.end method

.method public bridge synthetic add(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lcom/pccw/database/entity/UserInfo;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->add(Lcom/pccw/database/entity/UserInfo;)V

    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 327
    return-void
.end method

.method public find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;
    .locals 11
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "UserInfoImpl, find, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    const/4 v10, 0x0

    .line 240
    .local v10, "userInfo":Lcom/pccw/database/entity/UserInfo;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->open()V

    .line 241
    if-eqz p1, :cond_1

    .line 242
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "userinfo"

    iget-object v2, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->USERINFO_TABLE_COLUMNS:[Ljava/lang/String;

    const-string/jumbo v3, "USERNAME=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 244
    .local v8, "cursor":Landroid/database/Cursor;
    if-eqz v8, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-eqz v0, :cond_0

    .line 245
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    :try_start_1
    invoke-virtual {p0, v8}, Lcom/pccw/database/dao/UserInfoDAOImpl;->parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/UserInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v10

    .line 252
    :goto_0
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 260
    .end local v8    # "cursor":Landroid/database/Cursor;
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    .line 262
    :goto_2
    return-object v10

    .line 249
    .restart local v8    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v9

    .line 250
    .local v9, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "UserInfoImpl, find, exception="

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

    .line 257
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v9    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v9

    .line 258
    .restart local v9    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "UserInfoImpl, find, exception="

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

    .line 260
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    goto :goto_2

    .line 255
    .end local v9    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_5
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "UserInfoImpl, find, key is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 260
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    throw v0
.end method

.method public bridge synthetic find(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 19
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v0

    return-object v0
.end method

.method public findOwnerProfile(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 174
    const/4 v1, 0x0

    .line 175
    .local v1, "nickName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 176
    .local v2, "profileImagePath":Ljava/lang/String;
    const/4 v0, 0x0

    .line 178
    .local v0, "memberUserName":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v3

    .line 179
    .local v3, "userInfo":Lcom/pccw/database/entity/UserInfo;
    if-eqz v3, :cond_0

    .line 180
    invoke-virtual {v3}, Lcom/pccw/database/entity/UserInfo;->getUserName()Ljava/lang/String;

    move-result-object v0

    .line 181
    invoke-virtual {v3}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v1

    .line 182
    invoke-virtual {v3}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v2

    .line 185
    :cond_0
    new-instance v4, Lcom/pccw/database/entity/UserInfo;

    invoke-direct {v4, v0, v1, v2}, Lcom/pccw/database/entity/UserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v4
.end method

.method public findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;
    .locals 21
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 189
    const/4 v14, 0x0

    .line 190
    .local v14, "isChecked":Z
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

    .line 193
    .local v9, "PROJECTION":[Ljava/lang/String;
    const/16 v20, 0x0

    .line 194
    .local v20, "profileImagePath":Ljava/lang/String;
    move-object/from16 v16, p1

    .line 195
    .local v16, "memberUserName":Ljava/lang/String;
    const/16 v17, 0x0

    .line 196
    .local v17, "nickName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/database/dao/UserInfoDAOImpl;->mContext:Landroid/content/Context;

    move-object/from16 v0, p1

    invoke-static {v3, v0}, Lcom/pccw/sms/bean/SMSConstants;->getPhoneNumberLookUpKey(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 199
    .local v15, "lookUpKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/database/dao/UserInfoDAOImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v5, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "lookup IN "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const-string/jumbo v8, "display_name"

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 200
    .local v10, "contactCursor":Landroid/database/Cursor;
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 201
    :cond_0
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_5

    .line 202
    const/4 v3, 0x0

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 203
    .local v11, "contactId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/pccw/database/dao/UserInfoDAOImpl;->mContext:Landroid/content/Context;

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

    move-result-object v19

    .line 205
    .local v19, "numCursor":Landroid/database/Cursor;
    if-eqz v19, :cond_0

    .line 209
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->moveToFirst()Z

    .line 210
    :goto_1
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_4

    if-nez v14, :cond_4

    .line 211
    const-string/jumbo v3, "data1"

    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, v19

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 212
    .local v18, "normNumber":Ljava/lang/String;
    if-eqz v18, :cond_2

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 214
    const/4 v3, 0x1

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 215
    .local v13, "displayName":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz v13, :cond_1

    .line 216
    move-object/from16 v17, v13

    .line 217
    const/4 v14, 0x1

    .line 220
    :cond_1
    const/4 v3, 0x2

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    const-string/jumbo v12, ""

    .line 221
    .local v12, "contactProfileImagePath":Ljava/lang/String;
    :goto_2
    const-string/jumbo v3, ""

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    if-eqz v12, :cond_2

    .line 222
    move-object/from16 v20, v12

    .line 225
    .end local v12    # "contactProfileImagePath":Ljava/lang/String;
    .end local v13    # "displayName":Ljava/lang/String;
    :cond_2
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 220
    .restart local v13    # "displayName":Ljava/lang/String;
    :cond_3
    const/4 v3, 0x2

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    goto :goto_2

    .line 227
    .end local v13    # "displayName":Ljava/lang/String;
    .end local v18    # "normNumber":Ljava/lang/String;
    :cond_4
    invoke-interface/range {v19 .. v19}, Landroid/database/Cursor;->close()V

    .line 228
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 230
    .end local v11    # "contactId":Ljava/lang/String;
    .end local v19    # "numCursor":Landroid/database/Cursor;
    :cond_5
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 231
    new-instance v3, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v20

    invoke-direct {v3, v0, v1, v2}, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;-><init>(Lcom/pccw/database/dao/UserInfoDAOImpl;Ljava/lang/String;Ljava/lang/String;)V

    return-object v3
.end method

.method public findUserProfile(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;
    .locals 7
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 149
    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v0

    .line 151
    .local v0, "contactDetail":Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;
    const/4 v2, 0x0

    .line 152
    .local v2, "nickName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 153
    .local v3, "profileImagePath":Ljava/lang/String;
    const/4 v1, 0x0

    .line 155
    .local v1, "memberUserName":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v4

    .line 156
    .local v4, "userInfo":Lcom/pccw/database/entity/UserInfo;
    if-eqz v4, :cond_0

    .line 157
    invoke-virtual {v4}, Lcom/pccw/database/entity/UserInfo;->getUserName()Ljava/lang/String;

    move-result-object v1

    .line 158
    invoke-virtual {v4}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v2

    .line 159
    invoke-virtual {v4}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v3

    .line 162
    :cond_0
    const-string/jumbo v5, ""

    iget-object v6, v0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    iget-object v5, v0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 164
    iget-object v2, v0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    .line 165
    :cond_1
    const-string/jumbo v5, ""

    iget-object v6, v0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->profilePicPath:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, v0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->profilePicPath:Ljava/lang/String;

    if-eqz v5, :cond_2

    .line 167
    iget-object v3, v0, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->profilePicPath:Ljava/lang/String;

    .line 169
    :cond_2
    new-instance v5, Lcom/pccw/database/entity/UserInfo;

    invoke-direct {v5, v1, v2, v3}, Lcom/pccw/database/entity/UserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v5
.end method

.method public list()Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/UserInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "UserInfoImpl, list, starts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 118
    .local v10, "userInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/UserInfo;>;"
    const-string/jumbo v7, "NICKNAME ASC"

    .line 121
    .local v7, "orderBy":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->open()V

    .line 122
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v1, "userinfo"

    iget-object v2, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->USERINFO_TABLE_COLUMNS:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 123
    .local v8, "cursor":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 125
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "UserInfoImpl, list, count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    .line 129
    :try_start_1
    invoke-virtual {p0, v8}, Lcom/pccw/database/dao/UserInfoDAOImpl;->parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    :goto_1
    :try_start_2
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 138
    .end local v8    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v9

    .line 139
    .local v9, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "UserInfoImpl, list, exception="

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
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 141
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    .line 144
    .end local v9    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v10

    .line 130
    .restart local v8    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v9

    .line 131
    .restart local v9    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "list, fail to add exception="

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
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 141
    .end local v8    # "cursor":Landroid/database/Cursor;
    .end local v9    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    throw v0

    .line 136
    .restart local v8    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v8}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 141
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    goto :goto_2
.end method

.method public listIMNumberWithoutOwner(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "owner"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 79
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .local v2, "imNumberList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v3, "SELECT * FROM userinfo where USERNAME != ? order by USERNAME asc"

    .line 86
    .local v3, "query":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->open()V

    .line 88
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v4, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 91
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 93
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 95
    :try_start_1
    const-string/jumbo v4, "USERNAME"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    :goto_1
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 105
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 106
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UserInfoImpl, listIMNumberWithoutOwner, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 108
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    .line 110
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v2

    .line 98
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v1

    .line 99
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

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
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 108
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    throw v4

    .line 104
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 108
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    goto :goto_2
.end method

.method public listIMUsersNotInGroup(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "groupID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/UserInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 344
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 346
    .local v3, "userInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/UserInfo;>;"
    const-string/jumbo v2, "select * from userinfo A LEFT JOIN (select * from groupmember where GROUPID = ?) B ON A.USERNAME = B.MEMBERUSERNAME where B.MEMBERUSERNAME IS NULL"

    .line 349
    .local v2, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UserInfoImpl, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->open()V

    .line 354
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v4, v2, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 355
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 357
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UserInfoImpl, list, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 362
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 367
    :goto_1
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 370
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 371
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UserInfoImpl, findByChatID, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 373
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    .line 375
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v3

    .line 363
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v1

    .line 364
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

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
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 373
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    throw v4

    .line 369
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 373
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    goto :goto_2
.end method

.method public listUserInfoWithoutOwner(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 7
    .param p1, "owner"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/database/entity/UserInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 42
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UserInfoImpl, filter out the owner, "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .local v3, "userInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/UserInfo;>;"
    const-string/jumbo v2, "SELECT * FROM userinfo where USERNAME != ? order by USERNAME asc"

    .line 49
    .local v2, "query":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UserInfoImpl, query="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->open()V

    .line 54
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v4, v2, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 55
    .local v0, "cursor":Landroid/database/Cursor;
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 57
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UserInfoImpl, list, count="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->isAfterLast()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    if-nez v4, :cond_0

    .line 61
    :try_start_1
    invoke-virtual {p0, v0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    :goto_1
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 69
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v1

    .line 70
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "UserInfoImpl, findByChatID, exception="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 72
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    .line 74
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v3

    .line 62
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :catch_1
    move-exception v1

    .line 63
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_4
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

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
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 72
    .end local v0    # "cursor":Landroid/database/Cursor;
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    throw v4

    .line 68
    .restart local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    :try_start_5
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 72
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    goto :goto_2
.end method

.method public open()V
    .locals 1

    .prologue
    .line 321
    iget-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 322
    return-void
.end method

.method protected parseModel(Landroid/database/Cursor;)Lcom/pccw/database/entity/UserInfo;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 331
    iget-object v4, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v5, "UserInfoImpl started"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    const-string/jumbo v4, "USERNAME"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 334
    .local v3, "userName":Ljava/lang/String;
    const-string/jumbo v4, "NICKNAME"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 335
    .local v0, "nickName":Ljava/lang/String;
    const-string/jumbo v4, "PHOTO"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 337
    .local v1, "photo":Ljava/lang/String;
    new-instance v2, Lcom/pccw/database/entity/UserInfo;

    invoke-direct {v2, v3, v0, v1}, Lcom/pccw/database/entity/UserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    .local v2, "userInfo":Lcom/pccw/database/entity/UserInfo;
    return-object v2
.end method

.method public remove(Lcom/pccw/database/entity/UserInfo;)V
    .locals 0
    .param p1, "entity"    # Lcom/pccw/database/entity/UserInfo;

    .prologue
    .line 294
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lcom/pccw/database/entity/UserInfo;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->remove(Lcom/pccw/database/entity/UserInfo;)V

    return-void
.end method

.method public update(Lcom/pccw/database/entity/UserInfo;)I
    .locals 9
    .param p1, "entity"    # Lcom/pccw/database/entity/UserInfo;

    .prologue
    .line 269
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 271
    .local v2, "values":Landroid/content/ContentValues;
    const-string/jumbo v4, "NICKNAME"

    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    const-string/jumbo v3, ""

    :goto_0
    invoke-virtual {v2, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    const-string/jumbo v3, "USERNAME"

    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    const-string/jumbo v3, "PHOTO"

    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    const/4 v1, 0x0

    .line 278
    .local v1, "row":I
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->open()V

    .line 279
    iget-object v3, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->db:Landroid/database/sqlite/SQLiteDatabase;

    const-string/jumbo v4, "userinfo"

    const-string/jumbo v5, "USERNAME=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getUserName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 281
    iget-object v3, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "UserInfoImpl, update, updated number of row="

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

    .line 285
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    .line 288
    :goto_1
    return v1

    .line 271
    .end local v1    # "row":I
    :cond_0
    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 282
    .restart local v1    # "row":I
    :catch_0
    move-exception v0

    .line 283
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    iget-object v3, p0, Lcom/pccw/database/dao/UserInfoDAOImpl;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "UserInfoImpl, update, exception="

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

    .line 285
    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    goto :goto_1

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->close()V

    throw v3
.end method

.method public bridge synthetic update(Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 19
    check-cast p1, Lcom/pccw/database/entity/UserInfo;

    invoke-virtual {p0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->update(Lcom/pccw/database/entity/UserInfo;)I

    move-result v0

    return v0
.end method
