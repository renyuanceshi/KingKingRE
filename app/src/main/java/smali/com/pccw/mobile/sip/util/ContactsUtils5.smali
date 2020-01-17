.class public Lcom/pccw/mobile/sip/util/ContactsUtils5;
.super Lcom/pccw/mobile/sip/util/ContactsUtils;
.source "ContactsUtils5.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/pccw/mobile/sip/util/ContactsUtils;-><init>()V

    return-void
.end method


# virtual methods
.method public queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;
    .locals 13
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 24
    const-string/jumbo v0, "&"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 25
    const/4 v0, 0x0

    const-string/jumbo v2, "&"

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p2, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 27
    :cond_0
    :try_start_0
    sget-object v0, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    invoke-static {p2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 28
    .local v1, "uri":Landroid/net/Uri;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string/jumbo v4, "display_name"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string/jumbo v4, "photo_id"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    const-string/jumbo v4, "label"

    aput-object v4, v2, v3

    const/4 v3, 0x4

    const-string/jumbo v4, "type"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 34
    .local v7, "c":Landroid/database/Cursor;
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 35
    const/4 v0, 0x1

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 36
    .local v11, "name":Ljava/lang/String;
    invoke-static {v11}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 38
    sget-object v0, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    .line 39
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 38
    invoke-static {v0, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v8

    .line 41
    .local v8, "contactUri":Landroid/net/Uri;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 40
    invoke-static {v0, v8}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v9

    .line 42
    .local v9, "input":Ljava/io/InputStream;
    const/4 v6, 0x0

    .line 43
    .local v6, "bm":Landroid/graphics/drawable/Drawable;
    if-eqz v9, :cond_2

    .line 44
    new-instance v6, Landroid/graphics/drawable/BitmapDrawable;

    .end local v6    # "bm":Landroid/graphics/drawable/Drawable;
    invoke-direct {v6, v9}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Ljava/io/InputStream;)V

    .line 45
    .restart local v6    # "bm":Landroid/graphics/drawable/Drawable;
    :cond_2
    const/4 v0, 0x4

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 47
    .local v12, "type":I
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v2, 0x3

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 46
    invoke-static {v0, v12, v2}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabel(Landroid/content/res/Resources;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 47
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    .line 48
    .local v10, "label":Ljava/lang/String;
    new-instance v0, Lcom/pccw/mobile/sip/util/Contact;

    invoke-direct {v0, v11, v6, v10}, Lcom/pccw/mobile/sip/util/Contact;-><init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v6    # "bm":Landroid/graphics/drawable/Drawable;
    .end local v7    # "c":Landroid/database/Cursor;
    .end local v8    # "contactUri":Landroid/net/Uri;
    .end local v9    # "input":Ljava/io/InputStream;
    .end local v10    # "label":Ljava/lang/String;
    .end local v12    # "type":I
    :goto_0
    return-object v0

    .line 51
    .end local v11    # "name":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 53
    :cond_3
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->specialPhoneName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 54
    .restart local v11    # "name":Ljava/lang/String;
    if-eqz v11, :cond_4

    .line 55
    new-instance v0, Lcom/pccw/mobile/sip/util/Contact;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v11, v2, v3}, Lcom/pccw/mobile/sip/util/Contact;-><init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    goto :goto_0

    .line 57
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public queryPhoneList(Landroid/content/ContentResolver;)Landroid/database/Cursor;
    .locals 6
    .param p1, "cr"    # Landroid/content/ContentResolver;

    .prologue
    const/4 v4, 0x0

    .line 63
    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v3, "_id"

    aput-object v3, v2, v0

    const/4 v0, 0x1

    const-string/jumbo v3, "data1"

    aput-object v3, v2, v0

    const/4 v0, 0x2

    const-string/jumbo v3, "data2"

    aput-object v3, v2, v0

    const/4 v0, 0x3

    const-string/jumbo v3, "data3"

    aput-object v3, v2, v0

    const-string/jumbo v3, "mimetype=\'vnd.android.cursor.item/phone_v2\'"

    move-object v0, p1

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
