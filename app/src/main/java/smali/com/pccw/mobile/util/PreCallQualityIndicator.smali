.class public Lcom/pccw/mobile/util/PreCallQualityIndicator;
.super Ljava/lang/Object;
.source "PreCallQualityIndicator.java"


# static fields
.field public static final PRE_CALL_QI_MSG:I = 0x3e8

.field public static validEchoId:I


# instance fields
.field private checkNetQuaPauseTimeThread:Ljava/lang/Thread;

.field private checkNetQuaThread:Ljava/lang/Thread;

.field ctx:Landroid/content/Context;

.field private echoClient:Lcom/pccw/mobile/service/EchoClient;

.field private echoServerPref:Lcom/pccw/pref/EchoServerPref;

.field public isUpdateIndiThreadWorking:Z

.field public keepLoopingIndicator:Z

.field private mHandler:Landroid/os/Handler;

.field public networkIndiRefreshTime:I

.field public networkIndiTimer:Ljava/util/Timer;

.field private uiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const/4 v0, -0x1

    sput v0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->validEchoId:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "uiHandler"    # Landroid/os/Handler;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    .line 25
    iput-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    .line 26
    iput-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaPauseTimeThread:Ljava/lang/Thread;

    .line 31
    const/16 v0, 0x190

    iput v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiRefreshTime:I

    .line 34
    iput-boolean v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->keepLoopingIndicator:Z

    .line 35
    iput-boolean v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->isUpdateIndiThreadWorking:Z

    .line 40
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->ctx:Landroid/content/Context;

    .line 41
    new-instance v0, Lcom/pccw/pref/EchoServerPref;

    invoke-direct {v0, p1}, Lcom/pccw/pref/EchoServerPref;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->echoServerPref:Lcom/pccw/pref/EchoServerPref;

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->mHandler:Landroid/os/Handler;

    .line 43
    iput-object p2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->uiHandler:Landroid/os/Handler;

    .line 44
    return-void
.end method

.method static synthetic access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/pccw/mobile/util/PreCallQualityIndicator;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetworkQualityPauseTime()V

    return-void
.end method

.method static synthetic access$1000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->uiHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/util/PreCallQualityIndicator;)V
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetworkQuality()V

    return-void
.end method

.method static synthetic access$300(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Ljava/lang/Thread;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaPauseTimeThread:Ljava/lang/Thread;

    return-object v0
.end method

.method static synthetic access$302(Lcom/pccw/mobile/util/PreCallQualityIndicator;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaPauseTimeThread:Ljava/lang/Thread;

    return-object p1
.end method

.method static synthetic access$400(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/pref/EchoServerPref;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->echoServerPref:Lcom/pccw/pref/EchoServerPref;

    return-object v0
.end method

.method static synthetic access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->echoClient:Lcom/pccw/mobile/service/EchoClient;

    return-object v0
.end method

.method static synthetic access$502(Lcom/pccw/mobile/util/PreCallQualityIndicator;Lcom/pccw/mobile/service/EchoClient;)Lcom/pccw/mobile/service/EchoClient;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;
    .param p1, "x1"    # Lcom/pccw/mobile/service/EchoClient;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->echoClient:Lcom/pccw/mobile/service/EchoClient;

    return-object p1
.end method

.method static synthetic access$600(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Ljava/lang/Thread;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    return-object v0
.end method

.method static synthetic access$602(Lcom/pccw/mobile/util/PreCallQualityIndicator;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;
    .param p1, "x1"    # Ljava/lang/Thread;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    return-object p1
.end method

.method private checkNetworkQuality()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 172
    iget-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    if-eqz v2, :cond_0

    .line 173
    iget-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 174
    iput-object v3, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    .line 178
    :cond_0
    iget-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->echoServerPref:Lcom/pccw/pref/EchoServerPref;

    invoke-virtual {v2}, Lcom/pccw/pref/EchoServerPref;->getEchoServerHost1()Ljava/lang/String;

    move-result-object v0

    .line 179
    .local v0, "host_1":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->echoServerPref:Lcom/pccw/pref/EchoServerPref;

    invoke-virtual {v2}, Lcom/pccw/pref/EchoServerPref;->getEchoServerHost2()Ljava/lang/String;

    move-result-object v1

    .line 181
    .local v1, "host_2":Ljava/lang/String;
    const-string/jumbo v2, "NA"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v2, "NA"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 182
    iget-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    if-eqz v2, :cond_1

    .line 185
    iget-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    invoke-virtual {v2}, Ljava/util/Timer;->cancel()V

    .line 186
    iget-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    invoke-virtual {v2}, Ljava/util/Timer;->purge()I

    .line 187
    iput-object v3, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    .line 189
    :cond_1
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->isUpdateIndiThreadWorking:Z

    .line 598
    :goto_0
    return-void

    .line 193
    :cond_2
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    invoke-direct {v3, p0, v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    .line 597
    iget-object v2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private checkNetworkQualityPauseTime()V
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaPauseTimeThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 135
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaPauseTimeThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 136
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaPauseTimeThread:Ljava/lang/Thread;

    .line 139
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/pccw/mobile/util/PreCallQualityIndicator$2;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/util/PreCallQualityIndicator$2;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaPauseTimeThread:Ljava/lang/Thread;

    .line 168
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaPauseTimeThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 169
    return-void
.end method

.method private startPreCallQI()V
    .locals 6

    .prologue
    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->keepLoopingIndicator:Z

    .line 57
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 58
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    .line 61
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    new-instance v1, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator;)V

    const-wide/16 v2, 0x1f4

    iget v4, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiRefreshTime:I

    int-to-long v4, v4

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 106
    :cond_0
    return-void
.end method

.method private stopPreCallQI()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 120
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 122
    iput-object v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->networkIndiTimer:Ljava/util/Timer;

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    .line 126
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 127
    iput-object v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetQuaThread:Ljava/lang/Thread;

    .line 130
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->isUpdateIndiThreadWorking:Z

    .line 131
    return-void
.end method


# virtual methods
.method public restoreNetworkIndiToDefault()V
    .locals 2

    .prologue
    .line 110
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 111
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x3e8

    iput v1, v0, Landroid/os/Message;->what:I

    .line 112
    const-string/jumbo v1, "UNKNOWN"

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 113
    iget-object v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->uiHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 114
    return-void
.end method

.method public startChecking()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->startPreCallQI()V

    .line 48
    return-void
.end method

.method public stopChecking()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->stopPreCallQI()V

    .line 52
    return-void
.end method
