.class Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;
.super Landroid/support/v4/widget/SimpleCursorAdapter;
.source "ContactFragment.java"

# interfaces
.implements Landroid/widget/SectionIndexer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/ContactFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContactAdapter"
.end annotation


# instance fields
.field private mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

.field phoneCur:Landroid/database/Cursor;

.field final synthetic this$0:Lcom/pccw/mobile/sip/ContactFragment;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/ContactFragment;Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V
    .locals 8
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "layout"    # I
    .param p4, "c"    # Landroid/database/Cursor;
    .param p5, "from"    # [Ljava/lang/String;
    .param p6, "to"    # [I
    .param p7, "flags"    # I

    .prologue
    .line 335
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    move v6, p7

    .line 336
    invoke-direct/range {v0 .. v6}, Landroid/support/v4/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    .line 338
    const v0, 0x7f070284

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 340
    .local v7, "alphabet":Ljava/lang/String;
    new-instance v0, Landroid/widget/AlphabetIndexer;

    const/4 v1, 0x1

    invoke-direct {v0, p4, v1, v7}, Landroid/widget/AlphabetIndexer;-><init>(Landroid/database/Cursor;ILjava/lang/CharSequence;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    .line 341
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v0, p4}, Landroid/widget/AlphabetIndexer;->setCursor(Landroid/database/Cursor;)V

    .line 343
    return-void
.end method

.method private checkHasIMNumber(Ljava/lang/String;)Z
    .locals 9
    .param p1, "contactId"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 387
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

    .line 391
    .local v2, "projection":[Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ContactFragment;->access$200(Lcom/pccw/mobile/sip/ContactFragment;)Landroid/content/Context;

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

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    .line 396
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 397
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    const-string/jumbo v3, "data1"

    .line 398
    invoke-interface {v1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 397
    invoke-static {v0}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 400
    .local v6, "normPhoneNum":Ljava/lang/String;
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ContactFragment;->access$300(Lcom/pccw/mobile/sip/ContactFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/linphone/LinphoneActivity;->isPhoneBookSyncRunning()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v7

    .line 405
    .end local v6    # "normPhoneNum":Ljava/lang/String;
    :goto_0
    return v0

    .line 404
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->phoneCur:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    move v0, v8

    .line 405
    goto :goto_0
.end method

.method private getUserContactPhoto(Landroid/database/Cursor;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "contactId"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x46

    .line 413
    const/4 v0, 0x0

    .line 414
    .local v0, "bm":Landroid/graphics/Bitmap;
    const/4 v2, 0x0

    .line 416
    .local v2, "mThumbnailUri":Ljava/lang/String;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_1

    .line 418
    :try_start_0
    const-string/jumbo v3, "photo_thumb_uri"

    .line 419
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    .line 420
    .local v1, "mThumbnailColumn":I
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 429
    .end local v1    # "mThumbnailColumn":I
    :goto_0
    if-eqz v2, :cond_0

    .line 432
    invoke-direct {p0, v2}, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 435
    :cond_0
    if-nez v0, :cond_2

    const/4 v3, 0x0

    :goto_1
    return-object v3

    .line 426
    :cond_1
    move-object v2, p2

    goto :goto_0

    .line 435
    :cond_2
    invoke-static {v0, v5, v5}, Lcom/pccw/mobile/util/UserPhotoUtil;->getCircularBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v3

    goto :goto_1

    .line 421
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "photoData"    # Ljava/lang/String;

    .prologue
    .line 449
    const/4 v2, 0x0

    .line 452
    .local v2, "is":Ljava/io/InputStream;
    const/16 v4, 0xb

    :try_start_0
    invoke-static {v4}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 453
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 460
    .local v3, "thumbUri":Landroid/net/Uri;
    :goto_0
    iget-object v4, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/ContactFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 462
    if-eqz v2, :cond_2

    .line 463
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 468
    if-eqz v2, :cond_0

    .line 470
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 476
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_0
    :goto_1
    return-object v4

    .line 455
    :cond_1
    :try_start_2
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 457
    .local v0, "contactUri":Landroid/net/Uri;
    const-string/jumbo v4, "photo"

    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .restart local v3    # "thumbUri":Landroid/net/Uri;
    goto :goto_0

    .line 471
    .end local v0    # "contactUri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 472
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 468
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    if-eqz v2, :cond_3

    .line 470
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 476
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_3
    :goto_2
    const/4 v4, 0x0

    goto :goto_1

    .line 471
    .restart local v3    # "thumbUri":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 472
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 465
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :catch_2
    move-exception v1

    .line 466
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 468
    if-eqz v2, :cond_3

    .line 470
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    .line 471
    :catch_3
    move-exception v1

    .line 472
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 468
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    if-eqz v2, :cond_4

    .line 470
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 473
    :cond_4
    :goto_3
    throw v4

    .line 471
    :catch_4
    move-exception v1

    .line 472
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
    .line 348
    const-string/jumbo v7, "display_name"

    .line 349
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    .line 348
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 351
    .local v3, "contactName":Ljava/lang/String;
    const v7, 0x7f0e0127

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 352
    .local v4, "contactNameView":Landroid/widget/TextView;
    const v7, 0x7f0e0126

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 353
    .local v5, "contactThumbnail":Landroid/widget/ImageView;
    const v7, 0x7f0e0128

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 354
    .local v1, "contactIMUserLogo":Landroid/widget/ImageView;
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 356
    const-string/jumbo v7, "_id"

    .line 357
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    .line 356
    invoke-interface {p3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 358
    .local v2, "contactId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 360
    .local v6, "isIMUser":Z
    if-eqz v6, :cond_0

    .line 361
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 366
    :goto_0
    invoke-direct {p0, p3, v2}, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->getUserContactPhoto(Landroid/database/Cursor;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 368
    .local v0, "contactBitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_1

    .line 369
    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 374
    :goto_1
    new-instance v7, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;

    invoke-direct {v7, p0, v2, v3}, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter$1;-><init>(Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 384
    return-void

    .line 363
    .end local v0    # "contactBitmap":Landroid/graphics/Bitmap;
    :cond_0
    const/4 v7, 0x4

    invoke-virtual {v1, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    .line 371
    .restart local v0    # "contactBitmap":Landroid/graphics/Bitmap;
    :cond_1
    const v7, 0x7f0200ce

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1
.end method

.method public getPositionForSection(I)I
    .locals 2
    .param p1, "sectionIndex"    # I

    .prologue
    const/4 v0, 0x0

    .line 492
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    if-nez v1, :cond_1

    .line 500
    :cond_0
    :goto_0
    return v0

    .line 495
    :cond_1
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    if-eqz v1, :cond_0

    .line 497
    :try_start_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v1, p1}, Landroid/widget/AlphabetIndexer;->getPositionForSection(I)I
    :try_end_0
    .catch Landroid/database/CursorIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 498
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public getSectionForPosition(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x0

    .line 505
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    if-nez v1, :cond_1

    .line 513
    :cond_0
    :goto_0
    return v0

    .line 508
    :cond_1
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    if-eqz v1, :cond_0

    .line 510
    :try_start_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v1, p1}, Landroid/widget/AlphabetIndexer;->getPositionForSection(I)I
    :try_end_0
    .catch Landroid/database/CursorIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 511
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public getSections()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 487
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v0}, Landroid/widget/AlphabetIndexer;->getSections()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 1
    .param p1, "newCursor"    # Landroid/database/Cursor;

    .prologue
    .line 482
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v0, p1}, Landroid/widget/AlphabetIndexer;->setCursor(Landroid/database/Cursor;)V

    .line 483
    invoke-super {p0, p1}, Landroid/support/v4/widget/SimpleCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
