.class public Lcom/pccw/mobile/sms/helper/ContactsHelper;
.super Ljava/lang/Object;
.source "ContactsHelper.java"


# instance fields
.field contactId:I

.field ctx:Landroid/content/Context;

.field phoneNum:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILandroid/content/Context;)V
    .locals 0
    .param p1, "contactId"    # I
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p2, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->ctx:Landroid/content/Context;

    .line 33
    iput p1, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->contactId:I

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1
    .param p1, "phoneNum"    # Ljava/lang/String;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p2, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->ctx:Landroid/content/Context;

    .line 27
    iput-object p1, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->phoneNum:Ljava/lang/String;

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getContactIDFromNumber(Ljava/lang/String;Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->contactId:I

    .line 29
    return-void
.end method

.method private getContactIDFromNumber(Ljava/lang/String;Landroid/content/Context;)I
    .locals 8
    .param p1, "contactNumber"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 37
    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 38
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v7

    .line 39
    .local v7, "phoneContactID":I
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    invoke-static {v1, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, "display_name"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "_id"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 43
    .local v6, "contactLookupCursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    const-string/jumbo v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 46
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 48
    return v7
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 139
    const-string/jumbo v7, ""

    .line 140
    .local v7, "postalData":Ljava/lang/String;
    const-string/jumbo v3, "contact_id = ? AND mimetype = ?"

    .line 141
    .local v3, "addrWhere":Ljava/lang/String;
    const/4 v0, 0x2

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    iget v1, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->contactId:I

    .line 142
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v0, 0x1

    const-string/jumbo v1, "vnd.android.cursor.item/postal-address_v2"

    aput-object v1, v4, v0

    .line 145
    .local v4, "addrWhereParams":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 147
    .local v6, "addrCur":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 148
    const-string/jumbo v0, "data1"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 150
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 151
    return-object v7
.end method

.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 10
    .param p1, "photoId"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v9, 0x0

    .line 121
    iget-object v0, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    new-array v2, v4, [Ljava/lang/String;

    const-string/jumbo v3, "data15"

    aput-object v3, v2, v9

    const-string/jumbo v3, "_id=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object p1, v4, v9

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 128
    .local v6, "photo":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 129
    const-string/jumbo v0, "data15"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v8

    .line 130
    .local v8, "photoBlob":[B
    array-length v0, v8

    invoke-static {v8, v9, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 134
    .end local v8    # "photoBlob":[B
    .local v7, "photoBitmap":Landroid/graphics/Bitmap;
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 135
    return-object v7

    .line 132
    .end local v7    # "photoBitmap":Landroid/graphics/Bitmap;
    :cond_0
    const/4 v7, 0x0

    .restart local v7    # "photoBitmap":Landroid/graphics/Bitmap;
    goto :goto_0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v4, 0x1

    const/4 v9, 0x0

    .line 71
    const-string/jumbo v8, ""

    .line 72
    .local v8, "emailStr":Ljava/lang/String;
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "data1"

    aput-object v0, v2, v9

    const-string/jumbo v0, "data2"

    aput-object v0, v2, v4

    .line 80
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Email;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v3, "contact_id=?"

    new-array v4, v4, [Ljava/lang/String;

    iget v5, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->contactId:I

    .line 81
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    const/4 v5, 0x0

    .line 80
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 84
    .local v7, "email":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    const-string/jumbo v0, "data1"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 87
    .local v6, "contactEmailColumnIndex":I
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 89
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 92
    .end local v6    # "contactEmailColumnIndex":I
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 93
    return-object v8
.end method

.method public getName()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v8, 0x0

    .line 52
    const/4 v7, 0x0

    .line 53
    .local v7, "name":Ljava/lang/String;
    new-array v2, v4, [Ljava/lang/String;

    const-string/jumbo v0, "display_name"

    aput-object v0, v2, v8

    .line 57
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v3, "_id=?"

    new-array v4, v4, [Ljava/lang/String;

    iget v5, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->contactId:I

    .line 58
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    const/4 v5, 0x0

    .line 57
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 61
    .local v6, "contact":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    const-string/jumbo v0, "display_name"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 63
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 65
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 66
    return-object v7
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v4, 0x1

    const/4 v9, 0x0

    .line 156
    const-string/jumbo v8, ""

    .line 157
    .local v8, "phoneNumber":Ljava/lang/String;
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "data1"

    aput-object v0, v2, v9

    const-string/jumbo v0, "data2"

    aput-object v0, v2, v4

    .line 160
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v3, "contact_id=?"

    new-array v4, v4, [Ljava/lang/String;

    iget v5, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->contactId:I

    .line 161
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    const/4 v5, 0x0

    .line 160
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 164
    .local v7, "phone":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 165
    const-string/jumbo v0, "data1"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 167
    .local v6, "contactNumberColumnIndex":I
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_0

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 169
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 173
    .end local v6    # "contactNumberColumnIndex":I
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 174
    return-object v8
.end method

.method public getPhoto()Landroid/graphics/Bitmap;
    .locals 10

    .prologue
    const/4 v4, 0x1

    const/4 v9, 0x0

    .line 98
    const/4 v7, 0x0

    .line 99
    .local v7, "photo":Landroid/graphics/Bitmap;
    new-array v2, v4, [Ljava/lang/String;

    const-string/jumbo v0, "photo_id"

    aput-object v0, v2, v9

    .line 103
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v3, "_id=?"

    new-array v4, v4, [Ljava/lang/String;

    iget v5, p0, Lcom/pccw/mobile/sms/helper/ContactsHelper;->contactId:I

    .line 104
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    const/4 v5, 0x0

    .line 103
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 107
    .local v6, "contact":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    const-string/jumbo v0, "photo_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 109
    .local v8, "photoId":Ljava/lang/String;
    if-eqz v8, :cond_1

    .line 110
    invoke-virtual {p0, v8}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 115
    .end local v8    # "photoId":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 117
    return-object v7

    .line 112
    .restart local v8    # "photoId":Ljava/lang/String;
    :cond_1
    const/4 v7, 0x0

    goto :goto_0
.end method
