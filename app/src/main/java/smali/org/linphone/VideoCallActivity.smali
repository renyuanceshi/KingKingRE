.class public Lorg/linphone/VideoCallActivity;
.super Lcom/pccw/mobile/sip/BaseActivity;
.source "VideoCallActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/VideoCallActivity$HeadSetReceiver;
    }
.end annotation


# static fields
.field private static final capturePreviewLargestDimension:I = 0x96

.field public static launched:Z = false

.field private static final promptBackToDialerId:I = 0x0

.field private static final tag:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field private static theVideoCall:Lorg/linphone/VideoCallActivity;


# instance fields
.field private final DEVICE_LANDSCAPE:I

.field private final DEVICE_PORTRAIT:I

.field private final EYE_MODE_ORIENTATION:I

.field private MenuCallEnd:Landroid/widget/RelativeLayout;

.field private MenuMute:Landroid/widget/RelativeLayout;

.field private MenuRouteAudio:Landroid/widget/RelativeLayout;

.field private MenuSpeaker:Landroid/widget/RelativeLayout;

.field private MenuSwtichCamera:Landroid/widget/ImageButton;

.field private MenuVideoOff:Landroid/widget/RelativeLayout;

.field private final ROAMSAVE_MODE_ORIENTATION:I

.field androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

.field private callEndButton:Landroid/widget/ImageButton;

.field private controlsHandler:Landroid/os/Handler;

.field private deviceOrientation:I

.field enabledKeyguard:Z

.field intentReceiver:Lorg/linphone/VideoCallActivity$HeadSetReceiver;

.field private mAudioManager:Landroid/media/AudioManager;

.field private mCallQualityUpdater:Ljava/lang/Runnable;

.field private mControls:Ljava/lang/Runnable;

.field mHandler:Landroid/os/Handler;

.field mKeyguardLock:Landroid/app/KeyguardManager$KeyguardLock;

.field mKeyguardManager:Landroid/app/KeyguardManager;

.field mOrientationEventListener:Landroid/view/OrientationEventListener;

.field private mRotateDialog:Lcom/pccw/camera/ui/RotateDialogController;

.field private mTask:Ljava/util/TimerTask;

.field private mTimer:Ljava/util/Timer;

.field private mVideoCaptureView:Landroid/view/SurfaceView;

.field private mVideoCaptureViewReady:Landroid/view/SurfaceView;

.field private mVideoView:Landroid/view/SurfaceView;

.field private mVideoViewReady:Landroid/view/SurfaceView;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private muteButton:Landroid/widget/ImageButton;

.field private needExtraRotation:Z

.field private orientationMode:I

.field private phoneOrientation:I

.field private previousPhoneOrientation:I

.field private recordManager:Lorg/linphone/core/AndroidCameraRecordManager;

.field private refreshHandler:Landroid/os/Handler;

.field private routeBluetooth:Landroid/widget/ImageButton;

.field private routeButton:Landroid/widget/ImageButton;

.field private routeReceiver:Landroid/widget/ImageButton;

.field private routeSpeaker:Landroid/widget/ImageButton;

.field private runDialAccept:Ljava/lang/Runnable;

.field private showViewStat:Z

.field private speakerButton:Landroid/widget/ImageButton;

.field private timer:Landroid/os/CountDownTimer;

.field private videoButton:Landroid/widget/ImageButton;

.field private videoCall:Lorg/linphone/core/LinphoneCall;

.field private viewStat:Landroid/widget/LinearLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 101
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/VideoCallActivity;->launched:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 95
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActivity;-><init>()V

    .line 107
    iput v2, p0, Lorg/linphone/VideoCallActivity;->DEVICE_LANDSCAPE:I

    .line 108
    const/4 v0, 0x2

    iput v0, p0, Lorg/linphone/VideoCallActivity;->DEVICE_PORTRAIT:I

    .line 110
    iput v1, p0, Lorg/linphone/VideoCallActivity;->orientationMode:I

    .line 111
    iput v1, p0, Lorg/linphone/VideoCallActivity;->EYE_MODE_ORIENTATION:I

    .line 112
    iput v2, p0, Lorg/linphone/VideoCallActivity;->ROAMSAVE_MODE_ORIENTATION:I

    .line 114
    iput v1, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    .line 123
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->refreshHandler:Landroid/os/Handler;

    .line 124
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->controlsHandler:Landroid/os/Handler;

    .line 126
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->intentReceiver:Lorg/linphone/VideoCallActivity$HeadSetReceiver;

    .line 135
    iput-boolean v2, p0, Lorg/linphone/VideoCallActivity;->needExtraRotation:Z

    .line 141
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    .line 149
    iput-boolean v1, p0, Lorg/linphone/VideoCallActivity;->showViewStat:Z

    .line 715
    new-instance v0, Lorg/linphone/VideoCallActivity$6;

    invoke-direct {v0, p0}, Lorg/linphone/VideoCallActivity$6;-><init>(Lorg/linphone/VideoCallActivity;)V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->runDialAccept:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$002(Lorg/linphone/VideoCallActivity;Landroid/view/SurfaceView;)Landroid/view/SurfaceView;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;
    .param p1, "x1"    # Landroid/view/SurfaceView;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/linphone/VideoCallActivity;->mVideoViewReady:Landroid/view/SurfaceView;

    return-object p1
.end method

.method static synthetic access$100(Lorg/linphone/VideoCallActivity;)Landroid/view/SurfaceView;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mVideoCaptureViewReady:Landroid/view/SurfaceView;

    return-object v0
.end method

.method static synthetic access$1000(Lorg/linphone/VideoCallActivity;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->refreshHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$102(Lorg/linphone/VideoCallActivity;Landroid/view/SurfaceView;)Landroid/view/SurfaceView;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;
    .param p1, "x1"    # Landroid/view/SurfaceView;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/linphone/VideoCallActivity;->mVideoCaptureViewReady:Landroid/view/SurfaceView;

    return-object p1
.end method

.method static synthetic access$1100(Lorg/linphone/VideoCallActivity;)Lorg/linphone/core/LinphoneCall;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    return-object v0
.end method

.method static synthetic access$1200(Lorg/linphone/VideoCallActivity;)Landroid/os/CountDownTimer;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->timer:Landroid/os/CountDownTimer;

    return-object v0
.end method

.method static synthetic access$1202(Lorg/linphone/VideoCallActivity;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;
    .param p1, "x1"    # Landroid/os/CountDownTimer;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/linphone/VideoCallActivity;->timer:Landroid/os/CountDownTimer;

    return-object p1
.end method

.method static synthetic access$1300(Lorg/linphone/VideoCallActivity;)Ljava/util/Timer;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mTimer:Ljava/util/Timer;

    return-object v0
.end method

.method static synthetic access$1400(Lorg/linphone/VideoCallActivity;)Ljava/util/TimerTask;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mTask:Ljava/util/TimerTask;

    return-object v0
.end method

.method static synthetic access$200(Lorg/linphone/VideoCallActivity;)I
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->getOrientationMode()I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lorg/linphone/VideoCallActivity;)I
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget v0, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    return v0
.end method

.method static synthetic access$302(Lorg/linphone/VideoCallActivity;I)I
    .locals 0
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;
    .param p1, "x1"    # I

    .prologue
    .line 95
    iput p1, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    return p1
.end method

.method static synthetic access$400(Lorg/linphone/VideoCallActivity;)Lcom/pccw/camera/ui/RotateDialogController;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mRotateDialog:Lcom/pccw/camera/ui/RotateDialogController;

    return-object v0
.end method

.method static synthetic access$600(Lorg/linphone/VideoCallActivity;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuRouteAudio:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$700(Lorg/linphone/VideoCallActivity;)Landroid/widget/RelativeLayout;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuSpeaker:Landroid/widget/RelativeLayout;

    return-object v0
.end method

.method static synthetic access$800(Lorg/linphone/VideoCallActivity;)Landroid/media/AudioManager;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$902(Lorg/linphone/VideoCallActivity;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/VideoCallActivity;
    .param p1, "x1"    # Ljava/lang/Runnable;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/linphone/VideoCallActivity;->mCallQualityUpdater:Ljava/lang/Runnable;

    return-object p1
.end method

.method private callRotation(II)V
    .locals 8
    .param p1, "orientation"    # I
    .param p2, "lastOrientation"    # I

    .prologue
    .line 939
    const/4 v3, 0x1

    .line 940
    .local v3, "pivotX":I
    const/4 v5, 0x1

    .line 941
    .local v5, "pivotY":I
    const/high16 v4, 0x3f000000    # 0.5f

    .line 942
    .local v4, "p_x":F
    const/high16 v6, 0x3f000000    # 0.5f

    .line 944
    .local v6, "p_y":F
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->muteButton:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 945
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->speakerButton:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 946
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->videoButton:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 947
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->callEndButton:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 948
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->MenuSwtichCamera:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 950
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuRouteAudio:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 951
    const-string/jumbo v0, "V"

    const-string/jumbo v1, "need Rotation, rotate button"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 952
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->routeButton:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 953
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeBluetooth:Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeSpeaker:Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeReceiver:Landroid/widget/ImageButton;

    if-eqz v0, :cond_0

    .line 954
    const-string/jumbo v0, "V"

    const-string/jumbo v1, "need Rotation, rotate images"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 955
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->routeBluetooth:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 956
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->routeReceiver:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 957
    iget-object v7, p0, Lorg/linphone/VideoCallActivity;->routeSpeaker:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    int-to-float v1, p2

    int-to-float v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v7, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 960
    :cond_0
    return-void
.end method

.method private disableCallStatsView()V
    .locals 1

    .prologue
    .line 1297
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 1298
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1300
    :cond_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mTask:Ljava/util/TimerTask;

    if-eqz v0, :cond_1

    .line 1301
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mTask:Ljava/util/TimerTask;

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 1303
    :cond_1
    return-void
.end method

.method private dpToPixels(I)I
    .locals 5
    .param p1, "dp"    # I

    .prologue
    .line 1068
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 1069
    .local v1, "r":Landroid/content/res/Resources;
    const/4 v2, 0x1

    int-to-float v3, p1

    .line 1070
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 1069
    invoke-static {v2, v3, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v0, v2

    .line 1071
    .local v0, "px":I
    return v0
.end method

.method private getOrientationMode()I
    .locals 1

    .prologue
    .line 507
    iget v0, p0, Lorg/linphone/VideoCallActivity;->orientationMode:I

    return v0
.end method

.method public static getVideoCallScreen()Lorg/linphone/VideoCallActivity;
    .locals 1

    .prologue
    .line 1094
    sget-object v0, Lorg/linphone/VideoCallActivity;->theVideoCall:Lorg/linphone/VideoCallActivity;

    if-nez v0, :cond_0

    .line 1095
    const/4 v0, 0x0

    .line 1097
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/linphone/VideoCallActivity;->theVideoCall:Lorg/linphone/VideoCallActivity;

    goto :goto_0
.end method

.method private initCallStatsRefresher()V
    .locals 6

    .prologue
    .line 1306
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mTimer:Ljava/util/Timer;

    .line 1307
    new-instance v0, Lorg/linphone/VideoCallActivity$13;

    invoke-direct {v0, p0}, Lorg/linphone/VideoCallActivity$13;-><init>(Lorg/linphone/VideoCallActivity;)V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mTask:Ljava/util/TimerTask;

    .line 1365
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mTimer:Ljava/util/Timer;

    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->mTask:Ljava/util/TimerTask;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x3e8

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 1366
    return-void
.end method

.method private resizeCapturePreview(Landroid/view/SurfaceView;Lorg/linphone/core/VideoSize;)V
    .locals 1
    .param p1, "sv"    # Landroid/view/SurfaceView;
    .param p2, "vs"    # Lorg/linphone/core/VideoSize;

    .prologue
    .line 698
    invoke-virtual {p0, p2}, Lorg/linphone/VideoCallActivity;->ratioWidthHeight(Lorg/linphone/core/VideoSize;)F

    move-result v0

    .line 713
    .local v0, "newRatio":F
    return-void
.end method

.method private sendStaticImage(Z)V
    .locals 3
    .param p1, "send"    # Z

    .prologue
    .line 686
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 687
    .local v0, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 688
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v2

    if-nez p1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-interface {v2, v1}, Lorg/linphone/core/LinphoneCall;->enableCamera(Z)V

    .line 690
    :cond_0
    return-void

    .line 688
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setListener()V
    .locals 1

    .prologue
    .line 415
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuMute:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 416
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuSpeaker:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 417
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuCallEnd:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 418
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuVideoOff:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 419
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuSwtichCamera:Landroid/widget/ImageButton;

    invoke-virtual {v0, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 420
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuRouteAudio:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 421
    return-void
.end method

.method private setOrientationMode(I)V
    .locals 0
    .param p1, "Mode"    # I

    .prologue
    .line 503
    iput p1, p0, Lorg/linphone/VideoCallActivity;->orientationMode:I

    .line 504
    return-void
.end method

.method private startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V
    .locals 3
    .param p1, "iv"    # Landroid/widget/ImageView;
    .param p2, "anim"    # Landroid/view/animation/RotateAnimation;

    .prologue
    const/4 v2, 0x1

    .line 963
    const-wide/16 v0, 0x1f4

    invoke-virtual {p2, v0, v1}, Landroid/view/animation/RotateAnimation;->setDuration(J)V

    .line 964
    invoke-virtual {p2, v2}, Landroid/view/animation/RotateAnimation;->setFillEnabled(Z)V

    .line 965
    invoke-virtual {p2, v2}, Landroid/view/animation/RotateAnimation;->setFillAfter(Z)V

    .line 966
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 967
    return-void
.end method


# virtual methods
.method public backToVoiceCallAudioRouteActions(Z)V
    .locals 2
    .param p1, "isInit"    # Z

    .prologue
    .line 465
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 466
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    .line 468
    :cond_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/VideoCallActivity$4;

    invoke-direct {v1, p0, p1}, Lorg/linphone/VideoCallActivity$4;-><init>(Lorg/linphone/VideoCallActivity;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 500
    return-void
.end method

.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 3
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    const/high16 v2, -0x80000000

    .line 1244
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    if-ne p2, v0, :cond_1

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-ne p3, v0, :cond_1

    .line 1245
    invoke-static {}, Lorg/linphone/BandwidthManager;->getInstance()Lorg/linphone/BandwidthManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/linphone/BandwidthManager;->setUserRestriction(Z)V

    .line 1246
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->resetCameraFromPreferences()V

    .line 1247
    invoke-virtual {p0, v2}, Lorg/linphone/VideoCallActivity;->setVolumeControlStream(I)V

    .line 1248
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->finish()V

    .line 1255
    :cond_0
    :goto_0
    return-void

    .line 1249
    :cond_1
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    if-ne p2, v0, :cond_0

    invoke-interface {p2}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1250
    invoke-virtual {p0, v2}, Lorg/linphone/VideoCallActivity;->setVolumeControlStream(I)V

    .line 1251
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->backToVoiceCallAudioRouteActions(Z)V

    .line 1252
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->finish()V

    goto :goto_0
.end method

.method public changeIconBackground()V
    .locals 7

    .prologue
    const v6, 0x7f020454

    const v5, 0x7f020446

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 862
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 876
    .local v0, "lc":Lorg/linphone/core/LinphoneCore;
    iget-object v4, p0, Lorg/linphone/VideoCallActivity;->MenuSpeaker:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v1}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v1

    if-eqz v1, :cond_2

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/widget/RelativeLayout;->setSelected(Z)V

    .line 877
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->speakerButton:Landroid/widget/ImageButton;

    iget-object v4, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v4

    if-eqz v4, :cond_0

    :cond_0
    invoke-virtual {v1, v6}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 880
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->MenuMute:Landroid/widget/RelativeLayout;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->isMicMuted()Z

    move-result v4

    if-eqz v4, :cond_3

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setSelected(Z)V

    .line 881
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->muteButton:Landroid/widget/ImageButton;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->isMicMuted()Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_1
    invoke-virtual {v1, v5}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 883
    return-void

    :cond_2
    move v1, v3

    .line 876
    goto :goto_0

    :cond_3
    move v2, v3

    .line 880
    goto :goto_1
.end method

.method public changeIconOrientation()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/16 v2, -0x5a

    .line 921
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->getOrientationMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 936
    :goto_0
    return-void

    .line 924
    :cond_0
    iget v0, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    packed-switch v0, :pswitch_data_0

    .line 934
    :goto_1
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->updateRoutingIcon()V

    goto :goto_0

    .line 926
    :pswitch_0
    invoke-direct {p0, v2, v3}, Lorg/linphone/VideoCallActivity;->callRotation(II)V

    goto :goto_1

    .line 930
    :pswitch_1
    invoke-direct {p0, v3, v2}, Lorg/linphone/VideoCallActivity;->callRotation(II)V

    goto :goto_1

    .line 924
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method disableKeyguard()V
    .locals 2

    .prologue
    .line 1162
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    if-nez v0, :cond_0

    .line 1163
    const-string/jumbo v0, "keyguard"

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    .line 1164
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mKeyguardManager:Landroid/app/KeyguardManager;

    const-string/jumbo v1, "RoamSave"

    invoke-virtual {v0, v1}, Landroid/app/KeyguardManager;->newKeyguardLock(Ljava/lang/String;)Landroid/app/KeyguardManager$KeyguardLock;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mKeyguardLock:Landroid/app/KeyguardManager$KeyguardLock;

    .line 1165
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/VideoCallActivity;->enabledKeyguard:Z

    .line 1167
    :cond_0
    iget-boolean v0, p0, Lorg/linphone/VideoCallActivity;->enabledKeyguard:Z

    if-eqz v0, :cond_1

    .line 1168
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mKeyguardLock:Landroid/app/KeyguardManager$KeyguardLock;

    invoke-virtual {v0}, Landroid/app/KeyguardManager$KeyguardLock;->disableKeyguard()V

    .line 1169
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/VideoCallActivity;->enabledKeyguard:Z

    .line 1172
    :cond_1
    return-void
.end method

.method fixZOrder(Landroid/view/SurfaceView;Landroid/view/SurfaceView;)V
    .locals 1
    .param p1, "video"    # Landroid/view/SurfaceView;
    .param p2, "preview"    # Landroid/view/SurfaceView;

    .prologue
    .line 552
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 553
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 554
    return-void
.end method

.method initDeviceOrientation()V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    const/16 v3, 0xb

    .line 512
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 513
    .local v0, "lc":Lorg/linphone/core/LinphoneCore;
    const/4 v1, 0x2

    iput v1, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    .line 514
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->getOrientationMode()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 528
    invoke-static {v3}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 529
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->mRotateDialog:Lcom/pccw/camera/ui/RotateDialogController;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/pccw/camera/ui/RotateDialogController;->setOrientation(I)V

    .line 548
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->changeIconOrientation()V

    .line 549
    return-void

    .line 545
    :cond_1
    invoke-static {v3}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 546
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->mRotateDialog:Lcom/pccw/camera/ui/RotateDialogController;

    const/16 v2, 0x5a

    invoke-virtual {v1, v2}, Lcom/pccw/camera/ui/RotateDialogController;->setOrientation(I)V

    goto :goto_0
.end method

.method public onButtonClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 726
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v2, 0x7f020454

    const v1, 0x7f020446

    .line 730
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v8

    .line 731
    .local v8, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 797
    :goto_0
    :pswitch_0
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->changeIconBackground()V

    .line 798
    return-void

    .line 733
    :pswitch_1
    invoke-interface {v8}, Lorg/linphone/core/LinphoneCore;->isMicMuted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 734
    const/4 v0, 0x0

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneCore;->muteMic(Z)V

    .line 735
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->muteButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0

    .line 737
    :cond_0
    const/4 v0, 0x1

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneCore;->muteMic(Z)V

    .line 738
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->muteButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0

    .line 742
    :pswitch_2
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 743
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->routeAudioToReceiver()V

    .line 744
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->speakerButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0

    .line 746
    :cond_1
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->routeAudioToSpeaker()V

    .line 747
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->speakerButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0

    .line 751
    :pswitch_3
    invoke-interface {v8}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 752
    invoke-interface {v8}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneCore;->terminateCall(Lorg/linphone/core/LinphoneCall;)V

    .line 755
    :cond_2
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->finish()V

    goto :goto_0

    .line 758
    :pswitch_4
    const/16 v0, 0xb

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 759
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mRotateDialog:Lcom/pccw/camera/ui/RotateDialogController;

    const v1, 0x7f07006a

    invoke-virtual {p0, v1}, Lorg/linphone/VideoCallActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f070109

    .line 760
    invoke-virtual {p0, v2}, Lorg/linphone/VideoCallActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f07010a

    .line 761
    invoke-virtual {p0, v3}, Lorg/linphone/VideoCallActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const v5, 0x7f070108

    .line 762
    invoke-virtual {p0, v5}, Lorg/linphone/VideoCallActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/linphone/VideoCallActivity;->runDialAccept:Ljava/lang/Runnable;

    .line 759
    invoke-virtual/range {v0 .. v6}, Lcom/pccw/camera/ui/RotateDialogController;->showAlertDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;Ljava/lang/Runnable;)V

    goto :goto_0

    .line 764
    :cond_3
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/VideoCallActivity$7;

    invoke-direct {v1, p0}, Lorg/linphone/VideoCallActivity$7;-><init>(Lorg/linphone/VideoCallActivity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 782
    :pswitch_5
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->getVideoDevice()I

    move-result v7

    .line 783
    .local v7, "id":I
    add-int/lit8 v0, v7, 0x1

    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;->retrieveCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-result-object v1

    array-length v1, v1

    rem-int v7, v0, v1

    .line 784
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    invoke-interface {v0, v7}, Lorg/linphone/core/LinphoneCore;->setVideoDevice(I)V

    .line 785
    invoke-static {}, Lorg/linphone/CallManager;->getInstance()Lorg/linphone/CallManager;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/CallManager;->updateCall()V

    .line 789
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mVideoCaptureViewReady:Landroid/view/SurfaceView;

    if-eqz v0, :cond_4

    .line 790
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->mVideoCaptureViewReady:Landroid/view/SurfaceView;

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setPreviewWindow(Ljava/lang/Object;)V

    .line 791
    :cond_4
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->initDeviceOrientation()V

    goto/16 :goto_0

    .line 794
    .end local v7    # "id":I
    :pswitch_6
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->popupAudioRoutingWindow()V

    goto/16 :goto_0

    .line 731
    :pswitch_data_0
    .packed-switch 0x7f0e01f8
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_6
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 1090
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1091
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 14
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 152
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 163
    sput-object p0, Lorg/linphone/VideoCallActivity;->theVideoCall:Lorg/linphone/VideoCallActivity;

    .line 164
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v9

    .line 168
    .local v9, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldUseOrientationMode(Ljava/lang/String;)I

    move-result v10

    .line 169
    .local v10, "orientation":I
    invoke-direct {p0, v10}, Lorg/linphone/VideoCallActivity;->setOrientationMode(I)V

    .line 171
    const/4 v0, 0x1

    if-ne v10, v0, :cond_0

    .line 172
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/VideoCallActivity;->needExtraRotation:Z

    .line 174
    :cond_0
    const-string/jumbo v0, "audio"

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 176
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->resetCameraFromPreferences()V

    .line 178
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->getOrientationMode()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    .line 179
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->setRequestedOrientation(I)V

    .line 183
    :goto_0
    const v0, 0x7f040080

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->setContentView(I)V

    .line 184
    const v0, 0x7f0e0201

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuMute:Landroid/widget/RelativeLayout;

    .line 185
    const v0, 0x7f0e01fd

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuSpeaker:Landroid/widget/RelativeLayout;

    .line 186
    const v0, 0x7f0e01fb

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuCallEnd:Landroid/widget/RelativeLayout;

    .line 187
    const v0, 0x7f0e0203

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuVideoOff:Landroid/widget/RelativeLayout;

    .line 188
    const v0, 0x7f0e01ff

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuRouteAudio:Landroid/widget/RelativeLayout;

    .line 189
    const v0, 0x7f0e01f8

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuSwtichCamera:Landroid/widget/ImageButton;

    .line 191
    const v0, 0x7f0e0202

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->muteButton:Landroid/widget/ImageButton;

    .line 192
    const v0, 0x7f0e01fe

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->speakerButton:Landroid/widget/ImageButton;

    .line 193
    const v0, 0x7f0e0204

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->videoButton:Landroid/widget/ImageButton;

    .line 194
    const v0, 0x7f0e0200

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->routeButton:Landroid/widget/ImageButton;

    .line 195
    const v0, 0x7f0e01fc

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->callEndButton:Landroid/widget/ImageButton;

    .line 197
    iget-boolean v0, p0, Lorg/linphone/VideoCallActivity;->needExtraRotation:Z

    if-eqz v0, :cond_1

    .line 198
    iget-object v13, p0, Lorg/linphone/VideoCallActivity;->routeButton:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    const/4 v1, 0x0

    const/high16 v2, -0x3d4c0000    # -90.0f

    const/4 v3, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v5, 0x1

    const/high16 v6, 0x3f000000    # 0.5f

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v13, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 200
    :cond_1
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->setListener()V

    .line 201
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->refreshAudioRouteActions(Z)V

    .line 203
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    .line 204
    invoke-interface {v9}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v0

    .line 203
    invoke-static {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldEnableVideoButton(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 205
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuVideoOff:Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setEnabled(Z)V

    .line 208
    :cond_2
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->videoButton:Landroid/widget/ImageButton;

    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->MenuVideoOff:Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_7

    const v0, 0x7f020463

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 210
    const/16 v0, 0xb

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 211
    new-instance v0, Lcom/pccw/camera/ui/RotateDialogController;

    const v1, 0x7f040073

    invoke-direct {v0, p0, v1}, Lcom/pccw/camera/ui/RotateDialogController;-><init>(Landroid/app/Activity;I)V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mRotateDialog:Lcom/pccw/camera/ui/RotateDialogController;

    .line 215
    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->setVolumeControlStream(I)V

    .line 217
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->initDeviceOrientation()V

    .line 219
    const v0, 0x7f0e01f6

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/view/SurfaceView;

    .line 224
    .local v12, "videoView":Landroid/view/SurfaceView;
    const v0, 0x7f0e01f7

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/view/SurfaceView;

    .line 225
    .local v7, "captureView":Landroid/view/SurfaceView;
    invoke-virtual {v7}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 229
    invoke-static {}, Lorg/linphone/core/AndroidCameraRecordManager;->getInstance()Lorg/linphone/core/AndroidCameraRecordManager;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->recordManager:Lorg/linphone/core/AndroidCameraRecordManager;

    .line 233
    invoke-virtual {p0, v12, v7}, Lorg/linphone/VideoCallActivity;->fixZOrder(Landroid/view/SurfaceView;Landroid/view/SurfaceView;)V

    .line 235
    new-instance v0, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-direct {v0, v12, v7}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;-><init>(Landroid/view/SurfaceView;Landroid/view/SurfaceView;)V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    .line 236
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    new-instance v1, Lorg/linphone/VideoCallActivity$1;

    invoke-direct {v1, p0, v9}, Lorg/linphone/VideoCallActivity$1;-><init>(Lorg/linphone/VideoCallActivity;Lorg/linphone/core/LinphoneCore;)V

    invoke-virtual {v0, v1}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->setListener(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl$VideoWindowListener;)V

    .line 258
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-virtual {v0}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->init()V

    .line 260
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    .line 269
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    if-eqz v0, :cond_5

    .line 275
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->cameraEnabled()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 276
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/linphone/VideoCallActivity;->sendStaticImage(Z)V

    .line 279
    :cond_4
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->cameraEnabled()Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->updatePreview(Z)V

    .line 282
    :cond_5
    const-string/jumbo v0, "power"

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/os/PowerManager;

    .line 283
    .local v11, "pm":Landroid/os/PowerManager;
    const v0, 0x2000000a

    const-string/jumbo v1, "VideoCall"

    invoke-virtual {v11, v0, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 285
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 287
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x400000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 288
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x80000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 292
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x80

    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->setFlags(II)V

    .line 337
    new-instance v0, Lorg/linphone/VideoCallActivity$2;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p0, v1}, Lorg/linphone/VideoCallActivity$2;-><init>(Lorg/linphone/VideoCallActivity;Landroid/content/Context;I)V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mOrientationEventListener:Landroid/view/OrientationEventListener;

    .line 399
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mOrientationEventListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 401
    new-instance v0, Lorg/linphone/VideoCallActivity$HeadSetReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/linphone/VideoCallActivity$HeadSetReceiver;-><init>(Lorg/linphone/VideoCallActivity;Lorg/linphone/VideoCallActivity$1;)V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->intentReceiver:Lorg/linphone/VideoCallActivity$HeadSetReceiver;

    .line 402
    new-instance v8, Landroid/content/IntentFilter;

    const-string/jumbo v0, "android.intent.action.HEADSET_PLUG"

    invoke-direct {v8, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 403
    .local v8, "intentFilter":Landroid/content/IntentFilter;
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->intentReceiver:Lorg/linphone/VideoCallActivity$HeadSetReceiver;

    invoke-virtual {p0, v0, v8}, Lorg/linphone/VideoCallActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 405
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-interface {v9, v0, v1}, Lorg/linphone/core/LinphoneCore;->setVideoPolicy(ZZ)V

    .line 409
    const v0, 0x7f0e01f9

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->viewStat:Landroid/widget/LinearLayout;

    .line 410
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->viewStat:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 411
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/VideoCallActivity;->showViewStat:Z

    .line 412
    return-void

    .line 181
    .end local v7    # "captureView":Landroid/view/SurfaceView;
    .end local v8    # "intentFilter":Landroid/content/IntentFilter;
    .end local v11    # "pm":Landroid/os/PowerManager;
    .end local v12    # "videoView":Landroid/view/SurfaceView;
    :cond_6
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->setRequestedOrientation(I)V

    goto/16 :goto_0

    .line 208
    :cond_7
    const v0, 0x7f020461

    goto/16 :goto_1
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 4
    .param p1, "id"    # I

    .prologue
    .line 1188
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1189
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    packed-switch p1, :pswitch_data_0

    .line 1213
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

    .line 1191
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1192
    .restart local v0    # "builder":Landroid/app/AlertDialog$Builder;
    const v1, 0x7f070109

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1193
    const v1, 0x7f07010a

    new-instance v2, Lorg/linphone/VideoCallActivity$11;

    invoke-direct {v2, p0, p1}, Lorg/linphone/VideoCallActivity$11;-><init>(Lorg/linphone/VideoCallActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1200
    const v1, 0x7f070108

    new-instance v2, Lorg/linphone/VideoCallActivity$12;

    invoke-direct {v2, p0, p1}, Lorg/linphone/VideoCallActivity$12;-><init>(Lorg/linphone/VideoCallActivity;I)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1211
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    return-object v1

    .line 1189
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1259
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    .line 1264
    .local v0, "result":Z
    return v0
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1005
    sput-boolean v2, Lorg/linphone/VideoCallActivity;->launched:Z

    .line 1006
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    if-eqz v1, :cond_0

    .line 1009
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-virtual {v1}, Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;->release()V

    .line 1011
    :cond_0
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->mOrientationEventListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v1}, Landroid/view/OrientationEventListener;->disable()V

    .line 1012
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->intentReceiver:Lorg/linphone/VideoCallActivity$HeadSetReceiver;

    if-eqz v1, :cond_1

    .line 1013
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->intentReceiver:Lorg/linphone/VideoCallActivity$HeadSetReceiver;

    invoke-virtual {p0, v1}, Lorg/linphone/VideoCallActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1014
    :cond_1
    const/4 v1, 0x0

    sput-object v1, Lorg/linphone/VideoCallActivity;->theVideoCall:Lorg/linphone/VideoCallActivity;

    .line 1015
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 1016
    .local v0, "lLinphoneCore":Lorg/linphone/core/LinphoneCore;
    invoke-interface {v0, v2, v2}, Lorg/linphone/core/LinphoneCore;->setVideoPolicy(ZZ)V

    .line 1020
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onDestroy()V

    .line 1021
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 7
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/16 v6, 0x18

    const/4 v3, 0x1

    .line 975
    const/4 v2, 0x4

    if-ne p1, v2, :cond_1

    .line 976
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    .line 977
    .local v0, "lc":Lorg/linphone/core/LinphoneCore;
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    .line 978
    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v2

    .line 977
    invoke-static {v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldEnableVideoButton(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 980
    iget-object v2, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v2}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v1

    .line 981
    .local v1, "params":Lorg/linphone/core/LinphoneCallParams;
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lorg/linphone/core/LinphoneCallParams;->setVideoEnabled(Z)V

    .line 982
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    iget-object v4, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v2, v4, v1}, Lorg/linphone/core/LinphoneCore;->updateCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)I

    .line 993
    .end local v0    # "lc":Lorg/linphone/core/LinphoneCore;
    .end local v1    # "params":Lorg/linphone/core/LinphoneCallParams;
    :cond_0
    :goto_0
    return v3

    .line 985
    :cond_1
    if-eq p1, v6, :cond_2

    const/16 v2, 0x19

    if-ne p1, v2, :cond_5

    .line 986
    :cond_2
    iget-object v2, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v2}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 987
    iget-object v4, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    const/4 v5, 0x6

    if-ne p1, v6, :cond_4

    move v2, v3

    :goto_1
    invoke-virtual {v4, v5, v2, v3}, Landroid/media/AudioManager;->adjustStreamVolume(III)V

    .line 991
    :cond_3
    iget-object v2, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v2}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-super {p0, p1, p2}, Lcom/pccw/mobile/sip/BaseActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_0

    .line 987
    :cond_4
    const/4 v2, -0x1

    goto :goto_1

    .line 993
    :cond_5
    invoke-super {p0, p1, p2}, Lcom/pccw/mobile/sip/BaseActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v3

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v3, 0x0

    .line 1269
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    .line 1270
    .local v0, "result":Z
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 1290
    :goto_0
    return v0

    .line 1272
    :pswitch_0
    iget-boolean v1, p0, Lorg/linphone/VideoCallActivity;->showViewStat:Z

    if-eqz v1, :cond_0

    .line 1274
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->viewStat:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1275
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->disableCallStatsView()V

    .line 1276
    iput-boolean v3, p0, Lorg/linphone/VideoCallActivity;->showViewStat:Z

    goto :goto_0

    .line 1279
    :cond_0
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->viewStat:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1280
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->initCallStatsRefresher()V

    .line 1281
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/linphone/VideoCallActivity;->showViewStat:Z

    goto :goto_0

    .line 1270
    :pswitch_data_0
    .packed-switch 0x3e9
        :pswitch_0
    .end packed-switch
.end method

.method protected onPause()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 1027
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1028
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1033
    :cond_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    if-eqz v0, :cond_1

    .line 1034
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCall;->enableCamera(Z)V

    .line 1036
    :cond_1
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1037
    iput-object v3, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    .line 1039
    :cond_2
    sput-boolean v1, Lorg/linphone/VideoCallActivity;->launched:Z

    .line 1040
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    monitor-enter v1

    .line 1045
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->setVideoWindow(Ljava/lang/Object;)V

    .line 1046
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1048
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mCallQualityUpdater:Ljava/lang/Runnable;

    if-eqz v0, :cond_3

    .line 1049
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->refreshHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->mCallQualityUpdater:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1050
    iput-object v3, p0, Lorg/linphone/VideoCallActivity;->mCallQualityUpdater:Ljava/lang/Runnable;

    .line 1052
    :cond_3
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mControls:Ljava/lang/Runnable;

    if-eqz v0, :cond_4

    .line 1053
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->controlsHandler:Landroid/os/Handler;

    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->mControls:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1054
    iput-object v3, p0, Lorg/linphone/VideoCallActivity;->mControls:Ljava/lang/Runnable;

    .line 1057
    :cond_4
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1058
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 1059
    :cond_5
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onPause()V

    .line 1060
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mVideoViewReady:Landroid/view/SurfaceView;

    if-eqz v0, :cond_6

    .line 1061
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mVideoViewReady:Landroid/view/SurfaceView;

    check-cast v0, Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->onPause()V

    .line 1063
    :cond_6
    const/16 v0, 0xd

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkStrictlyBelow(I)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1064
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->reenableKeyguard()V

    .line 1065
    :cond_7
    return-void

    .line 1046
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected onResume()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 587
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v0

    if-nez v0, :cond_0

    .line 588
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->finish()V

    .line 589
    :cond_0
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->changeIconBackground()V

    .line 590
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->changeIconOrientation()V

    .line 592
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onResume()V

    .line 594
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mVideoViewReady:Landroid/view/SurfaceView;

    if-eqz v0, :cond_1

    .line 595
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mVideoViewReady:Landroid/view/SurfaceView;

    check-cast v0, Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->onResume()V

    .line 596
    :cond_1
    iget-object v1, p0, Lorg/linphone/VideoCallActivity;->androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    monitor-enter v1

    .line 597
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    iget-object v2, p0, Lorg/linphone/VideoCallActivity;->androidVideoWindowImpl:Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->setVideoWindow(Ljava/lang/Object;)V

    .line 599
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 600
    sput-boolean v4, Lorg/linphone/VideoCallActivity;->launched:Z

    .line 603
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->refreshHandler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/VideoCallActivity$5;

    invoke-direct {v1, p0}, Lorg/linphone/VideoCallActivity$5;-><init>(Lorg/linphone/VideoCallActivity;)V

    iput-object v1, p0, Lorg/linphone/VideoCallActivity;->mCallQualityUpdater:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 629
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    if-eqz v0, :cond_2

    .line 630
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v0, v4}, Lorg/linphone/core/LinphoneCall;->enableCamera(Z)V

    .line 631
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->videoCall:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->cameraEnabled()Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->updatePreview(Z)V

    .line 640
    :cond_2
    return-void

    .line 599
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 678
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onStart()V

    .line 679
    const/16 v0, 0xd

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkStrictlyBelow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 680
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->disableKeyguard()V

    .line 681
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 998
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onStop()V

    .line 999
    const/16 v0, 0xd

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkStrictlyBelow(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1000
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->reenableKeyguard()V

    .line 1001
    :cond_0
    return-void
.end method

.method protected popupAudioRoutingWindow()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const/4 v1, 0x0

    const/high16 v2, -0x3d4c0000    # -90.0f

    const v11, 0x7f0e01ff

    const/4 v10, 0x1

    .line 801
    invoke-virtual {p0}, Lorg/linphone/VideoCallActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v5, 0x7f04002a

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6, v12}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 804
    .local v8, "popupWindow_view":Landroid/view/View;
    new-instance v7, Landroid/widget/PopupWindow;

    const/4 v0, -0x2

    const/4 v5, -0x2

    invoke-direct {v7, v8, v0, v5, v10}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 807
    .local v7, "popupWindow":Landroid/widget/PopupWindow;
    const v0, 0x7f0e00bf

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->routeBluetooth:Landroid/widget/ImageButton;

    .line 808
    const v0, 0x7f0e00c1

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->routeSpeaker:Landroid/widget/ImageButton;

    .line 809
    const v0, 0x7f0e00c0

    invoke-virtual {v8, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->routeReceiver:Landroid/widget/ImageButton;

    .line 811
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeBluetooth:Landroid/widget/ImageButton;

    new-instance v5, Lorg/linphone/VideoCallActivity$8;

    invoke-direct {v5, p0, v7}, Lorg/linphone/VideoCallActivity$8;-><init>(Lorg/linphone/VideoCallActivity;Landroid/widget/PopupWindow;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 818
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeSpeaker:Landroid/widget/ImageButton;

    new-instance v5, Lorg/linphone/VideoCallActivity$9;

    invoke-direct {v5, p0, v7}, Lorg/linphone/VideoCallActivity$9;-><init>(Lorg/linphone/VideoCallActivity;Landroid/widget/PopupWindow;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 825
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeReceiver:Landroid/widget/ImageButton;

    new-instance v5, Lorg/linphone/VideoCallActivity$10;

    invoke-direct {v5, p0, v7}, Lorg/linphone/VideoCallActivity$10;-><init>(Lorg/linphone/VideoCallActivity;Landroid/widget/PopupWindow;)V

    invoke-virtual {v0, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 833
    iget-boolean v0, p0, Lorg/linphone/VideoCallActivity;->needExtraRotation:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    const/4 v5, 0x2

    if-ne v0, v5, :cond_0

    .line 836
    const/4 v3, 0x1

    .line 837
    .local v3, "type":I
    const/high16 v4, 0x3f000000    # 0.5f

    .line 839
    .local v4, "pivot":F
    iget-object v9, p0, Lorg/linphone/VideoCallActivity;->routeBluetooth:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    move v5, v3

    move v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v9, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 840
    iget-object v9, p0, Lorg/linphone/VideoCallActivity;->routeReceiver:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    move v5, v3

    move v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v9, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 841
    iget-object v9, p0, Lorg/linphone/VideoCallActivity;->routeSpeaker:Landroid/widget/ImageButton;

    new-instance v0, Landroid/view/animation/RotateAnimation;

    move v5, v3

    move v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    invoke-direct {p0, v9, v0}, Lorg/linphone/VideoCallActivity;->startAnimation(Landroid/widget/ImageView;Landroid/view/animation/RotateAnimation;)V

    .line 844
    .end local v3    # "type":I
    .end local v4    # "pivot":F
    :cond_0
    invoke-virtual {v7}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v12, v12}, Landroid/view/View;->measure(II)V

    .line 845
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v7, v0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 846
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->getOrientationMode()I

    move-result v0

    if-ne v0, v10, :cond_1

    .line 847
    invoke-virtual {p0, v11}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 848
    invoke-virtual {p0, v11}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    .line 849
    invoke-virtual {p0, v11}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 850
    invoke-virtual {v7}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v2, v5

    neg-int v2, v2

    .line 847
    invoke-virtual {v7, v0, v1, v2}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 856
    :goto_0
    invoke-virtual {v7, v10}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 857
    invoke-virtual {v7, v10}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 858
    invoke-virtual {v7, v10}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 859
    return-void

    .line 852
    :cond_1
    invoke-virtual {p0, v11}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 853
    invoke-virtual {v7}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    neg-int v1, v1

    .line 854
    invoke-virtual {v7}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    neg-int v2, v2

    .line 852
    invoke-virtual {v7, v0, v1, v2}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    goto :goto_0
.end method

.method public ratioWidthHeight(Lorg/linphone/core/VideoSize;)F
    .locals 2
    .param p1, "vs"    # Lorg/linphone/core/VideoSize;

    .prologue
    .line 1102
    iget v0, p1, Lorg/linphone/core/VideoSize;->width:I

    int-to-float v0, v0

    iget v1, p1, Lorg/linphone/core/VideoSize;->height:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method reenableKeyguard()V
    .locals 2

    .prologue
    .line 1175
    iget-boolean v0, p0, Lorg/linphone/VideoCallActivity;->enabledKeyguard:Z

    if-nez v0, :cond_1

    .line 1177
    :try_start_0
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    .line 1178
    const-wide/16 v0, 0x3e8

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1181
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mKeyguardLock:Landroid/app/KeyguardManager$KeyguardLock;

    invoke-virtual {v0}, Landroid/app/KeyguardManager$KeyguardLock;->reenableKeyguard()V

    .line 1182
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/VideoCallActivity;->enabledKeyguard:Z

    .line 1184
    :cond_1
    return-void

    .line 1179
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public refreshAudioRouteActions(Z)V
    .locals 2
    .param p1, "isInit"    # Z

    .prologue
    .line 424
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 425
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    .line 427
    :cond_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/VideoCallActivity$3;

    invoke-direct {v1, p0, p1}, Lorg/linphone/VideoCallActivity$3;-><init>(Lorg/linphone/VideoCallActivity;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 462
    return-void
.end method

.method public resetCameraFromPreferences()V
    .locals 7

    .prologue
    .line 1150
    const/4 v3, 0x1

    .line 1152
    .local v3, "useFrontCam":Z
    const/4 v1, 0x0

    .line 1153
    .local v1, "camId":I
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;->retrieveCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-result-object v2

    .line 1154
    .local v2, "cameras":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    array-length v5, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v0, v2, v4

    .line 1155
    .local v0, "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    iget-boolean v6, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    if-ne v6, v3, :cond_0

    .line 1156
    iget v1, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->id:I

    .line 1154
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1158
    .end local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_1
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v4

    invoke-interface {v4, v1}, Lorg/linphone/core/LinphoneCore;->setVideoDevice(I)V

    .line 1159
    return-void
.end method

.method public routeAudioToBluetooth()V
    .locals 2

    .prologue
    .line 1106
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->routeAudioToBluetooth()Z

    .line 1107
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeButton:Landroid/widget/ImageButton;

    const v1, 0x7f020429

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 1108
    return-void
.end method

.method public routeAudioToReceiver()V
    .locals 2

    .prologue
    .line 1145
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->routeAudioToReceiver()V

    .line 1146
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeButton:Landroid/widget/ImageButton;

    const v1, 0x7f02044d

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 1147
    return-void
.end method

.method public routeAudioToSpeaker()V
    .locals 2

    .prologue
    .line 1121
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->routeAudioToSpeaker()V

    .line 1122
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->routeButton:Landroid/widget/ImageButton;

    const v1, 0x7f020452

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 1123
    return-void
.end method

.method updatePreview(Z)V
    .locals 2
    .param p1, "cameraCaptureEnabled"    # Z

    .prologue
    const v1, 0x7f0e01f7

    .line 557
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/VideoCallActivity;->mVideoCaptureViewReady:Landroid/view/SurfaceView;

    .line 558
    if-eqz p1, :cond_0

    .line 560
    invoke-virtual {p0, v1}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 565
    :goto_0
    const v0, 0x7f0e01f5

    invoke-virtual {p0, v0}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 566
    return-void

    .line 562
    :cond_0
    invoke-virtual {p0, v1}, Lorg/linphone/VideoCallActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public updateRoutingIcon()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 889
    :try_start_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 891
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->getOrientationMode()I

    move-result v0

    if-eq v0, v1, :cond_0

    iget v0, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    if-ne v0, v1, :cond_1

    .line 893
    :cond_0
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->speakerButton:Landroid/widget/ImageButton;

    const v1, 0x7f020454

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    .line 918
    :cond_1
    :goto_0
    return-void

    .line 898
    :cond_2
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    iget-boolean v0, v0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    if-eqz v0, :cond_4

    .line 900
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->getOrientationMode()I

    move-result v0

    if-eq v0, v1, :cond_3

    iget v0, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    if-ne v0, v1, :cond_1

    .line 902
    :cond_3
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->speakerButton:Landroid/widget/ImageButton;

    const v1, 0x7f020429

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V

    goto :goto_0

    .line 914
    :catch_0
    move-exception v0

    goto :goto_0

    .line 907
    :cond_4
    invoke-direct {p0}, Lorg/linphone/VideoCallActivity;->getOrientationMode()I

    move-result v0

    if-eq v0, v1, :cond_5

    iget v0, p0, Lorg/linphone/VideoCallActivity;->deviceOrientation:I

    if-ne v0, v1, :cond_1

    .line 909
    :cond_5
    iget-object v0, p0, Lorg/linphone/VideoCallActivity;->speakerButton:Landroid/widget/ImageButton;

    const v1, 0x7f020454

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setImageResource(I)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method
