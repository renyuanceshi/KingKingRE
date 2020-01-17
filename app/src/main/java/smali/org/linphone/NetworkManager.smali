.class public Lorg/linphone/NetworkManager;
.super Landroid/content/BroadcastReceiver;
.source "NetworkManager.java"


# static fields
.field public static previousSSID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-string/jumbo v0, ""

    sput-object v0, Lorg/linphone/NetworkManager;->previousSSID:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/linphone/NetworkManager;Landroid/content/Context;)Z
    .locals 1
    .param p0, "x0"    # Lorg/linphone/NetworkManager;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/linphone/NetworkManager;->canAutoLogin(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method private canAutoLogin(Landroid/content/Context;)Z
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 180
    invoke-static {p1}, Lorg/linphone/NetworkManager;->isCorrespondingTNCRead(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method public static isCSLPostpaidTAndCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 216
    const/4 v0, 0x0

    .line 218
    .local v0, "result":Z
    if-eqz p0, :cond_0

    .line 219
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaidTCAccepted(Landroid/content/Context;)Z

    move-result v0

    .line 222
    :cond_0
    return v0
.end method

.method public static isCSLPrepaidTAndCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 226
    const/4 v0, 0x0

    .line 228
    .local v0, "result":Z
    if-eqz p0, :cond_0

    .line 229
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaidTCAccepted(Landroid/content/Context;)Z

    move-result v0

    .line 232
    :cond_0
    return v0
.end method

.method public static isCorrespondingTNCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 184
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isNormalPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHelloPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 185
    :cond_0
    invoke-static {p0}, Lorg/linphone/NetworkManager;->isHKTPrepaidTAndCRead(Landroid/content/Context;)Z

    move-result v0

    .line 191
    :goto_0
    return v0

    .line 186
    :cond_1
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPrepaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 187
    invoke-static {p0}, Lorg/linphone/NetworkManager;->isCSLPrepaidTAndCRead(Landroid/content/Context;)Z

    move-result v0

    goto :goto_0

    .line 188
    :cond_2
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isCSLPostpaid(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 189
    invoke-static {p0}, Lorg/linphone/NetworkManager;->isCSLPostpaidTAndCRead(Landroid/content/Context;)Z

    move-result v0

    goto :goto_0

    .line 191
    :cond_3
    invoke-static {p0}, Lorg/linphone/NetworkManager;->isHKTPostpaidTAndCRead(Landroid/content/Context;)Z

    move-result v0

    goto :goto_0
.end method

.method public static isHKTPostpaidTAndCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 196
    const/4 v0, 0x0

    .line 198
    .local v0, "result":Z
    if-eqz p0, :cond_0

    .line 199
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPostpaidTCAccepted(Landroid/content/Context;)Z

    move-result v0

    .line 202
    :cond_0
    return v0
.end method

.method public static isHKTPrepaidTAndCRead(Landroid/content/Context;)Z
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 206
    const/4 v0, 0x0

    .line 208
    .local v0, "result":Z
    if-eqz p0, :cond_0

    .line 209
    invoke-static {p0}, Lcom/pccw/mobile/sip/ClientStateManager;->isHKTPrepaidTCAccepted(Landroid/content/Context;)Z

    move-result v0

    .line 212
    :cond_0
    return v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 45
    new-instance v0, Lorg/linphone/NetworkManager$1;

    invoke-direct {v0, p0, p2, p1}, Lorg/linphone/NetworkManager$1;-><init>(Lorg/linphone/NetworkManager;Landroid/content/Intent;Landroid/content/Context;)V

    .line 173
    invoke-virtual {v0}, Lorg/linphone/NetworkManager$1;->start()V

    .line 175
    return-void
.end method
