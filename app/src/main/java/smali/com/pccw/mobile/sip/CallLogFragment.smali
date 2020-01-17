.class public Lcom/pccw/mobile/sip/CallLogFragment;
.super Landroid/support/v4/app/Fragment;
.source "CallLogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;
.implements Lcom/pccw/dialog/listener/IKKDialogOnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;,
        Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;,
        Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;,
        Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;,
        Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;,
        Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;,
        Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;,
        Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;,
        Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemViews;
    }
.end annotation


# static fields
.field static final ALL_HISTORY_CHATID_COLUMN_INDEX:I = 0xa

.field static final ALL_HISTORY_CHATNUMBER_COLUMN_INDEX:I = 0x8

.field static final ALL_HISTORY_ENTRYTYPE_COLUMN_INDEX:I = 0xb

.field static final ALL_HISTORY_ISIMUSER_COLUMN_INDEX:I = 0xd

.field static final ALL_HISTORY_MESSAGETYPE_COLUMN_INDEX:I = 0xe

.field static final ALL_HISTORY_TEXTMESSAGE_COLUMN_INDEX:I = 0x9

.field static final ALL_HISTORY_UNREADCOUNT_COLUMN_INDEX:I = 0xc

.field static final CALLER_NAME_COLUMN_INDEX:I = 0x5

.field static final CALLER_NUMBERLABEL_COLUMN_INDEX:I = 0x7

.field static final CALLER_NUMBERTYPE_COLUMN_INDEX:I = 0x6

.field static final CALL_LOG_PROJECTION:[Ljava/lang/String;

.field static final CALL_TYPE_COLUMN_INDEX:I = 0x4

.field static final CHAT_RECORD_PROJECTION:[Ljava/lang/String;

.field static final CONTACT_PHOTO_PROJECTION:[Ljava/lang/String;

.field static final CONTACT_PHOTO_PROJECTION_LOWER_API11:[Ljava/lang/String;

.field static final DATE_COLUMN_INDEX:I = 0x2

.field static final DURATION_COLUMN_INDEX:I = 0x3

.field public static final EXIT_MENU_ITEM:I = 0x2

.field public static final FIRST_MENU_ID:I = 0x1

.field private static final FORMATTING_TYPE_INVALID:I = -0x1

.field static final ID_COLUMN_INDEX:I = 0x0

.field static final LABEL_COLUMN_INDEX:I = 0x3

.field static final MATCHED_NUMBER_COLUMN_INDEX:I = 0x4

.field static final NAME_COLUMN_INDEX:I = 0x1

.field static final NUMBER_COLUMN_INDEX:I = 0x1

.field static final PERSON_ID_COLUMN_INDEX:I = 0x0

.field static final PHONES_PROJECTION:[Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation
.end field

.field static final PHONES_PROJECTION_LOWER_API11:[Ljava/lang/String;

.field static final PHONE_TYPE_COLUMN_INDEX:I = 0x2

.field static final PHOTO_THUMBNAIL_URI_INDEX:I = 0x5

.field private static final QUERY_TOKEN:I = 0x35

.field private static final QUERY_TYPE_ALL:I = 0x2

.field private static final QUERY_TYPE_CALLLOG:I = 0x0

.field private static final QUERY_TYPE_SMS:I = 0x1

.field private static final REDRAW_ALL:I = 0x2

.field private static final REDRAW_TEXTVIEW:I = 0x4

.field private static final REDRAW_THUMB:I = 0x3

.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"

.field private static final START_THREAD:I = 0x1

.field private static final TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field private static final UPDATE_TOKEN:I = 0x38

.field private static activity:Landroid/app/Activity;

.field private static ctx:Landroid/content/Context;

.field private static mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

.field static mAllHistoryIMServer:Lcom/pccw/sms/service/AllHistoryIMServer;

.field private static mCallerIdThread:Ljava/lang/Thread;

.field private static volatile mDone:Z

.field private static final sEditable:Landroid/text/SpannableStringBuilder;

.field private static sFormattingType:I


# instance fields
.field allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

.field callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

.field private contactHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;",
            ">;"
        }
    .end annotation
.end field

.field conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

.field private currentQuery:I

.field historyList:Landroid/widget/ListView;

.field historySelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

.field private mFirst:Z

.field private mHandler:Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;

.field private mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private mQueryHandler:Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;

.field private mRequests:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;",
            ">;"
        }
    .end annotation
.end field

.field messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

.field targerNumber:Ljava/lang/String;

.field private updatePendingHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 112
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    .line 123
    const/4 v0, -0x1

    sput v0, Lcom/pccw/mobile/sip/CallLogFragment;->sFormattingType:I

    .line 149
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

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->CALL_LOG_PROJECTION:[Ljava/lang/String;

    .line 175
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

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->PHONES_PROJECTION:[Ljava/lang/String;

    .line 180
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

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->PHONES_PROJECTION_LOWER_API11:[Ljava/lang/String;

    .line 195
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    sget-object v1, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_ID:Ljava/lang/String;

    aput-object v1, v0, v3

    sget-object v1, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_TYPE:Ljava/lang/String;

    aput-object v1, v0, v4

    sget-object v1, Lcom/pccw/mobile/service/CombineHistoryService;->CHAT_NAME:Ljava/lang/String;

    aput-object v1, v0, v5

    sget-object v1, Lcom/pccw/mobile/service/CombineHistoryService;->LAST_MESSAGE:Ljava/lang/String;

    aput-object v1, v0, v6

    sget-object v1, Lcom/pccw/mobile/service/CombineHistoryService;->LAST_MESSAGE_TIME:Ljava/lang/String;

    aput-object v1, v0, v7

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->CHAT_RECORD_PROJECTION:[Ljava/lang/String;

    .line 204
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "photo_thumb_uri"

    aput-object v1, v0, v4

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->CONTACT_PHOTO_PROJECTION:[Ljava/lang/String;

    .line 208
    new-array v0, v5, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v4

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->CONTACT_PHOTO_PROJECTION_LOWER_API11:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 93
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 144
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    return-void
.end method

.method static synthetic access$000()Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;
    .locals 1

    .prologue
    .line 93
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/pccw/mobile/sip/CallLogFragment;)Ljava/util/HashMap;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->contactHashMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Landroid/widget/ImageView;Lcom/pccw/android/common/widget/TypefacedTextView;Lcom/pccw/android/common/widget/TypefacedTextView;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # I
    .param p5, "x5"    # Ljava/lang/String;
    .param p6, "x6"    # Landroid/widget/ImageView;
    .param p7, "x7"    # Lcom/pccw/android/common/widget/TypefacedTextView;
    .param p8, "x8"    # Lcom/pccw/android/common/widget/TypefacedTextView;

    .prologue
    .line 93
    invoke-direct/range {p0 .. p8}, Lcom/pccw/mobile/sip/CallLogFragment;->enqueueRequest(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Landroid/widget/ImageView;Lcom/pccw/android/common/widget/TypefacedTextView;Lcom/pccw/android/common/widget/TypefacedTextView;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CallLogFragment;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1300(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;

    .prologue
    .line 93
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sip/CallLogFragment;->putPendingItemIntoHash(Ljava/lang/String;Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Z

    .prologue
    .line 93
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/pccw/mobile/sip/CallLogFragment;->popupChatSelection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$1500()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 93
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$200()Landroid/content/Context;
    .locals 1

    .prologue
    .line 93
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$300()Landroid/database/Cursor;
    .locals 1

    .prologue
    .line 93
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->prepaidMixtureHistory()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/CallLogFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;
    .param p1, "x1"    # I

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CallLogFragment;->historyLayoutSelector(I)V

    return-void
.end method

.method static synthetic access$600(Lcom/pccw/mobile/sip/CallLogFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;

    .prologue
    .line 93
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->startRequestProcessing()V

    return-void
.end method

.method static synthetic access$700(Lcom/pccw/mobile/sip/CallLogFragment;Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;
    .param p1, "x1"    # Landroid/widget/ImageView;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sip/CallLogFragment;->updateProfileImage(Landroid/widget/ImageView;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$900(Lcom/pccw/mobile/sip/CallLogFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/CallLogFragment;

    .prologue
    .line 93
    iget v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    return v0
.end method

.method private clearCache()V
    .locals 2

    .prologue
    .line 814
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->contactHashMap:Ljava/util/HashMap;

    monitor-enter v1

    .line 815
    :try_start_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->contactHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 816
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 817
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->updatePendingHashMap:Ljava/util/HashMap;

    monitor-enter v1

    .line 818
    :try_start_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->updatePendingHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 819
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 820
    return-void

    .line 816
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 819
    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method

.method private createFailToast(Ljava/lang/String;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 1771
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1772
    return-void
.end method

.method private enqueueRequest(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Landroid/widget/ImageView;Lcom/pccw/android/common/widget/TypefacedTextView;Lcom/pccw/android/common/widget/TypefacedTextView;)V
    .locals 3
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "numberType"    # I
    .param p5, "numberLabel"    # Ljava/lang/String;
    .param p6, "imageView"    # Landroid/widget/ImageView;
    .param p7, "textView"    # Lcom/pccw/android/common/widget/TypefacedTextView;
    .param p8, "labelView"    # Lcom/pccw/android/common/widget/TypefacedTextView;

    .prologue
    .line 896
    new-instance v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;-><init>()V

    .line 897
    .local v0, "ciq":Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;
    iput-object p1, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    .line 898
    iput p2, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->position:I

    .line 899
    iput-object p3, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->name:Ljava/lang/String;

    .line 900
    iput p4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->numberType:I

    .line 901
    iput-object p5, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->numberLabel:Ljava/lang/String;

    .line 902
    iput-object p6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->imageView:Landroid/widget/ImageView;

    .line 903
    iput-object p7, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->textView:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 904
    iput-object p8, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 905
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    monitor-enter v2

    .line 906
    :try_start_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 907
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 908
    monitor-exit v2

    .line 909
    return-void

    .line 908
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private forceQuertContactInfo(Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Landroid/widget/ImageView;Lcom/pccw/android/common/widget/TypefacedTextView;Lcom/pccw/android/common/widget/TypefacedTextView;)V
    .locals 1
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "numberType"    # I
    .param p5, "numberLabel"    # Ljava/lang/String;
    .param p6, "imageView"    # Landroid/widget/ImageView;
    .param p7, "textView"    # Lcom/pccw/android/common/widget/TypefacedTextView;
    .param p8, "labelView"    # Lcom/pccw/android/common/widget/TypefacedTextView;

    .prologue
    .line 912
    new-instance v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;-><init>()V

    .line 913
    .local v0, "ciq":Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;
    iput-object p1, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    .line 914
    iput p2, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->position:I

    .line 915
    iput-object p3, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->name:Ljava/lang/String;

    .line 916
    iput p4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->numberType:I

    .line 917
    iput-object p5, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->numberLabel:Ljava/lang/String;

    .line 918
    iput-object p6, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->imageView:Landroid/widget/ImageView;

    .line 919
    iput-object p7, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->textView:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 920
    iput-object p8, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    .line 921
    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->queryContactInfo(Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;)V

    .line 922
    return-void
.end method

.method private formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 618
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 619
    const-string/jumbo v1, ""

    .line 634
    :goto_0
    return-object v1

    .line 623
    :cond_0
    sget v1, Lcom/pccw/mobile/sip/CallLogFragment;->sFormattingType:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    .line 624
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->getFormatTypeForLocale(Ljava/util/Locale;)I

    move-result v1

    sput v1, Lcom/pccw/mobile/sip/CallLogFragment;->sFormattingType:I

    .line 628
    :cond_1
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->convertKeypadLettersToDigits(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 627
    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 630
    .local v0, "unformattedNumber":Ljava/lang/String;
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->clear()V

    .line 631
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 633
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    sget v2, Lcom/pccw/mobile/sip/CallLogFragment;->sFormattingType:I

    invoke-static {v1, v2}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Landroid/text/Editable;I)V

    .line 634
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->sEditable:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/sms/bean/SMSConstants;->formatPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private getPendingItemListFromHash(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;",
            ">;"
        }
    .end annotation

    .prologue
    .line 823
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->updatePendingHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 824
    .local v0, "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 827
    .end local v0    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    :goto_0
    return-object v0

    .restart local v0    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0
.end method

.method private historyLayoutSelector(I)V
    .locals 7
    .param p1, "queryType"    # I

    .prologue
    const/4 v6, 0x2

    const v5, 0x7f0b0052

    const/4 v4, 0x0

    const v3, 0x7f0b0077

    const/4 v2, 0x1

    .line 536
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->stopRequestProcessing()V

    .line 539
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    if-eqz v0, :cond_0

    .line 540
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->clearCache()V

    .line 541
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->clearImgCache()V

    .line 544
    :cond_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    monitor-enter v1

    .line 545
    :try_start_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 546
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 548
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 549
    iput-boolean v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mFirst:Z

    .line 550
    packed-switch p1, :pswitch_data_0

    .line 591
    :goto_0
    return-void

    .line 546
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 552
    :pswitch_0
    iput v6, p0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    .line 554
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v4}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 555
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 556
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 558
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historySelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    const v1, 0x7f020425

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->setBackgroundResource(I)V

    .line 559
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 560
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 561
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 562
    invoke-direct {p0, v6}, Lcom/pccw/mobile/sip/CallLogFragment;->startQuery(I)V

    goto :goto_0

    .line 565
    :pswitch_1
    iput v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    .line 567
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 568
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v4}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 569
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 571
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historySelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    const v1, 0x7f0200c7

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->setBackgroundResource(I)V

    .line 572
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 573
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 574
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 575
    invoke-direct {p0, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->startQuery(I)V

    goto/16 :goto_0

    .line 578
    :pswitch_2
    iput v4, p0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    .line 580
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 581
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v2}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 582
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v4}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 584
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historySelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    const v1, 0x7f0200c8

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->setBackgroundResource(I)V

    .line 585
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 586
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 587
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setTextColor(I)V

    .line 588
    invoke-direct {p0, v4}, Lcom/pccw/mobile/sip/CallLogFragment;->startQuery(I)V

    goto/16 :goto_0

    .line 550
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static isNumberWithinContact(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 10
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x1

    const/4 v3, 0x0

    const/4 v9, 0x0

    .line 1783
    sget-object v0, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    .line 1785
    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1783
    invoke-static {v0, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 1786
    .local v1, "lookupUri":Landroid/net/Uri;
    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const-string/jumbo v0, "_id"

    aput-object v0, v2, v9

    const-string/jumbo v0, "number"

    aput-object v0, v2, v8

    const/4 v0, 0x2

    const-string/jumbo v4, "display_name"

    aput-object v4, v2, v0

    .line 1787
    .local v2, "mPhoneNumberProjection":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1789
    .local v6, "cur":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1790
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is within Contact List"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1797
    if-eqz v6, :cond_0

    .line 1798
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_0
    move v0, v8

    .line 1802
    :goto_0
    return v0

    .line 1797
    :cond_1
    if-eqz v6, :cond_2

    .line 1798
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1801
    :cond_2
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is NOT within Contact List"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v9

    .line 1802
    goto :goto_0

    .line 1793
    :catch_0
    move-exception v7

    .line 1794
    .local v7, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v0, "KKIM"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " -- Number "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is NOT within Contact List -- ERROR"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1797
    if-eqz v6, :cond_3

    .line 1798
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    move v0, v9

    .line 1795
    goto :goto_0

    .line 1797
    .end local v7    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_4

    .line 1798
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v0
.end method

.method private static mixedAllChatRecord()Landroid/database/Cursor;
    .locals 3

    .prologue
    .line 600
    new-instance v0, Lcom/pccw/sms/service/ChatRecordService;

    sget-object v2, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 601
    .local v0, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    invoke-virtual {v0}, Lcom/pccw/sms/service/ChatRecordService;->getAllChatRecordCursor()Landroid/database/Cursor;

    move-result-object v1

    .line 603
    .local v1, "mixHistoryCursor":Landroid/database/Cursor;
    return-object v1
.end method

.method private popupChatSelection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 8
    .param p1, "chatType"    # Ljava/lang/String;
    .param p2, "contactGroupId"    # Ljava/lang/String;
    .param p3, "crChatid"    # Ljava/lang/String;
    .param p4, "hasContact"    # Z

    .prologue
    const/4 v7, 0x1

    .line 1726
    new-array v3, v7, [Ljava/lang/String;

    const/4 v4, 0x0

    .line 1727
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07007e

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 1729
    .local v3, "option":[Ljava/lang/String;
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    const v5, 0x7f040041

    invoke-direct {v0, v4, v5, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 1730
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1731
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1, v7}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1732
    new-instance v4, Lcom/pccw/mobile/sip/CallLogFragment$4;

    invoke-direct {v4, p0, p1, p3, p2}, Lcom/pccw/mobile/sip/CallLogFragment$4;-><init>(Lcom/pccw/mobile/sip/CallLogFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v0, v4}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1765
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 1766
    .local v2, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v2, v7}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 1767
    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 1768
    return-void
.end method

.method private static prepaidMixtureHistory()Landroid/database/Cursor;
    .locals 2

    .prologue
    .line 595
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->mAllHistoryIMServer:Lcom/pccw/sms/service/AllHistoryIMServer;

    invoke-virtual {v1}, Lcom/pccw/sms/service/AllHistoryIMServer;->getAllHistoryCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 596
    .local v0, "mixHistoryCursor":Landroid/database/Cursor;
    return-object v0
.end method

.method private promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 4
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 1806
    new-instance v0, Lcom/pccw/dialog/KKDialogBuilder;

    invoke-direct {v0}, Lcom/pccw/dialog/KKDialogBuilder;-><init>()V

    .line 1807
    .local v0, "dialogBuilder":Lcom/pccw/dialog/KKDialogBuilder;
    new-instance v2, Lcom/pccw/dialog/KKDialogProvider;

    sget-object v3, Lcom/pccw/mobile/sip/CallLogFragment;->activity:Landroid/app/Activity;

    invoke-direct {v2, v0, v3}, Lcom/pccw/dialog/KKDialogProvider;-><init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V

    .line 1808
    .local v2, "provider":Lcom/pccw/dialog/KKDialogProvider;
    invoke-virtual {v2, p1, p0}, Lcom/pccw/dialog/KKDialogProvider;->requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;

    move-result-object v1

    .line 1809
    .local v1, "kkDialog":Lcom/pccw/dialog/KKDialog;
    invoke-virtual {v1}, Lcom/pccw/dialog/KKDialog;->show()V

    .line 1810
    return-void
.end method

.method private putPendingItemIntoHash(Ljava/lang/String;Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "item"    # Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;

    .prologue
    .line 832
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 834
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/CallLogFragment;->getPendingItemListFromHash(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 835
    .local v0, "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 836
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->updatePendingHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 837
    const-string/jumbo v1, "PCCW_MOBILE_SIP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "putPendingItemIntoHash(), updatePendingHashMap.size(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment;->updatePendingHashMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 839
    .end local v0    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    :cond_0
    return-void
.end method

.method private queryContactInfo(Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;)V
    .locals 20
    .param p1, "ciq"    # Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;

    .prologue
    .line 925
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->imageView:Landroid/widget/ImageView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    iget v5, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->position:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 926
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment;->contactHashMap:Ljava/util/HashMap;

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    .line 929
    .local v8, "contact":Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;
    if-eqz v8, :cond_2

    sget-object v2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->EMPTY:Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    if-eq v8, v2, :cond_2

    .line 1039
    :cond_0
    :goto_0
    if-eqz v8, :cond_1

    .line 1040
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v8}, Lcom/pccw/mobile/sip/CallLogFragment;->updateCallLog(Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;)V

    .line 1041
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v8}, Lcom/pccw/mobile/sip/CallLogFragment;->updateRecipientInfo(Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;)V

    .line 1042
    const/4 v2, 0x0

    iput-boolean v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->isChecking:Z

    .line 1044
    :cond_1
    return-void

    .line 935
    :cond_2
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 936
    sget-object v2, Landroid/provider/ContactsContract$PhoneLookup;->CONTENT_FILTER_URI:Landroid/net/Uri;

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    .line 937
    invoke-static {v4}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 936
    invoke-static {v2, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 938
    .local v3, "uri":Landroid/net/Uri;
    sget-object v2, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/16 v4, 0xb

    .line 940
    invoke-static {v4}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v4

    if-eqz v4, :cond_5

    sget-object v4, Lcom/pccw/mobile/sip/CallLogFragment;->PHONES_PROJECTION:[Ljava/lang/String;

    :goto_1
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 938
    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 943
    .local v15, "phonesCursor":Landroid/database/Cursor;
    if-eqz v15, :cond_0

    .line 944
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-eqz v2, :cond_e

    .line 945
    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 946
    new-instance v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    .end local v8    # "contact":Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;
    const/4 v2, 0x0

    invoke-direct {v8, v2}, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;-><init>(Lcom/pccw/mobile/sip/CallLogFragment$1;)V

    .line 947
    .restart local v8    # "contact":Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;
    const/4 v2, 0x0

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->personId:J

    .line 948
    iget-object v13, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    .line 949
    .local v13, "oldContactName":Ljava/lang/String;
    if-nez v13, :cond_3

    .line 950
    const-string/jumbo v13, ""

    .line 951
    :cond_3
    const/4 v2, 0x1

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    .line 952
    const/4 v2, 0x2

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->numberType:I

    .line 953
    const/4 v2, 0x3

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->label:Ljava/lang/String;

    .line 954
    const/4 v2, 0x4

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->number:Ljava/lang/String;

    .line 955
    iget-object v14, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    .line 956
    .local v14, "oldContactUri":Ljava/lang/String;
    const/4 v2, 0x5

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    .line 957
    if-nez v14, :cond_4

    .line 958
    const-string/jumbo v14, ""

    .line 968
    :cond_4
    const/4 v2, 0x0

    iput-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->formattedNumber:Ljava/lang/String;

    .line 969
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment;->contactHashMap:Ljava/util/HashMap;

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v2, v4, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 970
    const/4 v2, 0x0

    iput-boolean v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->isChecking:Z

    .line 973
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    monitor-enter v4

    .line 977
    :try_start_0
    iget-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    iget-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    .line 978
    invoke-virtual {v14, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 980
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 981
    .local v17, "thumbList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;>;"
    new-instance v2, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->imageView:Landroid/widget/ImageView;

    iget-object v6, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v0, p1

    iget v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->position:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-direct {v2, v5, v6, v7, v0}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;-><init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 982
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->getPendingItemListFromHash(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 983
    .local v10, "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;

    .line 984
    .local v9, "item":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;
    iget-object v5, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->profile:Landroid/widget/ImageView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->position:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 985
    new-instance v5, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;

    iget-object v6, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->profile:Landroid/widget/ImageView;

    iget-object v7, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->thumbnailUri:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v18, v0

    iget v0, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->position:I

    move/from16 v19, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v5, v6, v7, v0, v1}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;-><init>(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1033
    .end local v9    # "item":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;
    .end local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    .end local v17    # "thumbList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;>;"
    :catchall_0
    move-exception v2

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 940
    .end local v13    # "oldContactName":Ljava/lang/String;
    .end local v14    # "oldContactUri":Ljava/lang/String;
    .end local v15    # "phonesCursor":Landroid/database/Cursor;
    :cond_5
    sget-object v4, Lcom/pccw/mobile/sip/CallLogFragment;->PHONES_PROJECTION_LOWER_API11:[Ljava/lang/String;

    goto/16 :goto_1

    .line 988
    .restart local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    .restart local v13    # "oldContactName":Ljava/lang/String;
    .restart local v14    # "oldContactUri":Ljava/lang/String;
    .restart local v15    # "phonesCursor":Landroid/database/Cursor;
    .restart local v17    # "thumbList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;>;"
    :cond_6
    :try_start_1
    new-instance v11, Landroid/os/Message;

    invoke-direct {v11}, Landroid/os/Message;-><init>()V

    .line 989
    .local v11, "msg":Landroid/os/Message;
    const/4 v2, 0x3

    iput v2, v11, Landroid/os/Message;->what:I

    .line 990
    move-object/from16 v0, v17

    iput-object v0, v11, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 991
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment;->mHandler:Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;

    invoke-virtual {v2, v11}, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;->sendMessage(Landroid/os/Message;)Z

    .line 995
    .end local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    .end local v11    # "msg":Landroid/os/Message;
    .end local v17    # "thumbList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemImageview;>;"
    :cond_7
    iget-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    iget-object v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    .line 996
    invoke-virtual {v13, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 997
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 998
    .local v16, "textViewList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;>;"
    new-instance v2, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->textView:Lcom/pccw/android/common/widget/TypefacedTextView;

    iget-object v6, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v0, p1

    iget v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->position:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-direct {v2, v5, v6, v7, v0}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;-><init>(Lcom/pccw/android/common/widget/TypefacedTextView;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 999
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->getPendingItemListFromHash(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 1000
    .restart local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;

    .line 1001
    .restart local v9    # "item":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;
    iget-object v5, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->name:Lcom/pccw/android/common/widget/TypefacedTextView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->position:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setTag(Ljava/lang/Object;)V

    .line 1002
    new-instance v5, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;

    iget-object v6, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->name:Lcom/pccw/android/common/widget/TypefacedTextView;

    iget-object v7, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v18, v0

    iget v0, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->position:I

    move/from16 v19, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v5, v6, v7, v0, v1}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;-><init>(Lcom/pccw/android/common/widget/TypefacedTextView;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1005
    .end local v9    # "item":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;
    :cond_8
    new-instance v11, Landroid/os/Message;

    invoke-direct {v11}, Landroid/os/Message;-><init>()V

    .line 1006
    .restart local v11    # "msg":Landroid/os/Message;
    const/4 v2, 0x4

    iput v2, v11, Landroid/os/Message;->what:I

    .line 1007
    move-object/from16 v0, v16

    iput-object v0, v11, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1008
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment;->mHandler:Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;

    invoke-virtual {v2, v11}, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;->sendMessage(Landroid/os/Message;)Z

    .line 1012
    .end local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    .end local v11    # "msg":Landroid/os/Message;
    .end local v16    # "textViewList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;>;"
    :cond_9
    iget v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->numberType:I

    if-eqz v2, :cond_d

    move-object/from16 v0, p0

    iget v2, v0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    if-nez v2, :cond_d

    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    if-eqz v2, :cond_d

    .line 1015
    iget v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->numberType:I

    if-nez v2, :cond_b

    iget-object v12, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->label:Ljava/lang/String;

    .line 1017
    .local v12, "numberLabel":Ljava/lang/CharSequence;
    :goto_4
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 1018
    .restart local v16    # "textViewList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;>;"
    new-instance v2, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->labelView:Lcom/pccw/android/common/widget/TypefacedTextView;

    invoke-interface {v12}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v0, p1

    iget v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->position:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-direct {v2, v5, v6, v7, v0}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;-><init>(Lcom/pccw/android/common/widget/TypefacedTextView;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1019
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->getPendingItemListFromHash(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 1020
    .restart local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;

    .line 1021
    .restart local v9    # "item":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;
    iget-object v5, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->label:Lcom/pccw/android/common/widget/TypefacedTextView;

    if-eqz v5, :cond_a

    .line 1022
    iget-object v5, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->label:Lcom/pccw/android/common/widget/TypefacedTextView;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->position:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/pccw/android/common/widget/TypefacedTextView;->setTag(Ljava/lang/Object;)V

    .line 1023
    new-instance v5, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;

    iget-object v6, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->label:Lcom/pccw/android/common/widget/TypefacedTextView;

    invoke-interface {v12}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    move-object/from16 v18, v0

    iget v0, v9, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;->position:I

    move/from16 v19, v0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-direct {v5, v6, v7, v0, v1}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;-><init>(Lcom/pccw/android/common/widget/TypefacedTextView;Ljava/lang/String;Ljava/lang/String;I)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 1015
    .end local v9    # "item":Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;
    .end local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    .end local v12    # "numberLabel":Ljava/lang/CharSequence;
    .end local v16    # "textViewList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;>;"
    :cond_b
    iget v2, v8, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->numberType:I

    .line 1016
    invoke-static {v2}, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->getTypeLabelResource(I)I

    move-result v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_4

    .line 1027
    .restart local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    .restart local v12    # "numberLabel":Ljava/lang/CharSequence;
    .restart local v16    # "textViewList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;>;"
    :cond_c
    new-instance v11, Landroid/os/Message;

    invoke-direct {v11}, Landroid/os/Message;-><init>()V

    .line 1028
    .restart local v11    # "msg":Landroid/os/Message;
    const/4 v2, 0x4

    iput v2, v11, Landroid/os/Message;->what:I

    .line 1029
    move-object/from16 v0, v16

    iput-object v0, v11, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1030
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/pccw/mobile/sip/CallLogFragment;->mHandler:Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;

    invoke-virtual {v2, v11}, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;->sendMessage(Landroid/os/Message;)Z

    .line 1033
    .end local v10    # "itemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemPendingViews;>;"
    .end local v11    # "msg":Landroid/os/Message;
    .end local v12    # "numberLabel":Ljava/lang/CharSequence;
    .end local v16    # "textViewList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/mobile/sip/CallLogFragment$CallLogItemTextview;>;"
    :cond_d
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1035
    .end local v13    # "oldContactName":Ljava/lang/String;
    .end local v14    # "oldContactUri":Ljava/lang/String;
    :cond_e
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
.end method

.method private resetNewCallsFlag()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    .line 639
    new-instance v7, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "type="

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 640
    .local v7, "where":Ljava/lang/StringBuilder;
    const/4 v0, 0x3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 641
    const-string/jumbo v0, " AND new=1"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 643
    new-instance v4, Landroid/content/ContentValues;

    const/4 v0, 0x1

    invoke-direct {v4, v0}, Landroid/content/ContentValues;-><init>(I)V

    .line 644
    .local v4, "values":Landroid/content/ContentValues;
    const-string/jumbo v0, "new"

    const-string/jumbo v1, "0"

    invoke-virtual {v4, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 646
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mQueryHandler:Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;

    const/16 v1, 0x38

    sget-object v3, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object v6, v2

    invoke-virtual/range {v0 .. v6}, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;->startUpdate(ILjava/lang/Object;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)V

    .line 647
    return-void
.end method

.method private startQuery(I)V
    .locals 11
    .param p1, "queryType"    # I

    .prologue
    const/4 v5, 0x0

    const/16 v1, 0x35

    const/4 v3, 0x0

    .line 650
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->access$100(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Z)V

    .line 651
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mQueryHandler:Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;->cancelOperation(I)V

    .line 653
    packed-switch p1, :pswitch_data_0

    .line 678
    :goto_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historyList:Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->setSelectionAfterHeaderView()V

    .line 679
    return-void

    .line 656
    :pswitch_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mQueryHandler:Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    sget-object v4, Lcom/pccw/mobile/sip/CallLogFragment;->CALL_LOG_PROJECTION:[Ljava/lang/String;

    const-string/jumbo v7, "date DESC"

    move-object v6, v5

    invoke-virtual/range {v0 .. v7}, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;->startQuery(ILjava/lang/Object;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 661
    :pswitch_1
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->prepaidMixtureHistory()Landroid/database/Cursor;

    move-result-object v10

    .line 663
    .local v10, "tempCursor":Landroid/database/Cursor;
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->mixedAllChatRecord()Landroid/database/Cursor;

    move-result-object v9

    .line 664
    .local v9, "allRecordCursor":Landroid/database/Cursor;
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    invoke-static {v0, v3}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->access$100(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Z)V

    .line 665
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    invoke-virtual {v0, v9}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 669
    .end local v9    # "allRecordCursor":Landroid/database/Cursor;
    .end local v10    # "tempCursor":Landroid/database/Cursor;
    :pswitch_2
    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->prepaidMixtureHistory()Landroid/database/Cursor;

    move-result-object v8

    .line 670
    .local v8, "allHistoryCursor":Landroid/database/Cursor;
    const-string/jumbo v0, "KKIM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Mix cursor count="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    invoke-static {v0, v3}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->access$100(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Z)V

    .line 672
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    invoke-virtual {v0, v8}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->changeCursor(Landroid/database/Cursor;)V

    goto :goto_0

    .line 653
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private startRequestProcessing()V
    .locals 2

    .prologue
    .line 795
    const/4 v0, 0x0

    sput-boolean v0, Lcom/pccw/mobile/sip/CallLogFragment;->mDone:Z

    .line 796
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mCallerIdThread:Ljava/lang/Thread;

    .line 797
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mCallerIdThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 798
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mCallerIdThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 799
    return-void
.end method

.method private stopRequestProcessing()V
    .locals 1

    .prologue
    .line 808
    const/4 v0, 0x1

    sput-boolean v0, Lcom/pccw/mobile/sip/CallLogFragment;->mDone:Z

    .line 809
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mCallerIdThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 810
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mCallerIdThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 811
    :cond_0
    return-void
.end method

.method private updateCallLog(Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;)V
    .locals 5
    .param p1, "ciq"    # Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;
    .param p2, "contact"    # Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    .prologue
    .line 843
    iget-object v1, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->name:Ljava/lang/String;

    iget-object v2, p2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->numberLabel:Ljava/lang/String;

    iget-object v2, p2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->label:Ljava/lang/String;

    .line 844
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->numberType:I

    iget v2, p2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->numberType:I

    if-ne v1, v2, :cond_0

    .line 873
    :goto_0
    return-void

    .line 854
    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    .line 855
    .local v0, "values":Landroid/content/ContentValues;
    const-string/jumbo v1, "name"

    iget-object v2, p2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 856
    const-string/jumbo v1, "numbertype"

    iget v2, p2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->numberType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 857
    const-string/jumbo v1, "numberlabel"

    iget-object v2, p2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->label:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 861
    :try_start_0
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "number=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

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

    .line 863
    :catch_0
    move-exception v1

    goto :goto_0

    .line 869
    :catch_1
    move-exception v1

    goto :goto_0

    .line 866
    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method private updateProfileImage(Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 2
    .param p1, "imageView"    # Landroid/widget/ImageView;
    .param p2, "imagePath"    # Ljava/lang/String;

    .prologue
    .line 802
    const-string/jumbo v0, "KKIM"

    const-string/jumbo v1, "up updateProfileImage"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 803
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    if-eqz v0, :cond_0

    .line 804
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->updateProfileHead(Landroid/widget/ImageView;Ljava/lang/String;)V

    .line 805
    :cond_0
    return-void
.end method

.method private updateRecipientInfo(Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;)V
    .locals 4
    .param p1, "ciq"    # Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;
    .param p2, "contact"    # Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;

    .prologue
    .line 877
    iget-object v1, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->name:Ljava/lang/String;

    iget-object v2, p2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 893
    :goto_0
    return-void

    .line 881
    :cond_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    iget-object v2, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/pccw/sms/service/ConversationParticipantItemService;->isDuplicatedUsername(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 882
    const-string/jumbo v1, "KKSMS"

    const-string/jumbo v2, "Recipient not exist in UserInfo table, don\'t update"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 891
    :cond_1
    new-instance v0, Lcom/pccw/database/entity/UserInfo;

    iget-object v1, p1, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;->number:Ljava/lang/String;

    iget-object v2, p2, Lcom/pccw/mobile/sip/CallLogFragment$ContactInfo;->name:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-direct {v0, v1, v2, v3}, Lcom/pccw/database/entity/UserInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 892
    .local v0, "userInfo":Lcom/pccw/database/entity/UserInfo;
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    invoke-virtual {v1, v0}, Lcom/pccw/sms/service/ConversationParticipantItemService;->updateUserInfo(Lcom/pccw/database/entity/UserInfo;)V

    goto :goto_0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 495
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 496
    return-void
.end method

.method public onClickKKDialogNegativeButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1834
    return-void
.end method

.method public onClickKKDialogNeutralButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1840
    return-void
.end method

.method public onClickKKDialogPositiveButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 3
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1814
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment$5;->$SwitchMap$com$pccw$dialog$EnumKKDialogType:[I

    invoke-virtual {p1}, Lcom/pccw/dialog/KKDialog;->getDialogType()Lcom/pccw/dialog/EnumKKDialogType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/pccw/dialog/EnumKKDialogType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 1829
    :goto_0
    return-void

    .line 1816
    :pswitch_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.settings.WIFI_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1820
    :pswitch_1
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->activity:Landroid/app/Activity;

    const-class v2, Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1821
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1824
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_2
    const-string/jumbo v1, ""

    sget-object v2, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1814
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 411
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 413
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->activity:Landroid/app/Activity;

    .line 414
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->setHasOptionsMenu(Z)V

    .line 415
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    .line 416
    new-instance v0, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;

    invoke-direct {v0, p0}, Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;-><init>(Lcom/pccw/mobile/sip/CallLogFragment;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mQueryHandler:Lcom/pccw/mobile/sip/CallLogFragment$QueryHandler;

    .line 417
    new-instance v0, Lcom/pccw/sms/service/ConversationParticipantItemService;

    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->conversationParticipantItemService:Lcom/pccw/sms/service/ConversationParticipantItemService;

    .line 419
    new-instance v0, Lcom/pccw/sms/service/AllHistoryIMServer;

    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/AllHistoryIMServer;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAllHistoryIMServer:Lcom/pccw/sms/service/AllHistoryIMServer;

    .line 422
    const/4 v0, -0x1

    sput v0, Lcom/pccw/mobile/sip/CallLogFragment;->sFormattingType:I

    .line 424
    iput-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 426
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->contactHashMap:Ljava/util/HashMap;

    .line 427
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->updatePendingHashMap:Ljava/util/HashMap;

    .line 428
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    .line 429
    new-instance v0, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;

    invoke-direct {v0, p0, v2}, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;-><init>(Lcom/pccw/mobile/sip/CallLogFragment;Lcom/pccw/mobile/sip/CallLogFragment$1;)V

    iput-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mHandler:Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;

    .line 430
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 686
    const v1, 0x7f100005

    invoke-virtual {p2, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 687
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isSupportSMS(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 688
    const v1, 0x7f0e020b

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 689
    .local v0, "newChatItem":Landroid/view/MenuItem;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 691
    .end local v0    # "newChatItem":Landroid/view/MenuItem;
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 692
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 434
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/pccw/database/helper/DBHelper;->getDBInstance(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;

    .line 435
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    check-cast v2, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 436
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    const/16 v2, 0x8

    const/16 v3, 0x18

    invoke-virtual {v0, v2, v3}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 437
    const v2, 0x7f070063

    invoke-virtual {p0, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 439
    const v2, 0x7f040032

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 440
    .local v1, "v":Landroid/view/View;
    const v2, 0x7f0e00f0

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historyList:Landroid/widget/ListView;

    .line 441
    const v2, 0x7f0e00eb

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    iput-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historySelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    .line 443
    const v2, 0x7f0e00ed

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    iput-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    .line 444
    const v2, 0x7f0e00ee

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    iput-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    .line 445
    const v2, 0x7f0e00ef

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    iput-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    .line 447
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    new-instance v3, Lcom/pccw/mobile/sip/CallLogFragment$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/CallLogFragment$1;-><init>(Lcom/pccw/mobile/sip/CallLogFragment;)V

    invoke-virtual {v2, v3}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 455
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->messageTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    new-instance v3, Lcom/pccw/mobile/sip/CallLogFragment$2;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/CallLogFragment$2;-><init>(Lcom/pccw/mobile/sip/CallLogFragment;)V

    invoke-virtual {v2, v3}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 463
    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment;->callLogsTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    new-instance v3, Lcom/pccw/mobile/sip/CallLogFragment$3;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/sip/CallLogFragment$3;-><init>(Lcom/pccw/mobile/sip/CallLogFragment;)V

    invoke-virtual {v2, v3}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 471
    return-object v1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 525
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 526
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    if-eqz v1, :cond_0

    .line 527
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->stopRequestProcessing()V

    .line 528
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 529
    .local v0, "cursor":Landroid/database/Cursor;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_0

    .line 530
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 533
    .end local v0    # "cursor":Landroid/database/Cursor;
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 696
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 709
    :goto_0
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->activity:Landroid/app/Activity;

    invoke-virtual {v1, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    return v1

    .line 698
    :pswitch_0
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 699
    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-direct {p0, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 700
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginSuccress()Z

    move-result v1

    if-nez v1, :cond_1

    .line 701
    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-direct {p0, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 702
    :cond_1
    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isNotShowSMSConsumeWarmingCheckBox(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 703
    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-direct {p0, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 705
    :cond_2
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->activity:Landroid/app/Activity;

    const-class v2, Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 706
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 696
    nop

    :pswitch_data_0
    .packed-switch 0x7f0e020b
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 518
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    .line 520
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->stopRequestProcessing()V

    .line 521
    return-void
.end method

.method public onPreDraw()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 787
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mFirst:Z

    if-eqz v0, :cond_0

    .line 788
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mHandler:Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/pccw/mobile/sip/CallLogFragment$ContactCheckingHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 789
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mFirst:Z

    .line 791
    :cond_0
    return v1
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 501
    iget v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    packed-switch v0, :pswitch_data_0

    .line 513
    :goto_0
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 514
    return-void

    .line 503
    :pswitch_0
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->historyLayoutSelector(I)V

    goto :goto_0

    .line 506
    :pswitch_1
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->historyLayoutSelector(I)V

    goto :goto_0

    .line 509
    :pswitch_2
    invoke-direct {p0}, Lcom/pccw/mobile/sip/CallLogFragment;->resetNewCallsFlag()V

    goto :goto_0

    .line 501
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x1

    .line 476
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 477
    new-instance v0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    sget-object v2, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    const v3, 0x7f040035

    const/4 v4, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;-><init>(Lcom/pccw/mobile/sip/CallLogFragment;Landroid/content/Context;ILandroid/database/Cursor;Z)V

    sput-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    .line 478
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historyList:Landroid/widget/ListView;

    sget-object v1, Lcom/pccw/mobile/sip/CallLogFragment;->mAdapter:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 479
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historyList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 480
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historyList:Landroid/widget/ListView;

    invoke-virtual {v0, v5}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 481
    sget-object v0, Lcom/pccw/mobile/sip/CallLogFragment;->ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->isSupportSMS(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 482
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->historySelectLayout:Lcom/pccw/android/common/widget/SegmentedRadioGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SegmentedRadioGroup;->setVisibility(I)V

    .line 484
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->historyLayoutSelector(I)V

    .line 487
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    if-nez v0, :cond_1

    .line 488
    iput-object p0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 489
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 491
    :cond_1
    return-void
.end method

.method public run()V
    .locals 8

    .prologue
    .line 766
    :cond_0
    :goto_0
    sget-boolean v3, Lcom/pccw/mobile/sip/CallLogFragment;->mDone:Z

    if-nez v3, :cond_2

    .line 767
    const/4 v2, 0x0

    .line 768
    .local v2, "ciq":Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;
    iget-object v4, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    monitor-enter v4

    .line 769
    :try_start_0
    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 770
    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;

    move-object v2, v0

    .line 779
    :goto_1
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 780
    if-eqz v2, :cond_0

    .line 781
    invoke-direct {p0, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->queryContactInfo(Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;)V

    goto :goto_0

    .line 774
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/pccw/mobile/sip/CallLogFragment;->mRequests:Ljava/util/LinkedList;

    const-wide/16 v6, 0x12c

    invoke-virtual {v3, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 775
    :catch_0
    move-exception v3

    goto :goto_1

    .line 779
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 784
    .end local v2    # "ciq":Lcom/pccw/mobile/sip/CallLogFragment$CallerInfoQuery;
    :cond_2
    return-void
.end method

.method public updateGroupList()V
    .locals 3

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 400
    iget v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    if-ne v0, v1, :cond_1

    .line 402
    invoke-direct {p0, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->startQuery(I)V

    .line 407
    :cond_0
    :goto_0
    return-void

    .line 403
    :cond_1
    iget v0, p0, Lcom/pccw/mobile/sip/CallLogFragment;->currentQuery:I

    if-ne v0, v2, :cond_0

    .line 405
    invoke-direct {p0, v2}, Lcom/pccw/mobile/sip/CallLogFragment;->startQuery(I)V

    goto :goto_0
.end method
