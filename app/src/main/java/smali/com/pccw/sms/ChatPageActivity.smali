.class public Lcom/pccw/sms/ChatPageActivity;
.super Lcom/pccw/mobile/sip/BaseActionBarActivity;
.source "ChatPageActivity.java"

# interfaces
.implements Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;
.implements Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;
.implements Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;
.implements Lcom/pccw/dialog/listener/IKKDialogOnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/sms/ChatPageActivity$CallLogQuery;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/pccw/mobile/sip/BaseActionBarActivity;",
        "Lcom/pccw/sms/emoji/EmojiconGridFragment$OnEmojiconClickedListener;",
        "Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnEmojiconBackspaceClickedListener;",
        "Lcom/pccw/sms/emoji/EmojiKeyboardFragment$OnKeyboardDialogDismissListener;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Landroid/database/Cursor;",
        ">;",
        "Landroid/widget/AbsListView$OnScrollListener;",
        "Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;",
        "Lcom/pccw/dialog/listener/IKKDialogOnClickListener;"
    }
.end annotation


# static fields
.field private static final CHECK_SMS_DELIVERY_STATUS_INTERVAL:I = 0x2710

.field private static final LOADER_TYPE_CALLLOG:I = 0x0

.field private static final LOADER_TYPE_GET_INTENT:I = 0x1

.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"

.field private static final promptConsumeDialog:I = 0x2

.field private static final promptKingKingNotOnDialog:I = 0x3

.field private static final promptNoWifiDialog:I = 0x1


# instance fields
.field public LOG_TAG:Ljava/lang/String;

.field private btnLoadMore:Landroid/widget/RelativeLayout;

.field btn_emoji:Landroid/widget/ImageButton;

.field private callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

.field charCountTv:Landroid/widget/TextView;

.field chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

.field private chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

.field checkSMSDeliveryServiceHandler:Landroid/os/Handler;

.field private checkSMSDeliveryServiceRunnable:Ljava/lang/Runnable;

.field checkSMSDeliveryStatusService:Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;

.field checkSMSDeliveryStatusServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;

.field checkSMSTypeServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

.field private checkStackFromBottom:Z

.field concatCountTv:Landroid/widget/TextView;

.field private ctx:Landroid/content/Context;

.field private currentScrollState:I

.field private emojiCover:Landroid/widget/FrameLayout;

.field final endAnimation:Ljava/lang/Runnable;

.field failedMessageId:Ljava/lang/String;

.field private firstUnreadMessageId:I

.field private footer:Landroid/widget/LinearLayout;

.field private groupCheckCnt:I

.field private handler:Landroid/os/Handler;

.field isAllRead:Z

.field private isEmojiKeyboardVisible:Z

.field isHeaderAdded:Z

.field private isKeyBoardVisible:Z

.field private isMediaTransfer:Z

.field private isRemovedByOthers:Z

.field private isSendMessage:Z

.field isTempSet:Z

.field private isUpdateSentStatus:Z

.field private isUpdatedByUser:Z

.field items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/pccw/sms/bean/MessageItem;",
            ">;"
        }
    .end annotation
.end field

.field private keyboardHeight:I

.field mInputMethodManager:Landroid/view/inputmethod/InputMethodManager;

.field mListView:Landroid/widget/ListView;

.field messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

.field private messageItemService:Lcom/pccw/sms/service/MessageItemService;

.field msgId:I

.field private noWiFiDialog:Landroid/app/AlertDialog;

.field private notShowSMSConsumeWarmingAgainCkeckBox:Landroid/widget/CheckBox;

.field private onScroll:Z

.field private openEmojiKeyboard:Z

.field private parentLayout:Landroid/widget/LinearLayout;

.field private popUpView:Landroid/view/View;

.field private popupWindow:Landroid/widget/PopupWindow;

.field previousHeightDiffrence:I

.field profilePic:Landroid/widget/ImageView;

.field private progressBar:Landroid/widget/ProgressBar;

.field final removeListAnimation:Ljava/lang/Runnable;

.field private seekbar:Landroid/widget/SeekBar;

.field sendMsgBtn:Landroid/widget/ImageButton;

.field sendSMSListener:Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

.field sendSMSService:Lcom/pccw/sms/service/SendSMSService;

.field private showCallLog:Z

.field smsTypeImg:Landroid/widget/ImageView;

.field private suggestiveWordsOn:Z

.field sysMsgFooter:Landroid/widget/RelativeLayout;

.field systemMessage:Landroid/widget/TextView;

.field private targetNumber:Ljava/lang/String;

.field topUnreadNotice:Landroid/widget/LinearLayout;

.field txt_messageSearch:Landroid/widget/EditText;

.field txt_msg:Landroid/widget/EditText;

.field txt_send:Landroid/widget/TextView;

.field userNameTV:Landroid/widget/TextView;

.field userProfileBtn:Landroid/widget/RelativeLayout;

.field private viewLoadMoreMessage:Landroid/widget/RelativeLayout;

.field private view_notice:Landroid/widget/RelativeLayout;

.field voiceCallBtn:Landroid/widget/RelativeLayout;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 109
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;-><init>()V

    .line 112
    const-string/jumbo v0, "ChatPageActivity"

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->LOG_TAG:Ljava/lang/String;

    .line 137
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isHeaderAdded:Z

    .line 138
    iput v1, p0, Lcom/pccw/sms/ChatPageActivity;->currentScrollState:I

    .line 139
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->onScroll:Z

    .line 148
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->isSendMessage:Z

    .line 149
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isUpdatedByUser:Z

    .line 150
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isUpdateSentStatus:Z

    .line 154
    iput v1, p0, Lcom/pccw/sms/ChatPageActivity;->previousHeightDiffrence:I

    .line 157
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isEmojiKeyboardVisible:Z

    .line 158
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->openEmojiKeyboard:Z

    .line 159
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->suggestiveWordsOn:Z

    .line 168
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->checkStackFromBottom:Z

    .line 169
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isRemovedByOthers:Z

    .line 170
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isMediaTransfer:Z

    .line 171
    iput v1, p0, Lcom/pccw/sms/ChatPageActivity;->groupCheckCnt:I

    .line 172
    iput v2, p0, Lcom/pccw/sms/ChatPageActivity;->firstUnreadMessageId:I

    .line 174
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->showCallLog:Z

    .line 177
    iput v2, p0, Lcom/pccw/sms/ChatPageActivity;->msgId:I

    .line 180
    iput-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->seekbar:Landroid/widget/SeekBar;

    .line 191
    new-instance v0, Lcom/pccw/sms/ChatPageActivity$1;

    invoke-direct {v0, p0}, Lcom/pccw/sms/ChatPageActivity$1;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->sendSMSListener:Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    .line 226
    new-instance v0, Lcom/pccw/sms/ChatPageActivity$2;

    invoke-direct {v0, p0}, Lcom/pccw/sms/ChatPageActivity$2;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSTypeServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

    .line 264
    new-instance v0, Lcom/pccw/sms/ChatPageActivity$3;

    invoke-direct {v0, p0}, Lcom/pccw/sms/ChatPageActivity$3;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryStatusServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;

    .line 284
    new-instance v0, Lcom/pccw/sms/ChatPageActivity$4;

    invoke-direct {v0, p0}, Lcom/pccw/sms/ChatPageActivity$4;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryServiceRunnable:Ljava/lang/Runnable;

    .line 848
    iput-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->failedMessageId:Ljava/lang/String;

    .line 1305
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isAllRead:Z

    .line 1306
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isTempSet:Z

    .line 1413
    new-instance v0, Lcom/pccw/sms/ChatPageActivity$22;

    invoke-direct {v0, p0}, Lcom/pccw/sms/ChatPageActivity$22;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->removeListAnimation:Ljava/lang/Runnable;

    .line 1420
    new-instance v0, Lcom/pccw/sms/ChatPageActivity$23;

    invoke-direct {v0, p0}, Lcom/pccw/sms/ChatPageActivity$23;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->endAnimation:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$002(Lcom/pccw/sms/ChatPageActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/pccw/sms/ChatPageActivity;->isUpdateSentStatus:Z

    return p1
.end method

.method static synthetic access$100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/bean/ChatPageListView;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->getChatPageLayoutInstance()Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->parentLayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/pccw/sms/ChatPageActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/pccw/sms/ChatPageActivity;->toggleEmojiButton(Z)V

    return-void
.end method

.method static synthetic access$1200(Lcom/pccw/sms/ChatPageActivity;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/pccw/sms/ChatPageActivity;Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/pccw/sms/ChatPageActivity;->promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->sendMessage()V

    return-void
.end method

.method static synthetic access$1500(Lcom/pccw/sms/ChatPageActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->isEmojiKeyboardVisible:Z

    return v0
.end method

.method static synthetic access$1602(Lcom/pccw/sms/ChatPageActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/pccw/sms/ChatPageActivity;->isSendMessage:Z

    return p1
.end method

.method static synthetic access$1700(Lcom/pccw/sms/ChatPageActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget v0, p0, Lcom/pccw/sms/ChatPageActivity;->currentScrollState:I

    return v0
.end method

.method static synthetic access$1800(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->toggleKeyboard()V

    return-void
.end method

.method static synthetic access$1900(Lcom/pccw/sms/ChatPageActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/pccw/sms/ChatPageActivity;->pasteNumberToDialer(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->refreshList()V

    return-void
.end method

.method static synthetic access$2000(Lcom/pccw/sms/ChatPageActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->showCallLog:Z

    return v0
.end method

.method static synthetic access$2100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/service/CallLogIMService;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/service/MessageItemService;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    return-object v0
.end method

.method static synthetic access$2302(Lcom/pccw/sms/ChatPageActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/pccw/sms/ChatPageActivity;->isUpdatedByUser:Z

    return p1
.end method

.method static synthetic access$2400(Lcom/pccw/sms/ChatPageActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # I

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/pccw/sms/ChatPageActivity;->countDisplayingMessage(I)V

    return-void
.end method

.method static synthetic access$2500(Lcom/pccw/sms/ChatPageActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->suggestiveWordsOn:Z

    return v0
.end method

.method static synthetic access$2502(Lcom/pccw/sms/ChatPageActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/pccw/sms/ChatPageActivity;->suggestiveWordsOn:Z

    return p1
.end method

.method static synthetic access$2600(Lcom/pccw/sms/ChatPageActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # I

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/pccw/sms/ChatPageActivity;->changeKeyboardHeight(I)V

    return-void
.end method

.method static synthetic access$2700(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->setEmojiKeyboard()V

    return-void
.end method

.method static synthetic access$2800(Lcom/pccw/sms/ChatPageActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget v0, p0, Lcom/pccw/sms/ChatPageActivity;->firstUnreadMessageId:I

    return v0
.end method

.method static synthetic access$2802(Lcom/pccw/sms/ChatPageActivity;I)I
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # I

    .prologue
    .line 109
    iput p1, p0, Lcom/pccw/sms/ChatPageActivity;->firstUnreadMessageId:I

    return p1
.end method

.method static synthetic access$2900(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->removeAllMessage()V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->refreshListAdapter()V

    return-void
.end method

.method static synthetic access$3000(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->removeThisChat()V

    return-void
.end method

.method static synthetic access$3102(Lcom/pccw/sms/ChatPageActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/pccw/sms/ChatPageActivity;->onScroll:Z

    return p1
.end method

.method static synthetic access$3200(Lcom/pccw/sms/ChatPageActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$3202(Lcom/pccw/sms/ChatPageActivity;Landroid/os/Handler;)Landroid/os/Handler;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Landroid/os/Handler;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    return-object p1
.end method

.method static synthetic access$3300(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->view_notice:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->progressBar:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/pccw/sms/ChatPageActivity;ZLandroid/view/View;I)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z
    .param p2, "x2"    # Landroid/view/View;
    .param p3, "x3"    # I

    .prologue
    .line 109
    invoke-direct {p0, p1, p2, p3}, Lcom/pccw/sms/ChatPageActivity;->setFadingAnimation(ZLandroid/view/View;I)V

    return-void
.end method

.method static synthetic access$3600(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->autoScrollDown()V

    return-void
.end method

.method static synthetic access$3700(Lcom/pccw/sms/ChatPageActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/pccw/sms/ChatPageActivity;->call(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/PopupWindow;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/sms/ChatPageActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->isKeyBoardVisible:Z

    return v0
.end method

.method static synthetic access$502(Lcom/pccw/sms/ChatPageActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/pccw/sms/ChatPageActivity;->isKeyBoardVisible:Z

    return p1
.end method

.method static synthetic access$600(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->emojiCover:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$702(Lcom/pccw/sms/ChatPageActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lcom/pccw/sms/ChatPageActivity;->openEmojiKeyboard:Z

    return p1
.end method

.method static synthetic access$800(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->scrollMyListViewToBottom()V

    return-void
.end method

.method static synthetic access$900(Lcom/pccw/sms/ChatPageActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 109
    iget v0, p0, Lcom/pccw/sms/ChatPageActivity;->keyboardHeight:I

    return v0
.end method

.method private addListViewHeader()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 526
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040052

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->viewLoadMoreMessage:Landroid/widget/RelativeLayout;

    .line 527
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040050

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->footer:Landroid/widget/LinearLayout;

    .line 528
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->viewLoadMoreMessage:Landroid/widget/RelativeLayout;

    const v1, 0x7f0e017e

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->btnLoadMore:Landroid/widget/RelativeLayout;

    .line 529
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->viewLoadMoreMessage:Landroid/widget/RelativeLayout;

    const v1, 0x7f0e0180

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->view_notice:Landroid/widget/RelativeLayout;

    .line 530
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->viewLoadMoreMessage:Landroid/widget/RelativeLayout;

    const v1, 0x7f0e017f

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->progressBar:Landroid/widget/ProgressBar;

    .line 532
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->viewLoadMoreMessage:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 534
    return-void
.end method

.method private autoScrollDown()V
    .locals 2

    .prologue
    .line 1360
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$20;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$20;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 1371
    return-void
.end method

.method private call(Ljava/lang/String;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 1538
    if-nez p1, :cond_0

    .line 1539
    iget-object p1, p0, Lcom/pccw/sms/ChatPageActivity;->targetNumber:Ljava/lang/String;

    .line 1540
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    .line 1541
    return-void
.end method

.method private changeKeyboardHeight(I)V
    .locals 3
    .param p1, "height"    # I

    .prologue
    .line 963
    const/16 v1, 0x64

    if-le p1, v1, :cond_0

    .line 964
    iput p1, p0, Lcom/pccw/sms/ChatPageActivity;->keyboardHeight:I

    .line 965
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    iget v2, p0, Lcom/pccw/sms/ChatPageActivity;->keyboardHeight:I

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 967
    .local v0, "params":Landroid/widget/LinearLayout$LayoutParams;
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->emojiCover:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 970
    .end local v0    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    return-void
.end method

.method private checkKeyboardHeight(Landroid/view/View;)V
    .locals 2
    .param p1, "parentLayout"    # Landroid/view/View;

    .prologue
    .line 892
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$16;

    invoke-direct {v1, p0, p1}, Lcom/pccw/sms/ChatPageActivity$16;-><init>(Lcom/pccw/sms/ChatPageActivity;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 952
    return-void
.end method

.method private convertSecToMinSec(I)Ljava/lang/String;
    .locals 4
    .param p1, "timeSecCount"    # I

    .prologue
    .line 1037
    const-string/jumbo v0, "%02d:%02d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    div-int/lit8 v3, p1, 0x3c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    rem-int/lit8 v3, p1, 0x3c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private countDisplayingMessage(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 1430
    const/16 v0, 0x14

    if-lt p1, v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->insertListViewHeader(Z)V

    .line 1432
    :goto_0
    return-void

    .line 1431
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->insertListViewHeader(Z)V

    goto :goto_0
.end method

.method private displayNoNetworkSendingToast()V
    .locals 2

    .prologue
    .line 1563
    const v0, 0x7f07006b

    invoke-virtual {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1564
    return-void
.end method

.method private displayNotAllowSendingToast()V
    .locals 2

    .prologue
    .line 1567
    const v0, 0x7f0700a4

    invoke-virtual {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1568
    return-void
.end method

.method private doResendService()V
    .locals 4

    .prologue
    .line 455
    const-string/jumbo v2, "GMT+0000"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 456
    .local v0, "todayDate":Ljava/util/Calendar;
    const/4 v2, 0x5

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 457
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    const-string/jumbo v3, "yyyy-MM-dd HH:mm:ss"

    invoke-static {v2, v3}, Lcom/pccw/mobile/util/FormatUtil;->convertDateToStr(Ljava/util/Date;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 458
    .local v1, "ytdDate":Ljava/lang/String;
    return-void
.end method

.method private enablePopUpView()V
    .locals 5

    .prologue
    .line 879
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040047

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popUpView:Landroid/view/View;

    .line 880
    new-instance v0, Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->popUpView:Landroid/view/View;

    const/4 v2, -0x1

    iget v3, p0, Lcom/pccw/sms/ChatPageActivity;->keyboardHeight:I

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    .line 881
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$15;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$15;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 888
    return-void
.end method

.method private getChatPageLayoutInstance()Lcom/pccw/sms/bean/ChatPageListView;
    .locals 3

    .prologue
    .line 821
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v1

    invoke-virtual {v1}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getChatPageListView()Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    .line 822
    .local v0, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    if-nez v0, :cond_0

    .line 823
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    invoke-virtual {v1, v2}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->init(Lcom/pccw/sms/bean/ChatPageListView;)V

    .line 824
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v1

    invoke-virtual {v1}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getChatPageListView()Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    .line 827
    :cond_0
    return-object v0
.end method

.method private getInfoFromIntent()V
    .locals 9

    .prologue
    const/4 v5, 0x0

    const/4 v1, 0x0

    .line 345
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    .line 346
    .local v7, "mIntent":Landroid/content/Intent;
    invoke-virtual {v7}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 347
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    const/4 v8, 0x1

    invoke-virtual {v0, v8, v1, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 348
    new-instance v0, Lcom/pccw/database/entity/ChatPageInfo;

    const-string/jumbo v3, "individual"

    move-object v2, v1

    move-object v4, v1

    move-object v6, v1

    invoke-direct/range {v0 .. v6}, Lcom/pccw/database/entity/ChatPageInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    .line 358
    :goto_0
    return-void

    .line 350
    :cond_0
    const-string/jumbo v0, "chatId"

    invoke-virtual {v7, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 351
    .local v5, "chatId":I
    const-string/jumbo v0, "chatType"

    invoke-virtual {v7, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 352
    .local v3, "chatType":Ljava/lang/String;
    const-string/jumbo v0, "recipient"

    invoke-virtual {v7, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 353
    .local v2, "recipient":Ljava/lang/String;
    const-string/jumbo v0, "title"

    invoke-virtual {v7, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 354
    .local v4, "title":Ljava/lang/String;
    const-string/jumbo v0, "photo"

    invoke-virtual {v7, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Landroid/graphics/Bitmap;

    .line 356
    .local v6, "photo":Landroid/graphics/Bitmap;
    new-instance v0, Lcom/pccw/database/entity/ChatPageInfo;

    invoke-direct/range {v0 .. v6}, Lcom/pccw/database/entity/ChatPageInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    goto :goto_0
.end method

.method private getViews()V
    .locals 3

    .prologue
    .line 467
    const-string/jumbo v1, "group"

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 468
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->voiceCallBtn:Landroid/widget/RelativeLayout;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 474
    :cond_0
    const v1, 0x7f0e01db

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->btn_emoji:Landroid/widget/ImageButton;

    .line 475
    const v1, 0x7f0e01d8

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->sendMsgBtn:Landroid/widget/ImageButton;

    .line 480
    const v1, 0x7f0e01da

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    .line 485
    const v1, 0x7f0e007c

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    .line 486
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 487
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setTranscriptMode(I)V

    .line 488
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setSmoothScrollbarEnabled(Z)V

    .line 493
    const v1, 0x7f0e0074

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->parentLayout:Landroid/widget/LinearLayout;

    .line 494
    const v1, 0x7f0e0083

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->emojiCover:Landroid/widget/FrameLayout;

    .line 499
    const v1, 0x7f0e0077

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->profilePic:Landroid/widget/ImageView;

    .line 501
    const v1, 0x7f0e0082

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    .line 505
    const v1, 0x7f0e007e

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->systemMessage:Landroid/widget/TextView;

    .line 507
    const v1, 0x7f0e007a

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    .line 509
    const-string/jumbo v1, "group"

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 510
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 513
    :cond_1
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080024

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    .line 514
    .local v0, "popUpheight":F
    float-to-int v1, v0

    invoke-direct {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->changeKeyboardHeight(I)V

    .line 515
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->enablePopUpView()V

    .line 516
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->parentLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->checkKeyboardHeight(Landroid/view/View;)V

    .line 517
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->clearFocus()V

    .line 519
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->addListViewHeader()V

    .line 520
    return-void
.end method

.method private insertListViewHeader(Z)V
    .locals 4
    .param p1, "insert"    # Z

    .prologue
    const/4 v2, 0x0

    .line 1435
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->viewLoadMoreMessage:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    .line 1436
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->btnLoadMore:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setEnabled(Z)V

    .line 1437
    iput-boolean p1, p0, Lcom/pccw/sms/ChatPageActivity;->isHeaderAdded:Z

    .line 1439
    if-eqz p1, :cond_1

    .line 1440
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->btnLoadMore:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 1455
    :cond_0
    :goto_0
    return-void

    .line 1442
    :cond_1
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->btnLoadMore:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 1443
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->btnLoadMore:Landroid/widget/RelativeLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 1444
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1447
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    .line 1448
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->endAnimation:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1449
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    .line 1451
    :cond_2
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    .line 1452
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->removeListAnimation:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private makeVoiceCall(Ljava/lang/String;)V
    .locals 7
    .param p1, "phoneNum"    # Ljava/lang/String;

    .prologue
    .line 1476
    const-string/jumbo v4, "852"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0x8

    if-le v4, v5, :cond_1

    const-string/jumbo v4, "+"

    .line 1477
    invoke-virtual {v4, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1479
    .local v3, "mformattedNumber":Ljava/lang/String;
    :goto_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget v4, v4, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v4, :cond_3

    .line 1480
    invoke-static {v3}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1481
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4, v3, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->startCallChecking(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1483
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->hasIDDPrefix(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1484
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v5, "SHOW_IDD_CHARGE_MESSAGE"

    const/4 v6, 0x1

    .line 1485
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1487
    :try_start_0
    iput-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->targetNumber:Ljava/lang/String;

    .line 1489
    new-instance v1, Landroid/widget/CheckBox;

    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 1490
    .local v1, "doNotShowAgainBox":Landroid/widget/CheckBox;
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1491
    const v4, 0x7f070106

    invoke-virtual {v1, v4}, Landroid/widget/CheckBox;->setText(I)V

    .line 1493
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1494
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v4, 0x7f020436

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f07006a

    .line 1495
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f070169

    .line 1496
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1497
    invoke-virtual {v4, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/high16 v5, 0x1040000

    new-instance v6, Lcom/pccw/sms/ChatPageActivity$25;

    invoke-direct {v6, p0}, Lcom/pccw/sms/ChatPageActivity$25;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    .line 1498
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x104000a

    new-instance v6, Lcom/pccw/sms/ChatPageActivity$24;

    invoke-direct {v6, p0, v1}, Lcom/pccw/sms/ChatPageActivity$24;-><init>(Lcom/pccw/sms/ChatPageActivity;Landroid/widget/CheckBox;)V

    .line 1505
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1519
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1535
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v1    # "doNotShowAgainBox":Landroid/widget/CheckBox;
    :cond_0
    :goto_1
    return-void

    .end local v3    # "mformattedNumber":Ljava/lang/String;
    :cond_1
    move-object v3, p1

    .line 1477
    goto/16 :goto_0

    .line 1525
    .restart local v3    # "mformattedNumber":Ljava/lang/String;
    :cond_2
    invoke-direct {p0, v3}, Lcom/pccw/sms/ChatPageActivity;->call(Ljava/lang/String;)V

    goto :goto_1

    .line 1530
    :cond_3
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.CALL"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1531
    .local v2, "intent":Landroid/content/Intent;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "tel:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1532
    invoke-virtual {p0, v2}, Lcom/pccw/sms/ChatPageActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 1520
    .end local v2    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v4

    goto :goto_1
.end method

.method private pasteNumberToDialer(Ljava/lang/String;)V
    .locals 3
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 1470
    const-string/jumbo v1, "852"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x8

    if-le v1, v2, :cond_0

    const-string/jumbo v1, "+"

    .line 1471
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1472
    .local v0, "mformattedNumber":Ljava/lang/String;
    :goto_0
    invoke-static {v0, p0}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->startActivity(Landroid/content/Intent;)V

    .line 1473
    return-void

    .end local v0    # "mformattedNumber":Ljava/lang/String;
    :cond_0
    move-object v0, p1

    .line 1471
    goto :goto_0
.end method

.method private promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V
    .locals 3
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;

    .prologue
    .line 1634
    new-instance v0, Lcom/pccw/dialog/KKDialogBuilder;

    invoke-direct {v0}, Lcom/pccw/dialog/KKDialogBuilder;-><init>()V

    .line 1635
    .local v0, "dialogBuilder":Lcom/pccw/dialog/KKDialogBuilder;
    new-instance v2, Lcom/pccw/dialog/KKDialogProvider;

    invoke-direct {v2, v0, p0}, Lcom/pccw/dialog/KKDialogProvider;-><init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V

    .line 1636
    .local v2, "provider":Lcom/pccw/dialog/KKDialogProvider;
    invoke-virtual {v2, p1, p0}, Lcom/pccw/dialog/KKDialogProvider;->requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;

    move-result-object v1

    .line 1637
    .local v1, "kkDialog":Lcom/pccw/dialog/KKDialog;
    invoke-virtual {v1}, Lcom/pccw/dialog/KKDialog;->show()V

    .line 1638
    return-void
.end method

.method private refreshList()V
    .locals 1

    .prologue
    .line 296
    new-instance v0, Lcom/pccw/sms/ChatPageActivity$5;

    invoke-direct {v0, p0}, Lcom/pccw/sms/ChatPageActivity$5;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 302
    return-void
.end method

.method private refreshListAdapter()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1076
    const-string/jumbo v1, "KKIM"

    const-string/jumbo v2, "refreshListAdapter"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1078
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->isIndividualChat()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->showCallLog:Z

    if-eqz v1, :cond_1

    .line 1079
    const-string/jumbo v1, "KKIM"

    const-string/jumbo v2, "merge with the call log."

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1080
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/CallLogIMService;->getChatPageData(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    .line 1086
    :goto_0
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->getChatPageLayoutInstance()Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    .line 1087
    .local v0, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    invoke-virtual {v0, v3}, Lcom/pccw/sms/bean/ChatPageListView;->setCurrentPage(I)V

    .line 1090
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    if-eqz v1, :cond_0

    .line 1091
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/pccw/sms/adapter/MessageAdapter;->setChatType(Ljava/lang/String;)V

    .line 1092
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Lcom/pccw/sms/adapter/MessageAdapter;->updateMessageList(Ljava/util/List;)V

    .line 1093
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v1}, Lcom/pccw/sms/adapter/MessageAdapter;->notifyDataSetChanged()V

    .line 1094
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v0, v1}, Lcom/pccw/sms/bean/ChatPageListView;->setMessageAdapter(Lcom/pccw/sms/adapter/MessageAdapter;)V

    .line 1096
    :cond_0
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->scrollMyListViewToBottom()V

    .line 1097
    return-void

    .line 1082
    .end local v0    # "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    :cond_1
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->getMessageItem(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method private refreshListAdapterWithMultiplePage(I)V
    .locals 7
    .param p1, "upToPage"    # I

    .prologue
    const/4 v6, 0x1

    .line 1101
    const-string/jumbo v3, "KKIM"

    const-string/jumbo v4, "refreshListAdapterWithMultiplePage"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1103
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-gt v0, p1, :cond_3

    .line 1104
    if-ne v0, v6, :cond_1

    .line 1105
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3}, Lcom/pccw/database/entity/ChatPageInfo;->isIndividualChat()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/pccw/sms/ChatPageActivity;->showCallLog:Z

    if-eqz v3, :cond_0

    .line 1106
    const-string/jumbo v3, "KKIM"

    const-string/jumbo v4, "merge with the call log. - multiple page = 1"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1107
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3, v4, v6}, Lcom/pccw/sms/service/CallLogIMService;->getChatPageData(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    .line 1103
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1109
    :cond_0
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3, v4, v6}, Lcom/pccw/sms/service/MessageItemService;->getMessageItem(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    goto :goto_1

    .line 1112
    :cond_1
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3}, Lcom/pccw/database/entity/ChatPageInfo;->isIndividualChat()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/pccw/sms/ChatPageActivity;->showCallLog:Z

    if-eqz v3, :cond_2

    .line 1113
    const-string/jumbo v3, "KKIM"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "merge with the call log. - multiple page = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1114
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3, v4, v0}, Lcom/pccw/sms/service/CallLogIMService;->getChatPageData(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v1

    .line 1119
    .local v1, "newitems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    :goto_2
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1120
    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    goto :goto_1

    .line 1116
    .end local v1    # "newitems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    :cond_2
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3, v4, v0}, Lcom/pccw/sms/service/MessageItemService;->getMessageItem(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v1

    .restart local v1    # "newitems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    goto :goto_2

    .line 1125
    .end local v1    # "newitems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    :cond_3
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->getChatPageLayoutInstance()Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v2

    .line 1126
    .local v2, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    invoke-virtual {v2, p1}, Lcom/pccw/sms/bean/ChatPageListView;->setCurrentPage(I)V

    .line 1129
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    if-eqz v3, :cond_4

    .line 1130
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v4}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/pccw/sms/adapter/MessageAdapter;->setChatType(Ljava/lang/String;)V

    .line 1131
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Lcom/pccw/sms/adapter/MessageAdapter;->updateMessageList(Ljava/util/List;)V

    .line 1132
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v3}, Lcom/pccw/sms/adapter/MessageAdapter;->notifyDataSetChanged()V

    .line 1133
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v2, v3}, Lcom/pccw/sms/bean/ChatPageListView;->setMessageAdapter(Lcom/pccw/sms/adapter/MessageAdapter;)V

    .line 1136
    :cond_4
    return-void
.end method

.method private refreshListAdapterWithSettingProgressBar(I)V
    .locals 4
    .param p1, "msgId"    # I

    .prologue
    const/4 v3, 0x1

    .line 1140
    const-string/jumbo v1, "KKIM"

    const-string/jumbo v2, "refreshListAdapter with MsgId"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1142
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->isIndividualChat()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->showCallLog:Z

    if-eqz v1, :cond_1

    .line 1143
    const-string/jumbo v1, "KKIM"

    const-string/jumbo v2, "merge with the call log."

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1144
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/CallLogIMService;->getChatPageData(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    .line 1150
    :goto_0
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->getChatPageLayoutInstance()Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    .line 1151
    .local v0, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    invoke-virtual {v0, v3}, Lcom/pccw/sms/bean/ChatPageListView;->setCurrentPage(I)V

    .line 1154
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    if-eqz v1, :cond_0

    .line 1155
    sput p1, Lcom/pccw/sms/adapter/MessageAdapter;->targetingMsgId:I

    .line 1156
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/pccw/sms/adapter/MessageAdapter;->setChatType(Ljava/lang/String;)V

    .line 1157
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Lcom/pccw/sms/adapter/MessageAdapter;->updateMessageList(Ljava/util/List;)V

    .line 1158
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v1}, Lcom/pccw/sms/adapter/MessageAdapter;->notifyDataSetChanged()V

    .line 1159
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v0, v1}, Lcom/pccw/sms/bean/ChatPageListView;->setMessageAdapter(Lcom/pccw/sms/adapter/MessageAdapter;)V

    .line 1161
    :cond_0
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->scrollMyListViewToBottom()V

    .line 1162
    return-void

    .line 1146
    .end local v0    # "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    :cond_1
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1, v2, v3}, Lcom/pccw/sms/service/MessageItemService;->getMessageItem(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method private removeAllMessage()V
    .locals 2

    .prologue
    .line 1208
    new-instance v0, Lcom/pccw/sms/service/MessageItemService;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    .line 1209
    .local v0, "messageItemService":Lcom/pccw/sms/service/MessageItemService;
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/sms/service/MessageItemService;->deleteChatByChatId(Ljava/lang/String;)I

    .line 1210
    return-void
.end method

.method private removeThisChat()V
    .locals 2

    .prologue
    .line 1214
    new-instance v0, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 1215
    .local v0, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/sms/service/ChatRecordService;->deleteChatByChatId(Ljava/lang/String;)V

    .line 1216
    return-void
.end method

.method private resetButton()V
    .locals 3

    .prologue
    .line 1458
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 1459
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->endAnimation:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1460
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->handler:Landroid/os/Handler;

    .line 1462
    :cond_0
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->view_notice:Landroid/widget/RelativeLayout;

    const/16 v2, 0x1e

    invoke-direct {p0, v0, v1, v2}, Lcom/pccw/sms/ChatPageActivity;->setFadingAnimation(ZLandroid/view/View;I)V

    .line 1463
    return-void
.end method

.method private scrollMyListViewToBottom()V
    .locals 2

    .prologue
    .line 996
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->isUpdateSentStatus:Z

    if-nez v0, :cond_0

    .line 997
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$17;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$17;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 1034
    :cond_0
    return-void
.end method

.method private sendMessage()V
    .locals 5

    .prologue
    .line 833
    iget-boolean v2, p0, Lcom/pccw/sms/ChatPageActivity;->isSendMessage:Z

    if-nez v2, :cond_0

    .line 846
    :goto_0
    return-void

    .line 836
    :cond_0
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 838
    .local v1, "sendMsg":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 841
    :try_start_0
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->sendSMSService:Lcom/pccw/sms/service/SendSMSService;

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v3

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v2, v1, v3, v4}, Lcom/pccw/sms/service/SendSMSService;->sendMessage(Ljava/lang/String;ILandroid/content/Context;)V
    :try_end_0
    .catch Lcom/pccw/exception/NoNetworkException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 842
    :catch_0
    move-exception v0

    .line 843
    .local v0, "e":Lcom/pccw/exception/NoNetworkException;
    invoke-virtual {v0}, Lcom/pccw/exception/NoNetworkException;->printStackTrace()V

    goto :goto_0
.end method

.method private setEmojiKeyboard()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 868
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->openEmojiKeyboard:Z

    if-eqz v0, :cond_0

    .line 869
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    iget v1, p0, Lcom/pccw/sms/ChatPageActivity;->keyboardHeight:I

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 870
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->parentLayout:Landroid/widget/LinearLayout;

    const/16 v2, 0x50

    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 871
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->showDialog()V

    .line 873
    :cond_0
    return-void
.end method

.method private setFadingAnimation(ZLandroid/view/View;I)V
    .locals 5
    .param p1, "isFading"    # Z
    .param p2, "view"    # Landroid/view/View;
    .param p3, "time"    # I

    .prologue
    const/4 v4, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    .line 1379
    if-eqz p1, :cond_0

    .line 1380
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v2, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 1384
    .local v0, "fading":Landroid/view/animation/Animation;
    :goto_0
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 1385
    int-to-long v2, p3

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 1386
    invoke-virtual {v0, v4}, Landroid/view/animation/Animation;->setFillEnabled(Z)V

    .line 1387
    invoke-virtual {v0, v4}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 1388
    new-instance v1, Lcom/pccw/sms/ChatPageActivity$21;

    invoke-direct {v1, p0, p1}, Lcom/pccw/sms/ChatPageActivity$21;-><init>(Lcom/pccw/sms/ChatPageActivity;Z)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 1410
    invoke-virtual {p2, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 1411
    return-void

    .line 1382
    .end local v0    # "fading":Landroid/view/animation/Animation;
    :cond_0
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .restart local v0    # "fading":Landroid/view/animation/Animation;
    goto :goto_0
.end method

.method private setViewAction()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 541
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->btn_emoji:Landroid/widget/ImageButton;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$6;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$6;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 573
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->sendMsgBtn:Landroid/widget/ImageButton;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$7;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$7;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 593
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$8;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$8;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 601
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$9;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$9;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 661
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$10;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$10;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 676
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$11;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$11;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 698
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->userProfileBtn:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$12;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$12;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 716
    const-string/jumbo v0, "group"

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 717
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->voiceCallBtn:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$13;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$13;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 726
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->btnLoadMore:Landroid/widget/RelativeLayout;

    new-instance v1, Lcom/pccw/sms/ChatPageActivity$14;

    invoke-direct {v1, p0}, Lcom/pccw/sms/ChatPageActivity$14;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 803
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->sendMsgBtn:Landroid/widget/ImageButton;

    invoke-virtual {v0, v3}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 808
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->countDisplayingMessage(I)V

    .line 809
    new-instance v0, Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2, p0}, Lcom/pccw/sms/adapter/MessageAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/lang/String;Lcom/pccw/sms/adapter/MessageAdapter$MessageAdapterActionResponse;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    .line 810
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 811
    iput-boolean v3, p0, Lcom/pccw/sms/ChatPageActivity;->isUpdateSentStatus:Z

    .line 812
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->scrollMyListViewToBottom()V

    .line 814
    new-instance v0, Lcom/pccw/sms/bean/ChatPageListView;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-direct {v0, v1, v2, v3}, Lcom/pccw/sms/bean/ChatPageListView;-><init>(Landroid/widget/ListView;ILcom/pccw/sms/adapter/MessageAdapter;)V

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    .line 815
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    invoke-virtual {v0, v1}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->init(Lcom/pccw/sms/bean/ChatPageListView;)V

    .line 817
    return-void
.end method

.method private showNotInGroupFooterMessage()V
    .locals 3

    .prologue
    .line 853
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->isRemovedByOthers:Z

    if-eqz v0, :cond_0

    .line 854
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    const v1, 0x7f07009a

    invoke-virtual {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 855
    :cond_0
    return-void
.end method

.method private showRemoveAllMessageAndQuitDialog()V
    .locals 4

    .prologue
    .line 1189
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1190
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f020436

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07006a

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0701f6

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v2, 0x1040000

    new-instance v3, Lcom/pccw/sms/ChatPageActivity$19;

    invoke-direct {v3, p0}, Lcom/pccw/sms/ChatPageActivity$19;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    .line 1191
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    new-instance v3, Lcom/pccw/sms/ChatPageActivity$18;

    invoke-direct {v3, p0}, Lcom/pccw/sms/ChatPageActivity$18;-><init>(Lcom/pccw/sms/ChatPageActivity;)V

    .line 1196
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1203
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1204
    return-void
.end method

.method private toggleEmojiButton(Z)V
    .locals 1
    .param p1, "on"    # Z

    .prologue
    .line 858
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->btn_emoji:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setSelected(Z)V

    .line 859
    return-void
.end method

.method private toggleKeyboard()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 862
    const-string/jumbo v2, "input_method"

    invoke-virtual {p0, v2}, Lcom/pccw/sms/ChatPageActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 863
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    const/4 v2, 0x2

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 864
    iget-boolean v2, p0, Lcom/pccw/sms/ChatPageActivity;->isKeyBoardVisible:Z

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isKeyBoardVisible:Z

    .line 865
    return-void
.end method

.method private updateChatPageUI()V
    .locals 3

    .prologue
    .line 461
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->profilePic:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->getPhoto()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 462
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->userNameTV:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->getTitle()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xf

    invoke-static {v1, v2}, Lcom/pccw/sms/util/SMSFormatUtil;->ellipsisTextWithThreeDots(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 463
    return-void
.end method

.method private updateSMSTypeImage()V
    .locals 4

    .prologue
    .line 443
    new-instance v1, Lcom/pccw/sms/service/CheckSMSTypeService;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSTypeServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    invoke-direct {v1, v2, v3}, Lcom/pccw/sms/service/CheckSMSTypeService;-><init>(Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;Landroid/content/Context;)V

    .line 445
    .local v1, "service":Lcom/pccw/sms/service/CheckSMSTypeService;
    :try_start_0
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getRecipient()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/pccw/sms/service/CheckSMSTypeService;->checkSMSType(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/pccw/exception/NoNetworkException; {:try_start_0 .. :try_end_0} :catch_0

    .line 452
    :goto_0
    return-void

    .line 446
    :catch_0
    move-exception v0

    .line 447
    .local v0, "e":Lcom/pccw/exception/NoNetworkException;
    invoke-virtual {v0}, Lcom/pccw/exception/NoNetworkException;->printStackTrace()V

    .line 449
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->smsTypeImg:Landroid/widget/ImageView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method public OnKeyboardDialogDismiss()V
    .locals 1

    .prologue
    .line 1054
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1055
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 1057
    :cond_0
    return-void
.end method

.method public checkTopAndBottom()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 1340
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getCount()I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_1

    .line 1357
    :cond_0
    :goto_0
    return-void

    .line 1341
    :cond_1
    iget v1, p0, Lcom/pccw/sms/ChatPageActivity;->currentScrollState:I

    if-nez v1, :cond_0

    .line 1343
    iget-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->checkStackFromBottom:Z

    if-nez v1, :cond_2

    .line 1344
    iput-boolean v3, p0, Lcom/pccw/sms/ChatPageActivity;->checkStackFromBottom:Z

    .line 1345
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v0

    .line 1347
    .local v0, "last":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v0, :cond_2

    .line 1348
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setStackFromBottom(Z)V

    .line 1351
    .end local v0    # "last":I
    :cond_2
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v1

    if-ge v1, v3, :cond_0

    .line 1352
    iget-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isHeaderAdded:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->onScroll:Z

    if-nez v1, :cond_0

    .line 1353
    iput-boolean v3, p0, Lcom/pccw/sms/ChatPageActivity;->onScroll:Z

    .line 1354
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->autoScrollDown()V

    goto :goto_0
.end method

.method public dismissDialog()V
    .locals 4

    .prologue
    .line 987
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, "dialog"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 988
    .local v1, "prev":Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_0

    move-object v0, v1

    .line 989
    check-cast v0, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    .line 990
    .local v0, "df":Lcom/pccw/sms/emoji/EmojiKeyboardFragment;
    invoke-virtual {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->dismiss()V

    .line 992
    .end local v0    # "df":Lcom/pccw/sms/emoji/EmojiKeyboardFragment;
    :cond_0
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/pccw/sms/ChatPageActivity;->isEmojiKeyboardVisible:Z

    .line 993
    return-void
.end method

.method public getPath(Landroid/net/Uri;)Ljava/lang/String;
    .locals 8
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 1062
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v1, "_data"

    aput-object v1, v2, v0

    .local v2, "projection":[Ljava/lang/String;
    move-object v0, p0

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    .line 1063
    invoke-virtual/range {v0 .. v5}, Lcom/pccw/sms/ChatPageActivity;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1064
    .local v7, "cursor":Landroid/database/Cursor;
    if-eqz v7, :cond_0

    .line 1067
    const-string/jumbo v0, "_data"

    .line 1068
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 1069
    .local v6, "column_index":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1070
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1071
    .end local v6    # "column_index":I
    :cond_0
    return-object v3
.end method

.method public onAdapterItemRefresh(I)V
    .locals 4
    .param p1, "size"    # I

    .prologue
    const/16 v3, 0x14

    const/4 v2, 0x1

    .line 1575
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 1576
    .local v0, "last":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v0, :cond_0

    .line 1577
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setStackFromBottom(Z)V

    .line 1582
    :cond_0
    iget-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isHeaderAdded:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v1, v3, :cond_1

    .line 1583
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->resetButton()V

    .line 1584
    :cond_1
    iget-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isUpdatedByUser:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    invoke-virtual {v1}, Lcom/pccw/sms/bean/ChatPageListView;->getCurrentPage()I

    move-result v1

    if-ne v1, v2, :cond_2

    .line 1585
    invoke-direct {p0, p1}, Lcom/pccw/sms/ChatPageActivity;->countDisplayingMessage(I)V

    .line 1590
    :cond_2
    if-gt p1, v3, :cond_3

    .line 1591
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->scrollMyListViewToBottom()V

    .line 1594
    :cond_3
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/pccw/sms/ChatPageActivity;->isUpdatedByUser:Z

    .line 1595
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 1220
    invoke-static {p0}, Landroid/support/v4/app/NavUtils;->navigateUpFromSameTask(Landroid/app/Activity;)V

    .line 1221
    return-void
.end method

.method public onClickKKDialogNegativeButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1662
    return-void
.end method

.method public onClickKKDialogNeutralButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 0
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1668
    return-void
.end method

.method public onClickKKDialogPositiveButton(Lcom/pccw/dialog/KKDialog;)V
    .locals 2
    .param p1, "dialog"    # Lcom/pccw/dialog/KKDialog;

    .prologue
    .line 1642
    sget-object v0, Lcom/pccw/sms/ChatPageActivity$26;->$SwitchMap$com$pccw$dialog$EnumKKDialogType:[I

    invoke-virtual {p1}, Lcom/pccw/dialog/KKDialog;->getDialogType()Lcom/pccw/dialog/EnumKKDialogType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/pccw/dialog/EnumKKDialogType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 1656
    :goto_0
    return-void

    .line 1644
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.settings.WIFI_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1648
    :pswitch_1
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->sendMessage()V

    goto :goto_0

    .line 1651
    :pswitch_2
    const-string/jumbo v0, ""

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/util/IntentUtils;->genDialScreenIntent(Ljava/lang/String;Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 1642
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v7, 0x10

    const/4 v6, 0x0

    .line 306
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 307
    new-instance v4, Lcom/pccw/sms/service/CallLogIMService;

    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/pccw/sms/service/CallLogIMService;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    .line 308
    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    invoke-virtual {v4}, Lcom/pccw/sms/service/CallLogIMService;->clearCallLogAll()V

    .line 309
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v6, v5, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 311
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    .line 312
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 313
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 314
    invoke-virtual {v0, v7, v7}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 315
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 316
    .local v1, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f04001c

    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v4, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 317
    .local v2, "layout":Landroid/view/View;
    const v4, 0x7f0e0043

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 318
    .local v3, "titleView":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0700a3

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 319
    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 321
    const v4, 0x7f04001f

    invoke-virtual {p0, v4}, Lcom/pccw/sms/ChatPageActivity;->setContentView(I)V

    .line 322
    const v4, 0x7f0e0079

    invoke-virtual {p0, v4}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->userNameTV:Landroid/widget/TextView;

    .line 323
    const v4, 0x7f0e0078

    invoke-virtual {p0, v4}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->userProfileBtn:Landroid/widget/RelativeLayout;

    .line 324
    const v4, 0x7f0e007b

    invoke-virtual {p0, v4}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->voiceCallBtn:Landroid/widget/RelativeLayout;

    .line 325
    const v4, 0x7f0e007d

    invoke-virtual {p0, v4}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->sysMsgFooter:Landroid/widget/RelativeLayout;

    .line 326
    const v4, 0x7f0e01dd

    invoke-virtual {p0, v4}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->charCountTv:Landroid/widget/TextView;

    .line 327
    const v4, 0x7f0e01de

    invoke-virtual {p0, v4}, Lcom/pccw/sms/ChatPageActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->concatCountTv:Landroid/widget/TextView;

    .line 329
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->getInfoFromIntent()V

    .line 331
    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "recipient="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v6}, Lcom/pccw/database/entity/ChatPageInfo;->getRecipient()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " ;chatId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v6}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " ;type="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v6}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " ;title="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    .line 332
    invoke-virtual {v6}, Lcom/pccw/database/entity/ChatPageInfo;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 331
    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    new-instance v4, Lcom/pccw/sms/service/MessageItemService;

    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/pccw/sms/service/MessageItemService;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    .line 335
    invoke-static {}, Lcom/pccw/sms/service/SendSMSService;->getInstance()Lcom/pccw/sms/service/SendSMSService;

    move-result-object v4

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->sendSMSService:Lcom/pccw/sms/service/SendSMSService;

    .line 336
    new-instance v4, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;

    iget-object v5, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryStatusServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;

    iget-object v6, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    .line 337
    invoke-virtual {v6}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    invoke-direct {v4, v5, v6, v7}, Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;-><init>(Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;Ljava/lang/String;Landroid/content/Context;)V

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryStatusService:Lcom/pccw/sms/service/CheckSMSDeliveryStatusService;

    .line 338
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->getViews()V

    .line 340
    new-instance v4, Landroid/os/Handler;

    invoke-direct {v4}, Landroid/os/Handler;-><init>()V

    iput-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryServiceHandler:Landroid/os/Handler;

    .line 341
    return-void
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
    const/4 v4, 0x0

    .line 1225
    const-string/jumbo v0, "KKIM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bundle="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1226
    packed-switch p1, :pswitch_data_0

    move-object v0, v4

    .line 1234
    :goto_0
    return-object v0

    .line 1228
    :pswitch_0
    new-instance v0, Landroid/support/v4/content/CursorLoader;

    sget-object v2, Lcom/pccw/sms/ChatPageActivity$CallLogQuery;->URI:Landroid/net/Uri;

    sget-object v3, Lcom/pccw/sms/ChatPageActivity$CallLogQuery;->CALL_LOG_PROJECTION:[Ljava/lang/String;

    move-object v1, p0

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1231
    :pswitch_1
    new-instance v1, Landroid/support/v4/content/CursorLoader;

    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    move-object v2, p0

    move-object v5, v4

    move-object v6, v4

    move-object v7, v4

    invoke-direct/range {v1 .. v7}, Landroid/support/v4/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_0

    .line 1226
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1166
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 1167
    .local v0, "inflater":Landroid/view/MenuInflater;
    const v1, 0x7f100002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1168
    const-string/jumbo v1, "KKIM"

    const-string/jumbo v2, "onCreateOptionsMenu chat page"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1169
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v1

    return v1
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 362
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "overvide method * onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "Y"

    invoke-virtual {v0, v1, v2}, Lcom/pccw/sms/service/MessageItemService;->updateIsRead(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->destroy()V

    .line 366
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onDestroy()V

    .line 367
    return-void
.end method

.method public onEmojiconBackspaceClicked(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1042
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    invoke-static {v0}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->backspace(Landroid/widget/EditText;)V

    .line 1043
    return-void
.end method

.method public onEmojiconClicked(Lcom/pccw/sms/bean/Emojicon;)V
    .locals 1
    .param p1, "emojicon"    # Lcom/pccw/sms/bean/Emojicon;

    .prologue
    .line 1048
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    invoke-static {v0, p1}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->input(Landroid/widget/EditText;Lcom/pccw/sms/bean/Emojicon;)V

    .line 1049
    return-void
.end method

.method public onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V
    .locals 6
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
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    const/4 v5, 0x1

    .line 1242
    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 1270
    :goto_0
    return-void

    .line 1244
    :pswitch_0
    const-string/jumbo v3, "KKIM"

    const-string/jumbo v4, "chatpage - load calllog finished - A"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1245
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3}, Lcom/pccw/database/entity/ChatPageInfo;->isIndividualChat()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lcom/pccw/sms/ChatPageActivity;->showCallLog:Z

    if-eqz v3, :cond_0

    .line 1246
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    invoke-virtual {v3, p2}, Lcom/pccw/sms/service/CallLogIMService;->addCallLogAll(Landroid/database/Cursor;)V

    .line 1247
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->callLogIMService:Lcom/pccw/sms/service/CallLogIMService;

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3, v4, v5}, Lcom/pccw/sms/service/CallLogIMService;->getChatPageData(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    .line 1248
    const-string/jumbo v3, "KKIM"

    const-string/jumbo v4, "chatpage - load calllog finished - B"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1252
    :goto_1
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->setViewAction()V

    goto :goto_0

    .line 1250
    :cond_0
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v4, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3, v4, v5}, Lcom/pccw/sms/service/MessageItemService;->getMessageItem(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    goto :goto_1

    .line 1255
    :pswitch_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1256
    const-string/jumbo v3, "DATA1"

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1257
    .local v2, "username":Ljava/lang/String;
    new-instance v1, Lcom/pccw/sms/service/ChatRecordService;

    invoke-direct {v1, p0}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 1258
    .local v1, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    invoke-virtual {v1, v2}, Lcom/pccw/sms/service/ChatRecordService;->getChatListDetailByChatcontact(Ljava/lang/String;)Lcom/pccw/database/entity/ChatListUserInfo;

    move-result-object v0

    .line 1259
    .local v0, "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v3, v2}, Lcom/pccw/database/entity/ChatPageInfo;->setRecipient(Ljava/lang/String;)V

    .line 1260
    if-nez v0, :cond_2

    .line 1261
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Lcom/pccw/database/entity/ChatPageInfo;->setChatId(I)V

    .line 1267
    .end local v0    # "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    .end local v1    # "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    .end local v2    # "username":Ljava/lang/String;
    :cond_1
    :goto_2
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->updateChatPageUI()V

    goto :goto_0

    .line 1263
    .restart local v0    # "chatListUserInfo":Lcom/pccw/database/entity/ChatListUserInfo;
    .restart local v1    # "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    .restart local v2    # "username":Ljava/lang/String;
    :cond_2
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v0}, Lcom/pccw/database/entity/ChatListUserInfo;->getNickName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/pccw/database/entity/ChatPageInfo;->setTitle(Ljava/lang/String;)V

    .line 1264
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v0}, Lcom/pccw/database/entity/ChatListUserInfo;->getChatId()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/pccw/database/entity/ChatPageInfo;->setChatId(I)V

    goto :goto_2

    .line 1242
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 109
    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/pccw/sms/ChatPageActivity;->onLoadFinished(Landroid/support/v4/content/Loader;Landroid/database/Cursor;)V

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
    .line 1276
    .local p1, "arg0":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Landroid/database/Cursor;>;"
    return-void
.end method

.method public onMessageItemClicked(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "fileType"    # Ljava/lang/String;
    .param p2, "filePath"    # Ljava/lang/String;
    .param p3, "msgId"    # I

    .prologue
    .line 1613
    return-void
.end method

.method public onMessageItemClicked(Ljava/lang/String;Ljava/lang/String;ILandroid/widget/SeekBar;Landroid/widget/ImageView;)V
    .locals 0
    .param p1, "fileType"    # Ljava/lang/String;
    .param p2, "filePath"    # Ljava/lang/String;
    .param p3, "msgId"    # I
    .param p4, "seekBar"    # Landroid/widget/SeekBar;
    .param p5, "imageView"    # Landroid/widget/ImageView;

    .prologue
    .line 1619
    return-void
.end method

.method public onMessageItemDeleted(I)V
    .locals 3
    .param p1, "msgId"    # I

    .prologue
    .line 1623
    new-instance v0, Lcom/pccw/sms/service/ChatRecordService;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/pccw/sms/service/ChatRecordService;-><init>(Landroid/content/Context;)V

    .line 1624
    .local v0, "chatRecordService":Lcom/pccw/sms/service/ChatRecordService;
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/sms/service/ChatRecordService;->getMsgCount(I)I

    move-result v1

    if-lez v1, :cond_0

    .line 1625
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/pccw/sms/service/MessageItemService;->getLastMessage(I)Lcom/pccw/database/entity/MessageStore;

    .line 1626
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->refreshList()V

    .line 1631
    :goto_0
    return-void

    .line 1628
    :cond_0
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->removeThisChat()V

    .line 1629
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->finish()V

    goto :goto_0
.end method

.method public onMessageResent(I)V
    .locals 4
    .param p1, "msgId"    # I

    .prologue
    .line 1546
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginSuccress()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1548
    :try_start_0
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->sendSMSService:Lcom/pccw/sms/service/SendSMSService;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v2

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v1, p1, v2, v3}, Lcom/pccw/sms/service/SendSMSService;->resendMessageWithId(IILandroid/content/Context;)V
    :try_end_0
    .catch Lcom/pccw/exception/NoNetworkException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1557
    :goto_0
    return-void

    .line 1549
    :catch_0
    move-exception v0

    .line 1550
    .local v0, "e":Lcom/pccw/exception/NoNetworkException;
    invoke-virtual {v0}, Lcom/pccw/exception/NoNetworkException;->printStackTrace()V

    .line 1551
    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertNoWifiDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-direct {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0

    .line 1554
    .end local v0    # "e":Lcom/pccw/exception/NoNetworkException;
    :cond_0
    sget-object v1, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    invoke-direct {p0, v1}, Lcom/pccw/sms/ChatPageActivity;->promptDialog(Lcom/pccw/dialog/EnumKKDialogType;)V

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1599
    const-string/jumbo v1, "KKIM"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "========ChatPage onNewIntent intent null? "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-nez p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1600
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_2

    .line 1601
    :cond_0
    const-string/jumbo v0, "KKIM"

    const-string/jumbo v1, "========ChatPage onNewIntent intent NULL, not do restart"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1607
    :goto_1
    return-void

    .line 1599
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1604
    :cond_2
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->finish()V

    .line 1605
    invoke-virtual {p0, p1}, Lcom/pccw/sms/ChatPageActivity;->startActivity(Landroid/content/Intent;)V

    .line 1606
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onNewIntent(Landroid/content/Intent;)V

    goto :goto_1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 1174
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 1185
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 1176
    :sswitch_0
    invoke-static {p0}, Landroid/support/v4/app/NavUtils;->navigateUpFromSameTask(Landroid/app/Activity;)V

    goto :goto_0

    .line 1179
    :sswitch_1
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->showRemoveAllMessageAndQuitDialog()V

    goto :goto_0

    .line 1174
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f0e0208 -> :sswitch_1
    .end sparse-switch
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 382
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryServiceHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryServiceRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 383
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->sendSMSService:Lcom/pccw/sms/service/SendSMSService;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->sendSMSListener:Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    invoke-virtual {v0, v1}, Lcom/pccw/sms/service/SendSMSService;->removeListener(Lcom/pccw/sms/service/listener/ISendSMSServiceListener;)V

    .line 384
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v1, "overvide method * onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "Y"

    invoke-virtual {v0, v1, v2}, Lcom/pccw/sms/service/MessageItemService;->updateIsRead(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->destroy()V

    .line 389
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 390
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->popupWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 393
    :cond_0
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->isKeyBoardVisible:Z

    if-eqz v0, :cond_1

    .line 394
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->toggleKeyboard()V

    .line 397
    :cond_1
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onPause()V

    .line 398
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 402
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onResume(), resume the ChatActivity; chatId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 403
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    if-eqz v0, :cond_0

    .line 404
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v0}, Lcom/pccw/sms/adapter/MessageAdapter;->clearAdapterCache()V

    .line 406
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v1}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/sms/service/MessageItemService;->getFirstUnreadMessageId(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/pccw/sms/ChatPageActivity;->firstUnreadMessageId:I

    .line 407
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->messageItemService:Lcom/pccw/sms/service/MessageItemService;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "Y"

    invoke-virtual {v0, v1, v2}, Lcom/pccw/sms/service/MessageItemService;->updateIsRead(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getChatPageListView()Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    if-eqz v0, :cond_1

    .line 410
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    invoke-virtual {v1}, Lcom/pccw/sms/bean/ChatPageListView;->getCurrentPage()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/pccw/sms/bean/ChatPageListView;->setCurrentPage(I)V

    .line 411
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    invoke-virtual {v0, v1}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->init(Lcom/pccw/sms/bean/ChatPageListView;)V

    .line 412
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    invoke-virtual {v0}, Lcom/pccw/sms/bean/ChatPageListView;->getCurrentPage()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 413
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->refreshListAdapter()V

    .line 419
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->sendSMSService:Lcom/pccw/sms/service/SendSMSService;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->sendSMSListener:Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    invoke-virtual {v0, v1}, Lcom/pccw/sms/service/SendSMSService;->addListener(Lcom/pccw/sms/service/listener/ISendSMSServiceListener;)V

    .line 427
    iput-boolean v3, p0, Lcom/pccw/sms/ChatPageActivity;->isMediaTransfer:Z

    .line 428
    iput v3, p0, Lcom/pccw/sms/ChatPageActivity;->groupCheckCnt:I

    .line 430
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v0}, Lcom/pccw/database/entity/ChatPageInfo;->getRecipient()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 431
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->updateChatPageUI()V

    .line 434
    :cond_2
    invoke-direct {p0}, Lcom/pccw/sms/ChatPageActivity;->doResendService()V

    .line 436
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryServiceHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity;->checkSMSDeliveryServiceRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 438
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onResume()V

    .line 439
    return-void

    .line 415
    :cond_3
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity;->chatPageListView:Lcom/pccw/sms/bean/ChatPageListView;

    invoke-virtual {v0}, Lcom/pccw/sms/bean/ChatPageListView;->getCurrentPage()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/pccw/sms/ChatPageActivity;->refreshListAdapterWithMultiplePage(I)V

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 373
    iget-boolean v0, p0, Lcom/pccw/sms/ChatPageActivity;->isEmojiKeyboardVisible:Z

    if-eqz v0, :cond_0

    .line 374
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->dismissDialog()V

    .line 377
    :cond_0
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 378
    return-void
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 5
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "firstVisibleItem"    # I
    .param p3, "visibleItemCount"    # I
    .param p4, "totalItemCount"    # I

    .prologue
    const/16 v4, 0x8

    const/4 v3, -0x1

    .line 1310
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->checkTopAndBottom()V

    .line 1311
    const/4 v0, -0x1

    .line 1313
    .local v0, "firstVisibleMessageId":I
    if-lez p4, :cond_1

    .line 1314
    if-lez p2, :cond_3

    .line 1315
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v2}, Lcom/pccw/sms/adapter/MessageAdapter;->getUnreadMessageId()I

    move-result v1

    .line 1317
    .local v1, "msgId":I
    if-eq v1, v3, :cond_1

    iget-boolean v2, p0, Lcom/pccw/sms/ChatPageActivity;->isAllRead:Z

    if-nez v2, :cond_1

    .line 1318
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v2, p2}, Lcom/pccw/sms/adapter/MessageAdapter;->getMessageIdByPosition(I)I

    move-result v0

    .line 1319
    if-ne v0, v1, :cond_2

    .line 1320
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->isShown()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1321
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1322
    :cond_0
    iput v3, p0, Lcom/pccw/sms/ChatPageActivity;->firstUnreadMessageId:I

    .line 1323
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/pccw/sms/ChatPageActivity;->isAllRead:Z

    .line 1337
    .end local v1    # "msgId":I
    :cond_1
    :goto_0
    return-void

    .line 1324
    .restart local v1    # "msgId":I
    :cond_2
    iget-boolean v2, p0, Lcom/pccw/sms/ChatPageActivity;->isAllRead:Z

    if-nez v2, :cond_1

    if-le v0, v1, :cond_1

    .line 1326
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->isShown()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1327
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    .line 1332
    .end local v1    # "msgId":I
    :cond_3
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v2, p2}, Lcom/pccw/sms/adapter/MessageAdapter;->getMessageIdByPosition(I)I

    move-result v0

    .line 1333
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->isShown()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1334
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0
    .param p1, "view"    # Landroid/widget/AbsListView;
    .param p2, "scrollState"    # I

    .prologue
    .line 1301
    iput p2, p0, Lcom/pccw/sms/ChatPageActivity;->currentScrollState:I

    .line 1302
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->checkTopAndBottom()V

    .line 1303
    return-void
.end method

.method public showDialog()V
    .locals 4

    .prologue
    .line 973
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    .line 974
    .local v0, "ft":Landroid/support/v4/app/FragmentTransaction;
    invoke-virtual {p0}, Lcom/pccw/sms/ChatPageActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, "dialog"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 975
    .local v1, "prev":Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_0

    .line 976
    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    .line 978
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/support/v4/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    .line 979
    iget v2, p0, Lcom/pccw/sms/ChatPageActivity;->keyboardHeight:I

    invoke-static {v2}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->newInstance(I)Lcom/pccw/sms/emoji/EmojiKeyboardFragment;

    move-result-object v2

    const-string/jumbo v3, "dialog"

    invoke-virtual {v2, v0, v3}, Lcom/pccw/sms/emoji/EmojiKeyboardFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 981
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->requestFocus()Z

    .line 982
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/pccw/sms/ChatPageActivity;->isEmojiKeyboardVisible:Z

    .line 983
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/pccw/sms/ChatPageActivity;->openEmojiKeyboard:Z

    .line 984
    return-void
.end method
