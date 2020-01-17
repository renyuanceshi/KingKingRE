.class Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;
.super Landroid/support/v4/widget/SimpleCursorAdapter;
.source "AddCallContactFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallContactFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContactAdapter"
.end annotation


# instance fields
.field phoneCur:Landroid/database/Cursor;

.field final synthetic this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/AddCallContactFragment;Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V
    .locals 7
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "layout"    # I
    .param p4, "c"    # Landroid/database/Cursor;
    .param p5, "from"    # [Ljava/lang/String;
    .param p6, "to"    # [I
    .param p7, "flags"    # I

    .prologue
    .line 308
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    move v6, p7

    .line 309
    invoke-direct/range {v0 .. v6}, Landroid/support/v4/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    .line 310
    return-void
.end method

.method private checkHasIMNumber(Ljava/lang/String;)Z
    .locals 9
    .param p1, "contactId"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 354
    const/4 v0, 0x4

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "_id"

    aput-object v0, v2, v8

    const-string/jumbo v0, "data1"

    aput-object v0, v2, v7

    const/4 v0, 0x2

    const-string/jumbo v1, "data2"

    aput-object v1, v2, v0

    const/4 v0, 0x3

    const-string/jumbo v1, "data3"

    aput-object v1, v2, v0

    .line 358
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$200(Lcom/pccw/mobile/sip/AddCallContactFragment;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v3, "contact_id=?"

    new-array v4, v7, [Ljava/lang/String;

    aput-object p1, v4, v8

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    .line 363
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 364
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    const-string/jumbo v3, "data1"

    .line 365
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 364
    invoke-static {v0}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 367
    .local v6, "normPhoneNum":Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$300(Lcom/pccw/mobile/sip/AddCallContactFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v7

    .line 372
    .end local v6    # "normPhoneNum":Ljava/lang/String;
    :goto_0
    return v0

    .line 371
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    move v0, v8

    .line 372
    goto :goto_0
.end method

.method private getUserContactPhoto(Landroid/database/Cursor;Ljava/lang/String;Z)Landroid/graphics/Bitmap;
    .locals 12
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "contactId"    # Ljava/lang/String;
    .param p3, "isIMUser"    # Z

    .prologue
    .line 376
    const/4 v6, 0x0

    .line 378
    .local v6, "bm":Landroid/graphics/Bitmap;
    if-eqz p3, :cond_2

    .line 379
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 381
    .local v11, "userIMNumList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string/jumbo v1, "data1"

    aput-object v1, v2, v0

    .line 386
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$200(Lcom/pccw/mobile/sip/AddCallContactFragment;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const-string/jumbo v3, "contact_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 390
    .local v10, "phoneCur":Landroid/database/Cursor;
    :cond_0
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 391
    const-string/jumbo v0, "data1"

    .line 392
    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 391
    invoke-static {v0}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 394
    .local v9, "normPhoneNum":Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$300(Lcom/pccw/mobile/sip/AddCallContactFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    invoke-virtual {v11, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 398
    .end local v9    # "normPhoneNum":Ljava/lang/String;
    :cond_1
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 399
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$200(Lcom/pccw/mobile/sip/AddCallContactFragment;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v11}, Lcom/pccw/mobile/util/UserPhotoUtil;->getIMContactPhoto(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 402
    .end local v2    # "projection":[Ljava/lang/String;
    .end local v10    # "phoneCur":Landroid/database/Cursor;
    .end local v11    # "userIMNumList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    if-nez v6, :cond_3

    .line 404
    const/4 v8, 0x0

    .line 405
    .local v8, "mThumbnailUri":Ljava/lang/String;
    const/16 v0, 0xb

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 407
    :try_start_0
    const-string/jumbo v0, "photo_thumb_uri"

    .line 408
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    .line 409
    .local v7, "mThumbnailColumn":I
    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 420
    .end local v7    # "mThumbnailColumn":I
    :goto_1
    if-eqz v8, :cond_3

    .line 421
    invoke-direct {p0, v8}, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 425
    .end local v8    # "mThumbnailUri":Ljava/lang/String;
    :cond_3
    if-nez v6, :cond_5

    const/4 v0, 0x0

    :goto_2
    return-object v0

    .line 415
    .restart local v8    # "mThumbnailUri":Ljava/lang/String;
    :cond_4
    move-object v8, p2

    goto :goto_1

    .line 425
    .end local v8    # "mThumbnailUri":Ljava/lang/String;
    :cond_5
    const/16 v0, 0x46

    const/16 v1, 0x46

    invoke-static {v6, v0, v1}, Lcom/pccw/mobile/util/UserPhotoUtil;->getCircularBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_2

    .line 410
    .restart local v8    # "mThumbnailUri":Ljava/lang/String;
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "photoData"    # Ljava/lang/String;

    .prologue
    .line 439
    const/4 v2, 0x0

    .line 442
    .local v2, "is":Ljava/io/InputStream;
    const/16 v4, 0xb

    :try_start_0
    invoke-static {v4}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 443
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 450
    .local v3, "thumbUri":Landroid/net/Uri;
    :goto_0
    iget-object v4, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 452
    if-eqz v2, :cond_2

    .line 453
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 458
    if-eqz v2, :cond_0

    .line 460
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 466
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_0
    :goto_1
    return-object v4

    .line 445
    :cond_1
    :try_start_2
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 447
    .local v0, "contactUri":Landroid/net/Uri;
    const-string/jumbo v4, "photo"

    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .restart local v3    # "thumbUri":Landroid/net/Uri;
    goto :goto_0

    .line 461
    .end local v0    # "contactUri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 462
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 458
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    if-eqz v2, :cond_3

    .line 460
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 466
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_3
    :goto_2
    const/4 v4, 0x0

    goto :goto_1

    .line 461
    .restart local v3    # "thumbUri":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 462
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 455
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :catch_2
    move-exception v1

    .line 456
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 458
    if-eqz v2, :cond_3

    .line 460
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    .line 461
    :catch_3
    move-exception v1

    .line 462
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 458
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    if-eqz v2, :cond_4

    .line 460
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 463
    :cond_4
    :goto_3
    throw v4

    .line 461
    :catch_4
    move-exception v1

    .line 462
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 315
    const-string/jumbo v7, "display_name"

    .line 316
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 315
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 318
    .local v3, "contactName":Ljava/lang/String;
    const v7, 0x7f0e00ac

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 319
    .local v4, "contactNameView":Landroid/widget/TextView;
    const v7, 0x7f0e00ab

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 320
    .local v5, "contactThumbnail":Landroid/widget/ImageView;
    const v7, 0x7f0e00ad

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 321
    .local v1, "contactIMUserLogo":Landroid/widget/ImageView;
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 323
    const-string/jumbo v7, "_id"

    .line 324
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    .line 323
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 325
    .local v2, "contactId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 327
    .local v6, "isIMUser":Z
    if-eqz v6, :cond_0

    .line 328
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 333
    :goto_0
    invoke-direct {p0, p3, v2, v6}, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->getUserContactPhoto(Landroid/database/Cursor;Ljava/lang/String;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 335
    .local v0, "contactBitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 336
    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 341
    :goto_1
    new-instance v7, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter$1;

    invoke-direct {v7, p0, v2, v3}, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter$1;-><init>(Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 351
    return-void

    .line 330
    .end local v0    # "contactBitmap":Landroid/graphics/Bitmap;
    :cond_0
    const/4 v7, 0x4

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 338
    .restart local v0    # "contactBitmap":Landroid/graphics/Bitmap;
    :cond_1
    const v7, 0x7f0200ce

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1
.end method
