.class Lcom/pccw/sms/NewSMSActivity$ContactAdapter;
.super Landroid/support/v4/widget/SimpleCursorAdapter;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/widget/SectionIndexer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/NewSMSActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContactAdapter"
.end annotation


# instance fields
.field private mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

.field final synthetic this$0:Lcom/pccw/sms/NewSMSActivity;


# direct methods
.method public constructor <init>(Lcom/pccw/sms/NewSMSActivity;Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V
    .locals 8
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "layout"    # I
    .param p4, "c"    # Landroid/database/Cursor;
    .param p5, "from"    # [Ljava/lang/String;
    .param p6, "to"    # [I
    .param p7, "flags"    # I

    .prologue
    .line 760
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    move-object v3, p4

    move-object v4, p5

    move-object v5, p6

    move v6, p7

    .line 761
    invoke-direct/range {v0 .. v6}, Landroid/support/v4/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    .line 763
    const v0, 0x7f070284

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 765
    .local v7, "alphabet":Ljava/lang/String;
    new-instance v0, Landroid/widget/AlphabetIndexer;

    const/4 v1, 0x1

    invoke-direct {v0, p4, v1, v7}, Landroid/widget/AlphabetIndexer;-><init>(Landroid/database/Cursor;ILjava/lang/CharSequence;)V

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    .line 766
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v0, p4}, Landroid/widget/AlphabetIndexer;->setCursor(Landroid/database/Cursor;)V

    .line 768
    return-void
.end method

.method private getUserContactPhoto(Landroid/database/Cursor;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "contactId"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x46

    .line 830
    const/4 v0, 0x0

    .line 831
    .local v0, "bm":Landroid/graphics/Bitmap;
    const/4 v2, 0x0

    .line 833
    .local v2, "mThumbnailUri":Ljava/lang/String;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_1

    .line 835
    :try_start_0
    const-string/jumbo v3, "photo_thumb_uri"

    .line 836
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    .line 837
    .local v1, "mThumbnailColumn":I
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 846
    .end local v1    # "mThumbnailColumn":I
    :goto_0
    if-eqz v2, :cond_0

    .line 849
    invoke-direct {p0, v2}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 852
    :cond_0
    invoke-static {v0, v5, v5}, Lcom/pccw/mobile/util/UserPhotoUtil;->getCircularBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v3

    return-object v3

    .line 843
    :cond_1
    move-object v2, p2

    goto :goto_0

    .line 838
    :catch_0
    move-exception v3

    goto :goto_0
.end method

.method private loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "photoData"    # Ljava/lang/String;

    .prologue
    .line 866
    const/4 v2, 0x0

    .line 869
    .local v2, "is":Ljava/io/InputStream;
    const/16 v4, 0xb

    :try_start_0
    invoke-static {v4}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 870
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 877
    .local v3, "thumbUri":Landroid/net/Uri;
    :goto_0
    iget-object v4, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v4}, Lcom/pccw/sms/NewSMSActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 879
    if-eqz v2, :cond_2

    .line 880
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 885
    if-eqz v2, :cond_0

    .line 887
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 893
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_0
    :goto_1
    return-object v4

    .line 872
    :cond_1
    :try_start_2
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 874
    .local v0, "contactUri":Landroid/net/Uri;
    const-string/jumbo v4, "photo"

    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .restart local v3    # "thumbUri":Landroid/net/Uri;
    goto :goto_0

    .line 888
    .end local v0    # "contactUri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 889
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 885
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    if-eqz v2, :cond_3

    .line 887
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 893
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_3
    :goto_2
    const/4 v4, 0x0

    goto :goto_1

    .line 888
    .restart local v3    # "thumbUri":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 889
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 882
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :catch_2
    move-exception v1

    .line 883
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 885
    if-eqz v2, :cond_3

    .line 887
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    .line 888
    :catch_3
    move-exception v1

    .line 889
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 885
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    if-eqz v2, :cond_4

    .line 887
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 890
    :cond_4
    :goto_3
    throw v4

    .line 888
    :catch_4
    move-exception v1

    .line 889
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 15
    .param p1, "view"    # Landroid/view/View;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 774
    const-string/jumbo v13, "display_name"

    .line 775
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 774
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 777
    .local v3, "contactName":Ljava/lang/String;
    const-string/jumbo v13, "data1"

    .line 778
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 777
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 780
    .local v7, "phoneNumber":Ljava/lang/String;
    const-string/jumbo v13, "data2"

    .line 781
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    .line 780
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 783
    .local v9, "phoneType":Ljava/lang/String;
    const v13, 0x7f0e0127

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 784
    .local v4, "contactNameView":Landroid/widget/TextView;
    const v13, 0x7f0e0126

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 785
    .local v5, "contactThumbnail":Landroid/widget/ImageView;
    const v13, 0x7f0e01b2

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 786
    .local v8, "phoneNumberTv":Landroid/widget/TextView;
    const v13, 0x7f0e01b1

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 787
    .local v10, "phoneTypeTv":Landroid/widget/TextView;
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 788
    const-string/jumbo v13, " "

    const-string/jumbo v14, ""

    invoke-virtual {v7, v13, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 790
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 791
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 792
    .local v12, "type":I
    invoke-static {v12}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabelResource(I)I

    move-result v11

    .line 793
    .local v11, "phonetypeLabelResource":I
    iget-object v13, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v13, v11}, Lcom/pccw/sms/NewSMSActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 794
    .local v6, "phoneLabel":Ljava/lang/String;
    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 799
    .end local v6    # "phoneLabel":Ljava/lang/String;
    .end local v11    # "phonetypeLabelResource":I
    .end local v12    # "type":I
    :goto_0
    const-string/jumbo v13, "_id"

    .line 800
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    .line 799
    move-object/from16 v0, p3

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 803
    .local v2, "contactId":Ljava/lang/String;
    move-object/from16 v0, p3

    invoke-direct {p0, v0, v2}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->getUserContactPhoto(Landroid/database/Cursor;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 805
    .local v1, "contactBitmap":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_1

    .line 806
    invoke-virtual {v5, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 811
    :goto_1
    new-instance v13, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;

    invoke-direct {v13, p0, v7}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter$1;-><init>(Lcom/pccw/sms/NewSMSActivity$ContactAdapter;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 821
    return-void

    .line 796
    .end local v1    # "contactBitmap":Landroid/graphics/Bitmap;
    .end local v2    # "contactId":Ljava/lang/String;
    :cond_0
    const-string/jumbo v13, ""

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 808
    .restart local v1    # "contactBitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "contactId":Ljava/lang/String;
    :cond_1
    const v13, 0x7f0200ce

    invoke-virtual {v5, v13}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1
.end method

.method public getPositionForSection(I)I
    .locals 2
    .param p1, "sectionIndex"    # I

    .prologue
    const/4 v0, 0x0

    .line 920
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    if-nez v1, :cond_1

    .line 929
    :cond_0
    :goto_0
    return v0

    .line 923
    :cond_1
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    if-eqz v1, :cond_0

    .line 925
    :try_start_0
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v1, p1}, Landroid/widget/AlphabetIndexer;->getPositionForSection(I)I
    :try_end_0
    .catch Landroid/database/CursorIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 926
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public getSectionForPosition(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x0

    .line 934
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v1

    if-nez v1, :cond_1

    .line 943
    :cond_0
    :goto_0
    return v0

    .line 937
    :cond_1
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    if-eqz v1, :cond_0

    .line 939
    :try_start_0
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v1, p1}, Landroid/widget/AlphabetIndexer;->getPositionForSection(I)I
    :try_end_0
    .catch Landroid/database/CursorIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_0

    .line 940
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public getSections()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 915
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v0}, Landroid/widget/AlphabetIndexer;->getSections()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 2
    .param p1, "newCursor"    # Landroid/database/Cursor;

    .prologue
    .line 898
    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 899
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->list:Landroid/widget/ListView;

    if-eqz v0, :cond_0

    .line 900
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->list:Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    .line 909
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->mAlphabetIndexer:Landroid/widget/AlphabetIndexer;

    invoke-virtual {v0, p1}, Landroid/widget/AlphabetIndexer;->setCursor(Landroid/database/Cursor;)V

    .line 910
    invoke-super {p0, p1}, Landroid/support/v4/widget/SimpleCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0

    .line 903
    :cond_1
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->list:Landroid/widget/ListView;

    if-eqz v0, :cond_0

    .line 904
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->list:Landroid/widget/ListView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setVisibility(I)V

    goto :goto_0
.end method
