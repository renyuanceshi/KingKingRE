.class public Lorg/linphone/LinphoneActivity;
.super Lcom/pccw/mobile/sip/BaseActionBarActivity;
.source "LinphoneActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;,
        Lorg/linphone/LinphoneActivity$TabListener;
    }
.end annotation


# static fields
.field private static final BAR_TAG_CONTACT:Ljava/lang/String; = "CONTACT"

.field private static final BAR_TAG_DAILPAD:Ljava/lang/String; = "DAILPAD"

.field private static final BAR_TAG_HISTORY:Ljava/lang/String; = "HISTORY"

.field private static final BAR_TAG_MORE:Ljava/lang/String; = "MORE"

.field private static final CONFIGURE_MENU_ITEM:I = 0x1

.field public static DIALER_TAB:Ljava/lang/String;

.field private static final EXIT_MENU_ITEM:I

.field private static SCREEN_IS_HIDDEN:Ljava/lang/String;

.field private static SHOW_IN_HK_MESSAGE:Ljava/lang/String;

.field private static isPhoneBookSyncRunning:Z

.field private static isUpdateGroupListRunning:Z

.field private static mSensorEventListener:Landroid/hardware/SensorEventListener;

.field private static theLinphoneActivity:Lorg/linphone/LinphoneActivity;


# instance fields
.field actionBar:Landroid/support/v7/app/ActionBar;

.field public conn:Landroid/content/ServiceConnection;

.field private loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

.field private mAudioManager:Landroid/media/AudioManager;

.field private mBound:Z

.field private mDialUri:Landroid/net/Uri;

.field private mMainFrame:Landroid/widget/FrameLayout;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 80
    const-string/jumbo v0, "dialer"

    sput-object v0, Lorg/linphone/LinphoneActivity;->DIALER_TAB:Ljava/lang/String;

    .line 91
    const-string/jumbo v0, "screen_is_hidden"

    sput-object v0, Lorg/linphone/LinphoneActivity;->SCREEN_IS_HIDDEN:Ljava/lang/String;

    .line 92
    const-string/jumbo v0, "SHOW_IN_HK_MESSAGE"

    sput-object v0, Lorg/linphone/LinphoneActivity;->SHOW_IN_HK_MESSAGE:Ljava/lang/String;

    .line 124
    sput-boolean v1, Lorg/linphone/LinphoneActivity;->isPhoneBookSyncRunning:Z

    .line 125
    sput-boolean v1, Lorg/linphone/LinphoneActivity;->isUpdateGroupListRunning:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;-><init>()V

    .line 99
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/LinphoneActivity;->loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    .line 100
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/LinphoneActivity;->mBound:Z

    .line 1035
    new-instance v0, Lorg/linphone/LinphoneActivity$5;

    invoke-direct {v0, p0}, Lorg/linphone/LinphoneActivity$5;-><init>(Lorg/linphone/LinphoneActivity;)V

    iput-object v0, p0, Lorg/linphone/LinphoneActivity;->receiver:Landroid/content/BroadcastReceiver;

    .line 1049
    new-instance v0, Lorg/linphone/LinphoneActivity$6;

    invoke-direct {v0, p0}, Lorg/linphone/LinphoneActivity$6;-><init>(Lorg/linphone/LinphoneActivity;)V

    iput-object v0, p0, Lorg/linphone/LinphoneActivity;->conn:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$100(Lorg/linphone/LinphoneActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/LinphoneActivity;

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/linphone/LinphoneActivity;->showCallTollFreeDialog()V

    return-void
.end method

.method static synthetic access$200(Lorg/linphone/LinphoneActivity;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/LinphoneActivity;

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/linphone/LinphoneActivity;->showOverseaHotlineWebViewDialog()V

    return-void
.end method

.method static synthetic access$302(Lorg/linphone/LinphoneActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/linphone/LinphoneActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lorg/linphone/LinphoneActivity;->mBound:Z

    return p1
.end method

.method private doListAvailableCodecs()V
    .locals 2

    .prologue
    .line 550
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->listAvailableCodecs(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/mobile/sip/service/Codec;

    goto :goto_0

    .line 554
    :cond_0
    return-void
.end method

.method protected static instance()Lorg/linphone/LinphoneActivity;
    .locals 2

    .prologue
    .line 103
    sget-object v0, Lorg/linphone/LinphoneActivity;->theLinphoneActivity:Lorg/linphone/LinphoneActivity;

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "LinphoneActivity not instanciated yet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_0
    sget-object v0, Lorg/linphone/LinphoneActivity;->theLinphoneActivity:Lorg/linphone/LinphoneActivity;

    return-object v0
.end method

.method public static isInstanced()Z
    .locals 1

    .prologue
    .line 111
    sget-object v0, Lorg/linphone/LinphoneActivity;->theLinphoneActivity:Lorg/linphone/LinphoneActivity;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPhoneBookSyncRunning()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 1070
    sget-boolean v0, Lorg/linphone/LinphoneActivity;->isPhoneBookSyncRunning:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static isUpdateGroupListRunning()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 1078
    sget-boolean v0, Lorg/linphone/LinphoneActivity;->isUpdateGroupListRunning:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method private setCurrentTagByIntent(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 268
    const-string/jumbo v1, "com.pccw.mobile.sip.service.intent.dial"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 269
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 273
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "tel:"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 274
    .local v0, "number":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 275
    invoke-direct {p0, p1}, Lorg/linphone/LinphoneActivity;->setupDialUri(Landroid/content/Intent;)V

    .line 276
    iget-object v1, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v1, v3}, Landroid/support/v7/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 281
    .end local v0    # "number":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 278
    .restart local v0    # "number":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v1, v3}, Landroid/support/v7/app/ActionBar;->setSelectedNavigationItem(I)V

    goto :goto_0
.end method

.method public static setPhoneBookSyncRunning(Z)V
    .locals 0
    .param p0, "isRunning"    # Z

    .prologue
    .line 1074
    sput-boolean p0, Lorg/linphone/LinphoneActivity;->isPhoneBookSyncRunning:Z

    .line 1075
    return-void
.end method

.method public static setUpdateGroupListRunning(Z)V
    .locals 0
    .param p0, "isRunning"    # Z

    .prologue
    .line 1082
    sput-boolean p0, Lorg/linphone/LinphoneActivity;->isUpdateGroupListRunning:Z

    .line 1083
    return-void
.end method

.method private setupDialUri(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 591
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/high16 v1, 0x100000

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    .line 595
    :goto_0
    return-void

    .line 594
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneActivity;->mDialUri:Landroid/net/Uri;

    goto :goto_0
.end method

.method private showCallHotlineDialog(Ljava/lang/String;)V
    .locals 5
    .param p1, "tel"    # Ljava/lang/String;

    .prologue
    .line 985
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 986
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Do you want to call the following number: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x1

    .line 987
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/high16 v3, 0x1040000

    .line 988
    invoke-virtual {p0, v3}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x104000a

    .line 989
    invoke-virtual {p0, v3}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lorg/linphone/LinphoneActivity$3;

    invoke-direct {v4, p0, p1}, Lorg/linphone/LinphoneActivity$3;-><init>(Lorg/linphone/LinphoneActivity;Ljava/lang/String;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1005
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1006
    .local v0, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1007
    return-void
.end method

.method private showCallTollFreeDialog()V
    .locals 5

    .prologue
    .line 1010
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1011
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f070224

    invoke-virtual {p0, v2}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x1

    .line 1012
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/high16 v3, 0x1040000

    .line 1013
    invoke-virtual {p0, v3}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070225

    .line 1014
    invoke-virtual {p0, v3}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lorg/linphone/LinphoneActivity$4;

    invoke-direct {v4, p0}, Lorg/linphone/LinphoneActivity$4;-><init>(Lorg/linphone/LinphoneActivity;)V

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1031
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 1032
    .local v0, "alert":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 1033
    return-void
.end method

.method private showOverseaHotlineWebViewDialog()V
    .locals 4

    .prologue
    .line 967
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 969
    .local v0, "alert":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f070136

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 970
    new-instance v1, Landroid/webkit/WebView;

    invoke-direct {v1, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 972
    .local v1, "wv":Landroid/webkit/WebView;
    const v2, 0x7f07021a

    invoke-virtual {p0, v2}, Lorg/linphone/LinphoneActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "zh"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string/jumbo v2, "http://sip.pccwmobile.com/voip02/message/toll_free_numbers_ch.html"

    :goto_0
    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 975
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 976
    const/high16 v2, 0x1040000

    new-instance v3, Lorg/linphone/LinphoneActivity$2;

    invoke-direct {v3, p0}, Lorg/linphone/LinphoneActivity$2;-><init>(Lorg/linphone/LinphoneActivity;)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 981
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 982
    return-void

    .line 972
    :cond_0
    const-string/jumbo v2, "http://sip.pccwmobile.com/voip02/message/toll_free_numbers_en.html"

    goto :goto_0
.end method


# virtual methods
.method public getAndClearDialUri()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 578
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->mDialUri:Landroid/net/Uri;

    .line 579
    .local v0, "dialUri":Landroid/net/Uri;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/linphone/LinphoneActivity;->mDialUri:Landroid/net/Uri;

    .line 580
    return-object v0
.end method

.method protected hideScreen(Z)V
    .locals 1
    .param p1, "isHidden"    # Z

    .prologue
    .line 603
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 604
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/linphone/InCallScreen;->hiddenScreen(Z)V

    .line 605
    :cond_0
    return-void
.end method

.method public initFromConf()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/LinphoneException;
        }
    .end annotation

    .prologue
    .line 565
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 566
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->initFromConf()V
    :try_end_0
    .catch Lorg/linphone/LinphoneConfigException; {:try_start_0 .. :try_end_0} :catch_0

    .line 573
    :cond_0
    :goto_0
    return-void

    .line 567
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 599
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 546
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneActivity;->moveTaskToBack(Z)Z

    .line 547
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    .line 131
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 137
    const v2, 0x7f040055

    invoke-virtual {p0, v2}, Lorg/linphone/LinphoneActivity;->setContentView(I)V

    .line 138
    const-string/jumbo v2, "sensor"

    invoke-virtual {p0, v2}, Lorg/linphone/LinphoneActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/SensorManager;

    iput-object v2, p0, Lorg/linphone/LinphoneActivity;->mSensorManager:Landroid/hardware/SensorManager;

    .line 140
    sput-object p0, Lorg/linphone/LinphoneActivity;->theLinphoneActivity:Lorg/linphone/LinphoneActivity;

    .line 150
    const v2, 0x7f0e0181

    invoke-virtual {p0, v2}, Lorg/linphone/LinphoneActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    iput-object v2, p0, Lorg/linphone/LinphoneActivity;->mMainFrame:Landroid/widget/FrameLayout;

    .line 152
    const-string/jumbo v2, "audio"

    invoke-virtual {p0, v2}, Lorg/linphone/LinphoneActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    iput-object v2, p0, Lorg/linphone/LinphoneActivity;->mAudioManager:Landroid/media/AudioManager;

    .line 155
    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    iput-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 156
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar;->setNavigationMode(I)V

    .line 157
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v2, v6}, Landroid/support/v7/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    .line 160
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-static {v2, v6}, Lcom/pccw/android/common/widget/ActionBarUtils;->setHasEmbeddedTabs(Ljava/lang/Object;Z)V

    .line 162
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 163
    invoke-virtual {v2}, Landroid/support/v7/app/ActionBar;->newTab()Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    const v3, 0x7f02045a

    .line 164
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    const-string/jumbo v3, "DAILPAD"

    .line 165
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setTag(Ljava/lang/Object;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    new-instance v3, Lorg/linphone/LinphoneActivity$TabListener;

    const-string/jumbo v4, "DAILPAD"

    const-class v5, Lorg/linphone/DailPadActivity;

    invoke-direct {v3, p0, v4, v5}, Lorg/linphone/LinphoneActivity$TabListener;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Class;)V

    .line 166
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setTabListener(Landroid/support/v7/app/ActionBar$TabListener;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    .line 169
    .local v1, "tab":Landroid/support/v7/app/ActionBar$Tab;
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v2, v1}, Landroid/support/v7/app/ActionBar;->addTab(Landroid/support/v7/app/ActionBar$Tab;)V

    .line 171
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 172
    invoke-virtual {v2}, Landroid/support/v7/app/ActionBar;->newTab()Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    const v3, 0x7f020456

    .line 173
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    const-string/jumbo v3, "CONTACT"

    .line 174
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setTag(Ljava/lang/Object;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    new-instance v3, Lorg/linphone/LinphoneActivity$TabListener;

    const-string/jumbo v4, "CONTACT"

    const-class v5, Lcom/pccw/mobile/sip/ContactFragment;

    invoke-direct {v3, p0, v4, v5}, Lorg/linphone/LinphoneActivity$TabListener;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Class;)V

    .line 175
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setTabListener(Landroid/support/v7/app/ActionBar$TabListener;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    .line 178
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v2, v1}, Landroid/support/v7/app/ActionBar;->addTab(Landroid/support/v7/app/ActionBar$Tab;)V

    .line 180
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 181
    invoke-virtual {v2}, Landroid/support/v7/app/ActionBar;->newTab()Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    const v3, 0x7f020458

    .line 182
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    const-string/jumbo v3, "HISTORY"

    .line 183
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setTag(Ljava/lang/Object;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    new-instance v3, Lorg/linphone/LinphoneActivity$TabListener;

    const-string/jumbo v4, "HISTORY"

    const-class v5, Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-direct {v3, p0, v4, v5}, Lorg/linphone/LinphoneActivity$TabListener;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Class;)V

    .line 184
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setTabListener(Landroid/support/v7/app/ActionBar$TabListener;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    .line 187
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v2, v1}, Landroid/support/v7/app/ActionBar;->addTab(Landroid/support/v7/app/ActionBar$Tab;)V

    .line 189
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    .line 190
    invoke-virtual {v2}, Landroid/support/v7/app/ActionBar;->newTab()Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    const v3, 0x7f02045d

    .line 191
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setIcon(I)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    const-string/jumbo v3, "MORE"

    .line 192
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setTag(Ljava/lang/Object;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v2

    new-instance v3, Lorg/linphone/LinphoneActivity$TabListener;

    const-string/jumbo v4, "MORE"

    const-class v5, Lcom/pccw/mobile/sip/MoreActivity;

    invoke-direct {v3, p0, v4, v5}, Lorg/linphone/LinphoneActivity$TabListener;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Class;)V

    .line 193
    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar$Tab;->setTabListener(Landroid/support/v7/app/ActionBar$TabListener;)Landroid/support/v7/app/ActionBar$Tab;

    move-result-object v1

    .line 195
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    invoke-virtual {v2, v1}, Landroid/support/v7/app/ActionBar;->addTab(Landroid/support/v7/app/ActionBar$Tab;)V

    .line 197
    if-eqz p1, :cond_0

    .line 198
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->actionBar:Landroid/support/v7/app/ActionBar;

    const-string/jumbo v3, "tab"

    invoke-virtual {p1, v3, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBar;->setSelectedNavigationItem(I)V

    .line 201
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 202
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v2, "android.intent.action.CONFIGURATION_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 203
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v0}, Lorg/linphone/LinphoneActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 204
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 333
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onDestroy()V

    .line 334
    iget-boolean v0, p0, Lorg/linphone/LinphoneActivity;->mBound:Z

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->conn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 336
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/LinphoneActivity;->mBound:Z

    .line 338
    :cond_0
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 339
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 285
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 286
    invoke-virtual {p0, p1}, Lorg/linphone/LinphoneActivity;->setIntent(Landroid/content/Intent;)V

    .line 287
    invoke-direct {p0, p1}, Lorg/linphone/LinphoneActivity;->setCurrentTagByIntent(Landroid/content/Intent;)V

    .line 293
    return-void
.end method

.method protected onPause()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 298
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onPause()V

    .line 304
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    if-eqz v0, :cond_0

    .line 305
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 306
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/LinphoneActivity;->loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    .line 308
    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 310
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x4

    if-gt v0, v1, :cond_2

    .line 311
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v3}, Landroid/media/AudioManager;->setMode(I)V

    .line 312
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x2

    const/4 v2, -0x1

    invoke-virtual {v0, v3, v1, v2}, Landroid/media/AudioManager;->setRouting(III)V

    .line 317
    :goto_0
    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->stopProxymitySensor()V

    .line 321
    :cond_1
    return-void

    .line 315
    :cond_2
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v3}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 6

    .prologue
    .line 213
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onResume()V

    .line 217
    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/pccw/mobile/sip/CheckVersionActivity;->canSkipCheckVersion(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 218
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v3}, Lorg/linphone/LinphoneActivity;->startActivity(Landroid/content/Intent;)V

    .line 219
    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->finish()V

    .line 265
    :cond_0
    :goto_0
    return-void

    .line 223
    :cond_1
    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/pccw/mobile/sip/ClientStateManager;->checkSimState(Landroid/content/Context;Z)I

    move-result v2

    .line 224
    .local v2, "state":I
    if-eqz v2, :cond_3

    .line 225
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    iget v3, v3, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v3, :cond_2

    .line 226
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 235
    :cond_2
    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const-class v5, Lcom/pccw/mobile/sip/TAndCActivity;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v3}, Lorg/linphone/LinphoneActivity;->startActivity(Landroid/content/Intent;)V

    .line 236
    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_3

    .line 237
    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->finish()V

    .line 240
    :cond_3
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v3

    invoke-virtual {v3}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v3

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v3

    if-lez v3, :cond_4

    .line 241
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v3

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 242
    .local v0, "currentCall":Lorg/linphone/core/LinphoneCall;
    if-eqz v0, :cond_5

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v3

    invoke-interface {v3}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 243
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->openVideoCallScreen(Landroid/content/Context;)V

    .line 250
    .end local v0    # "currentCall":Lorg/linphone/core/LinphoneCall;
    :cond_4
    :goto_1
    iget-object v3, p0, Lorg/linphone/LinphoneActivity;->loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    if-nez v3, :cond_0

    .line 251
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 252
    .local v1, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v3, "com.pccw.mobile.sip.intent.loginerror"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 253
    const-string/jumbo v3, "com.pccw.mobile.sip.intent.logindisconnected"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 254
    const-string/jumbo v3, "com.pccw.mobile.sip.intent.loginwarning"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 255
    const-string/jumbo v3, "com.pccw.mobile.sip.intent.callforwardsucceed"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 256
    const-string/jumbo v3, "com.pccw.mobile.sip.intent.daypass"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 257
    new-instance v3, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    invoke-direct {v3, p0, p0}, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;-><init>(Lorg/linphone/LinphoneActivity;Landroid/app/Activity;)V

    iput-object v3, p0, Lorg/linphone/LinphoneActivity;->loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    .line 262
    iget-object v3, p0, Lorg/linphone/LinphoneActivity;->loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    if-eqz v3, :cond_0

    .line 263
    iget-object v3, p0, Lorg/linphone/LinphoneActivity;->loginErrorWarningReceiver:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver;

    invoke-virtual {p0, v3, v1}, Lorg/linphone/LinphoneActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto/16 :goto_0

    .line 245
    .end local v1    # "filter":Landroid/content/IntentFilter;
    .restart local v0    # "currentCall":Lorg/linphone/core/LinphoneCall;
    :cond_5
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    invoke-virtual {v3, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->openIncallScreen(Landroid/content/Context;)V

    goto :goto_1
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 115
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 116
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->mMainFrame:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 117
    sget-object v0, Lorg/linphone/LinphoneActivity;->SCREEN_IS_HIDDEN:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 121
    :goto_0
    const-string/jumbo v0, "tab"

    invoke-virtual {p0}, Lorg/linphone/LinphoneActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBar;->getSelectedNavigationIndex()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 122
    return-void

    .line 119
    :cond_0
    sget-object v0, Lorg/linphone/LinphoneActivity;->SCREEN_IS_HIDDEN:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 208
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onStart()V

    .line 209
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 326
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActionBarActivity;->onStop()V

    .line 327
    return-void
.end method

.method protected declared-synchronized startProxymitySensor()V
    .locals 5

    .prologue
    .line 611
    monitor-enter p0

    :try_start_0
    sget-object v1, Lorg/linphone/LinphoneActivity;->mSensorEventListener:Landroid/hardware/SensorEventListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 645
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 616
    :cond_1
    :try_start_1
    iget-object v1, p0, Lorg/linphone/LinphoneActivity;->mSensorManager:Landroid/hardware/SensorManager;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v0

    .line 617
    .local v0, "lSensorList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Sensor;>;"
    new-instance v1, Lorg/linphone/LinphoneActivity$1;

    invoke-direct {v1, p0}, Lorg/linphone/LinphoneActivity$1;-><init>(Lorg/linphone/LinphoneActivity;)V

    sput-object v1, Lorg/linphone/LinphoneActivity;->mSensorEventListener:Landroid/hardware/SensorEventListener;

    .line 638
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 639
    iget-object v2, p0, Lorg/linphone/LinphoneActivity;->mSensorManager:Landroid/hardware/SensorManager;

    sget-object v3, Lorg/linphone/LinphoneActivity;->mSensorEventListener:Landroid/hardware/SensorEventListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/Sensor;

    const/4 v4, 0x2

    invoke-virtual {v2, v3, v1, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 611
    .end local v0    # "lSensorList":Ljava/util/List;, "Ljava/util/List<Landroid/hardware/Sensor;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected startprefActivity()V
    .locals 0

    .prologue
    .line 560
    return-void
.end method

.method protected declared-synchronized stopProxymitySensor()V
    .locals 2

    .prologue
    .line 649
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    .line 650
    iget-object v0, p0, Lorg/linphone/LinphoneActivity;->mSensorManager:Landroid/hardware/SensorManager;

    sget-object v1, Lorg/linphone/LinphoneActivity;->mSensorEventListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 651
    const/4 v0, 0x0

    sput-object v0, Lorg/linphone/LinphoneActivity;->mSensorEventListener:Landroid/hardware/SensorEventListener;

    .line 653
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneActivity;->hideScreen(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 655
    monitor-exit p0

    return-void

    .line 649
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
