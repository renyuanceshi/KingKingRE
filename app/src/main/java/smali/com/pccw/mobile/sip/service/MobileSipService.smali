.class public Lcom/pccw/mobile/sip/service/MobileSipService;
.super Ljava/lang/Object;
.source "MobileSipService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;
    }
.end annotation


# static fields
.field public static final CALL_FORWARDING_ACTIVATED:I = 0x0

.field public static final CALL_FORWARDING_ACTIVATING:I = 0x2

.field public static final CALL_FORWARDING_DEACTIVATED:I = 0x1

.field public static final CALL_FORWARDING_DEACTIVATING:I = 0x3

.field public static final CALL_FORWARDING_FORWARDALREADY:I = 0x4

.field public static final CALL_FORWARDING_UNKNOWN:I = -0x1

.field private static final DEFAULT_AUTOSTART:Z = false

.field private static final FW_NUMBER:Ljava/lang/String; = "-fw_number-"

.field public static final HEARTBEAT_SESSION_EXPIRED_VALUE:Ljava/lang/String; = "1"

.field public static final HEARTBEAT_SUCCESS_VALUE:Ljava/lang/String; = "0"

.field protected static final NEW_VERSION_NOTIFY_ID:I = 0x2726

.field public static final OS:Ljava/lang/String;

.field private static final PREF_AUTOSTART:Ljava/lang/String; = "PREF_AUTOSTART"

.field private static final PREF_FIRST_RUN:Ljava/lang/String; = "PREF_FIRST_RUN"

.field public static final STATUS_2N_DEVICE_ID_ERROR:I = -0x8

.field public static final STATUS_2N_REGISTERED_ELSEWHERE_ERROR:I = -0x9

.field public static final STATUS_2N_REGISTRATION_ERROR:I = -0x7

.field public static final STATUS_LOGIN_FAILED_SERVER_ERROR:I = -0x3

.field public static final STATUS_LOGIN_NETWORK_ERROR:I = -0x6

.field public static final STATUS_LOGIN_NO_AVAILABLE_NETWORK:I = -0x5

.field public static final STATUS_LOGIN_OTHER_ERROR:I = -0xa

.field public static final STATUS_LOGIN_SUCCEED:I = 0x0

.field public static final STATUS_NOT_LOGINED:I = -0x64

.field public static final STATUS_SIM_NOT_READY:I = -0x4

.field private static brightWakeLock:Landroid/os/PowerManager$WakeLock;

.field private static encryptedPccwPrepaidImsi:Ljava/lang/String;

.field private static heartBeatRetryCount:I

.field private static final instance:Lcom/pccw/mobile/sip/service/MobileSipService;

.field private static wakeLock:Landroid/os/PowerManager$WakeLock;

.field private static wifiLock:Landroid/net/wifi/WifiManager$WifiLock;


# instance fields
.field public backendHandler:Landroid/os/Handler;

.field private callForwardingState:I

.field private checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

.field private currentCodec:Ljava/lang/String;

.field public currentRegisterCallId:Ljava/lang/String;

.field public dayPassAlertOKClicked:Z

.field private getCalleeoriginalNumber:Ljava/util/HashMap;
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

.field private isAutoLoginRunning:Z

.field private isDisconnecting:Z

.field public isFirstAlertOfCONNECTIVITY_ACTION:Z

.field private isFirstSipRegisterSuccessHanled:Z

.field private isInHK:Z

.field private isLoginRunning:Z

.field private isReLoginRunning:Z

.field private isSuccess:Z

.field private lastCallForwardResponse:Lcom/pccw/mobile/sip/service/CallForwardResponse;

.field private lastGetCalleeStatusResponse:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

.field private lastWifiSleepPolicy:I

.field private loginErrorMsg:Ljava/lang/String;

.field public loginRetryCount:I

.field public loginStatus:I

.field public messageController:Lcom/pccw/mobile/sip/ServerMessageController;

.field private needPrepaidTopUpReminderCheck:Z

.field private originalNumber:Ljava/util/HashMap;
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

.field protected sessionId:Ljava/lang/String;

.field public shouldAutologin:Z

.field public shouldRelogin:Z

.field protected shouldShowOverseaErrorMSG:Z

.field private sipRegistrationFailCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 87
    new-instance v0, Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-direct {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;-><init>()V

    sput-object v0, Lcom/pccw/mobile/sip/service/MobileSipService;->instance:Lcom/pccw/mobile/sip/service/MobileSipService;

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "android_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/pccw/mobile/sip/service/MobileSipService;->OS:Ljava/lang/String;

    .line 127
    const/4 v0, 0x0

    sput v0, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    .line 131
    const-string/jumbo v0, ""

    sput-object v0, Lcom/pccw/mobile/sip/service/MobileSipService;->encryptedPccwPrepaidImsi:Ljava/lang/String;

    .line 162
    sput-object v2, Lcom/pccw/mobile/sip/service/MobileSipService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 163
    sput-object v2, Lcom/pccw/mobile/sip/service/MobileSipService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    .line 164
    sput-object v2, Lcom/pccw/mobile/sip/service/MobileSipService;->brightWakeLock:Landroid/os/PowerManager$WakeLock;

    return-void
.end method

.method protected constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    const/16 v0, -0x64

    iput v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 112
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isSuccess:Z

    .line 124
    iput-boolean v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isFirstAlertOfCONNECTIVITY_ACTION:Z

    .line 125
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    .line 126
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    .line 129
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->dayPassAlertOKClicked:Z

    .line 141
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 142
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning:Z

    .line 143
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting:Z

    .line 144
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isReLoginRunning:Z

    .line 145
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning:Z

    .line 148
    const/4 v0, -0x1

    iput v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->lastWifiSleepPolicy:I

    .line 149
    iput v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginRetryCount:I

    .line 151
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->needPrepaidTopUpReminderCheck:Z

    .line 152
    iput v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sipRegistrationFailCount:I

    .line 155
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isInHK:Z

    .line 157
    iput v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->callForwardingState:I

    .line 158
    iput-object v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->lastCallForwardResponse:Lcom/pccw/mobile/sip/service/CallForwardResponse;

    .line 159
    iput-object v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->lastGetCalleeStatusResponse:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    .line 160
    iput-object v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .line 182
    iput-object v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    .line 184
    iput-object v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->currentCodec:Ljava/lang/String;

    .line 186
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldShowOverseaErrorMSG:Z

    .line 134
    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/os/Handler;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/os/Handler;
    .param p2, "x2"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->doHttpsLogin(Landroid/os/Handler;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/pccw/mobile/sip/service/MobileSipService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting:Z

    return v0
.end method

.method static synthetic access$1002(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting:Z

    return p1
.end method

.method static synthetic access$102(Lcom/pccw/mobile/sip/service/MobileSipService;Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;)Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginDisconnecting(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/pccw/mobile/sip/service/MobileSipService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isFirstSipRegisterSuccessHanled:Z

    return v0
.end method

.method static synthetic access$1300(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->stopHeartbeat(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->stopReLogin(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$1502(Lcom/pccw/mobile/sip/service/MobileSipService;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->currentCodec:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1602(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning:Z

    return p1
.end method

.method static synthetic access$1702(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isReLoginRunning:Z

    return p1
.end method

.method static synthetic access$1802(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning:Z

    return p1
.end method

.method static synthetic access$1900(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->stopEngine(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$200(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->restartEngine(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$2000()Landroid/net/wifi/WifiManager$WifiLock;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lcom/pccw/mobile/sip/service/MobileSipService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    return-object v0
.end method

.method static synthetic access$2100()Landroid/os/PowerManager$WakeLock;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lcom/pccw/mobile/sip/service/MobileSipService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$2200()Landroid/os/PowerManager$WakeLock;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lcom/pccw/mobile/sip/service/MobileSipService;->brightWakeLock:Landroid/os/PowerManager$WakeLock;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginDisconnected(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/mobile/sip/service/MobileSipService;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 86
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->callForwardingState:I

    return v0
.end method

.method static synthetic access$302(Lcom/pccw/mobile/sip/service/MobileSipService;I)I
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # I

    .prologue
    .line 86
    iput p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->callForwardingState:I

    return p1
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lcom/pccw/mobile/sip/service/MobileSipService;->encryptedPccwPrepaidImsi:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/mobile/sip/service/MobileSipService;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->getLang()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$602(Lcom/pccw/mobile/sip/service/MobileSipService;Lcom/pccw/mobile/sip/service/CallForwardResponse;)Lcom/pccw/mobile/sip/service/CallForwardResponse;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Lcom/pccw/mobile/sip/service/CallForwardResponse;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->lastCallForwardResponse:Lcom/pccw/mobile/sip/service/CallForwardResponse;

    return-object p1
.end method

.method static synthetic access$700(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/pccw/mobile/sip/service/MobileSipService;)Z
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isSuccess:Z

    return v0
.end method

.method static synthetic access$802(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isSuccess:Z

    return p1
.end method

.method static synthetic access$900(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/sip/service/MobileSipService;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertCallForwardSucceed(Landroid/content/Context;)V

    return-void
.end method

.method private alertCallForwardSucceed(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1175
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1176
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.callforwardsucceed"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1177
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1178
    return-void
.end method

.method private alertDaypass(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1181
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1182
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.daypass"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1183
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1184
    return-void
.end method

.method private alertLoginDisconnected(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1162
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1163
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.logindisconnected"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1164
    const-string/jumbo v1, "NEED_SHOW_MESSAGE"

    iget-boolean v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isSuccess:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1165
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1166
    return-void
.end method

.method private alertLoginDisconnecting(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1169
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1170
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.logindisconnecting"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1171
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1172
    return-void
.end method

.method private alertLoginError(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 1133
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1134
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.loginerror"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1135
    const-string/jumbo v1, "MESSAGE"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1136
    const-string/jumbo v1, "IS_OVERSEA"

    iget-boolean v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldShowOverseaErrorMSG:Z

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1138
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldShowOverseaErrorMSG:Z

    .line 1140
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1149
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    .line 1152
    return-void
.end method

.method private alertLoginFinished(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1109
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1110
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.loginfinished"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1111
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1121
    return-void
.end method

.method private alertLoginPasswordError(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 1125
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1126
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.loginpassworderror"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1127
    const-string/jumbo v1, "MESSAGE"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1128
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1129
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    .line 1130
    return-void
.end method

.method private alertLoginWarning(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 1155
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1156
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.loginwarning"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1157
    const-string/jumbo v1, "MESSAGE"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1158
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1159
    return-void
.end method

.method private authGetImsi_prepaid(Landroid/content/Context;)Z
    .locals 18
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 2707
    const-string/jumbo v6, ""

    .line 2708
    .local v6, "msisdn":Ljava/lang/String;
    const-string/jumbo v7, ""

    .line 2709
    .local v7, "password":Ljava/lang/String;
    const-string/jumbo v3, ""

    .line 2714
    .local v3, "encUdid":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 2715
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v14

    if-nez v14, :cond_1

    .line 2716
    :cond_0
    const/16 v14, -0xa

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2717
    const v14, 0x7f07011d

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 2721
    const/4 v14, 0x0

    .line 2841
    :goto_0
    return v14

    .line 2724
    :cond_1
    invoke-static/range {p1 .. p1}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredPrepaidNumberPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .line 2725
    if-eqz v7, :cond_2

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v14

    if-nez v14, :cond_3

    .line 2727
    :cond_2
    const/16 v14, -0xa

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2728
    const v14, 0x7f07011d

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 2732
    const/4 v14, 0x0

    goto :goto_0

    .line 2735
    :cond_3
    invoke-static/range {p1 .. p1}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 2736
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v14

    if-nez v14, :cond_5

    .line 2737
    :cond_4
    const/16 v14, -0xa

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2738
    const v14, 0x7f07011b

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 2741
    const/4 v14, 0x0

    goto :goto_0

    .line 2744
    :cond_5
    const/4 v5, 0x0

    .line 2746
    .local v5, "hlContent":Ljava/lang/String;
    :try_start_0
    const-string/jumbo v14, "https://sip.pccwmobile.com/voip02/authGetimsi.do"

    const/4 v15, 0x6

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string/jumbo v17, "msisdn"

    aput-object v17, v15, v16

    const/16 v16, 0x1

    aput-object v6, v15, v16

    const/16 v16, 0x2

    const-string/jumbo v17, "password"

    aput-object v17, v15, v16

    const/16 v16, 0x3

    aput-object v7, v15, v16

    const/16 v16, 0x4

    const-string/jumbo v17, "encUdid"

    aput-object v17, v15, v16

    const/16 v16, 0x5

    aput-object v3, v15, v16

    invoke-static {v14, v15}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v5

    .line 2771
    if-eqz v5, :cond_9

    invoke-static {v5}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 2773
    :try_start_1
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v11

    .line 2774
    .local v11, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v11}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v10

    .line 2775
    .local v10, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v10}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v13

    .line 2776
    .local v13, "xr":Lorg/xml/sax/XMLReader;
    new-instance v12, Lcom/pccw/mobile/sip/service/AuthGetImsiXmlHandler;

    invoke-direct {v12}, Lcom/pccw/mobile/sip/service/AuthGetImsiXmlHandler;-><init>()V

    .line 2777
    .local v12, "xmlHandler":Lcom/pccw/mobile/sip/service/AuthGetImsiXmlHandler;
    invoke-interface {v13, v12}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 2778
    new-instance v14, Lorg/xml/sax/InputSource;

    new-instance v15, Ljava/io/StringReader;

    invoke-direct {v15, v5}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v14, v15}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v13, v14}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 2779
    iget-object v8, v12, Lcom/pccw/mobile/sip/service/AuthGetImsiXmlHandler;->res:Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;

    .line 2781
    .local v8, "resp":Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;
    iget-object v14, v8, Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;->resultcode:Ljava/lang/String;

    const-string/jumbo v15, "0"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 2782
    iget-object v14, v8, Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;->encryptedImsi:Ljava/lang/String;

    if-nez v14, :cond_6

    .line 2783
    const/4 v14, -0x3

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2784
    const v14, 0x7f070138

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 2789
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 2750
    .end local v8    # "resp":Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;
    .end local v10    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v11    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v12    # "xmlHandler":Lcom/pccw/mobile/sip/service/AuthGetImsiXmlHandler;
    .end local v13    # "xr":Lorg/xml/sax/XMLReader;
    :catch_0
    move-exception v2

    .line 2753
    .local v2, "e":Lcom/pccw/mobile/sip/util/NetworkException;
    const/4 v14, -0x6

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2754
    const v14, 0x7f0701b5

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 2758
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 2759
    .end local v2    # "e":Lcom/pccw/mobile/sip/util/NetworkException;
    :catch_1
    move-exception v2

    .line 2762
    .local v2, "e":Ljava/lang/Exception;
    const/4 v14, -0x3

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2763
    const v14, 0x7f0701b5

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 2768
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 2792
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v8    # "resp":Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;
    .restart local v10    # "sp":Ljavax/xml/parsers/SAXParser;
    .restart local v11    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .restart local v12    # "xmlHandler":Lcom/pccw/mobile/sip/service/AuthGetImsiXmlHandler;
    .restart local v13    # "xr":Lorg/xml/sax/XMLReader;
    :cond_6
    :try_start_2
    iget-object v14, v8, Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;->encryptedImsi:Ljava/lang/String;

    sput-object v14, Lcom/pccw/mobile/sip/service/MobileSipService;->encryptedPccwPrepaidImsi:Ljava/lang/String;

    .line 2841
    const/4 v14, 0x1

    goto/16 :goto_0

    .line 2800
    :cond_7
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    const-string/jumbo v15, "get_imsi_prepaid"

    iget-object v0, v8, Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;->resultcode:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2802
    .local v4, "getNumErrorMessage":Ljava/lang/String;
    if-nez v4, :cond_8

    .line 2803
    const/4 v14, -0x3

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2804
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    const-string/jumbo v15, "get_imsi_prepaid"

    const-string/jumbo v16, "99"

    invoke-virtual/range {v14 .. v16}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2808
    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 2814
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 2806
    :cond_8
    const/16 v14, -0xa

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 2816
    .end local v4    # "getNumErrorMessage":Ljava/lang/String;
    .end local v8    # "resp":Lcom/pccw/mobile/sip/service/AuthGetImsiResponse;
    .end local v10    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v11    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v12    # "xmlHandler":Lcom/pccw/mobile/sip/service/AuthGetImsiXmlHandler;
    .end local v13    # "xr":Lorg/xml/sax/XMLReader;
    :catch_2
    move-exception v9

    .line 2819
    .local v9, "se":Ljava/lang/Exception;
    const/4 v14, -0x3

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2820
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    const-string/jumbo v15, "get_imsi_prepaid"

    const-string/jumbo v16, "99"

    invoke-virtual/range {v14 .. v16}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2821
    .restart local v4    # "getNumErrorMessage":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 2826
    const/4 v14, 0x0

    goto/16 :goto_0

    .line 2829
    .end local v4    # "getNumErrorMessage":Ljava/lang/String;
    .end local v9    # "se":Ljava/lang/Exception;
    :cond_9
    const/4 v14, -0x3

    move-object/from16 v0, p0

    iput v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 2830
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    const-string/jumbo v15, "get_imsi_prepaid"

    const-string/jumbo v16, "99"

    invoke-virtual/range {v14 .. v16}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2831
    .restart local v4    # "getNumErrorMessage":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 2835
    const/4 v14, 0x0

    goto/16 :goto_0
.end method

.method private checkCodecsSupport(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 2497
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2498
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2499
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lorg/linphone/LinphoneService;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 2500
    const-string/jumbo v1, "do_init"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2501
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 2506
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->setCodecs(Landroid/content/Context;)V

    .line 2507
    invoke-virtual {p1, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 2514
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 2512
    :cond_0
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->setCodecs(Landroid/content/Context;)V

    goto :goto_0
.end method

.method private doHttpsLogin(Landroid/os/Handler;Landroid/content/Context;)V
    .locals 26
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 415
    move-object/from16 v0, p0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    move/from16 v22, v0

    const/16 v23, -0x64

    move/from16 v0, v22

    move/from16 v1, v23

    if-eq v0, v1, :cond_0

    .line 416
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 852
    :goto_0
    return-void

    .line 421
    :cond_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->checkCodecsSupport(Landroid/content/Context;)V

    .line 425
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v22

    const v23, 0x7f070258

    .line 426
    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v23

    const/16 v24, 0x0

    invoke-interface/range {v22 .. v24}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 428
    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v22

    .line 429
    invoke-interface/range {v22 .. v22}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v22

    const v23, 0x7f070273

    .line 430
    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v23

    const v24, 0x7f070274

    .line 431
    move-object/from16 v0, p2

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v24

    .line 430
    invoke-interface/range {v22 .. v24}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v22

    .line 431
    invoke-interface/range {v22 .. v22}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 434
    const/16 v22, 0x1

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->callForwardingState:I

    .line 436
    const/4 v11, 0x0

    .line 438
    .local v11, "hlContent":Ljava/lang/String;
    :try_start_0
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v22

    if-eqz v22, :cond_a

    .line 440
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    .line 442
    .local v13, "registered_msisdn":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredPrepaidNumberPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    .line 448
    .local v14, "registered_msisdn_password":Ljava/lang/String;
    new-instance v4, Lcom/pccw/mobile/sip/service/MobileSipService$1;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/pccw/mobile/sip/service/MobileSipService$1;-><init>(Lcom/pccw/mobile/sip/service/MobileSipService;)V
    :try_end_0
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 463
    .local v4, "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    :try_start_1
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string/jumbo v23, "!!!!!!!  check API  "

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 464
    sget-object v22, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "!!!!  registered misidn:"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 465
    new-instance v3, Lcom/pccw/mobile/server/CheckNumberTypeApi;

    const-string/jumbo v22, ""

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-direct {v3, v4, v0, v1, v13}, Lcom/pccw/mobile/server/CheckNumberTypeApi;-><init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    .local v3, "checkNumberTypeApi":Lcom/pccw/mobile/server/CheckNumberTypeApi;
    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    const-string/jumbo v24, ""

    aput-object v24, v22, v23

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Lcom/pccw/mobile/server/CheckNumberTypeApi;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 476
    .end local v3    # "checkNumberTypeApi":Lcom/pccw/mobile/server/CheckNumberTypeApi;
    :goto_1
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    if-eqz v22, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "0"

    .line 477
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_5

    .line 478
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    if-nez v22, :cond_3

    .line 479
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-eqz v22, :cond_2

    .line 480
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V
    :try_end_2
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 732
    .end local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    .end local v13    # "registered_msisdn":Ljava/lang/String;
    .end local v14    # "registered_msisdn_password":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 735
    .local v6, "e":Lcom/pccw/mobile/sip/util/NetworkException;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-nez v22, :cond_1a

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    move/from16 v22, v0

    if-nez v22, :cond_1a

    .line 736
    const/16 v22, -0x6

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 737
    const v22, 0x7f0701b5

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 738
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 743
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 468
    .end local v6    # "e":Lcom/pccw/mobile/sip/util/NetworkException;
    .restart local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    .restart local v13    # "registered_msisdn":Ljava/lang/String;
    .restart local v14    # "registered_msisdn_password":Ljava/lang/String;
    :catch_1
    move-exception v6

    .line 470
    .local v6, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v6}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_3
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 750
    .end local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    .end local v6    # "e":Ljava/lang/InterruptedException;
    .end local v13    # "registered_msisdn":Ljava/lang/String;
    .end local v14    # "registered_msisdn_password":Ljava/lang/String;
    :catch_2
    move-exception v6

    .line 753
    .local v6, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-nez v22, :cond_1c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    move/from16 v22, v0

    if-nez v22, :cond_1c

    .line 754
    const/16 v22, -0x3

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 755
    const v22, 0x7f0701b5

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 756
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 757
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 471
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    .restart local v13    # "registered_msisdn":Ljava/lang/String;
    .restart local v14    # "registered_msisdn_password":Ljava/lang/String;
    :catch_3
    move-exception v6

    .line 473
    .local v6, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_4
    invoke-virtual {v6}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto/16 :goto_1

    .line 482
    .end local v6    # "e":Ljava/util/concurrent/ExecutionException;
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    move/from16 v22, v0

    if-eqz v22, :cond_3

    .line 483
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 491
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v23, v0

    const-string/jumbo v24, "get_number_info_prepaid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    if-nez v22, :cond_4

    const-string/jumbo v22, "99"

    :goto_2
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 495
    .local v10, "getNumErrorMessage":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v10}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 496
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 497
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 491
    .end local v10    # "getNumErrorMessage":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    move-object/from16 v22, v0

    goto :goto_2

    .line 502
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "prepaid"

    .line 503
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowRS:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "true"

    .line 505
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_6

    .line 509
    const v22, 0x7f070150

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 511
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 512
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 517
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "prepaid"

    .line 518
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->status:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "active"

    .line 520
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_7

    .line 528
    const v22, 0x7f070158

    .line 529
    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 528
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 530
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 531
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 536
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "0"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "prepaid"

    .line 538
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_8

    .line 542
    const v22, 0x7f07014d

    .line 544
    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 542
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 545
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 546
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 551
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->authGetImsi_prepaid(Landroid/content/Context;)Z

    move-result v9

    .line 553
    .local v9, "getAuthenImsiResult":Z
    if-eqz v9, :cond_9

    sget-object v22, Lcom/pccw/mobile/sip/service/MobileSipService;->encryptedPccwPrepaidImsi:Ljava/lang/String;

    const-string/jumbo v23, ""

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_9

    .line 555
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->fetchAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    .line 556
    .local v19, "version":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 557
    .local v5, "deviceID":Ljava/lang/String;
    const-string/jumbo v22, "https://sip.pccwmobile.com/voip02/login.do"

    const/16 v23, 0xa

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string/jumbo v25, "imsi"

    aput-object v25, v23, v24

    const/16 v24, 0x1

    sget-object v25, Lcom/pccw/mobile/sip/service/MobileSipService;->encryptedPccwPrepaidImsi:Ljava/lang/String;

    aput-object v25, v23, v24

    const/16 v24, 0x2

    const-string/jumbo v25, "version"

    aput-object v25, v23, v24

    const/16 v24, 0x3

    aput-object v19, v23, v24

    const/16 v24, 0x4

    const-string/jumbo v25, "os"

    aput-object v25, v23, v24

    const/16 v24, 0x5

    sget-object v25, Lcom/pccw/mobile/sip/service/MobileSipService;->OS:Ljava/lang/String;

    aput-object v25, v23, v24

    const/16 v24, 0x6

    const-string/jumbo v25, "deviceID"

    aput-object v25, v23, v24

    const/16 v24, 0x7

    aput-object v5, v23, v24

    const/16 v24, 0x8

    const-string/jumbo v25, "encrypted"

    aput-object v25, v23, v24

    const/16 v24, 0x9

    const-string/jumbo v25, "1"

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_4
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v11

    .line 767
    .end local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    .end local v5    # "deviceID":Ljava/lang/String;
    .end local v9    # "getAuthenImsiResult":Z
    .end local v13    # "registered_msisdn":Ljava/lang/String;
    .end local v14    # "registered_msisdn_password":Ljava/lang/String;
    .end local v19    # "version":Ljava/lang/String;
    :goto_3
    if-eqz v11, :cond_21

    invoke-static {v11}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_21

    .line 771
    :try_start_5
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v18

    .line 772
    .local v18, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual/range {v18 .. v18}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v17

    .line 773
    .local v17, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual/range {v17 .. v17}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v21

    .line 774
    .local v21, "xr":Lorg/xml/sax/XMLReader;
    new-instance v20, Lcom/pccw/mobile/sip/service/LoginXmlHandler;

    invoke-direct/range {v20 .. v20}, Lcom/pccw/mobile/sip/service/LoginXmlHandler;-><init>()V

    .line 775
    .local v20, "xmlHandler":Lcom/pccw/mobile/sip/service/LoginXmlHandler;
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 776
    new-instance v22, Lorg/xml/sax/InputSource;

    new-instance v23, Ljava/io/StringReader;

    move-object/from16 v0, v23

    invoke-direct {v0, v11}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct/range {v22 .. v23}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface/range {v21 .. v22}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 777
    move-object/from16 v0, v20

    iget-object v15, v0, Lcom/pccw/mobile/sip/service/LoginXmlHandler;->res:Lcom/pccw/mobile/sip/service/LoginResponse;

    .line 778
    .local v15, "resp":Lcom/pccw/mobile/sip/service/LoginResponse;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v15}, Lcom/pccw/mobile/sip/service/MobileSipService;->handleLoginResponse(Landroid/os/Handler;Landroid/content/Context;Lcom/pccw/mobile/sip/service/LoginResponse;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6

    .line 851
    .end local v15    # "resp":Lcom/pccw/mobile/sip/service/LoginResponse;
    .end local v17    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v18    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v20    # "xmlHandler":Lcom/pccw/mobile/sip/service/LoginXmlHandler;
    .end local v21    # "xr":Lorg/xml/sax/XMLReader;
    :goto_4
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 566
    .restart local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    .restart local v9    # "getAuthenImsiResult":Z
    .restart local v13    # "registered_msisdn":Ljava/lang/String;
    .restart local v14    # "registered_msisdn_password":Ljava/lang/String;
    :cond_9
    :try_start_6
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 567
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 572
    .end local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    .end local v9    # "getAuthenImsiResult":Z
    .end local v13    # "registered_msisdn":Ljava/lang/String;
    .end local v14    # "registered_msisdn_password":Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->fetchEncryptedIMSI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    .line 573
    .local v7, "encryptedUsername":Ljava/lang/String;
    invoke-static {v7}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_b

    .line 574
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isOperatorPccw(Landroid/content/Context;)Z

    move-result v22

    if-nez v22, :cond_d

    .line 575
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isOperatorCSL(Landroid/content/Context;)Z

    move-result v22

    if-nez v22, :cond_d

    .line 576
    :cond_b
    const/16 v22, -0x4

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 577
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isSecondOperatorSim(Landroid/content/Context;)Z

    move-result v22

    if-eqz v22, :cond_c

    .line 578
    const v22, 0x7f07011c

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 582
    :goto_5
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 583
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 580
    :cond_c
    const v22, 0x7f0701c7

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_5

    .line 588
    :cond_d
    new-instance v4, Lcom/pccw/mobile/sip/service/MobileSipService$2;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/pccw/mobile/sip/service/MobileSipService$2;-><init>(Lcom/pccw/mobile/sip/service/MobileSipService;)V
    :try_end_6
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 603
    .restart local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    :try_start_7
    new-instance v3, Lcom/pccw/mobile/server/CheckNumberTypeApi;

    const-string/jumbo v22, ""

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-direct {v3, v4, v0, v7, v1}, Lcom/pccw/mobile/server/CheckNumberTypeApi;-><init>(Lcom/pccw/mobile/server/api/ApiResponseListener;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 605
    .restart local v3    # "checkNumberTypeApi":Lcom/pccw/mobile/server/CheckNumberTypeApi;
    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    const-string/jumbo v24, ""

    aput-object v24, v22, v23

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Lcom/pccw/mobile/server/CheckNumberTypeApi;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 612
    .end local v3    # "checkNumberTypeApi":Lcom/pccw/mobile/server/CheckNumberTypeApi;
    :goto_6
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    if-eqz v22, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "0"

    .line 613
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_16

    .line 615
    :cond_e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    if-nez v22, :cond_10

    .line 616
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-eqz v22, :cond_f

    .line 617
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 606
    :catch_4
    move-exception v6

    .line 607
    .local v6, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v6}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_6

    .line 608
    .end local v6    # "e":Ljava/lang/InterruptedException;
    :catch_5
    move-exception v6

    .line 609
    .local v6, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v6}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_6

    .line 619
    .end local v6    # "e":Ljava/util/concurrent/ExecutionException;
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    move/from16 v22, v0

    if-eqz v22, :cond_10

    .line 620
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 625
    :cond_10
    const-string/jumbo v10, ""

    .line 626
    .restart local v10    # "getNumErrorMessage":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v22

    if-eqz v22, :cond_13

    .line 630
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v23, v0

    const-string/jumbo v24, "get_number_info_prepaid"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    if-nez v22, :cond_12

    const-string/jumbo v22, "99"

    :goto_7
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 654
    :cond_11
    :goto_8
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v10}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 655
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 656
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 630
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    move-object/from16 v22, v0

    goto :goto_7

    .line 638
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v23, v0

    const-string/jumbo v24, "get_number_info"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    if-nez v22, :cond_14

    const-string/jumbo v22, "99"

    :goto_9
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 643
    move-object/from16 v0, p2

    invoke-static {v10, v0}, Lcom/pccw/mobile/util/ErrorMsgUtil;->shouldShowOverseaXmlErrorMsg(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v22

    if-eqz v22, :cond_11

    .line 647
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v23, v0

    const-string/jumbo v24, "get_number_info_oversea"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    if-nez v22, :cond_15

    const-string/jumbo v22, "99"

    :goto_a
    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_8

    .line 638
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    move-object/from16 v22, v0

    goto :goto_9

    .line 647
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    move-object/from16 v22, v0

    goto :goto_a

    .line 660
    .end local v10    # "getNumErrorMessage":Ljava/lang/String;
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "prepaid"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_18

    .line 676
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "prepaid"

    .line 677
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowRS:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "true"

    .line 679
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_17

    .line 683
    const v22, 0x7f070150

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 685
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 686
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 691
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "prepaid"

    .line 692
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->status:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "active"

    .line 694
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-nez v22, :cond_19

    .line 702
    const v22, 0x7f070158

    .line 703
    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    .line 702
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 704
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 705
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 708
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "postpaid"

    .line 709
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_19

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->operator:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "csl"

    .line 711
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->checkNumberTypeResponse:Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowkk:Ljava/lang/String;

    move-object/from16 v22, v0

    const-string/jumbo v23, "false"

    .line 712
    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v22

    if-eqz v22, :cond_19

    .line 713
    const-string/jumbo v22, "get_number_info_not_allow_csl_postpaid"

    const-string/jumbo v23, ""

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2}, Lcom/pccw/mobile/util/ErrorMsgUtil;->getLocalErrorMsg(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 715
    .local v8, "errorMsg":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v8}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 716
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->loginTaskCompleted(Landroid/content/Context;)V

    .line 717
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 723
    .end local v8    # "errorMsg":Ljava/lang/String;
    :cond_19
    invoke-direct/range {p0 .. p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->getLang()Ljava/lang/String;

    move-result-object v12

    .line 726
    .local v12, "lang":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->fetchAppVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    .line 727
    .restart local v19    # "version":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedDeviceId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 729
    .restart local v5    # "deviceID":Ljava/lang/String;
    const-string/jumbo v22, "https://sip.pccwmobile.com/voip02/login.do"

    const/16 v23, 0xa

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string/jumbo v25, "imsi"

    aput-object v25, v23, v24

    const/16 v24, 0x1

    aput-object v7, v23, v24

    const/16 v24, 0x2

    const-string/jumbo v25, "version"

    aput-object v25, v23, v24

    const/16 v24, 0x3

    aput-object v19, v23, v24

    const/16 v24, 0x4

    const-string/jumbo v25, "os"

    aput-object v25, v23, v24

    const/16 v24, 0x5

    sget-object v25, Lcom/pccw/mobile/sip/service/MobileSipService;->OS:Ljava/lang/String;

    aput-object v25, v23, v24

    const/16 v24, 0x6

    const-string/jumbo v25, "deviceID"

    aput-object v25, v23, v24

    const/16 v24, 0x7

    aput-object v5, v23, v24

    const/16 v24, 0x8

    const-string/jumbo v25, "encrypted"

    aput-object v25, v23, v24

    const/16 v24, 0x9

    const-string/jumbo v25, "1"

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_8
    .catch Lcom/pccw/mobile/sip/util/NetworkException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2

    move-result-object v11

    goto/16 :goto_3

    .line 744
    .end local v4    # "checkNumberTypeResponseListener":Lcom/pccw/mobile/server/api/ApiResponseListener;
    .end local v5    # "deviceID":Ljava/lang/String;
    .end local v7    # "encryptedUsername":Ljava/lang/String;
    .end local v12    # "lang":Ljava/lang/String;
    .end local v19    # "version":Ljava/lang/String;
    .local v6, "e":Lcom/pccw/mobile/sip/util/NetworkException;
    :cond_1a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-eqz v22, :cond_1b

    .line 745
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 747
    :cond_1b
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 759
    .local v6, "e":Ljava/lang/Exception;
    :cond_1c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-eqz v22, :cond_1d

    .line 760
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    goto/16 :goto_3

    .line 762
    :cond_1d
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto/16 :goto_3

    .line 784
    .end local v6    # "e":Ljava/lang/Exception;
    :catch_6
    move-exception v16

    .line 788
    .local v16, "se":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-nez v22, :cond_1f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    move/from16 v22, v0

    if-nez v22, :cond_1f

    .line 789
    const/16 v22, -0x3

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 791
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v22

    if-eqz v22, :cond_1e

    .line 792
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v22, v0

    const-string/jumbo v23, "login_prepaid"

    const-string/jumbo v24, "99"

    invoke-virtual/range {v22 .. v24}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 810
    :goto_b
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 811
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_4

    .line 795
    :cond_1e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v22, v0

    const-string/jumbo v23, "login"

    const-string/jumbo v24, "99"

    invoke-virtual/range {v22 .. v24}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 798
    sget-object v22, Lcom/pccw/mobile/sip/service/MobileSipService$8;->$SwitchMap$com$pccw$mobile$util$ErrorMsgUtil$CheckOverseaResult:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/pccw/mobile/util/ErrorMsgUtil;->shouldShowOverseaXmlErrorMsgWithFailCase(Ljava/lang/String;Landroid/content/Context;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->ordinal()I

    move-result v23

    aget v22, v22, v23

    packed-switch v22, :pswitch_data_0

    goto :goto_b

    .line 802
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v22, v0

    const-string/jumbo v23, "login_oversea"

    const-string/jumbo v24, "99"

    invoke-virtual/range {v22 .. v24}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_b

    .line 806
    :pswitch_2
    const v22, 0x7f07016d

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_b

    .line 812
    :cond_1f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-eqz v22, :cond_20

    .line 813
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    goto/16 :goto_4

    .line 815
    :cond_20
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto/16 :goto_4

    .line 819
    .end local v16    # "se":Ljava/lang/Exception;
    :cond_21
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-nez v22, :cond_23

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    move/from16 v22, v0

    if-nez v22, :cond_23

    .line 820
    const/16 v22, -0x3

    move/from16 v0, v22

    move-object/from16 v1, p0

    iput v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 822
    invoke-static/range {p2 .. p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v22

    if-eqz v22, :cond_22

    .line 823
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v22, v0

    const-string/jumbo v23, "login_prepaid"

    const-string/jumbo v24, "99"

    invoke-virtual/range {v22 .. v24}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 841
    :goto_c
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 843
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto/16 :goto_4

    .line 826
    :cond_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v22, v0

    const-string/jumbo v23, "login"

    const-string/jumbo v24, "99"

    invoke-virtual/range {v22 .. v24}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 829
    sget-object v22, Lcom/pccw/mobile/sip/service/MobileSipService$8;->$SwitchMap$com$pccw$mobile$util$ErrorMsgUtil$CheckOverseaResult:[I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-static {v0, v1}, Lcom/pccw/mobile/util/ErrorMsgUtil;->shouldShowOverseaXmlErrorMsgWithFailCase(Ljava/lang/String;Landroid/content/Context;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->ordinal()I

    move-result v23

    aget v22, v22, v23

    packed-switch v22, :pswitch_data_1

    goto :goto_c

    .line 833
    :pswitch_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    move-object/from16 v22, v0

    const-string/jumbo v23, "login_oversea"

    const-string/jumbo v24, "99"

    invoke-virtual/range {v22 .. v24}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_c

    .line 837
    :pswitch_5
    const v22, 0x7f07016d

    move-object/from16 v0, p2

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_c

    .line 844
    :cond_23
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    move/from16 v22, v0

    if-eqz v22, :cond_24

    .line 845
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    goto/16 :goto_4

    .line 847
    :cond_24
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto/16 :goto_4

    .line 798
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 829
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private fetchAppVersion(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    .line 855
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v0, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 856
    .local v0, "version":Ljava/lang/String;
    return-object v0
.end method

.method public static getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;
    .locals 1

    .prologue
    .line 137
    sget-object v0, Lcom/pccw/mobile/sip/service/MobileSipService;->instance:Lcom/pccw/mobile/sip/service/MobileSipService;

    return-object v0
.end method

.method private getLang()Ljava/lang/String;
    .locals 4

    .prologue
    .line 914
    const-string/jumbo v0, "en"

    .line 915
    .local v0, "lang":Ljava/lang/String;
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 916
    .local v1, "locale":Ljava/util/Locale;
    const-string/jumbo v2, "zh"

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 917
    const-string/jumbo v2, "HK"

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "TW"

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 918
    :cond_0
    const-string/jumbo v0, "zh_HK"

    .line 921
    :cond_1
    return-object v0
.end method

.method private getSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 18
    .param p1, "callee"    # Ljava/lang/String;
    .param p2, "mContext"    # Landroid/content/Context;

    .prologue
    .line 2285
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v15, 0x8

    if-eq v14, v15, :cond_1

    .line 2382
    .end local p1    # "callee":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 2287
    .restart local p1    # "callee":Ljava/lang/String;
    :cond_1
    const/4 v6, 0x0

    .line 2288
    .local v6, "retryCount":I
    const/4 v5, 0x1

    .line 2290
    .local v5, "retry":Z
    :cond_2
    :goto_1
    if-eqz v5, :cond_5

    const/4 v14, 0x2

    if-ge v6, v14, :cond_5

    .line 2291
    const/4 v5, 0x0

    .line 2292
    const/4 v3, 0x0

    .line 2294
    .local v3, "hlContent":Ljava/lang/String;
    :try_start_0
    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string/jumbo v14, "yyyyMMddHHmmss"

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v7, v14, v15}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 2295
    .local v7, "sdf":Ljava/text/SimpleDateFormat;
    const-string/jumbo v14, "UTC"

    invoke-static {v14}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v14

    invoke-virtual {v7, v14}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 2296
    new-instance v14, Ljava/util/Date;

    invoke-direct {v14}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7, v14}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v11

    .line 2297
    .local v11, "timestamp":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesDecryptByCalleeStatusKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2299
    .local v1, "encryptedCallee":Ljava/lang/String;
    invoke-static {v1}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 2300
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 2301
    const-string/jumbo v14, "https://sip.pccwmobile.com/voip02/getCalleeStatus.do"

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string/jumbo v17, "m"

    aput-object v17, v15, v16

    const/16 v16, 0x1

    aput-object v1, v15, v16

    invoke-static {v14, v15}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 2312
    .end local v1    # "encryptedCallee":Ljava/lang/String;
    .end local v7    # "sdf":Ljava/text/SimpleDateFormat;
    .end local v11    # "timestamp":Ljava/lang/String;
    :cond_3
    :goto_2
    if-nez v5, :cond_2

    .line 2313
    invoke-static {v3}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 2317
    :try_start_1
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v10

    .line 2318
    .local v10, "spf":Ljavax/xml/parsers/SAXParserFactory;
    invoke-virtual {v10}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v9

    .line 2319
    .local v9, "sp":Ljavax/xml/parsers/SAXParser;
    invoke-virtual {v9}, Ljavax/xml/parsers/SAXParser;->getXMLReader()Lorg/xml/sax/XMLReader;

    move-result-object v13

    .line 2320
    .local v13, "xr":Lorg/xml/sax/XMLReader;
    new-instance v12, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;

    invoke-direct {v12}, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;-><init>()V

    .line 2321
    .local v12, "xmlHandler":Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;
    invoke-interface {v13, v12}, Lorg/xml/sax/XMLReader;->setContentHandler(Lorg/xml/sax/ContentHandler;)V

    .line 2322
    new-instance v14, Lorg/xml/sax/InputSource;

    new-instance v15, Ljava/io/StringReader;

    invoke-direct {v15, v3}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v14, v15}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/Reader;)V

    invoke-interface {v13, v14}, Lorg/xml/sax/XMLReader;->parse(Lorg/xml/sax/InputSource;)V

    .line 2323
    invoke-virtual {v12}, Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;->response()Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    move-result-object v4

    .line 2325
    .local v4, "resp":Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;
    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->lastGetCalleeStatusResponse:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    .line 2327
    if-eqz v4, :cond_2

    iget-object v14, v4, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->resultCode:Ljava/lang/String;

    if-eqz v14, :cond_2

    .line 2328
    iget-object v14, v4, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->resultCode:Ljava/lang/String;

    const-string/jumbo v15, "0"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 2333
    iget-object v14, v4, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->status:Ljava/lang/String;

    const-string/jumbo v15, "1"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 2336
    iget-object v0, v4, Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;->sip_number:Ljava/lang/String;

    move-object/from16 p1, v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 2304
    .end local v4    # "resp":Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;
    .end local v9    # "sp":Ljavax/xml/parsers/SAXParser;
    .end local v10    # "spf":Ljavax/xml/parsers/SAXParserFactory;
    .end local v12    # "xmlHandler":Lcom/pccw/mobile/sip/service/GetCalleeStatusXmlHandler;
    .end local v13    # "xr":Lorg/xml/sax/XMLReader;
    :catch_0
    move-exception v2

    .line 2305
    .local v2, "ex":Ljava/lang/Exception;
    add-int/lit8 v6, v6, 0x1

    .line 2306
    const/4 v5, 0x1

    goto :goto_2

    .line 2357
    .end local v2    # "ex":Ljava/lang/Exception;
    :catch_1
    move-exception v8

    .line 2358
    .local v8, "se":Ljava/lang/Exception;
    const/4 v5, 0x1

    .line 2359
    add-int/lit8 v6, v6, 0x1

    .line 2360
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 2363
    .end local v8    # "se":Ljava/lang/Exception;
    :cond_4
    const/4 v5, 0x1

    .line 2364
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1

    .line 2375
    .end local v3    # "hlContent":Ljava/lang/String;
    :cond_5
    if-eqz v5, :cond_0

    goto/16 :goto_0
.end method

.method private handleLoginResponse(Landroid/os/Handler;Landroid/content/Context;Lcom/pccw/mobile/sip/service/LoginResponse;)V
    .locals 5
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "resp"    # Lcom/pccw/mobile/sip/service/LoginResponse;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 950
    const-string/jumbo v0, "0"

    iget-object v3, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->resultcode:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 951
    invoke-direct {p0, p1, p2, p3}, Lcom/pccw/mobile/sip/service/MobileSipService;->handleSuccesLoginResponse(Landroid/os/Handler;Landroid/content/Context;Lcom/pccw/mobile/sip/service/LoginResponse;)V

    .line 986
    :goto_0
    return-void

    .line 960
    :cond_0
    invoke-static {p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 961
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    const-string/jumbo v3, "login_prepaid"

    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->resultcode:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 976
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 977
    iget-object v0, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->message:Ljava/lang/String;

    if-eqz v0, :cond_4

    move v0, v1

    :goto_2
    iget-object v3, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->message:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_5

    :goto_3
    and-int/2addr v0, v1

    if-eqz v0, :cond_6

    .line 978
    iget-object v0, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->message:Ljava/lang/String;

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 982
    :cond_2
    :goto_4
    iget-object v0, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->resultcode:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 983
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    invoke-direct {p0, p2, v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginError(Landroid/content/Context;Ljava/lang/String;)V

    .line 984
    invoke-virtual {p0, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto :goto_0

    .line 964
    :cond_3
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    const-string/jumbo v3, "login"

    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->resultcode:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 967
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    invoke-static {v0, p2}, Lcom/pccw/mobile/util/ErrorMsgUtil;->shouldShowOverseaXmlErrorMsg(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 971
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->messageController:Lcom/pccw/mobile/sip/ServerMessageController;

    const-string/jumbo v3, "login_oversea"

    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->resultcode:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/pccw/mobile/sip/ServerMessageController;->obtainMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_1

    :cond_4
    move v0, v2

    .line 977
    goto :goto_2

    :cond_5
    move v1, v2

    goto :goto_3

    .line 980
    :cond_6
    const v0, 0x7f07020c

    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_4
.end method

.method private handleSuccesLoginResponse(Landroid/os/Handler;Landroid/content/Context;Lcom/pccw/mobile/sip/service/LoginResponse;)V
    .locals 9
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "resp"    # Lcom/pccw/mobile/sip/service/LoginResponse;

    .prologue
    .line 989
    invoke-static {p2}, Lcom/pccw/mobile/sip/ClientStateManager;->getPhone(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 991
    .local v0, "oldPhone":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->dn:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 993
    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->dn:Ljava/lang/String;

    invoke-static {p2, v4}, Lcom/pccw/mobile/sip/ClientStateManager;->changeNumber(Landroid/content/Context;Ljava/lang/String;)V

    .line 997
    :goto_0
    iget-boolean v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->is_hk:Z

    iput-boolean v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isInHK:Z

    .line 1000
    invoke-static {p2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string/jumbo v5, "SHOW_DAYPASS_MESSAGE"

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-boolean v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->is_daypass_sub:Z

    if-eqz v4, :cond_1

    iget-boolean v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->dayPassAlertOKClicked:Z

    if-nez v4, :cond_1

    .line 1003
    invoke-direct {p0, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertDaypass(Landroid/content/Context;)V

    .line 1097
    :goto_1
    return-void

    .line 995
    :cond_0
    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->dn:Ljava/lang/String;

    invoke-static {p2, v4}, Lcom/pccw/mobile/sip/ClientStateManager;->changeNumber(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 1006
    :cond_1
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->dayPassAlertOKClicked:Z

    .line 1009
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    .line 1008
    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1012
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const v5, 0x7f070251

    .line 1013
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    .line 1012
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 1014
    .local v3, "useIlbc":Z
    if-nez v3, :cond_2

    .line 1015
    const v4, 0x7f070253

    const/4 v5, 0x1

    invoke-virtual {p0, p2, v4, v5}, Lcom/pccw/mobile/sip/service/MobileSipService;->enableDisableAudioCodec(Landroid/content/Context;IZ)V

    .line 1016
    :cond_2
    const v4, 0x7f07026c

    invoke-virtual {p2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f070274

    .line 1017
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 1016
    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1018
    .local v2, "tunnelMode":Ljava/lang/String;
    const v4, 0x7f070274

    invoke-virtual {p2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 1021
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070278

    .line 1022
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_number:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070261

    .line 1023
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->pwd:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const v4, 0x7f070263

    .line 1027
    invoke-virtual {p2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v3, :cond_4

    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server_ilbc:Ljava/lang/String;

    :goto_2
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v7, ":"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v3, :cond_5

    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_port_ilbc:Ljava/lang/String;

    :goto_3
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1026
    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070259

    .line 1032
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_domain:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070279

    .line 1033
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_number:Ljava/lang/String;

    const-string/jumbo v7, "s"

    const-string/jumbo v8, ""

    .line 1034
    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 1033
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070269

    .line 1035
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_host_1:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f07026b

    .line 1036
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_host_2:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070277

    .line 1037
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_port:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070267

    .line 1038
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-boolean v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_enable:Z

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070260

    .line 1039
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server_ilbc:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "echoServerHost"

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->echo_server:Ljava/lang/String;

    .line 1040
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 1041
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1075
    :cond_3
    :goto_4
    invoke-static {p2}, Lcom/pccw/mobile/util/SetEchoServerHost;->setEchoServerHost(Landroid/content/Context;)V

    .line 1085
    const/4 v4, 0x0

    iput v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 1086
    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->session_id:Ljava/lang/String;

    iput-object v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sessionId:Ljava/lang/String;

    .line 1089
    new-instance v4, Lcom/pccw/mobile/sip/service/MobileSipService$3;

    invoke-direct {v4, p0, p2}, Lcom/pccw/mobile/sip/service/MobileSipService$3;-><init>(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    invoke-virtual {p1, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_1

    .line 1027
    :cond_4
    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server:Ljava/lang/String;

    goto/16 :goto_2

    :cond_5
    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_port:Ljava/lang/String;

    goto/16 :goto_3

    .line 1045
    :cond_6
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070278

    .line 1046
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_number:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070261

    .line 1047
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->pwd:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const v4, 0x7f070263

    .line 1051
    invoke-virtual {p2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v3, :cond_9

    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server_ilbc:Ljava/lang/String;

    :goto_5
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v7, ":"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v3, :cond_a

    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_port_ilbc:Ljava/lang/String;

    :goto_6
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1050
    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070259

    .line 1056
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_domain:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070279

    .line 1057
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_number:Ljava/lang/String;

    const-string/jumbo v7, "s"

    const-string/jumbo v8, ""

    .line 1058
    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    .line 1057
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070260

    .line 1059
    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server_ilbc:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "echoServerHost"

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->echo_server:Ljava/lang/String;

    .line 1060
    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    .line 1061
    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1062
    const v4, 0x7f070269

    invoke-virtual {p2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1064
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070269

    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_host_1:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1066
    :cond_7
    const v4, 0x7f07026b

    invoke-virtual {p2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1068
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f07026b

    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_host_2:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1070
    :cond_8
    const v4, 0x7f070277

    .line 1071
    invoke-virtual {p2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1072
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const v5, 0x7f070277

    invoke-virtual {p2, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->tunnel_port:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto/16 :goto_4

    .line 1051
    :cond_9
    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_server:Ljava/lang/String;

    goto/16 :goto_5

    :cond_a
    iget-object v4, p3, Lcom/pccw/mobile/sip/service/LoginResponse;->sip_port:Ljava/lang/String;

    goto/16 :goto_6
.end method

.method private declared-synchronized loginTaskCompleted(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1100
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning:Z

    .line 1101
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isReLoginRunning:Z

    .line 1102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning:Z

    .line 1104
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->alertLoginFinished(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1106
    monitor-exit p0

    return-void

    .line 1100
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private planAutologin(Landroid/content/Context;)V
    .locals 8
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 326
    const-wide/16 v4, 0x0

    .line 327
    .local v4, "timeDelay":J
    iget v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginRetryCount:I

    if-nez v3, :cond_0

    .line 328
    const-wide/16 v4, 0x1388

    .line 332
    :goto_0
    const-string/jumbo v3, "alarm"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 333
    .local v0, "am":Landroid/app/AlarmManager;
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/pccw/mobile/sip/RetryAlarmReceiver;

    invoke-direct {v1, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 334
    .local v1, "intent":Landroid/content/Intent;
    const/16 v3, 0x64

    const/4 v6, 0x0

    invoke-static {p1, v3, v1, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 335
    .local v2, "operation":Landroid/app/PendingIntent;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 336
    const/4 v3, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    add-long/2addr v6, v4

    invoke-virtual {v0, v3, v6, v7, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 341
    return-void

    .line 330
    .end local v0    # "am":Landroid/app/AlarmManager;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "operation":Landroid/app/PendingIntent;
    :cond_0
    const-wide/16 v4, 0x7530

    goto :goto_0
.end method

.method private planHeartBeat(Landroid/content/Context;J)V
    .locals 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "delay"    # J

    .prologue
    const/4 v4, 0x0

    .line 1740
    const-string/jumbo v3, "alarm"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 1741
    .local v0, "am":Landroid/app/AlarmManager;
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;

    invoke-direct {v1, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1742
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p1, v4, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 1743
    .local v2, "operation":Landroid/app/PendingIntent;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 1744
    const/4 v3, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    add-long/2addr v4, p2

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 1746
    return-void
.end method

.method private planRelogin(Landroid/content/Context;)V
    .locals 8
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 256
    iget v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginRetryCount:I

    if-nez v3, :cond_0

    .line 257
    const-wide/16 v4, 0x1388

    .line 261
    .local v4, "timeDelay":J
    :goto_0
    const-string/jumbo v3, "alarm"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 262
    .local v0, "am":Landroid/app/AlarmManager;
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/pccw/mobile/sip/RetryAlarmReceiver;

    invoke-direct {v1, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 263
    .local v1, "intent":Landroid/content/Intent;
    const/16 v3, 0x64

    const/4 v6, 0x0

    invoke-static {p1, v3, v1, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 264
    .local v2, "operation":Landroid/app/PendingIntent;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 265
    const/4 v3, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    add-long/2addr v6, v4

    invoke-virtual {v0, v3, v6, v7, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 270
    return-void

    .line 259
    .end local v0    # "am":Landroid/app/AlarmManager;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "operation":Landroid/app/PendingIntent;
    .end local v4    # "timeDelay":J
    :cond_0
    const-wide/16 v4, 0x7530

    .restart local v4    # "timeDelay":J
    goto :goto_0
.end method

.method private resetCameraFromPreferences()V
    .locals 7

    .prologue
    .line 2849
    const/4 v3, 0x1

    .line 2850
    .local v3, "useFrontCam":Z
    const/4 v1, 0x0

    .line 2851
    .local v1, "camId":I
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;->retrieveCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-result-object v2

    .line 2852
    .local v2, "cameras":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    array-length v5, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v0, v2, v4

    .line 2853
    .local v0, "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    iget-boolean v6, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    if-ne v6, v3, :cond_0

    .line 2854
    iget v1, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->id:I

    .line 2852
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 2856
    .end local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_1
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v4

    invoke-interface {v4, v1}, Lorg/linphone/core/LinphoneCore;->setVideoDevice(I)V

    .line 2857
    return-void
.end method

.method private restartEngine(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 1350
    invoke-static {p1, v2}, Lorg/linphone/DailPadActivity;->on(Landroid/content/Context;Z)V

    .line 1351
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1353
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/LinphoneService;->initFromConf()V
    :try_end_0
    .catch Lorg/linphone/LinphoneConfigException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/linphone/LinphoneException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1367
    :goto_0
    return-void

    .line 1362
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1363
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lorg/linphone/LinphoneService;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1364
    const-string/jumbo v1, "do_init"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1365
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 1357
    .end local v0    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v1

    goto :goto_0

    .line 1354
    :catch_1
    move-exception v1

    goto :goto_0
.end method

.method private setCodecs(Landroid/content/Context;)V
    .locals 8
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 2519
    :goto_0
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v2

    invoke-virtual {v2}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    if-nez v2, :cond_1

    .line 2521
    :cond_0
    const-wide/16 v6, 0x64

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2522
    :catch_0
    move-exception v0

    .line 2523
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 2526
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2527
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v2

    invoke-virtual {v2}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    const-string/jumbo v5, "iLBC"

    const/16 v6, 0x1f40

    .line 2528
    invoke-interface {v2, v5, v6}, Lorg/linphone/core/LinphoneCore;->findPayloadType(Ljava/lang/String;I)Lorg/linphone/core/PayloadType;

    move-result-object v2

    if-eqz v2, :cond_3

    move v1, v3

    .line 2529
    .local v1, "enableIlbc":Z
    :goto_1
    if-eqz v1, :cond_4

    const-string/jumbo v2, "ilbc"

    :goto_2
    iput-object v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->currentCodec:Ljava/lang/String;

    .line 2532
    const v2, 0x7f070251

    invoke-virtual {p0, p1, v2, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->enableDisableAudioCodec(Landroid/content/Context;IZ)V

    .line 2533
    const v5, 0x7f070253

    if-nez v1, :cond_5

    move v2, v3

    :goto_3
    invoke-virtual {p0, p1, v5, v2}, Lcom/pccw/mobile/sip/service/MobileSipService;->enableDisableAudioCodec(Landroid/content/Context;IZ)V

    .line 2535
    .end local v1    # "enableIlbc":Z
    :cond_2
    return-void

    :cond_3
    move v1, v4

    .line 2528
    goto :goto_1

    .line 2529
    .restart local v1    # "enableIlbc":Z
    :cond_4
    const-string/jumbo v2, "g.711"

    goto :goto_2

    :cond_5
    move v2, v4

    .line 2533
    goto :goto_3
.end method

.method public static shouldEnableVideoButton(Ljava/lang/String;)Z
    .locals 4
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x4

    const/4 v0, 0x0

    .line 1227
    const-string/jumbo v1, "-"

    const-string/jumbo v2, ""

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1228
    const-string/jumbo v1, "+852"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1229
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 1237
    :cond_0
    :goto_0
    invoke-static {p0}, Lcom/pccw/mobile/util/MobileNumberUtil;->isHKMobileNumberStart(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1238
    const/4 v0, 0x1

    .line 1240
    :cond_1
    return v0

    .line 1230
    :cond_2
    const-string/jumbo v1, "133"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1231
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 1232
    :cond_3
    const-string/jumbo v1, "anonymous"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1234
    const-string/jumbo v1, "1357"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1235
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method private shouldGetCalleeState(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 4
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x4

    const/4 v0, 0x0

    .line 2263
    invoke-static {p2}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2279
    :cond_0
    :goto_0
    return v0

    .line 2266
    :cond_1
    const-string/jumbo v1, "-"

    const-string/jumbo v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2267
    const-string/jumbo v1, "+852"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2268
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 2276
    :cond_2
    :goto_1
    invoke-static {p1}, Lcom/pccw/mobile/util/MobileNumberUtil;->isHKMobileNumberStart(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2277
    const/4 v0, 0x1

    goto :goto_0

    .line 2269
    :cond_3
    const-string/jumbo v1, "133"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 2270
    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 2271
    :cond_4
    const-string/jumbo v1, "anonymous"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2273
    const-string/jumbo v1, "1357"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2274
    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_1
.end method

.method public static shouldUseOrientationMode(Ljava/lang/String;)I
    .locals 4
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x4

    const/4 v0, 0x1

    .line 1247
    const-string/jumbo v1, "-"

    const-string/jumbo v2, ""

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 1248
    const-string/jumbo v1, "+852"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1249
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 1257
    :cond_0
    :goto_0
    invoke-static {p0}, Lcom/pccw/mobile/util/MobileNumberUtil;->isHKMobileNumberStart(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1260
    :cond_1
    :goto_1
    return v0

    .line 1250
    :cond_2
    const-string/jumbo v1, "133"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1251
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 1252
    :cond_3
    const-string/jumbo v1, "anonymous"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1254
    const-string/jumbo v1, "1357"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1255
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 1260
    :cond_4
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private stopAutoLogin(Landroid/content/Context;)V
    .locals 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 314
    iput-boolean v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning:Z

    .line 315
    iput-boolean v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    .line 316
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    .line 317
    const-string/jumbo v3, "alarm"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 318
    .local v0, "am":Landroid/app/AlarmManager;
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/pccw/mobile/sip/RetryAlarmReceiver;

    invoke-direct {v1, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 319
    .local v1, "intent":Landroid/content/Intent;
    const/16 v3, 0x64

    invoke-static {p1, v3, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 320
    .local v2, "operation":Landroid/app/PendingIntent;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 321
    return-void
.end method

.method private stopEngine(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1370
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1371
    .local v0, "intent":Landroid/content/Intent;
    const-class v1, Lorg/linphone/LinphoneService;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 1372
    invoke-virtual {p1, v0}, Landroid/content/Context;->stopService(Landroid/content/Intent;)Z

    .line 1373
    return-void
.end method

.method private stopHeartbeat(Landroid/content/Context;)V
    .locals 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 1730
    const-string/jumbo v3, "alarm"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 1731
    .local v0, "am":Landroid/app/AlarmManager;
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/pccw/mobile/sip/HeartBeatAlarmReceiver;

    invoke-direct {v1, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1732
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p1, v4, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 1733
    .local v2, "operation":Landroid/app/PendingIntent;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 1734
    return-void
.end method

.method private stopReLogin(Landroid/content/Context;)V
    .locals 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 248
    const-string/jumbo v3, "alarm"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 249
    .local v0, "am":Landroid/app/AlarmManager;
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/pccw/mobile/sip/RetryAlarmReceiver;

    invoke-direct {v1, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 250
    .local v1, "intent":Landroid/content/Intent;
    const/16 v3, 0x64

    const/4 v4, 0x0

    invoke-static {p1, v3, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 251
    .local v2, "operation":Landroid/app/PendingIntent;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 252
    return-void
.end method


# virtual methods
.method public activateCallForward(ZLandroid/content/Context;)V
    .locals 1
    .param p1, "isActivating"    # Z
    .param p2, "mContext"    # Landroid/content/Context;

    .prologue
    .line 1404
    new-instance v0, Lcom/pccw/mobile/sip/service/MobileSipService$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService$4;-><init>(Lcom/pccw/mobile/sip/service/MobileSipService;ZLandroid/content/Context;)V

    .line 1701
    invoke-virtual {v0}, Lcom/pccw/mobile/sip/service/MobileSipService$4;->start()V

    .line 1702
    return-void
.end method

.method public addCall(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 6
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 2232
    const/4 v1, 0x0

    .line 2233
    .local v1, "tempNum":Ljava/lang/String;
    const/4 v2, 0x0

    .line 2234
    .local v2, "tempOriginalNumber":Ljava/lang/String;
    const/4 v0, 0x0

    .line 2236
    .local v0, "tempGetCalleeoriginalNumber":Ljava/lang/String;
    invoke-static {p1, p2}, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->mapPhoneNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2237
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->getDisplayNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2238
    move-object p1, v1

    .line 2241
    :cond_0
    move-object v0, p1

    .line 2243
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v3

    const-string/jumbo v4, "-"

    const-string/jumbo v5, ""

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->convertToPrefixHandledSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 2247
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    if-nez v3, :cond_1

    .line 2248
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    .line 2250
    :cond_1
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    if-nez v3, :cond_2

    .line 2251
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    iput-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    .line 2254
    :cond_2
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2255
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2257
    const/4 v3, 0x0

    invoke-virtual {p0, p1, p2, v3}, Lcom/pccw/mobile/sip/service/MobileSipService;->newOutgoingCall(Ljava/lang/String;Landroid/content/Context;Z)Z

    move-result v3

    return v3
.end method

.method public call(Ljava/lang/String;Landroid/content/Context;Z)Z
    .locals 8
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "videoEnable"    # Z

    .prologue
    const/4 v7, 0x1

    const/4 v3, 0x0

    .line 2179
    const/4 v1, 0x0

    .line 2181
    .local v1, "tempNum":Ljava/lang/String;
    const/4 v2, 0x0

    .line 2182
    .local v2, "tempOriginalNumber":Ljava/lang/String;
    const/4 v0, 0x0

    .line 2184
    .local v0, "tempGetCalleeoriginalNumber":Ljava/lang/String;
    iget-object v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    if-nez v4, :cond_2

    .line 2185
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    .line 2189
    :goto_0
    iget-object v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    if-nez v4, :cond_3

    .line 2190
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    .line 2195
    :goto_1
    invoke-static {p1, p2}, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->mapPhoneNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2196
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->getDisplayNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2197
    move-object p1, v1

    .line 2199
    :cond_0
    move-object v0, p1

    .line 2201
    if-eqz p3, :cond_4

    const-string/jumbo v4, "999"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string/jumbo v4, "112"

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 2202
    :cond_1
    sput-boolean v7, Lorg/linphone/DailPadActivity;->shouldShowReinviteWithAudioDialog:Z

    .line 2228
    :goto_2
    return v3

    .line 2187
    :cond_2
    iget-object v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    goto :goto_0

    .line 2192
    :cond_3
    iget-object v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->clear()V

    goto :goto_1

    .line 2205
    :cond_4
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldGetCalleeState(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 2206
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v4

    const-string/jumbo v5, "-"

    const-string/jumbo v6, ""

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->convertToPrefixHandledSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 2207
    iget-object v4, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 2209
    if-nez p3, :cond_5

    .line 2212
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2213
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2215
    invoke-virtual {p0, p1, p2, p3}, Lcom/pccw/mobile/sip/service/MobileSipService;->newOutgoingCall(Ljava/lang/String;Landroid/content/Context;Z)Z

    move-result v3

    goto :goto_2

    .line 2219
    :cond_5
    sput-boolean v7, Lorg/linphone/DailPadActivity;->shouldShowReinviteWithAudioDialog:Z

    goto :goto_2

    .line 2223
    :cond_6
    const-string/jumbo v3, "-"

    const-string/jumbo v4, ""

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2226
    :cond_7
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2227
    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2228
    invoke-virtual {p0, p1, p2, p3}, Lcom/pccw/mobile/sip/service/MobileSipService;->newOutgoingCall(Ljava/lang/String;Landroid/content/Context;Z)Z

    move-result v3

    goto :goto_2
.end method

.method public changeToAutoLoginSession()V
    .locals 1

    .prologue
    .line 358
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_0

    .line 359
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    .line 360
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    .line 362
    :cond_0
    return-void
.end method

.method public close(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 1871
    iput-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    .line 1872
    iput-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    .line 1886
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->getBackendHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/pccw/mobile/sip/service/MobileSipService$7;

    invoke-direct {v1, p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService$7;-><init>(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 2030
    return-void
.end method

.method public convertToPrefixHandledSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1, "number"    # Ljava/lang/String;
    .param p2, "mContext"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x4

    .line 1187
    const-string/jumbo v0, "1964"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1188
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "1964"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->getSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1198
    :goto_0
    return-object v0

    .line 1189
    :cond_0
    const-string/jumbo v0, "19156"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1190
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "19156"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->getSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1191
    :cond_1
    const-string/jumbo v0, "133"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1192
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "133"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->getSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1193
    :cond_2
    const-string/jumbo v0, "1357"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "1357"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->getSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1195
    :cond_3
    const-string/jumbo v0, "+852"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1196
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->getSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 1198
    :cond_4
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->getSipNumber(Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method public doAutologin(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 346
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 347
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, p1, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->httpsLogin(Landroid/content/Context;Landroid/os/Handler;)V

    .line 355
    :goto_0
    return-void

    .line 349
    :cond_0
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    if-nez v0, :cond_1

    .line 350
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->planAutologin(Landroid/content/Context;)V

    goto :goto_0

    .line 352
    :cond_1
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public doHeartBeat(Landroid/content/Context;)V
    .locals 14
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1751
    const/16 v7, 0x7530

    .line 1754
    .local v7, "nextHeartBeatTime":I
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v10

    if-eqz v10, :cond_6

    iget v10, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v10, :cond_6

    .line 1755
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 1756
    .local v8, "startTime":J
    const-string/jumbo v5, ""

    .line 1760
    .local v5, "hlContent":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v6

    .line 1768
    .local v6, "isWifiFast":Z
    if-eqz v6, :cond_2

    invoke-virtual {p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isConnected()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 1769
    const-string/jumbo v10, "https://sip.pccwmobile.com/voip02/heartbeat.do"

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string/jumbo v13, "session_id"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    iget-object v13, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sessionId:Ljava/lang/String;

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Lcom/pccw/mobile/sip/util/HttpUtils;->post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 1772
    const-string/jumbo v10, "0"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1773
    const/4 v10, 0x0

    sput v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1806
    .end local v6    # "isWifiFast":Z
    :goto_0
    sget v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    const/4 v11, 0x2

    if-le v10, v11, :cond_3

    .line 1809
    new-instance v10, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v11, Lcom/pccw/mobile/sip/service/MobileSipService$6;

    invoke-direct {v11, p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService$6;-><init>(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    invoke-virtual {v10, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1821
    const/4 v10, 0x0

    sput v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    .line 1840
    .end local v5    # "hlContent":Ljava/lang/String;
    .end local v8    # "startTime":J
    :goto_1
    return-void

    .line 1774
    .restart local v5    # "hlContent":Ljava/lang/String;
    .restart local v6    # "isWifiFast":Z
    .restart local v8    # "startTime":J
    :cond_0
    :try_start_1
    const-string/jumbo v10, "1"

    invoke-virtual {v10, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1777
    new-instance v10, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v11, Lcom/pccw/mobile/sip/service/MobileSipService$5;

    invoke-direct {v11, p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService$5;-><init>(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    invoke-virtual {v10, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1789
    const/4 v10, 0x0

    sput v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 1800
    .end local v6    # "isWifiFast":Z
    :catch_0
    move-exception v4

    .line 1803
    .local v4, "ex":Ljava/lang/Exception;
    sget v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    add-int/lit8 v10, v10, 0x1

    sput v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    goto :goto_0

    .line 1792
    .end local v4    # "ex":Ljava/lang/Exception;
    .restart local v6    # "isWifiFast":Z
    :cond_1
    :try_start_2
    sget v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    add-int/lit8 v10, v10, 0x1

    sput v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    goto :goto_0

    .line 1797
    :cond_2
    sget v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    add-int/lit8 v10, v10, 0x1

    sput v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 1823
    .end local v6    # "isWifiFast":Z
    :cond_3
    sget v10, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    if-lez v10, :cond_4

    .line 1826
    const/16 v7, 0x2710

    .line 1829
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 1830
    .local v2, "endTime":J
    int-to-long v10, v7

    sub-long v12, v2, v8

    sub-long v0, v10, v12

    .line 1831
    .local v0, "computedTime":J
    const-wide/16 v10, 0x64

    cmp-long v10, v0, v10

    if-lez v10, :cond_5

    .end local v0    # "computedTime":J
    :goto_2
    invoke-direct {p0, p1, v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->planHeartBeat(Landroid/content/Context;J)V

    goto :goto_1

    .restart local v0    # "computedTime":J
    :cond_5
    const-wide/16 v0, 0x64

    goto :goto_2

    .line 1836
    .end local v0    # "computedTime":J
    .end local v2    # "endTime":J
    .end local v5    # "hlContent":Ljava/lang/String;
    .end local v8    # "startTime":J
    :cond_6
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->resetLoginStatus(Landroid/content/Context;)V

    .line 1837
    const/4 v10, 0x1

    invoke-static {p1, v10}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    goto :goto_1
.end method

.method public doRelogin(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 275
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 276
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v0, p1, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->httpsLogin(Landroid/content/Context;Landroid/os/Handler;)V

    .line 284
    :goto_0
    return-void

    .line 278
    :cond_0
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-nez v0, :cond_1

    .line 279
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->planRelogin(Landroid/content/Context;)V

    goto :goto_0

    .line 281
    :cond_1
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public enableDisableAudioCodec(Landroid/content/Context;IZ)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "key"    # I
    .param p3, "enable"    # Z

    .prologue
    .line 2485
    .line 2486
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 2485
    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 2487
    .local v0, "mPref":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2488
    return-void
.end method

.method public fetchEncryptedIMSI(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 942
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedPccwImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 945
    .local v0, "username":Ljava/lang/String;
    return-object v0
.end method

.method public generateTopupURL(Landroid/content/Context;)Ljava/lang/String;
    .locals 9
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 2874
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isRegisteredPrepaid(Landroid/content/Context;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2875
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sessionId:Ljava/lang/String;

    invoke-static {v6}, Lcom/pccw/mobile/sip/util/StringUtilities;->md5Hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2876
    .local v0, "key":Ljava/lang/String;
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredNumber(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 2878
    .local v3, "registered_msisdn":Ljava/lang/String;
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->getRegisteredPrepaidNumberPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    .line 2879
    .local v4, "registered_msisdn_password":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sessionId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/pccw/mobile/sip/util/CryptoServices;->aesEncryptedByMasterKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2881
    .local v2, "r":Ljava/lang/String;
    const v6, 0x7f0701e4

    invoke-virtual {p1, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 2882
    .local v1, "lang":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "https://sip.pccwmobile.com/voip02/prepaidTopUp.do?msisdn=MSISDN_VALUE&r=R_VALUE"

    const-string/jumbo v8, "MSISDN_VALUE"

    invoke-virtual {v7, v8, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "R_VALUE"

    .line 2883
    invoke-virtual {v7, v8, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "&"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 2889
    .end local v0    # "key":Ljava/lang/String;
    .end local v1    # "lang":Ljava/lang/String;
    .end local v2    # "r":Ljava/lang/String;
    .end local v3    # "registered_msisdn":Ljava/lang/String;
    .end local v4    # "registered_msisdn_password":Ljava/lang/String;
    :goto_0
    return-object v5

    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method public declared-synchronized getBackendHandler()Landroid/os/Handler;
    .locals 3

    .prologue
    .line 365
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->backendHandler:Landroid/os/Handler;

    if-nez v1, :cond_0

    .line 373
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "backendHandler_thread"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 375
    .local v0, "bThread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 376
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->backendHandler:Landroid/os/Handler;

    .line 379
    .end local v0    # "bThread":Landroid/os/HandlerThread;
    :cond_0
    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->backendHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v1

    .line 365
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getCallForwardingState()I
    .locals 1

    .prologue
    .line 197
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->callForwardingState:I

    return v0
.end method

.method public getDisplayNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 1202
    const-string/jumbo v0, "+852"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1203
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1205
    .end local p1    # "number":Ljava/lang/String;
    :cond_0
    return-object p1
.end method

.method public getIsInHK()Z
    .locals 1

    .prologue
    .line 2845
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isInHK:Z

    return v0
.end method

.method public getLastCallForwardResponse()Lcom/pccw/mobile/sip/service/CallForwardResponse;
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->lastCallForwardResponse:Lcom/pccw/mobile/sip/service/CallForwardResponse;

    return-object v0
.end method

.method public getLastGetCalleeStatusResponse()Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;
    .locals 1

    .prologue
    .line 205
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->lastGetCalleeStatusResponse:Lcom/pccw/mobile/sip/service/GetCalleeStatusResponse;

    return-object v0
.end method

.method public getLoginErrorMsg(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1307
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1308
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    packed-switch v0, :pswitch_data_0

    .line 1324
    :cond_0
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0701f4

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1310
    :pswitch_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f07020c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_0

    .line 1313
    :pswitch_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0701b5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_0

    .line 1316
    :pswitch_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0701c5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_0

    .line 1319
    :pswitch_3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0701c7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    goto :goto_0

    .line 1308
    nop

    :pswitch_data_0
    .packed-switch -0x6
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method public getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;
    .locals 3
    .param p1, "c"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 1264
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isPhoneCallReady()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1265
    const-string/jumbo v1, "-1"

    .line 1289
    :goto_0
    return-object v1

    .line 1266
    :cond_0
    if-nez p1, :cond_1

    .line 1267
    const-string/jumbo v1, "-1"

    goto :goto_0

    .line 1268
    :cond_1
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneAddress;->asString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "conference@"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1269
    const-string/jumbo v1, "-3"

    goto :goto_0

    .line 1270
    :cond_2
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getDirection()Lorg/linphone/core/CallDirection;

    move-result-object v1

    sget-object v2, Lorg/linphone/core/CallDirection;->Incoming:Lorg/linphone/core/CallDirection;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1271
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v1

    invoke-interface {v1}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_3
    const-string/jumbo v1, "-1"

    goto :goto_0

    .line 1279
    :cond_4
    const/4 v0, 0x0

    .line 1281
    .local v0, "tempPhoneNumber":Ljava/lang/String;
    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    if-eqz v1, :cond_5

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 1282
    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "tempPhoneNumber":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .restart local v0    # "tempPhoneNumber":Ljava/lang/String;
    :goto_1
    move-object v1, v0

    .line 1289
    goto :goto_0

    .line 1283
    :cond_5
    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    if-eqz v1, :cond_6

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 1284
    iget-object v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getRemoteAddress()Lorg/linphone/core/LinphoneAddress;

    move-result-object v2

    invoke-interface {v2}, Lorg/linphone/core/LinphoneAddress;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "tempPhoneNumber":Ljava/lang/String;
    check-cast v0, Ljava/lang/String;

    .restart local v0    # "tempPhoneNumber":Ljava/lang/String;
    goto :goto_1

    .line 1286
    :cond_6
    const-string/jumbo v0, "-1"

    goto :goto_1
.end method

.method public handleSipRegisterFailed(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "mContext"    # Landroid/content/Context;
    .param p2, "smessage"    # Ljava/lang/String;

    .prologue
    .line 2100
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting:Z

    if-nez v0, :cond_1

    .line 2103
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sipRegistrationFailCount:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_4

    .line 2104
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    if-eqz v0, :cond_2

    .line 2105
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V

    .line 2119
    :goto_0
    const-string/jumbo v0, "no response timeout"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2129
    :cond_0
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2151
    :cond_1
    return-void

    .line 2106
    :cond_2
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-eqz v0, :cond_3

    .line 2107
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V

    goto :goto_0

    .line 2109
    :cond_3
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V

    goto :goto_0

    .line 2112
    :cond_4
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sipRegistrationFailCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sipRegistrationFailCount:I

    goto :goto_0
.end method

.method public handleSipRegisterSuccess(Landroid/content/Context;)V
    .locals 4
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 2039
    iput v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sipRegistrationFailCount:I

    .line 2040
    iget-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isFirstSipRegisterSuccessHanled:Z

    if-nez v1, :cond_6

    iget v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v1, :cond_6

    iget-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting:Z

    if-nez v1, :cond_6

    .line 2044
    iget-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-nez v1, :cond_7

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    .line 2045
    iget-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-eqz v1, :cond_0

    .line 2046
    invoke-static {}, Lorg/linphone/LinphoneActivity;->isInstanced()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2047
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/linphone/LinphoneActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2048
    .local v0, "i":Landroid/content/Intent;
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2049
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 2053
    .end local v0    # "i":Landroid/content/Intent;
    :cond_0
    iput-boolean v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning:Z

    .line 2054
    invoke-virtual {p0, v2, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->activateCallForward(ZLandroid/content/Context;)V

    .line 2055
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startHeartbeat(Landroid/content/Context;)V

    .line 2056
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->updateWifiSleepPolicyToNever(Landroid/content/Context;)V

    .line 2057
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->resetLoginRetryCount()V

    .line 2058
    iput-boolean v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isFirstSipRegisterSuccessHanled:Z

    .line 2062
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    if-nez v1, :cond_1

    .line 2063
    const-string/jumbo v1, "wifi"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    check-cast v1, Landroid/net/wifi/WifiManager;

    const-string/jumbo v3, "RoamSaveOn"

    .line 2064
    invoke-virtual {v1, v3}, Landroid/net/wifi/WifiManager;->createWifiLock(Ljava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v1

    sput-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 2066
    :cond_1
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2067
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->wifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    .line 2071
    :cond_2
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v1, :cond_3

    .line 2072
    const-string/jumbo v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    check-cast v1, Landroid/os/PowerManager;

    const-string/jumbo v3, "RoamSaveOn"

    .line 2073
    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    sput-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    .line 2076
    :cond_3
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-nez v1, :cond_4

    .line 2077
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->wakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 2079
    :cond_4
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->brightWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v1, :cond_5

    .line 2080
    const-string/jumbo v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    check-cast v1, Landroid/os/PowerManager;

    const v2, 0x1000001a

    const-string/jumbo v3, "RoamSaveFullWake"

    .line 2081
    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    sput-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->brightWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 2085
    :cond_5
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->brightWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-nez v1, :cond_6

    .line 2086
    sget-object v1, Lcom/pccw/mobile/sip/service/MobileSipService;->brightWakeLock:Landroid/os/PowerManager$WakeLock;

    const-wide/16 v2, 0x2710

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 2093
    :cond_6
    return-void

    :cond_7
    move v1, v3

    .line 2044
    goto/16 :goto_0
.end method

.method public declared-synchronized httpsLogin(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "handler"    # Landroid/os/Handler;

    .prologue
    .line 213
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 216
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    if-eqz v0, :cond_1

    .line 217
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startReLogin(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 218
    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldAutologin:Z

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->startAutoLogin(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 213
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 222
    :cond_2
    :try_start_2
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning:Z

    if-nez v0, :cond_0

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning:Z

    .line 224
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->getBackendHandler()Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->backendHandler:Landroid/os/Handler;

    .line 225
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->backendHandler:Landroid/os/Handler;

    new-instance v1, Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;

    invoke-direct {v1, p0, p1, p2}, Lcom/pccw/mobile/sip/service/MobileSipService$HttpsLoginTask;-><init>(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;Landroid/os/Handler;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public isAutoCodecSelection()Z
    .locals 1

    .prologue
    .line 193
    const/4 v0, 0x1

    return v0
.end method

.method public isAutoLoginRunning()Z
    .locals 1

    .prologue
    .line 1384
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning:Z

    return v0
.end method

.method public isAutoStart(Landroid/content/Context;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1394
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "PREF_AUTOSTART"

    const/4 v2, 0x0

    .line 1395
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1394
    return v0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 391
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isFirstSipRegisterSuccessHanled:Z

    return v0
.end method

.method public isDisconnecting()Z
    .locals 1

    .prologue
    .line 1390
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting:Z

    return v0
.end method

.method public isFirstRun(Landroid/content/Context;)Z
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 2463
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string/jumbo v1, "PREF_FIRST_RUN"

    const/4 v2, 0x1

    .line 2464
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 2463
    return v0
.end method

.method public isLoginRetryAble(Landroid/content/Context;)Z
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1330
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLoginRunning()Z
    .locals 1

    .prologue
    .line 1376
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning:Z

    return v0
.end method

.method public isLoginSuccress()Z
    .locals 1

    .prologue
    .line 189
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isNeedPrepaidTopUpReminderCheck()Z
    .locals 1

    .prologue
    .line 2860
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->needPrepaidTopUpReminderCheck:Z

    return v0
.end method

.method public isNetworkAvailable(Landroid/content/Context;)Z
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 386
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isRoaming(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isPhoneCallReady()Z
    .locals 2

    .prologue
    .line 2491
    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isFirstSipRegisterSuccessHanled:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->callForwardingState:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->callForwardingState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isDisconnecting:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isReLoginRunning()Z
    .locals 1

    .prologue
    .line 1380
    iget-boolean v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isReLoginRunning:Z

    return v0
.end method

.method public isRoaming(Landroid/content/Context;)Z
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 2437
    const/4 v0, 0x1

    return v0
.end method

.method public listAvailableCodecs(Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/service/Codec;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2478
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2479
    const/4 v0, 0x0

    .line 2481
    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/LinphoneService;->listAvailableCodecs()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public declared-synchronized newOutgoingCall(Ljava/lang/String;Landroid/content/Context;Z)Z
    .locals 9
    .param p1, "aTo"    # Ljava/lang/String;
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "videoEnable"    # Z

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 2388
    monitor-enter p0

    move-object v3, p1

    .line 2389
    .local v3, "lto":Ljava/lang/String;
    :try_start_0
    sget-object v7, Lorg/linphone/OutgoingCallReceiver;->TAG:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 2390
    sget-object v7, Lorg/linphone/OutgoingCallReceiver;->TAG:Ljava/lang/String;

    const-string/jumbo v8, ""

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 2394
    :cond_0
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v7

    invoke-virtual {v7}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v2

    .line 2395
    .local v2, "lLinphoneCore":Lorg/linphone/core/LinphoneCore;
    invoke-interface {v2}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v7

    if-le v7, v6, :cond_1

    .line 2396
    const v6, 0x7f070285

    invoke-virtual {p2, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-static {p2, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 2398
    .local v4, "toast":Landroid/widget/Toast;
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2427
    .end local v4    # "toast":Landroid/widget/Toast;
    :goto_0
    monitor-exit p0

    return v5

    .line 2403
    :cond_1
    :try_start_1
    invoke-interface {v2, v3}, Lorg/linphone/core/LinphoneCore;->interpretUrl(Ljava/lang/String;)Lorg/linphone/core/LinphoneAddress;
    :try_end_1
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 2416
    .local v1, "lAddress":Lorg/linphone/core/LinphoneAddress;
    :try_start_2
    invoke-static {}, Lorg/linphone/CallManager;->getInstance()Lorg/linphone/CallManager;

    move-result-object v7

    invoke-virtual {v7, v1, p3}, Lorg/linphone/CallManager;->inviteAddress(Lorg/linphone/core/LinphoneAddress;Z)V

    .line 2419
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v7

    invoke-virtual {v7, p2}, Lcom/pccw/mobile/sip/service/MobileSipService;->openIncallScreen(Landroid/content/Context;)V
    :try_end_2
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move v5, v6

    .line 2421
    goto :goto_0

    .line 2404
    .end local v1    # "lAddress":Lorg/linphone/core/LinphoneAddress;
    :catch_0
    move-exception v0

    .line 2405
    .local v0, "e":Lorg/linphone/core/LinphoneCoreException;
    const v6, 0x7f070286

    .line 2406
    :try_start_3
    invoke-virtual {p2, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    .line 2405
    invoke-static {p2, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 2408
    .restart local v4    # "toast":Landroid/widget/Toast;
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 2388
    .end local v0    # "e":Lorg/linphone/core/LinphoneCoreException;
    .end local v2    # "lLinphoneCore":Lorg/linphone/core/LinphoneCore;
    .end local v4    # "toast":Landroid/widget/Toast;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 2422
    .restart local v1    # "lAddress":Lorg/linphone/core/LinphoneAddress;
    .restart local v2    # "lLinphoneCore":Lorg/linphone/core/LinphoneCore;
    :catch_1
    move-exception v0

    .line 2423
    .restart local v0    # "e":Lorg/linphone/core/LinphoneCoreException;
    const v6, 0x7f070246

    .line 2424
    :try_start_4
    invoke-virtual {p2, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    .line 2423
    invoke-static {p2, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 2426
    .restart local v4    # "toast":Landroid/widget/Toast;
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method public openIncallScreen(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 2441
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2442
    .local v0, "startActivity":Landroid/content/Intent;
    const-class v1, Lorg/linphone/InCallScreen;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 2443
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2444
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 2445
    return-void
.end method

.method public openIncallScreen(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 2455
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2456
    .local v0, "startActivity":Landroid/content/Intent;
    const-class v1, Lorg/linphone/InCallScreen;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 2457
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2458
    const-string/jumbo v1, "message"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2459
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 2460
    return-void
.end method

.method public openVideoCallScreen(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 2448
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2449
    .local v0, "startActivity":Landroid/content/Intent;
    const-class v1, Lorg/linphone/VideoCallActivity;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 2450
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2451
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 2452
    return-void
.end method

.method public resetCallNumber()V
    .locals 1

    .prologue
    .line 2564
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    .line 2565
    return-void
.end method

.method public resetLoginRetryCount()V
    .locals 1

    .prologue
    .line 1865
    const/4 v0, 0x0

    iput v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginRetryCount:I

    .line 1866
    return-void
.end method

.method public resetLoginStatus(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 1334
    const/16 v0, -0x64

    iput v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    .line 1335
    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isFirstSipRegisterSuccessHanled:Z

    .line 1336
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->currentRegisterCallId:Ljava/lang/String;

    .line 1337
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginErrorMsg:Ljava/lang/String;

    .line 1338
    iput v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->sipRegistrationFailCount:I

    .line 1344
    sput v1, Lcom/pccw/mobile/sip/service/MobileSipService;->heartBeatRetryCount:I

    .line 1345
    return-void
.end method

.method public resetgetCalleeoriginalNumber()V
    .locals 1

    .prologue
    .line 2568
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->getCalleeoriginalNumber:Ljava/util/HashMap;

    .line 2569
    return-void
.end method

.method public setFirstRun(Landroid/content/Context;Z)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "isFirst"    # Z

    .prologue
    .line 2468
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "PREF_FIRST_RUN"

    .line 2469
    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2470
    return-void
.end method

.method public setNeedPrepaidTopUpReminderCheck(Z)V
    .locals 0
    .param p1, "needPrepaidTopUpReminderCheck"    # Z

    .prologue
    .line 2864
    iput-boolean p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->needPrepaidTopUpReminderCheck:Z

    .line 2865
    return-void
.end method

.method public shouldRestoreMapPhoneNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 1217
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1218
    iget-object v0, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->originalNumber:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1220
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public sipStatus(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const v5, 0x7f070274

    .line 2538
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2539
    const-string/jumbo v0, "Not login"

    .line 2560
    :goto_0
    return-object v0

    .line 2541
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Domain: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v3

    iget-object v3, v3, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iget-object v3, v3, Lorg/linphone/LinphoneService$sipState;->domain:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2542
    .local v0, "message":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "Identiy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v3

    iget-object v3, v3, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iget-object v3, v3, Lorg/linphone/LinphoneService$sipState;->identity:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2543
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "Proxy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v3

    iget-object v3, v3, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iget-object v3, v3, Lorg/linphone/LinphoneService$sipState;->proxy:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2544
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "Route: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v3

    iget-object v3, v3, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iget-object v3, v3, Lorg/linphone/LinphoneService$sipState;->route:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2545
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "Registration state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2546
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v3

    iget-object v3, v3, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iget-object v3, v3, Lorg/linphone/LinphoneService$sipState;->regState:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2547
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const v3, 0x7f070273

    .line 2548
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 2549
    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 2547
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2550
    .local v1, "mode":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "Tunnel is enabled/mode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2551
    invoke-static {}, Lorg/linphone/LinphoneService;->instance()Lorg/linphone/LinphoneService;

    move-result-object v3

    invoke-virtual {v3}, Lorg/linphone/LinphoneService;->tunnelingEnabled()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 2554
    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2555
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const v5, 0x7f070267

    .line 2556
    invoke-virtual {p1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    .line 2555
    invoke-interface {v2, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "on"

    :goto_1
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_2
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2558
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "Codecs: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->currentCodec:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2560
    goto/16 :goto_0

    .line 2555
    :cond_1
    const-string/jumbo v2, "off"

    goto :goto_1

    :cond_2
    const-string/jumbo v2, ""

    goto :goto_2
.end method

.method public specialPhoneName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "number"    # Ljava/lang/String;

    .prologue
    const v1, 0x7f07022d

    .line 1296
    invoke-static {p1}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1297
    const-string/jumbo v0, "*988"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1298
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1303
    :goto_0
    return-object v0

    .line 1300
    :cond_0
    const-string/jumbo v0, "*988"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "*90"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "*92"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1301
    :cond_1
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1303
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized startAutoLogin(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 290
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->stopEngine(Landroid/content/Context;)V

    .line 291
    const-string/jumbo v2, "wifi"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/wifi/WifiManager;

    .line 293
    .local v1, "wifi":Landroid/net/wifi/WifiManager;
    invoke-static {p1}, Lcom/pccw/mobile/util/SSIDUtil;->getCurrentSSID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/pccw/pref/SSIDList;->containsSSID(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v2

    if-nez v2, :cond_1

    .line 297
    :cond_0
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->stopAutoLogin(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 309
    :goto_0
    monitor-exit p0

    return-void

    .line 300
    :cond_1
    const/4 v2, 0x0

    :try_start_1
    iput-boolean v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning:Z

    .line 301
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isReLoginRunning:Z

    .line 302
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning:Z

    .line 303
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->resetLoginStatus(Landroid/content/Context;)V

    .line 304
    const/4 v2, 0x1

    invoke-static {p1, v2}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    .line 305
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 306
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v2, "com.pccw.mobile.sip.intent.autologinprocessing"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 307
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 308
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->planAutologin(Landroid/content/Context;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 290
    .end local v0    # "i":Landroid/content/Intent;
    .end local v1    # "wifi":Landroid/net/wifi/WifiManager;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public startCallChecking(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 7
    .param p1, "target"    # Ljava/lang/String;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    const v6, 0x7f07006a

    const v5, 0x7f0204c6

    const v4, 0x104000a

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 2156
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 2158
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f070115

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 2159
    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v4, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2174
    :goto_0
    return v0

    .line 2162
    :cond_0
    invoke-static {p1, p2}, Lcom/pccw/mobile/sip/util/NumberMappingUtil;->shouldBarPhoneNumber(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2163
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070072

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 2164
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2168
    :cond_1
    invoke-virtual {p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isPhoneCallReady()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v2

    if-nez v2, :cond_3

    .line 2170
    :cond_2
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0701c8

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 2171
    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v4, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    :cond_3
    move v0, v1

    .line 2174
    goto :goto_0
.end method

.method public declared-synchronized startHeartbeat(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1719
    monitor-enter p0

    const-wide/16 v0, 0x3e8

    :try_start_0
    invoke-direct {p0, p1, v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->planHeartBeat(Landroid/content/Context;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1725
    monitor-exit p0

    return-void

    .line 1719
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startReLogin(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 233
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->stopEngine(Landroid/content/Context;)V

    .line 234
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isLoginRunning:Z

    .line 235
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoLoginRunning:Z

    .line 236
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->isReLoginRunning:Z

    .line 237
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->resetLoginStatus(Landroid/content/Context;)V

    .line 238
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    .line 239
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 240
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "com.pccw.mobile.sip.intent.reloginprocessing"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 242
    invoke-direct {p0, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->planRelogin(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    monitor-exit p0

    return-void

    .line 233
    .end local v0    # "i":Landroid/content/Intent;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public updateWifiSleepPolicyToNever(Landroid/content/Context;)V
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 1843
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1844
    .local v0, "cr":Landroid/content/ContentResolver;
    const-string/jumbo v1, "wifi_sleep_policy"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/pccw/mobile/sip/service/MobileSipService;->lastWifiSleepPolicy:I

    .line 1853
    const-string/jumbo v1, "wifi_sleep_policy"

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1859
    return-void
.end method

.method public useSoftvolume(Landroid/content/Context;)Z
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 2473
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f07024d

    .line 2474
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 2473
    return v0
.end method
