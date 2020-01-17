.class public Lcom/pccw/sms/NewSMSActivity;
.super Lcom/pccw/mobile/sip/BaseActionBarActivity;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
.implements Lcom/pccw/dialog/listener/IKKDialogOnClickListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;,
        Lcom/pccw/sms/NewSMSActivity$ContactQuery;,
        Lcom/pccw/sms/NewSMSActivity$ContactAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/pccw/mobile/sip/BaseActionBarActivity;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Lcom/pccw/dialog/listener/IKKDialogOnClickListener;"
    }
.end annotation


# static fields
.field private static final promptInvalidNumberDialog:I = 0x4

.field private static final promptNotSupportUserDialog:I = 0x3

.field private static final promptOverLengthDialog:I = 0x5

.field private static final promptOverNumberLengthLimitDialog:I = 0x6

.field private static final promptRemoveDialog:I = 0x2


# instance fields
.field TAG:Ljava/lang/String;

.field addBtn:Landroid/widget/ImageButton;

.field addEt:Lcom/pccw/sms/emoji/EmojiEditText;

.field addTextView:Landroid/widget/TextView;

.field builder:Landroid/app/AlertDialog$Builder;

.field charCountTv:Landroid/widget/TextView;

.field concatCountTv:Landroid/widget/TextView;

.field isComeFromEditParticipant:Z

.field layoutParent:Lcom/pccw/sms/emoji/EmojiLinearLayout;

.field layoutSecond:Landroid/widget/LinearLayout;

.field linkView:Landroid/view/View;

.field list:Landroid/widget/ListView;

.field mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

.field mHeight:I

.field mWidth:I

.field manager:Landroid/view/inputmethod/InputMethodManager;

.field private numbers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private recipientId:I

.field recipientLayout:Landroid/widget/LinearLayout;

.field recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

.field removeTextView:Landroid/widget/TextView;

.field scrollTag:Z

.field searchLayout:Landroid/widget/LinearLayout;

.field sendBtn:Landroid/widget/ImageButton;

.field sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

.field sendLayout:Landroid/widget/RelativeLayout;

.field private titleStr:Ljava/lang/String;

.field topBar:Landroid/widget/RelativeLayout;

.field txtCont:Landroid/widget/LinearLayout;

.field viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;-><init>()V

    .line 96
    const-string/jumbo v0, "NewSMS"

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    .line 128
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->numbers:Ljava/util/Map;

    .line 129
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/sms/NewSMSActivity;->recipientId:I

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/sms/NewSMSActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->clearListView()V

    return-void
.end method

.method static synthetic access$100(Lcom/pccw/sms/NewSMSActivity;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->numbers:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/sms/NewSMSActivity;Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/NewSMSActivity;
    .param p1, "x1"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/pccw/sms/NewSMSActivity;->promptKKDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/sms/NewSMSActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/NewSMSActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/pccw/sms/NewSMSActivity;->createChatAndSendSMS(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/sms/NewSMSActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->titleStr:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$402(Lcom/pccw/sms/NewSMSActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/NewSMSActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity;->titleStr:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/pccw/sms/NewSMSActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/NewSMSActivity;
    .param p1, "x1"    # I

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/pccw/sms/NewSMSActivity;->promptDialog(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/pccw/sms/NewSMSActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->hideSoftInput()V

    return-void
.end method

.method private checkSmsType(Ljava/lang/String;)V
    .locals 4
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 737
    new-instance v0, Lcom/pccw/sms/service/CheckSMSTypeService;

    new-instance v2, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;

    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    invoke-direct {v2, p0, v3}, Lcom/pccw/sms/NewSMSActivity$CheckSMSTypeServiceListener;-><init>(Lcom/pccw/sms/NewSMSActivity;Landroid/widget/TextView;)V

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/pccw/sms/service/CheckSMSTypeService;-><init>(Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;Landroid/content/Context;)V

    .line 739
    .local v0, "checkSMSTypeService":Lcom/pccw/sms/service/CheckSMSTypeService;
    :try_start_0
    invoke-virtual {v0, p1}, Lcom/pccw/sms/service/CheckSMSTypeService;->checkSMSType(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/pccw/exception/NoNetworkException; {:try_start_0 .. :try_end_0} :catch_0

    .line 746
    :goto_0
    return-void

    .line 740
    :catch_0
    move-exception v1

    .line 742
    .local v1, "e":Lcom/pccw/exception/NoNetworkException;
    invoke-virtual {v1}, Lcom/pccw/exception/NoNetworkException;->printStackTrace()V

    goto :goto_0
.end method

.method private clearListView()V
    .locals 2

    .prologue
    .line 749
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 750
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    monitor-enter v1

    .line 751
    :try_start_0
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 752
    monitor-exit v1

    .line 753
    return-void

    .line 752
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private createChatAndSendSMS(Ljava/lang/String;)V
    .locals 8
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 366
    new-instance v3, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/pccw/sms/NewSMSActivity;->numbers:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 367
    .local v3, "recipients":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 369
    .local v0, "chatId":I
    invoke-static {v3}, Lcom/pccw/sms/util/SMSFormatUtil;->convertListToSortedSplittingString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    .line 371
    .local v2, "recipientString":Ljava/lang/String;
    new-instance v4, Lcom/pccw/sms/service/CreateChatService;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/pccw/sms/service/CreateChatService;-><init>(Landroid/content/Context;)V

    .line 372
    .local v4, "service":Lcom/pccw/sms/service/CreateChatService;
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-le v5, v7, :cond_0

    .line 373
    invoke-virtual {v4, v3}, Lcom/pccw/sms/service/CreateChatService;->createMultipleChat(Ljava/util/ArrayList;)I

    move-result v0

    .line 374
    const-string/jumbo v1, "group"

    .line 383
    .local v1, "chatType":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_2

    .line 384
    invoke-direct {p0, v0, p1, v2, v1}, Lcom/pccw/sms/NewSMSActivity;->sendMessage(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    invoke-direct {p0, v0, v2, v1}, Lcom/pccw/sms/NewSMSActivity;->goToChatPage(ILjava/lang/String;Ljava/lang/String;)V

    .line 389
    .end local v1    # "chatType":Ljava/lang/String;
    :goto_1
    return-void

    .line 375
    :cond_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 376
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/pccw/sms/service/CreateChatService;->createSingleChat(Ljava/lang/String;)I

    move-result v0

    .line 377
    const-string/jumbo v1, "individual"

    .restart local v1    # "chatType":Ljava/lang/String;
    goto :goto_0

    .line 379
    .end local v1    # "chatType":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0701ba

    invoke-virtual {p0, v6}, Lcom/pccw/sms/NewSMSActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 387
    .restart local v1    # "chatType":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string/jumbo v6, "Create Chat failed"

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method private getContactNameByPhoneNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "phoneNumber"    # Ljava/lang/String;

    .prologue
    .line 724
    new-instance v0, Lcom/pccw/mobile/sms/helper/ContactsHelper;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/pccw/mobile/sms/helper/ContactsHelper;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 725
    .local v0, "contactsHelper":Lcom/pccw/mobile/sms/helper/ContactsHelper;
    invoke-virtual {v0}, Lcom/pccw/mobile/sms/helper/ContactsHelper;->getName()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private getInfoFromIntent()V
    .locals 3

    .prologue
    .line 168
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 169
    .local v0, "mIntent":Landroid/content/Intent;
    const-string/jumbo v1, "isComeFromEditParticipant"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/pccw/sms/NewSMSActivity;->isComeFromEditParticipant:Z

    .line 170
    return-void
.end method

.method private getViews()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 174
    const v1, 0x7f0e0099

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/pccw/sms/emoji/EmojiEditText;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    .line 175
    const v1, 0x7f0e01da

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/pccw/sms/emoji/EmojiEditText;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

    .line 176
    const v1, 0x7f0e0097

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->addBtn:Landroid/widget/ImageButton;

    .line 177
    const v1, 0x7f0e01d8

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->sendBtn:Landroid/widget/ImageButton;

    .line 178
    const v1, 0x7f0e0095

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/pccw/sms/emoji/EmojiFlowLayout;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    .line 179
    const v1, 0x7f0e0096

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->topBar:Landroid/widget/RelativeLayout;

    .line 180
    const v1, 0x7f0e0074

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/pccw/sms/emoji/EmojiLinearLayout;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->layoutParent:Lcom/pccw/sms/emoji/EmojiLinearLayout;

    .line 181
    const v1, 0x7f0e0094

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->recipientLayout:Landroid/widget/LinearLayout;

    .line 182
    const v1, 0x7f0e0091

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->layoutSecond:Landroid/widget/LinearLayout;

    .line 183
    const v1, 0x7f0e01dc

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->txtCont:Landroid/widget/LinearLayout;

    .line 184
    const v1, 0x7f0e0098

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->searchLayout:Landroid/widget/LinearLayout;

    .line 185
    const v1, 0x7f0e009b

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->sendLayout:Landroid/widget/RelativeLayout;

    .line 186
    const v1, 0x7f0e0093

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    .line 187
    const v1, 0x7f0e009c

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->list:Landroid/widget/ListView;

    .line 188
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 189
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 190
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v1, p0, Lcom/pccw/sms/NewSMSActivity;->mWidth:I

    .line 191
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v1, p0, Lcom/pccw/sms/NewSMSActivity;->mHeight:I

    .line 192
    const v1, 0x7f0e01dd

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->charCountTv:Landroid/widget/TextView;

    .line 193
    const v1, 0x7f0e01de

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->concatCountTv:Landroid/widget/TextView;

    .line 194
    const v1, 0x7f0e009a

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->linkView:Landroid/view/View;

    .line 196
    return-void
.end method

.method private goToChatPage(ILjava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "chatId"    # I
    .param p2, "recipient"    # Ljava/lang/String;
    .param p3, "chatType"    # Ljava/lang/String;

    .prologue
    .line 403
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 404
    .local v0, "mIntent":Landroid/content/Intent;
    const-string/jumbo v2, "chatId"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 405
    const-string/jumbo v2, "chatType"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 406
    const-string/jumbo v2, "recipient"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 408
    const-string/jumbo v2, "group"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 409
    invoke-static {p2}, Lcom/pccw/sms/util/SMSFormatUtil;->convertSplittingStringToSortedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 410
    .local v1, "recipientsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v2, "title"

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getMultipleSMSProfileTitle(Ljava/util/ArrayList;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 411
    const-string/jumbo v2, "photo"

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getMultipleSMSProfilePic(Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 417
    .end local v1    # "recipientsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-virtual {p0, v0}, Lcom/pccw/sms/NewSMSActivity;->startActivity(Landroid/content/Intent;)V

    .line 418
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->finish()V

    .line 419
    return-void

    .line 412
    :cond_1
    const-string/jumbo v2, "individual"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 413
    const-string/jumbo v2, "title"

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {p2, v3}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getSingleSMSProfileTitle(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 414
    const-string/jumbo v2, "photo"

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {p2, v3}, Lcom/pccw/mobile/sms/util/SMSProfileUtil;->getSingleSMSProfilePic(Ljava/lang/String;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    goto :goto_0
.end method

.method private hideSoftInput()V
    .locals 3

    .prologue
    .line 445
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->manager:Landroid/view/inputmethod/InputMethodManager;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 447
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->manager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    .line 448
    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x2

    .line 447
    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 450
    :cond_0
    return-void
.end method

.method private initContent()V
    .locals 13

    .prologue
    const/16 v12, 0x8

    const/4 v11, 0x0

    .line 423
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getIntent()Landroid/content/Intent;

    move-result-object v8

    .line 424
    .local v8, "intent":Landroid/content/Intent;
    const-string/jumbo v0, "numbers"

    invoke-virtual {v8, v0}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 425
    .local v10, "numbers":[Ljava/lang/String;
    if-eqz v10, :cond_0

    array-length v0, v10

    if-eqz v0, :cond_0

    .line 426
    array-length v1, v10

    move v0, v11

    :goto_0
    if-ge v0, v1, :cond_1

    aget-object v9, v10, v0

    .line 427
    .local v9, "num":Ljava/lang/String;
    invoke-virtual {p0, v9}, Lcom/pccw/sms/NewSMSActivity;->addRecipientTextView(Ljava/lang/String;)V

    .line 426
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 430
    .end local v9    # "num":Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    invoke-virtual {v0, v12}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    .line 433
    :cond_1
    new-instance v0, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    const v3, 0x7f040060

    const/4 v4, 0x0

    sget-object v5, Lcom/pccw/mobile/sip/ContactFragment$ContactAllQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x1

    new-array v6, v1, [I

    const v1, 0x7f0e0127

    aput v1, v6, v11

    const/4 v7, 0x2

    move-object v1, p0

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;-><init>(Lcom/pccw/sms/NewSMSActivity;Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    .line 437
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->list:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 438
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->list:Landroid/widget/ListView;

    invoke-virtual {v0, v12}, Landroid/widget/ListView;->setVisibility(I)V

    .line 440
    const-string/jumbo v0, "input_method"

    invoke-virtual {p0, v0}, Lcom/pccw/sms/NewSMSActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->manager:Landroid/view/inputmethod/InputMethodManager;

    .line 441
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->sendBtn:Landroid/widget/ImageButton;

    invoke-virtual {v0, v11}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 442
    return-void
.end method

.method private isWifiAvailable()Z
    .locals 1

    .prologue
    .line 729
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 730
    const/4 v0, 0x0

    .line 732
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private promptDialog(I)V
    .locals 5
    .param p1, "id"    # I

    .prologue
    const v4, 0x104000a

    const/4 v3, 0x0

    .line 569
    packed-switch p1, :pswitch_data_0

    .line 647
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unkown dialog id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 571
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    .line 572
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->titleStr:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 573
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 574
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f07007f

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/sms/NewSMSActivity$11;

    invoke-direct {v2, p0}, Lcom/pccw/sms/NewSMSActivity$11;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 580
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0701bf

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/sms/NewSMSActivity$10;

    invoke-direct {v2, p0}, Lcom/pccw/sms/NewSMSActivity$10;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 596
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 650
    :goto_0
    return-void

    .line 599
    :pswitch_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    .line 600
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0701bc

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 601
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 602
    invoke-virtual {p0, v4}, Lcom/pccw/sms/NewSMSActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/sms/NewSMSActivity$12;

    invoke-direct {v2, p0}, Lcom/pccw/sms/NewSMSActivity$12;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 608
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 611
    :pswitch_2
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    .line 612
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0701b7

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 613
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 614
    invoke-virtual {p0, v4}, Lcom/pccw/sms/NewSMSActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/sms/NewSMSActivity$13;

    invoke-direct {v2, p0}, Lcom/pccw/sms/NewSMSActivity$13;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 620
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 623
    :pswitch_3
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    .line 624
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0701be

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 625
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 626
    invoke-virtual {p0, v4}, Lcom/pccw/sms/NewSMSActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/sms/NewSMSActivity$14;

    invoke-direct {v2, p0}, Lcom/pccw/sms/NewSMSActivity$14;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 632
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 635
    :pswitch_4
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    .line 636
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0701bd

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 637
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 638
    invoke-virtual {p0, v4}, Lcom/pccw/sms/NewSMSActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/pccw/sms/NewSMSActivity$15;

    invoke-direct {v2, p0}, Lcom/pccw/sms/NewSMSActivity$15;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 644
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 569
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private promptDialogWithArgumentsAndTag(Lcom/pccw/dialog/EnumKKDialogType;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;
    .param p2, "args"    # Landroid/os/Bundle;

    .prologue
    .line 660
    new-instance v0, Lcom/pccw/dialog/KKDialogBuilder;

    invoke-direct {v0}, Lcom/pccw/dialog/KKDialogBuilder;-><init>()V

    .line 661
    .local v0, "dialogBuilder":Lcom/pccw/dialog/KKDialogBuilder;
    new-instance v2, Lcom/pccw/dialog/KKDialogProvider;

    invoke-direct {v2, v0, p0}, Lcom/pccw/dialog/KKDialogProvider;-><init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V

    .line 662
    .local v2, "provider":Lcom/pccw/dialog/KKDialogProvider;
    invoke-virtual {v2, p1, p0}, Lcom/pccw/dialog/KKDialogProvider;->requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;

    move-result-object v1

    .line 663
    .local v1, "kkDialog":Lcom/pccw/dialog/KKDialog;
    invoke-virtual {v1, p2}, Lcom/pccw/dialog/KKDialog;->setArguments(Landroid/os/Bundle;)V

    .line 664
    invoke-virtual {v1}, Lcom/pccw/dialog/KKDialog;->show()V

    .line 665
    return-void
.end method

.method private promptKKDialog(Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 3
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 653
    new-instance v0, Lcom/pccw/dialog/KKDialogBuilder;

    invoke-direct {v0}, Lcom/pccw/dialog/KKDialogBuilder;-><init>()V

    .line 654
    .local v0, "dialogBuilder":Lcom/pccw/dialog/KKDialogBuilder;
    new-instance v2, Lcom/pccw/dialog/KKDialogProvider;

    invoke-direct {v2, v0, p0}, Lcom/pccw/dialog/KKDialogProvider;-><init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V

    .line 655
    .local v2, "provider":Lcom/pccw/dialog/KKDialogProvider;
    invoke-virtual {v2, p1, p0}, Lcom/pccw/dialog/KKDialogProvider;->requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;

    move-result-object v1

    .line 656
    .local v1, "kkDialog":Lcom/pccw/dialog/KKDialog;
    invoke-virtual {v1}, Lcom/pccw/dialog/KKDialog;->show()V

    .line 657
    return-void
.end method

.method private sendMessage(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "chatId"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "recipient"    # Ljava/lang/String;
    .param p4, "chatType"    # Ljava/lang/String;

    .prologue
    .line 393
    invoke-static {}, Lcom/pccw/sms/service/SendSMSService;->getInstance()Lcom/pccw/sms/service/SendSMSService;

    move-result-object v1

    .line 395
    .local v1, "sendSMSService":Lcom/pccw/sms/service/SendSMSService;
    :try_start_0
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, p2, p1, v2}, Lcom/pccw/sms/service/SendSMSService;->sendMessage(Ljava/lang/String;ILandroid/content/Context;)V
    :try_end_0
    .catch Lcom/pccw/exception/NoNetworkException; {:try_start_0 .. :try_end_0} :catch_0

    .line 399
    :goto_0
    return-void

    .line 396
    :catch_0
    move-exception v0

    .line 397
    .local v0, "e":Lcom/pccw/exception/NoNetworkException;
    invoke-virtual {v0}, Lcom/pccw/exception/NoNetworkException;->printStackTrace()V

    goto :goto_0
.end method

.method private setViewAction()V
    .locals 2

    .prologue
    .line 199
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    new-instance v1, Lcom/pccw/sms/NewSMSActivity$1;

    invoke-direct {v1, p0}, Lcom/pccw/sms/NewSMSActivity$1;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1}, Lcom/pccw/sms/emoji/EmojiEditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    new-instance v1, Lcom/pccw/sms/NewSMSActivity$2;

    invoke-direct {v1, p0}, Lcom/pccw/sms/NewSMSActivity$2;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1}, Lcom/pccw/sms/emoji/EmojiEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 235
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    new-instance v1, Lcom/pccw/sms/NewSMSActivity$3;

    invoke-direct {v1, p0}, Lcom/pccw/sms/NewSMSActivity$3;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1}, Lcom/pccw/sms/emoji/EmojiEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 252
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    new-instance v1, Lcom/pccw/sms/NewSMSActivity$4;

    invoke-direct {v1, p0}, Lcom/pccw/sms/NewSMSActivity$4;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1}, Lcom/pccw/sms/emoji/EmojiEditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 275
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->addBtn:Landroid/widget/ImageButton;

    new-instance v1, Lcom/pccw/sms/NewSMSActivity$5;

    invoke-direct {v1, p0}, Lcom/pccw/sms/NewSMSActivity$5;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 284
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

    new-instance v1, Lcom/pccw/sms/NewSMSActivity$6;

    invoke-direct {v1, p0}, Lcom/pccw/sms/NewSMSActivity$6;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1}, Lcom/pccw/sms/emoji/EmojiEditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 331
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

    new-instance v1, Lcom/pccw/sms/NewSMSActivity$7;

    invoke-direct {v1, p0}, Lcom/pccw/sms/NewSMSActivity$7;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1}, Lcom/pccw/sms/emoji/EmojiEditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 343
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->sendBtn:Landroid/widget/ImageButton;

    new-instance v1, Lcom/pccw/sms/NewSMSActivity$8;

    invoke-direct {v1, p0}, Lcom/pccw/sms/NewSMSActivity$8;-><init>(Lcom/pccw/sms/NewSMSActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 363
    return-void
.end method


# virtual methods
.method public addRecipientTextView(Ljava/lang/String;)V
    .locals 13
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x4

    .line 454
    invoke-static {p1}, Lcom/pccw/sms/util/SMSNumberUtil;->trimSymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 455
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "input number : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    const-string/jumbo v8, ""

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 564
    :goto_0
    return-void

    .line 461
    :cond_0
    const/4 v2, 0x0

    .line 463
    .local v2, "isContains":Z
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "numbers.size : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/pccw/sms/NewSMSActivity;->numbers:Ljava/util/Map;

    invoke-interface {v10}, Ljava/util/Map;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 465
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0x19

    if-le v8, v9, :cond_1

    .line 466
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "number length over limit:25"

    invoke-static {v8, v9}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->hideSoftInput()V

    .line 468
    invoke-direct {p0, v11}, Lcom/pccw/sms/NewSMSActivity;->promptDialog(I)V

    goto :goto_0

    .line 472
    :cond_1
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->numbers:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    .line 473
    .local v4, "key":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Integer;>;"
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 474
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 475
    .local v7, "s":Ljava/lang/Integer;
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->numbers:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {p1}, Lcom/pccw/sms/util/SMSNumberUtil;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 476
    const/4 v2, 0x1

    goto :goto_1

    .line 480
    .end local v7    # "s":Ljava/lang/Integer;
    :cond_3
    if-nez v2, :cond_7

    .line 481
    invoke-static {p1}, Lcom/pccw/sms/util/SMSNumberUtil;->isValidRecipient(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 482
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    invoke-virtual {v8}, Lcom/pccw/sms/emoji/EmojiFlowLayout;->getChildCount()I

    move-result v8

    const/16 v9, 0xb

    if-ge v8, v9, :cond_5

    .line 483
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    .line 484
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->hideSoftInput()V

    .line 486
    invoke-static {p1}, Lcom/pccw/sms/util/SMSNumberUtil;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 487
    .local v5, "number":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/pccw/sms/NewSMSActivity;->getContactNameByPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 488
    .local v0, "contactName":Ljava/lang/String;
    if-eqz v0, :cond_4

    .line 489
    move-object p1, v0

    .line 494
    :goto_2
    new-instance v8, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    .line 496
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    invoke-virtual {v8, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 497
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    iget v9, p0, Lcom/pccw/sms/NewSMSActivity;->recipientId:I

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setId(I)V

    .line 498
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 499
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    const v9, 0x7f02051f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 500
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f09019a

    invoke-virtual {v8, v9, v10}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 503
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    const/16 v9, 0xa

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 504
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    const/16 v9, 0x11

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setGravity(I)V

    .line 507
    const/high16 v8, 0x42100000    # 36.0f

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    invoke-static {v12, v8, v9}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v8

    float-to-int v1, v8

    .line 509
    .local v1, "height":I
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v6, v8, v1, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 513
    .local v6, "params":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v6, v11, v11, v11, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 514
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 515
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    iget-object v9, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    invoke-virtual {v8, v9}, Lcom/pccw/sms/emoji/EmojiFlowLayout;->addView(Landroid/view/View;)V

    .line 516
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->numbers:Ljava/util/Map;

    iget v9, p0, Lcom/pccw/sms/NewSMSActivity;->recipientId:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v8, v9, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 517
    iget v8, p0, Lcom/pccw/sms/NewSMSActivity;->recipientId:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/pccw/sms/NewSMSActivity;->recipientId:I

    .line 519
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    const-string/jumbo v9, ""

    invoke-virtual {v8, v9}, Lcom/pccw/sms/emoji/EmojiEditText;->setText(Ljava/lang/CharSequence;)V

    .line 522
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addTextView:Landroid/widget/TextView;

    new-instance v9, Lcom/pccw/sms/NewSMSActivity$9;

    invoke-direct {v9, p0, v0}, Lcom/pccw/sms/NewSMSActivity$9;-><init>(Lcom/pccw/sms/NewSMSActivity;Ljava/lang/String;)V

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 563
    .end local v0    # "contactName":Ljava/lang/String;
    .end local v1    # "height":I
    .end local v5    # "number":Ljava/lang/String;
    .end local v6    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :goto_3
    const/4 v2, 0x0

    .line 564
    goto/16 :goto_0

    .line 491
    .restart local v0    # "contactName":Ljava/lang/String;
    .restart local v5    # "number":Ljava/lang/String;
    :cond_4
    move-object p1, v5

    goto/16 :goto_2

    .line 546
    .end local v0    # "contactName":Ljava/lang/String;
    .end local v5    # "number":Ljava/lang/String;
    :cond_5
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "recipient already more than 11"

    invoke-static {v8, v9}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 547
    const/4 v8, 0x5

    invoke-direct {p0, v8}, Lcom/pccw/sms/NewSMSActivity;->promptDialog(I)V

    goto :goto_3

    .line 552
    :cond_6
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "number is invalid"

    invoke-static {v8, v9}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->hideSoftInput()V

    .line 554
    invoke-direct {p0, v11}, Lcom/pccw/sms/NewSMSActivity;->promptDialog(I)V

    goto :goto_3

    .line 558
    :cond_7
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    const-string/jumbo v9, "number already exist"

    invoke-static {v8, v9}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 559
    iget-object v8, p0, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    const-string/jumbo v9, ""

    invoke-virtual {v8, v9}, Lcom/pccw/sms/emoji/EmojiEditText;->setText(Ljava/lang/CharSequence;)V

    .line 560
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->hideSoftInput()V

    goto :goto_3
.end method

.method public onClickKKDialogNegativeButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1062
    return-void
.end method

.method public onClickKKDialogNeutralButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1068
    return-void
.end method

.method public onClickKKDialogPositiveButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 3
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1039
    sget-object v1, Lcom/pccw/sms/NewSMSActivity$16;->$SwitchMap$com$pccw$dialog$EnumKKDialogType:[I

    invoke-virtual {p1}, Lcom/pccw/dialog/KKDialog;->getDialogType()Lcom/pccw/dialog/EnumKKDialogType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/pccw/dialog/EnumKKDialogType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 1056
    :cond_0
    :goto_0
    return-void

    .line 1041
    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.settings.WIFI_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1044
    :pswitch_1
    const-string/jumbo v1, ""

    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/pccw/sms/NewSMSActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1047
    :pswitch_2
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

    invoke-virtual {v1}, Lcom/pccw/sms/emoji/EmojiEditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 1048
    .local v0, "text":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1051
    invoke-direct {p0, v0}, Lcom/pccw/sms/NewSMSActivity;->createChatAndSendSMS(Ljava/lang/String;)V

    goto :goto_0

    .line 1039
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v5, 0x10

    .line 140
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 141
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 142
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 143
    invoke-virtual {v0, v5, v5}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 144
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 145
    .local v1, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f04001c

    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v6, 0x0

    invoke-virtual {v1, v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 146
    .local v2, "layout":Landroid/view/View;
    const v4, 0x7f0e0043

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 147
    .local v3, "title":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f070221

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 150
    const v4, 0x7f040023

    invoke-virtual {p0, v4}, Lcom/pccw/sms/NewSMSActivity;->setContentView(I)V

    .line 152
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->getInfoFromIntent()V

    .line 154
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->getViews()V

    .line 156
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->initContent()V

    .line 158
    invoke-direct {p0}, Lcom/pccw/sms/NewSMSActivity;->setViewAction()V

    .line 160
    iget-object v4, p0, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    invoke-virtual {v4}, Lcom/pccw/sms/emoji/EmojiFlowLayout;->getChildCount()I

    move-result v4

    if-lez v4, :cond_0

    .line 161
    iget-object v4, p0, Lcom/pccw/sms/NewSMSActivity;->sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

    invoke-virtual {v4}, Lcom/pccw/sms/emoji/EmojiEditText;->requestFocus()Z

    .line 165
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-object v4, p0, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    invoke-virtual {v4}, Lcom/pccw/sms/emoji/EmojiEditText;->requestFocus()Z

    goto :goto_0
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .locals 8
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
    const/4 v5, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 669
    packed-switch p1, :pswitch_data_0

    .line 684
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 671
    :pswitch_0
    if-eqz p2, :cond_0

    const-string/jumbo v0, "SEARCH_KEY"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "%%"

    const-string/jumbo v1, "SEARCH_KEY"

    .line 672
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 673
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    sget-object v2, Lcom/pccw/sms/NewSMSActivity$ContactQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/sms/NewSMSActivity$ContactQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v4, "(Replace(data1, \' \',\'\') LIKE ? or display_name LIKE ?)"

    new-array v5, v5, [Ljava/lang/String;

    const-string/jumbo v1, "SEARCH_KEY"

    .line 675
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v6

    const-string/jumbo v1, "SEARCH_KEY"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v7

    const-string/jumbo v6, "display_name"

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 678
    :cond_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    sget-object v2, Lcom/pccw/sms/NewSMSActivity$ContactQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/sms/NewSMSActivity$ContactQuery;->PROJECTION:[Ljava/lang/String;

    const-string/jumbo v4, "(Replace(data1, \' \',\'\') LIKE ? or display_name LIKE ?)"

    new-array v5, v5, [Ljava/lang/String;

    const-string/jumbo v1, ""

    aput-object v1, v5, v6

    const-string/jumbo v1, ""

    aput-object v1, v5, v7

    const-string/jumbo v6, "display_name"

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 669
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
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
    .line 690
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    if-eqz p2, :cond_0

    invoke-interface {p2}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 691
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 701
    :cond_0
    :goto_0
    return-void

    .line 693
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    invoke-virtual {v0, p2}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 694
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    monitor-enter v1

    .line 695
    :try_start_0
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 696
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 691
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 93
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/pccw/sms/NewSMSActivity;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

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
    .line 705
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity;->mContactAdapter:Lcom/pccw/sms/NewSMSActivity$ContactAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pccw/sms/NewSMSActivity$ContactAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 707
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 711
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 718
    :goto_0
    return v1

    .line 713
    :pswitch_0
    invoke-virtual {p0}, Lcom/pccw/sms/NewSMSActivity;->finish()V

    goto :goto_0

    .line 711
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method
