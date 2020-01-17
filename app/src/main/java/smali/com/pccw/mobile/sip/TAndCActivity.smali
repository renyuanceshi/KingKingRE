.class public Lcom/pccw/mobile/sip/TAndCActivity;
.super Lcom/pccw/mobile/sip/BaseActivity;
.source "TAndCActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;,
        Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;
    }
.end annotation


# static fields
.field public static T_AND_C_NEW_VERSION_AVAILABLE:I = 0x0

.field public static T_AND_C_NEW_VERSION_ERROR:I = 0x0

.field public static T_AND_C_NEW_VERSION_NOT_AVAILABLE:I = 0x0

.field private static final T_AND_C_VERSION_1010_POSTPAID:Ljava/lang/String; = "T_AND_C_VERSION_1010_POSTPAID_STRING"

.field private static final T_AND_C_VERSION_CSL_PREPAID:Ljava/lang/String; = "T_AND_C_VERSION_CSL_PREPAID_STRING"

.field private static final T_AND_C_VERSION_DEFAULT:Ljava/lang/String; = "0.0.0"

.field private static final T_AND_C_VERSION_HKT_POSTPAID:Ljava/lang/String; = "T_AND_C_VERSION_POSTPAID_STRING"

.field private static final T_AND_C_VERSION_HKT_PREPAID:Ljava/lang/String; = "T_AND_C_VERSION_PREPAID_STRING"

.field private static final T_AND_C_VERSION_ONE2FREE_POSTPAID:Ljava/lang/String; = "T_AND_C_VERSION_ONE2FREE_POSTPAID_STRING"

.field private static new1010TAndCVersion:Ljava/lang/String;

.field private static newCSLPrepaidTAndCVersion:Ljava/lang/String;

.field private static newHKTPostpaidTAndCVersion:Ljava/lang/String;

.field private static newHKTPrepaidTAndCVersion:Ljava/lang/String;

.field private static newOne2FreeTAndCVersion:Ljava/lang/String;

.field private static tcURLChi1010:Ljava/lang/String;

.field private static tcURLChiCSLPrepaid:Ljava/lang/String;

.field private static tcURLChiHKTPostpaid:Ljava/lang/String;

.field private static tcURLChiHKTPrepaid:Ljava/lang/String;

.field private static tcURLChiOne2Free:Ljava/lang/String;

.field private static tcURLEng1010:Ljava/lang/String;

.field private static tcURLEngCSLPrepaid:Ljava/lang/String;

.field private static tcURLEngHKTPostpaid:Ljava/lang/String;

.field private static tcURLEngHKTPrepaid:Ljava/lang/String;

.field private static tcURLEngOne2Free:Ljava/lang/String;


# instance fields
.field private acceptButton:Landroid/widget/Button;

.field private acceptRecorder:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

.field private declineButton:Landroid/widget/Button;

.field private destinationURL:Ljava/lang/String;

.field private loadTAndCError:Z

.field private loadingDialog:Landroid/app/AlertDialog;

.field private pageChecker:Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

.field private tcWebView:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 50
    const/4 v0, -0x1

    sput v0, Lcom/pccw/mobile/sip/TAndCActivity;->T_AND_C_NEW_VERSION_ERROR:I

    .line 51
    const/4 v0, 0x0

    sput v0, Lcom/pccw/mobile/sip/TAndCActivity;->T_AND_C_NEW_VERSION_NOT_AVAILABLE:I

    .line 52
    const/4 v0, 0x1

    sput v0, Lcom/pccw/mobile/sip/TAndCActivity;->T_AND_C_NEW_VERSION_AVAILABLE:I

    .line 65
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiHKTPostpaid:Ljava/lang/String;

    .line 66
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngHKTPostpaid:Ljava/lang/String;

    .line 67
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiHKTPrepaid:Ljava/lang/String;

    .line 68
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngHKTPrepaid:Ljava/lang/String;

    .line 69
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiOne2Free:Ljava/lang/String;

    .line 70
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngOne2Free:Ljava/lang/String;

    .line 71
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChi1010:Ljava/lang/String;

    .line 72
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEng1010:Ljava/lang/String;

    .line 73
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiCSLPrepaid:Ljava/lang/String;

    .line 74
    sput-object v1, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngCSLPrepaid:Ljava/lang/String;

    .line 75
    const-string/jumbo v0, "0.0.0"

    sput-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPostpaidTAndCVersion:Ljava/lang/String;

    .line 76
    const-string/jumbo v0, "0.0.0"

    sput-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPrepaidTAndCVersion:Ljava/lang/String;

    .line 77
    const-string/jumbo v0, "0.0.0"

    sput-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->newOne2FreeTAndCVersion:Ljava/lang/String;

    .line 78
    const-string/jumbo v0, "0.0.0"

    sput-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->new1010TAndCVersion:Ljava/lang/String;

    .line 79
    const-string/jumbo v0, "0.0.0"

    sput-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->newCSLPrepaidTAndCVersion:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Lcom/pccw/mobile/sip/BaseActivity;-><init>()V

    .line 63
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadTAndCError:Z

    .line 81
    iput-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity;->destinationURL:Ljava/lang/String;

    .line 82
    iput-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity;->pageChecker:Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    .line 83
    iput-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptRecorder:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    .line 85
    iput-object v1, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$100(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/widget/Button;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->declineButton:Landroid/widget/Button;

    return-object v0
.end method

.method static synthetic access$1000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEng1010:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiCSLPrepaid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngCSLPrepaid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiHKTPrepaid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngHKTPrepaid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1500()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiHKTPostpaid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1600()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngHKTPostpaid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1800()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPrepaidTAndCVersion:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1900()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->newCSLPrepaidTAndCVersion:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/TAndCActivity;)Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptRecorder:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    return-object v0
.end method

.method static synthetic access$2000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->new1010TAndCVersion:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/pccw/mobile/sip/TAndCActivity;Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;)Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;
    .param p1, "x1"    # Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptRecorder:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    return-object p1
.end method

.method static synthetic access$2100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->newOne2FreeTAndCVersion:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPostpaidTAndCVersion:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/pccw/mobile/sip/TAndCActivity;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/TAndCActivity;->gotoNextActivity(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/app/AlertDialog;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$302(Lcom/pccw/mobile/sip/TAndCActivity;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;
    .param p1, "x1"    # Landroid/app/AlertDialog;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$400(Lcom/pccw/mobile/sip/TAndCActivity;)Landroid/webkit/WebView;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->tcWebView:Landroid/webkit/WebView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/TAndCActivity;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadTAndCError:Z

    return v0
.end method

.method static synthetic access$502(Lcom/pccw/mobile/sip/TAndCActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadTAndCError:Z

    return p1
.end method

.method static synthetic access$600(Lcom/pccw/mobile/sip/TAndCActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->destinationURL:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$602(Lcom/pccw/mobile/sip/TAndCActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/TAndCActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/pccw/mobile/sip/TAndCActivity;->destinationURL:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$700()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiOne2Free:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngOne2Free:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900()Ljava/lang/String;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChi1010:Ljava/lang/String;

    return-object v0
.end method

.method public static checkTAndCVersion(Lcom/pccw/mobile/sip/CheckVersionResponse;Landroid/content/Context;)I
    .locals 11
    .param p0, "result"    # Lcom/pccw/mobile/sip/CheckVersionResponse;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    .line 526
    const/4 v3, 0x0

    .line 527
    .local v3, "currentPostpaidVersion":Ljava/lang/String;
    const/4 v4, 0x0

    .line 528
    .local v4, "currentPrepaidVersion":Ljava/lang/String;
    const/4 v2, 0x0

    .line 529
    .local v2, "currentOne2FreeVersion":Ljava/lang/String;
    const/4 v0, 0x0

    .line 530
    .local v0, "current1010Version":Ljava/lang/String;
    const/4 v1, 0x0

    .line 533
    .local v1, "currentCSLPrepaidVersion":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPostpaidTCAccepted(Landroid/content/Context;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 534
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPrepaidTCAccepted(Landroid/content/Context;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 535
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaidTCAccepted(Landroid/content/Context;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 536
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaidTCAccepted(Landroid/content/Context;)Z

    move-result v8

    if-eqz v8, :cond_7

    :cond_0
    const/4 v6, 0x1

    .line 538
    .local v6, "read":Z
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 537
    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string/jumbo v9, "T_AND_C_VERSION_PREPAID_STRING"

    const-string/jumbo v10, "0.0.0"

    .line 538
    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 541
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 540
    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string/jumbo v9, "T_AND_C_VERSION_POSTPAID_STRING"

    const-string/jumbo v10, "0.0.0"

    .line 541
    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 544
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 543
    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string/jumbo v9, "T_AND_C_VERSION_ONE2FREE_POSTPAID_STRING"

    const-string/jumbo v10, "0.0.0"

    .line 544
    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 547
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 546
    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string/jumbo v9, "T_AND_C_VERSION_1010_POSTPAID_STRING"

    const-string/jumbo v10, "0.0.0"

    .line 547
    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 550
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v8

    .line 549
    invoke-static {v8}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v8

    const-string/jumbo v9, "T_AND_C_VERSION_CSL_PREPAID_STRING"

    const-string/jumbo v10, "0.0.0"

    .line 550
    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 552
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_prepaid:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiHKTPrepaid:Ljava/lang/String;

    .line 553
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_prepaid:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngHKTPrepaid:Ljava/lang/String;

    .line 554
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiHKTPostpaid:Ljava/lang/String;

    .line 555
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngHKTPostpaid:Ljava/lang/String;

    .line 556
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_one2free:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiOne2Free:Ljava/lang/String;

    .line 557
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_one2free:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngOne2Free:Ljava/lang/String;

    .line 558
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_1010:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChi1010:Ljava/lang/String;

    .line 559
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_1010:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEng1010:Ljava/lang/String;

    .line 560
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_csl_prepaid:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLChiCSLPrepaid:Ljava/lang/String;

    .line 561
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_csl_prepaid:Ljava/lang/String;

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->tcURLEngCSLPrepaid:Ljava/lang/String;

    .line 564
    :try_start_0
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version:Ljava/lang/String;

    if-eqz v8, :cond_8

    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_prepaid:Ljava/lang/String;

    if-eqz v8, :cond_8

    .line 565
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_prepaid:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPrepaidTAndCVersion:Ljava/lang/String;

    .line 566
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPostpaidTAndCVersion:Ljava/lang/String;

    .line 567
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_one2free:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newOne2FreeTAndCVersion:Ljava/lang/String;

    .line 568
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_1010:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->new1010TAndCVersion:Ljava/lang/String;

    .line 569
    iget-object v8, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_version_csl_prepaid:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newCSLPrepaidTAndCVersion:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 587
    :goto_1
    sget-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPrepaidTAndCVersion:Ljava/lang/String;

    invoke-static {v4, v8}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 588
    invoke-static {p1, v7}, Lcom/pccw/mobile/sip/ClientStateManager;->setPrepaidTcAccepted(Landroid/content/Context;Z)Z

    .line 589
    const/4 v6, 0x0

    .line 592
    :cond_1
    sget-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPostpaidTAndCVersion:Ljava/lang/String;

    invoke-static {v3, v8}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 593
    invoke-static {p1, v7}, Lcom/pccw/mobile/sip/ClientStateManager;->setPostpaidTcAccepted(Landroid/content/Context;Z)Z

    .line 594
    const/4 v6, 0x0

    .line 597
    :cond_2
    sget-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newOne2FreeTAndCVersion:Ljava/lang/String;

    invoke-static {v2, v8}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 598
    invoke-static {p1, v7}, Lcom/pccw/mobile/sip/ClientStateManager;->setCSLPostpaidTcAccepted(Landroid/content/Context;Z)Z

    .line 599
    const/4 v6, 0x0

    .line 602
    :cond_3
    sget-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->new1010TAndCVersion:Ljava/lang/String;

    invoke-static {v0, v8}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 603
    invoke-static {p1, v7}, Lcom/pccw/mobile/sip/ClientStateManager;->setCSLPostpaidTcAccepted(Landroid/content/Context;Z)Z

    .line 604
    const/4 v6, 0x0

    .line 607
    :cond_4
    sget-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newCSLPrepaidTAndCVersion:Ljava/lang/String;

    invoke-static {v1, v8}, Lcom/pccw/mobile/sip/util/VersionUtils;->isNewerVersion(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 608
    invoke-static {p1, v7}, Lcom/pccw/mobile/sip/ClientStateManager;->setCSLPrepaidTcAccepted(Landroid/content/Context;Z)Z

    .line 609
    const/4 v6, 0x0

    .line 612
    :cond_5
    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_prepaid:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_prepaid:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_one2free:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_one2free:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_1010:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_1010:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_c_csl_prepaid:Ljava/lang/String;

    if-eqz v7, :cond_6

    iget-object v7, p0, Lcom/pccw/mobile/sip/CheckVersionResponse;->t_and_c_url_e_csl_prepaid:Ljava/lang/String;

    if-nez v7, :cond_9

    .line 617
    :cond_6
    sget v7, Lcom/pccw/mobile/sip/TAndCActivity;->T_AND_C_NEW_VERSION_ERROR:I

    .line 621
    :goto_2
    return v7

    .end local v6    # "read":Z
    :cond_7
    move v6, v7

    .line 536
    goto/16 :goto_0

    .line 571
    .restart local v6    # "read":Z
    :cond_8
    :try_start_1
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPrepaidTAndCVersion:Ljava/lang/String;

    .line 572
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPostpaidTAndCVersion:Ljava/lang/String;

    .line 573
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newOne2FreeTAndCVersion:Ljava/lang/String;

    .line 574
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->new1010TAndCVersion:Ljava/lang/String;

    .line 575
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newCSLPrepaidTAndCVersion:Ljava/lang/String;

    .line 576
    sget v7, Lcom/pccw/mobile/sip/TAndCActivity;->T_AND_C_NEW_VERSION_ERROR:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 578
    :catch_0
    move-exception v5

    .line 579
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPrepaidTAndCVersion:Ljava/lang/String;

    .line 580
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newHKTPostpaidTAndCVersion:Ljava/lang/String;

    .line 581
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newOne2FreeTAndCVersion:Ljava/lang/String;

    .line 582
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->new1010TAndCVersion:Ljava/lang/String;

    .line 583
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    sput-object v8, Lcom/pccw/mobile/sip/TAndCActivity;->newCSLPrepaidTAndCVersion:Ljava/lang/String;

    .line 584
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 619
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_9
    if-nez v6, :cond_a

    .line 620
    sget v7, Lcom/pccw/mobile/sip/TAndCActivity;->T_AND_C_NEW_VERSION_AVAILABLE:I

    goto :goto_2

    .line 621
    :cond_a
    sget v7, Lcom/pccw/mobile/sip/TAndCActivity;->T_AND_C_NEW_VERSION_NOT_AVAILABLE:I

    goto :goto_2
.end method

.method private gotoNextActivity(Z)V
    .locals 3
    .param p1, "showUserGuide"    # Z

    .prologue
    .line 891
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    if-eqz p1, :cond_1

    const-class v0, Lcom/pccw/mobile/sip/UserGuidePager;

    :goto_0
    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/pccw/mobile/sip/TAndCActivity;->startActivity(Landroid/content/Intent;)V

    .line 892
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 893
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->finish()V

    .line 894
    :cond_0
    return-void

    .line 891
    :cond_1
    const-class v0, Lorg/linphone/LinphoneActivity;

    goto :goto_0
.end method

.method public static isCSLPostpaidTAndCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 506
    const/4 v0, 0x0

    .line 508
    .local v0, "result":Z
    if-eqz p0, :cond_0

    .line 509
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaidTCAccepted(Landroid/content/Context;)Z

    move-result v0

    .line 512
    :cond_0
    return v0
.end method

.method public static isCSLPrepaidTAndCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 516
    const/4 v0, 0x0

    .line 518
    .local v0, "result":Z
    if-eqz p0, :cond_0

    .line 519
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaidTCAccepted(Landroid/content/Context;)Z

    move-result v0

    .line 522
    :cond_0
    return v0
.end method

.method public static isHKTPostpaidTAndCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 486
    const/4 v0, 0x0

    .line 488
    .local v0, "result":Z
    if-eqz p0, :cond_0

    .line 489
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPostpaidTCAccepted(Landroid/content/Context;)Z

    move-result v0

    .line 492
    :cond_0
    return v0
.end method

.method public static isHKTPrepaidTAndCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 496
    const/4 v0, 0x0

    .line 498
    .local v0, "result":Z
    if-eqz p0, :cond_0

    .line 499
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPrepaidTCAccepted(Landroid/content/Context;)Z

    move-result v0

    .line 502
    :cond_0
    return v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v1, 0x400

    .line 91
    invoke-super {p0, p1}, Lcom/pccw/mobile/sip/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 92
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 94
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    if-nez v0, :cond_0

    .line 95
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    new-instance v1, Lcom/pccw/mobile/sip/ServerMessageController;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/sip/ServerMessageController;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    .line 96
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 360
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onPause()V

    .line 361
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->pageChecker:Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->pageChecker:Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 362
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->pageChecker:Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->errorDialogCleanUp()V

    .line 363
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->pageChecker:Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->cancel(Z)Z

    .line 365
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptRecorder:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptRecorder:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 366
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptRecorder:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->errorDialogCleanUp()V

    .line 367
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptRecorder:Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/TAndCActivity$ServerTCAcceptRecorder;->cancel(Z)Z

    .line 369
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 370
    iget-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 371
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    .line 373
    :cond_2
    return-void
.end method

.method protected onResume()V
    .locals 9

    .prologue
    const v8, 0x7f07006a

    const v7, 0x7f020436

    const/4 v6, 0x0

    .line 100
    invoke-super {p0}, Lcom/pccw/mobile/sip/BaseActivity;->onResume()V

    .line 104
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/pccw/mobile/sip/CheckVersionActivity;->canSkipCheckVersion(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 105
    new-instance v4, Landroid/content/Intent;

    const-class v5, Lcom/pccw/mobile/sip/CheckVersionActivity;

    invoke-direct {v4, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->startActivity(Landroid/content/Intent;)V

    .line 106
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->finish()V

    .line 354
    :goto_0
    return-void

    .line 109
    :cond_0
    const-string/jumbo v4, "ABC"

    const-string/jumbo v5, "123"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v6}, Lcom/pccw/mobile/sip/ClientStateManager;->checkSimState(Landroid/content/Context;Z)I

    move-result v3

    .line 112
    .local v3, "state":I
    if-eqz v3, :cond_1

    .line 113
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    iget v4, v4, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v4, :cond_1

    .line 114
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 116
    :cond_1
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 117
    :cond_2
    invoke-static {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->isHKTPrepaidTAndCRead(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 118
    invoke-direct {p0, v6}, Lcom/pccw/mobile/sip/TAndCActivity;->gotoNextActivity(Z)V

    goto :goto_0

    .line 121
    :cond_3
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaid(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 122
    invoke-static {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->isCSLPostpaidTAndCRead(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 123
    invoke-direct {p0, v6}, Lcom/pccw/mobile/sip/TAndCActivity;->gotoNextActivity(Z)V

    goto :goto_0

    .line 126
    :cond_4
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 127
    invoke-static {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->isCSLPrepaidTAndCRead(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 128
    invoke-direct {p0, v6}, Lcom/pccw/mobile/sip/TAndCActivity;->gotoNextActivity(Z)V

    goto :goto_0

    .line 132
    :cond_5
    invoke-static {p0}, Lcom/pccw/mobile/sip/TAndCActivity;->isHKTPostpaidTAndCRead(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 133
    invoke-direct {p0, v6}, Lcom/pccw/mobile/sip/TAndCActivity;->gotoNextActivity(Z)V

    goto :goto_0

    .line 137
    :cond_6
    const-string/jumbo v4, "ABC"

    const-string/jumbo v5, "456"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    const v4, 0x7f04007d

    invoke-virtual {p0, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->setContentView(I)V

    .line 141
    const v4, 0x7f0e01eb

    invoke-virtual {p0, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/webkit/WebView;

    iput-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->tcWebView:Landroid/webkit/WebView;

    .line 142
    const v4, 0x7f0e01e9

    invoke-virtual {p0, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    iput-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptButton:Landroid/widget/Button;

    .line 143
    const v4, 0x7f0e01e8

    invoke-virtual {p0, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    iput-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->declineButton:Landroid/widget/Button;

    .line 145
    iput-boolean v6, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadTAndCError:Z

    .line 180
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 181
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 182
    .local v1, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0, v8}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 183
    invoke-virtual {v1, v7}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 184
    const v4, 0x7f07006b

    invoke-virtual {p0, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 185
    const v4, 0x7f07015b

    invoke-virtual {p0, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/pccw/mobile/sip/TAndCActivity$1;

    invoke-direct {v5, p0}, Lcom/pccw/mobile/sip/TAndCActivity$1;-><init>(Lcom/pccw/mobile/sip/TAndCActivity;)V

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 192
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 194
    .local v0, "errorDialog":Landroid/app/AlertDialog;
    new-instance v4, Lcom/pccw/mobile/sip/TAndCActivity$2;

    invoke-direct {v4, p0}, Lcom/pccw/mobile/sip/TAndCActivity$2;-><init>(Lcom/pccw/mobile/sip/TAndCActivity;)V

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 202
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    goto/16 :goto_0

    .line 206
    .end local v0    # "errorDialog":Landroid/app/AlertDialog;
    .end local v1    # "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    :cond_7
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 207
    .local v2, "loadingDialogBuilder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {p0, v8}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 208
    invoke-virtual {v2, v7}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 209
    const v4, 0x7f07016c

    invoke-virtual {p0, v4}, Lcom/pccw/mobile/sip/TAndCActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 211
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    iput-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    .line 212
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4, v6}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 213
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4, v6}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 215
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->loadingDialog:Landroid/app/AlertDialog;

    invoke-virtual {v4}, Landroid/app/AlertDialog;->show()V

    .line 218
    new-instance v4, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    invoke-direct {v4, p0, p0}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;-><init>(Lcom/pccw/mobile/sip/TAndCActivity;Landroid/app/Activity;)V

    iput-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->pageChecker:Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    .line 219
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->pageChecker:Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;

    new-array v5, v6, [Ljava/lang/Void;

    invoke-virtual {v4, v5}, Lcom/pccw/mobile/sip/TAndCActivity$PageChecker;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 221
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->acceptButton:Landroid/widget/Button;

    new-instance v5, Lcom/pccw/mobile/sip/TAndCActivity$3;

    invoke-direct {v5, p0}, Lcom/pccw/mobile/sip/TAndCActivity$3;-><init>(Lcom/pccw/mobile/sip/TAndCActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->declineButton:Landroid/widget/Button;

    new-instance v5, Lcom/pccw/mobile/sip/TAndCActivity$4;

    invoke-direct {v5, p0}, Lcom/pccw/mobile/sip/TAndCActivity$4;-><init>(Lcom/pccw/mobile/sip/TAndCActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 252
    iget-object v4, p0, Lcom/pccw/mobile/sip/TAndCActivity;->tcWebView:Landroid/webkit/WebView;

    new-instance v5, Lcom/pccw/mobile/sip/TAndCActivity$5;

    invoke-direct {v5, p0}, Lcom/pccw/mobile/sip/TAndCActivity$5;-><init>(Lcom/pccw/mobile/sip/TAndCActivity;)V

    invoke-virtual {v4, v5}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    goto/16 :goto_0
.end method
