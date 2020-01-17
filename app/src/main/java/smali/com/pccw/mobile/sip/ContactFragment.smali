.class public Lcom/pccw/mobile/sip/ContactFragment;
.super Landroid/support/v4/app/ListFragment;
.source "ContactFragment.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;,
        Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;,
        Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;,
        Lcom/pccw/mobile/sip/ContactFragment$ContactAllQuery;,
        Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/app/ListFragment;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# static fields
.field public static final EXIT_MENU_ITEM:I = 0x2

.field public static final FIRST_MENU_ID:I = 0x1

.field private static final FROM_COLUMNS:[Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation
.end field

.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"


# instance fields
.field private activity:Landroid/app/Activity;

.field allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

.field contactSelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

.field conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

.field private ctx:Landroid/content/Context;

.field private currentQuery:I

.field private iMNumberList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/sms/bean/ConversationParticipantItem;",
            ">;"
        }
    .end annotation
.end field

.field kkTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

.field private list:Landroid/widget/ListView;

.field private mContactAdapter:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

.field mListView:Landroid/widget/ListView;

.field private searchView:Landroid/support/v7/widget/SearchView;

.field private syncIMUserReceiver:Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;

.field targerNumber:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 85
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v0, v3, :cond_0

    const-string/jumbo v0, "display_name"

    :goto_0
    aput-object v0, v1, v2

    sput-object v1, Lcom/pccw/mobile/sip/ContactFragment;->FROM_COLUMNS:[Ljava/lang/String;

    return-void

    :cond_0
    const-string/jumbo v0, "display_name"

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    invoke-direct {p0}, Landroid/support/v4/app/ListFragment;-><init>()V

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->iMNumberList:Ljava/util/ArrayList;

    .line 77
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->currentQuery:I

    .line 661
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->syncIMUserReceiver:Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/ContactFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactFragment;
    .param p1, "x1"    # I

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/ContactFragment;->selectContactLayout(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/ContactFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactFragment;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/ContactFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactFragment;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/ContactFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactFragment;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->iMNumberList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/ContactFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/ContactFragment;->searchContacts(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/ContactFragment;)Landroid/support/v7/widget/SearchView;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/ContactFragment;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    return-object v0
.end method

.method private call(Ljava/lang/String;)V
    .locals 3
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 583
    if-nez p1, :cond_0

    .line 584
    iget-object p1, p0, Lcom/pccw/mobile/sip/ContactFragment;->targerNumber:Ljava/lang/String;

    .line 585
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    .line 586
    return-void
.end method

.method private getIMUserList()V
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    invoke-virtual {v0}, Lcom/pccw/sms/service/ConversationParticipantItemService;->listIMNumber()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->iMNumberList:Ljava/util/ArrayList;

    .line 141
    return-void
.end method

.method private getPhoneNumberLookUpKey()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v3, 0x0

    const/4 v8, 0x2

    .line 291
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 292
    .local v7, "lookUpKey":Ljava/lang/StringBuilder;
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->URI:Landroid/net/Uri;

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$AllPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v5, "data1"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 294
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 295
    const-string/jumbo v0, " ("

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_2

    .line 297
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->iMNumberList:Ljava/util/ArrayList;

    const/4 v1, 0x1

    .line 298
    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 297
    invoke-static {v1}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 300
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    :cond_0
    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 302
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, ", \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 306
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 307
    const-string/jumbo v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private searchContacts(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 312
    if-eqz p1, :cond_0

    .line 313
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 314
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "SEARCH_KEY"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 316
    iget v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->currentQuery:I

    packed-switch v1, :pswitch_data_0

    .line 327
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    .line 318
    .restart local v0    # "bundle":Landroid/os/Bundle;
    :pswitch_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 321
    :pswitch_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 316
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private selectContactLayout(I)V
    .locals 7
    .param p1, "queryType"    # I

    .prologue
    const/4 v6, 0x0

    const v5, 0x7f0b0077

    const v4, 0x7f0b0052

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 204
    packed-switch p1, :pswitch_data_0

    .line 227
    :goto_0
    return-void

    .line 206
    :pswitch_0
    iput v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->currentQuery:I

    .line 207
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->contactSelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    const v1, 0x7f0200c7

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->setBackgroundResource(I)V

    .line 208
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 209
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->kkTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 210
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 211
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v2, v6, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 213
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/ContactFragment;->searchContacts(Ljava/lang/String;)V

    goto :goto_0

    .line 216
    :pswitch_1
    iput v3, p0, Lcom/pccw/mobile/sip/ContactFragment;->currentQuery:I

    .line 217
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->contactSelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    const v1, 0x7f0200c8

    .line 218
    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->setBackgroundResource(I)V

    .line 219
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 220
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->kkTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 221
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 222
    :cond_2
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v3, v6, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 224
    :cond_3
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/ContactFragment;->searchContacts(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 204
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 231
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->list:Landroid/widget/ListView;

    .line 232
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->list:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 233
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 234
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    .line 101
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->activity:Landroid/app/Activity;

    .line 102
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactFragment;->setHasOptionsMenu(Z)V

    .line 103
    new-instance v0, Lcom/pccw/sms/service/ConversationParticipantItemService;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    .line 104
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 105
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 13
    .param p1, "loaderID"    # I
    .param p2, "bundle"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 238
    packed-switch p1, :pswitch_data_0

    move-object v0, v4

    .line 263
    :goto_0
    return-object v0

    .line 240
    :pswitch_0
    if-eqz p2, :cond_0

    const-string/jumbo v0, "SEARCH_KEY"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "SEARCH_KEY"

    .line 241
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 242
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$ContactAllQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/ContactFragment$ContactAllQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v4, "display_name LIKE ?"

    new-array v5, v6, [Ljava/lang/String;

    const-string/jumbo v6, "SEARCH_KEY"

    .line 244
    invoke-virtual {p2, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    const-string/jumbo v6, "display_name"

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 247
    :cond_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$ContactAllQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/ContactFragment$ContactAllQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v6, "display_name"

    move-object v5, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 250
    :pswitch_1
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getPhoneNumberLookUpKey()Ljava/lang/String;

    move-result-object v12

    .line 251
    .local v12, "lookUpKey":Ljava/lang/String;
    if-eqz p2, :cond_1

    const-string/jumbo v0, "SEARCH_KEY"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "SEARCH_KEY"

    .line 252
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 253
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "display_name LIKE ? AND lookup IN "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/String;

    const-string/jumbo v6, "SEARCH_KEY"

    .line 255
    invoke-virtual {p2, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    const-string/jumbo v6, "display_name"

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 258
    :cond_1
    new-instance v5, Landroid/support/v4/content/CursorLoader;

    iget-object v6, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    sget-object v7, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v8, Lcom/pccw/mobile/sip/ContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "lookup IN "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v11, "display_name"

    move-object v10, v4

    invoke-direct/range {v5 .. v11}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v5

    goto/16 :goto_0

    .line 238
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 522
    const v1, 0x7f100001

    invoke-virtual {p2, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 523
    const v1, 0x7f0e0206

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 528
    .local v0, "searchItem":Landroid/view/MenuItem;
    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/SearchView;

    iput-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    .line 529
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    const v2, 0x7f0700c5

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/ContactFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    .line 530
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    new-instance v2, Lcom/pccw/mobile/sip/ContactFragment$3;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/ContactFragment$3;-><init>(Lcom/pccw/mobile/sip/ContactFragment;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SearchView;->setOnQueryTextListener(Landroid/support/v7/widget/SearchView$OnQueryTextListener;)V

    .line 545
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    new-instance v2, Lcom/pccw/mobile/sip/ContactFragment$4;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/ContactFragment$4;-><init>(Lcom/pccw/mobile/sip/ContactFragment;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SearchView;->setOnCloseListener(Landroid/support/v7/widget/SearchView$OnCloseListener;)V

    .line 554
    new-instance v1, Lcom/pccw/mobile/sip/ContactFragment$5;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/ContactFragment$5;-><init>(Lcom/pccw/mobile/sip/ContactFragment;)V

    invoke-static {v0, v1}, Landroid/support/v4/view/MenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/view/MenuItem;

    .line 566
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/ListFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 567
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 153
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 154
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    const/16 v2, 0x8

    const/16 v3, 0x18

    invoke-virtual {v0, v2, v3}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 155
    const v2, 0x7f070062

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/ContactFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 158
    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 160
    const v2, 0x7f04003f

    invoke-virtual {p1, v2, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 161
    .local v1, "v":Landroid/view/View;
    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    const-string/jumbo v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    iput-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 162
    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 164
    const v2, 0x7f0e0123

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    iput-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->contactSelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    .line 165
    const v2, 0x7f0e0124

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    iput-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    .line 166
    const v2, 0x7f0e0125

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    iput-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->kkTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    .line 168
    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    new-instance v3, Lcom/pccw/mobile/sip/ContactFragment$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/ContactFragment$1;-><init>(Lcom/pccw/mobile/sip/ContactFragment;)V

    invoke-virtual {v2, v3}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 178
    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->kkTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    new-instance v3, Lcom/pccw/mobile/sip/ContactFragment$2;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/ContactFragment$2;-><init>(Lcom/pccw/mobile/sip/ContactFragment;)V

    invoke-virtual {v2, v3}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    return-object v1
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 147
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onDestroy()V

    .line 148
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 2
    .param p2, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    .prologue
    .line 269
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    if-eqz p2, :cond_0

    invoke-interface {p2}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 270
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 281
    :cond_0
    :goto_0
    return-void

    .line 273
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    invoke-virtual {v0, p2}, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 274
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    monitor-enter v1

    .line 275
    :try_start_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 276
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 270
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 65
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/pccw/mobile/sip/ContactFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 285
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 288
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 571
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 578
    :goto_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->activity:Landroid/app/Activity;

    invoke-virtual {v1, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1

    .line 574
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.INSERT"

    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 576
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/ContactFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 571
    :pswitch_data_0
    .packed-switch 0x7f0e0207
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 115
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onPause()V

    .line 116
    return-void
.end method

.method public onResume()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 131
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onResume()V

    .line 132
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    .line 193
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/ListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 195
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->contactSelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->setVisibility(I)V

    .line 196
    new-instance v0, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    const v3, 0x7f040040

    const/4 v4, 0x0

    sget-object v5, Lcom/pccw/mobile/sip/ContactFragment$ContactAllQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x1

    new-array v6, v1, [I

    const v1, 0x7f0e0127

    aput v1, v6, v8

    const/4 v7, 0x2

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;-><init>(Lcom/pccw/mobile/sip/ContactFragment;Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/ContactFragment$ContactAdapter;

    .line 200
    invoke-direct {p0, v8}, Lcom/pccw/mobile/sip/ContactFragment;->selectContactLayout(I)V

    .line 201
    return-void
.end method

.method public registerSyncIMUserReceiver()V
    .locals 3

    .prologue
    .line 666
    new-instance v1, Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;-><init>(Lcom/pccw/mobile/sip/ContactFragment;)V

    iput-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->syncIMUserReceiver:Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;

    .line 667
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 668
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.syncimuserfinish"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 669
    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/pccw/mobile/sip/ContactFragment;->syncIMUserReceiver:Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 670
    return-void
.end method

.method public unregisterSyncIMUserReceiver()V
    .locals 2

    .prologue
    .line 676
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->syncIMUserReceiver:Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;

    if-eqz v0, :cond_0

    .line 677
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->ctx:Landroid/content/Context;

    iget-object v1, p0, Lcom/pccw/mobile/sip/ContactFragment;->syncIMUserReceiver:Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 679
    :cond_0
    return-void
.end method

.method public updateIMNumberList()V
    .locals 3

    .prologue
    .line 135
    invoke-direct {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getIMUserList()V

    .line 136
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/ContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    iget v0, p0, Lcom/pccw/mobile/sip/ContactFragment;->currentQuery:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 137
    return-void

    .line 136
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
