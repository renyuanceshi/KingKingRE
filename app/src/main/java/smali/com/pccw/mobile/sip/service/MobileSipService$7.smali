.class Lcom/pccw/mobile/sip/service/MobileSipService$7;
.super Ljava/lang/Object;
.source "MobileSipService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/service/MobileSipService;->close(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/service/MobileSipService;

    .prologue
    .line 1886
    iput-object p1, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iput-object p2, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 1890
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-static {v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1000(Lcom/pccw/mobile/sip/service/MobileSipService;)Z

    move-result v6

    if-nez v6, :cond_9

    .line 1891
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1002(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z

    .line 1903
    :try_start_0
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v7, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1100(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    .line 1906
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lorg/linphone/LinphoneService;->cancelNotification(Landroid/content/Context;I)V

    .line 1910
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-static {v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$800(Lcom/pccw/mobile/sip/service/MobileSipService;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1911
    const/4 v6, 0x2

    .line 1912
    invoke-static {v6}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v4

    .line 1913
    .local v4, "notificationUri":Landroid/net/Uri;
    new-instance v5, Landroid/media/MediaPlayer;

    invoke-direct {v5}, Landroid/media/MediaPlayer;-><init>()V

    .line 1914
    .local v5, "player":Landroid/media/MediaPlayer;
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v0

    .line 1916
    .local v0, "appContext":Landroid/content/Context;
    :try_start_1
    invoke-virtual {v5, v0, v4}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 1917
    const-string/jumbo v6, "audio"

    .line 1918
    invoke-virtual {v0, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    .line 1919
    .local v1, "audioManager":Landroid/media/AudioManager;
    const/4 v6, 0x2

    invoke-virtual {v1, v6}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v6

    if-eqz v6, :cond_0

    .line 1920
    const/4 v6, 0x2

    invoke-virtual {v5, v6}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    .line 1921
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 1922
    invoke-virtual {v5}, Landroid/media/MediaPlayer;->prepare()V

    .line 1923
    invoke-virtual {v5}, Landroid/media/MediaPlayer;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 1929
    .end local v1    # "audioManager":Landroid/media/AudioManager;
    :cond_0
    :goto_0
    const v6, 0x7f070105

    :try_start_2
    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-static {v0, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v6

    .line 1930
    invoke-virtual {v6}, Landroid/widget/Toast;->show()V

    .line 1933
    .end local v0    # "appContext":Landroid/content/Context;
    .end local v4    # "notificationUri":Landroid/net/Uri;
    .end local v5    # "player":Landroid/media/MediaPlayer;
    :cond_1
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lorg/linphone/DailPadActivity;->on(Landroid/content/Context;Z)V

    .line 1935
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-static {v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$300(Lcom/pccw/mobile/sip/service/MobileSipService;)I

    move-result v6

    if-nez v6, :cond_2

    .line 1936
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-virtual {v6, v7, v8}, Lcom/pccw/mobile/sip/service/MobileSipService;->activateCallForward(ZLandroid/content/Context;)V

    .line 1937
    :cond_2
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget v6, v6, Lcom/pccw/mobile/sip/service/MobileSipService;->loginStatus:I

    if-nez v6, :cond_5

    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-static {v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1200(Lcom/pccw/mobile/sip/service/MobileSipService;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result v6

    if-eqz v6, :cond_5

    .line 1939
    :try_start_3
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v7, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1300(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    .line 1940
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v7, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1400(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    .line 1941
    :goto_1
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1942
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneCore;->isIncall()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1957
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneCore;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v2

    .line 1958
    .local v2, "call":Lorg/linphone/core/LinphoneCall;
    if-eqz v2, :cond_3

    .line 1959
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6, v2}, Lorg/linphone/core/LinphoneCore;->terminateCall(Lorg/linphone/core/LinphoneCall;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 1961
    :cond_3
    const-wide/16 v6, 0xc8

    :try_start_4
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 1962
    :catch_0
    move-exception v3

    .line 1963
    .local v3, "e":Ljava/lang/InterruptedException;
    :try_start_5
    invoke-virtual {v3}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 1971
    .end local v2    # "call":Lorg/linphone/core/LinphoneCall;
    .end local v3    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v6

    .line 1976
    :cond_4
    :try_start_6
    invoke-static {}, Lorg/linphone/LinphoneService;->isready()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1977
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneCore;->clearAuthInfos()V

    .line 1978
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v6

    invoke-interface {v6}, Lorg/linphone/core/LinphoneCore;->clearProxyConfigs()V

    .line 1982
    :cond_5
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    iget-object v7, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-virtual {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->resetLoginStatus(Landroid/content/Context;)V

    .line 1983
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v6

    invoke-virtual {v6}, Lcom/pccw/mobile/sip/service/MobileSipService;->resetLoginRetryCount()V

    .line 1984
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1502(Lcom/pccw/mobile/sip/service/MobileSipService;Ljava/lang/String;)Ljava/lang/String;

    .line 1988
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    const/4 v7, 0x1

    iput-boolean v7, v6, Lcom/pccw/mobile/sip/service/MobileSipService;->isFirstAlertOfCONNECTIVITY_ACTION:Z

    .line 1989
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1602(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z

    .line 1990
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1702(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z

    .line 1991
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1802(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z

    .line 1992
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    const/4 v7, 0x0

    iput-boolean v7, v6, Lcom/pccw/mobile/sip/service/MobileSipService;->shouldRelogin:Z

    .line 1999
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v7, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1900(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    .line 2005
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2000()Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v6

    if-eqz v6, :cond_6

    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2000()Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 2006
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2000()Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 2010
    :cond_6
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2100()Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    if-eqz v6, :cond_7

    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2100()Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 2011
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2100()Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 2012
    :cond_7
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2200()Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    if-eqz v6, :cond_8

    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2200()Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 2013
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2200()Landroid/os/PowerManager$WakeLock;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 2024
    :cond_8
    :goto_2
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    iget-object v7, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->val$ctx:Landroid/content/Context;

    invoke-static {v6, v7}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$2300(Lcom/pccw/mobile/sip/service/MobileSipService;Landroid/content/Context;)V

    .line 2025
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-static {v6, v9}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$802(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z

    .line 2026
    iget-object v6, p0, Lcom/pccw/mobile/sip/service/MobileSipService$7;->this$0:Lcom/pccw/mobile/sip/service/MobileSipService;

    invoke-static {v6, v9}, Lcom/pccw/mobile/sip/service/MobileSipService;->access$1002(Lcom/pccw/mobile/sip/service/MobileSipService;Z)Z

    .line 2028
    :cond_9
    return-void

    .line 2017
    :catch_2
    move-exception v6

    goto :goto_2

    .line 1925
    .restart local v0    # "appContext":Landroid/content/Context;
    .restart local v4    # "notificationUri":Landroid/net/Uri;
    .restart local v5    # "player":Landroid/media/MediaPlayer;
    :catch_3
    move-exception v6

    goto/16 :goto_0
.end method
