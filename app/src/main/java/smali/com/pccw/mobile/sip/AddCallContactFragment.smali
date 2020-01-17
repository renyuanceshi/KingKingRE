.class public Lcom/pccw/mobile/sip/AddCallContactFragment;
.super Landroid/support/v4/app/ListFragment;
.source "AddCallContactFragment.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/AddCallContactFragment$AllPhoneNumberQuery;,
        Lcom/pccw/mobile/sip/AddCallContactFragment$ContactIMQuery;,
        Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;,
        Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;
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

.field allTextView:Landroid/widget/TextView;

.field contactSelectLayout:Landroid/widget/LinearLayout;

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

.field kkTextView:Landroid/widget/TextView;

.field private list:Landroid/widget/ListView;

.field private mContactAdapter:Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;

.field mListView:Landroid/widget/ListView;

.field private searchView:Landroid/support/v7/widget/SearchView;

.field targerNumber:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 79
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v0, v3, :cond_0

    const-string/jumbo v0, "display_name"

    :goto_0
    aput-object v0, v1, v2

    sput-object v1, Lcom/pccw/mobile/sip/AddCallContactFragment;->FROM_COLUMNS:[Ljava/lang/String;

    return-void

    :cond_0
    const-string/jumbo v0, "display_name"

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 59
    invoke-direct {p0}, Landroid/support/v4/app/ListFragment;-><init>()V

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->iMNumberList:Ljava/util/ArrayList;

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->currentQuery:I

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/AddCallContactFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallContactFragment;
    .param p1, "x1"    # I

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/AddCallContactFragment;->selectContactLayout(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/AddCallContactFragment;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallContactFragment;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/AddCallContactFragment;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallContactFragment;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/AddCallContactFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallContactFragment;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->iMNumberList:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/AddCallContactFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallContactFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchContacts(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/AddCallContactFragment;)Landroid/support/v7/widget/SearchView;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/AddCallContactFragment;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    return-object v0
.end method

.method private call(Ljava/lang/String;)V
    .locals 3
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 520
    if-nez p1, :cond_0

    .line 521
    iget-object p1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->targerNumber:Ljava/lang/String;

    .line 522
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    .line 523
    return-void
.end method

.method private getPhoneNumberLookUpKey()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v3, 0x0

    const/4 v8, 0x2

    .line 265
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 266
    .local v7, "lookUpKey":Ljava/lang/StringBuilder;
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/pccw/mobile/sip/AddCallContactFragment$AllPhoneNumberQuery;->URI:Landroid/net/Uri;

    sget-object v2, Lcom/pccw/mobile/sip/AddCallContactFragment$AllPhoneNumberQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v5, "data1"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 268
    .local v6, "cursor":Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 269
    const-string/jumbo v0, " ("

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_2

    .line 271
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->iMNumberList:Ljava/util/ArrayList;

    const/4 v1, 0x1

    .line 272
    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 271
    invoke-static {v1}, Lcom/pccw/sms/service/PhoneListService;->normalizeContactNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 273
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1

    .line 274
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

    .line 278
    :cond_0
    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 276
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

    .line 280
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 281
    const-string/jumbo v0, ")"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private searchContacts(Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 286
    if-eqz p1, :cond_0

    .line 287
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 288
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

    .line 290
    iget v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->currentQuery:I

    packed-switch v1, :pswitch_data_0

    .line 301
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    .line 292
    .restart local v0    # "bundle":Landroid/os/Bundle;
    :pswitch_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 295
    :pswitch_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 290
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

    .line 178
    packed-switch p1, :pswitch_data_0

    .line 201
    :goto_0
    return-void

    .line 180
    :pswitch_0
    iput v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->currentQuery:I

    .line 181
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->contactSelectLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f0200c7

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 182
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->allTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 183
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->kkTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 185
    :cond_0
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v2, v6, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 187
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchContacts(Ljava/lang/String;)V

    goto :goto_0

    .line 190
    :pswitch_1
    iput v3, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->currentQuery:I

    .line 191
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->contactSelectLayout:Landroid/widget/LinearLayout;

    const v1, 0x7f0200c8

    .line 192
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    .line 193
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->allTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 194
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->kkTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 195
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->isIconified()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 196
    :cond_2
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v3, v6, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_0

    .line 198
    :cond_3
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchContacts(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 178
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
    .line 205
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getListView()Landroid/widget/ListView;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->list:Landroid/widget/ListView;

    .line 206
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->list:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 207
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 208
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    .line 94
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->activity:Landroid/app/Activity;

    .line 95
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->setHasOptionsMenu(Z)V

    .line 96
    new-instance v0, Lcom/pccw/sms/service/ConversationParticipantItemService;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    .line 97
    invoke-super {p0, p1}, Landroid/support/v4/app/ListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 98
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 9
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

    const/4 v8, 0x0

    const/4 v5, 0x0

    .line 212
    packed-switch p1, :pswitch_data_0

    move-object v0, v5

    .line 238
    :goto_0
    return-object v0

    .line 214
    :pswitch_0
    if-eqz p2, :cond_0

    const-string/jumbo v0, "SEARCH_KEY"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "SEARCH_KEY"

    .line 215
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 216
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v4, "display_name LIKE ? AND has_phone_number = 1"

    new-array v5, v6, [Ljava/lang/String;

    const-string/jumbo v6, "SEARCH_KEY"

    .line 218
    invoke-virtual {p2, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    const-string/jumbo v6, "display_name"

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 221
    :cond_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v4, "has_phone_number = 1"

    const-string/jumbo v6, "display_name"

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 225
    :pswitch_1
    invoke-direct {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getPhoneNumberLookUpKey()Ljava/lang/String;

    move-result-object v7

    .line 226
    .local v7, "lookUpKey":Ljava/lang/String;
    if-eqz p2, :cond_1

    const-string/jumbo v0, "SEARCH_KEY"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "SEARCH_KEY"

    .line 227
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 228
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "display_name LIKE ? AND has_phone_number = 1 AND lookup IN "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v6, [Ljava/lang/String;

    const-string/jumbo v6, "SEARCH_KEY"

    .line 230
    invoke-virtual {p2, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    const-string/jumbo v6, "display_name"

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 233
    :cond_1
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    sget-object v2, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactIMQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactIMQuery;->PROJECTION:[Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "has_phone_number = 1 AND lookup IN "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "display_name"

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 212
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
    .line 475
    const/high16 v1, 0x7f100000

    invoke-virtual {p2, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 476
    const v1, 0x7f0e0206

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 477
    .local v0, "searchItem":Landroid/view/MenuItem;
    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/SearchView;

    iput-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    .line 478
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    const-string/jumbo v2, "Search Contacts"

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    .line 479
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    new-instance v2, Lcom/pccw/mobile/sip/AddCallContactFragment$3;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/AddCallContactFragment$3;-><init>(Lcom/pccw/mobile/sip/AddCallContactFragment;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SearchView;->setOnQueryTextListener(Landroid/support/v7/widget/SearchView$OnQueryTextListener;)V

    .line 494
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->searchView:Landroid/support/v7/widget/SearchView;

    new-instance v2, Lcom/pccw/mobile/sip/AddCallContactFragment$4;

    invoke-direct {v2, p0}, Lcom/pccw/mobile/sip/AddCallContactFragment$4;-><init>(Lcom/pccw/mobile/sip/AddCallContactFragment;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SearchView;->setOnCloseListener(Landroid/support/v7/widget/SearchView$OnCloseListener;)V

    .line 503
    new-instance v1, Lcom/pccw/mobile/sip/AddCallContactFragment$5;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/AddCallContactFragment$5;-><init>(Lcom/pccw/mobile/sip/AddCallContactFragment;)V

    invoke-static {v0, v1}, Landroid/support/v4/view/MenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/view/MenuItem;

    .line 516
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/ListFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 517
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 132
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    const/16 v2, 0x8

    const/16 v3, 0x18

    invoke-virtual {v0, v2, v3}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 134
    const v2, 0x7f07005f

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/AddCallContactFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 136
    const v2, 0x7f040027

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 138
    .local v1, "v":Landroid/view/View;
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    const-string/jumbo v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/inputmethod/InputMethodManager;

    iput-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->inputMethodManager:Landroid/view/inputmethod/InputMethodManager;

    .line 140
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 142
    const v2, 0x7f0e00a8

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->contactSelectLayout:Landroid/widget/LinearLayout;

    .line 143
    const v2, 0x7f0e00a9

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->allTextView:Landroid/widget/TextView;

    .line 144
    const v2, 0x7f0e00aa

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->kkTextView:Landroid/widget/TextView;

    .line 146
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->allTextView:Landroid/widget/TextView;

    new-instance v3, Lcom/pccw/mobile/sip/AddCallContactFragment$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/AddCallContactFragment$1;-><init>(Lcom/pccw/mobile/sip/AddCallContactFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->kkTextView:Landroid/widget/TextView;

    new-instance v3, Lcom/pccw/mobile/sip/AddCallContactFragment$2;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/AddCallContactFragment$2;-><init>(Lcom/pccw/mobile/sip/AddCallContactFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    return-object v1
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 125
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onDestroy()V

    .line 126
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
    .line 244
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    if-eqz p2, :cond_0

    invoke-interface {p2}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 245
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 256
    :cond_0
    :goto_0
    return-void

    .line 248
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;

    invoke-virtual {v0, p2}, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 249
    iget-object v1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;

    monitor-enter v1

    .line 250
    :try_start_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 251
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 245
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 59
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/pccw/mobile/sip/AddCallContactFragment;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .locals 0
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
    .line 262
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 105
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onPause()V

    .line 106
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
    .line 116
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 118
    invoke-super {p0}, Landroid/support/v4/app/ListFragment;->onResume()V

    .line 119
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    .line 167
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/ListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 169
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->contactSelectLayout:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 170
    new-instance v0, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;

    iget-object v2, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->ctx:Landroid/content/Context;

    const v3, 0x7f040028

    const/4 v4, 0x0

    sget-object v5, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAllQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x1

    new-array v6, v1, [I

    const v1, 0x7f0e00ac

    aput v1, v6, v8

    const/4 v7, 0x2

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;-><init>(Lcom/pccw/mobile/sip/AddCallContactFragment;Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment;->mContactAdapter:Lcom/pccw/mobile/sip/AddCallContactFragment$ContactAdapter;

    .line 174
    invoke-direct {p0, v8}, Lcom/pccw/mobile/sip/AddCallContactFragment;->selectContactLayout(I)V

    .line 175
    return-void
.end method
