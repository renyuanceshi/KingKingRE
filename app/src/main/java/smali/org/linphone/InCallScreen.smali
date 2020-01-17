.class public Lorg/linphone/InCallScreen;
.super Lorg/linphone/CallScreen;
.source "InCallScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/InCallScreen$IncomingCallDialogFragment;
    }
.end annotation


# static fields
.field static final ADD_CALL_ACTIVITY:I = 0x65

.field static final PROXIMITY_THRESHOLD:F = 5.0f

.field static VIDEO_VIEW_ACTIVITY:I = 0x0

.field static incomingCallerLabel:Ljava/lang/String; = null

.field static incomingCallerName:Ljava/lang/String; = null

.field static incomingCallerNumber:Ljava/lang/String; = null

.field static incomingCallerPhoto:Landroid/graphics/drawable/Drawable; = null

.field private static final mDisplayMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Character;",
            ">;"
        }
    .end annotation
.end field

.field private static final mToneMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Character;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static preventVolumeBarToDisplay:Z = false

.field private static final promptAcceptVideoId:I = 0x0

.field private static final promptInviteVideoId:I = 0x1

.field public static started:Z

.field private static theDialer:Lorg/linphone/InCallScreen;

.field static wl:Landroid/os/PowerManager$WakeLock;


# instance fields
.field final CONFERENCE_CALL_WAITING_TIME:I

.field final DIALOG_INCOMING:Ljava/lang/String;

.field final MSG_ANSWER:I

.field final MSG_ANSWER_SPEAKER:I

.field final MSG_BACK:I

.field final MSG_QUALITY_INDICATOR_UPDATE:I

.field final MSG_QUIT:I

.field final MSG_TICK:I

.field final MSG_UPDATE_CALL_CARD:I

.field final QUALITY_INDICATOR_INITIAL_DELAY:I

.field final QUALITY_INDICATOR_REFRESH_TIME:I

.field final SCREEN_OFF_TIMEOUT:I

.field private audioRoute:Landroid/widget/ToggleButton;

.field private clearCallButton:Landroid/widget/ImageButton;

.field private conferenceCallReferTo:Ljava/lang/String;

.field private dialButton:Landroid/widget/ToggleButton;

.field first:Z

.field holdCallCard:Lorg/linphone/CallCardHold;

.field private inCallButtons:Landroid/widget/LinearLayout;

.field inCallDtmfView:Landroid/view/View;

.field private isInConferenceCall:Z

.field private isPausing:Z

.field private isWaitingConferenceCall:Z

.field private lLinphoneCore:Lorg/linphone/core/LinphoneCore;

.field private mAudioManager:Landroid/media/AudioManager;

.field mCallCard:Lorg/linphone/CallCard;

.field mContext:Landroid/content/Context;

.field mDigits:Landroid/widget/EditText;

.field mHandler:Landroid/os/Handler;

.field mInCallPanel:Landroid/view/ViewGroup;

.field private mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

.field mMainFrame:Landroid/view/ViewGroup;

.field private mergeAddButton:Landroid/widget/ToggleButton;

.field private muteButton:Landroid/widget/ToggleButton;

.field oldtimeout:I

.field private pausingCalls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/linphone/core/LinphoneCall;",
            ">;"
        }
    .end annotation
.end field

.field pm:Landroid/os/PowerManager;

.field private promptRemoteCancelVideoToast:Z

.field proximitySensor:Landroid/hardware/Sensor;

.field qualityIndiTimer:Ljava/util/Timer;

.field private routeBluetooth:Landroid/widget/ImageView;

.field private routeReceiver:Landroid/widget/ImageView;

.field private routeSpeaker:Landroid/widget/ImageView;

.field running:Z

.field sensorManager:Landroid/hardware/SensorManager;

.field shouldUpdateQualityIndicator:Z

.field private speakerButton:Landroid/widget/ToggleButton;

.field private startVideoButton:Landroid/widget/ToggleButton;

.field private swapCallButton:Landroid/view/View;

.field t:Ljava/lang/Thread;

.field private timer:Landroid/os/CountDownTimer;

.field waitingConferenceCallTimer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 91
    sput-object v0, Lorg/linphone/InCallScreen;->incomingCallerName:Ljava/lang/String;

    .line 92
    sput-object v0, Lorg/linphone/InCallScreen;->incomingCallerLabel:Ljava/lang/String;

    .line 93
    sput-object v0, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    .line 94
    sput-object v0, Lorg/linphone/InCallScreen;->incomingCallerPhoto:Landroid/graphics/drawable/Drawable;

    .line 111
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/linphone/InCallScreen;->mToneMap:Ljava/util/HashMap;

    .line 113
    const/16 v0, 0x64

    sput v0, Lorg/linphone/InCallScreen;->VIDEO_VIEW_ACTIVITY:I

    .line 966
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/InCallScreen;->preventVolumeBarToDisplay:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/16 v2, 0x3e8

    const/4 v1, 0x0

    .line 74
    invoke-direct {p0}, Lorg/linphone/CallScreen;-><init>()V

    .line 76
    const/4 v0, 0x1

    iput v0, p0, Lorg/linphone/InCallScreen;->MSG_ANSWER:I

    .line 77
    const/4 v0, 0x2

    iput v0, p0, Lorg/linphone/InCallScreen;->MSG_ANSWER_SPEAKER:I

    .line 78
    const/4 v0, 0x3

    iput v0, p0, Lorg/linphone/InCallScreen;->MSG_BACK:I

    .line 79
    const/4 v0, 0x4

    iput v0, p0, Lorg/linphone/InCallScreen;->MSG_TICK:I

    .line 80
    const/4 v0, 0x5

    iput v0, p0, Lorg/linphone/InCallScreen;->MSG_QUIT:I

    .line 81
    const/4 v0, 0x6

    iput v0, p0, Lorg/linphone/InCallScreen;->MSG_QUALITY_INDICATOR_UPDATE:I

    .line 82
    const/4 v0, 0x7

    iput v0, p0, Lorg/linphone/InCallScreen;->MSG_UPDATE_CALL_CARD:I

    .line 84
    const/16 v0, 0x2ee0

    iput v0, p0, Lorg/linphone/InCallScreen;->SCREEN_OFF_TIMEOUT:I

    .line 86
    const-string/jumbo v0, "dialog_incoming"

    iput-object v0, p0, Lorg/linphone/InCallScreen;->DIALOG_INCOMING:Ljava/lang/String;

    .line 118
    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->promptRemoteCancelVideoToast:Z

    .line 119
    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->isPausing:Z

    .line 120
    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    .line 121
    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    .line 123
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/InCallScreen;->pausingCalls:Ljava/util/List;

    .line 124
    const-string/jumbo v0, "conference@pccwone.com"

    iput-object v0, p0, Lorg/linphone/InCallScreen;->conferenceCallReferTo:Ljava/lang/String;

    .line 126
    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->shouldUpdateQualityIndicator:Z

    .line 130
    iput v2, p0, Lorg/linphone/InCallScreen;->QUALITY_INDICATOR_REFRESH_TIME:I

    .line 131
    iput v2, p0, Lorg/linphone/InCallScreen;->QUALITY_INDICATOR_INITIAL_DELAY:I

    .line 132
    const/16 v0, 0x4e20

    iput v0, p0, Lorg/linphone/InCallScreen;->CONFERENCE_CALL_WAITING_TIME:I

    .line 209
    iput-object p0, p0, Lorg/linphone/InCallScreen;->mContext:Landroid/content/Context;

    .line 278
    new-instance v0, Lorg/linphone/InCallScreen$1;

    invoke-direct {v0, p0}, Lorg/linphone/InCallScreen$1;-><init>(Lorg/linphone/InCallScreen;)V

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private acceptCallUpdate(ZI)V
    .locals 5
    .param p1, "accept"    # Z
    .param p2, "id"    # I

    .prologue
    const/4 v4, 0x1

    .line 1638
    invoke-virtual {p0, p2}, Lorg/linphone/InCallScreen;->removeDialog(I)V

    .line 1639
    iget-object v3, p0, Lorg/linphone/InCallScreen;->timer:Landroid/os/CountDownTimer;

    if-eqz v3, :cond_0

    .line 1640
    iget-object v3, p0, Lorg/linphone/InCallScreen;->timer:Landroid/os/CountDownTimer;

    invoke-virtual {v3}, Landroid/os/CountDownTimer;->cancel()V

    .line 1643
    :cond_0
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v3

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 1644
    .local v0, "call":Lorg/linphone/core/LinphoneCall;
    if-nez v0, :cond_1

    .line 1662
    :goto_0
    return-void

    .line 1647
    :cond_1
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v2

    .line 1648
    .local v2, "params":Lorg/linphone/core/LinphoneCallParams;
    if-eqz p1, :cond_2

    .line 1649
    invoke-interface {v2, v4}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 1650
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v3

    invoke-interface {v3, v4, v4}, Lorg/linphone/core/LinphoneCore;->enableVideo(ZZ)V

    .line 1656
    :cond_2
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v3

    invoke-interface {v3, v0, v2}, Lorg/linphone/core/LinphoneCore;->acceptCallUpdate(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)V
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1657
    :catch_0
    move-exception v1

    .line 1658
    .local v1, "e":Lorg/linphone/core/LinphoneCoreException;
    invoke-virtual {v1}, Lorg/linphone/core/LinphoneCoreException;->printStackTrace()V

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/linphone/InCallScreen;F)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/InCallScreen;
    .param p1, "x1"    # F

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lorg/linphone/InCallScreen;->updateQualityIndicator(F)V

    return-void
.end method

.method static synthetic access$100(Lorg/linphone/InCallScreen;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->setupCallCard()V

    return-void
.end method

.method static synthetic access$1000(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/linphone/InCallScreen;->speakerButton:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method static synthetic access$1100(Lorg/linphone/InCallScreen;)Landroid/media/AudioManager;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$1200(Lorg/linphone/InCallScreen;ZI)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/InCallScreen;
    .param p1, "x1"    # Z
    .param p2, "x2"    # I

    .prologue
    .line 74
    invoke-direct {p0, p1, p2}, Lorg/linphone/InCallScreen;->acceptCallUpdate(ZI)V

    return-void
.end method

.method static synthetic access$1300(Lorg/linphone/InCallScreen;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->inviteVideo()V

    return-void
.end method

.method static synthetic access$1400(Lorg/linphone/InCallScreen;)Z
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-boolean v0, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    return v0
.end method

.method static synthetic access$1500(Lorg/linphone/InCallScreen;)Lorg/linphone/core/LinphoneCore;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    return-object v0
.end method

.method static synthetic access$200(Lorg/linphone/InCallScreen;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$300(Lorg/linphone/InCallScreen;)Lcom/pccw/android/common/widget/SlidingTab;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    return-object v0
.end method

.method static synthetic access$400(Lorg/linphone/InCallScreen;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->routeAudioToBluetooth()V

    return-void
.end method

.method static synthetic access$500(Lorg/linphone/InCallScreen;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->routeAudioToSpeaker()V

    return-void
.end method

.method static synthetic access$600(Lorg/linphone/InCallScreen;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->routeAudioToReceiver()V

    return-void
.end method

.method static synthetic access$700(Lorg/linphone/InCallScreen;)Landroid/os/CountDownTimer;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/linphone/InCallScreen;->timer:Landroid/os/CountDownTimer;

    return-object v0
.end method

.method static synthetic access$702(Lorg/linphone/InCallScreen;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/InCallScreen;
    .param p1, "x1"    # Landroid/os/CountDownTimer;

    .prologue
    .line 74
    iput-object p1, p0, Lorg/linphone/InCallScreen;->timer:Landroid/os/CountDownTimer;

    return-object p1
.end method

.method static synthetic access$800(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method static synthetic access$900(Lorg/linphone/InCallScreen;)Landroid/widget/ToggleButton;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/InCallScreen;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    return-object v0
.end method

.method private closeIncomingDialog()V
    .locals 4

    .prologue
    .line 1898
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, "dialog_incoming"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    .line 1899
    .local v1, "prev":Landroid/support/v4/app/Fragment;
    if-eqz v1, :cond_0

    instance-of v2, v1, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    if-eqz v2, :cond_0

    move-object v0, v1

    .line 1900
    check-cast v0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    .line 1901
    .local v0, "df":Lorg/linphone/InCallScreen$IncomingCallDialogFragment;
    invoke-virtual {v0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->dismissAllowingStateLoss()V

    .line 1903
    .end local v0    # "df":Lorg/linphone/InCallScreen$IncomingCallDialogFragment;
    :cond_0
    return-void
.end method

.method private configureMuteButtons()V
    .locals 2

    .prologue
    .line 1552
    iget-object v0, p0, Lorg/linphone/InCallScreen;->muteButton:Landroid/widget/ToggleButton;

    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->isMicMuted()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 1562
    return-void
.end method

.method private configureQualityIndicator(Lorg/linphone/core/LinphoneCall;)V
    .locals 6
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    const-wide/16 v2, 0x3e8

    .line 1300
    iget-object v0, p0, Lorg/linphone/InCallScreen;->qualityIndiTimer:Ljava/util/Timer;

    new-instance v1, Lorg/linphone/InCallScreen$10;

    invoke-direct {v1, p0, p1}, Lorg/linphone/InCallScreen$10;-><init>(Lorg/linphone/InCallScreen;Lorg/linphone/core/LinphoneCall;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 1321
    return-void
.end method

.method private configureSpeakerButtons()V
    .locals 4

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 1565
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-gt v0, v3, :cond_0

    iget-object v0, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    .line 1566
    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getRouting(I)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    :cond_0
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    .line 1567
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-le v0, v3, :cond_2

    iget-object v0, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1568
    :cond_1
    iget-object v0, p0, Lorg/linphone/InCallScreen;->speakerButton:Landroid/widget/ToggleButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 1572
    :goto_0
    return-void

    .line 1570
    :cond_2
    iget-object v0, p0, Lorg/linphone/InCallScreen;->speakerButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, v2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    goto :goto_0
.end method

.method private enterIncalMode(Lorg/linphone/core/LinphoneCore;)V
    .locals 3
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 1503
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_0

    const/4 v0, 0x3

    .line 1504
    :goto_0
    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->setMode(I)V

    .line 1506
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->startBluetoothSco()V

    .line 1520
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->setVolumeControlStream(I)V

    .line 1521
    invoke-static {}, Lorg/linphone/LinphoneActivity;->instance()Lorg/linphone/LinphoneActivity;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneActivity;->startProxymitySensor()V

    .line 1524
    return-void

    .line 1503
    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method

.method private exitCallMode()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1534
    const/high16 v0, -0x80000000

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->setVolumeControlStream(I)V

    .line 1540
    iget-object v0, p0, Lorg/linphone/InCallScreen;->speakerButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 1541
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->routeAudioToReceiver()V

    .line 1542
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->stopBluetoothSco()V

    .line 1543
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    .line 1546
    invoke-static {}, Lorg/linphone/BandwidthManager;->getInstance()Lorg/linphone/BandwidthManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/linphone/BandwidthManager;->setUserRestriction(Z)V

    .line 1548
    invoke-static {}, Lorg/linphone/LinphoneActivity;->instance()Lorg/linphone/LinphoneActivity;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneActivity;->stopProxymitySensor()V

    .line 1549
    return-void
.end method

.method public static getDialer()Lorg/linphone/InCallScreen;
    .locals 1

    .prologue
    .line 1049
    sget-object v0, Lorg/linphone/InCallScreen;->theDialer:Lorg/linphone/InCallScreen;

    if-nez v0, :cond_0

    .line 1050
    const/4 v0, 0x0

    .line 1052
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/linphone/InCallScreen;->theDialer:Lorg/linphone/InCallScreen;

    goto :goto_0
.end method

.method private handleIncomingCallWaiting(Lorg/linphone/core/LinphoneCall;)V
    .locals 7
    .param p1, "incomingCall"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 1718
    iget-boolean v6, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-nez v6, :cond_0

    iget-boolean v6, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-eqz v6, :cond_1

    .line 1721
    :cond_0
    iget-object v6, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v6, p1}, Lorg/linphone/core/LinphoneCore;->terminateCall(Lorg/linphone/core/LinphoneCall;)V

    .line 1753
    :goto_0
    return-void

    .line 1726
    :cond_1
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    invoke-virtual {v6, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v5

    .line 1728
    .local v5, "number":Ljava/lang/String;
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/pccw/mobile/sip/service/MobileSipService;->getDisplayNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1731
    .local v3, "displayNumber":Ljava/lang/String;
    const-string/jumbo v2, ""

    .line 1732
    .local v2, "displayName":Ljava/lang/String;
    const-string/jumbo v1, ""

    .line 1733
    .local v1, "displayLabel":Ljava/lang/String;
    const/4 v4, 0x0

    .line 1735
    .local v4, "displayPhoto":Landroid/graphics/drawable/Drawable;
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v6

    invoke-virtual {v6}, Lorg/linphone/KingKingLinphoneUtil;->getContact()Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v0

    .line 1737
    .local v0, "c":Lcom/pccw/mobile/sip/util/Contact;
    if-nez v0, :cond_2

    .line 1738
    invoke-static {}, Lcom/pccw/mobile/sip/util/ContactsUtils;->getInstance()Lcom/pccw/mobile/sip/util/ContactsUtils;

    move-result-object v6

    invoke-virtual {v6, p0, v5}, Lcom/pccw/mobile/sip/util/ContactsUtils;->queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v0

    .line 1739
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v6

    invoke-virtual {v6, v0}, Lorg/linphone/KingKingLinphoneUtil;->setContact(Lcom/pccw/mobile/sip/util/Contact;)V

    .line 1742
    :cond_2
    if-eqz v0, :cond_3

    .line 1743
    iget-object v2, v0, Lcom/pccw/mobile/sip/util/Contact;->displayName:Ljava/lang/String;

    .line 1744
    iget-object v1, v0, Lcom/pccw/mobile/sip/util/Contact;->label:Ljava/lang/String;

    .line 1745
    iget-object v4, v0, Lcom/pccw/mobile/sip/util/Contact;->photo:Landroid/graphics/drawable/Drawable;

    .line 1748
    :cond_3
    sput-object v2, Lorg/linphone/InCallScreen;->incomingCallerName:Ljava/lang/String;

    .line 1749
    sput-object v1, Lorg/linphone/InCallScreen;->incomingCallerLabel:Ljava/lang/String;

    .line 1750
    sput-object v3, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    .line 1751
    sput-object v4, Lorg/linphone/InCallScreen;->incomingCallerPhoto:Landroid/graphics/drawable/Drawable;

    .line 1752
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->showIncomingDialog()V

    goto :goto_0
.end method

.method private inviteConferenceCall()V
    .locals 4

    .prologue
    .line 1834
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    .line 1837
    :try_start_0
    iget-object v1, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const-string/jumbo v2, "conference@pccwone.com"

    invoke-interface {v1, v2}, Lorg/linphone/core/LinphoneCore;->invite(Ljava/lang/String;)Lorg/linphone/core/LinphoneCall;
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1842
    :goto_0
    return-void

    .line 1838
    :catch_0
    move-exception v0

    .line 1839
    .local v0, "e":Lorg/linphone/core/LinphoneCoreException;
    const-string/jumbo v1, "PCCW_MOBILE_SIP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "invite conference call exception="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lorg/linphone/core/LinphoneCoreException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1840
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    goto :goto_0
.end method

.method private inviteVideo()V
    .locals 3

    .prologue
    const/16 v2, 0x64

    .line 738
    iget-object v1, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 739
    .local v0, "vCall":Lorg/linphone/core/LinphoneCall;
    if-eqz v0, :cond_0

    .line 740
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->cameraEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 742
    invoke-direct {p0, v2}, Lorg/linphone/InCallScreen;->startVideoView(I)V

    .line 749
    :cond_0
    :goto_0
    return-void

    .line 743
    :cond_1
    invoke-static {}, Lorg/linphone/CallManager;->getInstance()Lorg/linphone/CallManager;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/CallManager;->addVideo()Z

    move-result v1

    if-nez v1, :cond_2

    .line 744
    invoke-direct {p0, v2}, Lorg/linphone/InCallScreen;->startVideoView(I)V

    goto :goto_0

    .line 746
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->promptRemoteCancelVideoToast:Z

    goto :goto_0
.end method

.method private pauseOrResumeOrSwapCall()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1779
    iget-boolean v0, p0, Lorg/linphone/InCallScreen;->isPausing:Z

    if-eqz v0, :cond_1

    .line 1792
    :cond_0
    :goto_0
    return-void

    .line 1782
    :cond_1
    iput-boolean v2, p0, Lorg/linphone/InCallScreen;->isPausing:Z

    .line 1783
    iget-object v0, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v0

    if-eqz v0, :cond_0

    .line 1786
    iget-object v0, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v0

    if-ne v0, v2, :cond_2

    .line 1787
    iget-object v0, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->pauseOrResumeCall(Lorg/linphone/core/LinphoneCall;)V

    .line 1791
    :goto_1
    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->isPausing:Z

    goto :goto_0

    .line 1789
    :cond_2
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->swapPausedCall()V

    goto :goto_1
.end method

.method private refreshMergeAddButton()V
    .locals 10

    .prologue
    const v9, 0x7f0b0017

    const/4 v8, 0x1

    const v7, 0x7f07017c

    const v6, 0x7f070174

    const/4 v5, 0x0

    .line 781
    iget-object v1, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v2, 0x4

    new-array v2, v2, [Lorg/linphone/core/LinphoneCall$State;

    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    aput-object v3, v2, v5

    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    aput-object v3, v2, v8

    const/4 v3, 0x2

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    aput-object v4, v2, v3

    const/4 v3, 0x3

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    aput-object v4, v2, v3

    .line 782
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v0

    .line 787
    .local v0, "outgoingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v5}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 789
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 790
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v5}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 791
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextColor(I)V

    .line 792
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    const v2, 0x7f020428

    invoke-virtual {v1, v5, v2, v5, v5}, Landroid/widget/ToggleButton;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 793
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v6}, Landroid/widget/ToggleButton;->setText(I)V

    .line 794
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v6}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 795
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v6}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    .line 829
    :goto_0
    return-void

    .line 796
    :cond_0
    iget-boolean v1, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-eqz v1, :cond_2

    .line 798
    :cond_1
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v5}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 799
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextColor(I)V

    .line 800
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    const v2, 0x7f02043d

    invoke-virtual {v1, v5, v2, v5, v5}, Landroid/widget/ToggleButton;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 801
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v7}, Landroid/widget/ToggleButton;->setText(I)V

    .line 802
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v7}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 803
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v7}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 804
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 806
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v5}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 807
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextColor(I)V

    .line 808
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    const v2, 0x7f020428

    invoke-virtual {v1, v5, v2, v5, v5}, Landroid/widget/ToggleButton;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 809
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v6}, Landroid/widget/ToggleButton;->setText(I)V

    .line 810
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v6}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 811
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v6}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 812
    :cond_3
    iget-object v1, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v1

    if-gt v1, v8, :cond_4

    .line 814
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v8}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 815
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0016

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextColor(I)V

    .line 816
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    const v2, 0x7f020427

    invoke-virtual {v1, v5, v2, v5, v5}, Landroid/widget/ToggleButton;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 817
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v6}, Landroid/widget/ToggleButton;->setText(I)V

    .line 818
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v6}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 819
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v6}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 822
    :cond_4
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v8}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 823
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0016

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextColor(I)V

    .line 824
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    const v2, 0x7f02043c

    invoke-virtual {v1, v5, v2, v5, v5}, Landroid/widget/ToggleButton;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 825
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v7}, Landroid/widget/ToggleButton;->setText(I)V

    .line 826
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v7}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 827
    iget-object v1, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {p0, v7}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method

.method private routeAudioToBluetooth()V
    .locals 1

    .prologue
    .line 768
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->routeAudioToBluetooth()Z

    .line 769
    return-void
.end method

.method private routeAudioToReceiver()V
    .locals 1

    .prologue
    .line 777
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->routeAudioToReceiver()V

    .line 778
    return-void
.end method

.method private routeAudioToSpeaker()V
    .locals 1

    .prologue
    .line 772
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->routeAudioToSpeaker()V

    .line 774
    return-void
.end method

.method private setupCallCard()V
    .locals 12

    .prologue
    .line 1327
    iget-object v8, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v8}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v8

    if-nez v8, :cond_0

    .line 1455
    :goto_0
    return-void

    .line 1330
    :cond_0
    iget-object v8, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v8}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v2

    .line 1331
    .local v2, "mainCall":Lorg/linphone/core/LinphoneCall;
    const/4 v4, 0x0

    .line 1333
    .local v4, "onHoldCall":Lorg/linphone/core/LinphoneCall;
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->refreshMergeAddButton()V

    .line 1335
    iget-object v8, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v9, 0x4

    new-array v9, v9, [Lorg/linphone/core/LinphoneCall$State;

    const/4 v10, 0x0

    sget-object v11, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    sget-object v11, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    sget-object v11, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    aput-object v11, v9, v10

    const/4 v10, 0x3

    sget-object v11, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    aput-object v11, v9, v10

    .line 1336
    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-static {v8, v9}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v5

    .line 1341
    .local v5, "outgoingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    iget-boolean v8, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-nez v8, :cond_1

    iget-boolean v8, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-eqz v8, :cond_6

    .line 1344
    :cond_1
    iget-object v8, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v8}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v9

    array-length v10, v9

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v10, :cond_2

    aget-object v1, v9, v8

    .line 1345
    .local v1, "call":Lorg/linphone/core/LinphoneCall;
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v11

    invoke-virtual {v11, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v3

    .line 1346
    .local v3, "number":Ljava/lang/String;
    const-string/jumbo v11, "-3"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 1347
    move-object v2, v1

    .line 1377
    .end local v1    # "call":Lorg/linphone/core/LinphoneCall;
    .end local v3    # "number":Ljava/lang/String;
    :cond_2
    :goto_2
    if-nez v4, :cond_e

    .line 1379
    if-eqz v2, :cond_4

    .line 1380
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v8

    invoke-virtual {v8, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v3

    .line 1381
    .restart local v3    # "number":Ljava/lang/String;
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v8

    invoke-virtual {v8}, Lorg/linphone/KingKingLinphoneUtil;->getContact()Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v0

    .line 1384
    .local v0, "c":Lcom/pccw/mobile/sip/util/Contact;
    iget-object v8, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    iget-object v8, v8, Lorg/linphone/CallCard;->mPhoneNumber:Landroid/widget/TextView;

    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1385
    if-nez v0, :cond_3

    .line 1386
    invoke-static {}, Lcom/pccw/mobile/sip/util/ContactsUtils;->getInstance()Lcom/pccw/mobile/sip/util/ContactsUtils;

    move-result-object v8

    invoke-virtual {v8, p0, v3}, Lcom/pccw/mobile/sip/util/ContactsUtils;->queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v0

    .line 1387
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v8

    invoke-virtual {v8, v0}, Lorg/linphone/KingKingLinphoneUtil;->setContact(Lcom/pccw/mobile/sip/util/Contact;)V

    .line 1391
    :cond_3
    iget-object v11, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    if-nez v0, :cond_b

    const/4 v8, 0x0

    move-object v10, v8

    :goto_3
    if-nez v0, :cond_c

    const/4 v8, 0x0

    move-object v9, v8

    :goto_4
    if-nez v0, :cond_d

    const/4 v8, 0x0

    :goto_5
    invoke-virtual {v11, v3, v10, v9, v8}, Lorg/linphone/CallCard;->updateCallCardInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 1393
    iget-object v8, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v9

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getDuration()I

    move-result v10

    const/4 v11, 0x1

    invoke-virtual {v8, v9, v10, v11}, Lorg/linphone/CallCard;->displayMainCallStatus(Lorg/linphone/core/LinphoneCall$State;IZ)V

    .line 1395
    .end local v0    # "c":Lcom/pccw/mobile/sip/util/Contact;
    .end local v3    # "number":Ljava/lang/String;
    :cond_4
    iget-object v8, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    invoke-virtual {v8}, Lorg/linphone/CallCard;->displayMainCallLayout()V

    .line 1396
    iget-object v8, p0, Lorg/linphone/InCallScreen;->swapCallButton:Landroid/view/View;

    const/16 v9, 0x8

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    .line 1397
    iget-object v8, p0, Lorg/linphone/InCallScreen;->holdCallCard:Lorg/linphone/CallCardHold;

    invoke-virtual {v8}, Lorg/linphone/CallCardHold;->displayMainCallLayout()V

    goto/16 :goto_0

    .line 1344
    .restart local v1    # "call":Lorg/linphone/core/LinphoneCall;
    .restart local v3    # "number":Ljava/lang/String;
    :cond_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 1351
    .end local v1    # "call":Lorg/linphone/core/LinphoneCall;
    .end local v3    # "number":Ljava/lang/String;
    :cond_6
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_7

    .line 1352
    const/4 v8, 0x0

    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "mainCall":Lorg/linphone/core/LinphoneCall;
    check-cast v2, Lorg/linphone/core/LinphoneCall;

    .restart local v2    # "mainCall":Lorg/linphone/core/LinphoneCall;
    goto :goto_2

    .line 1355
    :cond_7
    if-nez v2, :cond_8

    .line 1356
    iget-object v8, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v9, 0x1

    new-array v9, v9, [Lorg/linphone/core/LinphoneCall$State;

    const/4 v10, 0x0

    sget-object v11, Lorg/linphone/core/LinphoneCall$State;->Resuming:Lorg/linphone/core/LinphoneCall$State;

    aput-object v11, v9, v10

    .line 1357
    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    .line 1356
    invoke-static {v8, v9}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v7

    .line 1358
    .local v7, "resumeCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_a

    .line 1359
    const/4 v8, 0x0

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "mainCall":Lorg/linphone/core/LinphoneCall;
    check-cast v2, Lorg/linphone/core/LinphoneCall;

    .line 1365
    .end local v7    # "resumeCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    .restart local v2    # "mainCall":Lorg/linphone/core/LinphoneCall;
    :cond_8
    :goto_6
    iget-object v8, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v8}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_2

    .line 1366
    iget-object v8, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v9, 0x3

    new-array v9, v9, [Lorg/linphone/core/LinphoneCall$State;

    const/4 v10, 0x0

    sget-object v11, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    aput-object v11, v9, v10

    const/4 v10, 0x1

    sget-object v11, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    sget-object v11, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    aput-object v11, v9, v10

    .line 1367
    invoke-static {v9}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    .line 1366
    invoke-static {v8, v9}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v6

    .line 1368
    .local v6, "pausedCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_9
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/linphone/core/LinphoneCall;

    .line 1369
    .restart local v1    # "call":Lorg/linphone/core/LinphoneCall;
    if-eq v1, v2, :cond_9

    .line 1370
    move-object v4, v1

    .line 1371
    goto/16 :goto_2

    .line 1361
    .end local v1    # "call":Lorg/linphone/core/LinphoneCall;
    .end local v6    # "pausedCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    .restart local v7    # "resumeCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    :cond_a
    iget-object v8, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v8}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v8

    const/4 v9, 0x0

    aget-object v2, v8, v9

    goto :goto_6

    .line 1391
    .end local v7    # "resumeCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    .restart local v0    # "c":Lcom/pccw/mobile/sip/util/Contact;
    .restart local v3    # "number":Ljava/lang/String;
    :cond_b
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->displayName:Ljava/lang/String;

    move-object v10, v8

    goto/16 :goto_3

    :cond_c
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->label:Ljava/lang/String;

    move-object v9, v8

    goto/16 :goto_4

    :cond_d
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->photo:Landroid/graphics/drawable/Drawable;

    goto/16 :goto_5

    .line 1416
    .end local v0    # "c":Lcom/pccw/mobile/sip/util/Contact;
    .end local v3    # "number":Ljava/lang/String;
    :cond_e
    if-eqz v2, :cond_10

    .line 1417
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v8

    invoke-virtual {v8, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v3

    .line 1418
    .restart local v3    # "number":Ljava/lang/String;
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v8

    invoke-virtual {v8}, Lorg/linphone/KingKingLinphoneUtil;->getContact()Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v0

    .line 1421
    .restart local v0    # "c":Lcom/pccw/mobile/sip/util/Contact;
    iget-object v8, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    iget-object v8, v8, Lorg/linphone/CallCard;->mPhoneNumberCallWaitingMain:Landroid/widget/TextView;

    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1422
    if-nez v0, :cond_f

    .line 1423
    invoke-static {}, Lcom/pccw/mobile/sip/util/ContactsUtils;->getInstance()Lcom/pccw/mobile/sip/util/ContactsUtils;

    move-result-object v8

    invoke-virtual {v8, p0, v3}, Lcom/pccw/mobile/sip/util/ContactsUtils;->queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v0

    .line 1424
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v8

    invoke-virtual {v8, v0}, Lorg/linphone/KingKingLinphoneUtil;->setContact(Lcom/pccw/mobile/sip/util/Contact;)V

    .line 1428
    :cond_f
    iget-object v11, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    if-nez v0, :cond_13

    const/4 v8, 0x0

    move-object v10, v8

    :goto_7
    if-nez v0, :cond_14

    const/4 v8, 0x0

    move-object v9, v8

    :goto_8
    if-nez v0, :cond_15

    const/4 v8, 0x0

    :goto_9
    invoke-virtual {v11, v3, v10, v9, v8}, Lorg/linphone/CallCard;->updateCallWaitingMainCallCardInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 1430
    iget-object v8, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v9

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getDuration()I

    move-result v10

    const/4 v11, 0x0

    invoke-virtual {v8, v9, v10, v11}, Lorg/linphone/CallCard;->displayMainCallStatus(Lorg/linphone/core/LinphoneCall$State;IZ)V

    .line 1433
    .end local v0    # "c":Lcom/pccw/mobile/sip/util/Contact;
    .end local v3    # "number":Ljava/lang/String;
    :cond_10
    if-eqz v4, :cond_12

    .line 1434
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v8

    invoke-virtual {v8, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v3

    .line 1435
    .restart local v3    # "number":Ljava/lang/String;
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v8

    invoke-virtual {v8}, Lorg/linphone/KingKingLinphoneUtil;->getContact()Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v0

    .line 1438
    .restart local v0    # "c":Lcom/pccw/mobile/sip/util/Contact;
    iget-object v8, p0, Lorg/linphone/InCallScreen;->holdCallCard:Lorg/linphone/CallCardHold;

    iget-object v8, v8, Lorg/linphone/CallCardHold;->mPhoneNumberCallWaitingOnHold:Landroid/widget/TextView;

    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1439
    if-nez v0, :cond_11

    .line 1440
    invoke-static {}, Lcom/pccw/mobile/sip/util/ContactsUtils;->getInstance()Lcom/pccw/mobile/sip/util/ContactsUtils;

    move-result-object v8

    invoke-virtual {v8, p0, v3}, Lcom/pccw/mobile/sip/util/ContactsUtils;->queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v0

    .line 1441
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v8

    invoke-virtual {v8, v0}, Lorg/linphone/KingKingLinphoneUtil;->setContact(Lcom/pccw/mobile/sip/util/Contact;)V

    .line 1444
    :cond_11
    iget-object v11, p0, Lorg/linphone/InCallScreen;->holdCallCard:Lorg/linphone/CallCardHold;

    if-nez v0, :cond_16

    const/4 v8, 0x0

    move-object v10, v8

    :goto_a
    if-nez v0, :cond_17

    const/4 v8, 0x0

    move-object v9, v8

    :goto_b
    if-nez v0, :cond_18

    const/4 v8, 0x0

    :goto_c
    invoke-virtual {v11, v3, v10, v9, v8}, Lorg/linphone/CallCardHold;->updateCallWaitingOnHoldCallCardInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 1446
    iget-object v8, p0, Lorg/linphone/InCallScreen;->holdCallCard:Lorg/linphone/CallCardHold;

    invoke-interface {v4}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v9

    invoke-interface {v4}, Lorg/linphone/core/LinphoneCall;->getDuration()I

    move-result v10

    invoke-virtual {v8, v9, v10}, Lorg/linphone/CallCardHold;->displayCallWaitingHoldCallStatus(Lorg/linphone/core/LinphoneCall$State;I)V

    .line 1448
    .end local v0    # "c":Lcom/pccw/mobile/sip/util/Contact;
    .end local v3    # "number":Ljava/lang/String;
    :cond_12
    iget-object v8, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    invoke-virtual {v8}, Lorg/linphone/CallCard;->displayCallWaitingLayout()V

    .line 1449
    iget-object v8, p0, Lorg/linphone/InCallScreen;->swapCallButton:Landroid/view/View;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Landroid/view/View;->setVisibility(I)V

    .line 1450
    iget-object v8, p0, Lorg/linphone/InCallScreen;->holdCallCard:Lorg/linphone/CallCardHold;

    invoke-virtual {v8}, Lorg/linphone/CallCardHold;->displayCallWaitingLayout()V

    goto/16 :goto_0

    .line 1428
    .restart local v0    # "c":Lcom/pccw/mobile/sip/util/Contact;
    .restart local v3    # "number":Ljava/lang/String;
    :cond_13
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->displayName:Ljava/lang/String;

    move-object v10, v8

    goto :goto_7

    :cond_14
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->label:Ljava/lang/String;

    move-object v9, v8

    goto :goto_8

    :cond_15
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->photo:Landroid/graphics/drawable/Drawable;

    goto :goto_9

    .line 1444
    :cond_16
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->displayName:Ljava/lang/String;

    move-object v10, v8

    goto :goto_a

    :cond_17
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->label:Ljava/lang/String;

    move-object v9, v8

    goto :goto_b

    :cond_18
    iget-object v8, v0, Lcom/pccw/mobile/sip/util/Contact;->photo:Landroid/graphics/drawable/Drawable;

    goto :goto_c
.end method

.method private showIncomingDialog()V
    .locals 6

    .prologue
    .line 1762
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 1763
    .local v1, "ft":Landroid/support/v4/app/FragmentTransaction;
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    const-string/jumbo v5, "dialog_incoming"

    invoke-virtual {v4, v5}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v3

    .line 1764
    .local v3, "prev":Landroid/support/v4/app/Fragment;
    if-eqz v3, :cond_0

    instance-of v4, v3, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    if-eqz v4, :cond_0

    move-object v0, v3

    .line 1765
    check-cast v0, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    .line 1766
    .local v0, "df":Lorg/linphone/InCallScreen$IncomingCallDialogFragment;
    invoke-virtual {v0}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->dismissAllowingStateLoss()V

    .line 1770
    .end local v0    # "df":Lorg/linphone/InCallScreen$IncomingCallDialogFragment;
    :cond_0
    sget-object v4, Lorg/linphone/InCallScreen;->incomingCallerName:Ljava/lang/String;

    if-eqz v4, :cond_1

    sget-object v4, Lorg/linphone/InCallScreen;->incomingCallerNumber:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 1771
    invoke-static {}, Lorg/linphone/InCallScreen$IncomingCallDialogFragment;->newInstance()Lorg/linphone/InCallScreen$IncomingCallDialogFragment;

    move-result-object v2

    .line 1772
    .local v2, "newFragment":Landroid/support/v4/app/DialogFragment;
    const-string/jumbo v4, "dialog_incoming"

    invoke-virtual {v2, v1, v4}, Landroid/support/v4/app/DialogFragment;->show(Landroid/support/v4/app/FragmentTransaction;Ljava/lang/String;)I

    .line 1774
    .end local v2    # "newFragment":Landroid/support/v4/app/DialogFragment;
    :cond_1
    return-void
.end method

.method private startConferenceCall(Lorg/linphone/core/LinphoneCall;)V
    .locals 7
    .param p1, "conferenceCall"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    const/4 v2, 0x0

    .line 1848
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/linphone/InCallScreen;->pausingCalls:Ljava/util/List;

    .line 1849
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    .line 1850
    const-string/jumbo v1, "conference@pccwone.com"

    iput-object v1, p0, Lorg/linphone/InCallScreen;->conferenceCallReferTo:Ljava/lang/String;

    .line 1851
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteContact()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1852
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteContact()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v3, "conference@"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1853
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteContact()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/linphone/InCallScreen;->conferenceCallReferTo:Ljava/lang/String;

    .line 1858
    :cond_0
    iget-object v1, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v3

    array-length v4, v3

    move v1, v2

    :goto_0
    if-ge v1, v4, :cond_3

    aget-object v0, v3, v1

    .line 1859
    .local v0, "call":Lorg/linphone/core/LinphoneCall;
    if-eqz v0, :cond_1

    if-eq v0, p1, :cond_1

    .line 1860
    sget-object v5, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v6

    if-ne v5, v6, :cond_2

    .line 1861
    iget-object v5, p0, Lorg/linphone/InCallScreen;->pausingCalls:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1858
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1867
    :cond_2
    iget-object v5, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    iget-object v6, p0, Lorg/linphone/InCallScreen;->conferenceCallReferTo:Ljava/lang/String;

    invoke-interface {v5, v0, v6}, Lorg/linphone/core/LinphoneCore;->transferCall(Lorg/linphone/core/LinphoneCall;Ljava/lang/String;)V

    goto :goto_1

    .line 1871
    .end local v0    # "call":Lorg/linphone/core/LinphoneCall;
    :cond_3
    iget-object v1, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1872
    iget-object v1, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setClickable(Z)V

    .line 1874
    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    iput-object v1, p0, Lorg/linphone/InCallScreen;->waitingConferenceCallTimer:Ljava/util/Timer;

    .line 1875
    iget-object v1, p0, Lorg/linphone/InCallScreen;->waitingConferenceCallTimer:Ljava/util/Timer;

    new-instance v2, Lorg/linphone/InCallScreen$15;

    invoke-direct {v2, p0}, Lorg/linphone/InCallScreen$15;-><init>(Lorg/linphone/InCallScreen;)V

    const-wide/16 v4, 0x4e20

    invoke-virtual {v1, v2, v4, v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 1892
    return-void
.end method

.method private startVideoView(I)V
    .locals 4
    .param p1, "requestCode"    # I

    .prologue
    .line 753
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/InCallScreen$8;

    invoke-direct {v1, p0}, Lorg/linphone/InCallScreen$8;-><init>(Lorg/linphone/InCallScreen;)V

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 765
    return-void
.end method

.method private updateQualityIndicator(F)V
    .locals 1
    .param p1, "score"    # F

    .prologue
    .line 1290
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    invoke-virtual {v0, p1}, Lorg/linphone/CallCard;->updateQualityIndiImage(F)V

    .line 1291
    return-void
.end method


# virtual methods
.method public answer()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 900
    const/4 v1, 0x0

    .line 901
    .local v1, "incomingCall":Lorg/linphone/core/LinphoneCall;
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v4, 0x1

    new-array v4, v4, [Lorg/linphone/core/LinphoneCall$State;

    sget-object v5, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    aput-object v5, v4, v6

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v2

    .line 902
    .local v2, "incomingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 903
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "incomingCall":Lorg/linphone/core/LinphoneCall;
    check-cast v1, Lorg/linphone/core/LinphoneCall;

    .line 906
    .restart local v1    # "incomingCall":Lorg/linphone/core/LinphoneCall;
    :cond_0
    if-eqz v1, :cond_1

    .line 908
    :try_start_0
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3, v1}, Lorg/linphone/core/LinphoneCore;->acceptCall(Lorg/linphone/core/LinphoneCall;)V

    .line 910
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->setupCallCard()V
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 918
    :cond_1
    :goto_0
    return-void

    .line 912
    :catch_0
    move-exception v0

    .line 914
    .local v0, "e":Lorg/linphone/core/LinphoneCoreException;
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    sget-object v4, Lorg/linphone/core/Reason;->Busy:Lorg/linphone/core/Reason;

    invoke-interface {v3, v1, v4}, Lorg/linphone/core/LinphoneCore;->declineCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/Reason;)V

    goto :goto_0
.end method

.method public answerAndEndCall()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 921
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v4}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 922
    .local v0, "currentCall":Lorg/linphone/core/LinphoneCall;
    const/4 v2, 0x0

    .line 923
    .local v2, "incomingCall":Lorg/linphone/core/LinphoneCall;
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v5, 0x1

    new-array v5, v5, [Lorg/linphone/core/LinphoneCall$State;

    sget-object v6, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    aput-object v6, v5, v7

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v3

    .line 924
    .local v3, "incomingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 925
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "incomingCall":Lorg/linphone/core/LinphoneCall;
    check-cast v2, Lorg/linphone/core/LinphoneCall;

    .line 928
    .restart local v2    # "incomingCall":Lorg/linphone/core/LinphoneCall;
    :cond_0
    if-eqz v2, :cond_1

    .line 930
    :try_start_0
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v4, v2}, Lorg/linphone/core/LinphoneCore;->acceptCall(Lorg/linphone/core/LinphoneCall;)V

    .line 931
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->setupCallCard()V
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 937
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    if-eq v0, v2, :cond_2

    .line 938
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v4, v0}, Lorg/linphone/core/LinphoneCore;->terminateCall(Lorg/linphone/core/LinphoneCall;)V

    .line 941
    :cond_2
    return-void

    .line 932
    :catch_0
    move-exception v1

    .line 934
    .local v1, "e":Lorg/linphone/core/LinphoneCoreException;
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    sget-object v5, Lorg/linphone/core/Reason;->Busy:Lorg/linphone/core/Reason;

    invoke-interface {v4, v2, v5}, Lorg/linphone/core/LinphoneCore;->declineCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/Reason;)V

    goto :goto_0
.end method

.method public answerWithVideo()V
    .locals 8

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 944
    const/4 v1, 0x0

    .line 946
    .local v1, "incomingCall":Lorg/linphone/core/LinphoneCall;
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    new-array v5, v5, [Lorg/linphone/core/LinphoneCall$State;

    sget-object v6, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    aput-object v6, v5, v7

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v2

    .line 947
    .local v2, "incomingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_0

    .line 948
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "incomingCall":Lorg/linphone/core/LinphoneCall;
    check-cast v1, Lorg/linphone/core/LinphoneCall;

    .line 951
    .restart local v1    # "incomingCall":Lorg/linphone/core/LinphoneCall;
    :cond_0
    if-eqz v1, :cond_1

    .line 953
    :try_start_0
    invoke-interface {v1}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v3

    .line 954
    .local v3, "params":Lorg/linphone/core/LinphoneCallParams;
    const/4 v4, 0x1

    invoke-interface {v3, v4}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 955
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v4, v1, v3}, Lorg/linphone/core/LinphoneCore;->acceptCallWithParams(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)V

    .line 956
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->setupCallCard()V
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 964
    .end local v3    # "params":Lorg/linphone/core/LinphoneCallParams;
    :cond_1
    :goto_0
    return-void

    .line 958
    :catch_0
    move-exception v0

    .line 960
    .local v0, "e":Lorg/linphone/core/LinphoneCoreException;
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    sget-object v5, Lorg/linphone/core/Reason;->Busy:Lorg/linphone/core/Reason;

    invoke-interface {v4, v1, v5}, Lorg/linphone/core/LinphoneCore;->declineCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/Reason;)V

    goto :goto_0
.end method

.method appendDigit(C)V
    .locals 1
    .param p1, "c"    # C

    .prologue
    .line 832
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mDigits:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/text/Editable;->append(C)Landroid/text/Editable;

    .line 833
    return-void
.end method

.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 14
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    .line 1061
    const/4 v2, 0x0

    .line 1062
    .local v2, "currentCall":Lorg/linphone/core/LinphoneCall;
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    if-lez v9, :cond_1

    .line 1063
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v2

    .line 1064
    if-nez v2, :cond_0

    .line 1065
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v9

    const/4 v10, 0x0

    aget-object v2, v9, v10

    .line 1067
    :cond_0
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v9

    sget-object v10, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne v9, v10, :cond_3

    .line 1068
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 1069
    iget-object v9, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 1070
    iget-object v9, p0, Lorg/linphone/InCallScreen;->dialButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 1071
    iget-object v9, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1088
    :goto_0
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->setupCallCard()V

    .line 1091
    :cond_1
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_6

    .line 1092
    invoke-direct {p0, p1}, Lorg/linphone/InCallScreen;->enterIncalMode(Lorg/linphone/core/LinphoneCore;)V

    .line 1282
    :cond_2
    :goto_1
    return-void

    .line 1072
    :cond_3
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v9

    sget-object v10, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    if-eq v9, v10, :cond_4

    .line 1073
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v9

    sget-object v10, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-eq v9, v10, :cond_4

    .line 1074
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v9

    sget-object v10, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    if-eq v9, v10, :cond_4

    .line 1075
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v9

    sget-object v10, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    if-ne v9, v10, :cond_5

    .line 1076
    :cond_4
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 1077
    iget-object v9, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 1078
    iget-object v9, p0, Lorg/linphone/InCallScreen;->dialButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 1079
    iget-object v9, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1080
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1081
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setClickable(Z)V

    goto :goto_0

    .line 1083
    :cond_5
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 1084
    iget-object v9, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 1085
    iget-object v9, p0, Lorg/linphone/InCallScreen;->dialButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 1086
    iget-object v9, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_0

    .line 1093
    :cond_6
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-eq v0, v9, :cond_2

    .line 1097
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_7

    .line 1101
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    iget-object v9, v9, Lorg/linphone/CallCard;->mVideoIcon:Landroid/widget/ImageView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1102
    const/4 v9, 0x1

    iput-boolean v9, p0, Lorg/linphone/InCallScreen;->shouldUpdateQualityIndicator:Z

    .line 1103
    move-object/from16 v0, p2

    invoke-direct {p0, v0}, Lorg/linphone/InCallScreen;->configureQualityIndicator(Lorg/linphone/core/LinphoneCall;)V

    .line 1104
    invoke-direct {p0, p1}, Lorg/linphone/InCallScreen;->enterIncalMode(Lorg/linphone/core/LinphoneCore;)V

    .line 1106
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-eqz v9, :cond_2

    .line 1107
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v9

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v5

    .line 1108
    .local v5, "number":Ljava/lang/String;
    const-string/jumbo v9, "-3"

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1109
    move-object/from16 v0, p2

    invoke-direct {p0, v0}, Lorg/linphone/InCallScreen;->startConferenceCall(Lorg/linphone/core/LinphoneCall;)V

    goto/16 :goto_1

    .line 1113
    .end local v5    # "number":Ljava/lang/String;
    :cond_7
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_a

    .line 1114
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    if-nez v9, :cond_9

    .line 1115
    const/4 v9, 0x0

    iput-boolean v9, p0, Lorg/linphone/InCallScreen;->shouldUpdateQualityIndicator:Z

    .line 1116
    iget-object v9, p0, Lorg/linphone/InCallScreen;->qualityIndiTimer:Ljava/util/Timer;

    invoke-virtual {v9}, Ljava/util/Timer;->cancel()V

    .line 1118
    const-string/jumbo v9, "bearer capability not author"

    move-object/from16 v0, p4

    invoke-virtual {v0, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_8

    .line 1125
    const v9, 0x7f070241

    .line 1126
    invoke-virtual {p0, v9}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object p4, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    .line 1125
    invoke-static {p0, v9, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v8

    .line 1127
    .local v8, "toast":Landroid/widget/Toast;
    invoke-virtual {v8}, Landroid/widget/Toast;->show()V

    .line 1129
    .end local v8    # "toast":Landroid/widget/Toast;
    :cond_8
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->exitCallMode()V

    .line 1130
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->finish()V

    goto/16 :goto_1

    .line 1131
    :cond_9
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-eqz v9, :cond_2

    .line 1133
    :try_start_0
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->terminateAllCalls()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 1134
    :catch_0
    move-exception v9

    goto/16 :goto_1

    .line 1140
    :cond_a
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_12

    .line 1141
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    if-nez v9, :cond_b

    .line 1142
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    iget-object v9, v9, Lorg/linphone/CallCard;->mVideoIcon:Landroid/widget/ImageView;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1143
    const/4 v9, 0x0

    iput-boolean v9, p0, Lorg/linphone/InCallScreen;->shouldUpdateQualityIndicator:Z

    .line 1144
    iget-object v9, p0, Lorg/linphone/InCallScreen;->qualityIndiTimer:Ljava/util/Timer;

    invoke-virtual {v9}, Ljava/util/Timer;->cancel()V

    .line 1145
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->exitCallMode()V

    .line 1146
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/4 v10, 0x5

    const-wide/16 v12, 0x7d0

    invoke-virtual {v9, v10, v12, v13}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1151
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 1152
    iget-object v9, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    const/4 v10, 0x4

    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 1153
    iget-object v9, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1156
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mContext:Landroid/content/Context;

    invoke-static {v9}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1157
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/pccw/mobile/sip/service/MobileSipService;->setNeedPrepaidTopUpReminderCheck(Z)V

    goto/16 :goto_1

    .line 1159
    :cond_b
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-eqz v9, :cond_c

    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_c

    .line 1160
    const/4 v9, 0x0

    iput-boolean v9, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    goto/16 :goto_1

    .line 1162
    :cond_c
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v10, 0x1

    new-array v10, v10, [Lorg/linphone/core/LinphoneCall$State;

    const/4 v11, 0x0

    sget-object v12, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    aput-object v12, v10, v11

    .line 1163
    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    .line 1162
    invoke-static {v9, v10}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v3

    .line 1164
    .local v3, "incomingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    if-eqz v3, :cond_d

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v9

    if-eqz v9, :cond_d

    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_e

    .line 1165
    :cond_d
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->closeIncomingDialog()V

    .line 1167
    :cond_e
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-nez v9, :cond_2

    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-nez v9, :cond_2

    .line 1169
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v10, 0x3

    new-array v10, v10, [Lorg/linphone/core/LinphoneCall$State;

    const/4 v11, 0x0

    sget-object v12, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    sget-object v12, Lorg/linphone/core/LinphoneCall$State;->PausedByRemote:Lorg/linphone/core/LinphoneCall$State;

    aput-object v12, v10, v11

    const/4 v11, 0x2

    sget-object v12, Lorg/linphone/core/LinphoneCall$State;->Pausing:Lorg/linphone/core/LinphoneCall$State;

    aput-object v12, v10, v11

    .line 1170
    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    .line 1169
    invoke-static {v9, v10}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v6

    .line 1171
    .local v6, "pausedCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    if-eqz v6, :cond_f

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    if-lez v9, :cond_f

    .line 1172
    iget-object v10, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v9, 0x0

    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/linphone/core/LinphoneCall;

    invoke-interface {v10, v9}, Lorg/linphone/core/LinphoneCore;->resumeCall(Lorg/linphone/core/LinphoneCall;)Z

    .line 1175
    :cond_f
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-nez v9, :cond_11

    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-nez v9, :cond_11

    .line 1177
    invoke-static {}, Lorg/linphone/BandwidthManager;->isRoamSaveVideoEnable()Z

    move-result v9

    if-eqz v9, :cond_11

    .line 1178
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v9

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldEnableVideoButton(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 1179
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_11

    .line 1180
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1181
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->promptRemoteCancelVideoToast:Z

    if-nez v9, :cond_10

    .line 1182
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setClickable(Z)V

    goto/16 :goto_1

    .line 1184
    :cond_10
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setClickable(Z)V

    goto/16 :goto_1

    .line 1187
    :cond_11
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1188
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setClickable(Z)V

    goto/16 :goto_1

    .line 1192
    .end local v3    # "incomingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    .end local v6    # "pausedCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    :cond_12
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->CallReleased:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_13

    .line 1193
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    if-nez v9, :cond_2

    .line 1194
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v9

    if-nez v9, :cond_2

    .line 1195
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->finish()V

    goto/16 :goto_1

    .line 1198
    :cond_13
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->CallUpdatedByRemote:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_15

    .line 1199
    invoke-static {}, Lorg/linphone/BandwidthManager;->isRoamSaveVideoEnable()Z

    move-result v9

    if-eqz v9, :cond_15

    .line 1201
    invoke-interface/range {p2 .. p2}, Lorg/linphone/core/LinphoneCall;->getRemoteParams()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v9

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v7

    .line 1202
    .local v7, "remoteVideo":Z
    invoke-interface/range {p2 .. p2}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v9

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v4

    .line 1204
    .local v4, "localVideo":Z
    if-eqz v7, :cond_14

    if-nez v4, :cond_14

    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-nez v9, :cond_14

    .line 1206
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v9

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_14

    .line 1208
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    new-instance v10, Lorg/linphone/InCallScreen$9;

    invoke-direct {v10, p0}, Lorg/linphone/InCallScreen$9;-><init>(Lorg/linphone/InCallScreen;)V

    invoke-virtual {v9, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_1

    .line 1222
    :cond_14
    if-eqz v7, :cond_2

    if-nez v4, :cond_2

    .line 1223
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {p0, v9, v10}, Lorg/linphone/InCallScreen;->acceptCallUpdate(ZI)V

    goto/16 :goto_1

    .line 1225
    .end local v4    # "localVideo":Z
    .end local v7    # "remoteVideo":Z
    :cond_15
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_19

    .line 1228
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->promptRemoteCancelVideoToast:Z

    if-eqz v9, :cond_16

    invoke-interface/range {p2 .. p2}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v9

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v9

    if-nez v9, :cond_16

    .line 1230
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f070222

    const/4 v11, 0x1

    invoke-static {v9, v10, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v9

    .line 1231
    invoke-virtual {v9}, Landroid/widget/Toast;->show()V

    .line 1234
    :cond_16
    const/4 v9, 0x0

    iput-boolean v9, p0, Lorg/linphone/InCallScreen;->promptRemoteCancelVideoToast:Z

    .line 1236
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-nez v9, :cond_18

    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-nez v9, :cond_18

    .line 1238
    invoke-static {}, Lorg/linphone/BandwidthManager;->isRoamSaveVideoEnable()Z

    move-result v9

    if-eqz v9, :cond_18

    .line 1239
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v9

    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldEnableVideoButton(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_18

    .line 1240
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_18

    .line 1241
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1242
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->promptRemoteCancelVideoToast:Z

    if-nez v9, :cond_17

    .line 1243
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setClickable(Z)V

    .line 1254
    :goto_2
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->configureMuteButtons()V

    .line 1256
    if-eqz v2, :cond_2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v9

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1257
    sget-boolean v9, Lorg/linphone/VideoCallActivity;->launched:Z

    if-nez v9, :cond_2

    .line 1258
    sget v9, Lorg/linphone/InCallScreen;->VIDEO_VIEW_ACTIVITY:I

    invoke-direct {p0, v9}, Lorg/linphone/InCallScreen;->startVideoView(I)V

    goto/16 :goto_1

    .line 1245
    :cond_17
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setClickable(Z)V

    goto :goto_2

    .line 1248
    :cond_18
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 1249
    iget-object v9, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/widget/ToggleButton;->setClickable(Z)V

    goto :goto_2

    .line 1261
    :cond_19
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_1b

    .line 1262
    invoke-static {}, Lorg/linphone/core/Hacks;->needIncallModeAudio()Z

    move-result v9

    if-eqz v9, :cond_1a

    .line 1263
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Landroid/media/AudioManager;->setMode(I)V

    .line 1265
    :cond_1a
    invoke-static {}, Lorg/linphone/core/Hacks;->needRTPStreamHack()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1268
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Landroid/media/AudioManager;->setMode(I)V

    .line 1269
    iget-object v9, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/media/AudioManager;->setMode(I)V

    goto/16 :goto_1

    .line 1272
    :cond_1b
    sget-object v9, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    move-object/from16 v0, p3

    if-ne v0, v9, :cond_2

    .line 1273
    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-eqz v9, :cond_2

    iget-boolean v9, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-eqz v9, :cond_2

    iget-object v9, p0, Lorg/linphone/InCallScreen;->pausingCalls:Ljava/util/List;

    if-eqz v9, :cond_2

    iget-object v9, p0, Lorg/linphone/InCallScreen;->pausingCalls:Ljava/util/List;

    .line 1274
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-lez v9, :cond_2

    iget-object v9, p0, Lorg/linphone/InCallScreen;->pausingCalls:Ljava/util/List;

    move-object/from16 v0, p2

    invoke-interface {v9, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1275
    iget-object v9, p0, Lorg/linphone/InCallScreen;->pausingCalls:Ljava/util/List;

    move-object/from16 v0, p2

    invoke-interface {v9, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1278
    iget-object v9, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    iget-object v10, p0, Lorg/linphone/InCallScreen;->conferenceCallReferTo:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-interface {v9, v0, v10}, Lorg/linphone/core/LinphoneCore;->transferCall(Lorg/linphone/core/LinphoneCall;Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method public displayStatus(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 1602
    return-void
.end method

.method public globalState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$GlobalState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$GlobalState;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 1598
    return-void
.end method

.method hiddenScreen(Z)V
    .locals 7
    .param p1, "isHidden"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    const/16 v6, 0xe

    const/4 v5, 0x4

    const/4 v4, 0x0

    .line 1606
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 1607
    .local v1, "lAttrs":Landroid/view/WindowManager$LayoutParams;
    if-eqz p1, :cond_1

    .line 1608
    iget v3, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit16 v3, v3, 0x400

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 1609
    const v3, 0x3dcccccd    # 0.1f

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1610
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mMainFrame:Landroid/view/ViewGroup;

    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1612
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v6, :cond_0

    .line 1614
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 1615
    .local v0, "decorView":Landroid/view/View;
    const/4 v2, 0x2

    .line 1616
    .local v2, "uiOptions":I
    invoke-virtual {v0, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1618
    .end local v0    # "decorView":Landroid/view/View;
    .end local v2    # "uiOptions":I
    :cond_0
    iget-object v3, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 1631
    :goto_0
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1633
    iget-object v6, p0, Lorg/linphone/InCallScreen;->mMainFrame:Landroid/view/ViewGroup;

    if-eqz p1, :cond_4

    move v3, v5

    :goto_1
    invoke-virtual {v6, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1634
    iget-object v3, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_5

    :goto_2
    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1635
    return-void

    .line 1620
    :cond_1
    iget v3, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v3, v3, -0x401

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 1621
    const/high16 v3, -0x40800000    # -1.0f

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1622
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mMainFrame:Landroid/view/ViewGroup;

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1624
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v6, :cond_2

    .line 1626
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 1627
    .restart local v0    # "decorView":Landroid/view/View;
    invoke-virtual {v0, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 1629
    .end local v0    # "decorView":Landroid/view/View;
    :cond_2
    iget-object v6, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    iget-object v3, p0, Lorg/linphone/InCallScreen;->dialButton:Landroid/widget/ToggleButton;

    invoke-virtual {v3}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_3

    move v3, v4

    :goto_3
    invoke-virtual {v6, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_3
    const/16 v3, 0x8

    goto :goto_3

    :cond_4
    move v3, v4

    .line 1633
    goto :goto_1

    :cond_5
    move v5, v4

    .line 1634
    goto :goto_2
.end method

.method public initInCallScreen()V
    .locals 13

    .prologue
    const v12, 0x7f070282

    const v2, 0x7f02048e

    const v1, 0x7f020420

    .line 363
    const v0, 0x7f0e0154

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mInCallPanel:Landroid/view/ViewGroup;

    .line 364
    const v0, 0x7f0e0153

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mMainFrame:Landroid/view/ViewGroup;

    .line 369
    iget-object v10, p0, Lorg/linphone/InCallScreen;->mInCallPanel:Landroid/view/ViewGroup;

    .line 370
    .local v10, "callCardLayout":Landroid/view/View;
    const v0, 0x7f0e0155

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lorg/linphone/CallCard;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    .line 371
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mCallCard:Lorg/linphone/CallCard;

    invoke-virtual {v0}, Lorg/linphone/CallCard;->reset()V

    .line 373
    const v0, 0x7f0e0158

    invoke-virtual {v10, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lorg/linphone/CallCardHold;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->holdCallCard:Lorg/linphone/CallCardHold;

    .line 374
    iget-object v0, p0, Lorg/linphone/InCallScreen;->holdCallCard:Lorg/linphone/CallCardHold;

    invoke-virtual {v0}, Lorg/linphone/CallCardHold;->reset()V

    .line 376
    const v0, 0x7f0e0161

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/pccw/android/common/widget/SlidingTab;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    .line 388
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    const v4, 0x7f02005c

    const v5, 0x7f020061

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Lcom/pccw/android/common/widget/SlidingTab;->setLeftTabResources(IIIII)V

    .line 394
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    const v5, 0x7f02048f

    const v7, 0x7f020077

    const v8, 0x7f02007c

    move v4, v1

    move v6, v1

    invoke-virtual/range {v3 .. v8}, Lcom/pccw/android/common/widget/SlidingTab;->setRightTabResources(IIIII)V

    .line 400
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    const v4, 0x7f020063

    const v5, 0x7f020062

    move v3, v1

    invoke-virtual/range {v0 .. v5}, Lcom/pccw/android/common/widget/SlidingTab;->setVideoTabResources(IIIII)V

    .line 409
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    invoke-virtual {v0, v12}, Lcom/pccw/android/common/widget/SlidingTab;->setLeftHintText(I)V

    .line 410
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    const v1, 0x7f07020d

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SlidingTab;->setRightHintText(I)V

    .line 411
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    invoke-virtual {v0, v12}, Lcom/pccw/android/common/widget/SlidingTab;->setVideoHintText(I)V

    .line 412
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    new-instance v1, Lorg/linphone/InCallScreen$2;

    invoke-direct {v1, p0}, Lorg/linphone/InCallScreen$2;-><init>(Lorg/linphone/InCallScreen;)V

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/SlidingTab;->setOnTriggerListener(Lcom/pccw/android/common/widget/SlidingTab$OnTriggerListener;)V

    .line 463
    const v0, 0x7f0e0162

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    .line 465
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x8000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 467
    const v0, 0x7f0e012b

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mDigits:Landroid/widget/EditText;

    .line 468
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00b3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x31

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00b4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x32

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00b5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x33

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 471
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00b6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x34

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 472
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00b7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x35

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00b8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x36

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00b9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x37

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00ba

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x38

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00bb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x39

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 477
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00bd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x30

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 478
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00be

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x23

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 479
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    const v1, 0x7f0e00bc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x2a

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    sget-object v0, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v11

    .line 483
    .local v11, "viewId":I
    invoke-virtual {p0, v11}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v9

    .line 484
    .local v9, "button":Landroid/view/View;
    invoke-virtual {v9, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 487
    .end local v9    # "button":Landroid/view/View;
    .end local v11    # "viewId":I
    :cond_0
    const v0, 0x7f0e0159

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    .line 488
    const v0, 0x7f0e0160

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->clearCallButton:Landroid/widget/ImageButton;

    .line 489
    const v0, 0x7f0e015d

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->dialButton:Landroid/widget/ToggleButton;

    .line 490
    const v0, 0x7f0e015b

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->speakerButton:Landroid/widget/ToggleButton;

    .line 491
    const v0, 0x7f0e015a

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    .line 492
    const v0, 0x7f0e015e

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    .line 493
    const v0, 0x7f0e015f

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->muteButton:Landroid/widget/ToggleButton;

    .line 494
    const v0, 0x7f0e015c

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ToggleButton;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    .line 495
    const v0, 0x7f0e0156

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/InCallScreen;->swapCallButton:Landroid/view/View;

    .line 497
    iget-object v0, p0, Lorg/linphone/InCallScreen;->clearCallButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 498
    iget-object v0, p0, Lorg/linphone/InCallScreen;->dialButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p0}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 499
    iget-object v0, p0, Lorg/linphone/InCallScreen;->speakerButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p0}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 500
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mergeAddButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p0}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 501
    iget-object v0, p0, Lorg/linphone/InCallScreen;->startVideoButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p0}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 502
    iget-object v0, p0, Lorg/linphone/InCallScreen;->muteButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p0}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 503
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    invoke-virtual {v0, p0}, Landroid/widget/ToggleButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 504
    iget-object v0, p0, Lorg/linphone/InCallScreen;->swapCallButton:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 506
    return-void
.end method

.method moveBack()V
    .locals 0

    .prologue
    .line 206
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->onStop()V

    .line 207
    return-void
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 1026
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 10
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const-wide/16 v8, 0x7d0

    const/4 v7, 0x1

    const/4 v4, 0x0

    .line 555
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    .line 559
    .local v2, "viewId":I
    sget-object v3, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 560
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 563
    sget-object v3, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Character;

    invoke-virtual {v3}, Ljava/lang/Character;->charValue()C

    move-result v3

    invoke-virtual {p0, v3}, Lorg/linphone/InCallScreen;->appendDigit(C)V

    .line 564
    iget-object v5, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    sget-object v3, Lorg/linphone/InCallScreen;->mDisplayMap:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Character;

    invoke-virtual {v3}, Ljava/lang/Character;->charValue()C

    move-result v3

    invoke-interface {v5, v3}, Lorg/linphone/core/LinphoneCore;->sendDtmf(C)V

    .line 565
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/16 v5, 0x31

    const/16 v6, 0xa

    invoke-interface {v3, v5, v6}, Lorg/linphone/core/LinphoneCore;->playDtmf(CI)V

    .line 569
    :cond_0
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->stopDtmf()V

    .line 572
    :cond_1
    packed-switch v2, :pswitch_data_0

    .line 654
    :cond_2
    :goto_0
    :pswitch_0
    return-void

    .line 574
    :pswitch_1
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 576
    .local v0, "currentCall":Lorg/linphone/core/LinphoneCall;
    if-eqz v0, :cond_3

    .line 577
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3, v0}, Lorg/linphone/core/LinphoneCore;->terminateCall(Lorg/linphone/core/LinphoneCall;)V

    .line 582
    :goto_1
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v3

    if-nez v3, :cond_4

    .line 583
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x5

    invoke-virtual {v3, v4, v8, v9}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 579
    :cond_3
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->terminateAllCalls()V

    goto :goto_1

    .line 589
    :cond_4
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x7

    invoke-virtual {v3, v4, v8, v9}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    .line 594
    .end local v0    # "currentCall":Lorg/linphone/core/LinphoneCall;
    :pswitch_2
    iget-object v5, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    iget-object v3, p0, Lorg/linphone/InCallScreen;->dialButton:Landroid/widget/ToggleButton;

    invoke-virtual {v3}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_5

    move v3, v4

    :goto_2
    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_5
    const/16 v3, 0x8

    goto :goto_2

    .line 597
    :pswitch_3
    iget-object v3, p0, Lorg/linphone/InCallScreen;->speakerButton:Landroid/widget/ToggleButton;

    invoke-virtual {v3}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 598
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->routeAudioToSpeaker()V

    goto :goto_0

    .line 600
    :cond_6
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->routeAudioToReceiver()V

    goto :goto_0

    .line 604
    :pswitch_4
    iget-boolean v3, p0, Lorg/linphone/InCallScreen;->isWaitingConferenceCall:Z

    if-nez v3, :cond_7

    iget-boolean v3, p0, Lorg/linphone/InCallScreen;->isInConferenceCall:Z

    if-eqz v3, :cond_8

    .line 616
    :cond_7
    :goto_3
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->refreshMergeAddButton()V

    goto :goto_0

    .line 606
    :cond_8
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v3

    if-gt v3, v7, :cond_9

    .line 608
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 609
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 610
    const-class v3, Lcom/pccw/mobile/sip/AddCallActivity;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 611
    const/16 v3, 0x65

    invoke-virtual {p0, v1, v3}, Lorg/linphone/InCallScreen;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_3

    .line 614
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_9
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->inviteConferenceCall()V

    goto :goto_3

    .line 619
    :pswitch_5
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 620
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    new-instance v4, Lorg/linphone/InCallScreen$6;

    invoke-direct {v4, p0}, Lorg/linphone/InCallScreen$6;-><init>(Lorg/linphone/InCallScreen;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    .line 639
    :pswitch_6
    iget-object v3, p0, Lorg/linphone/InCallScreen;->muteButton:Landroid/widget/ToggleButton;

    invoke-virtual {v3}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 640
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3, v7}, Lorg/linphone/core/LinphoneCore;->muteMic(Z)V

    goto/16 :goto_0

    .line 642
    :cond_a
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3, v4}, Lorg/linphone/core/LinphoneCore;->muteMic(Z)V

    goto/16 :goto_0

    .line 646
    :pswitch_7
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->popupAudioRoutingWindow()V

    goto/16 :goto_0

    .line 649
    :pswitch_8
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->pauseOrResumeOrSwapCall()V

    goto/16 :goto_0

    .line 572
    :pswitch_data_0
    .packed-switch 0x7f0e0156
        :pswitch_8
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_7
        :pswitch_2
        :pswitch_5
        :pswitch_6
        :pswitch_1
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x1

    .line 837
    invoke-super {p0, p1}, Lorg/linphone/CallScreen;->onCreate(Landroid/os/Bundle;)V

    .line 839
    invoke-virtual {p0, v2}, Lorg/linphone/InCallScreen;->requestWindowFeature(I)Z

    .line 842
    const v0, 0x7f04004d

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->setContentView(I)V

    .line 844
    const-string/jumbo v0, "audio"

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    .line 846
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->initInCallScreen()V

    .line 848
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    .line 850
    const-string/jumbo v0, "sensor"

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->sensorManager:Landroid/hardware/SensorManager;

    .line 851
    iget-object v0, p0, Lorg/linphone/InCallScreen;->sensorManager:Landroid/hardware/SensorManager;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/InCallScreen;->proximitySensor:Landroid/hardware/Sensor;

    .line 858
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mContext:Landroid/content/Context;

    const-string/jumbo v1, "power"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lorg/linphone/InCallScreen;->pm:Landroid/os/PowerManager;

    .line 860
    sput-object p0, Lorg/linphone/InCallScreen;->theDialer:Lorg/linphone/InCallScreen;

    .line 862
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lorg/linphone/InCallScreen;->qualityIndiTimer:Ljava/util/Timer;

    .line 864
    invoke-virtual {p0, v2}, Lorg/linphone/InCallScreen;->refreshAudioRouteActions(Z)V

    .line 865
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .param p1, "id"    # I

    .prologue
    const/4 v3, 0x0

    .line 1666
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1667
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    packed-switch p1, :pswitch_data_0

    .line 1711
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unkown dialog id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1669
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1670
    .restart local v0    # "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f07010f

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1671
    const v1, 0x7f070110

    new-instance v2, Lorg/linphone/InCallScreen$11;

    invoke-direct {v2, p0, p1}, Lorg/linphone/InCallScreen$11;-><init>(Lorg/linphone/InCallScreen;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1677
    const v1, 0x7f07010e

    new-instance v2, Lorg/linphone/InCallScreen$12;

    invoke-direct {v2, p0, p1}, Lorg/linphone/InCallScreen$12;-><init>(Lorg/linphone/InCallScreen;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1683
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1684
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 1708
    :goto_0
    return-object v1

    .line 1686
    :pswitch_1
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1687
    .restart local v0    # "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f070111

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1688
    const v1, 0x7f070112

    new-instance v2, Lorg/linphone/InCallScreen$13;

    invoke-direct {v2, p0, p1}, Lorg/linphone/InCallScreen$13;-><init>(Lorg/linphone/InCallScreen;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1698
    const v1, 0x7f070113

    new-instance v2, Lorg/linphone/InCallScreen$14;

    invoke-direct {v2, p0, p1}, Lorg/linphone/InCallScreen$14;-><init>(Lorg/linphone/InCallScreen;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1707
    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1708
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    goto :goto_0

    .line 1667
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 869
    invoke-super {p0}, Lorg/linphone/CallScreen;->onDestroy()V

    .line 870
    iget-object v0, p0, Lorg/linphone/InCallScreen;->qualityIndiTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 871
    iget-object v0, p0, Lorg/linphone/InCallScreen;->qualityIndiTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 873
    :cond_0
    iget-object v0, p0, Lorg/linphone/InCallScreen;->waitingConferenceCallTimer:Ljava/util/Timer;

    if-eqz v0, :cond_1

    .line 874
    iget-object v0, p0, Lorg/linphone/InCallScreen;->waitingConferenceCallTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 876
    :cond_1
    sget-object v0, Lorg/linphone/InCallScreen;->wl:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_2

    sget-object v0, Lorg/linphone/InCallScreen;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 877
    sget-object v0, Lorg/linphone/InCallScreen;->wl:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 879
    :cond_2
    const/16 v0, 0x65

    invoke-virtual {p0, v0}, Lorg/linphone/InCallScreen;->finishActivity(I)V

    .line 881
    const/4 v0, 0x0

    sput-object v0, Lorg/linphone/InCallScreen;->theDialer:Lorg/linphone/InCallScreen;

    .line 882
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 5
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, -0x1

    const/16 v3, 0x19

    const/16 v4, 0x18

    const/4 v1, 0x1

    .line 970
    const/4 v2, 0x4

    if-ne p1, v2, :cond_1

    .line 971
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 994
    :cond_0
    :goto_0
    return v1

    .line 974
    :cond_1
    if-eq p1, v4, :cond_2

    if-ne p1, v3, :cond_6

    .line 975
    :cond_2
    invoke-static {}, Lorg/linphone/core/Hacks;->needSoftvolume()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    invoke-virtual {v2, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->useSoftvolume(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 977
    :cond_3
    if-ne p1, v4, :cond_5

    .line 978
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->adjustSoftwareVolume(I)V

    .line 991
    :cond_4
    :goto_1
    sget-boolean v0, Lorg/linphone/InCallScreen;->preventVolumeBarToDisplay:Z

    if-nez v0, :cond_a

    .line 992
    invoke-super {p0, p1, p2}, Lorg/linphone/CallScreen;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0

    .line 979
    :cond_5
    if-ne p1, v3, :cond_4

    .line 980
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/linphone/LinphoneService;->adjustSoftwareVolume(I)V

    goto :goto_1

    .line 982
    :cond_6
    if-eq p1, v4, :cond_7

    if-ne p1, v3, :cond_4

    .line 983
    :cond_7
    iget-object v2, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v2}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 984
    iget-object v2, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    const/4 v3, 0x6

    if-ne p1, v4, :cond_8

    move v0, v1

    :cond_8
    invoke-virtual {v2, v3, v0, v1}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    .line 988
    :cond_9
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lorg/linphone/CallScreen;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0

    .line 994
    :cond_a
    invoke-super {p0, p1, p2}, Lorg/linphone/CallScreen;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 1000
    sparse-switch p1, :sswitch_data_0

    .line 1021
    :cond_0
    const/4 v0, 0x0

    :goto_0
    :sswitch_0
    return v0

    .line 1002
    :sswitch_1
    const/4 v1, 0x4

    if-ne p1, v1, :cond_0

    .line 1003
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1000
    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_1
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 188
    invoke-super {p0}, Lorg/linphone/CallScreen;->onPause()V

    .line 189
    iget-object v0, p0, Lorg/linphone/InCallScreen;->t:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 190
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/InCallScreen;->running:Z

    .line 191
    iget-object v0, p0, Lorg/linphone/InCallScreen;->t:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 194
    :cond_0
    invoke-static {}, Lorg/linphone/LinphoneActivity;->instance()Lorg/linphone/LinphoneActivity;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneActivity;->stopProxymitySensor()V

    .line 198
    return-void
.end method

.method public onResume()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x4

    .line 218
    invoke-super {p0}, Lorg/linphone/CallScreen;->onResume()V

    .line 224
    const-wide/16 v4, 0xc8

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    :goto_0
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v3

    if-nez v3, :cond_0

    .line 228
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->exitCallMode()V

    .line 276
    :goto_1
    return-void

    .line 232
    :cond_0
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 233
    .local v0, "currentCall":Lorg/linphone/core/LinphoneCall;
    if-nez v0, :cond_1

    .line 234
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v3

    aget-object v0, v3, v7

    .line 237
    :cond_1
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v2

    .line 241
    .local v2, "state":Lorg/linphone/core/LinphoneCall$State;
    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-eq v2, v3, :cond_2

    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->OutgoingRinging:Lorg/linphone/core/LinphoneCall$State;

    if-eq v2, v3, :cond_2

    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->Connected:Lorg/linphone/core/LinphoneCall$State;

    if-eq v2, v3, :cond_2

    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-eq v2, v3, :cond_2

    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->OutgoingProgress:Lorg/linphone/core/LinphoneCall$State;

    if-eq v2, v3, :cond_2

    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->OutgoingEarlyMedia:Lorg/linphone/core/LinphoneCall$State;

    if-ne v2, v3, :cond_5

    .line 246
    :cond_2
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    invoke-virtual {v3, v6}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 247
    iget-object v3, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 248
    iget-object v3, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 250
    invoke-static {}, Lorg/linphone/LinphoneActivity;->instance()Lorg/linphone/LinphoneActivity;

    move-result-object v3

    invoke-virtual {v3}, Lorg/linphone/LinphoneActivity;->startProxymitySensor()V

    .line 263
    :cond_3
    :goto_2
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->configureMuteButtons()V

    .line 264
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->setupCallCard()V

    .line 266
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v3

    if-le v3, v8, :cond_4

    .line 267
    iget-object v3, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    new-array v4, v8, [Lorg/linphone/core/LinphoneCall$State;

    sget-object v5, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    aput-object v5, v4, v7

    .line 268
    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 267
    invoke-static {v3, v4}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    .line 269
    .local v1, "incomingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v3

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-eq v3, v4, :cond_4

    .line 270
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_4

    .line 271
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/linphone/core/LinphoneCall;

    invoke-direct {p0, v3}, Lorg/linphone/InCallScreen;->handleIncomingCallWaiting(Lorg/linphone/core/LinphoneCall;)V

    .line 275
    .end local v1    # "incomingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    :cond_4
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v6}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_1

    .line 251
    :cond_5
    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne v2, v3, :cond_6

    .line 252
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    invoke-virtual {v3, v7}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    .line 253
    iget-object v3, p0, Lorg/linphone/InCallScreen;->inCallDtmfView:Landroid/view/View;

    invoke-virtual {v3, v6}, Landroid/view/View;->setVisibility(I)V

    .line 254
    iget-object v3, p0, Lorg/linphone/InCallScreen;->inCallButtons:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_2

    .line 255
    :cond_6
    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    if-eq v2, v3, :cond_3

    .line 256
    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-ne v2, v3, :cond_3

    .line 260
    iget-object v3, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    invoke-virtual {v3, v6}, Lcom/pccw/android/common/widget/SlidingTab;->setVisibility(I)V

    goto :goto_2

    .line 225
    .end local v0    # "currentCall":Lorg/linphone/core/LinphoneCall;
    .end local v2    # "state":Lorg/linphone/core/LinphoneCall$State;
    :catch_0
    move-exception v3

    goto/16 :goto_0
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v0, 0x0

    .line 1038
    iget-boolean v2, p0, Lorg/linphone/InCallScreen;->first:Z

    if-eqz v2, :cond_0

    .line 1039
    iput-boolean v0, p0, Lorg/linphone/InCallScreen;->first:Z

    .line 1046
    :goto_0
    return-void

    .line 1042
    :cond_0
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v2, v0

    .line 1043
    .local v1, "distance":F
    float-to-double v2, v1

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-ltz v2, :cond_1

    const/high16 v2, 0x40a00000    # 5.0f

    cmpg-float v2, v1, v2

    if-gez v2, :cond_1

    iget-object v2, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    .line 1044
    invoke-virtual {v2}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v2

    cmpg-float v2, v1, v2

    if-gez v2, :cond_1

    const/4 v0, 0x1

    .line 1045
    .local v0, "active":Z
    :cond_1
    if-eqz v0, :cond_2

    const-wide v2, 0x3fb999999999999aL    # 0.1

    :goto_1
    double-to-float v2, v2

    invoke-virtual {p0, v2}, Lorg/linphone/InCallScreen;->setScreenBacklight(F)V

    goto :goto_0

    :cond_2
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    goto :goto_1
.end method

.method public onStart()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 172
    invoke-super {p0}, Lorg/linphone/CallScreen;->onStart()V

    .line 181
    iput-boolean v0, p0, Lorg/linphone/InCallScreen;->first:Z

    .line 183
    sput-boolean v0, Lorg/linphone/InCallScreen;->started:Z

    .line 184
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 159
    invoke-super {p0}, Lorg/linphone/CallScreen;->onStop()V

    .line 167
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/InCallScreen;->started:Z

    .line 168
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .param p1, "hasFocus"    # Z

    .prologue
    .line 353
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    if-eqz v0, :cond_0

    .line 354
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    sget-object v0, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 355
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    sget-object v0, Lcom/pccw/android/common/widget/SlidingTab;->btnRejectCallAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 356
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mIncomingCallWidget:Lcom/pccw/android/common/widget/SlidingTab;

    sget-object v0, Lcom/pccw/android/common/widget/SlidingTab;->btnAcceptVideoAnimation:Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 359
    :cond_0
    invoke-super {p0, p1}, Lorg/linphone/CallScreen;->onWindowFocusChanged(Z)V

    .line 360
    return-void
.end method

.method public pauseOrResumeCall(Lorg/linphone/core/LinphoneCall;)V
    .locals 1
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 1822
    if-eqz p1, :cond_1

    invoke-static {p1}, Lorg/linphone/LinphoneUtils;->isCallRunning(Lorg/linphone/core/LinphoneCall;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1823
    iget-object v0, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0, p1}, Lorg/linphone/core/LinphoneCore;->pauseCall(Lorg/linphone/core/LinphoneCall;)Z

    .line 1829
    :cond_0
    :goto_0
    return-void

    .line 1825
    :cond_1
    invoke-static {p1}, Lorg/linphone/LinphoneUtils;->isCallPaused(Lorg/linphone/core/LinphoneCall;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1826
    iget-object v0, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0, p1}, Lorg/linphone/core/LinphoneCore;->resumeCall(Lorg/linphone/core/LinphoneCall;)Z

    goto :goto_0
.end method

.method protected popupAudioRoutingWindow()V
    .locals 9

    .prologue
    const v8, 0x7f0e015c

    const/4 v7, -0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 509
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f04002a

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 512
    .local v1, "popupWindow_view":Landroid/view/View;
    new-instance v0, Landroid/widget/PopupWindow;

    invoke-direct {v0, v1, v7, v7, v6}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 515
    .local v0, "popupWindow":Landroid/widget/PopupWindow;
    const v2, 0x7f0e00bf

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lorg/linphone/InCallScreen;->routeBluetooth:Landroid/widget/ImageView;

    .line 516
    const v2, 0x7f0e00c1

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lorg/linphone/InCallScreen;->routeSpeaker:Landroid/widget/ImageView;

    .line 517
    const v2, 0x7f0e00c0

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lorg/linphone/InCallScreen;->routeReceiver:Landroid/widget/ImageView;

    .line 519
    iget-object v2, p0, Lorg/linphone/InCallScreen;->routeBluetooth:Landroid/widget/ImageView;

    new-instance v3, Lorg/linphone/InCallScreen$3;

    invoke-direct {v3, p0, v0}, Lorg/linphone/InCallScreen$3;-><init>(Lorg/linphone/InCallScreen;Landroid/widget/PopupWindow;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 527
    iget-object v2, p0, Lorg/linphone/InCallScreen;->routeSpeaker:Landroid/widget/ImageView;

    new-instance v3, Lorg/linphone/InCallScreen$4;

    invoke-direct {v3, p0, v0}, Lorg/linphone/InCallScreen$4;-><init>(Lorg/linphone/InCallScreen;Landroid/widget/PopupWindow;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 535
    iget-object v2, p0, Lorg/linphone/InCallScreen;->routeReceiver:Landroid/widget/ImageView;

    new-instance v3, Lorg/linphone/InCallScreen$5;

    invoke-direct {v3, p0, v0}, Lorg/linphone/InCallScreen$5;-><init>(Lorg/linphone/InCallScreen;Landroid/widget/PopupWindow;)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 544
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v5, v5}, Landroid/view/View;->measure(II)V

    .line 545
    new-instance v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v0, v2}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 546
    invoke-virtual {p0, v8}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 547
    invoke-virtual {p0, v8}, Lorg/linphone/InCallScreen;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v4

    .line 548
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    add-int/2addr v3, v4

    neg-int v3, v3

    .line 546
    invoke-virtual {v0, v2, v5, v3}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 549
    invoke-virtual {v0, v6}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 550
    invoke-virtual {v0, v6}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 551
    invoke-virtual {v0, v6}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 552
    return-void
.end method

.method public refreshAudioRouteActions(Z)V
    .locals 2
    .param p1, "isInit"    # Z

    .prologue
    .line 657
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 658
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    .line 660
    :cond_0
    iget-object v0, p0, Lorg/linphone/InCallScreen;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/InCallScreen$7;

    invoke-direct {v1, p0, p1}, Lorg/linphone/InCallScreen$7;-><init>(Lorg/linphone/InCallScreen;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 701
    return-void
.end method

.method public registrationState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneProxyConfig;Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cfg"    # Lorg/linphone/core/LinphoneProxyConfig;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCore$RegistrationState;
    .param p4, "smessage"    # Ljava/lang/String;

    .prologue
    .line 1576
    return-void
.end method

.method public reject()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 885
    const/4 v0, 0x0

    .line 886
    .local v0, "incomingCall":Lorg/linphone/core/LinphoneCall;
    iget-object v2, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v3, 0x1

    new-array v3, v3, [Lorg/linphone/core/LinphoneCall$State;

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    aput-object v4, v3, v5

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    .line 887
    .local v1, "incomingCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 888
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "incomingCall":Lorg/linphone/core/LinphoneCall;
    check-cast v0, Lorg/linphone/core/LinphoneCall;

    .line 891
    .restart local v0    # "incomingCall":Lorg/linphone/core/LinphoneCall;
    :cond_0
    if-eqz v0, :cond_1

    .line 893
    iget-object v2, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    sget-object v3, Lorg/linphone/core/Reason;->Busy:Lorg/linphone/core/Reason;

    invoke-interface {v2, v0, v3}, Lorg/linphone/core/LinphoneCore;->declineCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/Reason;)V

    .line 896
    :cond_1
    return-void
.end method

.method screenOff(Z)V
    .locals 4
    .param p1, "off"    # Z

    .prologue
    const/16 v3, 0x2ee0

    const v2, 0xea60

    .line 137
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 139
    .local v0, "cr":Landroid/content/ContentResolver;
    iget-object v1, p0, Lorg/linphone/InCallScreen;->proximitySensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_1

    .line 155
    :cond_0
    :goto_0
    return-void

    .line 141
    :cond_1
    if-eqz p1, :cond_2

    .line 142
    iget v1, p0, Lorg/linphone/InCallScreen;->oldtimeout:I

    if-nez v1, :cond_0

    .line 143
    const-string/jumbo v1, "screen_off_timeout"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lorg/linphone/InCallScreen;->oldtimeout:I

    .line 144
    const-string/jumbo v1, "screen_off_timeout"

    invoke-static {v0, v1, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0

    .line 147
    :cond_2
    iget v1, p0, Lorg/linphone/InCallScreen;->oldtimeout:I

    if-nez v1, :cond_3

    const-string/jumbo v1, "screen_off_timeout"

    .line 148
    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v3, :cond_3

    .line 149
    iput v2, p0, Lorg/linphone/InCallScreen;->oldtimeout:I

    .line 150
    :cond_3
    iget v1, p0, Lorg/linphone/InCallScreen;->oldtimeout:I

    if-eqz v1, :cond_0

    .line 151
    const-string/jumbo v1, "screen_off_timeout"

    iget v2, p0, Lorg/linphone/InCallScreen;->oldtimeout:I

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 152
    const/4 v1, 0x0

    iput v1, p0, Lorg/linphone/InCallScreen;->oldtimeout:I

    goto :goto_0
.end method

.method setScreenBacklight(F)V
    .locals 2
    .param p1, "a"    # F

    .prologue
    .line 1029
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 1030
    .local v0, "lp":Landroid/view/WindowManager$LayoutParams;
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    .line 1031
    invoke-virtual {p0}, Lorg/linphone/InCallScreen;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 1032
    return-void
.end method

.method public swapPausedCall()V
    .locals 9

    .prologue
    const/4 v4, 0x0

    .line 1797
    const/4 v2, 0x0

    .line 1798
    .local v2, "callToResume":Lorg/linphone/core/LinphoneCall;
    const/4 v1, 0x0

    .line 1799
    .local v1, "callToPause":Lorg/linphone/core/LinphoneCall;
    iget-object v5, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v6, 0x1

    new-array v6, v6, [Lorg/linphone/core/LinphoneCall$State;

    sget-object v7, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    aput-object v7, v6, v4

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/linphone/LinphoneUtils;->getCallsInState(Lorg/linphone/core/LinphoneCore;Ljava/util/Collection;)Ljava/util/List;

    move-result-object v3

    .line 1800
    .local v3, "pausedCalls":Ljava/util/List;, "Ljava/util/List<Lorg/linphone/core/LinphoneCall;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 1801
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "callToResume":Lorg/linphone/core/LinphoneCall;
    check-cast v2, Lorg/linphone/core/LinphoneCall;

    .line 1804
    .restart local v2    # "callToResume":Lorg/linphone/core/LinphoneCall;
    :cond_0
    if-eqz v2, :cond_1

    .line 1805
    iget-object v5, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v5}, Lorg/linphone/core/LinphoneCore;->getCalls()[Lorg/linphone/core/LinphoneCall;

    move-result-object v5

    array-length v6, v5

    :goto_0
    if-ge v4, v6, :cond_1

    aget-object v0, v5, v4

    .line 1806
    .local v0, "call":Lorg/linphone/core/LinphoneCall;
    sget-object v7, Lorg/linphone/core/LinphoneCall$State;->Paused:Lorg/linphone/core/LinphoneCall$State;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v8

    if-eq v7, v8, :cond_3

    .line 1807
    move-object v1, v0

    .line 1812
    .end local v0    # "call":Lorg/linphone/core/LinphoneCall;
    :cond_1
    if-eqz v2, :cond_2

    if-eqz v1, :cond_2

    .line 1813
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v4, v1}, Lorg/linphone/core/LinphoneCore;->pauseCall(Lorg/linphone/core/LinphoneCall;)Z

    .line 1814
    iget-object v4, p0, Lorg/linphone/InCallScreen;->lLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v4, v2}, Lorg/linphone/core/LinphoneCore;->resumeCall(Lorg/linphone/core/LinphoneCall;)Z

    .line 1815
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->setupCallCard()V

    .line 1817
    :cond_2
    return-void

    .line 1805
    .restart local v0    # "call":Lorg/linphone/core/LinphoneCall;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public updateRoutingIcon()V
    .locals 5

    .prologue
    .line 706
    invoke-direct {p0}, Lorg/linphone/InCallScreen;->configureSpeakerButtons()V

    .line 708
    :try_start_0
    iget-object v0, p0, Lorg/linphone/InCallScreen;->speakerButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 710
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const/4 v1, 0x0

    const v2, 0x7f020452

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/ToggleButton;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 711
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701fb

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setText(I)V

    .line 712
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701fb

    invoke-virtual {p0, v1}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 713
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701fb

    invoke-virtual {p0, v1}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    .line 735
    :goto_0
    return-void

    .line 715
    :cond_0
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    iget-boolean v0, v0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    if-eqz v0, :cond_1

    .line 717
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const/4 v1, 0x0

    const v2, 0x7f020429

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/ToggleButton;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 719
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701f9

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setText(I)V

    .line 720
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701f9

    invoke-virtual {p0, v1}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 721
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701f9

    invoke-virtual {p0, v1}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 731
    :catch_0
    move-exception v0

    goto :goto_0

    .line 724
    :cond_1
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const/4 v1, 0x0

    const v2, 0x7f02044d

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/ToggleButton;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 726
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701fa

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setText(I)V

    .line 727
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701fa

    invoke-virtual {p0, v1}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setTextOn(Ljava/lang/CharSequence;)V

    .line 728
    iget-object v0, p0, Lorg/linphone/InCallScreen;->audioRoute:Landroid/widget/ToggleButton;

    const v1, 0x7f0701fa

    invoke-virtual {p0, v1}, Lorg/linphone/InCallScreen;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ToggleButton;->setTextOff(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method
