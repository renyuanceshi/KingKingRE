.class public Lorg/linphone/DailPadActivity;
.super Landroid/support/v4/app/Fragment;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnKeyListener;
.implements Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$KKDialogResponses;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;,
        Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;,
        Lorg/linphone/DailPadActivity$RoamSaveButtonListener;
    }
.end annotation


# static fields
.field private static final DIAL_TONE_STREAM_TYPE:I = 0x3

.field private static final NEVER_FACEBOOK_SHARE:Ljava/lang/String; = "neverShareToFacebook"

.field private static final SHARE_PREF_TAG:Ljava/lang/String; = "FacebookShare"

.field private static final SHOW_IDD_CHARGE_MESSAGE:Ljava/lang/String; = "SHOW_IDD_CHARGE_MESSAGE"

.field private static final TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field private static final TONE_LENGTH_MS:I = 0x96

.field private static final TONE_RELATIVE_VOLUME:I = 0x50

.field private static final VIBRATE_NO_REPEAT:I = -0x1

.field private static final promptAddSSIDDialog:I = 0x2

.field private static final promptNoWifiDialog:I = 0x1

.field private static final promptReinviteWithAudioId:I

.field public static shouldCleanCallCount:Z

.field public static shouldRunFacebookShareChecking:Z

.field public static shouldShowReinviteWithAudioDialog:Z

.field private static theDailPad:Lorg/linphone/DailPadActivity;


# instance fields
.field activity:Landroid/app/Activity;

.field ctx:Landroid/content/Context;

.field private dialOutNumber:Ljava/lang/String;

.field private fragmentManager:Landroid/support/v4/app/FragmentManager;

.field handler:Landroid/os/Handler;

.field private isWaitingWifiFinish:Z

.field private mBannerText:Landroid/widget/TextView;

.field private mConnectionChangeReceiver:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

.field private mDTMFToneEnabled:Z

.field private mDelete:Landroid/widget/ImageButton;

.field private mDialButton:Landroid/widget/ImageButton;

.field private mDigitsBackground:Landroid/graphics/drawable/Drawable;

.field private mDigitsEmptyBackground:Landroid/graphics/drawable/Drawable;

.field private mDisplayName:Ljava/lang/String;

.field private mPreCallQILayout:Landroid/widget/LinearLayout;

.field private mPreCallQIStatus:Landroid/widget/TextView;

.field private mPref:Landroid/content/SharedPreferences;

.field private mRoamSaveButton:Landroid/widget/CheckBox;

.field private mRoamSaveButtonListener:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

.field private mToneGenerator:Landroid/media/ToneGenerator;

.field private mToneGeneratorLock:Ljava/lang/Object;

.field private mVibrateOn:Z

.field private mVibratePattern:[J

.field private mVibrator:Landroid/os/Vibrator;

.field private mVideocallButton:Landroid/widget/ImageButton;

.field private mVoicemailButton:Landroid/widget/ImageButton;

.field private m_AlertDlg:Landroid/app/AlertDialog;

.field private preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;

.field preCallQIHandler:Landroid/os/Handler;

.field private prepaidTopUpReminder:Landroid/app/AlertDialog;

.field private sip_uri_box:Landroid/widget/EditText;

.field private timer:Landroid/os/CountDownTimer;

.field v:Landroid/view/View;

.field private waitingWifiThr:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 156
    sput-boolean v0, Lorg/linphone/DailPadActivity;->shouldShowReinviteWithAudioDialog:Z

    .line 157
    sput-boolean v0, Lorg/linphone/DailPadActivity;->shouldRunFacebookShareChecking:Z

    .line 158
    sput-boolean v0, Lorg/linphone/DailPadActivity;->shouldCleanCallCount:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 94
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 123
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->mToneGeneratorLock:Ljava/lang/Object;

    .line 154
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->mConnectionChangeReceiver:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    .line 162
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->dialOutNumber:Ljava/lang/String;

    .line 169
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/DailPadActivity;->isWaitingWifiFinish:Z

    .line 171
    new-instance v0, Lorg/linphone/DailPadActivity$1;

    invoke-direct {v0, p0}, Lorg/linphone/DailPadActivity$1;-><init>(Lorg/linphone/DailPadActivity;)V

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->handler:Landroid/os/Handler;

    .line 185
    new-instance v0, Lorg/linphone/DailPadActivity$2;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/linphone/DailPadActivity$2;-><init>(Lorg/linphone/DailPadActivity;Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->preCallQIHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lorg/linphone/DailPadActivity;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mToneGeneratorLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lorg/linphone/DailPadActivity;)Landroid/media/ToneGenerator;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mToneGenerator:Landroid/media/ToneGenerator;

    return-object v0
.end method

.method static synthetic access$1000(Lorg/linphone/DailPadActivity;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z

    .prologue
    .line 94
    invoke-direct {p0, p1, p2}, Lorg/linphone/DailPadActivity;->performCallWithAddress(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$1100(Lorg/linphone/DailPadActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonClickable(Z)V

    return-void
.end method

.method static synthetic access$1200(Lorg/linphone/DailPadActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1300(Lorg/linphone/DailPadActivity;)Ljava/lang/Thread;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->waitingWifiThr:Ljava/lang/Thread;

    return-object v0
.end method

.method static synthetic access$1302(Lorg/linphone/DailPadActivity;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/linphone/DailPadActivity;->waitingWifiThr:Ljava/lang/Thread;

    return-object p1
.end method

.method static synthetic access$1400(Lorg/linphone/DailPadActivity;)Z
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-boolean v0, p0, Lorg/linphone/DailPadActivity;->isWaitingWifiFinish:Z

    return v0
.end method

.method static synthetic access$1402(Lorg/linphone/DailPadActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 94
    iput-boolean p1, p0, Lorg/linphone/DailPadActivity;->isWaitingWifiFinish:Z

    return p1
.end method

.method static synthetic access$1500(Lorg/linphone/DailPadActivity;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQILayout:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$1600(Lorg/linphone/DailPadActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonEnable(Z)V

    return-void
.end method

.method static synthetic access$1700(Lorg/linphone/DailPadActivity;)Landroid/app/AlertDialog;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->prepaidTopUpReminder:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$1702(Lorg/linphone/DailPadActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # Landroid/app/AlertDialog;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/linphone/DailPadActivity;->prepaidTopUpReminder:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1800(Lorg/linphone/DailPadActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->stopPreCallQI()V

    return-void
.end method

.method static synthetic access$1900(Lorg/linphone/DailPadActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->startPreCallQI()V

    return-void
.end method

.method static synthetic access$200(Lorg/linphone/DailPadActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lorg/linphone/DailPadActivity;->updatePreCallQIStatus(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2000(Lorg/linphone/DailPadActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonReAutoconnecting()V

    return-void
.end method

.method static synthetic access$2100(Lorg/linphone/DailPadActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->dialOutNumber:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lorg/linphone/DailPadActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$500(Lorg/linphone/DailPadActivity;)Z
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->isWifiAvailable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lorg/linphone/DailPadActivity;)Landroid/support/v4/app/FragmentManager;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->fragmentManager:Landroid/support/v4/app/FragmentManager;

    return-object v0
.end method

.method static synthetic access$700(Lorg/linphone/DailPadActivity;I)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # I

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lorg/linphone/DailPadActivity;->showDialog(I)V

    return-void
.end method

.method static synthetic access$900(Lorg/linphone/DailPadActivity;)Landroid/os/CountDownTimer;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 94
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->timer:Landroid/os/CountDownTimer;

    return-object v0
.end method

.method static synthetic access$902(Lorg/linphone/DailPadActivity;Landroid/os/CountDownTimer;)Landroid/os/CountDownTimer;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/DailPadActivity;
    .param p1, "x1"    # Landroid/os/CountDownTimer;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/linphone/DailPadActivity;->timer:Landroid/os/CountDownTimer;

    return-object p1
.end method

.method private call(Ljava/lang/String;)Z
    .locals 3
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 1109
    iput-object p1, p0, Lorg/linphone/DailPadActivity;->dialOutNumber:Ljava/lang/String;

    .line 1110
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    move-result v0

    return v0
.end method

.method private callVoicemail()V
    .locals 4

    .prologue
    .line 1004
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string/jumbo v0, "*988"

    .line 1006
    .local v0, "target":Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->m_AlertDlg:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 1007
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->m_AlertDlg:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 1009
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isPhoneCallReady()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v1

    if-nez v1, :cond_3

    .line 1011
    :cond_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0701c8

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07006a

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f020436

    .line 1012
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    invoke-virtual {p0, v2}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1016
    :goto_1
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1017
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->afterTextChanged(Landroid/text/Editable;)V

    .line 1018
    return-void

    .line 1004
    .end local v0    # "target":Ljava/lang/String;
    :cond_2
    const-string/jumbo v0, "*988"

    goto :goto_0

    .line 1014
    .restart local v0    # "target":Ljava/lang/String;
    :cond_3
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->call(Ljava/lang/String;)Z

    goto :goto_1
.end method

.method public static getDailPad()Lorg/linphone/DailPadActivity;
    .locals 1

    .prologue
    .line 307
    sget-object v0, Lorg/linphone/DailPadActivity;->theDailPad:Lorg/linphone/DailPadActivity;

    if-nez v0, :cond_0

    .line 308
    const/4 v0, 0x0

    .line 310
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/linphone/DailPadActivity;->theDailPad:Lorg/linphone/DailPadActivity;

    goto :goto_0
.end method

.method public static getLastOutgoingCall(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 900
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 901
    .local v0, "resolver":Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 903
    .local v6, "c":Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "number"

    aput-object v4, v2, v3

    const-string/jumbo v3, "type = 2"

    const/4 v4, 0x0

    const-string/jumbo v5, "date DESC LIMIT 1"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 909
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-nez v1, :cond_2

    .line 910
    :cond_0
    const-string/jumbo v1, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 914
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 912
    :cond_1
    :goto_0
    return-object v1

    :cond_2
    const/4 v1, 0x0

    :try_start_1
    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 914
    if-eqz v6, :cond_1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v1

    if-eqz v6, :cond_3

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v1
.end method

.method private getlastCall()Ljava/lang/String;
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 871
    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/16 v3, 0x8

    if-ge v2, v3, :cond_4

    .line 872
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 873
    .local v0, "resolver":Landroid/content/ContentResolver;
    const/4 v6, 0x0

    .line 876
    .local v6, "c":Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    .line 877
    .local v1, "uri":Landroid/net/Uri;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string/jumbo v4, "number"

    aput-object v4, v2, v3

    const-string/jumbo v3, "type = 2"

    const/4 v4, 0x0

    const-string/jumbo v5, "date DESC LIMIT 1"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 883
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-nez v2, :cond_2

    .line 884
    :cond_0
    const-string/jumbo v7, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 889
    .local v7, "lastCall":Ljava/lang/String;
    :goto_0
    if-eqz v6, :cond_1

    .line 890
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 896
    .end local v0    # "resolver":Landroid/content/ContentResolver;
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v6    # "c":Landroid/database/Cursor;
    :cond_1
    :goto_1
    return-object v7

    .line 886
    .end local v7    # "lastCall":Ljava/lang/String;
    .restart local v0    # "resolver":Landroid/content/ContentResolver;
    .restart local v1    # "uri":Landroid/net/Uri;
    .restart local v6    # "c":Landroid/database/Cursor;
    :cond_2
    const/4 v2, 0x0

    :try_start_1
    invoke-interface {v6, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v7

    .restart local v7    # "lastCall":Ljava/lang/String;
    goto :goto_0

    .line 889
    .end local v1    # "uri":Landroid/net/Uri;
    .end local v7    # "lastCall":Ljava/lang/String;
    :catchall_0
    move-exception v2

    if-eqz v6, :cond_3

    .line 890
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v2

    .line 894
    .end local v0    # "resolver":Landroid/content/ContentResolver;
    .end local v6    # "c":Landroid/database/Cursor;
    :cond_4
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v2}, Lorg/linphone/DailPadActivity;->getLastOutgoingCall(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .restart local v7    # "lastCall":Ljava/lang/String;
    goto :goto_1
.end method

.method static handleChars(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 635
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/linphone/DailPadActivity;->handleChars(Landroid/content/Context;Ljava/lang/String;ZLandroid/widget/EditText;)Z

    move-result v0

    return v0
.end method

.method static handleChars(Landroid/content/Context;Ljava/lang/String;Landroid/widget/EditText;)Z
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "textField"    # Landroid/widget/EditText;

    .prologue
    .line 631
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lorg/linphone/DailPadActivity;->handleChars(Landroid/content/Context;Ljava/lang/String;ZLandroid/widget/EditText;)Z

    move-result v0

    return v0
.end method

.method static handleChars(Landroid/content/Context;Ljava/lang/String;ZLandroid/widget/EditText;)Z
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "useSystemWindow"    # Z
    .param p3, "textField"    # Landroid/widget/EditText;

    .prologue
    .line 642
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 651
    .local v0, "dialString":Ljava/lang/String;
    const/4 v1, 0x0

    return v1
.end method

.method private handleIntent(Landroid/content/Intent;)V
    .locals 9
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x0

    const/4 v3, 0x0

    .line 582
    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v7

    .line 583
    .local v7, "type":Ljava/lang/String;
    const-string/jumbo v0, "vnd.android.cursor.item/person"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "vnd.android.cursor.item/phone"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 585
    :cond_0
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v4, "number"

    aput-object v4, v2, v8

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 588
    .local v6, "c":Landroid/database/Cursor;
    if-eqz v6, :cond_2

    .line 589
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 591
    invoke-interface {v6, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->setFormattedDigits(Ljava/lang/String;)V

    .line 593
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 596
    .end local v6    # "c":Landroid/database/Cursor;
    :cond_2
    return-void
.end method

.method private isWifiAvailable()Z
    .locals 2

    .prologue
    .line 1550
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1551
    const/4 v0, 0x0

    .line 1553
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private keyPressed(I)V
    .locals 2
    .param p1, "keyCode"    # I

    .prologue
    .line 1021
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->vibrate()V

    .line 1022
    new-instance v0, Landroid/view/KeyEvent;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Landroid/view/KeyEvent;-><init>(II)V

    .line 1023
    .local v0, "event":Landroid/view/KeyEvent;
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1, p1, v0}, Landroid/widget/EditText;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 1024
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->afterTextChanged(Landroid/text/Editable;)V

    .line 1025
    return-void
.end method

.method public static on(Landroid/content/Context;Z)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "on"    # Z

    .prologue
    .line 1376
    .line 1377
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1378
    .local v0, "edit":Landroid/content/SharedPreferences$Editor;
    const-string/jumbo v1, "on"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1379
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1380
    const-string/jumbo v1, "PREF_AUTOSTART"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 1381
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1383
    return-void
.end method

.method private pausePreCallQI()V
    .locals 1

    .prologue
    .line 1704
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    if-eqz v0, :cond_0

    .line 1705
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-virtual {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->stopChecking()V

    .line 1706
    :cond_0
    return-void
.end method

.method private performCall(Z)V
    .locals 7
    .param p1, "videoEnable"    # Z
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 806
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 807
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 808
    .local v0, "aTo":Ljava/lang/String;
    invoke-static {v0}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v0

    .line 810
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget-object v5, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-virtual {v4, v0, v5}, Lcom/pccw/mobile/sip/service/MobileSipService;->startCallChecking(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 812
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->hasIDDPrefix(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    .line 813
    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v5, "SHOW_IDD_CHARGE_MESSAGE"

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 816
    :try_start_0
    new-instance v2, Landroid/widget/CheckBox;

    iget-object v4, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-direct {v2, v4}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    .line 817
    .local v2, "doNotShowAgainBox":Landroid/widget/CheckBox;
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 818
    const v4, 0x7f070106

    invoke-virtual {v2, v4}, Landroid/widget/CheckBox;->setText(I)V

    .line 820
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-direct {v1, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 821
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const v4, 0x7f020436

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f07006a

    .line 822
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f070169

    .line 823
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 824
    invoke-virtual {v4, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const/high16 v5, 0x1040000

    new-instance v6, Lorg/linphone/DailPadActivity$8;

    invoke-direct {v6, p0}, Lorg/linphone/DailPadActivity$8;-><init>(Lorg/linphone/DailPadActivity;)V

    .line 825
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x104000a

    new-instance v6, Lorg/linphone/DailPadActivity$7;

    invoke-direct {v6, p0, v2, p1}, Lorg/linphone/DailPadActivity$7;-><init>(Lorg/linphone/DailPadActivity;Landroid/widget/CheckBox;Z)V

    .line 832
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 848
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 866
    .end local v0    # "aTo":Ljava/lang/String;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v2    # "doNotShowAgainBox":Landroid/widget/CheckBox;
    :cond_0
    :goto_0
    return-void

    .line 854
    .restart local v0    # "aTo":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, p1}, Lorg/linphone/DailPadActivity;->performCallWithAddress(Ljava/lang/String;Z)V

    goto :goto_0

    .line 860
    .end local v0    # "aTo":Ljava/lang/String;
    :cond_2
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->getlastCall()Ljava/lang/String;

    move-result-object v3

    .line 861
    .local v3, "lastCall":Ljava/lang/String;
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 862
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    iget-object v5, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->length()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setSelection(I)V

    .line 863
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/linphone/DailPadActivity;->afterTextChanged(Landroid/text/Editable;)V

    goto :goto_0

    .line 849
    .end local v3    # "lastCall":Ljava/lang/String;
    .restart local v0    # "aTo":Ljava/lang/String;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method private performCallWithAddress(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "aTo"    # Ljava/lang/String;
    .param p2, "videoenable"    # Z

    .prologue
    .line 772
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 773
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->afterTextChanged(Landroid/text/Editable;)V

    .line 774
    iput-object p1, p0, Lorg/linphone/DailPadActivity;->dialOutNumber:Ljava/lang/String;

    .line 776
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v0, p1, v1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->call(Ljava/lang/String;Landroid/content/Context;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 777
    sget-boolean v0, Lorg/linphone/DailPadActivity;->shouldShowReinviteWithAudioDialog:Z

    if-eqz v0, :cond_0

    .line 784
    const/4 v0, 0x0

    sput-boolean v0, Lorg/linphone/DailPadActivity;->shouldShowReinviteWithAudioDialog:Z

    .line 785
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/DailPadActivity$6;

    invoke-direct {v1, p0}, Lorg/linphone/DailPadActivity$6;-><init>(Lorg/linphone/DailPadActivity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 802
    :cond_0
    return-void
.end method

.method private resetCameraFromPreferences()V
    .locals 7

    .prologue
    .line 953
    const/4 v3, 0x1

    .line 958
    .local v3, "useFrontCam":Z
    const/4 v1, 0x0

    .line 959
    .local v1, "camId":I
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;->retrieveCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-result-object v2

    .line 960
    .local v2, "cameras":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    array-length v5, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v0, v2, v4

    .line 961
    .local v0, "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    iget-boolean v6, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    if-ne v6, v3, :cond_0

    .line 962
    iget v1, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->id:I

    .line 960
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 964
    .end local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_1
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v4

    invoke-interface {v4, v1}, Lorg/linphone/core/LinphoneCore;->setVideoDevice(I)V

    .line 965
    return-void
.end method

.method private resumePreCallQI()V
    .locals 1

    .prologue
    .line 1709
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    if-eqz v0, :cond_0

    .line 1710
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-virtual {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->startChecking()V

    .line 1712
    :cond_0
    return-void
.end method

.method private runFacebookShareChecking()V
    .locals 5

    .prologue
    .line 328
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x9

    if-lt v2, v3, :cond_0

    sget-boolean v2, Lorg/linphone/DailPadActivity;->shouldRunFacebookShareChecking:Z

    if-eqz v2, :cond_0

    .line 330
    new-instance v1, Lcom/pccw/mobile/sip/FacebookShareActivity;

    invoke-direct {v1}, Lcom/pccw/mobile/sip/FacebookShareActivity;-><init>()V

    .line 331
    .local v1, "mFacebookShareActivity":Lcom/pccw/mobile/sip/FacebookShareActivity;
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    iget-object v3, p0, Lorg/linphone/DailPadActivity;->fragmentManager:Landroid/support/v4/app/FragmentManager;

    sget-boolean v4, Lorg/linphone/DailPadActivity;->shouldCleanCallCount:Z

    invoke-virtual {v1, v2, v3, v4}, Lcom/pccw/mobile/sip/FacebookShareActivity;->runFacebookShareChecking(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 333
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f020436

    .line 334
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07006a

    .line 335
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070121

    .line 336
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070120

    new-instance v4, Lorg/linphone/DailPadActivity$5;

    invoke-direct {v4, p0, v1}, Lorg/linphone/DailPadActivity$5;-><init>(Lorg/linphone/DailPadActivity;Lcom/pccw/mobile/sip/FacebookShareActivity;)V

    .line 337
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07011f

    new-instance v4, Lorg/linphone/DailPadActivity$4;

    invoke-direct {v4, p0}, Lorg/linphone/DailPadActivity$4;-><init>(Lorg/linphone/DailPadActivity;)V

    .line 349
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07011e

    const/4 v4, 0x0

    .line 358
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 359
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 360
    .local v0, "alertDialog":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 363
    .end local v0    # "alertDialog":Landroid/app/AlertDialog;
    .end local v1    # "mFacebookShareActivity":Lcom/pccw/mobile/sip/FacebookShareActivity;
    :cond_0
    const/4 v2, 0x0

    sput-boolean v2, Lorg/linphone/DailPadActivity;->shouldRunFacebookShareChecking:Z

    .line 364
    return-void
.end method

.method private setDialer(Landroid/net/Uri;)V
    .locals 1
    .param p1, "dialUri"    # Landroid/net/Uri;

    .prologue
    .line 535
    invoke-virtual {p1}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v0

    .line 536
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->setFormattedDigits(Ljava/lang/String;)V

    .line 537
    return-void
.end method

.method private setRoamSaveButtonClickable(Z)V
    .locals 2
    .param p1, "clickable"    # Z

    .prologue
    .line 1386
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setEnabled(Z)V

    .line 1387
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setClickable(Z)V

    .line 1388
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setSelected(Z)V

    .line 1389
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButtonListener:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1390
    return-void

    .line 1389
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private setRoamSaveButtonEnable(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .prologue
    .line 1393
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    invoke-virtual {v0, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 1394
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1398
    return-void

    .line 1394
    :cond_0
    const/4 v0, 0x4

    goto :goto_0
.end method

.method private setRoamSaveButtonReAutoconnecting()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 1401
    invoke-direct {p0, v1}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonClickable(Z)V

    .line 1402
    invoke-direct {p0, v1}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonEnable(Z)V

    .line 1403
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setSelected(Z)V

    .line 1404
    return-void
.end method

.method private setupKeypad()V
    .locals 3

    .prologue
    .line 660
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00b3

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 661
    .local v0, "view":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 662
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 664
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00b4

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 665
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00b5

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 666
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00b6

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 667
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00b7

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 668
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00b8

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 669
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00b9

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 670
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00ba

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 671
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00bb

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 672
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00bc

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 674
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00bd

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 675
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 676
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 678
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v2, 0x7f0e00be

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 679
    return-void
.end method

.method private showDialog(I)V
    .locals 5
    .param p1, "id"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 1735
    packed-switch p1, :pswitch_data_0

    .line 1775
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unkown dialog id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1743
    :pswitch_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1744
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f020436

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07006a

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1745
    const v2, 0x7f07010b

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 1746
    const v2, 0x7f07010c

    new-instance v3, Lorg/linphone/DailPadActivity$12;

    invoke-direct {v3, p0}, Lorg/linphone/DailPadActivity$12;-><init>(Lorg/linphone/DailPadActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1754
    const v2, 0x7f07010d

    new-instance v3, Lorg/linphone/DailPadActivity$13;

    invoke-direct {v3, p0}, Lorg/linphone/DailPadActivity$13;-><init>(Lorg/linphone/DailPadActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1762
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1763
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    .line 1779
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :goto_0
    return-void

    .line 1766
    :pswitch_1
    invoke-static {v2}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->newInstance(I)Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;

    move-result-object v1

    .line 1767
    .local v1, "kkdialog":Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;
    invoke-virtual {v1, p0, v2}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setTargetFragment(Landroid/support/v4/app/Fragment;I)V

    .line 1768
    const v2, 0x7f07006b

    invoke-virtual {p0, v2}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setMessage(Ljava/lang/String;)V

    .line 1769
    const v2, 0x7f07015b

    invoke-virtual {p0, v2}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setPositiveButton(Ljava/lang/String;)V

    .line 1770
    const/high16 v2, 0x1040000

    invoke-virtual {p0, v2}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setNegativeButton(Ljava/lang/String;)V

    .line 1771
    invoke-virtual {v1, v4}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setCancelable(Z)V

    .line 1772
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->fragmentManager:Landroid/support/v4/app/FragmentManager;

    const-string/jumbo v3, "dialog"

    invoke-virtual {v1, v2, v3}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 1735
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private startPreCallQI()V
    .locals 2

    .prologue
    .line 1692
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQILayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1693
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    if-eqz v0, :cond_0

    .line 1694
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-virtual {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->startChecking()V

    .line 1696
    :cond_0
    return-void
.end method

.method private stopPreCallQI()V
    .locals 2

    .prologue
    .line 1699
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-virtual {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->stopChecking()V

    .line 1700
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQILayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1701
    return-void
.end method

.method private updatePreCallQIStatus(Ljava/lang/String;)V
    .locals 2
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 1715
    invoke-virtual {p0}, Lorg/linphone/DailPadActivity;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1716
    const-string/jumbo v0, "GOOD"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1717
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    const v1, 0x7f0701d7

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1718
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    const v1, -0xff0100

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1730
    :cond_0
    :goto_0
    return-void

    .line 1719
    :cond_1
    const-string/jumbo v0, "FAIR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1720
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    const v1, 0x7f0701d6

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1721
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    const/16 v1, -0x100

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 1722
    :cond_2
    const-string/jumbo v0, "BAD"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1723
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    const v1, 0x7f0701d9

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1724
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    const/high16 v1, -0x10000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 1726
    :cond_3
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    const v1, 0x7f0701d8

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1727
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0
.end method

.method private declared-synchronized vibrate()V
    .locals 3

    .prologue
    .line 1031
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/linphone/DailPadActivity;->mVibrateOn:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 1038
    :goto_0
    monitor-exit p0

    return-void

    .line 1034
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mVibrator:Landroid/os/Vibrator;

    if-nez v0, :cond_1

    .line 1035
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    const-string/jumbo v1, "vibrator"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->mVibrator:Landroid/os/Vibrator;

    .line 1037
    :cond_1
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mVibrator:Landroid/os/Vibrator;

    iget-object v1, p0, Lorg/linphone/DailPadActivity;->mVibratePattern:[J

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate([JI)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1031
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3
    .param p1, "input"    # Landroid/text/Editable;

    .prologue
    .line 614
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-static {v0, v1, v2}, Lorg/linphone/DailPadActivity;->handleChars(Landroid/content/Context;Ljava/lang/String;Landroid/widget/EditText;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 616
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    .line 628
    :cond_0
    return-void
.end method

.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 5
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1515
    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->Error:Lorg/linphone/core/LinphoneCall$State;

    if-ne p3, v3, :cond_1

    .line 1516
    const-string/jumbo v1, "bearer capability not author"

    invoke-virtual {p4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1519
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->handler:Landroid/os/Handler;

    new-instance v2, Lorg/linphone/DailPadActivity$11;

    invoke-direct {v2, p0}, Lorg/linphone/DailPadActivity$11;-><init>(Lorg/linphone/DailPadActivity;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1547
    :cond_0
    :goto_0
    return-void

    .line 1535
    :cond_1
    sget-object v3, Lorg/linphone/core/LinphoneCall$State;->CallEnd:Lorg/linphone/core/LinphoneCall$State;

    if-ne p3, v3, :cond_0

    .line 1537
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v3}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1538
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const-string/jumbo v4, "FacebookShare"

    invoke-virtual {v3, v4, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1539
    .local v0, "FacebookPerf":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "neverShareToFacebook"

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1542
    sput-boolean v1, Lorg/linphone/DailPadActivity;->shouldRunFacebookShareChecking:Z

    .line 1543
    invoke-interface {p2}, Lorg/linphone/core/LinphoneCall;->getDuration()I

    move-result v3

    const/16 v4, 0x3c

    if-ge v3, v4, :cond_2

    :goto_1
    sput-boolean v1, Lorg/linphone/DailPadActivity;->shouldCleanCallCount:Z

    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1
.end method

.method call_menu()V
    .locals 3

    .prologue
    .line 1097
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->stripSeparators(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1098
    .local v0, "target":Ljava/lang/String;
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->m_AlertDlg:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 1099
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->m_AlertDlg:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->cancel()V

    .line 1102
    :cond_0
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->call(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1103
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1104
    iget-object v1, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->afterTextChanged(Landroid/text/Editable;)V

    .line 1106
    :cond_1
    return-void
.end method

.method public contTurnOnRS()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1179
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    iget-object v3, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1180
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1181
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1182
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1183
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const v3, 0x7f07006b

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 1184
    invoke-virtual {v2, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const/high16 v4, 0x1040000

    .line 1186
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lorg/linphone/DailPadActivity$10;

    invoke-direct {v4, p0}, Lorg/linphone/DailPadActivity$10;-><init>(Lorg/linphone/DailPadActivity;)V

    .line 1185
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07015b

    .line 1194
    invoke-virtual {p0, v3}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lorg/linphone/DailPadActivity$9;

    invoke-direct {v4, p0}, Lorg/linphone/DailPadActivity$9;-><init>(Lorg/linphone/DailPadActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1201
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1202
    .local v0, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1218
    .end local v0    # "alert":Landroid/app/AlertDialog;
    .end local v1    # "builder":Landroid/app/AlertDialog$Builder;
    :goto_0
    return-void

    .line 1207
    :cond_0
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1208
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const v5, 0x7f0700b7

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1212
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lorg/linphone/DailPadActivity;->on(Landroid/content/Context;Z)V

    .line 1214
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    iput-boolean v6, v2, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    .line 1215
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v2

    iget-object v3, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    new-instance v4, Landroid/os/Handler;

    .line 1216
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1215
    invoke-virtual {v2, v3, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->httpsLogin(Landroid/content/Context;Landroid/os/Handler;)V

    goto :goto_0
.end method

.method public doNegativeClick(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 1791
    return-void
.end method

.method public doNeutralClick(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 1797
    return-void
.end method

.method public doPositiveClick(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 1785
    return-void
.end method

.method public handIntent()V
    .locals 4

    .prologue
    .line 544
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->isChild()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 545
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getParent()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 549
    .local v0, "intent":Landroid/content/Intent;
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->handleIntent(Landroid/content/Intent;)V

    .line 579
    :cond_0
    :goto_0
    return-void

    .line 551
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 553
    .restart local v0    # "intent":Landroid/content/Intent;
    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 555
    .local v1, "uri":Landroid/net/Uri;
    if-eqz v1, :cond_0

    .line 556
    const-string/jumbo v2, "tel"

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 557
    invoke-direct {p0, v1}, Lorg/linphone/DailPadActivity;->setDialer(Landroid/net/Uri;)V

    goto :goto_0

    .line 559
    :cond_2
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->handleIntent(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method protected maybeAddNumberFormatting()V
    .locals 2

    .prologue
    .line 655
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    new-instance v1, Landroid/telephony/PhoneNumberFormattingTextWatcher;

    invoke-direct {v1}, Landroid/telephony/PhoneNumberFormattingTextWatcher;-><init>()V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 656
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/16 v5, 0x9

    const/16 v4, 0x8

    const/4 v3, 0x7

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 683
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 769
    :cond_0
    :goto_0
    return-void

    .line 685
    :sswitch_0
    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 686
    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 690
    :sswitch_1
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 691
    invoke-direct {p0, v5}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 695
    :sswitch_2
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 696
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 700
    :sswitch_3
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 701
    const/16 v0, 0xb

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 705
    :sswitch_4
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 706
    const/16 v0, 0xc

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 710
    :sswitch_5
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 711
    const/16 v0, 0xd

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 715
    :sswitch_6
    invoke-virtual {p0, v3}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 716
    const/16 v0, 0xe

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 720
    :sswitch_7
    invoke-virtual {p0, v4}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 721
    const/16 v0, 0xf

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 725
    :sswitch_8
    invoke-virtual {p0, v5}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 726
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 730
    :sswitch_9
    invoke-virtual {p0, v2}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 731
    invoke-direct {p0, v3}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 735
    :sswitch_a
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 736
    const/16 v0, 0x12

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 740
    :sswitch_b
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lorg/linphone/DailPadActivity;->playTone(I)V

    .line 741
    const/16 v0, 0x11

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 745
    :sswitch_c
    const/16 v0, 0x43

    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 749
    :sswitch_d
    invoke-direct {p0, v2}, Lorg/linphone/DailPadActivity;->performCall(Z)V

    goto :goto_0

    .line 753
    :sswitch_e
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->callVoicemail()V

    goto :goto_0

    .line 759
    :sswitch_f
    invoke-direct {p0, v1}, Lorg/linphone/DailPadActivity;->performCall(Z)V

    goto/16 :goto_0

    .line 763
    :sswitch_10
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 764
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setCursorVisible(Z)V

    goto/16 :goto_0

    .line 683
    :sswitch_data_0
    .sparse-switch
        0x7f0e00b3 -> :sswitch_0
        0x7f0e00b4 -> :sswitch_1
        0x7f0e00b5 -> :sswitch_2
        0x7f0e00b6 -> :sswitch_3
        0x7f0e00b7 -> :sswitch_4
        0x7f0e00b8 -> :sswitch_5
        0x7f0e00b9 -> :sswitch_6
        0x7f0e00ba -> :sswitch_7
        0x7f0e00bb -> :sswitch_8
        0x7f0e00bc -> :sswitch_b
        0x7f0e00bd -> :sswitch_9
        0x7f0e00be -> :sswitch_a
        0x7f0e0182 -> :sswitch_10
        0x7f0e0183 -> :sswitch_c
        0x7f0e0185 -> :sswitch_f
        0x7f0e0186 -> :sswitch_d
        0x7f0e0187 -> :sswitch_e
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 207
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 208
    invoke-virtual {p0}, Lorg/linphone/DailPadActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    .line 209
    invoke-virtual {p0}, Lorg/linphone/DailPadActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    .line 210
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    check-cast v0, Lorg/linphone/LinphoneActivity;

    invoke-virtual {v0}, Lorg/linphone/LinphoneActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->fragmentManager:Landroid/support/v4/app/FragmentManager;

    .line 213
    sput-object p0, Lorg/linphone/DailPadActivity;->theDailPad:Lorg/linphone/DailPadActivity;

    .line 214
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v6, 0x10

    const/4 v5, 0x0

    .line 218
    const-string/jumbo v3, "KKUI"

    const-string/jumbo v4, "DailPadActivity-onCreateView"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    invoke-virtual {p0}, Lorg/linphone/DailPadActivity;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    check-cast v3, Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v3}, Landroid/support/v7/app/ActionBarActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 221
    .local v0, "actionBar":Landroid/support/v7/app/ActionBar;
    invoke-virtual {v0, v6, v6}, Landroid/support/v7/app/ActionBar;->setDisplayOptions(II)V

    .line 222
    const v3, 0x7f04001d

    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->setCustomView(I)V

    .line 224
    invoke-virtual {v0, v5}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 226
    const v3, 0x7f040054

    invoke-virtual {p1, v3, p2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    .line 228
    :try_start_0
    invoke-virtual {p0}, Lorg/linphone/DailPadActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 229
    .local v1, "r":Landroid/content/res/Resources;
    const v3, 0x7f020068

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mDigitsBackground:Landroid/graphics/drawable/Drawable;

    .line 230
    const v3, 0x7f020066

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mDigitsEmptyBackground:Landroid/graphics/drawable/Drawable;

    .line 231
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v4, 0x7f0e0182

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    .line 232
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 237
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v3, p0}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 238
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v3, p0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 241
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    new-instance v4, Lorg/linphone/DailPadActivity$3;

    invoke-direct {v4, p0}, Lorg/linphone/DailPadActivity$3;-><init>(Lorg/linphone/DailPadActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 254
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0e006f

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    .line 255
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0e0072

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mPreCallQIStatus:Landroid/widget/TextView;

    .line 256
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0e0070

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mPreCallQILayout:Landroid/widget/LinearLayout;

    .line 257
    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0e0073

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/CheckBox;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    .line 261
    new-instance v3, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lorg/linphone/DailPadActivity$RoamSaveButtonListener;-><init>(Lorg/linphone/DailPadActivity;Lorg/linphone/DailPadActivity$1;)V

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButtonListener:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    .line 262
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButtonListener:Lorg/linphone/DailPadActivity$RoamSaveButtonListener;

    invoke-virtual {v3, v4}, Landroid/widget/CheckBox;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 265
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v4, 0x7f0e00b3

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 266
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_0

    .line 267
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->setupKeypad()V

    .line 270
    :cond_0
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v4, 0x7f0e0183

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mDelete:Landroid/widget/ImageButton;

    .line 271
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mDelete:Landroid/widget/ImageButton;

    invoke-virtual {v3, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mDelete:Landroid/widget/ImageButton;

    invoke-virtual {v3, p0}, Landroid/widget/ImageButton;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 273
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v4, 0x7f0e0186

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mDialButton:Landroid/widget/ImageButton;

    .line 274
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mDialButton:Landroid/widget/ImageButton;

    invoke-virtual {v3, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 275
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v4, 0x7f0e0185

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mVideocallButton:Landroid/widget/ImageButton;

    .line 276
    invoke-static {}, Lorg/linphone/BandwidthManager;->isRoamSaveVideoEnable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 277
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mVideocallButton:Landroid/widget/ImageButton;

    invoke-virtual {v3, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    :goto_0
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    const v4, 0x7f0e0187

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mVoicemailButton:Landroid/widget/ImageButton;

    .line 283
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mVoicemailButton:Landroid/widget/ImageButton;

    invoke-virtual {v3, p0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->mPref:Landroid/content/SharedPreferences;

    .line 291
    new-instance v3, Lcom/pccw/mobile/util/PreCallQualityIndicator;

    iget-object v4, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    iget-object v5, p0, Lorg/linphone/DailPadActivity;->preCallQIHandler:Landroid/os/Handler;

    invoke-direct {v3, v4, v5}, Lcom/pccw/mobile/util/PreCallQualityIndicator;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    iput-object v3, p0, Lorg/linphone/DailPadActivity;->preCallQI:Lcom/pccw/mobile/util/PreCallQualityIndicator;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 303
    .end local v1    # "r":Landroid/content/res/Resources;
    .end local v2    # "view":Landroid/view/View;
    :goto_1
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->v:Landroid/view/View;

    return-object v3

    .line 279
    .restart local v1    # "r":Landroid/content/res/Resources;
    .restart local v2    # "view":Landroid/view/View;
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mVideocallButton:Landroid/widget/ImageButton;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setClickable(Z)V

    .line 280
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mVideocallButton:Landroid/widget/ImageButton;

    const v4, 0x7f020087

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setImageResource(I)V
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 293
    .end local v1    # "r":Landroid/content/res/Resources;
    .end local v2    # "view":Landroid/view/View;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 318
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/DailPadActivity;->isWaitingWifiFinish:Z

    .line 319
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->waitingWifiThr:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 320
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->waitingWifiThr:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 321
    iput-object v1, p0, Lorg/linphone/DailPadActivity;->waitingWifiThr:Ljava/lang/Thread;

    .line 323
    :cond_0
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 324
    sput-object v1, Lorg/linphone/DailPadActivity;->theDailPad:Lorg/linphone/DailPadActivity;

    .line 325
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1071
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 1080
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 1073
    :pswitch_0
    const/16 v0, 0x42

    if-ne p2, v0, :cond_0

    .line 1075
    invoke-virtual {p0}, Lorg/linphone/DailPadActivity;->call_menu()V

    .line 1076
    const/4 v0, 0x1

    goto :goto_0

    .line 1071
    :pswitch_data_0
    .packed-switch 0x7f0e012b
        :pswitch_0
    .end packed-switch
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1042
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    .line 1043
    .local v0, "digits":Landroid/text/Editable;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    .line 1044
    .local v1, "id":I
    sparse-switch v1, :sswitch_data_0

    move v2, v3

    .line 1066
    :goto_0
    return v2

    .line 1046
    :sswitch_0
    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    .line 1047
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/linphone/DailPadActivity;->afterTextChanged(Landroid/text/Editable;)V

    .line 1051
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mDelete:Landroid/widget/ImageButton;

    invoke-virtual {v4, v3}, Landroid/widget/ImageButton;->setPressed(Z)V

    goto :goto_0

    .line 1055
    :sswitch_1
    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v4

    if-nez v4, :cond_0

    .line 1056
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->callVoicemail()V

    goto :goto_0

    :cond_0
    move v2, v3

    .line 1059
    goto :goto_0

    .line 1062
    :sswitch_2
    const/16 v3, 0x51

    invoke-direct {p0, v3}, Lorg/linphone/DailPadActivity;->keyPressed(I)V

    goto :goto_0

    .line 1044
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0e00b3 -> :sswitch_1
        0x7f0e00bd -> :sswitch_2
        0x7f0e0183 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 524
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onPause()V

    .line 526
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->pausePreCallQI()V

    .line 527
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->mConnectionChangeReceiver:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    if-eqz v0, :cond_0

    .line 528
    iget-object v0, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    iget-object v1, p0, Lorg/linphone/DailPadActivity;->mConnectionChangeReceiver:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 529
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/DailPadActivity;->mConnectionChangeReceiver:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    .line 531
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 370
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onResume()V

    .line 371
    iget-object v6, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string/jumbo v7, "dtmf_tone"

    invoke-static {v6, v7, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v4, :cond_4

    :goto_0
    iput-boolean v4, p0, Lorg/linphone/DailPadActivity;->mDTMFToneEnabled:Z

    .line 377
    iget-object v5, p0, Lorg/linphone/DailPadActivity;->mToneGeneratorLock:Ljava/lang/Object;

    monitor-enter v5

    .line 378
    :try_start_0
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mToneGenerator:Landroid/media/ToneGenerator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_0

    .line 385
    :try_start_1
    new-instance v4, Landroid/media/ToneGenerator;

    const/4 v6, 0x3

    const/16 v7, 0x50

    invoke-direct {v4, v6, v7}, Landroid/media/ToneGenerator;-><init>(II)V

    iput-object v4, p0, Lorg/linphone/DailPadActivity;->mToneGenerator:Landroid/media/ToneGenerator;

    .line 386
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    const/4 v6, 0x3

    invoke-virtual {v4, v6}, Landroid/app/Activity;->setVolumeControlStream(I)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    :cond_0
    :goto_1
    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 418
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    instance-of v4, v4, Lorg/linphone/LinphoneActivity;

    if-eqz v4, :cond_1

    .line 419
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->activity:Landroid/app/Activity;

    check-cast v4, Lorg/linphone/LinphoneActivity;

    invoke-virtual {v4}, Lorg/linphone/LinphoneActivity;->getAndClearDialUri()Landroid/net/Uri;

    move-result-object v0

    .line 420
    .local v0, "dialUri":Landroid/net/Uri;
    if-eqz v0, :cond_1

    const-string/jumbo v4, "tel"

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 421
    invoke-direct {p0, v0}, Lorg/linphone/DailPadActivity;->setDialer(Landroid/net/Uri;)V

    .line 430
    .end local v0    # "dialUri":Landroid/net/Uri;
    :cond_1
    :try_start_3
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->isReLoginRunning()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 431
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonReAutoconnecting()V

    .line 433
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    const v5, 0x7f0701f3

    invoke-virtual {p0, v5}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 434
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 435
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mPreCallQILayout:Landroid/widget/LinearLayout;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 473
    :goto_2
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v4}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 474
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNeedPrepaidTopUpReminderCheck()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 479
    new-instance v4, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;

    invoke-direct {v4, p0}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;-><init>(Lorg/linphone/DailPadActivity;)V

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Void;

    invoke-virtual {v4, v5}, Lorg/linphone/DailPadActivity$PrepaidTopupReminderThread;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 481
    :cond_2
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/pccw/mobile/sip/service/MobileSipService;->setNeedPrepaidTopUpReminderCheck(Z)V
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_1

    .line 507
    :cond_3
    :goto_3
    new-instance v4, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;-><init>(Lorg/linphone/DailPadActivity;Lorg/linphone/DailPadActivity$1;)V

    iput-object v4, p0, Lorg/linphone/DailPadActivity;->mConnectionChangeReceiver:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    .line 508
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 509
    .local v2, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v4, "com.pccw.mobile.sip.intent.logindisconnected"

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 510
    const-string/jumbo v4, "com.pccw.mobile.sip.intent.logindisconnecting"

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 511
    const-string/jumbo v4, "com.pccw.mobile.sip.intent.callforwardsucceed"

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 512
    const-string/jumbo v4, "com.pccw.mobile.sip.intent.loginfinished"

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 513
    const-string/jumbo v4, "com.pccw.mobile.sip.intent.reloginprocessing"

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 514
    const-string/jumbo v4, "com.pccw.mobile.sip.intent.autologinprocessing"

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 515
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    iget-object v5, p0, Lorg/linphone/DailPadActivity;->mConnectionChangeReceiver:Lorg/linphone/DailPadActivity$ConnectionChangeReceiver;

    invoke-virtual {v4, v5, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 517
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->runFacebookShareChecking()V

    .line 518
    return-void

    .end local v2    # "filter":Landroid/content/IntentFilter;
    :cond_4
    move v4, v5

    .line 371
    goto/16 :goto_0

    .line 387
    :catch_0
    move-exception v1

    .line 390
    .local v1, "e":Ljava/lang/RuntimeException;
    const/4 v4, 0x0

    :try_start_4
    iput-object v4, p0, Lorg/linphone/DailPadActivity;->mToneGenerator:Landroid/media/ToneGenerator;

    goto/16 :goto_1

    .line 393
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v4

    .line 436
    :cond_5
    :try_start_5
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 437
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonReAutoconnecting()V

    .line 439
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    const v5, 0x7f0701f2

    invoke-virtual {p0, v5}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 440
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 441
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mPreCallQILayout:Landroid/widget/LinearLayout;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_2

    .line 483
    :catch_1
    move-exception v4

    goto :goto_3

    .line 442
    :cond_6
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 443
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 444
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonClickable(Z)V

    .line 446
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const v6, 0x7f0700b7

    invoke-virtual {p0, v6}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "..."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 447
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 448
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mPreCallQILayout:Landroid/widget/LinearLayout;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto/16 :goto_2

    .line 449
    :cond_7
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 450
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonEnable(Z)V

    .line 451
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonClickable(Z)V

    goto/16 :goto_2

    .line 452
    :cond_8
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget v4, v4, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v4, :cond_b

    .line 453
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mRoamSaveButton:Landroid/widget/CheckBox;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 454
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->isPhoneCallReady()Z

    move-result v4

    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonClickable(Z)V

    .line 456
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    invoke-static {v4}, Lcom/pccw/mobile/sip/ClientStateManager;->getPhone(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 457
    .local v3, "phone":Ljava/lang/String;
    iget-object v5, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    .line 458
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->isPhoneCallReady()Z

    move-result v4

    if-eqz v4, :cond_a

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v6, 0x7f070071

    invoke-virtual {p0, v6}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v3, :cond_9

    .line 459
    invoke-static {v3}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_9

    :cond_9
    const-string/jumbo v6, ""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 458
    :goto_4
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 463
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mBannerText:Landroid/widget/TextView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 464
    iget-object v4, p0, Lorg/linphone/DailPadActivity;->mPreCallQILayout:Landroid/widget/LinearLayout;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 466
    invoke-direct {p0}, Lorg/linphone/DailPadActivity;->resumePreCallQI()V

    goto/16 :goto_2

    .line 459
    :cond_a
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v6, 0x7f0700b7

    .line 462
    invoke-virtual {p0, v6}, Lorg/linphone/DailPadActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v6, "..."

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    .line 468
    .end local v3    # "phone":Ljava/lang/String;
    :cond_b
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonEnable(Z)V

    .line 469
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lorg/linphone/DailPadActivity;->setRoamSaveButtonClickable(Z)V
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_2
.end method

.method playTone(I)V
    .locals 8
    .param p1, "tone"    # I

    .prologue
    .line 969
    iget-boolean v2, p0, Lorg/linphone/DailPadActivity;->mDTMFToneEnabled:Z

    if-nez v2, :cond_1

    .line 1001
    :cond_0
    :goto_0
    return-void

    .line 978
    :cond_1
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    const-string/jumbo v3, "audio"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 979
    .local v0, "audioManager":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    .line 980
    .local v1, "ringerMode":I
    if-eqz v1, :cond_0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 985
    iget-object v3, p0, Lorg/linphone/DailPadActivity;->mToneGeneratorLock:Ljava/lang/Object;

    monitor-enter v3

    .line 986
    :try_start_0
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->mToneGenerator:Landroid/media/ToneGenerator;

    if-nez v2, :cond_2

    .line 989
    monitor-exit v3

    goto :goto_0

    .line 1000
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 993
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->mToneGenerator:Landroid/media/ToneGenerator;

    invoke-virtual {v2, p1}, Landroid/media/ToneGenerator;->startTone(I)Z

    .line 996
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->handler:Landroid/os/Handler;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 997
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->handler:Landroid/os/Handler;

    const/4 v4, 0x0

    const-wide/16 v6, 0x96

    invoke-virtual {v2, v4, v6, v7}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1000
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method protected setFormattedDigits(Ljava/lang/String;)V
    .locals 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 600
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 601
    .local v0, "dialString":Ljava/lang/String;
    invoke-static {v0}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 602
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 603
    iget-object v2, p0, Lorg/linphone/DailPadActivity;->sip_uri_box:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 604
    .local v1, "digits":Landroid/text/Editable;
    const/4 v2, 0x0

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-interface {v1, v2, v3, v0}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 609
    invoke-virtual {p0, v1}, Lorg/linphone/DailPadActivity;->afterTextChanged(Landroid/text/Editable;)V

    .line 611
    .end local v1    # "digits":Landroid/text/Editable;
    :cond_0
    return-void
.end method
