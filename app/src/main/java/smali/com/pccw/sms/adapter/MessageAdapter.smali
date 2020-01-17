.class public Lcom/pccw/sms/adapter/MessageAdapter;
.super Landroid/widget/BaseAdapter;
.source "MessageAdapter.java"

# interfaces
.implements Landroid/widget/Filterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/adapter/MessageAdapter$MessageView;,
        Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;
    }
.end annotation


# static fields
.field public static audioPlayingMessageId:I

.field public static targetingMsgId:I

.field public static targetingMsgStatusImg:Landroid/widget/ImageView;

.field public static targetingProgressBar:Landroid/widget/ProgressBar;


# instance fields
.field private TAG:Ljava/lang/String;

.field private adapterActionListener:Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;

.field private chatType:Ljava/lang/String;

.field private currentImageView:Landroid/widget/ImageView;

.field mContext:Landroid/content/Context;

.field private mFilter:Landroid/widget/Filter;

.field private mFilteredMsgList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/sms/bean/MessageItem;",
            ">;"
        }
    .end annotation
.end field

.field private mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

.field private mMemoryNameCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mMsgList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/sms/bean/MessageItem;",
            ">;"
        }
    .end annotation
.end field

.field messageItemService:Lcom/pccw/sms/service/MessageItemService;

.field private prevDate:Ljava/lang/String;

.field private prevPosition:I

.field private tempUnreadMessageHeaderId:I

.field private todayPostNumber:I

.field private unreadMessageId:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 70
    sput v0, Lcom/pccw/sms/adapter/MessageAdapter;->audioPlayingMessageId:I

    .line 73
    sput v0, Lcom/pccw/sms/adapter/MessageAdapter;->targetingMsgId:I

    .line 74
    sput-object v1, Lcom/pccw/sms/adapter/MessageAdapter;->targetingProgressBar:Landroid/widget/ProgressBar;

    .line 75
    sput-object v1, Lcom/pccw/sms/adapter/MessageAdapter;->targetingMsgStatusImg:Landroid/widget/ImageView;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "chatType"    # Ljava/lang/String;
    .param p4, "mlistener"    # Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/sms/bean/MessageItem;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;",
            ")V"
        }
    .end annotation

    .prologue
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/sms/bean/MessageItem;>;"
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 116
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 54
    const-string/jumbo v0, "MessageAdapter"

    iput-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->TAG:Ljava/lang/String;

    .line 59
    iput-object v2, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevDate:Ljava/lang/String;

    .line 60
    iput v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->todayPostNumber:I

    .line 61
    iput v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevPosition:I

    .line 68
    iput v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->unreadMessageId:I

    .line 69
    iput v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->tempUnreadMessageHeaderId:I

    .line 71
    iput-object v2, p0, Lcom/pccw/sms/adapter/MessageAdapter;->currentImageView:Landroid/widget/ImageView;

    .line 117
    iput-object p1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    .line 118
    iput-object p2, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    .line 119
    iput-object p2, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mFilteredMsgList:Ljava/util/List;

    .line 120
    iput-object p3, p0, Lcom/pccw/sms/adapter/MessageAdapter;->chatType:Ljava/lang/String;

    .line 121
    iput-object p4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->adapterActionListener:Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;

    .line 123
    new-instance v0, Lcom/pccw/sms/service/MessageItemService;

    iget-object v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    .line 124
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMemoryNameCache:Ljava/util/HashMap;

    .line 125
    new-instance v0, Lcom/pccw/android/common/widget/ImageLoader;

    invoke-direct {v0, p1}, Lcom/pccw/android/common/widget/ImageLoader;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

    .line 126
    return-void
.end method

.method static synthetic access$100(Lcom/pccw/sms/adapter/MessageAdapter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/adapter/MessageAdapter;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/pccw/sms/adapter/MessageAdapter;->popupMessageSelection(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/pccw/sms/adapter/MessageAdapter;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/adapter/MessageAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/pccw/sms/adapter/MessageAdapter;->deleteMessageWithMsgId(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/sms/adapter/MessageAdapter;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/adapter/MessageAdapter;
    .param p1, "x1"    # I

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/pccw/sms/adapter/MessageAdapter;->copyTextMessageToClipBoard(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/sms/adapter/MessageAdapter;)Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/adapter/MessageAdapter;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->adapterActionListener:Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/sms/adapter/MessageAdapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/adapter/MessageAdapter;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$602(Lcom/pccw/sms/adapter/MessageAdapter;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/adapter/MessageAdapter;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 51
    iput-object p1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mFilteredMsgList:Ljava/util/List;

    return-object p1
.end method

.method private cleanView(Lcom/pccw/sms/adapter/MessageAdapter$MessageView;)V
    .locals 3
    .param p1, "holder"    # Lcom/pccw/sms/adapter/MessageAdapter$MessageView;

    .prologue
    const/4 v2, 0x0

    const/16 v1, 0x8

    .line 275
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgSender:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 276
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 277
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->CallImg:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 278
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->SystemBubble:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 279
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 280
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->LastMsgTime:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 281
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgStatusImg:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 282
    return-void
.end method

.method public static colorFilterMap(Ljava/lang/String;)Landroid/graphics/ColorFilter;
    .locals 2
    .param p0, "type"    # Ljava/lang/String;

    .prologue
    .line 482
    sget-object v0, Lcom/pccw/sms/bean/SMSConstants;->colorFilterMap:Ljava/util/Map;

    .line 483
    .local v0, "colorFilterMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroid/graphics/ColorFilter;>;"
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/ColorFilter;

    return-object v1
.end method

.method private convertDPtoPixel(I)F
    .locals 4
    .param p1, "dp"    # I

    .prologue
    .line 649
    iget-object v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 650
    .local v0, "r":Landroid/content/res/Resources;
    const/4 v1, 0x1

    int-to-float v2, p1

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    return v1
.end method

.method private copyTextMessageToClipBoard(I)V
    .locals 8
    .param p1, "msgId"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 574
    new-instance v3, Lcom/pccw/sms/service/MessageItemService;

    iget-object v5, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v3, v5}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    .line 575
    .local v3, "msgItemService":Lcom/pccw/sms/service/MessageItemService;
    invoke-virtual {v3, p1}, Lcom/pccw/sms/service/MessageItemService;->getMessageStoreByMsgId(I)Lcom/pccw/database/entity/MessageStore;

    move-result-object v4

    .line 576
    .local v4, "msgStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v4}, Lcom/pccw/database/entity/MessageStore;->getTextMessage()Ljava/lang/String;

    move-result-object v2

    .line 577
    .local v2, "copyText":Ljava/lang/String;
    iget-object v5, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    const-string/jumbo v6, "clipboard"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 578
    .local v1, "clipboard":Landroid/content/ClipboardManager;
    const-string/jumbo v5, "KKIMText"

    invoke-static {v5, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 579
    .local v0, "clip":Landroid/content/ClipData;
    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 580
    iget-object v5, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    iget-object v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    const v7, 0x7f0700a0

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 581
    return-void
.end method

.method private deleteMessageWithMsgId(I)V
    .locals 2
    .param p1, "msgId"    # I

    .prologue
    .line 487
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/sms/service/MessageItemService;->deleteMessageByMsgId(Ljava/lang/String;)I

    .line 489
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->adapterActionListener:Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;

    invoke-interface {v0, p1}, Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;->onMessageItemDeleted(I)V

    .line 490
    return-void
.end method

.method private getDimenResource(I)F
    .locals 2
    .param p1, "resourceId"    # I

    .prologue
    .line 654
    iget-object v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    .line 655
    .local v0, "dimen":F
    return v0
.end method

.method private isCallType(Ljava/lang/String;)Z
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 584
    const/4 v0, 0x0

    .line 585
    .local v0, "isCallType":Z
    sget-object v1, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_INCOMING_CALL:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_OUTGOING_CALL:Ljava/lang/String;

    .line 586
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_MISSING_CALL:Ljava/lang/String;

    .line 587
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 588
    :cond_0
    const/4 v0, 0x1

    .line 590
    :cond_1
    return v0
.end method

.method private loadSenderName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "msisdn"    # Ljava/lang/String;

    .prologue
    .line 135
    iget-object v2, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMemoryNameCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 136
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 139
    :cond_0
    new-instance v0, Lcom/pccw/sms/service/ConversationParticipantItemService;

    iget-object v2, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/pccw/sms/service/ConversationParticipantItemService;-><init>(Landroid/content/Context;)V

    .line 140
    .local v0, "conversationParticipantItemService":Lcom/pccw/sms/service/ConversationParticipantItemService;
    invoke-virtual {v0, p1}, Lcom/pccw/sms/service/ConversationParticipantItemService;->getGroupParticipantName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 141
    iget-object v2, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMemoryNameCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .end local v0    # "conversationParticipantItemService":Lcom/pccw/sms/service/ConversationParticipantItemService;
    :cond_1
    return-object v1
.end method

.method private messageLongClickListner(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View$OnLongClickListener;
    .locals 6
    .param p1, "msgId"    # I
    .param p2, "messageType"    # Ljava/lang/String;
    .param p3, "msgContent"    # Ljava/lang/String;
    .param p4, "msgStatus"    # Ljava/lang/String;

    .prologue
    .line 493
    new-instance v0, Lcom/pccw/sms/adapter/MessageAdapter$1;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/pccw/sms/adapter/MessageAdapter$1;-><init>(Lcom/pccw/sms/adapter/MessageAdapter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method private popupMessageSelection(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "msgId"    # I
    .param p2, "messageType"    # Ljava/lang/String;
    .param p3, "msgContent"    # Ljava/lang/String;
    .param p4, "msgStatus"    # Ljava/lang/String;

    .prologue
    const v9, 0x7f040041

    const/4 v8, 0x2

    const v7, 0x7f0700a1

    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 508
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_TEXT:Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 510
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED:Ljava/lang/String;

    invoke-virtual {p4, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED_RESEND:Ljava/lang/String;

    invoke-virtual {p4, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 511
    new-array v3, v8, [Ljava/lang/String;

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07009f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    .line 519
    .local v3, "option":[Ljava/lang/String;
    :goto_0
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v1, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 520
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 522
    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED:Ljava/lang/String;

    invoke-virtual {p4, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    sget-object v4, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED_RESEND:Ljava/lang/String;

    invoke-virtual {p4, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 523
    new-instance v0, Landroid/widget/ArrayAdapter;

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v4, v9, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 526
    .local v0, "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    new-instance v4, Lcom/pccw/sms/adapter/MessageAdapter$2;

    invoke-direct {v4, p0, p1}, Lcom/pccw/sms/adapter/MessageAdapter$2;-><init>(Lcom/pccw/sms/adapter/MessageAdapter;I)V

    invoke-virtual {v1, v0, v4}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 567
    :goto_1
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    .line 568
    .local v2, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v2, v6}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 569
    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 570
    return-void

    .line 513
    .end local v0    # "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v2    # "dialog":Landroid/app/AlertDialog;
    .end local v3    # "option":[Ljava/lang/String;
    :cond_0
    const/4 v4, 0x3

    new-array v3, v4, [Ljava/lang/String;

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f07009f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0700a2

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v8

    .restart local v3    # "option":[Ljava/lang/String;
    goto :goto_0

    .line 516
    .end local v3    # "option":[Ljava/lang/String;
    :cond_1
    new-array v3, v6, [Ljava/lang/String;

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    .restart local v3    # "option":[Ljava/lang/String;
    goto :goto_0

    .line 543
    .restart local v1    # "builder":Landroid/app/AlertDialog$Builder;
    :cond_2
    new-instance v0, Landroid/widget/ArrayAdapter;

    iget-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v4, v9, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 544
    .restart local v0    # "adapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    new-instance v4, Lcom/pccw/sms/adapter/MessageAdapter$3;

    invoke-direct {v4, p0, p1}, Lcom/pccw/sms/adapter/MessageAdapter$3;-><init>(Lcom/pccw/sms/adapter/MessageAdapter;I)V

    invoke-virtual {v1, v0, v4}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_1
.end method

.method private removeTextBubbleView(Lcom/pccw/sms/adapter/MessageAdapter$MessageView;)V
    .locals 2
    .param p1, "holder"    # Lcom/pccw/sms/adapter/MessageAdapter$MessageView;

    .prologue
    const/16 v1, 0x8

    .line 285
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 286
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->LastMsgTime:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 287
    iget-object v0, p1, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgStatusImg:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 288
    return-void
.end method

.method private setDate(Lcom/pccw/sms/adapter/MessageAdapter$MessageView;Lcom/pccw/sms/bean/MessageItem;I)Ljava/lang/String;
    .locals 10
    .param p1, "holder"    # Lcom/pccw/sms/adapter/MessageAdapter$MessageView;
    .param p2, "rowItem"    # Lcom/pccw/sms/bean/MessageItem;
    .param p3, "position"    # I

    .prologue
    const v9, 0x7f070088

    const/4 v8, -0x1

    .line 218
    const/4 v0, 0x0

    .line 219
    .local v0, "isShown":Z
    invoke-virtual {p2}, Lcom/pccw/sms/bean/MessageItem;->getLastMsgTime()Ljava/util/Date;

    move-result-object v6

    const-string/jumbo v7, "d MMM yyyy"

    invoke-static {v6, v7}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStrOnPhoneTimeZone(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 220
    .local v4, "thisDate":Ljava/lang/String;
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    const-string/jumbo v7, "d MMM yyyy"

    invoke-static {v6, v7}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStrOnPhoneTimeZone(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 222
    .local v5, "today":Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 223
    iget v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->todayPostNumber:I

    if-ne v6, v8, :cond_1

    .line 224
    if-eqz p3, :cond_0

    .line 225
    iget-object v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    add-int/lit8 v7, p3, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/pccw/sms/bean/MessageItem;

    .line 226
    .local v2, "nextRowItem":Lcom/pccw/sms/bean/MessageItem;
    invoke-virtual {v2}, Lcom/pccw/sms/bean/MessageItem;->getLastMsgTime()Ljava/util/Date;

    move-result-object v6

    const-string/jumbo v7, "d MMM yyyy"

    invoke-static {v6, v7}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStrOnPhoneTimeZone(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 227
    .local v1, "nextDate":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 228
    iget-object v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 229
    const/4 v0, 0x1

    .line 230
    iput p3, p0, Lcom/pccw/sms/adapter/MessageAdapter;->todayPostNumber:I

    .line 265
    .end local v1    # "nextDate":Ljava/lang/String;
    .end local v2    # "nextRowItem":Lcom/pccw/sms/bean/MessageItem;
    :cond_0
    :goto_0
    iput p3, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevPosition:I

    .line 266
    iput-object v4, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevDate:Ljava/lang/String;

    .line 268
    if-eqz v0, :cond_6

    .line 271
    .end local v4    # "thisDate":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 233
    .restart local v4    # "thisDate":Ljava/lang/String;
    :cond_1
    iget v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->todayPostNumber:I

    if-ne p3, v6, :cond_0

    .line 234
    iget-object v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 235
    const/4 v0, 0x1

    goto :goto_0

    .line 240
    :cond_2
    iget v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevPosition:I

    if-ge v6, p3, :cond_4

    .line 242
    add-int/lit8 v3, p3, -0x1

    .line 243
    .local v3, "p":I
    iget-object v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevDate:Ljava/lang/String;

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevDate:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    iget v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevPosition:I

    if-ne v3, v6, :cond_3

    .line 244
    const/4 v0, 0x1

    goto :goto_0

    .line 246
    :cond_3
    iget v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevPosition:I

    if-ne v6, v8, :cond_0

    if-nez p3, :cond_0

    .line 247
    const/4 v0, 0x1

    goto :goto_0

    .line 250
    .end local v3    # "p":I
    :cond_4
    iget v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->prevPosition:I

    if-le v6, p3, :cond_0

    .line 252
    if-eqz p3, :cond_5

    .line 253
    iget-object v6, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    add-int/lit8 v7, p3, -0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/pccw/sms/bean/MessageItem;

    .line 254
    .restart local v2    # "nextRowItem":Lcom/pccw/sms/bean/MessageItem;
    invoke-virtual {v2}, Lcom/pccw/sms/bean/MessageItem;->getLastMsgTime()Ljava/util/Date;

    move-result-object v6

    const-string/jumbo v7, "d MMM yyyy"

    invoke-static {v6, v7}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStrOnPhoneTimeZone(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 255
    .restart local v1    # "nextDate":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 256
    const/4 v0, 0x1

    goto :goto_0

    .line 260
    .end local v1    # "nextDate":Ljava/lang/String;
    .end local v2    # "nextRowItem":Lcom/pccw/sms/bean/MessageItem;
    :cond_5
    const/4 v0, 0x1

    goto :goto_0

    .line 271
    :cond_6
    const/4 v4, 0x0

    goto :goto_1
.end method


# virtual methods
.method public clearAdapterCache()V
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

    invoke-virtual {v0}, Lcom/pccw/android/common/widget/ImageLoader;->clearCache()V

    .line 130
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMemoryNameCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 131
    const/4 v0, -0x1

    iput v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->unreadMessageId:I

    .line 132
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mFilteredMsgList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getFilter()Landroid/widget/Filter;
    .locals 1

    .prologue
    .line 595
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mFilter:Landroid/widget/Filter;

    if-nez v0, :cond_0

    .line 597
    new-instance v0, Lcom/pccw/sms/adapter/MessageAdapter$4;

    invoke-direct {v0, p0}, Lcom/pccw/sms/adapter/MessageAdapter$4;-><init>(Lcom/pccw/sms/adapter/MessageAdapter;)V

    iput-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mFilter:Landroid/widget/Filter;

    .line 645
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mFilter:Landroid/widget/Filter;

    return-object v0
.end method

.method public getItem(I)Lcom/pccw/sms/bean/MessageItem;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 153
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mFilteredMsgList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/bean/MessageItem;

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 51
    invoke-virtual {p0, p1}, Lcom/pccw/sms/adapter/MessageAdapter;->getItem(I)Lcom/pccw/sms/bean/MessageItem;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 205
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/bean/MessageItem;

    invoke-virtual {v0}, Lcom/pccw/sms/bean/MessageItem;->getChatId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getMessageIdByPosition(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 161
    const/4 v0, 0x0

    .line 162
    .local v0, "item":Lcom/pccw/sms/bean/MessageItem;
    iget-object v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 163
    iget-object v1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "item":Lcom/pccw/sms/bean/MessageItem;
    check-cast v0, Lcom/pccw/sms/bean/MessageItem;

    .line 165
    .restart local v0    # "item":Lcom/pccw/sms/bean/MessageItem;
    :cond_0
    if-eqz v0, :cond_1

    .line 166
    invoke-virtual {v0}, Lcom/pccw/sms/bean/MessageItem;->getMsgId()I

    move-result v1

    .line 168
    :goto_0
    return v1

    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getPositionByMessageId(I)I
    .locals 4
    .param p1, "messageID"    # I

    .prologue
    .line 172
    const/4 v1, 0x0

    .line 173
    .local v1, "pos":I
    iget-object v2, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/bean/MessageItem;

    .line 174
    .local v0, "item":Lcom/pccw/sms/bean/MessageItem;
    invoke-virtual {v0}, Lcom/pccw/sms/bean/MessageItem;->getMsgId()I

    move-result v3

    if-ne v3, p1, :cond_0

    .line 178
    .end local v0    # "item":Lcom/pccw/sms/bean/MessageItem;
    .end local v1    # "pos":I
    :goto_1
    return v1

    .line 176
    .restart local v0    # "item":Lcom/pccw/sms/bean/MessageItem;
    .restart local v1    # "pos":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 177
    goto :goto_0

    .line 178
    .end local v0    # "item":Lcom/pccw/sms/bean/MessageItem;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getTargetingMsgStatusImg()Landroid/widget/ImageView;
    .locals 3

    .prologue
    .line 664
    const-string/jumbo v1, "Progress"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "targetingMsgStatusImg null? "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lcom/pccw/sms/adapter/MessageAdapter;->targetingMsgStatusImg:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    sget-object v0, Lcom/pccw/sms/adapter/MessageAdapter;->targetingMsgStatusImg:Landroid/widget/ImageView;

    return-object v0

    .line 664
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTargetingProgressBar()Landroid/widget/ProgressBar;
    .locals 3

    .prologue
    .line 659
    const-string/jumbo v1, "Progress"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "targetingProgressBar null? "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v0, Lcom/pccw/sms/adapter/MessageAdapter;->targetingProgressBar:Landroid/widget/ProgressBar;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 660
    sget-object v0, Lcom/pccw/sms/adapter/MessageAdapter;->targetingProgressBar:Landroid/widget/ProgressBar;

    return-object v0

    .line 659
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTempporaryMessageHeader()I
    .locals 1

    .prologue
    .line 196
    iget v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->tempUnreadMessageHeaderId:I

    return v0
.end method

.method public getTopMessageId()I
    .locals 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/bean/MessageItem;

    invoke-virtual {v0}, Lcom/pccw/sms/bean/MessageItem;->getMsgId()I

    move-result v0

    return v0
.end method

.method public getUnreadMessageId()I
    .locals 1

    .prologue
    .line 200
    iget v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->unreadMessageId:I

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 25
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 292
    const/4 v6, 0x0

    .line 293
    .local v6, "holder":Lcom/pccw/sms/adapter/MessageAdapter$MessageView;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/pccw/sms/bean/MessageItem;

    .line 295
    .local v16, "rowItem":Lcom/pccw/sms/bean/MessageItem;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    const-string/jumbo v21, "layout_inflater"

    invoke-virtual/range {v20 .. v21}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/LayoutInflater;

    .line 300
    .local v9, "mInflater":Landroid/view/LayoutInflater;
    const/4 v15, 0x0

    .line 302
    .local v15, "reuseExistingView":Z
    if-eqz p2, :cond_1

    .line 303
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getDirection()I

    move-result v20

    packed-switch v20, :pswitch_data_0

    .line 315
    :cond_0
    :goto_0
    if-eqz v6, :cond_1

    .line 316
    const/4 v15, 0x1

    .line 320
    :cond_1
    if-nez v15, :cond_2

    .line 322
    const v20, 0x7f040051

    const/16 v21, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p3

    move/from16 v2, v21

    invoke-virtual {v9, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 323
    new-instance v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;

    .end local v6    # "holder":Lcom/pccw/sms/adapter/MessageAdapter$MessageView;
    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v6, v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;-><init>(Lcom/pccw/sms/adapter/MessageAdapter;Lcom/pccw/sms/adapter/MessageAdapter$1;)V

    .line 324
    .restart local v6    # "holder":Lcom/pccw/sms/adapter/MessageAdapter$MessageView;
    const v20, 0x7f0e0177

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    .line 325
    const v20, 0x7f0e017a

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/TextView;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    .line 326
    const v20, 0x7f0e0178

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/TextView;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgSender:Landroid/widget/TextView;

    .line 327
    const v20, 0x7f0e017d

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/ImageView;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgStatusImg:Landroid/widget/ImageView;

    .line 328
    const v20, 0x7f0e017c

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/TextView;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->LastMsgTime:Landroid/widget/TextView;

    .line 329
    const v20, 0x7f0e0174

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->Header:Landroid/widget/RelativeLayout;

    .line 330
    const v20, 0x7f0e0175

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/TextView;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgDate:Landroid/widget/TextView;

    .line 331
    const v20, 0x7f0e0179

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/ImageView;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->CallImg:Landroid/widget/ImageView;

    .line 332
    const v20, 0x7f0e017b

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/LinearLayout;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgData:Landroid/widget/LinearLayout;

    .line 333
    const v20, 0x7f0e0172

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/LinearLayout;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->UnreadMessage:Landroid/widget/LinearLayout;

    .line 334
    const v20, 0x7f0e0173

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/TextView;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->UnreadMessageTxt:Landroid/widget/TextView;

    .line 335
    const v20, 0x7f0e0176

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/RelativeLayout;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->SystemBubble:Landroid/widget/RelativeLayout;

    .line 336
    const v20, 0x7f0e007e

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v20

    check-cast v20, Landroid/widget/TextView;

    move-object/from16 v0, v20

    iput-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgSystem:Landroid/widget/TextView;

    .line 337
    const v20, 0x7f040051

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 342
    :cond_2
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v20, -0x2

    const/16 v21, -0x2

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v4, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 343
    .local v4, "bodyLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v20, -0x2

    const/16 v21, -0x2

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v5, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 344
    .local v5, "dataLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v7, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v20, -0x2

    const/16 v21, -0x2

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v7, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 345
    .local v7, "imgLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v19, Landroid/widget/RelativeLayout$LayoutParams;

    sget v20, Lcom/pccw/sms/bean/SMSConstants;->MEDIA_IMAGE_THUMBNAIL_DIMENSIONS:I

    const/16 v21, -0x2

    invoke-direct/range {v19 .. v21}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 347
    .local v19, "voiceLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    const v20, 0x7f080079

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->getDimenResource(I)F

    move-result v20

    move/from16 v0, v20

    float-to-int v14, v0

    .line 348
    .local v14, "pVertical":I
    const v20, 0x7f080077

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->getDimenResource(I)F

    move-result v20

    move/from16 v0, v20

    float-to-int v13, v0

    .line 349
    .local v13, "pRight":I
    const v20, 0x7f080076

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->getDimenResource(I)F

    move-result v20

    move/from16 v0, v20

    float-to-int v12, v0

    .line 351
    .local v12, "pLeft":I
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/pccw/sms/adapter/MessageAdapter;->cleanView(Lcom/pccw/sms/adapter/MessageAdapter$MessageView;)V

    .line 353
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getDirection()I

    move-result v20

    if-nez v20, :cond_7

    .line 355
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x32

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->convertDPtoPixel(I)F

    move-result v22

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v22, v0

    const/16 v23, 0x0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 356
    const/16 v20, 0x9

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 357
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    const v21, 0x7f0204c8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 358
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 359
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v12, v14, v12, v14}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 361
    const/16 v20, 0x2a

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->convertDPtoPixel(I)F

    move-result v20

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    neg-int v0, v0

    move/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v5, v0, v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 362
    const/16 v20, 0xf

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 363
    const/16 v20, 0x1

    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/RelativeLayout;->getId()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v5, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 364
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgData:Landroid/widget/LinearLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 365
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgStatusImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 366
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x7f0b000d

    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getColor(I)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setTextColor(I)V

    .line 367
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x6

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->convertDPtoPixel(I)F

    move-result v21

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->convertDPtoPixel(I)F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v20 .. v24}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 368
    const/16 v20, 0x6

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 389
    :cond_3
    :goto_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->unreadMessageId:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_8

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->unreadMessageId:I

    move/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getMsgId()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_8

    .line 390
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->UnreadMessage:Landroid/widget/LinearLayout;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 391
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->UnreadMessageTxt:Landroid/widget/TextView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x7f070243

    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 399
    :goto_2
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getMsgType()Ljava/lang/String;

    move-result-object v10

    .line 401
    .local v10, "messageType":Ljava/lang/String;
    const-string/jumbo v20, "group"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->chatType:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_4

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getDirection()I

    move-result v20

    if-nez v20, :cond_4

    .line 402
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgSender:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 403
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgSender:Landroid/widget/TextView;

    move-object/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getSender()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->loadSenderName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 406
    :cond_4
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->LastMsgTime:Landroid/widget/TextView;

    move-object/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getLastMsgTime()Ljava/util/Date;

    move-result-object v21

    const-string/jumbo v22, "HH:mm:ss"

    invoke-static/range {v21 .. v22}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStrOnPhoneTimeZone(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 407
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move/from16 v2, p1

    invoke-direct {v0, v6, v1, v2}, Lcom/pccw/sms/adapter/MessageAdapter;->setDate(Lcom/pccw/sms/adapter/MessageAdapter$MessageView;Lcom/pccw/sms/bean/MessageItem;I)Ljava/lang/String;

    move-result-object v18

    .line 409
    .local v18, "thisDate":Ljava/lang/String;
    if-eqz v18, :cond_a

    .line 410
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgDate:Landroid/widget/TextView;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 411
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->Header:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 416
    :goto_3
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_TEXT:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_b

    .line 418
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 419
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getContent()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    :goto_4
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_TEXT:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_11

    .line 449
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getMsgId()I

    move-result v21

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getContent()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getSentStatus()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, p0

    move/from16 v1, v21

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v10, v2, v3}, Lcom/pccw/sms/adapter/MessageAdapter;->messageLongClickListner(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/view/View$OnLongClickListener;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/RelativeLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 454
    :goto_5
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getDirection()I

    move-result v20

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_6

    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lcom/pccw/sms/adapter/MessageAdapter;->isCallType(Ljava/lang/String;)Z

    move-result v20

    if-nez v20, :cond_6

    .line 457
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    move-object/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getMsgId()I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Lcom/pccw/sms/service/MessageItemService;->getMessageStoreByMsgId(I)Lcom/pccw/database/entity/MessageStore;

    move-result-object v11

    .line 458
    .local v11, "msgStore":Lcom/pccw/database/entity/MessageStore;
    invoke-virtual {v11}, Lcom/pccw/database/entity/MessageStore;->getSentStatus()Ljava/lang/String;

    move-result-object v17

    .line 459
    .local v17, "sentStatus":Ljava/lang/String;
    const/4 v8, 0x0

    .line 460
    .local v8, "imgStatus":Landroid/graphics/Bitmap;
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_DELIVERED:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_12

    .line 461
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const v21, 0x7f020441

    invoke-static/range {v20 .. v21}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 474
    :cond_5
    :goto_6
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgStatusImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 477
    .end local v8    # "imgStatus":Landroid/graphics/Bitmap;
    .end local v11    # "msgStore":Lcom/pccw/database/entity/MessageStore;
    .end local v17    # "sentStatus":Ljava/lang/String;
    :cond_6
    return-object p2

    .line 307
    .end local v4    # "bodyLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v5    # "dataLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v7    # "imgLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v10    # "messageType":Ljava/lang/String;
    .end local v12    # "pLeft":I
    .end local v13    # "pRight":I
    .end local v14    # "pVertical":I
    .end local v18    # "thisDate":Ljava/lang/String;
    .end local v19    # "voiceLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    :pswitch_0
    const v20, 0x7f040051

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v20

    if-eqz v20, :cond_0

    .line 308
    const v20, 0x7f040051

    move-object/from16 v0, p2

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "holder":Lcom/pccw/sms/adapter/MessageAdapter$MessageView;
    check-cast v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;

    .restart local v6    # "holder":Lcom/pccw/sms/adapter/MessageAdapter$MessageView;
    goto/16 :goto_0

    .line 370
    .restart local v4    # "bodyLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v5    # "dataLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v7    # "imgLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v12    # "pLeft":I
    .restart local v13    # "pRight":I
    .restart local v14    # "pVertical":I
    .restart local v19    # "voiceLayoutParam":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_7
    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getDirection()I

    move-result v20

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_3

    .line 372
    const/16 v20, 0x28

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->convertDPtoPixel(I)F

    move-result v20

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v4, v0, v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 373
    const/16 v20, 0xb

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 374
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    const v21, 0x7f0204c9

    invoke-virtual/range {v20 .. v21}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 375
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 376
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v12, v14, v13, v14}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 378
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x24

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->convertDPtoPixel(I)F

    move-result v22

    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v22, v0

    move/from16 v0, v22

    neg-int v0, v0

    move/from16 v22, v0

    const/16 v23, 0x0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v5, v0, v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 379
    const/16 v20, 0xf

    move/from16 v0, v20

    invoke-virtual {v5, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 380
    const/16 v20, 0x0

    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/widget/RelativeLayout;->getId()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-virtual {v5, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 381
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgData:Landroid/widget/LinearLayout;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 382
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgStatusImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 383
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x7f0b0016

    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getColor(I)I

    move-result v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setTextColor(I)V

    .line 384
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter;->convertDPtoPixel(I)F

    move-result v23

    move/from16 v0, v23

    float-to-int v0, v0

    move/from16 v23, v0

    const/16 v24, 0x0

    invoke-virtual/range {v20 .. v24}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 385
    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x4

    const/16 v23, 0x0

    move/from16 v0, v20

    move/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    goto/16 :goto_1

    .line 392
    :cond_8
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->tempUnreadMessageHeaderId:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_9

    move-object/from16 v0, p0

    iget v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->tempUnreadMessageHeaderId:I

    move/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getMsgId()I

    move-result v21

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_9

    .line 393
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->UnreadMessage:Landroid/widget/LinearLayout;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 394
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->UnreadMessageTxt:Landroid/widget/TextView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x7f070242

    invoke-virtual/range {v21 .. v22}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_2

    .line 396
    :cond_9
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->UnreadMessage:Landroid/widget/LinearLayout;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_2

    .line 413
    .restart local v10    # "messageType":Ljava/lang/String;
    .restart local v18    # "thisDate":Ljava/lang/String;
    :cond_a
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->Header:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    goto/16 :goto_3

    .line 421
    :cond_b
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_ADD:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_c

    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_SYSTEM_DELETE:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_d

    .line 423
    :cond_c
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->SystemBubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 424
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/pccw/sms/adapter/MessageAdapter;->removeTextBubbleView(Lcom/pccw/sms/adapter/MessageAdapter$MessageView;)V

    .line 425
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgSystem:Landroid/widget/TextView;

    move-object/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getContent()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_4

    .line 427
    :cond_d
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_INCOMING_CALL:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_e

    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_OUTGOING_CALL:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_f

    .line 428
    :cond_e
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 429
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->CallImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 431
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    invoke-virtual/range {v16 .. v16}, Lcom/pccw/sms/bean/MessageItem;->getContent()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 432
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgStatusImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_4

    .line 434
    :cond_f
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_TYPE_MISSING_CALL:Ljava/lang/String;

    move-object/from16 v0, v20

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_10

    .line 435
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 436
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->CallImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 438
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    sget-object v21, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_LABEL_MISSING_CALL:Ljava/lang/String;

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 439
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->CallImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v21

    const v22, 0x7f02043f

    invoke-static/range {v21 .. v22}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 440
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgStatusImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_4

    .line 443
    :cond_10
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->MsgContent:Landroid/widget/TextView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/TextView;->setVisibility(I)V

    .line 444
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->CallImg:Landroid/widget/ImageView;

    move-object/from16 v20, v0

    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_4

    .line 451
    :cond_11
    iget-object v0, v6, Lcom/pccw/sms/adapter/MessageAdapter$MessageView;->bubble:Landroid/widget/RelativeLayout;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Landroid/widget/RelativeLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_5

    .line 463
    .restart local v8    # "imgStatus":Landroid/graphics/Bitmap;
    .restart local v11    # "msgStore":Lcom/pccw/database/entity/MessageStore;
    .restart local v17    # "sentStatus":Ljava/lang/String;
    :cond_12
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_SENT:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_13

    .line 464
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const v21, 0x7f020444

    invoke-static/range {v20 .. v21}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    goto/16 :goto_6

    .line 466
    :cond_13
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_SENDING:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_14

    .line 467
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const v21, 0x7f020443

    invoke-static/range {v20 .. v21}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    goto/16 :goto_6

    .line 469
    :cond_14
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_15

    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_FAILED_RESEND:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_16

    .line 470
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const v21, 0x7f020442

    invoke-static/range {v20 .. v21}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    goto/16 :goto_6

    .line 471
    :cond_16
    sget-object v20, Lcom/pccw/sms/bean/SMSConstants;->MESSAGE_STATUS_LOCAL:Ljava/lang/String;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_5

    .line 472
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/sms/adapter/MessageAdapter;->mContext:Landroid/content/Context;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    const v21, 0x7f020420

    invoke-static/range {v20 .. v21}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v8

    goto/16 :goto_6

    .line 303
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setChatType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->chatType:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public setImageLoadPause(Z)V
    .locals 1
    .param p1, "paused"    # Z

    .prologue
    .line 669
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mImageLoader:Lcom/pccw/android/common/widget/ImageLoader;

    invoke-virtual {v0, p1}, Lcom/pccw/android/common/widget/ImageLoader;->setPause(Z)V

    .line 670
    return-void
.end method

.method public setTemporaryMessageHeader(Z)V
    .locals 1
    .param p1, "show"    # Z

    .prologue
    .line 189
    if-eqz p1, :cond_0

    .line 190
    invoke-virtual {p0}, Lcom/pccw/sms/adapter/MessageAdapter;->getTopMessageId()I

    move-result v0

    iput v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->tempUnreadMessageHeaderId:I

    .line 193
    :goto_0
    return-void

    .line 192
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->tempUnreadMessageHeaderId:I

    goto :goto_0
.end method

.method public setUnreadMessageId(I)V
    .locals 0
    .param p1, "messageID"    # I

    .prologue
    .line 185
    iput p1, p0, Lcom/pccw/sms/adapter/MessageAdapter;->unreadMessageId:I

    .line 186
    return-void
.end method

.method public updateMessageList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/sms/bean/MessageItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 209
    .local p1, "newlist":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/sms/bean/MessageItem;>;"
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 210
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->mMsgList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 211
    const/4 v0, -0x1

    iput v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->todayPostNumber:I

    .line 212
    iget-object v0, p0, Lcom/pccw/sms/adapter/MessageAdapter;->adapterActionListener:Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;->onAdapterItemRefresh(I)V

    .line 213
    invoke-virtual {p0}, Lcom/pccw/sms/adapter/MessageAdapter;->notifyDataSetChanged()V

    .line 214
    return-void
.end method
