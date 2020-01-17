.class public Lcom/pccw/mobile/util/UserPhotoUtil;
.super Ljava/lang/Object;
.source "UserPhotoUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCircularBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 0
    .param p0, "orgBitmap"    # Landroid/graphics/Bitmap;
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 132
    return-object p0
.end method

.method public static getIMContactPhoto(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/graphics/Bitmap;
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .prologue
    .line 24
    .local p1, "userIMNumList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 26
    .local v2, "photoBitmap":Landroid/graphics/Bitmap;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 28
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/pccw/sms/service/ConversationParticipantItemService;->getConversationParticipantItemByMsisdn(Ljava/lang/String;)Lcom/pccw/sms/bean/ConversationParticipantItem;

    move-result-object v1

    .line 29
    .local v1, "imUser":Lcom/pccw/sms/bean/ConversationParticipantItem;
    invoke-virtual {v1}, Lcom/pccw/sms/bean/ConversationParticipantItem;->getProfileImagePath()Ljava/lang/String;

    move-result-object v3

    .line 30
    .local v3, "profilePath":Ljava/lang/String;
    if-eqz v3, :cond_1

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 31
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/pccw/sms/bean/SMSConstants;->INTERNAL_PROFILE_IMAGE_FILE_DIR(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 34
    .end local v1    # "imUser":Lcom/pccw/sms/bean/ConversationParticipantItem;
    .end local v2    # "photoBitmap":Landroid/graphics/Bitmap;
    .end local v3    # "profilePath":Ljava/lang/String;
    :cond_0
    return-object v2

    .line 26
    .restart local v1    # "imUser":Lcom/pccw/sms/bean/ConversationParticipantItem;
    .restart local v2    # "photoBitmap":Landroid/graphics/Bitmap;
    .restart local v3    # "profilePath":Ljava/lang/String;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static getIMContactPhotoPath(Landroid/content/Context;Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 39
    .local p1, "userIMNumList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 41
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lcom/pccw/sms/service/ConversationParticipantItemService;->getConversationParticipantItemByMsisdn(Ljava/lang/String;)Lcom/pccw/sms/bean/ConversationParticipantItem;

    move-result-object v1

    .line 42
    .local v1, "imUser":Lcom/pccw/sms/bean/ConversationParticipantItem;
    invoke-virtual {v1}, Lcom/pccw/sms/bean/ConversationParticipantItem;->getProfileImagePath()Ljava/lang/String;

    move-result-object v2

    .line 43
    .local v2, "profilePath":Ljava/lang/String;
    if-eqz v2, :cond_0

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 47
    .end local v1    # "imUser":Lcom/pccw/sms/bean/ConversationParticipantItem;
    .end local v2    # "profilePath":Ljava/lang/String;
    :goto_1
    return-object v2

    .line 39
    .restart local v1    # "imUser":Lcom/pccw/sms/bean/ConversationParticipantItem;
    .restart local v2    # "profilePath":Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 47
    .end local v1    # "imUser":Lcom/pccw/sms/bean/ConversationParticipantItem;
    .end local v2    # "profilePath":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static getIMContactPhotoWithPhotoUri(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "photoPath"    # Ljava/lang/String;

    .prologue
    .line 52
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/pccw/sms/bean/SMSConstants;->INTERNAL_PROFILE_IMAGE_FILE_DIR(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "path":Ljava/lang/String;
    invoke-static {v0}, Lcom/pccw/mobile/util/UserPhotoUtil;->isFileValid(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 55
    const-string/jumbo v1, "_group_profile.png"

    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/BitmapUtil;->getProfileImageThumbnail(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 61
    :goto_0
    return-object v1

    .line 58
    :cond_0
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 61
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getLargeContactPhoto(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "contactId"    # Ljava/lang/String;

    .prologue
    .line 80
    const/4 v0, 0x0

    .line 81
    .local v0, "photoBitmap":Landroid/graphics/Bitmap;
    invoke-static {p0, p1}, Lcom/pccw/mobile/util/UserPhotoUtil;->retrieveContactPhoto(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 83
    return-object v0
.end method

.method public static getRectangularBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "orgBitmap"    # Landroid/graphics/Bitmap;
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 136
    invoke-static {p0, p1, p2}, Landroid/media/ThumbnailUtils;->extractThumbnail(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static isFileValid(Ljava/lang/String;)Z
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 66
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 68
    .local v0, "f_path":Ljava/io/File;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    const/4 v1, 0x1

    .line 71
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static retrieveContactPhoto(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 8
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "contactId"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 89
    const/4 v2, 0x0

    .line 93
    .local v2, "photo":Landroid/graphics/Bitmap;
    :try_start_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_1

    .line 95
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 97
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 96
    invoke-static {v4, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x1

    .line 94
    invoke-static {v3, v4, v5}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;Z)Ljava/io/InputStream;

    move-result-object v1

    .line 105
    .local v1, "inputStream":Ljava/io/InputStream;
    :goto_0
    if-eqz v1, :cond_0

    .line 106
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 107
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 114
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :cond_0
    :goto_1
    return-object v2

    .line 100
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 102
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 101
    invoke-static {v4, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v4

    .line 99
    invoke-static {v3, v4}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .restart local v1    # "inputStream":Ljava/io/InputStream;
    goto :goto_0

    .line 110
    .end local v1    # "inputStream":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 111
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method
