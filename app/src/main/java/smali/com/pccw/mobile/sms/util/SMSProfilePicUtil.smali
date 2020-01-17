.class public Lcom/pccw/mobile/sms/util/SMSProfilePicUtil;
.super Ljava/lang/Object;
.source "SMSProfilePicUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMultipleSMSProfilePic(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 30
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200cd

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 31
    .local v0, "bmp":Landroid/graphics/Bitmap;
    return-object v0
.end method

.method public static getSingleSMSProfilePic(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "phoneNum"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 17
    const/4 v0, 0x0

    .line 18
    .local v0, "bmp":Landroid/graphics/Bitmap;
    invoke-static {p0, p1}, Lcom/pccw/mobile/sms/util/SMSProfilePicUtil;->isNumberWithinContact(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 19
    new-instance v1, Lcom/pccw/mobile/sms/helper/ContactsHelper;

    invoke-direct {v1, p0, p1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 20
    .local v1, "contactsHelper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    invoke-virtual {v1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getPhoto()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 23
    .end local v1    # "contactsHelper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    :cond_0
    if-nez v0, :cond_1

    .line 24
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0200ce

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 26
    :cond_1
    return-object v0
.end method

.method private static isNumberWithinContact(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 10
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    const/4 v9, 0x0

    .line 36
    sget-object v0, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    .line 38
    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 36
    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 39
    .local v1, "lookupUri":Landroid/net/Uri;
    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "_id"

    aput-object v0, v2, v9

    const-string/jumbo v0, "number"

    aput-object v0, v2, v8

    const/4 v0, 0x2

    const-string/jumbo v4, "display_name"

    aput-object v4, v2, v0

    .line 40
    .local v2, "mPhoneNumberProjection":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 42
    .local v6, "cur":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 43
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is within Contact List"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    if-eqz v6, :cond_0

    .line 51
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_0
    move v0, v8

    .line 55
    :goto_0
    return v0

    .line 50
    :cond_1
    if-eqz v6, :cond_2

    .line 51
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 54
    :cond_2
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is NOT within Contact List"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v9

    .line 55
    goto :goto_0

    .line 46
    :catch_0
    move-exception v7

    .line 47
    .local v7, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is NOT within Contact List -- ERROR"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    if-eqz v6, :cond_3

    .line 51
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    move v0, v9

    .line 48
    goto :goto_0

    .line 50
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 51
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method
