.class Lorg/linphone/VideoCallActivity$13$1;
.super Ljava/lang/Object;
.source "VideoCallActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/VideoCallActivity$13;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/linphone/VideoCallActivity$13;

.field final synthetic val$call:Lorg/linphone/core/LinphoneCall;

.field final synthetic val$viewStatText:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lorg/linphone/VideoCallActivity$13;Lorg/linphone/core/LinphoneCall;Landroid/widget/TextView;)V
    .locals 0
    .param p1, "this$1"    # Lorg/linphone/VideoCallActivity$13;

    .prologue
    .line 1323
    iput-object p1, p0, Lorg/linphone/VideoCallActivity$13$1;->this$1:Lorg/linphone/VideoCallActivity$13;

    iput-object p2, p0, Lorg/linphone/VideoCallActivity$13$1;->val$call:Lorg/linphone/core/LinphoneCall;

    iput-object p3, p0, Lorg/linphone/VideoCallActivity$13$1;->val$viewStatText:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 1326
    invoke-static {}, Lorg/linphone/LinphoneService;->getLc()Lorg/linphone/core/LinphoneCore;

    move-result-object v8

    monitor-enter v8

    .line 1328
    :try_start_0
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    .line 1329
    .local v5, "sb":Ljava/lang/StringBuffer;
    iget-object v7, p0, Lorg/linphone/VideoCallActivity$13$1;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v7}, Lorg/linphone/core/LinphoneCall;->getCurrentParamsCopy()Lorg/linphone/core/LinphoneCallParams;

    move-result-object v1

    .line 1330
    .local v1, "params":Lorg/linphone/core/LinphoneCallParams;
    if-eqz v1, :cond_2

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCallParams;->getVideoEnabled()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1331
    iget-object v7, p0, Lorg/linphone/VideoCallActivity$13$1;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v7}, Lorg/linphone/core/LinphoneCall;->getVideoStats()Lorg/linphone/core/LinphoneCallStats;

    move-result-object v6

    .line 1332
    .local v6, "videoStats":Lorg/linphone/core/LinphoneCallStats;
    iget-object v7, p0, Lorg/linphone/VideoCallActivity$13$1;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v7}, Lorg/linphone/core/LinphoneCall;->getAudioStats()Lorg/linphone/core/LinphoneCallStats;

    move-result-object v0

    .line 1333
    .local v0, "audioStats":Lorg/linphone/core/LinphoneCallStats;
    if-eqz v6, :cond_1

    if-eqz v0, :cond_1

    .line 1334
    const-string/jumbo v7, "Video"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1335
    invoke-interface {v1}, Lorg/linphone/core/LinphoneCallParams;->getUsedAudioCodec()Lorg/linphone/core/PayloadType;

    move-result-object v3

    .line 1336
    .local v3, "payloadAudio":Lorg/linphone/core/PayloadType;
    invoke-interface {v1}, Lorg/linphone/core/LinphoneCallParams;->getUsedVideoCodec()Lorg/linphone/core/PayloadType;

    move-result-object v4

    .line 1337
    .local v4, "payloadVideo":Lorg/linphone/core/PayloadType;
    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    .line 1338
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "\nCodec:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Lorg/linphone/core/PayloadType;->getMime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " / "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v3}, Lorg/linphone/core/PayloadType;->getMime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v3}, Lorg/linphone/core/PayloadType;->getRate()I

    move-result v9

    div-int/lit16 v9, v9, 0x3e8

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1340
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "\nDownload:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v6}, Lorg/linphone/core/LinphoneCallStats;->getDownloadBandwidth()F

    move-result v9

    float-to-int v9, v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " / "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallStats;->getDownloadBandwidth()F

    move-result v9

    float-to-int v9, v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " kbits/s"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1341
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "\nUpload:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v6}, Lorg/linphone/core/LinphoneCallStats;->getUploadBandwidth()F

    move-result v9

    float-to-int v9, v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " / "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallStats;->getUploadBandwidth()F

    move-result v9

    float-to-int v9, v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " kbits/s"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1342
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "\nSize:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCallParams;->getSentVideoSize()Lorg/linphone/core/VideoSize;

    move-result-object v9

    invoke-virtual {v9}, Lorg/linphone/core/VideoSize;->toDisplayableString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " / "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1}, Lorg/linphone/core/LinphoneCallParams;->getReceivedVideoSize()Lorg/linphone/core/VideoSize;

    move-result-object v9

    invoke-virtual {v9}, Lorg/linphone/core/VideoSize;->toDisplayableString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1357
    .end local v3    # "payloadAudio":Lorg/linphone/core/PayloadType;
    .end local v4    # "payloadVideo":Lorg/linphone/core/PayloadType;
    .end local v6    # "videoStats":Lorg/linphone/core/LinphoneCallStats;
    :cond_1
    :goto_0
    iget-object v7, p0, Lorg/linphone/VideoCallActivity$13$1;->val$viewStatText:Landroid/widget/TextView;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1360
    .end local v0    # "audioStats":Lorg/linphone/core/LinphoneCallStats;
    .end local v1    # "params":Lorg/linphone/core/LinphoneCallParams;
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    :goto_1
    :try_start_1
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1361
    return-void

    .line 1345
    .restart local v1    # "params":Lorg/linphone/core/LinphoneCallParams;
    .restart local v5    # "sb":Ljava/lang/StringBuffer;
    :cond_2
    :try_start_2
    iget-object v7, p0, Lorg/linphone/VideoCallActivity$13$1;->val$call:Lorg/linphone/core/LinphoneCall;

    invoke-interface {v7}, Lorg/linphone/core/LinphoneCall;->getAudioStats()Lorg/linphone/core/LinphoneCallStats;

    move-result-object v0

    .line 1346
    .restart local v0    # "audioStats":Lorg/linphone/core/LinphoneCallStats;
    if-eqz v0, :cond_1

    .line 1347
    const-string/jumbo v7, "Audio"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1348
    invoke-interface {v1}, Lorg/linphone/core/LinphoneCallParams;->getUsedAudioCodec()Lorg/linphone/core/PayloadType;

    move-result-object v2

    .line 1349
    .local v2, "payload":Lorg/linphone/core/PayloadType;
    if-eqz v2, :cond_3

    .line 1350
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "\nCodec:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Lorg/linphone/core/PayloadType;->getMime()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v2}, Lorg/linphone/core/PayloadType;->getRate()I

    move-result v9

    div-int/lit16 v9, v9, 0x3e8

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1352
    :cond_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "\nDownload:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallStats;->getDownloadBandwidth()F

    move-result v9

    float-to-int v9, v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " kbits/s"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1353
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "\nUpload:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallStats;->getUploadBandwidth()F

    move-result v9

    float-to-int v9, v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v9, " kbits/s"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1354
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "\nSize:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCallStats;->getIceState()Lorg/linphone/core/LinphoneCallStats$IceState;

    move-result-object v9

    invoke-virtual {v9}, Lorg/linphone/core/LinphoneCallStats$IceState;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 1358
    .end local v0    # "audioStats":Lorg/linphone/core/LinphoneCallStats;
    .end local v1    # "params":Lorg/linphone/core/LinphoneCallParams;
    .end local v2    # "payload":Lorg/linphone/core/PayloadType;
    .end local v5    # "sb":Ljava/lang/StringBuffer;
    :catch_0
    move-exception v7

    goto/16 :goto_1

    .line 1360
    :catchall_0
    move-exception v7

    :try_start_3
    monitor-exit v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v7
.end method
