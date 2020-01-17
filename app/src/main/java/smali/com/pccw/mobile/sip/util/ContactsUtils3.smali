.class public Lcom/pccw/mobile/sip/util/ContactsUtils3;
.super Lcom/pccw/mobile/sip/util/ContactsUtils;
.source "ContactsUtils3.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/pccw/mobile/sip/util/ContactsUtils;-><init>()V

    return-void
.end method


# virtual methods
.method public queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;
    .locals 13
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 23
    const-string/jumbo v0, "&"

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 24
    const/4 v0, 0x0

    const-string/jumbo v2, "&"

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p2, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 26
    :cond_0
    :try_start_0
    sget-object v0, Landroid/provider/Contacts$Phones;->CONTENT_FILTER_URL:Landroid/net/Uri;

    invoke-static {v0, p2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 27
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

    const-string/jumbo v4, "person"

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

    move-result-object v6

    .line 33
    .local v6, "c":Landroid/database/Cursor;
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 34
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 35
    .local v10, "name":Ljava/lang/String;
    invoke-static {v10}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 37
    sget-object v0, Landroid/provider/Contacts$People;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    .line 38
    invoke-interface {v6, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    .line 37
    invoke-static {v0, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v7

    .line 40
    .local v7, "contactUri":Landroid/net/Uri;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 39
    invoke-static {v0, v7}, Landroid/provider/Contacts$People;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v8

    .line 41
    .local v8, "input":Ljava/io/InputStream;
    const/4 v11, 0x0

    .line 42
    .local v11, "photo":Landroid/graphics/drawable/Drawable;
    if-eqz v8, :cond_2

    .line 43
    new-instance v11, Landroid/graphics/drawable/BitmapDrawable;

    .end local v11    # "photo":Landroid/graphics/drawable/Drawable;
    invoke-direct {v11, v8}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Ljava/io/InputStream;)V

    .line 45
    .restart local v11    # "photo":Landroid/graphics/drawable/Drawable;
    :cond_2
    const/4 v0, 0x4

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 46
    .local v12, "type":I
    const/4 v0, 0x3

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v12, v0}, Landroid/provider/Contacts$Phones;->getDisplayLabel(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 47
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    .line 49
    .local v9, "label":Ljava/lang/String;
    new-instance v0, Lcom/pccw/mobile/sip/util/Contact;

    invoke-direct {v0, v10, v11, v9}, Lcom/pccw/mobile/sip/util/Contact;-><init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v6    # "c":Landroid/database/Cursor;
    .end local v7    # "contactUri":Landroid/net/Uri;
    .end local v8    # "input":Ljava/io/InputStream;
    .end local v9    # "label":Ljava/lang/String;
    .end local v11    # "photo":Landroid/graphics/drawable/Drawable;
    .end local v12    # "type":I
    :goto_0
    return-object v0

    .line 52
    .end local v10    # "name":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 54
    :cond_3
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->specialPhoneName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 55
    .restart local v10    # "name":Ljava/lang/String;
    if-eqz v10, :cond_4

    .line 56
    new-instance v0, Lcom/pccw/mobile/sip/util/Contact;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v10, v2, v3}, Lcom/pccw/mobile/sip/util/Contact;-><init>(Ljava/lang/String;Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    goto :goto_0

    .line 58
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public queryPhoneList(Landroid/content/ContentResolver;)Landroid/database/Cursor;
    .locals 6
    .param p1, "cr"    # Landroid/content/ContentResolver;

    .prologue
    const/4 v3, 0x0

    .line 63
    sget-object v1, Landroid/provider/Contacts$Phones;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x6

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v4, "_id"

    aput-object v4, v2, v0

    const/4 v0, 0x1

    const-string/jumbo v4, "number"

    aput-object v4, v2, v0

    const/4 v0, 0x2

    const-string/jumbo v4, "display_name"

    aput-object v4, v2, v0

    const/4 v0, 0x3

    const-string/jumbo v4, "type"

    aput-object v4, v2, v0

    const/4 v0, 0x4

    const-string/jumbo v4, "label"

    aput-object v4, v2, v0

    const/4 v0, 0x5

    const-string/jumbo v4, "type"

    aput-object v4, v2, v0

    const-string/jumbo v5, "name ASC"

    move-object v0, p1

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
