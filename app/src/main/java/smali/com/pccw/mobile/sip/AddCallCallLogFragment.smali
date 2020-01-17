.class public Lcom/pccw/mobile/sip/AddCallCallLogFragment;
.super Landroid/support/v4/app/Fragment;
.source "AddCallCallLogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;,
        Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;,
        Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallerInfoQuery;,
        Lcom/pccw/mobile/sip/AddCallCallLogFragment$ContactInfo;,
        Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogItemViews;
    }
.end annotation


# static fields
.field static final CALLER_NAME_COLUMN_INDEX:I = 0x5

.field static final CALLER_NUMBERLABEL_COLUMN_INDEX:I = 0x7

.field static final CALLER_NUMBERTYPE_COLUMN_INDEX:I = 0x6

.field static final CALL_LOG_PROJECTION:[Ljava/lang/String;

.field static final CALL_TYPE_COLUMN_INDEX:I = 0x4

.field static final DATE_COLUMN_INDEX:I = 0x2

.field static final DURATION_COLUMN_INDEX:I = 0x3

.field private static final FORMATTING_TYPE_INVALID:I = -0x1

.field static final ID_COLUMN_INDEX:I = 0x0

.field static final LABEL_COLUMN_INDEX:I = 0x3

.field static final MATCHED_NUMBER_COLUMN_INDEX:I = 0x4

.field static final NAME_COLUMN_INDEX:I = 0x1

.field static final NUMBER_COLUMN_INDEX:I = 0x1

.field static final PERSON_ID_COLUMN_INDEX:I = 0x0

.field static final PHONES_PROJECTION:[Ljava/lang/String;

.field static final PHONES_PROJECTION_LOWER_API11:[Ljava/lang/String;

.field static final PHONE_TYPE_COLUMN_INDEX:I = 0x2

.field static final PHOTO_THUMBNAIL_URI_INDEX:I = 0x5

.field private static final QUERY_TOKEN:I = 0x35

.field private static final QUERY_TYPE_CALLLOG:I = 0x0

.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"

.field private static final TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field private static final UPDATE_TOKEN:I = 0x38

.field private static ctx:Landroid/content/Context;

.field private static final sEditable:Landroid/text/SpannableStringBuilder;

.field private static sFormattingType:I


# instance fields
.field private activity:Landroid/app/Activity;

.field private currentQuery:I

.field historyList:Landroid/widget/ListView;

.field mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

.field private mQueryHandler:Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;

.field private m_AlertDlg:Landroid/app/AlertDialog;

.field private sp:Landroid/content/SharedPreferences;

.field targerNumber:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 77
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    .line 88
    const/4 v0, -0x1

    sput v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sFormattingType:I

    .line 102
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "number"

    aput-object v1, v0, v4

    const-string/jumbo v1, "date"

    aput-object v1, v0, v5

    const-string/jumbo v1, "duration"

    aput-object v1, v0, v6

    const-string/jumbo v1, "type"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "name"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "numbertype"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "numberlabel"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->CALL_LOG_PROJECTION:[Ljava/lang/String;

    .line 119
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "display_name"

    aput-object v1, v0, v4

    const-string/jumbo v1, "type"

    aput-object v1, v0, v5

    const-string/jumbo v1, "label"

    aput-object v1, v0, v6

    const-string/jumbo v1, "number"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "photo_thumb_uri"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->PHONES_PROJECTION:[Ljava/lang/String;

    .line 124
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "display_name"

    aput-object v1, v0, v4

    const-string/jumbo v1, "type"

    aput-object v1, v0, v5

    const-string/jumbo v1, "label"

    aput-object v1, v0, v6

    const-string/jumbo v1, "number"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "_id"

    aput-object v2, v0, v1

    sput-object v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->PHONES_PROJECTION_LOWER_API11:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 97
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->currentQuery:I

    return-void
.end method

.method static synthetic access$000()Landroid/content/Context;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->ctx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/AddCallCallLogFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/AddCallCallLogFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    .prologue
    .line 63
    iget v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->currentQuery:I

    return v0
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/AddCallCallLogFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallCallLogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method private formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 352
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 353
    const-string/jumbo v1, ""

    .line 368
    :goto_0
    return-object v1

    .line 357
    :cond_0
    sget v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sFormattingType:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 358
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->getFormatTypeForLocale(Ljava/util/Locale;)I

    move-result v1

    sput v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sFormattingType:I

    .line 362
    :cond_1
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->convertKeypadLettersToDigits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 361
    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 364
    .local v0, "unformattedNumber":Ljava/lang/String;
    sget-object v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 365
    sget-object v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 367
    sget-object v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    sget v2, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sFormattingType:I

    invoke-static {v1, v2}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Landroid/text/Editable;I)V

    .line 368
    sget-object v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private historyLayoutSelector(I)V
    .locals 2
    .param p1, "queryType"    # I

    .prologue
    const/4 v1, 0x0

    .line 329
    packed-switch p1, :pswitch_data_0

    .line 338
    :goto_0
    return-void

    .line 331
    :pswitch_0
    iput v1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->currentQuery:I

    .line 332
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    if-eqz v0, :cond_0

    .line 333
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->clearCache()V

    .line 335
    :cond_0
    invoke-direct {p0, v1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->startQuery(I)V

    goto :goto_0

    .line 329
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private performCall(Ljava/lang/String;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 404
    if-nez p1, :cond_0

    .line 405
    iget-object p1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->targerNumber:Ljava/lang/String;

    .line 407
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    sget-object v1, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->ctx:Landroid/content/Context;

    invoke-virtual {v0, p1, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->addCall(Ljava/lang/String;Landroid/content/Context;)Z

    .line 408
    return-void
.end method

.method private resetNewCallsFlag()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 373
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "type="

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 374
    .local v7, "where":Ljava/lang/StringBuilder;
    const/4 v0, 0x3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 375
    const-string/jumbo v0, " AND new=1"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    new-instance v4, Landroid/content/ContentValues;

    const/4 v0, 0x1

    invoke-direct {v4, v0}, Landroid/content/ContentValues;-><init>(I)V

    .line 378
    .local v4, "values":Landroid/content/ContentValues;
    const-string/jumbo v0, "new"

    const-string/jumbo v1, "0"

    invoke-virtual {v4, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    sget-object v3, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    .line 381
    .local v3, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mQueryHandler:Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;

    const/16 v1, 0x38

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v6, v2

    invoke-virtual/range {v0 .. v6}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;->startUpdate(ILjava/lang/Object;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)V

    .line 383
    return-void
.end method

.method private startQuery(I)V
    .locals 8
    .param p1, "queryType"    # I

    .prologue
    const/4 v5, 0x0

    const/16 v1, 0x35

    .line 386
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->setLoading(Z)V

    .line 387
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mQueryHandler:Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;->cancelOperation(I)V

    .line 389
    packed-switch p1, :pswitch_data_0

    .line 399
    :goto_0
    return-void

    .line 392
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mQueryHandler:Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    sget-object v4, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->CALL_LOG_PROJECTION:[Ljava/lang/String;

    const-string/jumbo v7, "date DESC"

    move-object v6, v5

    invoke-virtual/range {v0 .. v7}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 389
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 285
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 286
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 235
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 237
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->activity:Landroid/app/Activity;

    .line 238
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->setHasOptionsMenu(Z)V

    .line 239
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->ctx:Landroid/content/Context;

    .line 240
    new-instance v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;-><init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mQueryHandler:Lcom/pccw/mobile/sip/AddCallCallLogFragment$QueryHandler;

    .line 243
    const/4 v0, -0x1

    sput v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->sFormattingType:I

    .line 244
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    .line 249
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 250
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    const/16 v2, 0x8

    const/16 v3, 0xc

    invoke-virtual {v0, v2, v3}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 252
    const v2, 0x7f070061

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 254
    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 255
    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 257
    const v2, 0x7f040024

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 258
    .local v1, "v":Landroid/view/View;
    const v2, 0x7f0e009d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->historyList:Landroid/widget/ListView;

    .line 259
    return-object v1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 318
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 319
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    if-eqz v1, :cond_0

    .line 320
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->stopRequestProcessing()V

    .line 321
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 322
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 323
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 326
    .end local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 310
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    .line 313
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->stopRequestProcessing()V

    .line 314
    return-void
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 292
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    if-eqz v0, :cond_0

    .line 293
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->clearCache()V

    .line 296
    :cond_0
    iget v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->currentQuery:I

    packed-switch v0, :pswitch_data_0

    .line 302
    :goto_0
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 304
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 306
    return-void

    .line 298
    :pswitch_0
    invoke-direct {p0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->resetNewCallsFlag()V

    goto :goto_0

    .line 296
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 275
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    .line 276
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 280
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    .line 281
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 264
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 265
    new-instance v0, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    sget-object v2, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->ctx:Landroid/content/Context;

    const v3, 0x7f040035

    const/4 v4, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;-><init>(Lcom/pccw/mobile/sip/AddCallCallLogFragment;Landroid/content/Context;ILandroid/database/Cursor;Z)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    .line 266
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->historyList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/AddCallCallLogFragment$CallLogAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 267
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->historyList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 268
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->historyList:Landroid/widget/ListView;

    invoke-virtual {v0, v5}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 270
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/AddCallCallLogFragment;->historyLayoutSelector(I)V

    .line 271
    return-void
.end method
