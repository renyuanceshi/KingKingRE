.class public Lcom/pccw/sms/adapter/GroupParticipantAdapter;
.super Landroid/widget/BaseAdapter;
.source "GroupParticipantAdapter.java"


# instance fields
.field private layoutID:I

.field private list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field public mThumbnailUri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "layoutID"    # I
    .param p4, "flag"    # [Ljava/lang/String;
    .param p5, "ItemIDs"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I[",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 37
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 38
    iput-object p2, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->list:Ljava/util/List;

    .line 39
    iput p3, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->layoutID:I

    .line 40
    iput-object p1, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->mContext:Landroid/content/Context;

    .line 41
    return-void
.end method

.method private getContactImageByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 17
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "strPhoneNumber"    # Ljava/lang/String;

    .prologue
    .line 104
    const/4 v1, 0x2

    new-array v3, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "photo_thumb_uri"

    aput-object v2, v3, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "data1"

    aput-object v2, v3, v1

    .line 106
    .local v3, "projection":[Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "data1 = \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 108
    .local v10, "cursor":Landroid/database/Cursor;
    if-nez v10, :cond_0

    .line 109
    const/4 v1, 0x0

    .line 154
    :goto_0
    return-object v1

    .line 112
    :cond_0
    const/4 v7, 0x0

    .line 113
    .local v7, "bm":Landroid/graphics/Bitmap;
    const/4 v15, 0x0

    .line 114
    .local v15, "mThumbnailUri":Ljava/lang/String;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_1
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ge v12, v1, :cond_4

    .line 115
    invoke-interface {v10, v12}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 117
    const-string/jumbo v1, "_id"

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    .line 119
    .local v9, "contactid":I
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v1, v2, :cond_2

    .line 121
    :try_start_0
    const-string/jumbo v1, "photo_thumb_uri"

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v14

    .line 122
    .local v14, "mThumbnailColumn":I
    invoke-interface {v10, v14}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v15

    .line 131
    .end local v14    # "mThumbnailColumn":I
    :goto_2
    if-eqz v15, :cond_1

    .line 134
    const/4 v13, 0x0

    .line 136
    .local v13, "is":Ljava/io/InputStream;
    const/16 v1, 0xb

    invoke-static {v1}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 137
    invoke-static {v15}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    .line 145
    .local v16, "thumbUri":Landroid/net/Uri;
    :goto_3
    :try_start_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v13

    .line 149
    :goto_4
    if-eqz v13, :cond_1

    .line 150
    invoke-static {v13}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 114
    .end local v13    # "is":Ljava/io/InputStream;
    .end local v16    # "thumbUri":Landroid/net/Uri;
    :cond_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 128
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    goto :goto_2

    .line 139
    .restart local v13    # "is":Ljava/io/InputStream;
    :cond_3
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, v15}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 141
    .local v8, "contactUri":Landroid/net/Uri;
    const-string/jumbo v1, "photo"

    invoke-static {v8, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    .restart local v16    # "thumbUri":Landroid/net/Uri;
    goto :goto_3

    .line 146
    .end local v8    # "contactUri":Landroid/net/Uri;
    :catch_0
    move-exception v11

    .line 147
    .local v11, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v11}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_4

    .line 154
    .end local v9    # "contactid":I
    .end local v11    # "e":Ljava/io/FileNotFoundException;
    .end local v13    # "is":Ljava/io/InputStream;
    .end local v16    # "thumbUri":Landroid/net/Uri;
    :cond_4
    if-nez v7, :cond_5

    const/4 v1, 0x0

    goto :goto_0

    :cond_5
    const/16 v1, 0x46

    const/16 v2, 0x46

    invoke-static {v7, v1, v2}, Lcom/pccw/mobile/util/UserPhotoUtil;->getCircularBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    .line 123
    .restart local v9    # "contactid":I
    :catch_1
    move-exception v1

    goto :goto_2
.end method


# virtual methods
.method public getContactNameByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "number"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 84
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v1, "display_name"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string/jumbo v1, "data1"

    aput-object v1, v2, v0

    .line 87
    .local v2, "projection":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "data1 = \'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 89
    .local v7, "cursor":Landroid/database/Cursor;
    if-nez v7, :cond_1

    .line 100
    :cond_0
    :goto_0
    return-object v4

    .line 92
    :cond_1
    const/4 v8, 0x0

    .local v8, "i":I
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge v8, v0, :cond_0

    .line 93
    invoke-interface {v7, v8}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 94
    const-string/jumbo v0, "display_name"

    .line 95
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    .line 96
    .local v10, "nameFieldColumnIndex":I
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 97
    .local v9, "name":Ljava/lang/String;
    const-string/jumbo v0, "_id"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .local v6, "contactid":I
    move-object v4, v9

    .line 98
    goto :goto_0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "arg0"    # I

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "arg0"    # I

    .prologue
    .line 55
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 60
    iget-object v6, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->mInflater:Landroid/view/LayoutInflater;

    iget v7, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->layoutID:I

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 61
    iget-object v6, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->list:Ljava/util/List;

    invoke-interface {v6, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 62
    .local v2, "number":Ljava/lang/String;
    const v6, 0x7f0e014c

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 63
    .local v3, "participantIcon":Landroid/widget/ImageView;
    const v6, 0x7f0e014f

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 64
    .local v4, "participantName":Landroid/widget/TextView;
    const v6, 0x7f0e0150

    invoke-virtual {p2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 66
    .local v5, "participantNumber":Landroid/widget/TextView;
    iget-object v6, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v6, v2}, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->getContactNameByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 68
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    :cond_0
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v6, p0, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p0, v6, v2}, Lcom/pccw/sms/adapter/GroupParticipantAdapter;->getContactImageByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 73
    .local v0, "contactBitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 74
    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 79
    :goto_0
    return-object p2

    .line 76
    :cond_1
    const v6, 0x7f0200ce

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0
.end method
