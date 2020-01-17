.class Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;
.super Landroid/widget/ResourceCursorAdapter;
.source "CallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/CallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallLogAdapter"
.end annotation


# instance fields
.field private mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

.field private mLoading:Z

.field final synthetic this$0:Lcom/pccw/mobile/sip/CallLogFragment;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment;Landroid/content/Context;ILandroid/database/Cursor;Z)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "layout"    # I
    .param p4, "c"    # Landroid/database/Cursor;
    .param p5, "autoRequery"    # Z

    .prologue
    .line 1051
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1052
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/widget/ResourceCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;Z)V

    .line 1049
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->mLoading:Z

    .line 1053
    new-instance v0, Lcom/pccw/android/common/widget/ImageLoader;

    invoke-direct {v0, p2}, Lcom/pccw/android/common/widget/ImageLoader;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

    .line 1054
    return-void
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 1046
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->setLoading(Z)V

    return-void
.end method

.method private getUserContactPhotoURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    const/16 v9, 0xb

    const/4 v3, 0x0

    .line 1695
    const/4 v8, 0x0

    .line 1697
    .local v8, "mThumbnailUri":Ljava/lang/String;
    sget-object v0, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    .line 1698
    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1697
    invoke-static {v0, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 1699
    .local v1, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1701
    invoke-static {v9}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v2, Lcom/pccw/mobile/sip/CallLogFragment;->CONTACT_PHOTO_PROJECTION:[Ljava/lang/String;

    :goto_0
    move-object v4, v3

    move-object v5, v3

    .line 1699
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1704
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1705
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v9, :cond_0

    .line 1707
    :try_start_0
    const-string/jumbo v0, "photo_thumb_uri"

    .line 1708
    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    .line 1709
    .local v7, "mThumbnailColumn":I
    invoke-interface {v6, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 1718
    .end local v7    # "mThumbnailColumn":I
    :cond_0
    :goto_1
    return-object v8

    .line 1701
    .end local v6    # "cursor":Landroid/database/Cursor;
    :cond_1
    sget-object v2, Lcom/pccw/mobile/sip/CallLogFragment;->CONTACT_PHOTO_PROJECTION_LOWER_API11:[Ljava/lang/String;

    goto :goto_0

    .line 1710
    .restart local v6    # "cursor":Landroid/database/Cursor;
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method private parseGroupSystemMessage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "lastMsg"    # Ljava/lang/String;
    .param p3, "messageType"    # Ljava/lang/String;

    .prologue
    .line 1563
    sget-object v8, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_SYSTEM_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p2, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 1564
    .local v4, "pair":[Ljava/lang/String;
    new-instance v7, Lcom/pccw/database/dao/UserInfoDAOImpl;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/pccw/database/dao/UserInfoDAOImpl;-><init>(Landroid/content/Context;)V

    .line 1565
    .local v7, "userInfoImpl":Lcom/pccw/database/dao/UserInfoDAOImpl;
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 1566
    .local v6, "user":Ljava/lang/String;
    const-string/jumbo v2, ""

    .line 1567
    .local v2, "msg":Ljava/lang/String;
    const-string/jumbo v5, ""

    .line 1568
    .local v5, "subj":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 1569
    .local v3, "obj":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1571
    .local v1, "contact":Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;
    array-length v8, v4

    const/4 v9, 0x2

    if-ne v8, v9, :cond_c

    .line 1572
    sget-object v8, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_ADD:Ljava/lang/String;

    invoke-virtual {p3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const/4 v8, 0x0

    aget-object v8, v4, v8

    .line 1573
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v8, 0x0

    aget-object v8, v4, v8

    const/4 v9, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1574
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f070161

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1584
    .local v0, "SUBJ_ACTION":Ljava/lang/String;
    :goto_0
    const/4 v8, 0x0

    aget-object v5, v4, v8

    .line 1585
    const/4 v8, 0x1

    aget-object v3, v4, v8

    .line 1587
    invoke-virtual {v7, v5}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v1

    .line 1588
    const/4 v8, 0x0

    aget-object v8, v4, v8

    const/4 v9, 0x1

    aget-object v9, v4, v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9

    .line 1590
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 1591
    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f070160

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 1596
    :goto_1
    const/4 v8, 0x1

    aget-object v8, v4, v8

    invoke-virtual {v7, v8}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v1

    .line 1597
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1599
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 1600
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f070160

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1627
    .end local v0    # "SUBJ_ACTION":Ljava/lang/String;
    :goto_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1628
    return-object v2

    .line 1574
    :cond_0
    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1575
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07015d

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v8, 0x0

    aget-object v8, v4, v8

    .line 1576
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    const/4 v8, 0x0

    aget-object v8, v4, v8

    const/4 v9, 0x1

    aget-object v9, v4, v9

    .line 1577
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1578
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f070162

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_2
    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1579
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07015f

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_3
    const/4 v8, 0x0

    aget-object v8, v4, v8

    const/4 v9, 0x1

    aget-object v9, v4, v9

    .line 1580
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1581
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07015e

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    :cond_4
    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1582
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07015f

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1593
    .restart local v0    # "SUBJ_ACTION":Ljava/lang/String;
    :cond_5
    const-string/jumbo v8, ""

    iget-object v9, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    iget-object v8, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v8, :cond_6

    iget-object v5, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    .line 1594
    :goto_3
    goto/16 :goto_1

    :cond_6
    invoke-static {v5}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 1602
    :cond_7
    const-string/jumbo v8, ""

    iget-object v9, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_8

    iget-object v8, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v8, :cond_8

    iget-object v3, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    .line 1603
    :goto_4
    goto/16 :goto_2

    :cond_8
    invoke-static {v3}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_4

    .line 1606
    :cond_9
    move-object v5, v3

    .line 1607
    const-string/jumbo v3, ""

    .line 1608
    move-object v2, v0

    .line 1610
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 1611
    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f070160

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_2

    .line 1613
    :cond_a
    const-string/jumbo v8, ""

    iget-object v9, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_b

    iget-object v8, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v8, :cond_b

    iget-object v5, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    .line 1615
    :goto_5
    const/4 v8, 0x1

    aget-object v8, v4, v8

    invoke-virtual {v7, v8}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v1

    goto/16 :goto_2

    .line 1614
    :cond_b
    invoke-static {v5}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_5

    .line 1620
    .end local v0    # "SUBJ_ACTION":Ljava/lang/String;
    :cond_c
    sget-object v8, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_ADD:Ljava/lang/String;

    invoke-virtual {p3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_d

    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1621
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07015d

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1623
    :goto_6
    const/4 v8, 0x0

    aget-object v8, v4, v8

    invoke-virtual {v7, v8}, Lcom/pccw/database/dao/UserInfoDAOImpl;->findUserContactDetail(Ljava/lang/String;)Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;

    move-result-object v1

    .line 1624
    const-string/jumbo v8, ""

    iget-object v9, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_e

    iget-object v8, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    if-eqz v8, :cond_e

    iget-object v3, v1, Lcom/pccw/database/dao/UserInfoDAOImpl$ContactDetail;->nickname:Ljava/lang/String;

    :goto_7
    goto/16 :goto_2

    .line 1621
    :cond_d
    iget-object v8, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1622
    invoke-virtual {v8}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f07015f

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    .line 1624
    :cond_e
    const/4 v8, 0x0

    aget-object v8, v4, v8

    invoke-static {v8}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_7
.end method

.method private setCallTypeLabel(Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;I)V
    .locals 2
    .param p1, "views"    # Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;
    .param p2, "callTypeIndex"    # I

    .prologue
    .line 1539
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1540
    sparse-switch p2, :sswitch_data_0

    .line 1558
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1560
    :goto_0
    return-void

    .line 1542
    :sswitch_0
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const v1, 0x7f02043f

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 1545
    :sswitch_1
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const v1, 0x7f020448

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 1551
    :sswitch_2
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const v1, 0x7f020434

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 1554
    :sswitch_3
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1555
    iget-object v0, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const v1, 0x7f02043e

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 1540
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0x2 -> :sswitch_1
        0x3 -> :sswitch_0
        0x4 -> :sswitch_2
        0x5 -> :sswitch_2
        0x6 -> :sswitch_2
        0x15 -> :sswitch_3
    .end sparse-switch
.end method

.method private setImageViewPhoto(Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;)V
    .locals 3
    .param p1, "thumbnailUri"    # Ljava/lang/String;
    .param p2, "chatType"    # Ljava/lang/String;
    .param p3, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 1649
    const/4 v0, 0x0

    .line 1650
    .local v0, "path":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1652
    .local v1, "placeHolder":I
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-static {v2}, Lcom/pccw/mobile/sip/CallLogFragment;->access$900(Lcom/pccw/mobile/sip/CallLogFragment;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 1676
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

    invoke-virtual {v2, v0, p3, v1}, Lcom/pccw/android/common/widget/ImageLoader;->loadBitmap(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 1677
    return-void

    .line 1654
    :pswitch_0
    if-eqz p1, :cond_0

    .line 1655
    move-object v0, p1

    .line 1656
    const/4 v1, -0x1

    goto :goto_0

    .line 1661
    :pswitch_1
    const-string/jumbo v2, "group"

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1662
    const v1, 0x7f0200cd

    goto :goto_0

    .line 1664
    :cond_1
    if-eqz p1, :cond_2

    .line 1665
    move-object v0, p1

    .line 1666
    const/4 v1, -0x1

    goto :goto_0

    .line 1668
    :cond_2
    const v1, 0x7f0200ce

    .line 1671
    goto :goto_0

    .line 1652
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private setLoading(Z)V
    .locals 0
    .param p1, "loading"    # Z

    .prologue
    .line 1061
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->mLoading:Z

    .line 1062
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 58
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1085
    const-string/jumbo v4, "KKSMS"

    const-string/jumbo v6, "==========Bind View=============="

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1086
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v57

    check-cast v57, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;

    .line 1088
    .local v57, "views":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;
    const/16 v41, 0x0

    .line 1089
    .local v41, "mEntryType":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-static {v4}, Lcom/pccw/mobile/sip/CallLogFragment;->access$900(Lcom/pccw/mobile/sip/CallLogFragment;)I

    move-result v4

    if-nez v4, :cond_2

    .line 1090
    const/16 v41, 0x0

    .line 1094
    :goto_0
    const/4 v4, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    const/4 v4, 0x1

    .line 1095
    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 1096
    .local v5, "number":Ljava/lang/String;
    :goto_1
    const/16 v34, 0x0

    .line 1098
    .local v34, "formattedNumber":Ljava/lang/String;
    const/4 v4, 0x2

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/pccw/mobile/util/FormatUtil;->convertStrToDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v51

    .line 1099
    .local v51, "senttimeDate":Ljava/util/Date;
    const/4 v4, 0x2

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v52

    .line 1100
    .local v52, "senttime":J
    if-eqz v51, :cond_0

    .line 1101
    invoke-virtual/range {v51 .. v51}, Ljava/util/Date;->getTime()J

    move-result-wide v52

    .line 1103
    :cond_0
    const/4 v4, 0x5

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1104
    .local v7, "callerName":Ljava/lang/String;
    const/4 v4, 0x6

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 1105
    .local v8, "callerNumberType":I
    const/4 v4, 0x7

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1107
    .local v9, "callerNumberLabel":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, "_"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v38

    .line 1108
    .local v38, "keyTag":Ljava/lang/String;
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    move-object/from16 v0, v38

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1109
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v38

    invoke-virtual {v4, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setTag(Ljava/lang/Object;)V

    .line 1110
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v38

    invoke-virtual {v4, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setTag(Ljava/lang/Object;)V

    .line 1113
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-static {v4}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1000(Lcom/pccw/mobile/sip/CallLogFragment;)Ljava/util/HashMap;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    .line 1114
    .local v31, "contact":Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;
    const-string/jumbo v4, "group"

    move-object/from16 v0, v41

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string/jumbo v4, "-2"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    const-string/jumbo v4, "-1"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 1116
    if-nez v31, :cond_5

    .line 1119
    sget-object v31, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    .line 1120
    const/4 v4, 0x1

    move-object/from16 v0, v31

    iput-boolean v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->isChecking:Z

    .line 1121
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-static {v4}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1000(Lcom/pccw/mobile/sip/CallLogFragment;)Ljava/util/HashMap;

    move-result-object v4

    move-object/from16 v0, v31

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1126
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v6

    move-object/from16 v0, v57

    iget-object v10, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    move-object/from16 v0, v57

    iget-object v11, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    if-nez v41, :cond_4

    move-object/from16 v0, v57

    iget-object v12, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    :goto_2
    invoke-static/range {v4 .. v12}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1100(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Landroid/widget/ImageView;Lcom/pccw/android/common/widget/TypefacedTextView;Lcom/pccw/android/common/widget/TypefacedTextView;)V

    .line 1174
    :cond_1
    :goto_3
    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    move-object/from16 v44, v0

    .line 1175
    .local v44, "name":Ljava/lang/String;
    move-object/from16 v0, v31

    iget v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->numberType:I

    move/from16 v47, v0

    .line 1176
    .local v47, "numberType":I
    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->label:Ljava/lang/String;

    move-object/from16 v39, v0

    .line 1177
    .local v39, "label":Ljava/lang/String;
    move-object/from16 v0, v31

    iget-wide v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->personId:J

    move-wide/from16 v48, v0

    .line 1179
    .local v48, "personId":J
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1181
    const-string/jumbo v4, "KKSMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "number="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1182
    const-string/jumbo v4, "KKSMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "callerName="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1183
    const-string/jumbo v4, "KKSMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "name="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v31

    iget-object v10, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1184
    const-string/jumbo v4, "KKSMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "numberType="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v47

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1185
    const-string/jumbo v4, "KKSMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "personId="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, v48

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1188
    const-string/jumbo v4, "-2"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1190
    const-string/jumbo v4, "KKSMS"

    const-string/jumbo v6, "private number"

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1191
    const/16 v45, 0x0

    .line 1192
    .local v45, "num":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const v6, 0x7f0701e6

    invoke-virtual {v4, v6}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v45

    .line 1194
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v45

    invoke-virtual {v4, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1195
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setVisibility(I)V

    .line 1196
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1197
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const-string/jumbo v6, ""

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1198
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    const v6, 0x7f0200ce

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1314
    .end local v45    # "num":Ljava/lang/String;
    :goto_4
    move-object/from16 v15, v44

    .line 1315
    .local v15, "contactName":Ljava/lang/String;
    const-string/jumbo v4, "KKSMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "contactName="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1318
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-static {v4}, Lcom/pccw/mobile/sip/CallLogFragment;->access$900(Lcom/pccw/mobile/sip/CallLogFragment;)I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 1529
    :goto_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v26

    const-wide/32 v28, 0xea60

    const/high16 v30, 0x40000

    move-object/from16 v23, p2

    move-wide/from16 v24, v52

    .line 1528
    invoke-static/range {v23 .. v30}, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->getRelativeTimeSpanString(Landroid/content/Context;JJJI)Ljava/lang/CharSequence;

    move-result-object v32

    .line 1532
    .local v32, "dateClause":Ljava/lang/CharSequence;
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->dateView:Landroid/widget/TextView;

    move-object/from16 v0, v32

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1534
    const/4 v4, 0x4

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    move-object/from16 v0, p0

    move-object/from16 v1, v57

    invoke-direct {v0, v1, v4}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->setCallTypeLabel(Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;I)V

    .line 1535
    .end local v32    # "dateClause":Ljava/lang/CharSequence;
    :goto_6
    return-void

    .line 1092
    .end local v5    # "number":Ljava/lang/String;
    .end local v7    # "callerName":Ljava/lang/String;
    .end local v8    # "callerNumberType":I
    .end local v9    # "callerNumberLabel":Ljava/lang/String;
    .end local v15    # "contactName":Ljava/lang/String;
    .end local v31    # "contact":Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;
    .end local v34    # "formattedNumber":Ljava/lang/String;
    .end local v38    # "keyTag":Ljava/lang/String;
    .end local v39    # "label":Ljava/lang/String;
    .end local v44    # "name":Ljava/lang/String;
    .end local v47    # "numberType":I
    .end local v48    # "personId":J
    .end local v51    # "senttimeDate":Ljava/util/Date;
    .end local v52    # "senttime":J
    :cond_2
    const/16 v4, 0xb

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v41

    goto/16 :goto_0

    .line 1095
    :cond_3
    const-string/jumbo v5, "-1"

    goto/16 :goto_1

    .line 1126
    .restart local v5    # "number":Ljava/lang/String;
    .restart local v7    # "callerName":Ljava/lang/String;
    .restart local v8    # "callerNumberType":I
    .restart local v9    # "callerNumberLabel":Ljava/lang/String;
    .restart local v31    # "contact":Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;
    .restart local v34    # "formattedNumber":Ljava/lang/String;
    .restart local v38    # "keyTag":Ljava/lang/String;
    .restart local v51    # "senttimeDate":Ljava/util/Date;
    .restart local v52    # "senttime":J
    :cond_4
    const/4 v12, 0x0

    goto/16 :goto_2

    .line 1129
    :cond_5
    sget-object v4, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    move-object/from16 v0, v31

    if-eq v0, v4, :cond_7

    .line 1149
    move-object/from16 v0, v31

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->formattedNumber:Ljava/lang/String;

    if-nez v4, :cond_6

    .line 1150
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    move-object/from16 v0, v31

    iget-object v6, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->number:Ljava/lang/String;

    invoke-static {v4, v6}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1200(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v31

    iput-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->formattedNumber:Ljava/lang/String;

    .line 1153
    :cond_6
    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->formattedNumber:Ljava/lang/String;

    move-object/from16 v34, v0

    goto/16 :goto_3

    .line 1157
    :cond_7
    sget-object v4, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    move-object/from16 v0, v31

    if-ne v0, v4, :cond_1

    move-object/from16 v0, v31

    iget-boolean v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->isChecking:Z

    if-eqz v4, :cond_1

    .line 1161
    new-instance v36, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;

    invoke-direct/range {v36 .. v36}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;-><init>()V

    .line 1162
    .local v36, "item":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v36

    iput-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->name:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 1163
    if-nez v41, :cond_8

    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    :goto_7
    move-object/from16 v0, v36

    iput-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->label:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 1164
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    move-object/from16 v0, v36

    iput-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->profile:Landroid/widget/ImageView;

    .line 1165
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    move-object/from16 v0, v36

    iput v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->position:I

    .line 1167
    move-object/from16 v37, v5

    .line 1168
    .local v37, "key":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    move-object/from16 v0, v37

    move-object/from16 v1, v36

    invoke-static {v4, v0, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1300(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;)V

    goto/16 :goto_3

    .line 1163
    .end local v37    # "key":Ljava/lang/String;
    :cond_8
    const/4 v4, 0x0

    goto :goto_7

    .line 1171
    .end local v36    # "item":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;
    :cond_9
    sget-object v31, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    goto/16 :goto_3

    .line 1200
    .restart local v39    # "label":Ljava/lang/String;
    .restart local v44    # "name":Ljava/lang/String;
    .restart local v47    # "numberType":I
    .restart local v48    # "personId":J
    :cond_a
    const-string/jumbo v4, "-1"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 1202
    const-string/jumbo v4, "KKSMS"

    const-string/jumbo v6, "unknown number"

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1203
    const/16 v45, 0x0

    .line 1204
    .restart local v45    # "num":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const v6, 0x7f07022b

    invoke-virtual {v4, v6}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v45

    .line 1206
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v45

    invoke-virtual {v4, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1207
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setVisibility(I)V

    .line 1208
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1209
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const-string/jumbo v6, ""

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1210
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    const v6, 0x7f0200ce

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 1212
    .end local v45    # "num":Ljava/lang/String;
    :cond_b
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 1213
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const v10, 0x7f070054

    invoke-virtual {v6, v10}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1214
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v6}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v10, 0x7f0b0034

    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setTextColor(I)V

    .line 1215
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 1216
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const v10, 0x7f07022b

    invoke-virtual {v6, v10}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1217
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setVisibility(I)V

    .line 1218
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_4

    .line 1221
    :cond_c
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_d

    move-object/from16 v0, v31

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_14

    .line 1222
    :cond_d
    const-string/jumbo v4, "KKSMS"

    const-string/jumbo v6, "contact or IM number"

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1228
    move-object/from16 v0, v57

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    move-object/from16 v42, v0

    .line 1229
    .local v42, "mImageView":Landroid/widget/ImageView;
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v42

    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1230
    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    move-object/from16 v54, v0

    .line 1245
    .local v54, "thumbnailUri":Ljava/lang/String;
    invoke-static/range {v44 .. v44}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_e

    .line 1246
    move-object/from16 v44, v7

    .line 1247
    move/from16 v47, v8

    .line 1248
    move-object/from16 v39, v9

    .line 1251
    :cond_e
    if-eqz v41, :cond_11

    .line 1253
    const-string/jumbo v4, "group"

    move-object/from16 v0, v41

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 1254
    invoke-static/range {v44 .. v44}, Lcom/pccw/sms/util/SMSFormatUtil;->convertSplittingStringToSortedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v50

    .line 1255
    .local v50, "recipientsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v4, "KKSMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CHAT_TYPE_GROUP setText="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v10

    move-object/from16 v0, v50

    invoke-static {v0, v10}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getMultipleSMSProfileTitle(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1256
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v6

    move-object/from16 v0, v50

    invoke-static {v0, v6}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getMultipleSMSProfileTitle(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1273
    .end local v50    # "recipientsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_f
    :goto_8
    move-object/from16 v0, p0

    move-object/from16 v1, v54

    move-object/from16 v2, v41

    move-object/from16 v3, v42

    invoke-direct {v0, v1, v2, v3}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->setImageViewPhoto(Ljava/lang/String;Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 1286
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-static {v4, v5}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1200(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 1287
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1289
    if-nez v47, :cond_12

    move-object/from16 v46, v39

    .line 1292
    .local v46, "numberLabel":Ljava/lang/CharSequence;
    :goto_9
    invoke-static/range {v46 .. v46}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_13

    .line 1293
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v46

    invoke-virtual {v4, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1294
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 1258
    .end local v46    # "numberLabel":Ljava/lang/CharSequence;
    :cond_10
    const-string/jumbo v4, "KKSMS"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "CHAT_TYPE_INDIVIDUAL setText="

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v44

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1259
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v44

    invoke-virtual {v4, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1260
    invoke-static/range {v54 .. v54}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 1261
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->getUserContactPhotoURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    goto :goto_8

    .line 1266
    :cond_11
    const-string/jumbo v4, "KKSMS"

    const-string/jumbo v6, "mEntryType=null"

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1267
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v44

    invoke-virtual {v4, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1268
    invoke-static/range {v54 .. v54}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 1269
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->getUserContactPhotoURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    goto/16 :goto_8

    .line 1289
    :cond_12
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    .line 1290
    invoke-static/range {v47 .. v47}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabelResource(I)I

    move-result v6

    invoke-virtual {v4, v6}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v46

    goto :goto_9

    .line 1296
    .restart local v46    # "numberLabel":Ljava/lang/CharSequence;
    :cond_13
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setVisibility(I)V

    goto/16 :goto_4

    .line 1300
    .end local v42    # "mImageView":Landroid/widget/ImageView;
    .end local v46    # "numberLabel":Ljava/lang/CharSequence;
    .end local v54    # "thumbnailUri":Ljava/lang/String;
    :cond_14
    const-string/jumbo v4, "KKSMS"

    const-string/jumbo v6, "non contact number"

    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1303
    const/16 v45, 0x0

    .line 1304
    .restart local v45    # "num":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-static {v4, v5}, Lcom/pccw/mobile/sip/CallLogFragment;->access$1200(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    .line 1306
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    move-object/from16 v0, v45

    invoke-virtual {v4, v0}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1307
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, v45

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1308
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    const/16 v6, 0x8

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setVisibility(I)V

    .line 1309
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    const v6, 0x7f0200ce

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 1320
    .end local v45    # "num":Ljava/lang/String;
    .restart local v15    # "contactName":Ljava/lang/String;
    :pswitch_0
    const/16 v4, 0xc

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v55

    .line 1321
    .local v55, "unread":I
    if-lez v55, :cond_17

    .line 1322
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgLayout:Landroid/view/View;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1323
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgNum:Landroid/widget/TextView;

    invoke-static/range {v55 .. v55}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1329
    :goto_a
    const/16 v4, 0xe

    :try_start_0
    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v43

    .line 1330
    .local v43, "messageType":Ljava/lang/String;
    if-eqz v43, :cond_15

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_TEXT:Ljava/lang/String;

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 1331
    :cond_15
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_18

    const-string/jumbo v40, ""

    .line 1332
    .local v40, "lastMsg":Ljava/lang/String;
    :goto_b
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1349
    .end local v40    # "lastMsg":Ljava/lang/String;
    :cond_16
    :goto_c
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    const-string/jumbo v6, ""

    invoke-virtual {v4, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setText(Ljava/lang/CharSequence;)V

    .line 1352
    const/16 v4, 0xb

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 1353
    .local v12, "crEntrytype":Ljava/lang/String;
    const/16 v4, 0xa

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 1356
    .local v13, "crChatid":Ljava/lang/String;
    new-instance v10, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;

    move-object/from16 v11, p0

    move-object v14, v5

    invoke-direct/range {v10 .. v15}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$1;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1382
    const/4 v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/View;->setLongClickable(Z)V

    .line 1383
    new-instance v16, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$2;

    move-object/from16 v17, p0

    move-object/from16 v18, v12

    move-object/from16 v19, v5

    move-object/from16 v20, v13

    move-object/from16 v21, v15

    invoke-direct/range {v16 .. v21}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$2;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_5

    .line 1325
    .end local v12    # "crEntrytype":Ljava/lang/String;
    .end local v13    # "crChatid":Ljava/lang/String;
    .end local v43    # "messageType":Ljava/lang/String;
    :cond_17
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgLayout:Landroid/view/View;

    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    goto :goto_a

    .line 1331
    .restart local v43    # "messageType":Ljava/lang/String;
    :cond_18
    const/16 v4, 0x9

    :try_start_1
    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    goto :goto_b

    .line 1333
    :cond_19
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_LOCATION:Ljava/lang/String;

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 1334
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const v10, 0x7f0701e9

    invoke-virtual {v6, v10}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_c

    .line 1344
    .end local v43    # "messageType":Ljava/lang/String;
    :catch_0
    move-exception v33

    .line 1345
    .local v33, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual/range {v33 .. v33}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto/16 :goto_6

    .line 1335
    .end local v33    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v43    # "messageType":Ljava/lang/String;
    :cond_1a
    :try_start_2
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_VCARD:Ljava/lang/String;

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 1336
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const v10, 0x7f0701e8

    invoke-virtual {v6, v10}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_c

    .line 1337
    :cond_1b
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_ADD:Ljava/lang/String;

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1c

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_DELETE:Ljava/lang/String;

    .line 1338
    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 1340
    :cond_1c
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1d

    const-string/jumbo v40, ""

    .line 1341
    .restart local v40    # "lastMsg":Ljava/lang/String;
    :goto_d
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v40

    move-object/from16 v3, v43

    invoke-direct {v0, v1, v2, v3}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->parseGroupSystemMessage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    .line 1342
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_c

    .line 1340
    .end local v40    # "lastMsg":Ljava/lang/String;
    :cond_1d
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v40

    goto :goto_d

    .line 1399
    .end local v43    # "messageType":Ljava/lang/String;
    .end local v55    # "unread":I
    :pswitch_1
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgLayout:Landroid/view/View;

    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1401
    new-instance v4, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5, v15}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$3;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1419
    const/4 v4, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/View;->setLongClickable(Z)V

    goto/16 :goto_5

    .line 1424
    :pswitch_2
    const/16 v4, 0xe

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v43

    .line 1425
    .restart local v43    # "messageType":Ljava/lang/String;
    if-eqz v43, :cond_1e

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_TEXT:Ljava/lang/String;

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1e

    const-string/jumbo v4, "call"

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_23

    .line 1426
    :cond_1e
    const-string/jumbo v40, ""

    .line 1427
    .restart local v40    # "lastMsg":Ljava/lang/String;
    const/16 v4, 0xb

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "individual"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_21

    .line 1428
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_20

    move-object/from16 v40, v5

    .line 1432
    :goto_e
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1445
    .end local v40    # "lastMsg":Ljava/lang/String;
    :cond_1f
    :goto_f
    const/16 v4, 0xc

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v56

    .line 1446
    .local v56, "unreadCount":I
    if-lez v56, :cond_28

    .line 1447
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgLayout:Landroid/view/View;

    const/4 v6, 0x0

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1448
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgNum:Landroid/widget/TextView;

    invoke-static/range {v56 .. v56}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1453
    :goto_10
    const/16 v4, 0xd

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v35

    .line 1454
    .local v35, "isIMUser":Ljava/lang/String;
    const-string/jumbo v4, "Y"

    move-object/from16 v0, v35

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_29

    .line 1455
    const/16 v4, 0xa

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 1456
    .local v18, "chatid":Ljava/lang/String;
    const/16 v4, 0xb

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v19

    .line 1457
    .local v19, "entryType":Ljava/lang/String;
    const/4 v4, 0x5

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 1458
    .local v22, "nickname":Ljava/lang/String;
    const/16 v4, 0x8

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v21

    .line 1459
    .local v21, "chatnumber":Ljava/lang/String;
    new-instance v16, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;

    move-object/from16 v17, p0

    move-object/from16 v20, v5

    move-object/from16 v23, v15

    invoke-direct/range {v16 .. v23}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1487
    const/4 v4, 0x1

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/View;->setLongClickable(Z)V

    .line 1488
    new-instance v23, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;

    move-object/from16 v24, p0

    move-object/from16 v25, v5

    move-object/from16 v26, v21

    move-object/from16 v27, v18

    move-object/from16 v28, v15

    move-object/from16 v29, v19

    invoke-direct/range {v23 .. v29}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$5;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_5

    .line 1428
    .end local v18    # "chatid":Ljava/lang/String;
    .end local v19    # "entryType":Ljava/lang/String;
    .end local v21    # "chatnumber":Ljava/lang/String;
    .end local v22    # "nickname":Ljava/lang/String;
    .end local v35    # "isIMUser":Ljava/lang/String;
    .end local v56    # "unreadCount":I
    .restart local v40    # "lastMsg":Ljava/lang/String;
    :cond_20
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    goto/16 :goto_e

    .line 1430
    :cond_21
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_22

    const-string/jumbo v40, ""

    :goto_11
    goto/16 :goto_e

    :cond_22
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    goto :goto_11

    .line 1433
    .end local v40    # "lastMsg":Ljava/lang/String;
    :cond_23
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_LOCATION:Ljava/lang/String;

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 1434
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const v10, 0x7f0701e9

    invoke-virtual {v6, v10}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_f

    .line 1435
    :cond_24
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_VCARD:Ljava/lang/String;

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_25

    .line 1436
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const v10, 0x7f0701e8

    invoke-virtual {v6, v10}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_f

    .line 1437
    :cond_25
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_ADD:Ljava/lang/String;

    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_26

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_DELETE:Ljava/lang/String;

    .line 1438
    move-object/from16 v0, v43

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 1440
    :cond_26
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_27

    const-string/jumbo v40, ""

    .line 1441
    .restart local v40    # "lastMsg":Ljava/lang/String;
    :goto_12
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v40

    move-object/from16 v3, v43

    invoke-direct {v0, v1, v2, v3}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->parseGroupSystemMessage(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    .line 1442
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_f

    .line 1440
    .end local v40    # "lastMsg":Ljava/lang/String;
    :cond_27
    const/16 v4, 0x9

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    goto :goto_12

    .line 1450
    .restart local v56    # "unreadCount":I
    :cond_28
    move-object/from16 v0, v57

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgLayout:Landroid/view/View;

    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_10

    .line 1501
    .restart local v35    # "isIMUser":Ljava/lang/String;
    :cond_29
    new-instance v4, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$6;

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5, v15}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$6;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1521
    const/4 v4, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/View;->setLongClickable(Z)V

    goto/16 :goto_5

    .line 1318
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public clearImgCache()V
    .locals 1

    .prologue
    .line 1057
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

    invoke-virtual {v0}, Lcom/pccw/android/common/widget/ImageLoader;->clearCache()V

    .line 1058
    return-void
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1681
    invoke-super {p0, p1}, Landroid/widget/ResourceCursorAdapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 1686
    const/4 v0, 0x2

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 1066
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->mLoading:Z

    if-eqz v0, :cond_0

    .line 1068
    const/4 v0, 0x0

    .line 1070
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Landroid/widget/ResourceCursorAdapter;->isEmpty()Z

    move-result v0

    goto :goto_0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "cursor"    # Landroid/database/Cursor;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 1633
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ResourceCursorAdapter;->newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1635
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$1;)V

    .line 1636
    .local v1, "views":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;
    const v2, 0x7f0e00ff

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    .line 1637
    const v2, 0x7f0e0101

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->dateView:Landroid/widget/TextView;

    .line 1638
    const v2, 0x7f0e00d7

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/TypefacedTextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 1639
    const v2, 0x7f0e00fe

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/TypefacedTextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->line1View:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 1640
    const v2, 0x7f0e0100

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    .line 1641
    const v2, 0x7f0e00fb

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    .line 1642
    const v2, 0x7f0e00fc

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgLayout:Landroid/view/View;

    .line 1643
    const v2, 0x7f0e00fd

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;->unreadMsgNum:Landroid/widget/TextView;

    .line 1644
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1645
    return-object v0
.end method

.method protected onContentChanged()V
    .locals 0

    .prologue
    .line 1081
    return-void
.end method

.method public updateProfileHead(Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 2
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "imgPath"    # Ljava/lang/String;

    .prologue
    .line 1690
    const-string/jumbo v0, "KKIM"

    const-string/jumbo v1, "up updateProfileHead"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1691
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

    const/4 v1, -0x1

    invoke-virtual {v0, p2, p1, v1}, Lcom/pccw/android/common/widget/ImageLoader;->loadBitmap(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 1692
    return-void
.end method
