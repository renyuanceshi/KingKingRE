.class public Lorg/linphone/LinphoneService;
.super Landroid/app/Service;
.source "LinphoneService.java"

# interfaces
.implements Lorg/linphone/core/LinphoneCoreListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/linphone/LinphoneService$sipState;
    }
.end annotation


# static fields
.field public static final IC_LEVEL_AVAILABLE:I = 0x0

.field public static final IC_LEVEL_AWAY:I = 0x1

.field public static final IC_LEVEL_IDLE:I = 0x2

.field public static final IC_LEVEL_OFFLINE:I = 0x3

.field public static final NOTIFICATION_MISSED_CALL:I = 0x0

.field public static final NOTIFICATION_REGISTRATION_STATUS:I = 0x1

.field public static ShowVideoSlidingTab:Z = false

.field public static final TAG:Ljava/lang/String; = "PCCW_MOBILE_SIP"

.field private static codecs:[Lcom/pccw/mobile/sip/service/Codec;

.field private static simpleListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/linphone/LinphoneSimpleListener;",
            ">;"
        }
    .end annotation
.end field

.field private static theLinphone:Lorg/linphone/LinphoneService;


# instance fields
.field private bluetoothReiceiver:Landroid/content/BroadcastReceiver;

.field private callWaitingToneSoundFile:Ljava/lang/String;

.field private echoCalibrationDone:Z

.field public isBluetoothScoConnected:Z

.field public isBluetoothScoStarted:Z

.field private isRinging:Z

.field public isUsingBluetoothAudioRoute:Z

.field public lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

.field private linphoneConfigFile:Ljava/lang/String;

.field private linphoneInitialConfigFile:Ljava/lang/String;

.field private mAudioManager:Landroid/media/AudioManager;

.field private mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

.field mCurrentCallState:Lorg/linphone/core/LinphoneCall$State;

.field private mHandler:Landroid/os/Handler;

.field private mKeepAliveMgrReceiver:Landroid/content/BroadcastReceiver;

.field private mLinphoneCore:Lorg/linphone/core/LinphoneCore;

.field private mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

.field private mPref:Landroid/content/SharedPreferences;

.field private mProfileListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

.field mRingerPlayer:Landroid/media/MediaPlayer;

.field private mServiceContext:Landroid/content/Context;

.field mTimer:Ljava/util/Timer;

.field mVibrator:Landroid/os/Vibrator;

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field private ringSoundFile:Ljava/lang/String;

.field private ringbackSoundFile:Ljava/lang/String;

.field private ringingCall:Lorg/linphone/core/LinphoneCall;

.field private staticPicFile:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v4, 0x0

    const/16 v6, 0x1f40

    .line 162
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lorg/linphone/LinphoneService;->simpleListeners:Ljava/util/List;

    .line 165
    sput-boolean v4, Lorg/linphone/LinphoneService;->ShowVideoSlidingTab:Z

    .line 995
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/pccw/mobile/sip/service/Codec;

    new-instance v1, Lcom/pccw/mobile/sip/service/Codec;

    const-string/jumbo v2, "AMR"

    const v3, 0x7f07024f

    invoke-direct {v1, v2, v6, v3}, Lcom/pccw/mobile/sip/service/Codec;-><init>(Ljava/lang/String;II)V

    aput-object v1, v0, v4

    const/4 v1, 0x1

    new-instance v2, Lcom/pccw/mobile/sip/service/Codec;

    const-string/jumbo v3, "speex"

    const/16 v4, 0x7d00

    const v5, 0x7f070255

    invoke-direct {v2, v3, v4, v5}, Lcom/pccw/mobile/sip/service/Codec;-><init>(Ljava/lang/String;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lcom/pccw/mobile/sip/service/Codec;

    const-string/jumbo v3, "speex"

    const/16 v4, 0x3e80

    const v5, 0x7f070254

    invoke-direct {v2, v3, v4, v5}, Lcom/pccw/mobile/sip/service/Codec;-><init>(Ljava/lang/String;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/pccw/mobile/sip/service/Codec;

    const-string/jumbo v3, "speex"

    const v4, 0x7f070256

    invoke-direct {v2, v3, v6, v4}, Lcom/pccw/mobile/sip/service/Codec;-><init>(Ljava/lang/String;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lcom/pccw/mobile/sip/service/Codec;

    const-string/jumbo v3, "iLBC"

    const v4, 0x7f070251

    invoke-direct {v2, v3, v6, v4}, Lcom/pccw/mobile/sip/service/Codec;-><init>(Ljava/lang/String;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-instance v2, Lcom/pccw/mobile/sip/service/Codec;

    const-string/jumbo v3, "GSM"

    const v4, 0x7f070250

    invoke-direct {v2, v3, v6, v4}, Lcom/pccw/mobile/sip/service/Codec;-><init>(Ljava/lang/String;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-instance v2, Lcom/pccw/mobile/sip/service/Codec;

    const-string/jumbo v3, "PCMU"

    const v4, 0x7f070253

    invoke-direct {v2, v3, v6, v4}, Lcom/pccw/mobile/sip/service/Codec;-><init>(Ljava/lang/String;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-instance v2, Lcom/pccw/mobile/sip/service/Codec;

    const-string/jumbo v3, "PCMA"

    const v4, 0x7f070252

    invoke-direct {v2, v3, v6, v4}, Lcom/pccw/mobile/sip/service/Codec;-><init>(Ljava/lang/String;II)V

    aput-object v2, v0, v1

    sput-object v0, Lorg/linphone/LinphoneService;->codecs:[Lcom/pccw/mobile/sip/service/Codec;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 108
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 125
    new-instance v0, Ljava/util/Timer;

    const-string/jumbo v1, "Linphone scheduler"

    invoke-direct {v0, v1}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mTimer:Ljava/util/Timer;

    .line 151
    new-instance v0, Lorg/linphone/KeepAliveManager;

    invoke-direct {v0}, Lorg/linphone/KeepAliveManager;-><init>()V

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mKeepAliveMgrReceiver:Landroid/content/BroadcastReceiver;

    .line 152
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

    .line 157
    new-instance v0, Lorg/linphone/BluetoothManager;

    invoke-direct {v0}, Lorg/linphone/BluetoothManager;-><init>()V

    iput-object v0, p0, Lorg/linphone/LinphoneService;->bluetoothReiceiver:Landroid/content/BroadcastReceiver;

    .line 160
    iput-boolean v2, p0, Lorg/linphone/LinphoneService;->isBluetoothScoStarted:Z

    .line 164
    iput-boolean v2, p0, Lorg/linphone/LinphoneService;->echoCalibrationDone:Z

    .line 167
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mHandler:Landroid/os/Handler;

    .line 498
    new-instance v0, Lorg/linphone/LinphoneService$sipState;

    invoke-direct {v0, p0}, Lorg/linphone/LinphoneService$sipState;-><init>(Lorg/linphone/LinphoneService;)V

    iput-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    return-void
.end method

.method static synthetic access$000(Lorg/linphone/LinphoneService;)Lorg/linphone/core/LinphoneCore;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    return-object v0
.end method

.method static synthetic access$100(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/LinphoneService;
    .param p1, "x1"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lorg/linphone/LinphoneService;->enterIncallMode(Lorg/linphone/core/LinphoneCore;)V

    return-void
.end method

.method static synthetic access$200(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCall;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/LinphoneService;
    .param p1, "x1"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lorg/linphone/LinphoneService;->callLog(Lorg/linphone/core/LinphoneCall;)V

    return-void
.end method

.method static synthetic access$300(Lorg/linphone/LinphoneService;)V
    .locals 0
    .param p0, "x0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 108
    invoke-direct {p0}, Lorg/linphone/LinphoneService;->exitCallMode()V

    return-void
.end method

.method static synthetic access$400(Lorg/linphone/LinphoneService;)Landroid/bluetooth/BluetoothHeadset;
    .locals 1
    .param p0, "x0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 108
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object v0
.end method

.method static synthetic access$402(Lorg/linphone/LinphoneService;Landroid/bluetooth/BluetoothHeadset;)Landroid/bluetooth/BluetoothHeadset;
    .locals 0
    .param p0, "x0"    # Lorg/linphone/LinphoneService;
    .param p1, "x1"    # Landroid/bluetooth/BluetoothHeadset;

    .prologue
    .line 108
    iput-object p1, p0, Lorg/linphone/LinphoneService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    return-object p1
.end method

.method private callLog(Lorg/linphone/core/LinphoneCall;)V
    .locals 12
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 802
    if-nez p1, :cond_1

    .line 906
    :cond_0
    :goto_0
    return-void

    .line 808
    :cond_1
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v8

    invoke-virtual {v8, p1}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v6

    .line 812
    .local v6, "number":Ljava/lang/String;
    if-eqz v6, :cond_2

    invoke-static {v6}, Lorg/apache/commons/lang/StringUtils;->isBlank(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 813
    :cond_2
    const-string/jumbo v6, "-1"

    .line 825
    :cond_3
    :goto_1
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getDuration()I

    move-result v8

    int-to-long v2, v8

    .line 828
    .local v2, "duration":J
    const/4 v4, 0x0

    .line 833
    .local v4, "isPrivateNumber":Z
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCall;->getDirection()Lorg/linphone/core/CallDirection;

    move-result-object v8

    sget-object v9, Lorg/linphone/core/CallDirection;->Incoming:Lorg/linphone/core/CallDirection;

    if-ne v8, v9, :cond_8

    .line 834
    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-nez v8, :cond_7

    const/4 v0, 0x3

    .line 842
    .local v0, "callLogType":I
    :goto_2
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 843
    .local v7, "values":Landroid/content/ContentValues;
    const-string/jumbo v8, "number"

    invoke-virtual {v7, v8, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 844
    const-string/jumbo v8, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 845
    const-string/jumbo v8, "duration"

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 846
    const-string/jumbo v8, "type"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 847
    const-string/jumbo v8, "new"

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 848
    const-string/jumbo v8, "name"

    const-string/jumbo v9, ""

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 849
    const-string/jumbo v8, "numbertype"

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 850
    const-string/jumbo v8, "numberlabel"

    const-string/jumbo v9, ""

    invoke-virtual {v7, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 852
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    sget-object v9, Lcom/pccw/mobile/provider/KingKingContentProvider;->CALL_LOG_URI:Landroid/net/Uri;

    invoke-virtual {v8, v9, v7}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 854
    const/4 v8, 0x3

    if-ne v0, v8, :cond_0

    .line 871
    invoke-static {}, Lorg/linphone/KingKingLinphoneUtil;->getInstance()Lorg/linphone/KingKingLinphoneUtil;

    move-result-object v8

    invoke-virtual {v8}, Lorg/linphone/KingKingLinphoneUtil;->getContact()Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v1

    .line 879
    .local v1, "ci":Lcom/pccw/mobile/sip/util/Contact;
    if-nez v1, :cond_4

    .line 880
    invoke-static {}, Lcom/pccw/mobile/sip/util/ContactsUtils;->getInstance()Lcom/pccw/mobile/sip/util/ContactsUtils;

    move-result-object v8

    .line 881
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->getApplicationContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v8, v9, v6}, Lcom/pccw/mobile/sip/util/ContactsUtils;->queryByPhoneNumber(Landroid/content/Context;Ljava/lang/String;)Lcom/pccw/mobile/sip/util/Contact;

    move-result-object v1

    .line 882
    :cond_4
    if-eqz v1, :cond_9

    iget-object v8, v1, Lcom/pccw/mobile/sip/util/Contact;->displayName:Ljava/lang/String;

    invoke-static {v8}, Lorg/apache/commons/lang/StringUtils;->isNotBlank(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 883
    iget-object v5, v1, Lcom/pccw/mobile/sip/util/Contact;->displayName:Ljava/lang/String;

    .line 891
    .local v5, "notificationText":Ljava/lang/String;
    :goto_3
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {p0, v8, v9, v5}, Lorg/linphone/LinphoneService;->makeNotification(Landroid/content/Context;IILjava/lang/String;)V

    goto/16 :goto_0

    .line 814
    .end local v0    # "callLogType":I
    .end local v1    # "ci":Lcom/pccw/mobile/sip/util/Contact;
    .end local v2    # "duration":J
    .end local v4    # "isPrivateNumber":Z
    .end local v5    # "notificationText":Ljava/lang/String;
    .end local v7    # "values":Landroid/content/ContentValues;
    :cond_5
    const-string/jumbo v8, "anonymous"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 815
    const-string/jumbo v6, "-2"

    goto/16 :goto_1

    .line 816
    :cond_6
    const-string/jumbo v8, "-3"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 820
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v8

    invoke-virtual {v8, v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRestoreMapPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 821
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v8

    invoke-virtual {v8, v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRestoreMapPhoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 834
    .restart local v2    # "duration":J
    .restart local v4    # "isPrivateNumber":Z
    :cond_7
    const/4 v0, 0x1

    goto/16 :goto_2

    .line 837
    :cond_8
    const/4 v0, 0x2

    .restart local v0    # "callLogType":I
    goto/16 :goto_2

    .line 884
    .restart local v1    # "ci":Lcom/pccw/mobile/sip/util/Contact;
    .restart local v7    # "values":Landroid/content/ContentValues;
    :cond_9
    const-string/jumbo v8, "-1"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    .line 885
    const v8, 0x7f07022b

    invoke-virtual {p0, v8}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "notificationText":Ljava/lang/String;
    goto :goto_3

    .line 886
    .end local v5    # "notificationText":Ljava/lang/String;
    :cond_a
    const-string/jumbo v8, "-2"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 887
    const v8, 0x7f0701e6

    invoke-virtual {p0, v8}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "notificationText":Ljava/lang/String;
    goto :goto_3

    .line 889
    .end local v5    # "notificationText":Ljava/lang/String;
    :cond_b
    move-object v5, v6

    .restart local v5    # "notificationText":Ljava/lang/String;
    goto :goto_3
.end method

.method public static cancelNotification(Landroid/content/Context;I)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "type"    # I

    .prologue
    .line 1630
    const-string/jumbo v1, "notification"

    .line 1631
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 1633
    .local v0, "notificationManager":Landroid/app/NotificationManager;
    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 1634
    return-void
.end method

.method private copyAssetsFromPackage(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 380
    const v0, 0x7f060003

    iget-object v1, p0, Lorg/linphone/LinphoneService;->ringSoundFile:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lorg/linphone/LinphoneService;->copyIfNotExist(Landroid/content/Context;ILjava/lang/String;)V

    .line 381
    const v0, 0x7f060004

    iget-object v1, p0, Lorg/linphone/LinphoneService;->ringbackSoundFile:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lorg/linphone/LinphoneService;->copyIfNotExist(Landroid/content/Context;ILjava/lang/String;)V

    .line 382
    const v0, 0x7f060005

    iget-object v1, p0, Lorg/linphone/LinphoneService;->staticPicFile:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lorg/linphone/LinphoneService;->copyIfNotExist(Landroid/content/Context;ILjava/lang/String;)V

    .line 383
    const/high16 v0, 0x7f060000

    iget-object v1, p0, Lorg/linphone/LinphoneService;->callWaitingToneSoundFile:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lorg/linphone/LinphoneService;->copyIfNotExist(Landroid/content/Context;ILjava/lang/String;)V

    .line 384
    const v0, 0x7f060002

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/linphone/LinphoneService;->linphoneInitialConfigFile:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lorg/linphone/LinphoneService;->copyFromPackage(Landroid/content/Context;ILjava/lang/String;)V

    .line 385
    return-void
.end method

.method private copyFromPackage(Landroid/content/Context;ILjava/lang/String;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ressourceId"    # I
    .param p3, "target"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 396
    invoke-virtual {p1, p3, v5}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v2

    .line 397
    .local v2, "lOutputStream":Ljava/io/FileOutputStream;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, p2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1

    .line 399
    .local v1, "lInputStream":Ljava/io/InputStream;
    const/16 v4, 0x1f70

    new-array v0, v4, [B

    .line 400
    .local v0, "buff":[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "readByte":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 401
    invoke-virtual {v2, v0, v5, v3}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 403
    :cond_0
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 404
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 405
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 406
    return-void
.end method

.method private copyIfNotExist(Landroid/content/Context;ILjava/lang/String;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ressourceId"    # I
    .param p3, "target"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 388
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 389
    .local v0, "lFileToCopy":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 390
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, p2, v1}, Lorg/linphone/LinphoneService;->copyFromPackage(Landroid/content/Context;ILjava/lang/String;)V

    .line 392
    :cond_0
    return-void
.end method

.method private destroyBluetoothProfileProxy()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 1333
    const/16 v0, 0xb

    :try_start_0
    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1334
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    const/4 v1, 0x1

    iget-object v2, p0, Lorg/linphone/LinphoneService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v0, v1, v2}, Landroid/bluetooth/BluetoothAdapter;->closeProfileProxy(ILandroid/bluetooth/BluetoothProfile;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1337
    :cond_0
    :goto_0
    return-void

    .line 1335
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private enableDisableAudioCodec(Ljava/lang/String;II)V
    .locals 5
    .param p1, "codec"    # Ljava/lang/String;
    .param p2, "rate"    # I
    .param p3, "key"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 963
    iget-object v2, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v2, p1, p2}, Lorg/linphone/core/LinphoneCore;->findPayloadType(Ljava/lang/String;I)Lorg/linphone/core/PayloadType;

    move-result-object v1

    .line 964
    .local v1, "pt":Lorg/linphone/core/PayloadType;
    if-eqz v1, :cond_1

    .line 965
    iget-object v2, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    invoke-virtual {p0, p3}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 967
    .local v0, "enable":Z
    const-string/jumbo v2, "PCMU"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 968
    iget-object v2, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    invoke-virtual {p0, p3}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 974
    :cond_0
    iget-object v2, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v2, v1, v0}, Lorg/linphone/core/LinphoneCore;->enablePayloadType(Lorg/linphone/core/PayloadType;Z)V

    .line 976
    .end local v0    # "enable":Z
    :cond_1
    return-void
.end method

.method private enableDisableAudioCodec(Ljava/lang/String;IZ)V
    .locals 2
    .param p1, "codec"    # Ljava/lang/String;
    .param p2, "rate"    # I
    .param p3, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 980
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v1, p1, p2}, Lorg/linphone/core/LinphoneCore;->findPayloadType(Ljava/lang/String;I)Lorg/linphone/core/PayloadType;

    move-result-object v0

    .line 981
    .local v0, "pt":Lorg/linphone/core/PayloadType;
    if-eqz v0, :cond_0

    .line 982
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v1, v0, p3}, Lorg/linphone/core/LinphoneCore;->enablePayloadType(Lorg/linphone/core/PayloadType;Z)V

    .line 984
    :cond_0
    return-void
.end method

.method private enableDisableAudioCodec(Ljava/lang/String;Z)V
    .locals 2
    .param p1, "codec"    # Ljava/lang/String;
    .param p2, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 988
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v1, p1}, Lorg/linphone/core/LinphoneCore;->findPayloadType(Ljava/lang/String;)Lorg/linphone/core/PayloadType;

    move-result-object v0

    .line 989
    .local v0, "pt":Lorg/linphone/core/PayloadType;
    if-eqz v0, :cond_0

    .line 990
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v1, v0, p2}, Lorg/linphone/core/LinphoneCore;->enablePayloadType(Lorg/linphone/core/PayloadType;Z)V

    .line 992
    :cond_0
    return-void
.end method

.method private enableDisableVideoCodecs(Lorg/linphone/core/PayloadType;)V
    .locals 4
    .param p1, "videoCodec"    # Lorg/linphone/core/PayloadType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 1019
    invoke-interface {p1}, Lorg/linphone/core/PayloadType;->getMime()Ljava/lang/String;

    move-result-object v1

    .line 1033
    .local v1, "mime":Ljava/lang/String;
    const/4 v0, 0x0

    .line 1035
    .local v0, "enable":Z
    const-string/jumbo v2, "MP4V-ES"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1036
    const/4 v0, 0x1

    .line 1050
    :goto_0
    iget-object v2, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v2, p1, v0}, Lorg/linphone/core/LinphoneCore;->enablePayloadType(Lorg/linphone/core/PayloadType;Z)V

    .line 1051
    :goto_1
    return-void

    .line 1037
    :cond_0
    const-string/jumbo v2, "H264"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1038
    const/4 v0, 0x1

    goto :goto_0

    .line 1039
    :cond_1
    const-string/jumbo v2, "H263-1998"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1040
    const/4 v0, 0x0

    goto :goto_0

    .line 1041
    :cond_2
    const-string/jumbo v2, "H263"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1042
    const/4 v0, 0x0

    goto :goto_0

    .line 1046
    :cond_3
    iget-object v2, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v3, 0x0

    invoke-interface {v2, p1, v3}, Lorg/linphone/core/LinphoneCore;->enablePayloadType(Lorg/linphone/core/PayloadType;Z)V

    goto :goto_1
.end method

.method private enterIncallMode(Lorg/linphone/core/LinphoneCore;)V
    .locals 3
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 930
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v1, :cond_0

    .line 931
    const-string/jumbo v1, "power"

    invoke-virtual {p0, v1}, Lorg/linphone/LinphoneService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 932
    .local v0, "pm":Landroid/os/PowerManager;
    const v1, 0x10000006

    const-string/jumbo v2, "Linphone"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lorg/linphone/LinphoneService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 935
    .end local v0    # "pm":Landroid/os/PowerManager;
    :cond_0
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/linphone/LinphoneService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-nez v1, :cond_1

    .line 936
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 939
    :cond_1
    return-void
.end method

.method private exitCallMode()V
    .locals 1

    .prologue
    .line 942
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/linphone/LinphoneService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 943
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 953
    :cond_0
    return-void
.end method

.method public static getLc()Lorg/linphone/core/LinphoneCore;
    .locals 2

    .prologue
    .line 1428
    invoke-static {}, Lorg/linphone/LinphoneService;->instanceOrNull()Lorg/linphone/LinphoneService;

    move-result-object v0

    .line 1429
    .local v0, "ls":Lorg/linphone/LinphoneService;
    if-eqz v0, :cond_0

    .line 1430
    invoke-static {}, Lorg/linphone/LinphoneService;->instanceOrNull()Lorg/linphone/LinphoneService;

    move-result-object v1

    invoke-virtual {v1}, Lorg/linphone/LinphoneService;->getLinphoneCore()Lorg/linphone/core/LinphoneCore;

    move-result-object v1

    .line 1432
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getSimpleListeners(Ljava/lang/Class;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 1687
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1688
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    sget-object v2, Lorg/linphone/LinphoneService;->simpleListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/LinphoneSimpleListener;

    .line 1689
    .local v0, "l":Lorg/linphone/LinphoneSimpleListener;
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1690
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1692
    .end local v0    # "l":Lorg/linphone/LinphoneSimpleListener;
    :cond_1
    return-object v1
.end method

.method public static instance()Lorg/linphone/LinphoneService;
    .locals 2

    .prologue
    .line 174
    sget-object v0, Lorg/linphone/LinphoneService;->theLinphone:Lorg/linphone/LinphoneService;

    if-nez v0, :cond_0

    .line 175
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "LinphoneService not instanciated yet"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    :cond_0
    sget-object v0, Lorg/linphone/LinphoneService;->theLinphone:Lorg/linphone/LinphoneService;

    return-object v0
.end method

.method public static instanceOrNull()Lorg/linphone/LinphoneService;
    .locals 1

    .prologue
    .line 182
    sget-object v0, Lorg/linphone/LinphoneService;->theLinphone:Lorg/linphone/LinphoneService;

    if-nez v0, :cond_0

    .line 185
    const/4 v0, 0x0

    .line 187
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/linphone/LinphoneService;->theLinphone:Lorg/linphone/LinphoneService;

    goto :goto_0
.end method

.method public static isready()Z
    .locals 1

    .prologue
    .line 170
    sget-object v0, Lorg/linphone/LinphoneService;->theLinphone:Lorg/linphone/LinphoneService;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static makeNotification(Landroid/content/Context;IILjava/lang/String;)V
    .locals 11
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "type"    # I
    .param p2, "level"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    const v10, 0x7f07006a

    const/16 v9, 0x10

    const/4 v8, 0x0

    .line 1551
    const-string/jumbo v5, "notification"

    .line 1552
    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    .line 1553
    .local v3, "notificationManager":Landroid/app/NotificationManager;
    const/4 v2, 0x0

    .line 1555
    .local v2, "notification":Landroid/app/Notification;
    if-nez p1, :cond_3

    .line 1557
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 1558
    .local v0, "builder":Landroid/app/Notification$Builder;
    const v5, 0x108007f

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 1559
    invoke-virtual {v0, v9}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 1560
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v5, "android.intent.action.VIEW"

    const/4 v6, 0x0

    invoke-direct {v1, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1561
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v5, "vnd.android.cursor.dir/calls"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1562
    invoke-static {p0, v8, v1, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 1563
    invoke-virtual {p0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 1564
    if-eqz p3, :cond_2

    invoke-static {p3}, Lorg/apache/commons/lang/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .end local p3    # "text":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0, p3}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 1565
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v9, :cond_0

    .line 1566
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    .line 1621
    .end local v0    # "builder":Landroid/app/Notification$Builder;
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_1
    if-eqz v2, :cond_1

    .line 1622
    invoke-virtual {v3, p1, v2}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 1627
    :cond_1
    return-void

    .line 1564
    .restart local v0    # "builder":Landroid/app/Notification$Builder;
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local p3    # "text":Ljava/lang/String;
    :cond_2
    const v5, 0x7f07022b

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    .line 1576
    .end local v0    # "builder":Landroid/app/Notification$Builder;
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_3
    const/4 v5, 0x1

    if-ne p1, v5, :cond_0

    .line 1578
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 1579
    .restart local v0    # "builder":Landroid/app/Notification$Builder;
    const v5, 0x7f02050e

    invoke-virtual {v0, v5, p2}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    .line 1580
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    .line 1581
    new-instance v1, Landroid/content/Intent;

    const-class v5, Lorg/linphone/LinphoneActivity;

    invoke-direct {v1, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1582
    .restart local v1    # "intent":Landroid/content/Intent;
    invoke-static {p0, v8, v1, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 1599
    move-object v4, p3

    .line 1601
    .local v4, "outText":Ljava/lang/String;
    if-nez v4, :cond_4

    .line 1602
    packed-switch p2, :pswitch_data_0

    .line 1607
    const v5, 0x7f0701f4

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1611
    :cond_4
    :goto_2
    invoke-virtual {v0, v4}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 1612
    invoke-virtual {p0, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 1613
    const/16 v5, 0x22

    invoke-virtual {v0, v5}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 1614
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v9, :cond_0

    .line 1615
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v2

    goto :goto_1

    .line 1604
    :pswitch_0
    const v5, 0x7f0701f5

    invoke-virtual {p0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 1605
    goto :goto_2

    .line 1602
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private manageTunnelServer()V
    .locals 14

    .prologue
    const v13, 0x7f07026b

    const v12, 0x7f070269

    const/4 v11, 0x0

    const/16 v10, 0x3e8

    .line 1055
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    if-nez v7, :cond_0

    .line 1122
    :goto_0
    return-void

    .line 1063
    :cond_0
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    const v8, 0x7f070273

    invoke-virtual {p0, v8}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const v9, 0x7f070274

    .line 1064
    invoke-virtual {p0, v9}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1063
    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1065
    .local v6, "prefMode":Ljava/lang/String;
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    const v8, 0x7f070267

    invoke-virtual {p0, v8}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 1066
    .local v5, "prefEnabled":Z
    const v7, 0x7f070274

    invoke-virtual {p0, v7}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    if-nez v5, :cond_2

    :cond_1
    const v7, 0x7f070271

    .line 1067
    invoke-virtual {p0, v7}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1068
    :cond_2
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v7}, Lorg/linphone/core/LinphoneCore;->tunnelCleanServers()V

    .line 1069
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    invoke-virtual {p0, v12}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1070
    .local v1, "host1":Ljava/lang/String;
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    invoke-virtual {p0, v13}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1073
    .local v2, "host2":Ljava/lang/String;
    :try_start_0
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    const v8, 0x7f070277

    invoke-virtual {p0, v8}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "443"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 1079
    .local v4, "port":I
    :goto_1
    :try_start_1
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    const v8, 0x7f070260

    .line 1080
    invoke-virtual {p0, v8}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "25060"

    .line 1079
    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v3

    .line 1085
    .local v3, "mirrorPort":I
    :goto_2
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v7, v1, v4, v3, v10}, Lorg/linphone/core/LinphoneCore;->tunnelAddServerAndMirror(Ljava/lang/String;III)V

    .line 1086
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v7, v2, v4, v3, v10}, Lorg/linphone/core/LinphoneCore;->tunnelAddServerAndMirror(Ljava/lang/String;III)V

    .line 1087
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v7}, Lorg/linphone/core/LinphoneCore;->tunnelAutoDetect()V

    goto/16 :goto_0

    .line 1075
    .end local v3    # "mirrorPort":I
    .end local v4    # "port":I
    :catch_0
    move-exception v0

    .line 1076
    .local v0, "e":Ljava/lang/Exception;
    const/16 v4, 0x1bb

    .restart local v4    # "port":I
    goto :goto_1

    .line 1081
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 1082
    .restart local v0    # "e":Ljava/lang/Exception;
    const/16 v3, 0x61e4

    .restart local v3    # "mirrorPort":I
    goto :goto_2

    .line 1091
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "host1":Ljava/lang/String;
    .end local v2    # "host2":Ljava/lang/String;
    .end local v3    # "mirrorPort":I
    .end local v4    # "port":I
    :cond_3
    const v7, 0x7f07026f

    invoke-virtual {p0, v7}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1092
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v7}, Lorg/linphone/core/LinphoneCore;->tunnelCleanServers()V

    .line 1094
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    invoke-virtual {p0, v12}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1095
    .restart local v1    # "host1":Ljava/lang/String;
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    invoke-virtual {p0, v13}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1098
    .restart local v2    # "host2":Ljava/lang/String;
    :try_start_2
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    const v8, 0x7f070277

    invoke-virtual {p0, v8}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "443"

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result v4

    .line 1104
    .restart local v4    # "port":I
    :goto_3
    :try_start_3
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    const v8, 0x7f070260

    .line 1105
    invoke-virtual {p0, v8}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "25060"

    .line 1104
    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    move-result v3

    .line 1110
    .restart local v3    # "mirrorPort":I
    :goto_4
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v7, v1, v4, v3, v10}, Lorg/linphone/core/LinphoneCore;->tunnelAddServerAndMirror(Ljava/lang/String;III)V

    .line 1111
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v7, v2, v4, v3, v10}, Lorg/linphone/core/LinphoneCore;->tunnelAddServerAndMirror(Ljava/lang/String;III)V

    .line 1112
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v8, 0x1

    invoke-interface {v7, v8}, Lorg/linphone/core/LinphoneCore;->tunnelEnable(Z)V

    goto/16 :goto_0

    .line 1100
    .end local v3    # "mirrorPort":I
    .end local v4    # "port":I
    :catch_2
    move-exception v0

    .line 1101
    .restart local v0    # "e":Ljava/lang/Exception;
    const/16 v4, 0x1bb

    .restart local v4    # "port":I
    goto :goto_3

    .line 1106
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v0

    .line 1107
    .restart local v0    # "e":Ljava/lang/Exception;
    const/16 v3, 0x61e4

    .restart local v3    # "mirrorPort":I
    goto :goto_4

    .line 1118
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "host1":Ljava/lang/String;
    .end local v2    # "host2":Ljava/lang/String;
    .end local v3    # "mirrorPort":I
    .end local v4    # "port":I
    :cond_4
    iget-object v7, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v7, v11}, Lorg/linphone/core/LinphoneCore;->tunnelEnable(Z)V

    goto/16 :goto_0
.end method

.method private routeAudioToSpeakerHelper(Z)V
    .locals 3
    .param p1, "speakerOn"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1697
    iput-boolean v2, p0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    .line 1698
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v1, :cond_0

    .line 1701
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 1704
    :cond_0
    if-nez p1, :cond_1

    .line 1705
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v1, v2}, Lorg/linphone/core/LinphoneCore;->enableSpeaker(Z)V

    .line 1710
    :goto_0
    const-class v1, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;

    invoke-direct {p0, v1}, Lorg/linphone/LinphoneService;->getSimpleListeners(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;

    .line 1711
    .local v0, "listener":Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;
    if-eqz p1, :cond_2

    sget-object v1, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->SPEAKER:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    :goto_2
    invoke-interface {v0, v1}, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;->onAudioStateChanged(Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;)V

    goto :goto_1

    .line 1707
    .end local v0    # "listener":Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;
    :cond_1
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lorg/linphone/core/LinphoneCore;->enableSpeaker(Z)V

    goto :goto_0

    .line 1711
    .restart local v0    # "listener":Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;
    :cond_2
    sget-object v1, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->EARPIECE:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    goto :goto_2

    .line 1713
    .end local v0    # "listener":Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;
    :cond_3
    return-void
.end method

.method private declared-synchronized startRinging()V
    .locals 4

    .prologue
    .line 1438
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->shouldVibrate(I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/linphone/LinphoneService;->mVibrator:Landroid/os/Vibrator;

    if-eqz v1, :cond_0

    .line 1439
    const/4 v1, 0x3

    new-array v0, v1, [J

    fill-array-data v0, :array_0

    .line 1442
    .local v0, "patern":[J
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mVibrator:Landroid/os/Vibrator;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Landroid/os/Vibrator;->vibrate([JI)V

    .line 1444
    .end local v0    # "patern":[J
    :cond_0
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    if-nez v1, :cond_1

    .line 1445
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v1, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    .line 1446
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 1447
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x1

    .line 1448
    invoke-static {v3}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v3

    .line 1447
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 1449
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V

    .line 1450
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 1451
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1460
    :cond_1
    :goto_0
    const/4 v1, 0x1

    :try_start_1
    iput-boolean v1, p0, Lorg/linphone/LinphoneService;->isRinging:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1461
    monitor-exit p0

    return-void

    .line 1438
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1456
    :catch_0
    move-exception v1

    goto :goto_0

    .line 1439
    nop

    :array_0
    .array-data 8
        0x0
        0x3e8
        0x3e8
    .end array-data
.end method

.method private declared-synchronized stopRinging()V
    .locals 1

    .prologue
    .line 1464
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 1465
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 1466
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 1467
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mRingerPlayer:Landroid/media/MediaPlayer;

    .line 1472
    :cond_0
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mVibrator:Landroid/os/Vibrator;

    if-eqz v0, :cond_1

    .line 1473
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mVibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    .line 1477
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/LinphoneService;->isRinging:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1478
    monitor-exit p0

    return-void

    .line 1464
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public adjustSoftwareVolume(I)V
    .locals 6
    .param p1, "i"    # I

    .prologue
    const/4 v4, 0x0

    .line 785
    iget-object v3, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v3, v4}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    .line 786
    .local v2, "oldVolume":I
    iget-object v3, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v3, v4}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    .line 788
    .local v0, "maxVolume":I
    add-int v1, v2, p1

    .line 789
    .local v1, "nextVolume":I
    if-le v1, v0, :cond_0

    .line 790
    move v1, v0

    .line 791
    :cond_0
    if-gez v1, :cond_1

    .line 792
    const/4 v1, 0x0

    .line 794
    :cond_1
    const-string/jumbo v3, "PCCW_MOBILE_SIP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "jam:adjustSoftwareVolume to"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 795
    iget-object v3, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    sub-int v4, v1, v0

    mul-int/lit8 v4, v4, 0x4

    invoke-interface {v3, v4}, Lorg/linphone/core/LinphoneCore;->adjustSoftwareVolume(I)V

    .line 796
    return-void
.end method

.method public authInfoRequested(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "realm"    # Ljava/lang/String;
    .param p3, "username"    # Ljava/lang/String;

    .prologue
    .line 410
    return-void
.end method

.method public authInfoRequested(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "realm"    # Ljava/lang/String;
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "domain"    # Ljava/lang/String;

    .prologue
    .line 1368
    return-void
.end method

.method public authenticationRequested(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneAuthInfo;Lorg/linphone/core/LinphoneCore$AuthMethod;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "authInfo"    # Lorg/linphone/core/LinphoneAuthInfo;
    .param p3, "method"    # Lorg/linphone/core/LinphoneCore$AuthMethod;

    .prologue
    .line 1373
    return-void
.end method

.method public byeReceived(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "from"    # Ljava/lang/String;

    .prologue
    .line 415
    return-void
.end method

.method public callEncryptionChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;ZLjava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "encrypted"    # Z
    .param p4, "authenticationToken"    # Ljava/lang/String;

    .prologue
    .line 772
    return-void
.end method

.method public callState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;)V
    .locals 12
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCall$State;
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    .line 589
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-eq p3, v0, :cond_0

    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->OutgoingInit:Lorg/linphone/core/LinphoneCall$State;

    if-ne p3, v0, :cond_1

    .line 591
    :cond_0
    invoke-static {}, Lorg/linphone/BandwidthManager;->isRoamSaveVideoEnable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 594
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->getRearCameraOrientation()I

    move-result v9

    .line 598
    .local v9, "rearCameraOrientation":I
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    .line 599
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->getPhoneNumber(Lorg/linphone/core/LinphoneCall;)Ljava/lang/String;

    move-result-object v0

    .line 598
    invoke-static {v0}, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldUseOrientationMode(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    .line 602
    add-int/lit8 v0, v9, -0x5a

    rem-int/lit16 v0, v0, 0x168

    invoke-interface {p1, v0}, Lorg/linphone/core/LinphoneCore;->setDeviceRotation(I)V

    .line 612
    .end local v9    # "rearCameraOrientation":I
    :cond_1
    :goto_0
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->CallUpdatedByRemote:Lorg/linphone/core/LinphoneCall$State;

    if-ne p3, v0, :cond_2

    .line 613
    invoke-static {}, Lorg/linphone/BandwidthManager;->isRoamSaveVideoEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 615
    invoke-interface {p2}, Lorg/linphone/core/LinphoneCall;->getRemoteParams()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v10

    .line 616
    .local v10, "remoteVideo":Z
    invoke-interface {p2}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v8

    .line 620
    .local v8, "localVideo":Z
    if-eqz v10, :cond_2

    if-nez v8, :cond_2

    .line 622
    :try_start_0
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    invoke-interface {v0, p2}, Lorg/linphone/core/LinphoneCore;->deferCallUpdate(Lorg/linphone/core/LinphoneCall;)V
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 629
    .end local v8    # "localVideo":Z
    .end local v10    # "remoteVideo":Z
    :cond_2
    :goto_1
    iget-object v11, p0, Lorg/linphone/LinphoneService;->mHandler:Landroid/os/Handler;

    new-instance v0, Lorg/linphone/LinphoneService$5;

    move-object v1, p0

    move-object v2, p3

    move-object/from16 v3, p4

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/linphone/LinphoneService$5;-><init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCall$State;Ljava/lang/String;Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;)V

    invoke-virtual {v11, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 736
    sget-object v0, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne p3, v0, :cond_7

    .line 737
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_6

    .line 738
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 739
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 740
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 742
    sget-object v0, Lorg/linphone/core/Reason;->Busy:Lorg/linphone/core/Reason;

    invoke-interface {p1, p2, v0}, Lorg/linphone/core/LinphoneCore;->declineCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/Reason;)V

    .line 760
    :cond_3
    :goto_2
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mCurrentCallState:Lorg/linphone/core/LinphoneCall$State;

    sget-object v1, Lorg/linphone/core/LinphoneCall$State;->IncomingReceived:Lorg/linphone/core/LinphoneCall$State;

    if-ne v0, v1, :cond_4

    .line 762
    invoke-direct {p0}, Lorg/linphone/LinphoneService;->stopRinging()V

    .line 765
    :cond_4
    iput-object p3, p0, Lorg/linphone/LinphoneService;->mCurrentCallState:Lorg/linphone/core/LinphoneCall$State;

    .line 767
    return-void

    .line 606
    .restart local v9    # "rearCameraOrientation":I
    :cond_5
    rem-int/lit16 v0, v9, 0x168

    invoke-interface {p1, v0}, Lorg/linphone/core/LinphoneCore;->setDeviceRotation(I)V

    goto :goto_0

    .line 624
    .end local v9    # "rearCameraOrientation":I
    .restart local v8    # "localVideo":Z
    .restart local v10    # "remoteVideo":Z
    :catch_0
    move-exception v6

    .line 625
    .local v6, "e":Lorg/linphone/core/LinphoneCoreException;
    invoke-virtual {v6}, Lorg/linphone/core/LinphoneCoreException;->printStackTrace()V

    goto :goto_1

    .line 745
    .end local v6    # "e":Lorg/linphone/core/LinphoneCoreException;
    .end local v8    # "localVideo":Z
    .end local v10    # "remoteVideo":Z
    :cond_6
    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    .line 746
    .local v7, "lIntent":Landroid/content/Intent;
    const/high16 v0, 0x10000000

    invoke-virtual {v7, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 749
    const-class v0, Lorg/linphone/InCallScreen;

    invoke-virtual {v7, p0, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 751
    invoke-virtual {p0, v7}, Lorg/linphone/LinphoneService;->startActivity(Landroid/content/Intent;)V

    .line 752
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getCallsNb()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 753
    iput-object p2, p0, Lorg/linphone/LinphoneService;->ringingCall:Lorg/linphone/core/LinphoneCall;

    .line 754
    invoke-direct {p0}, Lorg/linphone/LinphoneService;->startRinging()V

    goto :goto_2

    .line 757
    .end local v7    # "lIntent":Landroid/content/Intent;
    :cond_7
    iget-object v0, p0, Lorg/linphone/LinphoneService;->ringingCall:Lorg/linphone/core/LinphoneCall;

    if-ne p2, v0, :cond_3

    iget-boolean v0, p0, Lorg/linphone/LinphoneService;->isRinging:Z

    if-eqz v0, :cond_3

    .line 758
    invoke-direct {p0}, Lorg/linphone/LinphoneService;->stopRinging()V

    goto :goto_2
.end method

.method public callStatsUpdated(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallStats;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "stats"    # Lorg/linphone/core/LinphoneCallStats;

    .prologue
    .line 1378
    return-void
.end method

.method public configuringStatus(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$RemoteProvisioningState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$RemoteProvisioningState;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 563
    return-void
.end method

.method public displayMessage(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 420
    return-void
.end method

.method public displayStatus(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 2
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 426
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 427
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/LinphoneService$2;

    invoke-direct {v1, p0, p1, p2}, Lorg/linphone/LinphoneService$2;-><init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 437
    :cond_0
    return-void
.end method

.method public displayWarning(Lorg/linphone/core/LinphoneCore;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 442
    return-void
.end method

.method public dtmfReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;I)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "dtmf"    # I

    .prologue
    .line 1393
    return-void
.end method

.method public ecCalibrationStatus(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;ILjava/lang/Object;)V
    .locals 3
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "status"    # Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;
    .param p3, "delay_ms"    # I
    .param p4, "data"    # Ljava/lang/Object;

    .prologue
    .line 1482
    move-object v0, p4

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 1484
    .local v0, "pref":Landroid/preference/CheckBoxPreference;
    if-nez v0, :cond_2

    .line 1485
    sget-object v1, Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;->Done:Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;

    if-ne p2, v1, :cond_1

    .line 1486
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mHandler:Landroid/os/Handler;

    new-instance v2, Lorg/linphone/LinphoneService$6;

    invoke-direct {v2, p0, p3}, Lorg/linphone/LinphoneService$6;-><init>(Lorg/linphone/LinphoneService;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1495
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/linphone/LinphoneService;->echoCalibrationDone:Z

    .line 1523
    :cond_0
    :goto_0
    return-void

    .line 1496
    :cond_1
    sget-object v1, Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;->Failed:Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;

    if-ne p2, v1, :cond_0

    .line 1497
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mHandler:Landroid/os/Handler;

    new-instance v2, Lorg/linphone/LinphoneService$7;

    invoke-direct {v2, p0}, Lorg/linphone/LinphoneService$7;-><init>(Lorg/linphone/LinphoneService;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 1511
    :cond_2
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mHandler:Landroid/os/Handler;

    new-instance v2, Lorg/linphone/LinphoneService$8;

    invoke-direct {v2, p0, p2, v0, p3}, Lorg/linphone/LinphoneService$8;-><init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;Landroid/preference/CheckBoxPreference;I)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public fileTransferProgressIndication(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatMessage;Lorg/linphone/core/LinphoneContent;I)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Lorg/linphone/core/LinphoneChatMessage;
    .param p3, "content"    # Lorg/linphone/core/LinphoneContent;
    .param p4, "progress"    # I

    .prologue
    .line 447
    return-void
.end method

.method public fileTransferRecv(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatMessage;Lorg/linphone/core/LinphoneContent;[BI)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Lorg/linphone/core/LinphoneChatMessage;
    .param p3, "content"    # Lorg/linphone/core/LinphoneContent;
    .param p4, "buffer"    # [B
    .param p5, "size"    # I

    .prologue
    .line 452
    return-void
.end method

.method public fileTransferSend(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatMessage;Lorg/linphone/core/LinphoneContent;Ljava/nio/ByteBuffer;I)I
    .locals 1
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "message"    # Lorg/linphone/core/LinphoneChatMessage;
    .param p3, "content"    # Lorg/linphone/core/LinphoneContent;
    .param p4, "buffer"    # Ljava/nio/ByteBuffer;
    .param p5, "size"    # I

    .prologue
    .line 456
    const/4 v0, 0x0

    return v0
.end method

.method public fixBluetoothMediaButton()V
    .locals 1

    .prologue
    .line 1906
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/LinphoneService;->isBluetoothScoStarted:Z

    .line 1907
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->routeAudioToBluetooth()Z

    .line 1908
    return-void
.end method

.method public friendListCreated(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriendList;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "list"    # Lorg/linphone/core/LinphoneFriendList;

    .prologue
    .line 1538
    return-void
.end method

.method public friendListRemoved(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriendList;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "list"    # Lorg/linphone/core/LinphoneFriendList;

    .prologue
    .line 1543
    return-void
.end method

.method public getLinphoneCore()Lorg/linphone/core/LinphoneCore;
    .locals 1

    .prologue
    .line 1322
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    return-object v0
.end method

.method public getRearCameraOrientation()I
    .locals 8

    .prologue
    const/16 v2, 0x5a

    const/4 v3, 0x0

    .line 1665
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;->retrieveCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-result-object v1

    .line 1666
    .local v1, "cameras":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    invoke-static {}, Lorg/linphone/core/Hacks;->isASUSPadFone2()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1668
    array-length v5, v1

    move v4, v3

    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v0, v1, v4

    .line 1669
    .local v0, "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    iget-boolean v6, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 1670
    iget v4, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->orientation:I

    const/16 v5, 0x10e

    if-ne v4, v5, :cond_1

    .line 1682
    .end local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_0
    :goto_1
    return v2

    .restart local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_1
    move v2, v3

    .line 1673
    goto :goto_1

    .line 1668
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1677
    .end local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_3
    array-length v4, v1

    :goto_2
    if-ge v3, v4, :cond_0

    aget-object v0, v1, v3

    .line 1678
    .restart local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    iget-boolean v5, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    if-nez v5, :cond_4

    .line 1679
    iget v2, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->orientation:I

    goto :goto_1

    .line 1677
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method public globalState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$GlobalState;Ljava/lang/String;)V
    .locals 2
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$GlobalState;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 463
    sget-object v0, Lorg/linphone/core/LinphoneCore$GlobalState;->GlobalOn:Lorg/linphone/core/LinphoneCore$GlobalState;

    if-ne p2, v0, :cond_1

    .line 475
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 476
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/linphone/LinphoneService$3;

    invoke-direct {v1, p0, p1, p2, p3}, Lorg/linphone/LinphoneService$3;-><init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$GlobalState;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 488
    :cond_0
    :goto_0
    return-void

    .line 485
    :cond_1
    sget-object v0, Lorg/linphone/core/LinphoneCore$GlobalState;->GlobalOff:Lorg/linphone/core/LinphoneCore$GlobalState;

    if-ne p2, v0, :cond_0

    .line 486
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    goto :goto_0
.end method

.method public infoReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneInfoMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "info"    # Lorg/linphone/core/LinphoneInfoMessage;

    .prologue
    .line 1408
    return-void
.end method

.method public initFromConf()V
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/LinphoneConfigException;,
            Lorg/linphone/LinphoneException;
        }
    .end annotation

    .prologue
    .line 1130
    invoke-direct/range {p0 .. p0}, Lorg/linphone/LinphoneService;->manageTunnelServer()V

    .line 1134
    const/4 v13, 0x0

    .line 1135
    .local v13, "lIsDebug":Z
    invoke-static {}, Lorg/linphone/core/LinphoneCoreFactory;->instance()Lorg/linphone/core/LinphoneCoreFactory;

    move-result-object v21

    const-string/jumbo v22, "LinphoneDebug"

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v13, v1}, Lorg/linphone/core/LinphoneCoreFactory;->setDebugMode(ZLjava/lang/String;)V

    .line 1141
    :try_start_0
    const-string/jumbo v21, "AMR"

    const/16 v22, 0x1f40

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1143
    const-string/jumbo v21, "speex"

    const/16 v22, 0x7d00

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1144
    const-string/jumbo v21, "speex"

    const/16 v22, 0x3e80

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1145
    const-string/jumbo v21, "speex"

    const/16 v22, 0x1f40

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1146
    const-string/jumbo v21, "iLBC"

    const/16 v22, 0x1f40

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1147
    const-string/jumbo v21, "GSM"

    const/16 v22, 0x1f40

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1148
    const-string/jumbo v21, "PCMU"

    const/16 v22, 0x1f40

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1149
    const-string/jumbo v21, "PCMA"

    const/16 v22, 0x1f40

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1150
    const-string/jumbo v21, "AMR-WB"

    const/16 v22, 0x3e80

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1151
    const-string/jumbo v21, "SILK"

    const/16 v22, 0x5dc0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1152
    const-string/jumbo v21, "SILK"

    const/16 v22, 0x3e80

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1153
    const-string/jumbo v21, "SILK"

    const/16 v22, 0x2ee0

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1154
    const-string/jumbo v21, "SILK"

    const/16 v22, 0x1f40

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;IZ)V

    .line 1155
    const-string/jumbo v21, "opus"

    const/16 v22, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/linphone/LinphoneService;->enableDisableAudioCodec(Ljava/lang/String;Z)V

    .line 1175
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Lorg/linphone/core/LinphoneCore;->getVideoCodecs()[Lorg/linphone/core/PayloadType;

    move-result-object v22

    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v23, v0

    const/16 v21, 0x0

    :goto_0
    move/from16 v0, v21

    move/from16 v1, v23

    if-ge v0, v1, :cond_0

    aget-object v20, v22, v21

    .line 1176
    .local v20, "videoCodec":Lorg/linphone/core/PayloadType;
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/linphone/LinphoneService;->enableDisableVideoCodecs(Lorg/linphone/core/PayloadType;)V

    .line 1175
    add-int/lit8 v21, v21, 0x1

    goto :goto_0

    .line 1178
    .end local v20    # "videoCodec":Lorg/linphone/core/PayloadType;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f07025e

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    sget-object v23, Lorg/linphone/OutgoingCallReceiver;->key_on_demand:Ljava/lang/String;

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    sget-object v22, Lorg/linphone/OutgoingCallReceiver;->key_off:Ljava/lang/String;

    .line 1179
    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_4

    .line 1181
    new-instance v10, Landroid/content/IntentFilter;

    const-string/jumbo v21, "android.intent.action.SCREEN_ON"

    move-object/from16 v0, v21

    invoke-direct {v10, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 1182
    .local v10, "lFilter":Landroid/content/IntentFilter;
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Landroid/content/IntentFilter;->setPriority(I)V

    .line 1183
    const-string/jumbo v21, "android.intent.action.NEW_OUTGOING_CALL"

    move-object/from16 v0, v21

    invoke-virtual {v10, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1184
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v21, v0

    if-nez v21, :cond_1

    .line 1185
    new-instance v21, Lorg/linphone/OutgoingCallReceiver;

    invoke-direct/range {v21 .. v21}, Lorg/linphone/OutgoingCallReceiver;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

    .line 1187
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v10}, Lorg/linphone/LinphoneService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1194
    .end local v10    # "lFilter":Landroid/content/IntentFilter;
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-interface/range {v21 .. v22}, Lorg/linphone/core/LinphoneCore;->enableEchoCancellation(Z)V
    :try_end_0
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1201
    const/4 v5, 0x1

    .line 1202
    .local v5, "isVideoEnabled":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v0, v5, v5}, Lorg/linphone/core/LinphoneCore;->enableVideo(ZZ)V

    .line 1204
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f070279

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 1205
    .local v19, "lUserName":Ljava/lang/String;
    if-eqz v19, :cond_3

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v21

    if-nez v21, :cond_5

    .line 1206
    :cond_3
    new-instance v21, Lorg/linphone/LinphoneConfigException;

    const v22, 0x7f07028a

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lorg/linphone/LinphoneConfigException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 1188
    .end local v5    # "isVideoEnabled":Z
    .end local v19    # "lUserName":Ljava/lang/String;
    :cond_4
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v21, v0

    if-eqz v21, :cond_2

    .line 1189
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1190
    const/16 v21, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;
    :try_end_1
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 1196
    :catch_0
    move-exception v4

    .line 1197
    .local v4, "e":Lorg/linphone/core/LinphoneCoreException;
    new-instance v21, Lorg/linphone/LinphoneConfigException;

    const v22, 0x7f070289

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v4}, Lorg/linphone/LinphoneConfigException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 1209
    .end local v4    # "e":Lorg/linphone/core/LinphoneCoreException;
    .restart local v5    # "isVideoEnabled":Z
    .restart local v19    # "lUserName":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f070261

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1210
    .local v14, "lPasswd":Ljava/lang/String;
    if-eqz v14, :cond_6

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v21

    if-nez v21, :cond_7

    .line 1211
    :cond_6
    new-instance v21, Lorg/linphone/LinphoneConfigException;

    const v22, 0x7f070288

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lorg/linphone/LinphoneConfigException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 1214
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f070259

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1215
    .local v9, "lDomain":Ljava/lang/String;
    if-eqz v9, :cond_8

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v21

    if-nez v21, :cond_9

    .line 1216
    :cond_8
    new-instance v21, Lorg/linphone/LinphoneConfigException;

    const v22, 0x7f070287

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lorg/linphone/LinphoneConfigException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 1219
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f070264

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 1222
    .local v17, "lStun":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setStunServer(Ljava/lang/String;)V

    .line 1223
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v22, v0

    if-eqz v17, :cond_f

    .line 1224
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v21

    if-lez v21, :cond_f

    sget-object v21, Lorg/linphone/core/LinphoneCore$FirewallPolicy;->UseStun:Lorg/linphone/core/LinphoneCore$FirewallPolicy;

    :goto_2
    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setFirewallPolicy(Lorg/linphone/core/LinphoneCore$FirewallPolicy;)V

    .line 1232
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f070278

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 1236
    .local v18, "lUserId":Ljava/lang/String;
    invoke-static {}, Lorg/linphone/core/LinphoneCoreFactory;->instance()Lorg/linphone/core/LinphoneCoreFactory;

    move-result-object v21

    const/16 v22, 0x0

    const/16 v23, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-virtual {v0, v1, v14, v2, v3}, Lorg/linphone/core/LinphoneCoreFactory;->createAuthInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/LinphoneAuthInfo;

    move-result-object v6

    .line 1237
    .local v6, "lAuthInfo":Lorg/linphone/core/LinphoneAuthInfo;
    move-object/from16 v0, v18

    invoke-interface {v6, v0}, Lorg/linphone/core/LinphoneAuthInfo;->setUserId(Ljava/lang/String;)V

    .line 1239
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v0, v6}, Lorg/linphone/core/LinphoneCore;->addAuthInfo(Lorg/linphone/core/LinphoneAuthInfo;)V

    .line 1243
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f070263

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1244
    .local v16, "lProxy":Ljava/lang/String;
    if-eqz v16, :cond_a

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v21

    if-nez v21, :cond_b

    .line 1245
    :cond_a
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v22, "sip:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 1247
    :cond_b
    const-string/jumbo v21, "sip:"

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v21

    if-nez v21, :cond_c

    .line 1248
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v22, "sip:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 1251
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v8

    .line 1252
    .local v8, "lDefaultProxyConfig":Lorg/linphone/core/LinphoneProxyConfig;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v22, "sip:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, "@"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1254
    .local v11, "lIdentity":Ljava/lang/String;
    if-nez v8, :cond_10

    .line 1257
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x1

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    move-object/from16 v2, v22

    move/from16 v3, v23

    invoke-interface {v0, v11, v1, v2, v3}, Lorg/linphone/core/LinphoneCore;->createProxyConfig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v8

    .line 1260
    const/16 v21, 0xe10

    move/from16 v0, v21

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneProxyConfig;->setExpires(I)V

    .line 1262
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v0, v8}, Lorg/linphone/core/LinphoneCore;->addProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V

    .line 1263
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-interface {v0, v8}, Lorg/linphone/core/LinphoneCore;->setDefaultProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V

    .line 1272
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v8

    .line 1274
    if-eqz v8, :cond_e

    .line 1276
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f070262

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 1277
    .local v15, "lPrefix":Ljava/lang/String;
    if-eqz v15, :cond_d

    .line 1278
    invoke-interface {v8, v15}, Lorg/linphone/core/LinphoneProxyConfig;->setDialPrefix(Ljava/lang/String;)V

    .line 1281
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f07025d

    .line 1282
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x0

    .line 1281
    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v21

    move/from16 v0, v21

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneProxyConfig;->setDialEscapePlus(Z)V

    .line 1288
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    move-object/from16 v21, v0

    const v22, 0x7f07025c

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x1

    invoke-interface/range {v21 .. v23}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v21

    if-eqz v21, :cond_11

    .line 1290
    move-object/from16 v0, v16

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneProxyConfig;->setRoute(Ljava/lang/String;)V

    .line 1298
    .end local v15    # "lPrefix":Ljava/lang/String;
    :cond_e
    :goto_4
    const-string/jumbo v21, "connectivity"

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/net/ConnectivityManager;

    .line 1299
    .local v7, "lConnectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v7}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v12

    .line 1304
    .local v12, "lInfo":Landroid/net/NetworkInfo;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v22, v0

    if-eqz v12, :cond_13

    .line 1305
    invoke-virtual {v7}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v21

    sget-object v23, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_12

    const/16 v21, 0x1

    .line 1304
    :goto_5
    move-object/from16 v0, v22

    move/from16 v1, v21

    invoke-interface {v0, v1}, Lorg/linphone/core/LinphoneCore;->setNetworkReachable(Z)V
    :try_end_2
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_2 .. :try_end_2} :catch_1

    .line 1312
    invoke-virtual/range {p0 .. p0}, Lorg/linphone/LinphoneService;->getApplicationContext()Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lcom/pccw/mobile/sip/ClientStateManager;->isPrepaid(Landroid/content/Context;)Z

    move-result v21

    if-eqz v21, :cond_14

    .line 1313
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-interface/range {v21 .. v22}, Lorg/linphone/core/LinphoneCore;->setMaxCalls(I)V

    .line 1318
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    sget-object v22, Lorg/linphone/core/ToneID;->CallWaiting:Lorg/linphone/core/ToneID;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->callWaitingToneSoundFile:Ljava/lang/String;

    move-object/from16 v23, v0

    invoke-interface/range {v21 .. v23}, Lorg/linphone/core/LinphoneCore;->setTone(Lorg/linphone/core/ToneID;Ljava/lang/String;)V

    .line 1319
    return-void

    .line 1224
    .end local v6    # "lAuthInfo":Lorg/linphone/core/LinphoneAuthInfo;
    .end local v7    # "lConnectivityManager":Landroid/net/ConnectivityManager;
    .end local v8    # "lDefaultProxyConfig":Lorg/linphone/core/LinphoneProxyConfig;
    .end local v11    # "lIdentity":Ljava/lang/String;
    .end local v12    # "lInfo":Landroid/net/NetworkInfo;
    .end local v16    # "lProxy":Ljava/lang/String;
    .end local v18    # "lUserId":Ljava/lang/String;
    :cond_f
    sget-object v21, Lorg/linphone/core/LinphoneCore$FirewallPolicy;->NoFirewall:Lorg/linphone/core/LinphoneCore$FirewallPolicy;

    goto/16 :goto_2

    .line 1266
    .restart local v6    # "lAuthInfo":Lorg/linphone/core/LinphoneAuthInfo;
    .restart local v8    # "lDefaultProxyConfig":Lorg/linphone/core/LinphoneProxyConfig;
    .restart local v11    # "lIdentity":Ljava/lang/String;
    .restart local v16    # "lProxy":Ljava/lang/String;
    .restart local v18    # "lUserId":Ljava/lang/String;
    :cond_10
    :try_start_3
    invoke-interface {v8}, Lorg/linphone/core/LinphoneProxyConfig;->edit()Lorg/linphone/core/LinphoneProxyConfig;

    .line 1267
    invoke-interface {v8, v11}, Lorg/linphone/core/LinphoneProxyConfig;->setIdentity(Ljava/lang/String;)V

    .line 1268
    move-object/from16 v0, v16

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneProxyConfig;->setProxy(Ljava/lang/String;)V

    .line 1269
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneProxyConfig;->enableRegister(Z)Lorg/linphone/core/LinphoneProxyConfig;

    .line 1270
    invoke-interface {v8}, Lorg/linphone/core/LinphoneProxyConfig;->done()V
    :try_end_3
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_3

    .line 1307
    :catch_1
    move-exception v4

    .line 1308
    .restart local v4    # "e":Lorg/linphone/core/LinphoneCoreException;
    new-instance v21, Lorg/linphone/LinphoneConfigException;

    const v22, 0x7f070289

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v0, v1, v4}, Lorg/linphone/LinphoneConfigException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v21

    .line 1292
    .end local v4    # "e":Lorg/linphone/core/LinphoneCoreException;
    .restart local v15    # "lPrefix":Ljava/lang/String;
    :cond_11
    const/16 v21, 0x0

    :try_start_4
    move-object/from16 v0, v21

    invoke-interface {v8, v0}, Lorg/linphone/core/LinphoneProxyConfig;->setRoute(Ljava/lang/String;)V
    :try_end_4
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_4

    .line 1305
    .end local v15    # "lPrefix":Ljava/lang/String;
    .restart local v7    # "lConnectivityManager":Landroid/net/ConnectivityManager;
    .restart local v12    # "lInfo":Landroid/net/NetworkInfo;
    :cond_12
    const/16 v21, 0x0

    goto :goto_5

    :cond_13
    const/16 v21, 0x0

    goto :goto_5

    .line 1315
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    move-object/from16 v21, v0

    const/16 v22, 0x3

    invoke-interface/range {v21 .. v22}, Lorg/linphone/core/LinphoneCore;->setMaxCalls(I)V

    goto :goto_6
.end method

.method public isComposingReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;

    .prologue
    .line 782
    return-void
.end method

.method public isEchoCalibrated()Z
    .locals 1

    .prologue
    .line 1649
    iget-boolean v0, p0, Lorg/linphone/LinphoneService;->echoCalibrationDone:Z

    return v0
.end method

.method public listAvailableCodecs()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/service/Codec;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1007
    new-instance v0, Ljava/util/ArrayList;

    sget-object v2, Lorg/linphone/LinphoneService;->codecs:[Lcom/pccw/mobile/sip/service/Codec;

    array-length v2, v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1008
    .local v0, "avaliableCodecs":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/service/Codec;>;"
    sget-object v3, Lorg/linphone/LinphoneService;->codecs:[Lcom/pccw/mobile/sip/service/Codec;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v1, v3, v2

    .line 1009
    .local v1, "c":Lcom/pccw/mobile/sip/service/Codec;
    iget-object v5, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    iget-object v6, v1, Lcom/pccw/mobile/sip/service/Codec;->codecName:Ljava/lang/String;

    iget v7, v1, Lcom/pccw/mobile/sip/service/Codec;->rate:I

    invoke-interface {v5, v6, v7}, Lorg/linphone/core/LinphoneCore;->findPayloadType(Ljava/lang/String;I)Lorg/linphone/core/PayloadType;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 1010
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1008
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1013
    .end local v1    # "c":Lcom/pccw/mobile/sip/service/Codec;
    :cond_1
    return-object v0
.end method

.method public messageReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;Lorg/linphone/core/LinphoneChatMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;
    .param p3, "message"    # Lorg/linphone/core/LinphoneChatMessage;

    .prologue
    .line 568
    return-void
.end method

.method public messageReceivedUnableToDecrypted(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;Lorg/linphone/core/LinphoneChatMessage;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;
    .param p3, "message"    # Lorg/linphone/core/LinphoneChatMessage;

    .prologue
    .line 573
    return-void
.end method

.method public networkReachableChanged(Lorg/linphone/core/LinphoneCore;Z)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "enable"    # Z

    .prologue
    .line 1548
    return-void
.end method

.method public newSubscriptionRequest(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriend;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "lf"    # Lorg/linphone/core/LinphoneFriend;
    .param p3, "url"    # Ljava/lang/String;

    .prologue
    .line 1383
    return-void
.end method

.method public notifyPresenceReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneFriend;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "lf"    # Lorg/linphone/core/LinphoneFriend;

    .prologue
    .line 1388
    return-void
.end method

.method public notifyReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneAddress;[B)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "from"    # Lorg/linphone/core/LinphoneAddress;
    .param p4, "event"    # [B

    .prologue
    .line 1398
    return-void
.end method

.method public notifyReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Ljava/lang/String;Lorg/linphone/core/LinphoneContent;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "eventName"    # Ljava/lang/String;
    .param p4, "content"    # Lorg/linphone/core/LinphoneContent;

    .prologue
    .line 777
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 1327
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 9

    .prologue
    .line 193
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 194
    sput-object p0, Lorg/linphone/LinphoneService;->theLinphone:Lorg/linphone/LinphoneService;

    .line 195
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mServiceContext:Landroid/content/Context;

    .line 199
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->isAutoStart(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 202
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->stopSelf()V

    .line 206
    :cond_0
    invoke-static {}, Lorg/linphone/core/Hacks;->dumpDeviceInformation()V

    .line 220
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    .line 221
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mPref:Landroid/content/SharedPreferences;

    .line 222
    const-string/jumbo v0, "audio"

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    .line 223
    const-string/jumbo v0, "vibrator"

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mVibrator:Landroid/os/Vibrator;

    .line 226
    :try_start_0
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    .line 227
    .local v7, "basePath":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "/linphonerc"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->linphoneInitialConfigFile:Ljava/lang/String;

    .line 228
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "/.linphonerc"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->linphoneConfigFile:Ljava/lang/String;

    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "/oldphone_mono.wav"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->ringSoundFile:Ljava/lang/String;

    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "/ringback.wav"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->ringbackSoundFile:Ljava/lang/String;

    .line 231
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "/cwt.wav"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->callWaitingToneSoundFile:Ljava/lang/String;

    .line 232
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "/staticpic.jpg"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->staticPicFile:Ljava/lang/String;

    .line 234
    invoke-direct {p0, p0}, Lorg/linphone/LinphoneService;->copyAssetsFromPackage(Landroid/content/Context;)V

    .line 237
    invoke-static {}, Lorg/linphone/core/LinphoneCoreFactory;->instance()Lorg/linphone/core/LinphoneCoreFactory;

    move-result-object v0

    iget-object v2, p0, Lorg/linphone/LinphoneService;->linphoneConfigFile:Ljava/lang/String;

    iget-object v3, p0, Lorg/linphone/LinphoneService;->linphoneInitialConfigFile:Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/linphone/LinphoneService;->mServiceContext:Landroid/content/Context;

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Lorg/linphone/core/LinphoneCoreFactory;->createLinphoneCore(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/linphone/core/LinphoneCore;

    move-result-object v0

    iput-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    .line 246
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->setContext(Ljava/lang/Object;)V

    .line 247
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->enableKeepAlive(Z)V

    .line 249
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    iget-object v2, p0, Lorg/linphone/LinphoneService;->staticPicFile:Ljava/lang/String;

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->setStaticPicture(Ljava/lang/String;)V

    .line 250
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/high16 v2, 0x40400000    # 3.0f

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->setPlaybackGain(F)V

    .line 251
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->setRing(Ljava/lang/String;)V

    .line 252
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Lorg/linphone/core/LinphoneCore;->setVideoPolicy(ZZ)V

    .line 256
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    const/4 v2, 0x3

    invoke-interface {v0, v2}, Lorg/linphone/core/LinphoneCore;->setMaxCalls(I)V

    .line 258
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v6

    .line 259
    .local v6, "availableCores":I
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0, v6}, Lorg/linphone/core/LinphoneCore;->setCpuCount(I)V

    .line 261
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->clearAuthInfos()V

    .line 262
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->clearProxyConfigs()V

    .line 273
    new-instance v1, Lorg/linphone/LinphoneService$1;

    invoke-direct {v1, p0}, Lorg/linphone/LinphoneService$1;-><init>(Lorg/linphone/LinphoneService;)V

    .line 313
    .local v1, "lTask":Ljava/util/TimerTask;
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mTimer:Ljava/util/Timer;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x64

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 315
    new-instance v8, Landroid/content/IntentFilter;

    const-string/jumbo v0, "android.intent.action.SCREEN_ON"

    invoke-direct {v8, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 316
    .local v8, "lFilter":Landroid/content/IntentFilter;
    const-string/jumbo v0, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 317
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mKeepAliveMgrReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0, v8}, Lorg/linphone/LinphoneService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 318
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->startBluetooth()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 324
    .end local v1    # "lTask":Ljava/util/TimerTask;
    .end local v6    # "availableCores":I
    .end local v7    # "basePath":Ljava/lang/String;
    .end local v8    # "lFilter":Landroid/content/IntentFilter;
    :goto_0
    return-void

    .line 319
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1343
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 1344
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1346
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->tunnelCleanServers()V

    .line 1348
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->destroy()V

    .line 1349
    sput-object v1, Lorg/linphone/LinphoneService;->theLinphone:Lorg/linphone/LinphoneService;

    .line 1351
    invoke-direct {p0}, Lorg/linphone/LinphoneService;->destroyBluetoothProfileProxy()V

    .line 1353
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->domain:Ljava/lang/String;

    .line 1354
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->identity:Ljava/lang/String;

    .line 1355
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->proxy:Ljava/lang/String;

    .line 1356
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->route:Ljava/lang/String;

    .line 1357
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->regState:Ljava/lang/String;

    .line 1360
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mKeepAliveMgrReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1361
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 1362
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mOutgoingCallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lorg/linphone/LinphoneService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1363
    :cond_0
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 332
    if-eqz p1, :cond_0

    const-string/jumbo v0, "do_init"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 334
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->initFromConf()V
    :try_end_0
    .catch Lorg/linphone/LinphoneException; {:try_start_0 .. :try_end_0} :catch_0

    .line 341
    :cond_1
    :goto_0
    const/4 v0, 0x2

    return v0

    .line 335
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public publishStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Lorg/linphone/core/PublishState;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "state"    # Lorg/linphone/core/PublishState;

    .prologue
    .line 1418
    return-void
.end method

.method public registrationState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneProxyConfig;Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V
    .locals 7
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cfg"    # Lorg/linphone/core/LinphoneProxyConfig;
    .param p3, "state"    # Lorg/linphone/core/LinphoneCore$RegistrationState;
    .param p4, "smessage"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 502
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 508
    :cond_0
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    invoke-interface {p2}, Lorg/linphone/core/LinphoneProxyConfig;->getDomain()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->domain:Ljava/lang/String;

    .line 509
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    invoke-interface {p2}, Lorg/linphone/core/LinphoneProxyConfig;->getIdentity()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->identity:Ljava/lang/String;

    .line 510
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    invoke-interface {p2}, Lorg/linphone/core/LinphoneProxyConfig;->getProxy()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->proxy:Ljava/lang/String;

    .line 511
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    invoke-interface {p2}, Lorg/linphone/core/LinphoneProxyConfig;->getRoute()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->route:Ljava/lang/String;

    .line 512
    iget-object v0, p0, Lorg/linphone/LinphoneService;->lastUpdatedSipStatus:Lorg/linphone/LinphoneService$sipState;

    invoke-virtual {p3}, Lorg/linphone/core/LinphoneCore$RegistrationState;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/linphone/LinphoneService$sipState;->regState:Ljava/lang/String;

    .line 514
    sget-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationOk:Lorg/linphone/core/LinphoneCore$RegistrationState;

    if-ne p3, v0, :cond_1

    if-eqz p1, :cond_1

    .line 515
    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lorg/linphone/core/LinphoneCore;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v0

    invoke-interface {v0}, Lorg/linphone/core/LinphoneProxyConfig;->isRegistered()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 525
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget v0, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v0, :cond_1

    .line 526
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v2, v0, v1}, Lorg/linphone/LinphoneService;->makeNotification(Landroid/content/Context;IILjava/lang/String;)V

    .line 528
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/pccw/mobile/sip/service/MobileSipService;->handleSipRegisterSuccess(Landroid/content/Context;)V

    .line 532
    :cond_1
    sget-object v0, Lorg/linphone/core/LinphoneCore$RegistrationState;->RegistrationFailed:Lorg/linphone/core/LinphoneCore$RegistrationState;

    if-ne p3, v0, :cond_2

    .line 543
    invoke-static {p0, v2}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    .line 545
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    invoke-virtual {v0, p0, p4}, Lcom/pccw/mobile/sip/service/MobileSipService;->handleSipRegisterFailed(Landroid/content/Context;Ljava/lang/String;)V

    .line 548
    :cond_2
    iget-object v6, p0, Lorg/linphone/LinphoneService;->mHandler:Landroid/os/Handler;

    new-instance v0, Lorg/linphone/LinphoneService$4;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/linphone/LinphoneService$4;-><init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneProxyConfig;Lorg/linphone/core/LinphoneCore$RegistrationState;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 558
    return-void
.end method

.method public resetCameraFromPreferences()V
    .locals 7

    .prologue
    .line 1653
    const/4 v3, 0x1

    .line 1655
    .local v3, "useFrontCam":Z
    const/4 v1, 0x0

    .line 1656
    .local v1, "camId":I
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration;->retrieveCameras()[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;

    move-result-object v2

    .line 1657
    .local v2, "cameras":[Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    array-length v5, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v0, v2, v4

    .line 1658
    .local v0, "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    iget-boolean v6, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->frontFacing:Z

    if-ne v6, v3, :cond_0

    .line 1659
    iget v1, v0, Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;->id:I

    .line 1657
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1661
    .end local v0    # "androidCamera":Lorg/linphone/mediastream/video/capture/hwconf/AndroidCameraConfiguration$AndroidCamera;
    :cond_1
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v4

    invoke-interface {v4, v1}, Lorg/linphone/core/LinphoneCore;->setVideoDevice(I)V

    .line 1662
    return-void
.end method

.method public routeAudioToBluetooth()Z
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1812
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    .line 1813
    .local v3, "mBluetoothAdapter":Landroid/bluetooth/BluetoothAdapter;
    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4}, Landroid/media/AudioManager;->isBluetoothScoAvailableOffCall()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1816
    iget-object v4, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4, v5}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 1817
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->startBluetoothSco()V

    .line 1819
    const/16 v4, 0xb

    invoke-static {v4}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1820
    iput-boolean v6, p0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    .line 1821
    iget-object v4, p0, Lorg/linphone/LinphoneService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    if-eqz v4, :cond_1

    .line 1822
    iget-object v4, p0, Lorg/linphone/LinphoneService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothHeadset;->getConnectedDevices()Ljava/util/List;

    move-result-object v1

    .line 1823
    .local v1, "devices":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothDevice;

    .line 1824
    .local v0, "dev":Landroid/bluetooth/BluetoothDevice;
    iget-boolean v8, p0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    iget-object v4, p0, Lorg/linphone/LinphoneService;->mBluetoothHeadset:Landroid/bluetooth/BluetoothHeadset;

    invoke-virtual {v4, v0}, Landroid/bluetooth/BluetoothHeadset;->getConnectionState(Landroid/bluetooth/BluetoothDevice;)I

    move-result v4

    const/4 v9, 0x2

    if-ne v4, v9, :cond_0

    move v4, v5

    :goto_1
    or-int/2addr v4, v8

    iput-boolean v4, p0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    goto :goto_0

    :cond_0
    move v4, v6

    goto :goto_1

    .line 1828
    .end local v0    # "dev":Landroid/bluetooth/BluetoothDevice;
    .end local v1    # "devices":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothDevice;>;"
    :cond_1
    iget-boolean v4, p0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    if-nez v4, :cond_4

    .line 1831
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->scoDisconnected()V

    .line 1855
    :cond_2
    :goto_2
    iget-boolean v6, p0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    .line 1858
    :cond_3
    return v6

    .line 1834
    :cond_4
    const-class v4, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;

    invoke-direct {p0, v4}, Lorg/linphone/LinphoneService;->getSimpleListeners(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;

    .line 1835
    .local v2, "listener":Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;
    sget-object v5, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;->SPEAKER:Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;

    invoke-interface {v2, v5}, Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;->onAudioStateChanged(Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener$AudioState;)V

    goto :goto_3

    .line 1837
    .end local v2    # "listener":Lorg/linphone/LinphoneSimpleListener$LinphoneOnAudioChangedListener;
    :cond_5
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 1838
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v4

    invoke-virtual {v4}, Lorg/linphone/InCallScreen;->updateRoutingIcon()V

    .line 1839
    :cond_6
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 1840
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v4

    invoke-virtual {v4}, Lorg/linphone/VideoCallActivity;->updateRoutingIcon()V

    goto :goto_2

    .line 1845
    :cond_7
    iget-object v4, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v4}, Landroid/media/AudioManager;->isBluetoothScoOn()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1848
    iput-boolean v5, p0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    .line 1849
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v4

    if-eqz v4, :cond_8

    .line 1850
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v4

    invoke-virtual {v4}, Lorg/linphone/InCallScreen;->updateRoutingIcon()V

    .line 1851
    :cond_8
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 1852
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v4

    invoke-virtual {v4}, Lorg/linphone/VideoCallActivity;->updateRoutingIcon()V

    goto :goto_2
.end method

.method public routeAudioToReceiver()V
    .locals 1

    .prologue
    .line 1728
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/linphone/LinphoneService;->routeAudioToSpeakerHelper(Z)V

    .line 1729
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1730
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/InCallScreen;->updateRoutingIcon()V

    .line 1731
    :cond_0
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1732
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->updateRoutingIcon()V

    .line 1733
    :cond_1
    return-void
.end method

.method public routeAudioToSpeaker()V
    .locals 1

    .prologue
    .line 1718
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/linphone/LinphoneService;->routeAudioToSpeakerHelper(Z)V

    .line 1719
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1720
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/InCallScreen;->updateRoutingIcon()V

    .line 1721
    :cond_0
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1722
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/VideoCallActivity;->updateRoutingIcon()V

    .line 1723
    :cond_1
    return-void
.end method

.method public scoConnected()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1876
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    .line 1877
    const/16 v0, 0xb

    invoke-static {v0}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1878
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1879
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/linphone/InCallScreen;->refreshAudioRouteActions(Z)V

    .line 1880
    :cond_0
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1881
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/linphone/VideoCallActivity;->refreshAudioRouteActions(Z)V

    .line 1883
    :cond_1
    return-void
.end method

.method public scoDisconnected()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x8
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1889
    iput-boolean v1, p0, Lorg/linphone/LinphoneService;->isUsingBluetoothAudioRoute:Z

    .line 1890
    iput-boolean v1, p0, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    .line 1891
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    if-eqz v0, :cond_0

    .line 1894
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->stopBluetoothSco()V

    .line 1895
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setBluetoothScoOn(Z)V

    .line 1897
    :cond_0
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1898
    invoke-static {}, Lorg/linphone/InCallScreen;->getDialer()Lorg/linphone/InCallScreen;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/linphone/InCallScreen;->refreshAudioRouteActions(Z)V

    .line 1899
    :cond_1
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1900
    invoke-static {}, Lorg/linphone/VideoCallActivity;->getVideoCallScreen()Lorg/linphone/VideoCallActivity;

    move-result-object v0

    invoke-virtual {v0, v1}, Lorg/linphone/VideoCallActivity;->refreshAudioRouteActions(Z)V

    .line 1901
    :cond_2
    return-void
.end method

.method public show(Lorg/linphone/core/LinphoneCore;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;

    .prologue
    .line 959
    return-void
.end method

.method public startBluetooth()V
    .locals 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 1739
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v3

    iput-object v3, p0, Lorg/linphone/LinphoneService;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 1740
    iget-object v3, p0, Lorg/linphone/LinphoneService;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1743
    const/16 v3, 0xb

    invoke-static {v3}, Lorg/linphone/mediastream/Version;->sdkAboveOrEqual(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1744
    new-instance v3, Lorg/linphone/LinphoneService$9;

    invoke-direct {v3, p0}, Lorg/linphone/LinphoneService$9;-><init>(Lorg/linphone/LinphoneService;)V

    iput-object v3, p0, Lorg/linphone/LinphoneService;->mProfileListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    .line 1786
    iget-object v3, p0, Lorg/linphone/LinphoneService;->mBluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    iget-object v4, p0, Lorg/linphone/LinphoneService;->mServiceContext:Landroid/content/Context;

    iget-object v5, p0, Lorg/linphone/LinphoneService;->mProfileListener:Landroid/bluetooth/BluetoothProfile$ServiceListener;

    invoke-virtual {v3, v4, v5, v6}, Landroid/bluetooth/BluetoothAdapter;->getProfileProxy(Landroid/content/Context;Landroid/bluetooth/BluetoothProfile$ServiceListener;I)Z

    .line 1806
    :cond_0
    :goto_0
    return-void

    .line 1790
    :cond_1
    const-string/jumbo v0, "android.media.SCO_AUDIO_STATE_CHANGED"

    .line 1791
    .local v0, "actionScoConnected":Ljava/lang/String;
    iget-object v3, p0, Lorg/linphone/LinphoneService;->mServiceContext:Landroid/content/Context;

    iget-object v4, p0, Lorg/linphone/LinphoneService;->bluetoothReiceiver:Landroid/content/BroadcastReceiver;

    new-instance v5, Landroid/content/IntentFilter;

    invoke-direct {v5, v0}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    .line 1793
    .local v1, "currentValue":Landroid/content/Intent;
    if-nez v1, :cond_2

    .line 1795
    .local v2, "state":I
    :goto_1
    if-ne v2, v6, :cond_0

    .line 1798
    iput-boolean v6, p0, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    goto :goto_0

    .line 1793
    .end local v2    # "state":I
    :cond_2
    const-string/jumbo v3, "android.media.extra.SCO_AUDIO_STATE"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    goto :goto_1

    .line 1802
    .end local v0    # "actionScoConnected":Ljava/lang/String;
    .end local v1    # "currentValue":Landroid/content/Intent;
    :cond_3
    iput-boolean v2, p0, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    .line 1803
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->scoDisconnected()V

    .line 1804
    invoke-virtual {p0}, Lorg/linphone/LinphoneService;->routeAudioToReceiver()V

    goto :goto_0
.end method

.method public startBluetoothSco()V
    .locals 1

    .prologue
    .line 1862
    iget-boolean v0, p0, Lorg/linphone/LinphoneService;->isBluetoothScoStarted:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/linphone/LinphoneService;->isBluetoothScoConnected:Z

    if-eqz v0, :cond_0

    .line 1863
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->startBluetoothSco()V

    .line 1864
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/linphone/LinphoneService;->isBluetoothScoStarted:Z

    .line 1866
    :cond_0
    return-void
.end method

.method public stopBluetoothSco()V
    .locals 1

    .prologue
    .line 1869
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0}, Landroid/media/AudioManager;->stopBluetoothSco()V

    .line 1870
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/linphone/LinphoneService;->isBluetoothScoStarted:Z

    .line 1871
    return-void
.end method

.method public subscriptionStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneEvent;Lorg/linphone/core/SubscriptionState;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "ev"    # Lorg/linphone/core/LinphoneEvent;
    .param p3, "state"    # Lorg/linphone/core/SubscriptionState;

    .prologue
    .line 1413
    return-void
.end method

.method public textReceived(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneChatRoom;Lorg/linphone/core/LinphoneAddress;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "cr"    # Lorg/linphone/core/LinphoneChatRoom;
    .param p3, "from"    # Lorg/linphone/core/LinphoneAddress;
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    .line 1424
    return-void
.end method

.method public transferState(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall$State;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p3, "new_call_state"    # Lorg/linphone/core/LinphoneCall$State;

    .prologue
    .line 1403
    return-void
.end method

.method public tunnelingEnabled()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1637
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1645
    :cond_0
    :goto_0
    return v0

    .line 1640
    :cond_1
    iget-object v1, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    if-eqz v1, :cond_0

    .line 1645
    iget-object v0, p0, Lorg/linphone/LinphoneService;->mLinphoneCore:Lorg/linphone/core/LinphoneCore;

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCore;->isTunnelAvailable()Z

    move-result v0

    goto :goto_0
.end method

.method public uploadProgressIndication(Lorg/linphone/core/LinphoneCore;II)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "offset"    # I
    .param p3, "total"    # I

    .prologue
    .line 1528
    return-void
.end method

.method public uploadStateChanged(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$LogCollectionUploadState;Ljava/lang/String;)V
    .locals 0
    .param p1, "lc"    # Lorg/linphone/core/LinphoneCore;
    .param p2, "state"    # Lorg/linphone/core/LinphoneCore$LogCollectionUploadState;
    .param p3, "info"    # Ljava/lang/String;

    .prologue
    .line 1533
    return-void
.end method
