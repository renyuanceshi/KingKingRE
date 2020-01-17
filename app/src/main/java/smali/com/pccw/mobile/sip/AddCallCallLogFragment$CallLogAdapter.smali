.class Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;
.super Landroid/widget/ResourceCursorAdapter;
.source "AddCallCallLogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/AddCallCallLogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CallLogAdapter"
.end annotation


# static fields
.field private static final REDRAW:I = 0x1

.field private static final START_THREAD:I = 0x2


# instance fields
.field contactHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mCallerIdThread:Ljava/lang/Thread;

.field private volatile mDone:Z

.field private mFirst:Z

.field private mHandler:Landroid/os/Handler;

.field private mLoading:Z

.field mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private final mRequests:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment;Landroid/content/Context;ILandroid/database/Cursor;Z)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "layout"    # I
    .param p4, "c"    # Landroid/database/Cursor;
    .param p5, "autoRequery"    # Z

    .prologue
    .line 425
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    .line 426
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/widget/ResourceCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;Z)V

    .line 416
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mLoading:Z

    .line 442
    new-instance v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$1;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$1;-><init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mHandler:Landroid/os/Handler;

    .line 428
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->contactHashMap:Ljava/util/HashMap;

    .line 429
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    .line 430
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 431
    return-void
.end method

.method private enqueueRequest(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)V
    .locals 3
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "numberType"    # I
    .param p5, "numberLabel"    # Ljava/lang/String;

    .prologue
    .line 558
    new-instance v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;-><init>()V

    .line 559
    .local v0, "ciq":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;
    iput-object p1, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    .line 560
    iput p2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->position:I

    .line 561
    iput-object p3, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->name:Ljava/lang/String;

    .line 562
    iput p4, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->numberType:I

    .line 563
    iput-object p5, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->numberLabel:Ljava/lang/String;

    .line 564
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    monitor-enter v2

    .line 565
    :try_start_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 566
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 567
    monitor-exit v2

    .line 568
    return-void

    .line 567
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getUserContactPhoto(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1
    .param p1, "thumbnailUri"    # Ljava/lang/String;
    .param p2, "contactId"    # Ljava/lang/String;
    .param p3, "norlNum"    # Ljava/lang/String;

    .prologue
    .line 862
    const/4 v0, 0x0

    .line 864
    .local v0, "bm":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_0

    .line 865
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 868
    :cond_0
    return-object v0
.end method

.method private loadContactPhotoThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p1, "photoData"    # Ljava/lang/String;

    .prologue
    .line 872
    const/4 v2, 0x0

    .line 875
    .local v2, "is":Ljava/io/InputStream;
    const/16 v4, 0xb

    :try_start_0
    invoke-static {v4}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 876
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 883
    .local v3, "thumbUri":Landroid/net/Uri;
    :goto_0
    iget-object v4, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 885
    if-eqz v2, :cond_2

    .line 886
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 891
    if-eqz v2, :cond_0

    .line 893
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 899
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_0
    :goto_1
    return-object v4

    .line 878
    :cond_1
    :try_start_2
    sget-object v4, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 880
    .local v0, "contactUri":Landroid/net/Uri;
    const-string/jumbo v4, "photo"

    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .restart local v3    # "thumbUri":Landroid/net/Uri;
    goto :goto_0

    .line 894
    .end local v0    # "contactUri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 895
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 891
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    if-eqz v2, :cond_3

    .line 893
    :try_start_3
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 899
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :cond_3
    :goto_2
    const/4 v4, 0x0

    goto :goto_1

    .line 894
    .restart local v3    # "thumbUri":Landroid/net/Uri;
    :catch_1
    move-exception v1

    .line 895
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 888
    .end local v1    # "e":Ljava/io/IOException;
    .end local v3    # "thumbUri":Landroid/net/Uri;
    :catch_2
    move-exception v1

    .line 889
    .local v1, "e":Ljava/io/FileNotFoundException;
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 891
    if-eqz v2, :cond_3

    .line 893
    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    .line 894
    :catch_3
    move-exception v1

    .line 895
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 891
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    if-eqz v2, :cond_4

    .line 893
    :try_start_6
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 896
    :cond_4
    :goto_3
    throw v4

    .line 894
    :catch_4
    move-exception v1

    .line 895
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method private queryContactInfo(Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;)V
    .locals 10
    .param p1, "ciq"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x1

    .line 573
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->contactHashMap:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    .line 574
    .local v6, "contact":Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;
    if-eqz v6, :cond_3

    sget-object v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    if-eq v6, v0, :cond_3

    .line 575
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    monitor-enter v2

    .line 576
    :try_start_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 577
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 579
    :cond_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 631
    :cond_1
    :goto_0
    if-eqz v6, :cond_2

    .line 632
    invoke-direct {p0, p1, v6}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->updateCallLog(Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;)V

    .line 634
    :cond_2
    return-void

    .line 579
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 580
    :cond_3
    iget-object v0, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 581
    sget-object v0, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    iget-object v2, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    .line 582
    invoke-static {v2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 581
    invoke-static {v0, v2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 583
    .local v1, "uri":Landroid/net/Uri;
    invoke-static {}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->access$000()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/16 v2, 0xb

    .line 585
    invoke-static {v2}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v2

    if-eqz v2, :cond_7

    sget-object v2, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->PHONES_PROJECTION:[Ljava/lang/String;

    :goto_1
    move-object v4, v3

    move-object v5, v3

    .line 583
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 587
    .local v8, "phonesCursor":Landroid/database/Cursor;
    if-eqz v8, :cond_1

    .line 588
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 589
    new-instance v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    .end local v6    # "contact":Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;
    invoke-direct {v6}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;-><init>()V

    .line 590
    .restart local v6    # "contact":Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->personId:J

    .line 591
    invoke-interface {v8, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->name:Ljava/lang/String;

    .line 592
    const/4 v0, 0x2

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->type:I

    .line 593
    const/4 v0, 0x3

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->label:Ljava/lang/String;

    .line 594
    const/4 v0, 0x4

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->number:Ljava/lang/String;

    .line 596
    iget-object v7, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    .line 597
    .local v7, "oldContactUri":Ljava/lang/String;
    const/4 v0, 0x5

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    .line 598
    if-nez v7, :cond_4

    .line 599
    const-string/jumbo v7, ""

    .line 610
    :cond_4
    iput-object v3, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->formattedNumber:Ljava/lang/String;

    .line 612
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->contactHashMap:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v0, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 615
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    monitor-enter v2

    .line 616
    :try_start_2
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 619
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 626
    :cond_5
    :goto_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 628
    .end local v7    # "oldContactUri":Ljava/lang/String;
    :cond_6
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 585
    .end local v8    # "phonesCursor":Landroid/database/Cursor;
    :cond_7
    sget-object v2, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->PHONES_PROJECTION_LOWER_API11:[Ljava/lang/String;

    goto :goto_1

    .line 620
    .restart local v7    # "oldContactUri":Ljava/lang/String;
    .restart local v8    # "phonesCursor":Landroid/database/Cursor;
    :cond_8
    :try_start_3
    iget-object v0, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, v6, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    .line 621
    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 624
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_2

    .line 626
    :catchall_1
    move-exception v0

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method private updateCallLog(Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;)V
    .locals 5
    .param p1, "ciq"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;
    .param p2, "contact"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    .prologue
    .line 529
    iget-object v1, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->name:Ljava/lang/String;

    iget-object v2, p2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->numberLabel:Ljava/lang/String;

    iget-object v2, p2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->label:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->numberType:I

    iget v2, p2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->type:I

    if-ne v1, v2, :cond_0

    .line 554
    :goto_0
    return-void

    .line 533
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    .line 534
    .local v0, "values":Landroid/content/ContentValues;
    const-string/jumbo v1, "name"

    iget-object v2, p2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 535
    const-string/jumbo v1, "numbertype"

    iget v2, p2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->type:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 536
    const-string/jumbo v1, "numberlabel"

    iget-object v2, p2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->label:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 542
    :try_start_0
    invoke-static {}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->access$000()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "number=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDiskIOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/database/sqlite/SQLiteDatabaseCorruptException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 544
    :catch_0
    move-exception v1

    goto :goto_0

    .line 550
    :catch_1
    move-exception v1

    goto :goto_0

    .line 547
    :catch_2
    move-exception v1

    goto :goto_0
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 29
    .param p1, "view"    # Landroid/view/View;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 638
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;

    .line 640
    .local v28, "views":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;
    const/4 v2, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    .line 641
    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 642
    .local v3, "number":Ljava/lang/String;
    :goto_0
    const/16 v20, 0x0

    .line 643
    .local v20, "formattedNumber":Ljava/lang/String;
    const/4 v2, 0x5

    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 644
    .local v5, "callerName":Ljava/lang/String;
    const/4 v2, 0x6

    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 645
    .local v6, "callerNumberType":I
    const/4 v2, 0x7

    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 646
    .local v7, "callerNumberLabel":Ljava/lang/String;
    const/16 v18, 0x0

    .line 651
    .local v18, "contactPhoto":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->contactHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    .line 652
    .local v8, "contact":Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;
    if-nez v8, :cond_4

    .line 657
    sget-object v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    .line 658
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->contactHashMap:Ljava/util/HashMap;

    invoke-virtual {v2, v3, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 659
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->enqueueRequest(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)V

    .line 682
    :cond_0
    :goto_1
    iget-object v0, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->name:Ljava/lang/String;

    move-object/from16 v22, v0

    .line 683
    .local v22, "name":Ljava/lang/String;
    iget v0, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->type:I

    move/from16 v23, v0

    .line 684
    .local v23, "ntype":I
    iget-object v0, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->label:Ljava/lang/String;

    move-object/from16 v21, v0

    .line 685
    .local v21, "label":Ljava/lang/String;
    iget-wide v0, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->personId:J

    move-wide/from16 v26, v0

    .line 689
    .local v26, "personId":J
    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 690
    move-object/from16 v22, v5

    .line 691
    move/from16 v23, v6

    .line 692
    move-object/from16 v21, v7

    .line 695
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->access$100(Lcom/pccw/mobile/sip/AddCallCallLogFragment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 699
    :cond_1
    const-string/jumbo v2, "-2"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 701
    const/16 v24, 0x0

    .line 702
    .local v24, "num":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    const v4, 0x7f0701e6

    invoke-virtual {v2, v4}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 704
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->line1View:Landroid/widget/TextView;

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->labelView:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 706
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 707
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 708
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    const v4, 0x7f0200ce

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 768
    .end local v24    # "num":Ljava/lang/String;
    :goto_2
    move-object/from16 v17, v22

    .line 771
    .local v17, "contactName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    invoke-static {v2}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->access$200(Lcom/pccw/mobile/sip/AddCallCallLogFragment;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 796
    :goto_3
    const/4 v2, 0x2

    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    .line 799
    .local v10, "date":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    const-wide/32 v14, 0xea60

    const/high16 v16, 0x40000

    move-object/from16 v9, p2

    .line 798
    invoke-static/range {v9 .. v16}, Lcom/pccw/mobile/sip/util/RelativeDateUtils;->getRelativeTimeSpanString(Landroid/content/Context;JJJI)Ljava/lang/CharSequence;

    move-result-object v19

    .line 802
    .local v19, "dateClause":Ljava/lang/CharSequence;
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->dateView:Landroid/widget/TextView;

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 806
    const/4 v2, 0x4

    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 822
    :goto_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    if-nez v2, :cond_2

    .line 823
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mFirst:Z

    .line 824
    move-object/from16 v0, p0

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 825
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v2, v0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 827
    :cond_2
    return-void

    .line 641
    .end local v3    # "number":Ljava/lang/String;
    .end local v5    # "callerName":Ljava/lang/String;
    .end local v6    # "callerNumberType":I
    .end local v7    # "callerNumberLabel":Ljava/lang/String;
    .end local v8    # "contact":Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;
    .end local v10    # "date":J
    .end local v17    # "contactName":Ljava/lang/String;
    .end local v18    # "contactPhoto":Landroid/graphics/Bitmap;
    .end local v19    # "dateClause":Ljava/lang/CharSequence;
    .end local v20    # "formattedNumber":Ljava/lang/String;
    .end local v21    # "label":Ljava/lang/String;
    .end local v22    # "name":Ljava/lang/String;
    .end local v23    # "ntype":I
    .end local v26    # "personId":J
    :cond_3
    const-string/jumbo v3, "-1"

    goto/16 :goto_0

    .line 661
    .restart local v3    # "number":Ljava/lang/String;
    .restart local v5    # "callerName":Ljava/lang/String;
    .restart local v6    # "callerNumberType":I
    .restart local v7    # "callerNumberLabel":Ljava/lang/String;
    .restart local v8    # "contact":Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;
    .restart local v18    # "contactPhoto":Landroid/graphics/Bitmap;
    .restart local v20    # "formattedNumber":Ljava/lang/String;
    :cond_4
    sget-object v2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;

    if-eq v8, v2, :cond_0

    .line 667
    iget-object v2, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget v2, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->type:I

    if-ne v2, v6, :cond_5

    iget-object v2, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->label:Ljava/lang/String;

    .line 668
    invoke-static {v2, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 670
    :cond_5
    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    move-object/from16 v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->enqueueRequest(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;)V

    .line 676
    :cond_6
    iget-object v2, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->formattedNumber:Ljava/lang/String;

    if-nez v2, :cond_7

    .line 677
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    iget-object v4, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->number:Ljava/lang/String;

    invoke-static {v2, v4}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->access$100(Lcom/pccw/mobile/sip/AddCallCallLogFragment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->formattedNumber:Ljava/lang/String;

    .line 679
    :cond_7
    iget-object v0, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->formattedNumber:Ljava/lang/String;

    move-object/from16 v20, v0

    goto/16 :goto_1

    .line 709
    .restart local v21    # "label":Ljava/lang/String;
    .restart local v22    # "name":Ljava/lang/String;
    .restart local v23    # "ntype":I
    .restart local v26    # "personId":J
    :cond_8
    const-string/jumbo v2, "-1"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 711
    const/16 v24, 0x0

    .line 712
    .restart local v24    # "num":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    const v4, 0x7f07022b

    invoke-virtual {v2, v4}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 714
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->line1View:Landroid/widget/TextView;

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 715
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->labelView:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 716
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 717
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 718
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    const v4, 0x7f0200ce

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_2

    .line 719
    .end local v24    # "num":Ljava/lang/String;
    :cond_9
    invoke-static/range {v22 .. v22}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 721
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->line1View:Landroid/widget/TextView;

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 722
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->labelView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 725
    iget-object v2, v8, Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    .line 726
    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 725
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v4, v9}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->getUserContactPhoto(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v18

    .line 731
    if-eqz v18, :cond_a

    .line 732
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 737
    :goto_5
    if-nez v23, :cond_b

    move-object/from16 v25, v21

    .line 742
    .local v25, "numberLabel":Ljava/lang/CharSequence;
    :goto_6
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 743
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 744
    invoke-static/range {v25 .. v25}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 745
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->labelView:Landroid/widget/TextView;

    move-object/from16 v0, v25

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 746
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->labelView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 734
    .end local v25    # "numberLabel":Ljava/lang/CharSequence;
    :cond_a
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    const v4, 0x7f0200ce

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_5

    .line 737
    :cond_b
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    .line 739
    invoke-static/range {v23 .. v23}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabelResource(I)I

    move-result v4

    .line 738
    invoke-virtual {v2, v4}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v25

    goto :goto_6

    .line 748
    .restart local v25    # "numberLabel":Ljava/lang/CharSequence;
    :cond_c
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->labelView:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_2

    .line 752
    .end local v25    # "numberLabel":Ljava/lang/CharSequence;
    :cond_d
    const/16 v24, 0x0

    .line 753
    .restart local v24    # "num":Ljava/lang/String;
    const-string/jumbo v2, "-1"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 754
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    const v4, 0x7f07022b

    invoke-virtual {v2, v4}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 761
    :goto_7
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->line1View:Landroid/widget/TextView;

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 762
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->labelView:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 763
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 764
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 765
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    const v4, 0x7f0200ce

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_2

    .line 755
    :cond_e
    const-string/jumbo v2, "-2"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 756
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    const v4, 0x7f0701e6

    invoke-virtual {v2, v4}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v24

    goto :goto_7

    .line 759
    :cond_f
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    invoke-static {v2, v3}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->access$100(Lcom/pccw/mobile/sip/AddCallCallLogFragment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    goto :goto_7

    .line 773
    .end local v24    # "num":Ljava/lang/String;
    .restart local v17    # "contactName":Ljava/lang/String;
    :pswitch_0
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->unreadMsgLayout:Landroid/view/View;

    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 775
    new-instance v2, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;

    move-object/from16 v0, p0

    invoke-direct {v2, v0, v3}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter$2;-><init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;Ljava/lang/String;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_3

    .line 808
    .restart local v10    # "date":J
    .restart local v19    # "dateClause":Ljava/lang/CharSequence;
    :sswitch_0
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const v4, 0x7f02043f

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 811
    :sswitch_1
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const v4, 0x7f020448

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 814
    :sswitch_2
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const v4, 0x7f020434

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 817
    :sswitch_3
    move-object/from16 v0, v28

    iget-object v2, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    const v4, 0x7f02043e

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 771
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch

    .line 806
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_2
        0x2 -> :sswitch_1
        0x3 -> :sswitch_0
        0x15 -> :sswitch_3
    .end sparse-switch
.end method

.method public clearCache()V
    .locals 2

    .prologue
    .line 484
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->contactHashMap:Ljava/util/HashMap;

    monitor-enter v1

    .line 485
    :try_start_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->contactHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 486
    monitor-exit v1

    .line 487
    return-void

    .line 486
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 853
    invoke-super {p0, p1}, Landroid/widget/ResourceCursorAdapter;->getItemViewType(I)I

    move-result v0

    return v0
.end method

.method public getViewTypeCount()I
    .locals 1

    .prologue
    .line 858
    const/4 v0, 0x2

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 462
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mLoading:Z

    if-eqz v0, :cond_0

    .line 464
    const/4 v0, 0x0

    .line 466
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
    .line 831
    invoke-super {p0, p1, p2, p3}, Landroid/widget/ResourceCursorAdapter;->newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 834
    .local v0, "view":Landroid/view/View;
    new-instance v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;

    invoke-direct {v1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;-><init>()V

    .line 837
    .local v1, "views":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;
    const v2, 0x7f0e00ff

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->calltypeimageView:Landroid/widget/ImageView;

    .line 838
    const v2, 0x7f0e0101

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->dateView:Landroid/widget/TextView;

    .line 839
    const v2, 0x7f0e00d7

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->labelView:Landroid/widget/TextView;

    .line 840
    const v2, 0x7f0e00fe

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->line1View:Landroid/widget/TextView;

    .line 841
    const v2, 0x7f0e0100

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->numberView:Landroid/widget/TextView;

    .line 842
    const v2, 0x7f0e00fb

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->photoView:Landroid/widget/ImageView;

    .line 843
    const v2, 0x7f0e00fc

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->unreadMsgLayout:Landroid/view/View;

    .line 844
    const v2, 0x7f0e00fd

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;->unreadMsgNum:Landroid/widget/TextView;

    .line 845
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 847
    return-object v0
.end method

.method protected onContentChanged()V
    .locals 0

    .prologue
    .line 496
    return-void
.end method

.method public onPreDraw()Z
    .locals 4

    .prologue
    .line 435
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mFirst:Z

    if-eqz v0, :cond_0

    .line 436
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 437
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mFirst:Z

    .line 439
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public run()V
    .locals 8

    .prologue
    .line 503
    :cond_0
    :goto_0
    iget-boolean v3, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mDone:Z

    if-nez v3, :cond_2

    .line 504
    const/4 v2, 0x0

    .line 505
    .local v2, "ciq":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;
    iget-object v4, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    monitor-enter v4

    .line 506
    :try_start_0
    iget-object v3, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 507
    iget-object v3, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;

    move-object v2, v0

    .line 515
    :goto_1
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 516
    if-eqz v2, :cond_0

    .line 517
    invoke-direct {p0, v2}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->queryContactInfo(Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;)V

    goto :goto_0

    .line 510
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mRequests:Ljava/util/LinkedList;

    const-wide/16 v6, 0x3e8

    invoke-virtual {v3, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 511
    :catch_0
    move-exception v3

    goto :goto_1

    .line 515
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 520
    .end local v2    # "ciq":Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;
    :cond_2
    return-void
.end method

.method setLoading(Z)V
    .locals 0
    .param p1, "loading"    # Z

    .prologue
    .line 457
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mLoading:Z

    .line 458
    return-void
.end method

.method public startRequestProcessing()V
    .locals 2

    .prologue
    .line 471
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mDone:Z

    .line 472
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mCallerIdThread:Ljava/lang/Thread;

    .line 473
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mCallerIdThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 474
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mCallerIdThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 475
    return-void
.end method

.method public stopRequestProcessing()V
    .locals 1

    .prologue
    .line 478
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mDone:Z

    .line 479
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mCallerIdThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 480
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mCallerIdThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 481
    :cond_0
    return-void
.end method
