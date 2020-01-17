.class public Lcom/pccw/sms/service/ConversationParticipantItemService;
.super Ljava/lang/Object;
.source "ConversationParticipantItemService.java"


# static fields
.field private static CONTACT_IMAGE:Ljava/lang/String;

.field private static CONTACT_NAME:Ljava/lang/String;

.field private static LOG_TAG:Ljava/lang/String;

.field private static PROJECTION:[Ljava/lang/String;

.field protected static userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;


# instance fields
.field protected context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 22
    const-string/jumbo v0, "ConversationParticipantItemService"

    sput-object v0, Lcom/pccw/sms/service/ConversationParticipantItemService;->LOG_TAG:Ljava/lang/String;

    .line 23
    const-string/jumbo v0, "CONTACT_DISPLAY_NAME"

    sput-object v0, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    .line 24
    const-string/jumbo v0, "CONTACT_PROFILE_IMG"

    sput-object v0, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_IMAGE:Ljava/lang/String;

    .line 126
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "data1"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "lookup"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/sms/service/ConversationParticipantItemService;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/pccw/sms/service/ConversationParticipantItemService;->context:Landroid/content/Context;

    .line 31
    new-instance v0, Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-direct {v0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    .line 32
    return-void
.end method

.method private getContactDisplayNameAndImage(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 18
    .param p1, "userName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 221
    const/4 v12, 0x0

    .line 222
    .local v12, "isChecked":Z
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 223
    .local v9, "contactInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v14, 0x0

    .line 224
    .local v14, "nickname":Ljava/lang/String;
    const/16 v17, 0x0

    .line 225
    .local v17, "profileImagePath":Ljava/lang/String;
    invoke-direct/range {p0 .. p1}, Lcom/pccw/sms/service/ConversationParticipantItemService;->getPhoneNumberLookUpKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 227
    .local v13, "lookUpKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/sms/service/ConversationParticipantItemService;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "lookup IN "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const-string/jumbo v6, "display_name"

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 228
    .local v7, "contactCursor":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 229
    :cond_0
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_5

    if-nez v12, :cond_5

    .line 230
    const/4 v1, 0x0

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 231
    .local v8, "contactId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/sms/service/ConversationParticipantItemService;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/sms/service/ConversationParticipantItemService;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v4, "contact_id = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v8, v5, v6

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v16

    .line 232
    .local v16, "numCursor":Landroid/database/Cursor;
    if-eqz v16, :cond_0

    .line 235
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->moveToFirst()Z

    .line 236
    :goto_1
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_4

    .line 237
    const-string/jumbo v1, "data1"

    move-object/from16 v0, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    move-object/from16 v0, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 238
    .local v15, "normNumber":Ljava/lang/String;
    if-eqz v15, :cond_2

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 241
    const/4 v1, 0x1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 242
    .local v11, "displayName":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v11, :cond_1

    .line 243
    move-object v14, v11

    .line 244
    const/4 v12, 0x1

    .line 247
    :cond_1
    const/4 v1, 0x2

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    const-string/jumbo v10, ""

    .line 248
    .local v10, "contactProfileImagePath":Ljava/lang/String;
    :goto_2
    const-string/jumbo v1, ""

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    if-eqz v10, :cond_2

    .line 249
    move-object/from16 v17, v10

    .line 252
    .end local v10    # "contactProfileImagePath":Ljava/lang/String;
    .end local v11    # "displayName":Ljava/lang/String;
    :cond_2
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 247
    .restart local v11    # "displayName":Ljava/lang/String;
    :cond_3
    const/4 v1, 0x2

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    goto :goto_2

    .line 254
    .end local v11    # "displayName":Ljava/lang/String;
    .end local v15    # "normNumber":Ljava/lang/String;
    :cond_4
    invoke-interface/range {v16 .. v16}, Landroid/database/Cursor;->close()V

    .line 255
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 257
    .end local v8    # "contactId":Ljava/lang/String;
    .end local v16    # "numCursor":Landroid/database/Cursor;
    :cond_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 259
    sget-object v1, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v9, v1, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    sget-object v1, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_IMAGE:Ljava/lang/String;

    move-object/from16 v0, v17

    invoke-virtual {v9, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    return-object v9
.end method

.method public static getConversationParticipantItemByMsisdn(Ljava/lang/String;)Lcom/pccw/sms/bean/ConversationParticipantItem;
    .locals 5
    .param p0, "msisdn"    # Ljava/lang/String;

    .prologue
    .line 71
    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v4, p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v3

    .line 72
    .local v3, "userInfo":Lcom/pccw/database/entity/UserInfo;
    if-eqz v3, :cond_0

    .line 74
    invoke-virtual {v3}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, "nickName":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v2

    .line 77
    .local v2, "profileImagePath":Ljava/lang/String;
    new-instance v0, Lcom/pccw/sms/bean/ConversationParticipantItem;

    invoke-direct {v0, p0, v1, v2}, Lcom/pccw/sms/bean/ConversationParticipantItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .end local v1    # "nickName":Ljava/lang/String;
    .end local v2    # "profileImagePath":Ljava/lang/String;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getPhoneNumberLookUpKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p1, "memberUserName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v8, 0x2

    .line 266
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .local v7, "lookUpKey":Ljava/lang/StringBuilder;
    iget-object v0, p0, Lcom/pccw/sms/service/ConversationParticipantItemService;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->URI:Landroid/net/Uri;

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v5, "data1"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 269
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 270
    const-string/jumbo v0, " ("

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_2

    .line 272
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 273
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 274
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

    .line 278
    :cond_0
    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 276
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

    .line 280
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 281
    const-string/jumbo v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isIMUser(Ljava/lang/String;)Z
    .locals 4
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 104
    sget-object v1, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v1, p0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v0

    .line 105
    .local v0, "userInfo":Lcom/pccw/database/entity/UserInfo;
    sget-object v1, Lcom/pccw/sms/service/ConversationParticipantItemService;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "check the record in UserInfo : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    if-eqz v0, :cond_0

    .line 108
    const/4 v1, 0x1

    .line 110
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addConversationParticipant(Lcom/pccw/sms/bean/ConversationParticipantItem;)V
    .locals 7
    .param p1, "item"    # Lcom/pccw/sms/bean/ConversationParticipantItem;

    .prologue
    .line 36
    if-eqz p1, :cond_0

    .line 38
    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "userId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lcom/pccw/sms/bean/ConversationParticipantItem;->getUserId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    invoke-virtual {p1}, Lcom/pccw/sms/bean/ConversationParticipantItem;->getUserId()Ljava/lang/String;

    move-result-object v3

    .line 40
    .local v3, "userName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/pccw/sms/bean/ConversationParticipantItem;->getNickName()Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "nickName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/pccw/sms/bean/ConversationParticipantItem;->getProfileImagePath()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "photo":Ljava/lang/String;
    new-instance v2, Lcom/pccw/database/entity/UserInfo;

    invoke-direct {v2, v3, v0, v1}, Lcom/pccw/database/entity/UserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .local v2, "userInfo":Lcom/pccw/database/entity/UserInfo;
    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v4, v2}, Lcom/pccw/database/dao/UserInfoDAOImpl;->add(Lcom/pccw/database/entity/UserInfo;)V

    .line 46
    .end local v0    # "nickName":Ljava/lang/String;
    .end local v1    # "photo":Ljava/lang/String;
    .end local v2    # "userInfo":Lcom/pccw/database/entity/UserInfo;
    .end local v3    # "userName":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public getAddGroupParticipantItem(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 6
    .param p1, "groupID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/sms/bean/ConversationParticipantItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 132
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .local v1, "participantList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/ConversationParticipantItem;>;"
    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v4, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->listIMUsersNotInGroup(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 134
    .local v3, "userInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/UserInfo;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/pccw/database/entity/UserInfo;

    .line 135
    .local v2, "userInfo":Lcom/pccw/database/entity/UserInfo;
    invoke-virtual {p0, v2}, Lcom/pccw/sms/service/ConversationParticipantItemService;->getGroupParticipantItemContactDetail(Lcom/pccw/database/entity/UserInfo;)Lcom/pccw/sms/bean/ConversationParticipantItem;

    move-result-object v0

    .line 136
    .local v0, "conversationParticipantItem":Lcom/pccw/sms/bean/ConversationParticipantItem;
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 138
    .end local v0    # "conversationParticipantItem":Lcom/pccw/sms/bean/ConversationParticipantItem;
    .end local v2    # "userInfo":Lcom/pccw/database/entity/UserInfo;
    :cond_0
    return-object v1
.end method

.method public getContactWithIMParticipantItem(Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 19
    .param p1, "lookUpKey"    # Ljava/lang/String;
    .param p3, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/sms/bean/ConversationParticipantItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 287
    .local p2, "iMNumberList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .local v16, "participantList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/ConversationParticipantItem;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 291
    .local v8, "addedNum":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual/range {p3 .. p3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v4, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "lookup IN "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const-string/jumbo v7, "display_name"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 292
    .local v11, "cursor":Landroid/database/Cursor;
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 293
    :cond_0
    :goto_0
    invoke-interface {v11}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_4

    .line 294
    const/4 v2, 0x0

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 296
    .local v9, "contactId":Ljava/lang/String;
    invoke-virtual/range {p3 .. p3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v5, "contact_id = ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v9, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 297
    .local v14, "numCursor":Landroid/database/Cursor;
    if-eqz v14, :cond_0

    .line 300
    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z

    .line 302
    :goto_1
    invoke-interface {v14}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_3

    .line 303
    const-string/jumbo v2, "data1"

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 305
    .local v13, "normNumber":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 306
    const-string/jumbo v2, "data1"

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 307
    .local v15, "oriNumber":Ljava/lang/String;
    move-object/from16 v18, v15

    .line 308
    .local v18, "userName":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 309
    .local v12, "nickName":Ljava/lang/String;
    const/4 v2, 0x2

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_2

    const-string/jumbo v17, ""

    .line 311
    .local v17, "profileImagePath":Ljava/lang/String;
    :goto_2
    new-instance v10, Lcom/pccw/sms/bean/ConversationParticipantItem;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v10, v0, v12, v1}, Lcom/pccw/sms/bean/ConversationParticipantItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    .local v10, "conversationParticipantItem":Lcom/pccw/sms/bean/ConversationParticipantItem;
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    invoke-virtual {v8, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 315
    .end local v10    # "conversationParticipantItem":Lcom/pccw/sms/bean/ConversationParticipantItem;
    .end local v12    # "nickName":Ljava/lang/String;
    .end local v15    # "oriNumber":Ljava/lang/String;
    .end local v17    # "profileImagePath":Ljava/lang/String;
    .end local v18    # "userName":Ljava/lang/String;
    :cond_1
    invoke-interface {v14}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 309
    .restart local v12    # "nickName":Ljava/lang/String;
    .restart local v15    # "oriNumber":Ljava/lang/String;
    .restart local v18    # "userName":Ljava/lang/String;
    :cond_2
    const/4 v2, 0x2

    invoke-interface {v11, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    goto :goto_2

    .line 318
    .end local v12    # "nickName":Ljava/lang/String;
    .end local v13    # "normNumber":Ljava/lang/String;
    .end local v15    # "oriNumber":Ljava/lang/String;
    .end local v18    # "userName":Ljava/lang/String;
    :cond_3
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 319
    invoke-interface {v11}, Landroid/database/Cursor;->moveToNext()Z

    goto/16 :goto_0

    .line 321
    .end local v9    # "contactId":Ljava/lang/String;
    .end local v14    # "numCursor":Landroid/database/Cursor;
    :cond_4
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 324
    return-object v16
.end method

.method public getConversationParticipantItem()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/sms/bean/ConversationParticipantItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 50
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .local v3, "participantList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/ConversationParticipantItem;>;"
    iget-object v8, p0, Lcom/pccw/sms/service/ConversationParticipantItemService;->context:Landroid/content/Context;

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 54
    .local v2, "owner":Ljava/lang/String;
    sget-object v8, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v8, v2}, Lcom/pccw/database/dao/UserInfoDAOImpl;->listUserInfoWithoutOwner(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 55
    .local v6, "userInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/database/entity/UserInfo;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/pccw/database/entity/UserInfo;

    .line 57
    .local v5, "userInfo":Lcom/pccw/database/entity/UserInfo;
    invoke-virtual {v5}, Lcom/pccw/database/entity/UserInfo;->getUserName()Ljava/lang/String;

    move-result-object v7

    .line 58
    .local v7, "userName":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v1

    .line 59
    .local v1, "nickName":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v4

    .line 61
    .local v4, "profileImagePath":Ljava/lang/String;
    new-instance v0, Lcom/pccw/sms/bean/ConversationParticipantItem;

    invoke-direct {v0, v7, v1, v4}, Lcom/pccw/sms/bean/ConversationParticipantItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .local v0, "conversationParticipantItem":Lcom/pccw/sms/bean/ConversationParticipantItem;
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 65
    .end local v0    # "conversationParticipantItem":Lcom/pccw/sms/bean/ConversationParticipantItem;
    .end local v1    # "nickName":Ljava/lang/String;
    .end local v4    # "profileImagePath":Ljava/lang/String;
    .end local v5    # "userInfo":Lcom/pccw/database/entity/UserInfo;
    .end local v7    # "userName":Ljava/lang/String;
    :cond_0
    return-object v3
.end method

.method public getGroupMemberViaContact(Ljava/lang/String;Ljava/lang/String;)Lcom/pccw/database/entity/GroupMember;
    .locals 7
    .param p1, "participantGroupID"    # Ljava/lang/String;
    .param p2, "participantIMID"    # Ljava/lang/String;

    .prologue
    .line 191
    invoke-direct {p0, p2}, Lcom/pccw/sms/service/ConversationParticipantItemService;->getContactDisplayNameAndImage(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 192
    .local v0, "contactInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {p2}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 193
    .local v1, "nickName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 195
    .local v2, "profileImagePath":Ljava/lang/String;
    new-instance v3, Lcom/pccw/sms/service/ProfileService;

    iget-object v5, p0, Lcom/pccw/sms/service/ConversationParticipantItemService;->context:Landroid/content/Context;

    invoke-direct {v3, v5}, Lcom/pccw/sms/service/ProfileService;-><init>(Landroid/content/Context;)V

    .line 196
    .local v3, "profileService":Lcom/pccw/sms/service/ProfileService;
    invoke-virtual {v3, p2}, Lcom/pccw/sms/service/ProfileService;->getProfile(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v4

    .line 197
    .local v4, "userInfo":Lcom/pccw/database/entity/UserInfo;
    if-eqz v4, :cond_0

    .line 200
    invoke-virtual {v4}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v2

    .line 203
    :cond_0
    if-eqz v0, :cond_2

    .line 205
    sget-object v5, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_1

    const-string/jumbo v5, ""

    sget-object v6, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 207
    sget-object v5, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "nickName":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 209
    .restart local v1    # "nickName":Ljava/lang/String;
    :cond_1
    sget-object v5, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_IMAGE:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_2

    const-string/jumbo v5, ""

    sget-object v6, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_IMAGE:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 211
    sget-object v5, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_IMAGE:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "profileImagePath":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 214
    .restart local v2    # "profileImagePath":Ljava/lang/String;
    :cond_2
    new-instance v5, Lcom/pccw/database/entity/GroupMember;

    invoke-direct {v5, p1, p2, v1, v2}, Lcom/pccw/database/entity/GroupMember;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v5
.end method

.method public getGroupParticipantItemContactDetail(Lcom/pccw/database/entity/UserInfo;)Lcom/pccw/sms/bean/ConversationParticipantItem;
    .locals 6
    .param p1, "userInfo"    # Lcom/pccw/database/entity/UserInfo;

    .prologue
    .line 146
    const/4 v3, 0x0

    .line 147
    .local v3, "userName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 148
    .local v1, "nickname":Ljava/lang/String;
    const/4 v2, 0x0

    .line 150
    .local v2, "profileImagePath":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 151
    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getUserName()Ljava/lang/String;

    move-result-object v3

    .line 152
    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getNickName()Ljava/lang/String;

    move-result-object v1

    .line 153
    invoke-virtual {p1}, Lcom/pccw/database/entity/UserInfo;->getPhoto()Ljava/lang/String;

    move-result-object v2

    .line 156
    :cond_0
    invoke-direct {p0, v3}, Lcom/pccw/sms/service/ConversationParticipantItemService;->getContactDisplayNameAndImage(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 158
    .local v0, "contactInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    const-string/jumbo v4, ""

    sget-object v5, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 159
    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "nickname":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 161
    .restart local v1    # "nickname":Ljava/lang/String;
    :cond_1
    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_IMAGE:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2

    const-string/jumbo v4, ""

    sget-object v5, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_IMAGE:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 162
    sget-object v4, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_IMAGE:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "profileImagePath":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 164
    .restart local v2    # "profileImagePath":Ljava/lang/String;
    :cond_2
    new-instance v4, Lcom/pccw/sms/bean/ConversationParticipantItem;

    invoke-direct {v4, v3, v1, v2}, Lcom/pccw/sms/bean/ConversationParticipantItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v4
.end method

.method public getGroupParticipantName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "participantId"    # Ljava/lang/String;

    .prologue
    .line 171
    invoke-direct {p0, p1}, Lcom/pccw/sms/service/ConversationParticipantItemService;->getContactDisplayNameAndImage(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    .line 172
    .local v0, "contactInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v1, ""

    sget-object v2, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 173
    sget-object v1, Lcom/pccw/sms/service/ConversationParticipantItemService;->CONTACT_NAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 183
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p1}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public isDuplicatedUsername(Ljava/lang/String;)Z
    .locals 4
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 89
    sget-object v1, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v1, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->find(Ljava/lang/String;)Lcom/pccw/database/entity/UserInfo;

    move-result-object v0

    .line 90
    .local v0, "userInfo":Lcom/pccw/database/entity/UserInfo;
    sget-object v1, Lcom/pccw/sms/service/ConversationParticipantItemService;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "check the record in UserInfo : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    if-eqz v0, :cond_0

    .line 93
    const/4 v1, 0x1

    .line 95
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public listIMNumber()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    iget-object v2, p0, Lcom/pccw/sms/service/ConversationParticipantItemService;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "ownerMsisdn":Ljava/lang/String;
    move-object v0, v1

    .line 119
    .local v0, "owner":Ljava/lang/String;
    sget-object v2, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v2, v0}, Lcom/pccw/database/dao/UserInfoDAOImpl;->listIMNumberWithoutOwner(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    return-object v2
.end method

.method public updateUserInfo(Lcom/pccw/database/entity/UserInfo;)V
    .locals 1
    .param p1, "userInfo"    # Lcom/pccw/database/entity/UserInfo;

    .prologue
    .line 123
    sget-object v0, Lcom/pccw/sms/service/ConversationParticipantItemService;->userInfoImpl:Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-virtual {v0, p1}, Lcom/pccw/database/dao/UserInfoDAOImpl;->update(Lcom/pccw/database/entity/UserInfo;)I

    .line 124
    return-void
.end method
