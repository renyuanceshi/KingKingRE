.class public Lcom/pccw/mobile/sms/util/SMSProfileUtil;
.super Ljava/lang/Object;
.source "SMSProfileUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getContactNameOrKeepInputNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p0, "phoneNum"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 49
    new-instance v1, Lcom/pccw/mobile/sms/helper/ContactsHelper;

    invoke-direct {v1, p0, p1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 50
    .local v1, "helper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    invoke-virtual {v1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getName()Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "contactName":Ljava/lang/String;
    if-nez v0, :cond_0

    .end local p0    # "phoneNum":Ljava/lang/String;
    :goto_0
    return-object p0

    .restart local p0    # "phoneNum":Ljava/lang/String;
    :cond_0
    move-object p0, v0

    goto :goto_0
.end method

.method public static getMultipleSMSProfilePic(Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200cd

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 34
    .local v0, "bmp":Landroid/graphics/Bitmap;
    return-object v0
.end method

.method public static getMultipleSMSProfileTitle(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "phoneNumList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 43
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1, p1}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getContactNameOrKeepInputNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 42
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 45
    :cond_0
    invoke-static {p0}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getSingleSMSProfilePic(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 4
    .param p0, "phoneNum"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 20
    const/4 v0, 0x0

    .line 21
    .local v0, "bmp":Landroid/graphics/Bitmap;
    invoke-static {p0, p1}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->isNumberWithinContact(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 22
    new-instance v1, Lcom/pccw/mobile/sms/helper/ContactsHelper;

    invoke-direct {v1, p0, p1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 23
    .local v1, "contactsHelper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    invoke-virtual {v1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getPhoto()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 26
    .end local v1    # "contactsHelper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    :cond_0
    if-nez v0, :cond_1

    .line 27
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0200ce

    invoke-static {v2, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 29
    :cond_1
    return-object v0
.end method

.method public static getSingleSMSProfileTitle(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "phoneNum"    # Ljava/lang/String;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-static {p0, p1}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getContactNameOrKeepInputNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

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

    .line 56
    sget-object v0, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    .line 58
    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 56
    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 59
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

    .line 60
    .local v2, "mPhoneNumberProjection":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 62
    .local v6, "cur":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 63
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

    .line 70
    if-eqz v6, :cond_0

    .line 71
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_0
    move v0, v8

    .line 75
    :goto_0
    return v0

    .line 70
    :cond_1
    if-eqz v6, :cond_2

    .line 71
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 74
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

    .line 75
    goto :goto_0

    .line 66
    :catch_0
    move-exception v7

    .line 67
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

    .line 70
    if-eqz v6, :cond_3

    .line 71
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    move v0, v9

    .line 68
    goto :goto_0

    .line 70
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 71
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method
