.class Lorg/linphone/core/LinphoneCoreImpl;
.super Ljava/lang/Object;
.source "LinphoneCoreImpl.java"

# interfaces
.implements Lorg/linphone/core/LinphoneCore;


# static fields
.field static FIND_PAYLOAD_IGNORE_CHANNELS:I

.field static FIND_PAYLOAD_IGNORE_RATE:I


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mContext:Landroid/content/Context;

.field private final mListener:Lorg/linphone/core/LinphoneCoreListener;

.field private mSpeakerEnabled:Z

.field private mSpeakerphoneAlwaysOn:Z

.field protected nativePtr:J

.field private openh264DownloadEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 1063
    sput v0, Lorg/linphone/core/LinphoneCoreImpl;->FIND_PAYLOAD_IGNORE_RATE:I

    .line 1067
    sput v0, Lorg/linphone/core/LinphoneCoreImpl;->FIND_PAYLOAD_IGNORE_CHANNELS:I

    return-void
.end method

.method constructor <init>(Lorg/linphone/core/LinphoneCoreListener;Ljava/io/File;Ljava/io/File;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6
    .param p1, "listener"    # Lorg/linphone/core/LinphoneCoreListener;
    .param p2, "userConfig"    # Ljava/io/File;
    .param p3, "factoryConfig"    # Ljava/io/File;
    .param p4, "userdata"    # Ljava/lang/Object;
    .param p5, "context"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    .line 46
    iput-object v3, p0, Lorg/linphone/core/LinphoneCoreImpl;->mContext:Landroid/content/Context;

    .line 47
    iput-object v3, p0, Lorg/linphone/core/LinphoneCoreImpl;->mAudioManager:Landroid/media/AudioManager;

    .line 48
    iput-boolean v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->openh264DownloadEnabled:Z

    .line 49
    iput-boolean v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->mSpeakerEnabled:Z

    .line 50
    iput-boolean v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->mSpeakerphoneAlwaysOn:Z

    .line 200
    iput-object p1, p0, Lorg/linphone/core/LinphoneCoreImpl;->mListener:Lorg/linphone/core/LinphoneCoreListener;

    .line 201
    if-nez p2, :cond_0

    move-object v2, v3

    .line 202
    .local v2, "user":Ljava/lang/String;
    :goto_0
    if-nez p3, :cond_1

    .local v3, "factory":Ljava/lang/String;
    :goto_1
    move-object v0, p0

    move-object v1, p1

    move-object v4, p4

    move-object v5, p5

    .line 203
    invoke-direct/range {v0 .. v5}, Lorg/linphone/core/LinphoneCoreImpl;->newLinphoneCore(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    .line 204
    invoke-virtual {p0, p5}, Lorg/linphone/core/LinphoneCoreImpl;->setContext(Ljava/lang/Object;)V

    .line 205
    return-void

    .line 201
    .end local v2    # "user":Ljava/lang/String;
    .end local v3    # "factory":Ljava/lang/String;
    :cond_0
    invoke-virtual {p2}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 202
    .restart local v2    # "user":Ljava/lang/String;
    :cond_1
    invoke-virtual {p3}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method constructor <init>(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/Object;)V
    .locals 6
    .param p1, "listener"    # Lorg/linphone/core/LinphoneCoreListener;
    .param p2, "context"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    .line 46
    iput-object v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->mContext:Landroid/content/Context;

    .line 47
    iput-object v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->mAudioManager:Landroid/media/AudioManager;

    .line 48
    iput-boolean v3, p0, Lorg/linphone/core/LinphoneCoreImpl;->openh264DownloadEnabled:Z

    .line 49
    iput-boolean v3, p0, Lorg/linphone/core/LinphoneCoreImpl;->mSpeakerEnabled:Z

    .line 50
    iput-boolean v3, p0, Lorg/linphone/core/LinphoneCoreImpl;->mSpeakerphoneAlwaysOn:Z

    .line 207
    iput-object p1, p0, Lorg/linphone/core/LinphoneCoreImpl;->mListener:Lorg/linphone/core/LinphoneCoreListener;

    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, v2

    move-object v5, p2

    .line 208
    invoke-direct/range {v0 .. v5}, Lorg/linphone/core/LinphoneCoreImpl;->newLinphoneCore(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    .line 209
    invoke-virtual {p0, p2}, Lorg/linphone/core/LinphoneCoreImpl;->setContext(Ljava/lang/Object;)V

    .line 210
    return-void
.end method

.method private native acceptCall(JJ)V
.end method

.method private native acceptCallUpdate(JJJ)V
.end method

.method private native acceptCallWithParams(JJJ)V
.end method

.method private native acceptEarlyMedia(JJ)Z
.end method

.method private native acceptEarlyMediaWithParams(JJJ)Z
.end method

.method private native addAllToConference(J)V
.end method

.method private native addAuthInfo(JJ)V
.end method

.method private native addFriend(JJ)V
.end method

.method private native addFriendList(JJ)V
.end method

.method private native addListener(JLorg/linphone/core/LinphoneCoreListener;)V
.end method

.method private native addProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;JJ)I
.end method

.method private native addToConference(JJ)V
.end method

.method private applyAudioHacks()V
    .locals 1

    .prologue
    .line 433
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/Hacks;->needGalaxySAudioHack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 435
    const/high16 v0, -0x3ef00000    # -9.0f

    invoke-virtual {p0, v0}, Lorg/linphone/core/LinphoneCoreImpl;->setMicrophoneGain(F)V

    .line 437
    :cond_0
    return-void
.end method

.method private native audioMulticastEnabled(J)Z
.end method

.method private native chatEnabled(J)Z
.end method

.method private native clearAuthInfos(J)V
.end method

.method private native clearCallLogs(J)V
.end method

.method private native clearProxyConfigs(J)V
.end method

.method private contextInitialized()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 217
    iget-object v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->mContext:Landroid/content/Context;

    if-nez v2, :cond_0

    .line 218
    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "Context of LinphoneCore has not been initialized, call setContext() after creating LinphoneCore."

    aput-object v2, v1, v0

    invoke-static {v1}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V

    .line 221
    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method private native createCallLog(JJJIIJJIZF)J
.end method

.method private native createCallParams(JJ)J
.end method

.method private native createConference(JLorg/linphone/core/LinphoneConferenceParams;)Lorg/linphone/core/LinphoneConference;
.end method

.method private native createFriend(J)Ljava/lang/Object;
.end method

.method private native createFriendWithAddress(JLjava/lang/String;)Ljava/lang/Object;
.end method

.method private native createInfoMessage(J)J
.end method

.method private native createLocalPlayer(JLorg/linphone/mediastream/video/AndroidVideoWindowImpl;)J
.end method

.method private native createNatPolicy(J)Ljava/lang/Object;
.end method

.method private native createPublish(JJLjava/lang/String;I)Ljava/lang/Object;
.end method

.method private native createSubscribe(JJLjava/lang/String;I)Ljava/lang/Object;
.end method

.method private native declineCall(JJI)V
.end method

.method private native deferCallUpdate(JJ)V
.end method

.method private native delete(J)V
.end method

.method private native disableChat(JI)V
.end method

.method private native dnsSrvEnabled(J)Z
.end method

.method private native enableAdaptiveRateControl(JZ)V
.end method

.method private native enableAudioMulticast(JZ)V
.end method

.method private native enableChat(J)V
.end method

.method private native enableDnsSrv(JZ)V
.end method

.method private native enableEchoCancellation(JZ)V
.end method

.method private native enableEchoLimiter(JZ)V
.end method

.method private native enableIpv6(JZ)V
.end method

.method private native enableKeepAlive(JZ)V
.end method

.method private native enablePCCWFallbackRegisterPort(JZ)V
.end method

.method private native enablePayloadType(JJZ)I
.end method

.method private native enableSdp200Ack(JZ)V
.end method

.method private native enableVideo(JZZ)V
.end method

.method private native enableVideoMulticast(JZ)V
.end method

.method private native enterConference(J)Z
.end method

.method private native findAuthInfos(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
.end method

.method private native findCallFromUri(JLjava/lang/String;)Ljava/lang/Object;
.end method

.method private native findContactsByChar(JLjava/lang/String;Z)[Lorg/linphone/core/LinphoneAddress;
.end method

.method private native findPayloadType(JLjava/lang/String;II)J
.end method

.method private native forceSpeakerState(JZ)V
.end method

.method private native getAdaptiveRateAlgorithm(J)Ljava/lang/String;
.end method

.method private native getAudioDscp(J)I
.end method

.method private native getAudioMulticastAddr(J)Ljava/lang/String;
.end method

.method private native getAudioMulticastTtl(J)I
.end method

.method private native getAuthInfosList(J)[J
.end method

.method private native getCall(JI)Ljava/lang/Object;
.end method

.method private native getCallLog(JI)J
.end method

.method private native getCallLogs(J)[J
.end method

.method private getCallParamsPtr(Lorg/linphone/core/LinphoneCallParams;)J
    .locals 2
    .param p1, "callParams"    # Lorg/linphone/core/LinphoneCallParams;

    .prologue
    .line 832
    check-cast p1, Lorg/linphone/core/LinphoneCallParamsImpl;

    .end local p1    # "callParams":Lorg/linphone/core/LinphoneCallParams;
    iget-wide v0, p1, Lorg/linphone/core/LinphoneCallParamsImpl;->nativePtr:J

    return-wide v0
.end method

.method private getCallPtr(Lorg/linphone/core/LinphoneCall;)J
    .locals 2
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 828
    check-cast p1, Lorg/linphone/core/LinphoneCallImpl;

    .end local p1    # "call":Lorg/linphone/core/LinphoneCall;
    iget-wide v0, p1, Lorg/linphone/core/LinphoneCallImpl;->nativePtr:J

    return-wide v0
.end method

.method private native getCallsNb(J)I
.end method

.method private native getChatRoom(JJ)Ljava/lang/Object;
.end method

.method private native getChatRooms(J)[Ljava/lang/Object;
.end method

.method private native getConference(J)Lorg/linphone/core/LinphoneConference;
.end method

.method private native getConferenceSize(J)I
.end method

.method private native getConfig(J)J
.end method

.method private native getCurrentCall(J)Ljava/lang/Object;
.end method

.method private native getDefaultProxyConfig(J)Lorg/linphone/core/LinphoneProxyConfig;
.end method

.method private native getDownloadBandwidth(J)I
.end method

.method private native getFileTransferServer(J)Ljava/lang/String;
.end method

.method private native getFirewallPolicy(J)I
.end method

.method private native getFriendByAddress(JLjava/lang/String;)Lorg/linphone/core/LinphoneFriend;
.end method

.method private native getFriendList(J)[Lorg/linphone/core/LinphoneFriend;
.end method

.method private native getFriendLists(J)[Lorg/linphone/core/LinphoneFriendList;
.end method

.method private native getGlobalState(J)I
.end method

.method private native getHttpProxyHost(J)Ljava/lang/String;
.end method

.method private native getHttpProxyPort(J)I
.end method

.method private native getInCallTimeout(J)I
.end method

.method private native getIncomingTimeout(J)I
.end method

.method private native getLastOutgoingCallLog(J)J
.end method

.method private native getLimeEncryption(J)I
.end method

.method private native getMSFactory(J)Ljava/lang/Object;
.end method

.method private native getMaxCalls(J)I
.end method

.method private native getMediaEncryption(J)I
.end method

.method private native getMissedCallsCount(J)I
.end method

.method private native getMtu(J)I
.end method

.method private native getNatPolicy(J)Ljava/lang/Object;
.end method

.method private native getNortpTimeout(J)I
.end method

.method private native getNumberOfCallLogs(J)I
.end method

.method private native getOrCreateChatRoom(JLjava/lang/String;)Ljava/lang/Object;
.end method

.method private native getPCCWDoubleRegisterTimeout(J)I
.end method

.method private native getPayloadTypeBitrate(JJ)I
.end method

.method private native getPayloadTypeNumber(JJ)I
.end method

.method private native getPlaybackGain(J)F
.end method

.method private native getPreferredFramerate(J)F
.end method

.method private native getPreferredVideoSize(J)[I
.end method

.method private native getPresenceInfo(J)I
.end method

.method private native getPresenceModel(J)Ljava/lang/Object;
.end method

.method private native getPrimaryContact(J)Ljava/lang/String;
.end method

.method private native getPrimaryContactDisplayName(J)Ljava/lang/String;
.end method

.method private native getPrimaryContactUsername(J)Ljava/lang/String;
.end method

.method private native getProvisioningUri(J)Ljava/lang/String;
.end method

.method private native getProxyConfigList(J)[Lorg/linphone/core/LinphoneProxyConfig;
.end method

.method private native getRemoteAddress(J)J
.end method

.method private native getRemoteRingbackTone(J)Ljava/lang/String;
.end method

.method private native getRing(J)Ljava/lang/String;
.end method

.method private native getSignalingTransportPort(JI)I
.end method

.method private native getSipDscp(J)I
.end method

.method private native getSipTransportTimeout(J)I
.end method

.method private native getStunServer(J)Ljava/lang/String;
.end method

.method private native getTlsCertificate(J)Ljava/lang/String;
.end method

.method private native getTlsCertificatePath(J)Ljava/lang/String;
.end method

.method private native getTlsKey(J)Ljava/lang/String;
.end method

.method private native getTlsKeyPath(J)Ljava/lang/String;
.end method

.method private native getUploadBandwidth(J)I
.end method

.method private native getUpnpExternalIpaddress(J)Ljava/lang/String;
.end method

.method private native getUpnpState(J)I
.end method

.method private native getUseRfc2833ForDtmfs(J)Z
.end method

.method private native getUseSipInfoForDtmfs(J)Z
.end method

.method private native getVersion(J)Ljava/lang/String;
.end method

.method private native getVideoAutoAcceptPolicy(J)Z
.end method

.method private native getVideoAutoInitiatePolicy(J)Z
.end method

.method private native getVideoDevice(J)I
.end method

.method private native getVideoDscp(J)I
.end method

.method private native getVideoMulticastAddr(J)Ljava/lang/String;
.end method

.method private native getVideoMulticastTtl(J)I
.end method

.method private native getVideoPreset(J)Ljava/lang/String;
.end method

.method private native hasBuiltInEchoCanceler(J)Z
.end method

.method private native hasCrappyOpenGL(J)Z
.end method

.method private native interpretUrl(JLjava/lang/String;)J
.end method

.method private native invite(JLjava/lang/String;)Ljava/lang/Object;
.end method

.method private native inviteAddress(JJ)Ljava/lang/Object;
.end method

.method private native inviteAddressWithParams(JJJ)Ljava/lang/Object;
.end method

.method private native isAdaptiveRateControlEnabled(J)Z
.end method

.method private native isEchoCancellationEnabled(J)Z
.end method

.method private native isEchoLimiterEnabled(J)Z
.end method

.method private native isInCall(J)Z
.end method

.method private native isInComingInvitePending(J)Z
.end method

.method private native isInConference(J)Z
.end method

.method private native isIpv6Enabled(J)Z
.end method

.method private native isKeepAliveEnabled(J)Z
.end method

.method private native isLimeEncryptionAvailable(J)Z
.end method

.method private native isMediaEncryptionMandatory(J)Z
.end method

.method private native isMicMuted(J)Z
.end method

.method private native isNetworkStateReachable(J)Z
.end method

.method private native isPayloadTypeEnabled(JJ)Z
.end method

.method private native isSdp200AckEnabled(J)Z
.end method

.method private native isVCardSupported(J)Z
.end method

.method private isValid()V
    .locals 4

    .prologue
    .line 333
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 334
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "object already destroyed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_0
    return-void
.end method

.method private native isVideoEnabled(J)Z
.end method

.method private native isVideoSupported(J)Z
.end method

.method private native iterate(J)V
.end method

.method private native leaveConference(J)V
.end method

.method private native listAudioPayloadTypes(J)[J
.end method

.method private native listSupportedVideoResolutions(J)[Ljava/lang/String;
.end method

.method private native listVideoPayloadTypes(J)[J
.end method

.method private native mediaEncryptionSupported(JI)Z
.end method

.method private native migrateCallLogs(J)V
.end method

.method private native migrateToMultiTransport(J)I
.end method

.method private native muteMic(JZ)V
.end method

.method private native needsEchoCalibration(J)Z
.end method

.method private native newLinphoneCore(Lorg/linphone/core/LinphoneCoreListener;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)J
.end method

.method private native pauseAllCalls(J)I
.end method

.method private native pauseCall(JJ)I
.end method

.method private native payloadTypeIsVbr(JJ)Z
.end method

.method private native playDtmf(JCI)V
.end method

.method private native publish(JJLjava/lang/String;ILjava/lang/String;Ljava/lang/String;[BLjava/lang/String;)Ljava/lang/Object;
.end method

.method private native refreshRegisters(J)V
.end method

.method private native reloadMsPlugins(JLjava/lang/String;)V
.end method

.method private native reloadSoundDevices(J)V
.end method

.method private native removeAuthInfo(JJ)V
.end method

.method private native removeCallLog(JJ)V
.end method

.method private native removeFriend(JJ)V
.end method

.method private native removeFriendList(JJ)V
.end method

.method private native removeFromConference(JJ)V
.end method

.method private native removeListener(JLorg/linphone/core/LinphoneCoreListener;)V
.end method

.method private native removeProxyConfig(JJ)V
.end method

.method private native resetMissedCallsCount(J)V
.end method

.method private native resumeCall(JJ)I
.end method

.method private native sendDtmf(JC)V
.end method

.method private native sendDtmfs(JLjava/lang/String;)I
.end method

.method private native setAdaptiveRateAlgorithm(JLjava/lang/String;)V
.end method

.method private native setAndroidMulticastLock(JLjava/lang/Object;)V
.end method

.method private static native setAndroidPowerManager(Ljava/lang/Object;)V
.end method

.method private native setAndroidWifiLock(JLjava/lang/Object;)V
.end method

.method private native setAudioCodecs(J[J)V
.end method

.method private native setAudioDscp(JI)V
.end method

.method private native setAudioJittcomp(JI)V
.end method

.method private setAudioModeIncallForGalaxyS()V
    .locals 2

    .prologue
    .line 439
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->contextInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 441
    :goto_0
    return-void

    .line 440
    :cond_0
    iget-object v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setMode(I)V

    goto :goto_0
.end method

.method private native setAudioMulticastAddr(JLjava/lang/String;)I
.end method

.method private native setAudioMulticastTtl(JI)I
.end method

.method private native setAudioPort(JI)V
.end method

.method private native setAudioPortRange(JII)V
.end method

.method private native setCallErrorTone(JILjava/lang/String;)V
.end method

.method private native setCallLogsDatabasePath(JLjava/lang/String;)V
.end method

.method private native setChatDatabasePath(JLjava/lang/String;)V
.end method

.method private native setCpuCountNative(JI)V
.end method

.method private native setDefaultProxyConfig(JJ)V
.end method

.method private native setDefaultSoundDevices(J)V
.end method

.method private native setDeviceRotation(JI)V
.end method

.method private native setDnsServers(J[Ljava/lang/String;)V
.end method

.method private native setDownloadBandwidth(JI)V
.end method

.method private native setDownloadPtime(JI)V
.end method

.method private native setFileTransferServer(JLjava/lang/String;)V
.end method

.method private native setFirewallPolicy(JI)V
.end method

.method private native setFriendsDatabasePath(JLjava/lang/String;)V
.end method

.method private native setHttpProxyHost(JLjava/lang/String;)V
.end method

.method private native setHttpProxyPort(JI)V
.end method

.method private native setInCallTimeout(JI)V
.end method

.method private native setIncomingTimeout(JI)V
.end method

.method private native setLimeEncryption(JI)V
.end method

.method private native setMaxCalls(JI)V
.end method

.method private native setMediaEncryption(JI)V
.end method

.method private native setMediaEncryptionMandatory(JZ)V
.end method

.method private native setMediaNetworkReachable(JZ)V
.end method

.method private native setMicrophoneGain(JF)V
.end method

.method private native setMtu(JI)V
.end method

.method private native setNatPolicy(JJ)V
.end method

.method private native setNetworkStateReachable(JZ)V
.end method

.method private native setNortpTimeout(JI)V
.end method

.method private native setPCCWDoubleRegisterTimeout(JI)V
.end method

.method private native setPayloadTypeBitrate(JJI)V
.end method

.method private native setPayloadTypeNumber(JJI)V
.end method

.method private native setPlayFile(JLjava/lang/String;)V
.end method

.method private native setPlaybackGain(JF)V
.end method

.method private native setPreferredFramerate(JF)V
.end method

.method private native setPreferredVideoSize(JII)V
.end method

.method private native setPreferredVideoSizeByName(JLjava/lang/String;)V
.end method

.method private native setPresenceInfo(JILjava/lang/String;I)V
.end method

.method private native setPresenceModel(JJ)V
.end method

.method private native setPreviewWindowId(JLjava/lang/Object;)V
.end method

.method private native setPrimaryContact(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method private native setPrimaryContact2(JLjava/lang/String;)V
.end method

.method private native setProvisioningUri(JLjava/lang/String;)V
.end method

.method private native setRemoteRingbackTone(JLjava/lang/String;)V
.end method

.method private native setRing(JLjava/lang/String;)V
.end method

.method private native setRingback(JLjava/lang/String;)V
.end method

.method private native setRootCA(JLjava/lang/String;)V
.end method

.method private native setRootCAData(JLjava/lang/String;)V
.end method

.method private native setSignalingTransportPorts(JIII)V
.end method

.method private native setSipDscp(JI)V
.end method

.method private native setSipNetworkReachable(JZ)V
.end method

.method private native setSipTransportTimeout(JI)V
.end method

.method private native setStaticPicture(JLjava/lang/String;)V
.end method

.method private native setStunServer(JLjava/lang/String;)V
.end method

.method private native setTlsCertificate(JLjava/lang/String;)V
.end method

.method private native setTlsCertificatePath(JLjava/lang/String;)V
.end method

.method private native setTlsKey(JLjava/lang/String;)V
.end method

.method private native setTlsKeyPath(JLjava/lang/String;)V
.end method

.method private native setTone(JILjava/lang/String;)V
.end method

.method private native setUploadBandwidth(JI)V
.end method

.method private native setUploadPtime(JI)V
.end method

.method private native setUseRfc2833ForDtmfs(JZ)V
.end method

.method private native setUseSipInfoForDtmfs(JZ)V
.end method

.method private native setUserAgent(JLjava/lang/String;Ljava/lang/String;)V
.end method

.method private native setUserCertificatesPath(JLjava/lang/String;)V
.end method

.method private native setVerifyServerCN(JZ)V
.end method

.method private native setVerifyServerCertificates(JZ)V
.end method

.method private native setVideoCodecs(J[J)V
.end method

.method private native setVideoDevice(JI)I
.end method

.method private native setVideoDscp(JI)V
.end method

.method private native setVideoJittcomp(JI)V
.end method

.method private native setVideoMulticastAddr(JLjava/lang/String;)I
.end method

.method private native setVideoMulticastTtl(JI)I
.end method

.method private native setVideoPolicy(JZZ)V
.end method

.method private native setVideoPort(JI)V
.end method

.method private native setVideoPortRange(JII)V
.end method

.method private native setVideoPreset(JLjava/lang/String;)V
.end method

.method private native setVideoWindowId(JLjava/lang/Object;)V
.end method

.method private native setZrtpSecretsCache(JLjava/lang/String;)V
.end method

.method private native soundResourcesLocked(J)Z
.end method

.method private native startConferenceRecording(JLjava/lang/String;)I
.end method

.method private native startEchoCalibration(JLjava/lang/Object;)I
.end method

.method private native startEchoTester(JI)I
.end method

.method private native startReferedCall(JJJ)Lorg/linphone/core/LinphoneCall;
.end method

.method private native stopConferenceRecording(J)I
.end method

.method private native stopDtmf(J)V
.end method

.method private native stopEchoTester(J)I
.end method

.method private native stopRinging(J)V
.end method

.method private native subscribe(JJLjava/lang/String;ILjava/lang/String;Ljava/lang/String;[BLjava/lang/String;)Ljava/lang/Object;
.end method

.method private native terminateAllCalls(J)V
.end method

.method private native terminateCall(JJ)V
.end method

.method private native terminateConference(J)V
.end method

.method private native transferCall(JJLjava/lang/String;)I
.end method

.method private native transferCallToAnother(JJJ)I
.end method

.method private native tunnelAddServer(JJ)V
.end method

.method private native tunnelAddServerAndMirror(JLjava/lang/String;III)V
.end method

.method private native tunnelAutoDetect(J)V
.end method

.method private native tunnelCleanServers(J)V
.end method

.method private native tunnelDualModeEnabled(J)Z
.end method

.method private native tunnelEnable(JZ)V
.end method

.method private native tunnelEnableDualMode(JZ)V
.end method

.method private native tunnelEnableSip(JZ)V
.end method

.method private native tunnelGetMode(J)I
.end method

.method private final native tunnelGetServers(J)[Lorg/linphone/core/TunnelConfig;
.end method

.method private native tunnelSetHttpProxy(JLjava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
.end method

.method private native tunnelSetMode(JI)V
.end method

.method private native tunnelSipEnabled(J)Z
.end method

.method private native updateCall(JJJ)I
.end method

.method private native uploadLogCollection(J)V
.end method

.method private native upnpAvailable(J)Z
.end method

.method private native usePCCWFallbackRegisterPort(J)Z
.end method

.method private native videoMulticastEnabled(J)Z
.end method


# virtual methods
.method public declared-synchronized acceptCall(Lorg/linphone/core/LinphoneCall;)V
    .locals 4
    .param p1, "aCall"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 308
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 309
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneCallImpl;

    .end local p1    # "aCall":Lorg/linphone/core/LinphoneCall;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneCallImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->acceptCall(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 310
    monitor-exit p0

    return-void

    .line 308
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized acceptCallUpdate(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)V
    .locals 8
    .param p1, "aCall"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "params"    # Lorg/linphone/core/LinphoneCallParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 991
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v4

    invoke-direct {p0, p2}, Lorg/linphone/core/LinphoneCoreImpl;->getCallParamsPtr(Lorg/linphone/core/LinphoneCallParams;)J

    move-result-wide v6

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->acceptCallUpdate(JJJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 992
    monitor-exit p0

    return-void

    .line 991
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized acceptCallWithParams(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)V
    .locals 8
    .param p1, "aCall"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "params"    # Lorg/linphone/core/LinphoneCallParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 984
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v4

    invoke-direct {p0, p2}, Lorg/linphone/core/LinphoneCoreImpl;->getCallParamsPtr(Lorg/linphone/core/LinphoneCallParams;)J

    move-result-wide v6

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->acceptCallWithParams(JJJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 985
    monitor-exit p0

    return-void

    .line 984
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized acceptEarlyMedia(Lorg/linphone/core/LinphoneCall;)Z
    .locals 4
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 1382
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->acceptEarlyMedia(JJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized acceptEarlyMediaWithParams(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)Z
    .locals 8
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "params"    # Lorg/linphone/core/LinphoneCallParams;

    .prologue
    .line 1389
    monitor-enter p0

    if-eqz p2, :cond_0

    :try_start_0
    check-cast p2, Lorg/linphone/core/LinphoneCallParamsImpl;

    .end local p2    # "params":Lorg/linphone/core/LinphoneCallParams;
    iget-wide v6, p2, Lorg/linphone/core/LinphoneCallParamsImpl;->nativePtr:J

    .line 1390
    .local v6, "ptrParams":J
    :goto_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v4

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->acceptEarlyMediaWithParams(JJJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 1389
    .end local v6    # "ptrParams":J
    .restart local p2    # "params":Lorg/linphone/core/LinphoneCallParams;
    :cond_0
    const-wide/16 v6, 0x0

    goto :goto_0

    .end local p2    # "params":Lorg/linphone/core/LinphoneCallParams;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addAllToConference()V
    .locals 2

    .prologue
    .line 814
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->addAllToConference(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 816
    monitor-exit p0

    return-void

    .line 814
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addAuthInfo(Lorg/linphone/core/LinphoneAuthInfo;)V
    .locals 4
    .param p1, "info"    # Lorg/linphone/core/LinphoneAuthInfo;

    .prologue
    .line 236
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 237
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAuthInfoImpl;

    .end local p1    # "info":Lorg/linphone/core/LinphoneAuthInfo;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneAuthInfoImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->addAuthInfo(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 238
    monitor-exit p0

    return-void

    .line 236
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addFriend(Lorg/linphone/core/LinphoneFriend;)V
    .locals 4
    .param p1, "lf"    # Lorg/linphone/core/LinphoneFriend;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 476
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneFriendImpl;

    .end local p1    # "lf":Lorg/linphone/core/LinphoneFriend;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneFriendImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->addFriend(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 477
    monitor-exit p0

    return-void

    .line 476
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addFriendList(Lorg/linphone/core/LinphoneFriendList;)V
    .locals 4
    .param p1, "friendList"    # Lorg/linphone/core/LinphoneFriendList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 486
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneFriendListImpl;

    .end local p1    # "friendList":Lorg/linphone/core/LinphoneFriendList;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneFriendListImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->addFriendList(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 487
    monitor-exit p0

    return-void

    .line 486
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addListener(Lorg/linphone/core/LinphoneCoreListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/linphone/core/LinphoneCoreListener;

    .prologue
    .line 1528
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->addListener(JLorg/linphone/core/LinphoneCoreListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1529
    monitor-exit p0

    return-void

    .line 1528
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V
    .locals 8
    .param p1, "proxyCfg"    # Lorg/linphone/core/LinphoneProxyConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 266
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 267
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v0, p1

    check-cast v0, Lorg/linphone/core/LinphoneProxyConfigImpl;

    move-object v2, v0

    iget-wide v6, v2, Lorg/linphone/core/LinphoneProxyConfigImpl;->nativePtr:J

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v2 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->addProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;JJ)I

    move-result v2

    if-eqz v2, :cond_0

    .line 268
    new-instance v2, Lorg/linphone/core/LinphoneCoreException;

    const-string/jumbo v3, "bad proxy config"

    invoke-direct {v2, v3}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 266
    .end local p1    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 270
    .restart local p1    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    :cond_0
    :try_start_1
    check-cast p1, Lorg/linphone/core/LinphoneProxyConfigImpl;

    .end local p1    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    iput-object p0, p1, Lorg/linphone/core/LinphoneProxyConfigImpl;->mCore:Lorg/linphone/core/LinphoneCoreImpl;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 271
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized addToConference(Lorg/linphone/core/LinphoneCall;)V
    .locals 4
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 819
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->addToConference(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 821
    monitor-exit p0

    return-void

    .line 819
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized adjustSoftwareVolume(I)V
    .locals 0
    .param p1, "i"    # I

    .prologue
    .line 728
    monitor-enter p0

    monitor-exit p0

    return-void
.end method

.method public audioMulticastEnabled()Z
    .locals 2

    .prologue
    .line 1621
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->audioMulticastEnabled(J)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized chatEnabled()Z
    .locals 2

    .prologue
    .line 1445
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->chatEnabled(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearAuthInfos()V
    .locals 2

    .prologue
    .line 279
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 280
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->clearAuthInfos(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    monitor-exit p0

    return-void

    .line 279
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearCallLogs()V
    .locals 2

    .prologue
    .line 376
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->clearCallLogs(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 377
    monitor-exit p0

    return-void

    .line 376
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized clearProxyConfigs()V
    .locals 2

    .prologue
    .line 283
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 284
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->clearProxyConfigs(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 285
    monitor-exit p0

    return-void

    .line 283
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public createCallLog(Lorg/linphone/core/LinphoneAddress;Lorg/linphone/core/LinphoneAddress;Lorg/linphone/core/CallDirection;IJJLorg/linphone/core/LinphoneCallLog$CallStatus;ZF)Lorg/linphone/core/LinphoneCallLog;
    .locals 23
    .param p1, "from"    # Lorg/linphone/core/LinphoneAddress;
    .param p2, "to"    # Lorg/linphone/core/LinphoneAddress;
    .param p3, "dir"    # Lorg/linphone/core/CallDirection;
    .param p4, "duration"    # I
    .param p5, "start"    # J
    .param p7, "connected"    # J
    .param p9, "status"    # Lorg/linphone/core/LinphoneCallLog$CallStatus;
    .param p10, "videoEnabled"    # Z
    .param p11, "quality"    # F

    .prologue
    .line 1860
    move-object/from16 v0, p0

    iget-wide v4, v0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "from":Lorg/linphone/core/LinphoneAddress;
    move-object/from16 v0, p1

    iget-wide v6, v0, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    check-cast p2, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p2    # "to":Lorg/linphone/core/LinphoneAddress;
    move-object/from16 v0, p2

    iget-wide v8, v0, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    sget-object v3, Lorg/linphone/core/CallDirection;->Incoming:Lorg/linphone/core/CallDirection;

    move-object/from16 v0, p3

    if-ne v0, v3, :cond_0

    const/4 v10, 0x1

    :goto_0
    invoke-virtual/range {p9 .. p9}, Lorg/linphone/core/LinphoneCallLog$CallStatus;->toInt()I

    move-result v16

    move-object/from16 v3, p0

    move/from16 v11, p4

    move-wide/from16 v12, p5

    move-wide/from16 v14, p7

    move/from16 v17, p10

    move/from16 v18, p11

    invoke-direct/range {v3 .. v18}, Lorg/linphone/core/LinphoneCoreImpl;->createCallLog(JJJIIJJIZF)J

    move-result-wide v20

    .line 1861
    .local v20, "logPtr":J
    new-instance v2, Lorg/linphone/core/LinphoneCallLogImpl;

    move-wide/from16 v0, v20

    invoke-direct {v2, v0, v1}, Lorg/linphone/core/LinphoneCallLogImpl;-><init>(J)V

    .line 1862
    .local v2, "log":Lorg/linphone/core/LinphoneCallLog;
    return-object v2

    .line 1860
    .end local v2    # "log":Lorg/linphone/core/LinphoneCallLog;
    .end local v20    # "logPtr":J
    :cond_0
    const/4 v10, 0x0

    goto :goto_0
.end method

.method public createCallParams(Lorg/linphone/core/LinphoneCall;)Lorg/linphone/core/LinphoneCallParams;
    .locals 6
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 1660
    const-wide/16 v0, 0x0

    .line 1661
    .local v0, "callptr":J
    if-eqz p1, :cond_0

    check-cast p1, Lorg/linphone/core/LinphoneCallImpl;

    .end local p1    # "call":Lorg/linphone/core/LinphoneCall;
    iget-wide v0, p1, Lorg/linphone/core/LinphoneCallImpl;->nativePtr:J

    .line 1662
    :cond_0
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v4, v5, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->createCallParams(JJ)J

    move-result-wide v2

    .line 1663
    .local v2, "ptr":J
    new-instance v4, Lorg/linphone/core/LinphoneCallParamsImpl;

    invoke-direct {v4, v2, v3}, Lorg/linphone/core/LinphoneCallParamsImpl;-><init>(J)V

    return-object v4
.end method

.method public declared-synchronized createConference(Lorg/linphone/core/LinphoneConferenceParams;)Lorg/linphone/core/LinphoneConference;
    .locals 2
    .param p1, "params"    # Lorg/linphone/core/LinphoneConferenceParams;

    .prologue
    .line 789
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->createConference(JLorg/linphone/core/LinphoneConferenceParams;)Lorg/linphone/core/LinphoneConference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public createFriend()Lorg/linphone/core/LinphoneFriend;
    .locals 2

    .prologue
    .line 1850
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->createFriend(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneFriend;

    return-object v0
.end method

.method public createFriendWithAddress(Ljava/lang/String;)Lorg/linphone/core/LinphoneFriend;
    .locals 2
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 1854
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->createFriendWithAddress(JLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneFriend;

    return-object v0
.end method

.method public declared-synchronized createInfoMessage()Lorg/linphone/core/LinphoneInfoMessage;
    .locals 4

    .prologue
    .line 1258
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/linphone/core/LinphoneInfoMessageImpl;

    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->createInfoMessage(J)J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Lorg/linphone/core/LinphoneInfoMessageImpl;-><init>(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createLinphoneFriendList()Lorg/linphone/core/LinphoneFriendList;
    .locals 1

    .prologue
    .line 481
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/linphone/core/LinphoneFriendListImpl;

    invoke-direct {v0, p0}, Lorg/linphone/core/LinphoneFriendListImpl;-><init>(Lorg/linphone/core/LinphoneCoreImpl;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createLocalPlayer(Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;)Lorg/linphone/core/LinphonePlayer;
    .locals 4
    .param p1, "window"    # Lorg/linphone/mediastream/video/AndroidVideoWindowImpl;

    .prologue
    .line 1517
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3, p1}, Lorg/linphone/core/LinphoneCoreImpl;->createLocalPlayer(JLorg/linphone/mediastream/video/AndroidVideoWindowImpl;)J

    move-result-wide v0

    .line 1518
    .local v0, "playerPtr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 1519
    new-instance v2, Lorg/linphone/core/LinphonePlayerImpl;

    invoke-direct {v2, v0, v1}, Lorg/linphone/core/LinphonePlayerImpl;-><init>(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1521
    :goto_0
    monitor-exit p0

    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 1517
    .end local v0    # "playerPtr":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized createNatPolicy()Lorg/linphone/core/LinphoneNatPolicy;
    .locals 2

    .prologue
    .line 557
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->createNatPolicy(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneNatPolicy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;
    .locals 1

    .prologue
    .line 1394
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/linphone/core/LinphoneProxyConfigImpl;

    invoke-direct {v0, p0}, Lorg/linphone/core/LinphoneProxyConfigImpl;-><init>(Lorg/linphone/core/LinphoneCoreImpl;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createProxyConfig(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/linphone/core/LinphoneProxyConfig;
    .locals 7
    .param p1, "identity"    # Ljava/lang/String;
    .param p2, "proxy"    # Ljava/lang/String;
    .param p3, "route"    # Ljava/lang/String;
    .param p4, "enableRegister"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 1398
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1400
    :try_start_1
    new-instance v0, Lorg/linphone/core/LinphoneProxyConfigImpl;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/linphone/core/LinphoneProxyConfigImpl;-><init>(Lorg/linphone/core/LinphoneCoreImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_1
    .catch Lorg/linphone/core/LinphoneCoreException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1402
    :goto_0
    monitor-exit p0

    return-object v0

    .line 1401
    :catch_0
    move-exception v6

    .line 1402
    .local v6, "e":Lorg/linphone/core/LinphoneCoreException;
    const/4 v0, 0x0

    goto :goto_0

    .line 1398
    .end local v6    # "e":Lorg/linphone/core/LinphoneCoreException;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createPublish(Lorg/linphone/core/LinphoneAddress;Ljava/lang/String;I)Lorg/linphone/core/LinphoneEvent;
    .locals 8
    .param p1, "resource"    # Lorg/linphone/core/LinphoneAddress;
    .param p2, "event"    # Ljava/lang/String;
    .param p3, "expires"    # I

    .prologue
    .line 1288
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "resource":Lorg/linphone/core/LinphoneAddress;
    iget-wide v4, p1, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    move-object v1, p0

    move-object v6, p2

    move v7, p3

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->createPublish(JJLjava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized createSubscribe(Lorg/linphone/core/LinphoneAddress;Ljava/lang/String;I)Lorg/linphone/core/LinphoneEvent;
    .locals 8
    .param p1, "resource"    # Lorg/linphone/core/LinphoneAddress;
    .param p2, "event"    # Ljava/lang/String;
    .param p3, "expires"    # I

    .prologue
    .line 1282
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "resource":Lorg/linphone/core/LinphoneAddress;
    iget-wide v4, p1, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    move-object v1, p0

    move-object v6, p2

    move v7, p3

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->createSubscribe(JJLjava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized declineCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/Reason;)V
    .locals 7
    .param p1, "aCall"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "reason"    # Lorg/linphone/core/Reason;

    .prologue
    .line 1187
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneCallImpl;

    .end local p1    # "aCall":Lorg/linphone/core/LinphoneCall;
    iget-wide v4, p1, Lorg/linphone/core/LinphoneCallImpl;->nativePtr:J

    iget v6, p2, Lorg/linphone/core/Reason;->mValue:I

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;->declineCall(JJI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1188
    monitor-exit p0

    return-void

    .line 1187
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized deferCallUpdate(Lorg/linphone/core/LinphoneCall;)V
    .locals 4
    .param p1, "aCall"    # Lorg/linphone/core/LinphoneCall;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 998
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->deferCallUpdate(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 999
    monitor-exit p0

    return-void

    .line 998
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized destroy()V
    .locals 2

    .prologue
    .line 327
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->delete(J)V

    .line 328
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/linphone/core/LinphoneCoreImpl;->setAndroidPowerManager(Ljava/lang/Object;)V

    .line 329
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 330
    monitor-exit p0

    return-void

    .line 327
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized disableChat(Lorg/linphone/core/Reason;)V
    .locals 3
    .param p1, "denycode"    # Lorg/linphone/core/Reason;

    .prologue
    .line 1435
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v2, p1, Lorg/linphone/core/Reason;->mValue:I

    invoke-direct {p0, v0, v1, v2}, Lorg/linphone/core/LinphoneCoreImpl;->disableChat(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1436
    monitor-exit p0

    return-void

    .line 1435
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public dnsSrvEnabled()Z
    .locals 2

    .prologue
    .line 1643
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->dnsSrvEnabled(J)Z

    move-result v0

    return v0
.end method

.method public downloadOpenH264Enabled()Z
    .locals 1

    .prologue
    .line 1846
    iget-boolean v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->openh264DownloadEnabled:Z

    return v0
.end method

.method public declared-synchronized enableAdaptiveRateControl(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 1476
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableAdaptiveRateControl(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1478
    monitor-exit p0

    return-void

    .line 1476
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public enableAudioMulticast(Z)V
    .locals 2
    .param p1, "yesno"    # Z

    .prologue
    .line 1616
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableAudioMulticast(JZ)V

    .line 1617
    return-void
.end method

.method public declared-synchronized enableChat()V
    .locals 2

    .prologue
    .line 1440
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->enableChat(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1441
    monitor-exit p0

    return-void

    .line 1440
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public enableDnsSrv(Z)V
    .locals 2
    .param p1, "yesno"    # Z

    .prologue
    .line 1638
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableDnsSrv(JZ)V

    .line 1639
    return-void
.end method

.method public enableDownloadOpenH264(Z)V
    .locals 0
    .param p1, "enable"    # Z

    .prologue
    .line 1842
    iput-boolean p1, p0, Lorg/linphone/core/LinphoneCoreImpl;->openh264DownloadEnabled:Z

    .line 1843
    return-void
.end method

.method public declared-synchronized enableEchoCancellation(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 409
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 410
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableEchoCancellation(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 411
    monitor-exit p0

    return-void

    .line 409
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized enableEchoLimiter(Z)V
    .locals 2
    .param p1, "val"    # Z

    .prologue
    .line 751
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableEchoLimiter(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 752
    monitor-exit p0

    return-void

    .line 751
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized enableIpv6(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 721
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableIpv6(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 722
    monitor-exit p0

    return-void

    .line 721
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized enableKeepAlive(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 689
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableKeepAlive(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 691
    monitor-exit p0

    return-void

    .line 689
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public enablePCCWFallbackRegisterPort(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 1348
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enablePCCWFallbackRegisterPort(JZ)V

    .line 1349
    return-void
.end method

.method public declared-synchronized enablePayloadType(Lorg/linphone/core/PayloadType;Z)V
    .locals 9
    .param p1, "pt"    # Lorg/linphone/core/PayloadType;
    .param p2, "enable"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 392
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 393
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v0, p1

    check-cast v0, Lorg/linphone/core/PayloadTypeImpl;

    move-object v2, v0

    iget-wide v6, v2, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    move-object v3, p0

    move v8, p2

    invoke-direct/range {v3 .. v8}, Lorg/linphone/core/LinphoneCoreImpl;->enablePayloadType(JJZ)I

    move-result v2

    if-eqz v2, :cond_0

    .line 394
    new-instance v2, Lorg/linphone/core/LinphoneCoreException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "cannot enable payload type ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 392
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 397
    :cond_0
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized enableSdp200Ack(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 1421
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableSdp200Ack(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1422
    monitor-exit p0

    return-void

    .line 1421
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public enableSpeaker(Z)V
    .locals 5
    .param p1, "value"    # Z

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 450
    if-nez p1, :cond_0

    iget-boolean v3, p0, Lorg/linphone/core/LinphoneCoreImpl;->mSpeakerphoneAlwaysOn:Z

    if-eqz v3, :cond_1

    :cond_0
    move p1, v2

    .line 451
    :goto_0
    invoke-virtual {p0}, Lorg/linphone/core/LinphoneCoreImpl;->getCurrentCall()Lorg/linphone/core/LinphoneCall;

    move-result-object v0

    .line 452
    .local v0, "call":Lorg/linphone/core/LinphoneCall;
    iput-boolean p1, p0, Lorg/linphone/core/LinphoneCoreImpl;->mSpeakerEnabled:Z

    .line 453
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->applyAudioHacks()V

    .line 454
    if-eqz v0, :cond_2

    invoke-interface {v0}, Lorg/linphone/core/LinphoneCall;->getState()Lorg/linphone/core/LinphoneCall$State;

    move-result-object v3

    sget-object v4, Lorg/linphone/core/LinphoneCall$State;->StreamsRunning:Lorg/linphone/core/LinphoneCall$State;

    if-ne v3, v4, :cond_2

    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/Hacks;->needGalaxySAudioHack()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 455
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const-string/jumbo v4, "Hack to have speaker="

    aput-object v4, v3, v1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v3, v2

    const/4 v1, 0x2

    const-string/jumbo v2, " while on call"

    aput-object v2, v3, v1

    invoke-static {v3}, Lorg/linphone/mediastream/Log;->d([Ljava/lang/Object;)V

    .line 456
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3, p1}, Lorg/linphone/core/LinphoneCoreImpl;->forceSpeakerState(JZ)V

    .line 460
    :goto_1
    return-void

    .end local v0    # "call":Lorg/linphone/core/LinphoneCall;
    :cond_1
    move p1, v1

    .line 450
    goto :goto_0

    .line 458
    .restart local v0    # "call":Lorg/linphone/core/LinphoneCall;
    :cond_2
    invoke-virtual {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->routeAudioToSpeakerHelper(Z)V

    goto :goto_1
.end method

.method public declared-synchronized enableVideo(ZZ)V
    .locals 2
    .param p1, "vcap_enabled"    # Z
    .param p2, "display_enabled"    # Z

    .prologue
    .line 539
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;->enableVideo(JZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 540
    monitor-exit p0

    return-void

    .line 539
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public enableVideoMulticast(Z)V
    .locals 2
    .param p1, "yesno"    # Z

    .prologue
    .line 1627
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->enableVideoMulticast(JZ)V

    .line 1628
    return-void
.end method

.method public declared-synchronized enterConference()Z
    .locals 2

    .prologue
    .line 771
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->enterConference(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected finalize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 213
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/linphone/core/LinphoneCoreImpl;->destroy()V

    .line 214
    :cond_0
    return-void
.end method

.method public declared-synchronized findAuthInfo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/linphone/core/LinphoneAuthInfo;
    .locals 10
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "realm"    # Ljava/lang/String;
    .param p3, "domain"    # Ljava/lang/String;

    .prologue
    .line 1329
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;->findAuthInfos(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v8

    .line 1330
    .local v8, "ptr":J
    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-nez v0, :cond_0

    .line 1331
    const/4 v0, 0x0

    .line 1333
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Lorg/linphone/core/LinphoneAuthInfoImpl;

    invoke-direct {v0, v8, v9}, Lorg/linphone/core/LinphoneAuthInfoImpl;-><init>(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1329
    .end local v8    # "ptr":J
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized findCallFromUri(Ljava/lang/String;)Lorg/linphone/core/LinphoneCall;
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 848
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->findCallFromUri(JLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneCall;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized findContactsByChar(Ljava/lang/String;Z)[Lorg/linphone/core/LinphoneAddress;
    .locals 2
    .param p1, "filter"    # Ljava/lang/String;
    .param p2, "sipOnly"    # Z

    .prologue
    .line 504
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;->findContactsByChar(JLjava/lang/String;Z)[Lorg/linphone/core/LinphoneAddress;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized findFriendByAddress(Ljava/lang/String;)Lorg/linphone/core/LinphoneFriend;
    .locals 2
    .param p1, "sipUri"    # Ljava/lang/String;

    .prologue
    .line 1082
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getFriendByAddress(JLjava/lang/String;)Lorg/linphone/core/LinphoneFriend;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized findPayloadType(Ljava/lang/String;)Lorg/linphone/core/PayloadType;
    .locals 1
    .param p1, "mime"    # Ljava/lang/String;

    .prologue
    .line 1217
    monitor-enter p0

    :try_start_0
    sget v0, Lorg/linphone/core/LinphoneCoreImpl;->FIND_PAYLOAD_IGNORE_RATE:I

    invoke-virtual {p0, p1, v0}, Lorg/linphone/core/LinphoneCoreImpl;->findPayloadType(Ljava/lang/String;I)Lorg/linphone/core/PayloadType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized findPayloadType(Ljava/lang/String;I)Lorg/linphone/core/PayloadType;
    .locals 1
    .param p1, "mime"    # Ljava/lang/String;
    .param p2, "clockRate"    # I

    .prologue
    .line 1070
    monitor-enter p0

    :try_start_0
    sget v0, Lorg/linphone/core/LinphoneCoreImpl;->FIND_PAYLOAD_IGNORE_CHANNELS:I

    invoke-virtual {p0, p1, p2, v0}, Lorg/linphone/core/LinphoneCoreImpl;->findPayloadType(Ljava/lang/String;II)Lorg/linphone/core/PayloadType;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized findPayloadType(Ljava/lang/String;II)Lorg/linphone/core/PayloadType;
    .locals 10
    .param p1, "mime"    # Ljava/lang/String;
    .param p2, "clockRate"    # I
    .param p3, "channels"    # I

    .prologue
    .line 382
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 383
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;->findPayloadType(JLjava/lang/String;II)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v8

    .line 384
    .local v8, "playLoadType":J
    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-nez v0, :cond_0

    .line 385
    const/4 v0, 0x0

    .line 387
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Lorg/linphone/core/PayloadTypeImpl;

    invoke-direct {v0, v8, v9}, Lorg/linphone/core/PayloadTypeImpl;-><init>(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 382
    .end local v8    # "playLoadType":J
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAdaptiveRateAlgorithm()Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;
    .locals 2

    .prologue
    .line 1484
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getAdaptiveRateAlgorithm(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->fromString(Ljava/lang/String;)Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAudioCodecs()[Lorg/linphone/core/PayloadType;
    .locals 6

    .prologue
    .line 666
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v4, v5}, Lorg/linphone/core/LinphoneCoreImpl;->listAudioPayloadTypes(J)[J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 667
    .local v2, "typesPtr":[J
    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 675
    :cond_0
    monitor-exit p0

    return-object v0

    .line 669
    :cond_1
    :try_start_1
    array-length v3, v2

    new-array v0, v3, [Lorg/linphone/core/PayloadType;

    .line 671
    .local v0, "codecs":[Lorg/linphone/core/PayloadType;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 672
    new-instance v3, Lorg/linphone/core/PayloadTypeImpl;

    aget-wide v4, v2, v1

    invoke-direct {v3, v4, v5}, Lorg/linphone/core/PayloadTypeImpl;-><init>(J)V

    aput-object v3, v0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 671
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 666
    .end local v0    # "codecs":[Lorg/linphone/core/PayloadType;
    .end local v1    # "i":I
    .end local v2    # "typesPtr":[J
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getAudioDscp()I
    .locals 2

    .prologue
    .line 1240
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getAudioDscp(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getAudioMulticastAddr()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1583
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getAudioMulticastAddr(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAudioMulticastTtl()I
    .locals 2

    .prologue
    .line 1606
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getAudioMulticastTtl(J)I

    move-result v0

    return v0
.end method

.method public declared-synchronized getAuthInfosList()[Lorg/linphone/core/LinphoneAuthInfo;
    .locals 6

    .prologue
    .line 1316
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v4, v5}, Lorg/linphone/core/LinphoneCoreImpl;->getAuthInfosList(J)[J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 1317
    .local v2, "typesPtr":[J
    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 1325
    :cond_0
    monitor-exit p0

    return-object v0

    .line 1319
    :cond_1
    :try_start_1
    array-length v3, v2

    new-array v0, v3, [Lorg/linphone/core/LinphoneAuthInfo;

    .line 1321
    .local v0, "authInfos":[Lorg/linphone/core/LinphoneAuthInfo;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 1322
    new-instance v3, Lorg/linphone/core/LinphoneAuthInfoImpl;

    aget-wide v4, v2, v1

    invoke-direct {v3, v4, v5}, Lorg/linphone/core/LinphoneAuthInfoImpl;-><init>(J)V

    aput-object v3, v0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1321
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1316
    .end local v0    # "authInfos":[Lorg/linphone/core/LinphoneAuthInfo;
    .end local v1    # "i":I
    .end local v2    # "typesPtr":[J
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getCallLogs()[Lorg/linphone/core/LinphoneCallLog;
    .locals 6

    .prologue
    .line 312
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v4, v5}, Lorg/linphone/core/LinphoneCoreImpl;->getCallLogs(J)[J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 313
    .local v2, "typesPtr":[J
    if-nez v2, :cond_1

    const/4 v1, 0x0

    .line 319
    :cond_0
    monitor-exit p0

    return-object v1

    .line 314
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 315
    array-length v3, v2

    new-array v1, v3, [Lorg/linphone/core/LinphoneCallLog;

    .line 316
    .local v1, "logs":[Lorg/linphone/core/LinphoneCallLog;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 317
    new-instance v3, Lorg/linphone/core/LinphoneCallLogImpl;

    aget-wide v4, v2, v0

    invoke-direct {v3, v4, v5}, Lorg/linphone/core/LinphoneCallLogImpl;-><init>(J)V

    aput-object v3, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 316
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 312
    .end local v0    # "i":I
    .end local v1    # "logs":[Lorg/linphone/core/LinphoneCallLog;
    .end local v2    # "typesPtr":[J
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getCalls()[Lorg/linphone/core/LinphoneCall;
    .locals 6

    .prologue
    .line 805
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v4, v5}, Lorg/linphone/core/LinphoneCoreImpl;->getCallsNb(J)I

    move-result v2

    .line 806
    .local v2, "size":I
    new-array v0, v2, [Lorg/linphone/core/LinphoneCall;

    .line 807
    .local v0, "calls":[Lorg/linphone/core/LinphoneCall;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 808
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v4, v5, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getCall(JI)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/linphone/core/LinphoneCall;

    aput-object v3, v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 807
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 810
    :cond_0
    monitor-exit p0

    return-object v0

    .line 805
    .end local v0    # "calls":[Lorg/linphone/core/LinphoneCall;
    .end local v1    # "i":I
    .end local v2    # "size":I
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getCallsNb()I
    .locals 2

    .prologue
    .line 797
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallsNb(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getChatRoom(Lorg/linphone/core/LinphoneAddress;)Lorg/linphone/core/LinphoneChatRoom;
    .locals 4
    .param p1, "to"    # Lorg/linphone/core/LinphoneAddress;

    .prologue
    .line 526
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "to":Lorg/linphone/core/LinphoneAddress;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->getChatRoom(JJ)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneChatRoom;

    check-cast v0, Lorg/linphone/core/LinphoneChatRoom;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getChatRooms()[Lorg/linphone/core/LinphoneChatRoom;
    .locals 6

    .prologue
    .line 1304
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v4, v5}, Lorg/linphone/core/LinphoneCoreImpl;->getChatRooms(J)[Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 1305
    .local v2, "typesPtr":[Ljava/lang/Object;
    if-nez v2, :cond_1

    const/4 v1, 0x0

    .line 1313
    :cond_0
    monitor-exit p0

    return-object v1

    .line 1307
    :cond_1
    :try_start_1
    array-length v3, v2

    new-array v1, v3, [Lorg/linphone/core/LinphoneChatRoom;

    .line 1309
    .local v1, "proxies":[Lorg/linphone/core/LinphoneChatRoom;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 1310
    aget-object v3, v2, v0

    check-cast v3, Lorg/linphone/core/LinphoneChatRoom;

    check-cast v3, Lorg/linphone/core/LinphoneChatRoom;

    aput-object v3, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1309
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1304
    .end local v0    # "i":I
    .end local v1    # "proxies":[Lorg/linphone/core/LinphoneChatRoom;
    .end local v2    # "typesPtr":[Ljava/lang/Object;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getConference()Lorg/linphone/core/LinphoneConference;
    .locals 2

    .prologue
    .line 793
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getConference(J)Lorg/linphone/core/LinphoneConference;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getConferenceSize()I
    .locals 2

    .prologue
    .line 785
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getConferenceSize(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getConfig()Lorg/linphone/core/LpConfig;
    .locals 4

    .prologue
    .line 1166
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->getConfig(J)J

    move-result-wide v0

    .line 1167
    .local v0, "configPtr":J
    new-instance v2, Lorg/linphone/core/LpConfigImpl;

    invoke-direct {v2, v0, v1}, Lorg/linphone/core/LpConfigImpl;-><init>(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    .line 1166
    .end local v0    # "configPtr":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public declared-synchronized getCurrentCall()Lorg/linphone/core/LinphoneCall;
    .locals 2

    .prologue
    .line 419
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 420
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getCurrentCall(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneCall;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 419
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;
    .locals 2

    .prologue
    .line 246
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 247
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getDefaultProxyConfig(J)Lorg/linphone/core/LinphoneProxyConfig;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 246
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDownloadBandwidth()I
    .locals 2

    .prologue
    .line 600
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getDownloadBandwidth(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFileTransferServer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1511
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getFileTransferServer(J)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFirewallPolicy()Lorg/linphone/core/LinphoneCore$FirewallPolicy;
    .locals 2

    .prologue
    .line 551
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getFirewallPolicy(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneCore$FirewallPolicy;->fromInt(I)Lorg/linphone/core/LinphoneCore$FirewallPolicy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFriendList()[Lorg/linphone/core/LinphoneFriend;
    .locals 2

    .prologue
    .line 494
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getFriendList(J)[Lorg/linphone/core/LinphoneFriend;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFriendLists()[Lorg/linphone/core/LinphoneFriendList;
    .locals 2

    .prologue
    .line 499
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getFriendLists(J)[Lorg/linphone/core/LinphoneFriendList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getGlobalState()Lorg/linphone/core/LinphoneCore$GlobalState;
    .locals 2

    .prologue
    .line 1678
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getGlobalState(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneCore$GlobalState;->fromInt(I)Lorg/linphone/core/LinphoneCore$GlobalState;

    move-result-object v0

    return-object v0
.end method

.method public getHttpProxyHost()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1695
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getHttpProxyHost(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHttpProxyPort()I
    .locals 2

    .prologue
    .line 1701
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getHttpProxyPort(J)I

    move-result v0

    return v0
.end method

.method public declared-synchronized getInCallTimeout()I
    .locals 2

    .prologue
    .line 1116
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getInCallTimeout(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getIncomingTimeout()I
    .locals 2

    .prologue
    .line 1106
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getIncomingTimeout(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLastOutgoingCallLog()Lorg/linphone/core/LinphoneCallLog;
    .locals 4

    .prologue
    .line 322
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 323
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->getLastOutgoingCallLog(J)J

    move-result-wide v0

    .line 324
    .local v0, "callLog":J
    new-instance v2, Lorg/linphone/core/LinphoneCallLogImpl;

    invoke-direct {v2, v0, v1}, Lorg/linphone/core/LinphoneCallLogImpl;-><init>(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    .line 322
    .end local v0    # "callLog":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getLimeEncryption()Lorg/linphone/core/LinphoneCore$LinphoneLimeState;
    .locals 2

    .prologue
    .line 1778
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getLimeEncryption(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneCore$LinphoneLimeState;->fromInt(I)Lorg/linphone/core/LinphoneCore$LinphoneLimeState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMSFactory()Lorg/linphone/mediastream/Factory;
    .locals 2

    .prologue
    .line 1740
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getMSFactory(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/mediastream/Factory;

    return-object v0
.end method

.method public declared-synchronized getMaxCalls()I
    .locals 2

    .prologue
    .line 866
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getMaxCalls(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMediaEncryption()Lorg/linphone/core/LinphoneCore$MediaEncryption;
    .locals 2

    .prologue
    .line 852
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getMediaEncryption(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneCore$MediaEncryption;->fromInt(I)Lorg/linphone/core/LinphoneCore$MediaEncryption;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMissedCallsCount()I
    .locals 2

    .prologue
    .line 1032
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getMissedCallsCount(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getMtu()I
    .locals 2

    .prologue
    .line 1417
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getMtu(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getNatPolicy()Lorg/linphone/core/LinphoneNatPolicy;
    .locals 2

    .prologue
    .line 563
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getNatPolicy(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneNatPolicy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getNortpTimeout()I
    .locals 2

    .prologue
    .line 1723
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getNortpTimeout(J)I

    move-result v0

    return v0
.end method

.method public declared-synchronized getOrCreateChatRoom(Ljava/lang/String;)Lorg/linphone/core/LinphoneChatRoom;
    .locals 2
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 523
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getOrCreateChatRoom(JLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneChatRoom;

    check-cast v0, Lorg/linphone/core/LinphoneChatRoom;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getPCCWDoubleRegisterTimeout()I
    .locals 2

    .prologue
    .line 1343
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getPCCWDoubleRegisterTimeout(J)I

    move-result v0

    return v0
.end method

.method public declared-synchronized getPayloadTypeBitrate(Lorg/linphone/core/PayloadType;)I
    .locals 4
    .param p1, "pt"    # Lorg/linphone/core/PayloadType;

    .prologue
    .line 1460
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/PayloadTypeImpl;

    .end local p1    # "pt":Lorg/linphone/core/PayloadType;
    iget-wide v2, p1, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->getPayloadTypeBitrate(JJ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPayloadTypeNumber(Lorg/linphone/core/PayloadType;)I
    .locals 4
    .param p1, "pt"    # Lorg/linphone/core/PayloadType;

    .prologue
    .line 1471
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/PayloadTypeImpl;

    .end local p1    # "pt":Lorg/linphone/core/PayloadType;
    iget-wide v2, p1, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->getPayloadTypeNumber(JJ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getPlayLevel()I
    .locals 1

    .prologue
    .line 425
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized getPlaybackGain()F
    .locals 2

    .prologue
    .line 345
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getPlaybackGain(J)F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getPreferredFramerate()F
    .locals 2

    .prologue
    .line 1564
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getPreferredFramerate(J)F

    move-result v0

    return v0
.end method

.method public declared-synchronized getPreferredVideoSize()Lorg/linphone/core/VideoSize;
    .locals 4

    .prologue
    .line 616
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->getPreferredVideoSize(J)[I

    move-result-object v0

    .line 618
    .local v0, "nativeSize":[I
    new-instance v1, Lorg/linphone/core/VideoSize;

    invoke-direct {v1}, Lorg/linphone/core/VideoSize;-><init>()V

    .line 619
    .local v1, "vSize":Lorg/linphone/core/VideoSize;
    const/4 v2, 0x0

    aget v2, v0, v2

    iput v2, v1, Lorg/linphone/core/VideoSize;->width:I

    .line 620
    const/4 v2, 0x1

    aget v2, v0, v2

    iput v2, v1, Lorg/linphone/core/VideoSize;->height:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 621
    monitor-exit p0

    return-object v1

    .line 616
    .end local v0    # "nativeSize":[I
    .end local v1    # "vSize":Lorg/linphone/core/VideoSize;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getPresenceInfo()Lorg/linphone/core/OnlineStatus;
    .locals 2

    .prologue
    .line 514
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getPresenceInfo(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/OnlineStatus;->fromInt(I)Lorg/linphone/core/OnlineStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPresenceModel()Lorg/linphone/core/PresenceModel;
    .locals 2

    .prologue
    .line 520
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getPresenceModel(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/PresenceModel;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPrimaryContact()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1129
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getPrimaryContact(J)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPrimaryContactDisplayName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1141
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getPrimaryContactDisplayName(J)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getPrimaryContactUsername()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1137
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getPrimaryContactUsername(J)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getProvisioningUri()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1674
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getProvisioningUri(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getProxyConfigList()[Lorg/linphone/core/LinphoneProxyConfig;
    .locals 2

    .prologue
    .line 643
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getProxyConfigList(J)[Lorg/linphone/core/LinphoneProxyConfig;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getRemoteAddress()Lorg/linphone/core/LinphoneAddress;
    .locals 4

    .prologue
    .line 291
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 292
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->getRemoteAddress(J)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 293
    .local v0, "ptr":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 294
    const/4 v2, 0x0

    .line 296
    :goto_0
    monitor-exit p0

    return-object v2

    :cond_0
    :try_start_1
    new-instance v2, Lorg/linphone/core/LinphoneAddressImpl;

    sget-object v3, Lorg/linphone/core/LinphoneAddressImpl$WrapMode;->FromConst:Lorg/linphone/core/LinphoneAddressImpl$WrapMode;

    invoke-direct {v2, v0, v1, v3}, Lorg/linphone/core/LinphoneAddressImpl;-><init>(JLorg/linphone/core/LinphoneAddressImpl$WrapMode;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 291
    .end local v0    # "ptr":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public getRemoteRingbackTone()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1544
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getRemoteRingbackTone(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getRing()Ljava/lang/String;
    .locals 2

    .prologue
    .line 627
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getRing(J)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSignalingTransportPorts()Lorg/linphone/core/LinphoneCore$Transports;
    .locals 4

    .prologue
    .line 708
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/linphone/core/LinphoneCore$Transports;

    invoke-direct {v0}, Lorg/linphone/core/LinphoneCore$Transports;-><init>()V

    .line 709
    .local v0, "transports":Lorg/linphone/core/LinphoneCore$Transports;
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    const/4 v1, 0x0

    invoke-direct {p0, v2, v3, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getSignalingTransportPort(JI)I

    move-result v1

    iput v1, v0, Lorg/linphone/core/LinphoneCore$Transports;->udp:I

    .line 710
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    const/4 v1, 0x1

    invoke-direct {p0, v2, v3, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getSignalingTransportPort(JI)I

    move-result v1

    iput v1, v0, Lorg/linphone/core/LinphoneCore$Transports;->tcp:I

    .line 711
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    const/4 v1, 0x3

    invoke-direct {p0, v2, v3, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getSignalingTransportPort(JI)I

    move-result v1

    iput v1, v0, Lorg/linphone/core/LinphoneCore$Transports;->tls:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 714
    monitor-exit p0

    return-object v0

    .line 708
    .end local v0    # "transports":Lorg/linphone/core/LinphoneCore$Transports;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getSipDscp()I
    .locals 2

    .prologue
    .line 1229
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getSipDscp(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getSipTransportTimeout()I
    .locals 2

    .prologue
    .line 1712
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getSipTransportTimeout(J)I

    move-result v0

    return v0
.end method

.method public declared-synchronized getStunServer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 566
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getStunServer(J)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getSupportedVideoSizes()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 1366
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->listSupportedVideoResolutions(J)[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getTlsCertificate()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1784
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getTlsCertificate(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTlsCertificatePath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1796
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getTlsCertificatePath(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTlsKey()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1790
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getTlsKey(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTlsKeyPath()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1802
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getTlsKeyPath(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getUploadBandwidth()I
    .locals 2

    .prologue
    .line 592
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getUploadBandwidth(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUpnpExternalIpaddress()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1202
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getUpnpExternalIpaddress(J)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUpnpState()Lorg/linphone/core/LinphoneCore$UpnpState;
    .locals 2

    .prologue
    .line 1197
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getUpnpState(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneCore$UpnpState;->fromInt(I)Lorg/linphone/core/LinphoneCore$UpnpState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUseRfc2833ForDtmfs()Z
    .locals 2

    .prologue
    .line 1161
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getUseRfc2833ForDtmfs(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUseSipInfoForDtmfs()Z
    .locals 2

    .prologue
    .line 1151
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getUseSipInfoForDtmfs(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1058
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getVersion(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getVideoAutoAcceptPolicy()Z
    .locals 2

    .prologue
    .line 1012
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getVideoAutoAcceptPolicy(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getVideoAutoInitiatePolicy()Z
    .locals 2

    .prologue
    .line 1008
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getVideoAutoInitiatePolicy(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getVideoCodecs()[Lorg/linphone/core/PayloadType;
    .locals 6

    .prologue
    .line 647
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v4, v5}, Lorg/linphone/core/LinphoneCoreImpl;->listVideoPayloadTypes(J)[J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 648
    .local v2, "typesPtr":[J
    if-nez v2, :cond_1

    const/4 v0, 0x0

    .line 656
    :cond_0
    monitor-exit p0

    return-object v0

    .line 650
    :cond_1
    :try_start_1
    array-length v3, v2

    new-array v0, v3, [Lorg/linphone/core/PayloadType;

    .line 652
    .local v0, "codecs":[Lorg/linphone/core/PayloadType;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 653
    new-instance v3, Lorg/linphone/core/PayloadTypeImpl;

    aget-wide v4, v2, v1

    invoke-direct {v3, v4, v5}, Lorg/linphone/core/PayloadTypeImpl;-><init>(J)V

    aput-object v3, v0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 652
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 647
    .end local v0    # "codecs":[Lorg/linphone/core/PayloadType;
    .end local v1    # "i":I
    .end local v2    # "typesPtr":[J
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized getVideoDevice()I
    .locals 2

    .prologue
    .line 760
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getVideoDevice(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getVideoDscp()I
    .locals 2

    .prologue
    .line 1252
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getVideoDscp(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getVideoMulticastAddr()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1588
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getVideoMulticastAddr(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVideoMulticastTtl()I
    .locals 2

    .prologue
    .line 1611
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getVideoMulticastTtl(J)I

    move-result v0

    return v0
.end method

.method public getVideoPreset()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1655
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->getVideoPreset(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized hasBuiltInEchoCanceler()Z
    .locals 2

    .prologue
    .line 1177
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->hasBuiltInEchoCanceler(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized hasCrappyOpenGL()Z
    .locals 2

    .prologue
    .line 1182
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->hasCrappyOpenGL(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized interpretUrl(Ljava/lang/String;)Lorg/linphone/core/LinphoneAddress;
    .locals 5
    .param p1, "destination"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 352
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3, p1}, Lorg/linphone/core/LinphoneCoreImpl;->interpretUrl(JLjava/lang/String;)J

    move-result-wide v0

    .line 353
    .local v0, "lAddress":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 354
    new-instance v2, Lorg/linphone/core/LinphoneAddressImpl;

    sget-object v3, Lorg/linphone/core/LinphoneAddressImpl$WrapMode;->FromNew:Lorg/linphone/core/LinphoneAddressImpl$WrapMode;

    invoke-direct {v2, v0, v1, v3}, Lorg/linphone/core/LinphoneAddressImpl;-><init>(JLorg/linphone/core/LinphoneAddressImpl$WrapMode;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    .line 356
    :cond_0
    :try_start_1
    new-instance v2, Lorg/linphone/core/LinphoneCoreException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Cannot interpret ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 352
    .end local v0    # "lAddress":J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized invite(Ljava/lang/String;)Lorg/linphone/core/LinphoneCall;
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 251
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 252
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->invite(JLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneCall;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 251
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized invite(Lorg/linphone/core/LinphoneAddress;)Lorg/linphone/core/LinphoneCall;
    .locals 8
    .param p1, "to"    # Lorg/linphone/core/LinphoneAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 360
    monitor-enter p0

    :try_start_0
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v0, p1

    check-cast v0, Lorg/linphone/core/LinphoneAddressImpl;

    move-object v3, v0

    iget-wide v6, v3, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    invoke-direct {p0, v4, v5, v6, v7}, Lorg/linphone/core/LinphoneCoreImpl;->inviteAddress(JJ)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/linphone/core/LinphoneCall;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 361
    .local v2, "call":Lorg/linphone/core/LinphoneCall;
    if-eqz v2, :cond_0

    .line 362
    monitor-exit p0

    return-object v2

    .line 364
    :cond_0
    :try_start_1
    new-instance v3, Lorg/linphone/core/LinphoneCoreException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to invite address "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p1}, Lorg/linphone/core/LinphoneAddress;->asString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 360
    .end local v2    # "call":Lorg/linphone/core/LinphoneCall;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized inviteAddressWithParams(Lorg/linphone/core/LinphoneAddress;Lorg/linphone/core/LinphoneCallParams;)Lorg/linphone/core/LinphoneCall;
    .locals 10
    .param p1, "to"    # Lorg/linphone/core/LinphoneAddress;
    .param p2, "params"    # Lorg/linphone/core/LinphoneCallParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 573
    monitor-enter p0

    :try_start_0
    move-object v0, p1

    check-cast v0, Lorg/linphone/core/LinphoneAddressImpl;

    move-object v3, v0

    iget-wide v6, v3, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    .line 574
    .local v6, "ptrDestination":J
    check-cast p2, Lorg/linphone/core/LinphoneCallParamsImpl;

    .end local p2    # "params":Lorg/linphone/core/LinphoneCallParams;
    iget-wide v8, p2, Lorg/linphone/core/LinphoneCallParamsImpl;->nativePtr:J

    .line 576
    .local v8, "ptrParams":J
    iget-wide v4, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v3, p0

    invoke-direct/range {v3 .. v9}, Lorg/linphone/core/LinphoneCoreImpl;->inviteAddressWithParams(JJJ)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/linphone/core/LinphoneCall;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 577
    .local v2, "call":Lorg/linphone/core/LinphoneCall;
    if-eqz v2, :cond_0

    .line 578
    monitor-exit p0

    return-object v2

    .line 580
    :cond_0
    :try_start_1
    new-instance v3, Lorg/linphone/core/LinphoneCoreException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Unable to invite with params "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {p1}, Lorg/linphone/core/LinphoneAddress;->asString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 573
    .end local v2    # "call":Lorg/linphone/core/LinphoneCall;
    .end local v6    # "ptrDestination":J
    .end local v8    # "ptrParams":J
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized isAdaptiveRateControlEnabled()Z
    .locals 2

    .prologue
    .line 1481
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isAdaptiveRateControlEnabled(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isEchoCancellationEnabled()Z
    .locals 2

    .prologue
    .line 413
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 414
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isEchoCancellationEnabled(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 413
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isEchoLimiterEnabled()Z
    .locals 2

    .prologue
    .line 888
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isEchoLimiterEnabled(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isInComingInvitePending()Z
    .locals 2

    .prologue
    .line 304
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 305
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isInComingInvitePending(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 304
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isInConference()Z
    .locals 2

    .prologue
    .line 776
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isInConference(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isIncall()Z
    .locals 2

    .prologue
    .line 300
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 301
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isInCall(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 300
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isIpv6Enabled()Z
    .locals 2

    .prologue
    .line 724
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isIpv6Enabled(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isKeepAliveEnabled()Z
    .locals 2

    .prologue
    .line 693
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isKeepAliveEnabled(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isLimeEncryptionAvailable()Z
    .locals 2

    .prologue
    .line 1768
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isLimeEncryptionAvailable(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isMediaEncryptionMandatory()Z
    .locals 2

    .prologue
    .line 855
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isMediaEncryptionMandatory(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isMicMuted()Z
    .locals 2

    .prologue
    .line 379
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isMicMuted(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isMyself(Ljava/lang/String;)Z
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 870
    invoke-virtual {p0}, Lorg/linphone/core/LinphoneCoreImpl;->getDefaultProxyConfig()Lorg/linphone/core/LinphoneProxyConfig;

    move-result-object v0

    .line 871
    .local v0, "lpc":Lorg/linphone/core/LinphoneProxyConfig;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 872
    :goto_0
    return v1

    :cond_0
    invoke-interface {v0}, Lorg/linphone/core/LinphoneProxyConfig;->getIdentity()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public declared-synchronized isNetworkReachable()Z
    .locals 2

    .prologue
    .line 685
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isNetworkStateReachable(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isPayloadTypeEnabled(Lorg/linphone/core/PayloadType;)Z
    .locals 4
    .param p1, "pt"    # Lorg/linphone/core/PayloadType;

    .prologue
    .line 399
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 400
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/PayloadTypeImpl;

    .end local p1    # "pt":Lorg/linphone/core/PayloadType;
    iget-wide v2, p1, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->isPayloadTypeEnabled(JJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 399
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isSdp200AckEnabled()Z
    .locals 2

    .prologue
    .line 1425
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isSdp200AckEnabled(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isSpeakerEnabled()Z
    .locals 1

    .prologue
    .line 462
    iget-boolean v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->mSpeakerEnabled:Z

    return v0
.end method

.method public native isTunnelAvailable()Z
.end method

.method public declared-synchronized isVCardSupported()Z
    .locals 2

    .prologue
    .line 548
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isVCardSupported(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isVideoEnabled()Z
    .locals 2

    .prologue
    .line 542
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isVideoEnabled(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isVideoSupported()Z
    .locals 2

    .prologue
    .line 545
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->isVideoSupported(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized iterate()V
    .locals 2

    .prologue
    .line 256
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 257
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->iterate(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 258
    monitor-exit p0

    return-void

    .line 256
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized leaveConference()V
    .locals 2

    .prologue
    .line 766
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->leaveConference(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 767
    monitor-exit p0

    return-void

    .line 766
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized mediaEncryptionSupported(Lorg/linphone/core/LinphoneCore$MediaEncryption;)Z
    .locals 3
    .param p1, "menc"    # Lorg/linphone/core/LinphoneCore$MediaEncryption;

    .prologue
    .line 893
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v2, p1, Lorg/linphone/core/LinphoneCore$MediaEncryption;->mValue:I

    invoke-direct {p0, v0, v1, v2}, Lorg/linphone/core/LinphoneCoreImpl;->mediaEncryptionSupported(JI)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized migrateCallLogs()V
    .locals 2

    .prologue
    .line 1376
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->migrateCallLogs(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1377
    monitor-exit p0

    return-void

    .line 1376
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized migrateToMultiTransport()I
    .locals 2

    .prologue
    .line 1371
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->migrateToMultiTransport(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized muteMic(Z)V
    .locals 2
    .param p1, "isMuted"    # Z

    .prologue
    .line 348
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->muteMic(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 349
    monitor-exit p0

    return-void

    .line 348
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized needsEchoCalibration()Z
    .locals 2

    .prologue
    .line 1172
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->needsEchoCalibration(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized pauseAllCalls()Z
    .locals 2

    .prologue
    .line 737
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->pauseAllCalls(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized pauseCall(Lorg/linphone/core/LinphoneCall;)Z
    .locals 4
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 731
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneCallImpl;

    .end local p1    # "call":Lorg/linphone/core/LinphoneCall;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneCallImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->pauseCall(JJ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized payloadTypeIsVbr(Lorg/linphone/core/PayloadType;)Z
    .locals 4
    .param p1, "pt"    # Lorg/linphone/core/PayloadType;

    .prologue
    .line 404
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 405
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/PayloadTypeImpl;

    .end local p1    # "pt":Lorg/linphone/core/PayloadType;
    iget-wide v2, p1, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->payloadTypeIsVbr(JJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 404
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized playDtmf(CI)V
    .locals 2
    .param p1, "number"    # C
    .param p2, "duration"    # I

    .prologue
    .line 468
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;->playDtmf(JCI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    monitor-exit p0

    return-void

    .line 468
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized publish(Lorg/linphone/core/LinphoneAddress;Ljava/lang/String;ILorg/linphone/core/LinphoneContent;)Lorg/linphone/core/LinphoneEvent;
    .locals 12
    .param p1, "resource"    # Lorg/linphone/core/LinphoneAddress;
    .param p2, "eventname"    # Ljava/lang/String;
    .param p3, "expires"    # I
    .param p4, "content"    # Lorg/linphone/core/LinphoneContent;

    .prologue
    .line 1273
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "resource":Lorg/linphone/core/LinphoneAddress;
    iget-wide v4, p1, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    if-eqz p4, :cond_0

    .line 1274
    invoke-interface/range {p4 .. p4}, Lorg/linphone/core/LinphoneContent;->getType()Ljava/lang/String;

    move-result-object v8

    :goto_0
    if-eqz p4, :cond_1

    invoke-interface/range {p4 .. p4}, Lorg/linphone/core/LinphoneContent;->getSubtype()Ljava/lang/String;

    move-result-object v9

    :goto_1
    if-eqz p4, :cond_2

    invoke-interface/range {p4 .. p4}, Lorg/linphone/core/LinphoneContent;->getData()[B

    move-result-object v10

    :goto_2
    if-eqz p4, :cond_3

    .line 1275
    invoke-interface/range {p4 .. p4}, Lorg/linphone/core/LinphoneContent;->getEncoding()Ljava/lang/String;

    move-result-object v11

    :goto_3
    move-object v1, p0

    move-object v6, p2

    move v7, p3

    .line 1273
    invoke-direct/range {v1 .. v11}, Lorg/linphone/core/LinphoneCoreImpl;->publish(JJLjava/lang/String;ILjava/lang/String;Ljava/lang/String;[BLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 1274
    :cond_0
    const/4 v8, 0x0

    goto :goto_0

    :cond_1
    const/4 v9, 0x0

    goto :goto_1

    :cond_2
    const/4 v10, 0x0

    goto :goto_2

    .line 1275
    :cond_3
    const/4 v11, 0x0

    goto :goto_3

    .line 1273
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized refreshRegisters()V
    .locals 2

    .prologue
    .line 1053
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->refreshRegisters(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1054
    monitor-exit p0

    return-void

    .line 1053
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public reloadMsPlugins(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1755
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->reloadMsPlugins(JLjava/lang/String;)V

    .line 1756
    return-void
.end method

.method public reloadSoundDevices()V
    .locals 2

    .prologue
    .line 1759
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->reloadSoundDevices(J)V

    .line 1760
    return-void
.end method

.method public declared-synchronized removeAuthInfo(Lorg/linphone/core/LinphoneAuthInfo;)V
    .locals 4
    .param p1, "info"    # Lorg/linphone/core/LinphoneAuthInfo;

    .prologue
    .line 241
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 242
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAuthInfoImpl;

    .end local p1    # "info":Lorg/linphone/core/LinphoneAuthInfo;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneAuthInfoImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->removeAuthInfo(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    monitor-exit p0

    return-void

    .line 241
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeCallLog(Lorg/linphone/core/LinphoneCallLog;)V
    .locals 4
    .param p1, "log"    # Lorg/linphone/core/LinphoneCallLog;

    .prologue
    .line 1036
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneCallLogImpl;

    .end local p1    # "log":Lorg/linphone/core/LinphoneCallLog;
    invoke-virtual {p1}, Lorg/linphone/core/LinphoneCallLogImpl;->getNativePtr()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->removeCallLog(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1037
    monitor-exit p0

    return-void

    .line 1036
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeFriend(Lorg/linphone/core/LinphoneFriend;)V
    .locals 4
    .param p1, "lf"    # Lorg/linphone/core/LinphoneFriend;

    .prologue
    .line 1076
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-interface {p1}, Lorg/linphone/core/LinphoneFriend;->getNativePtr()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->removeFriend(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1077
    monitor-exit p0

    return-void

    .line 1076
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeFriendList(Lorg/linphone/core/LinphoneFriendList;)V
    .locals 4
    .param p1, "friendList"    # Lorg/linphone/core/LinphoneFriendList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 490
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneFriendListImpl;

    .end local p1    # "friendList":Lorg/linphone/core/LinphoneFriendList;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneFriendListImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->removeFriendList(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 491
    monitor-exit p0

    return-void

    .line 490
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeFromConference(Lorg/linphone/core/LinphoneCall;)V
    .locals 4
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 824
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->removeFromConference(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 825
    monitor-exit p0

    return-void

    .line 824
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeListener(Lorg/linphone/core/LinphoneCoreListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/linphone/core/LinphoneCoreListener;

    .prologue
    .line 1534
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->removeListener(JLorg/linphone/core/LinphoneCoreListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1535
    monitor-exit p0

    return-void

    .line 1534
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V
    .locals 4
    .param p1, "proxyCfg"    # Lorg/linphone/core/LinphoneProxyConfig;

    .prologue
    .line 273
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 274
    if-eqz p1, :cond_0

    .line 275
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneProxyConfigImpl;

    .end local p1    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneProxyConfigImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->removeProxyConfig(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 277
    :cond_0
    monitor-exit p0

    return-void

    .line 273
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public native resetLogCollection()V
.end method

.method public declared-synchronized resetMissedCallsCount()V
    .locals 2

    .prologue
    .line 1040
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->resetMissedCallsCount(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1041
    monitor-exit p0

    return-void

    .line 1040
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized resumeCall(Lorg/linphone/core/LinphoneCall;)Z
    .locals 4
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 734
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneCallImpl;

    .end local p1    # "call":Lorg/linphone/core/LinphoneCall;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneCallImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->resumeCall(JJ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public routeAudioToSpeakerHelper(Z)V
    .locals 1
    .param p1, "speakerOn"    # Z

    .prologue
    .line 443
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->contextInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 447
    :goto_0
    return-void

    .line 444
    :cond_0
    invoke-static {}, Lorg/linphone/mediastream/video/capture/hwconf/Hacks;->needGalaxySAudioHack()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 445
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->setAudioModeIncallForGalaxyS()V

    .line 446
    :cond_1
    iget-object v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v0, p1}, Landroid/media/AudioManager;->setSpeakerphoneOn(Z)V

    goto :goto_0
.end method

.method public declared-synchronized sendDtmf(C)V
    .locals 2
    .param p1, "number"    # C

    .prologue
    .line 373
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->sendDtmf(JC)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 374
    monitor-exit p0

    return-void

    .line 373
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized sendDtmfs(Ljava/lang/String;)V
    .locals 2
    .param p1, "dtmf"    # Ljava/lang/String;

    .prologue
    .line 369
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->sendDtmfs(JLjava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 370
    monitor-exit p0

    return-void

    .line 369
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAdaptiveRateAlgorithm(Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;)V
    .locals 3
    .param p1, "alg"    # Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;

    .prologue
    .line 1487
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-virtual {p1}, Lorg/linphone/core/LinphoneCore$AdaptiveRateAlgorithm;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lorg/linphone/core/LinphoneCoreImpl;->setAdaptiveRateAlgorithm(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1488
    monitor-exit p0

    return-void

    .line 1487
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAudioCodecs([Lorg/linphone/core/PayloadType;)V
    .locals 4
    .param p1, "codecs"    # [Lorg/linphone/core/PayloadType;

    .prologue
    .line 678
    monitor-enter p0

    :try_start_0
    array-length v2, p1

    new-array v1, v2, [J

    .line 679
    .local v1, "typesPtr":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 680
    aget-object v2, p1, v0

    check-cast v2, Lorg/linphone/core/PayloadTypeImpl;

    iget-wide v2, v2, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    aput-wide v2, v1, v0

    .line 679
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 682
    :cond_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3, v1}, Lorg/linphone/core/LinphoneCoreImpl;->setAudioCodecs(J[J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 683
    monitor-exit p0

    return-void

    .line 678
    .end local v0    # "i":I
    .end local v1    # "typesPtr":[J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized setAudioDscp(I)V
    .locals 2
    .param p1, "dscp"    # I

    .prologue
    .line 1234
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setAudioDscp(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1235
    monitor-exit p0

    return-void

    .line 1234
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAudioJittcomp(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 1494
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setAudioJittcomp(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1495
    monitor-exit p0

    return-void

    .line 1494
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setAudioMulticastAddr(Ljava/lang/String;)V
    .locals 3
    .param p1, "ip"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 1571
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setAudioMulticastAddr(JLjava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 1572
    new-instance v0, Lorg/linphone/core/LinphoneCoreException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad ip address ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1573
    :cond_0
    return-void
.end method

.method public setAudioMulticastTtl(I)V
    .locals 3
    .param p1, "ttl"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 1593
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setAudioMulticastTtl(JI)I

    move-result v0

    if-eqz v0, :cond_0

    .line 1594
    new-instance v0, Lorg/linphone/core/LinphoneCoreException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad ttl value ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1596
    :cond_0
    return-void
.end method

.method public declared-synchronized setAudioPort(I)V
    .locals 2
    .param p1, "port"    # I

    .prologue
    .line 1086
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setAudioPort(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1087
    monitor-exit p0

    return-void

    .line 1086
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAudioPortRange(II)V
    .locals 2
    .param p1, "minPort"    # I
    .param p2, "maxPort"    # I

    .prologue
    .line 1094
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;->setAudioPortRange(JII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1095
    monitor-exit p0

    return-void

    .line 1094
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCallErrorTone(Lorg/linphone/core/Reason;Ljava/lang/String;)V
    .locals 3
    .param p1, "reason"    # Lorg/linphone/core/Reason;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 1407
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v2, p1, Lorg/linphone/core/Reason;->mValue:I

    invoke-direct {p0, v0, v1, v2, p2}, Lorg/linphone/core/LinphoneCoreImpl;->setCallErrorTone(JILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1408
    monitor-exit p0

    return-void

    .line 1407
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCallLogsDatabasePath(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1296
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setCallLogsDatabasePath(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1297
    monitor-exit p0

    return-void

    .line 1296
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setChatDatabasePath(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1292
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setChatDatabasePath(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1293
    monitor-exit p0

    return-void

    .line 1292
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setContext(Ljava/lang/Object;)V
    .locals 3
    .param p1, "context"    # Ljava/lang/Object;

    .prologue
    .line 224
    check-cast p1, Landroid/content/Context;

    .end local p1    # "context":Ljava/lang/Object;
    iput-object p1, p0, Lorg/linphone/core/LinphoneCoreImpl;->mContext:Landroid/content/Context;

    .line 225
    iget-object v1, p0, Lorg/linphone/core/LinphoneCoreImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 226
    .local v0, "info":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->reloadMsPlugins(Ljava/lang/String;)V

    .line 227
    iget-object v1, p0, Lorg/linphone/core/LinphoneCoreImpl;->mContext:Landroid/content/Context;

    const-string/jumbo v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lorg/linphone/core/LinphoneCoreImpl;->mAudioManager:Landroid/media/AudioManager;

    .line 229
    return-void
.end method

.method public declared-synchronized setCpuCount(I)V
    .locals 2
    .param p1, "count"    # I

    .prologue
    .line 1028
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setCpuCountNative(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1029
    monitor-exit p0

    return-void

    .line 1028
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDefaultProxyConfig(Lorg/linphone/core/LinphoneProxyConfig;)V
    .locals 4
    .param p1, "proxyCfg"    # Lorg/linphone/core/LinphoneProxyConfig;

    .prologue
    .line 261
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 262
    if-eqz p1, :cond_0

    check-cast p1, Lorg/linphone/core/LinphoneProxyConfigImpl;

    .end local p1    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    iget-wide v0, p1, Lorg/linphone/core/LinphoneProxyConfigImpl;->nativePtr:J

    .line 263
    .local v0, "proxyPtr":J
    :goto_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->setDefaultProxyConfig(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    monitor-exit p0

    return-void

    .line 262
    .end local v0    # "proxyPtr":J
    .restart local p1    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 261
    .end local p1    # "proxyCfg":Lorg/linphone/core/LinphoneProxyConfig;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public setDefaultSoundDevices()V
    .locals 2

    .prologue
    .line 1763
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->setDefaultSoundDevices(J)V

    .line 1764
    return-void
.end method

.method public declared-synchronized setDeviceRotation(I)V
    .locals 2
    .param p1, "rotation"    # I

    .prologue
    .line 535
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setDeviceRotation(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 536
    monitor-exit p0

    return-void

    .line 535
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setDnsServers([Ljava/lang/String;)V
    .locals 2
    .param p1, "servers"    # [Ljava/lang/String;

    .prologue
    .line 1745
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setDnsServers(J[Ljava/lang/String;)V

    .line 1746
    return-void
.end method

.method public declared-synchronized setDownloadBandwidth(I)V
    .locals 2
    .param p1, "bw"    # I

    .prologue
    .line 604
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setDownloadBandwidth(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 605
    monitor-exit p0

    return-void

    .line 604
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDownloadPtime(I)V
    .locals 2
    .param p1, "ptime"    # I

    .prologue
    .line 740
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setDownloadPtime(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 742
    monitor-exit p0

    return-void

    .line 740
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setFileTransferServer(Ljava/lang/String;)V
    .locals 2
    .param p1, "serverUrl"    # Ljava/lang/String;

    .prologue
    .line 1505
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setFileTransferServer(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1506
    monitor-exit p0

    return-void

    .line 1505
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setFirewallPolicy(Lorg/linphone/core/LinphoneCore$FirewallPolicy;)V
    .locals 3
    .param p1, "pol"    # Lorg/linphone/core/LinphoneCore$FirewallPolicy;

    .prologue
    .line 554
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-virtual {p1}, Lorg/linphone/core/LinphoneCore$FirewallPolicy;->value()I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lorg/linphone/core/LinphoneCoreImpl;->setFirewallPolicy(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 555
    monitor-exit p0

    return-void

    .line 554
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setFriendsDatabasePath(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1300
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setFriendsDatabasePath(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1301
    monitor-exit p0

    return-void

    .line 1300
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setHttpProxyHost(Ljava/lang/String;)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 1683
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setHttpProxyHost(JLjava/lang/String;)V

    .line 1684
    return-void
.end method

.method public setHttpProxyPort(I)V
    .locals 2
    .param p1, "port"    # I

    .prologue
    .line 1689
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setHttpProxyPort(JI)V

    .line 1690
    return-void
.end method

.method public declared-synchronized setInCallTimeout(I)V
    .locals 2
    .param p1, "timeout"    # I

    .prologue
    .line 1111
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setInCallTimeout(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1112
    monitor-exit p0

    return-void

    .line 1111
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setIncomingTimeout(I)V
    .locals 2
    .param p1, "timeout"    # I

    .prologue
    .line 1102
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setIncomingTimeout(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1103
    monitor-exit p0

    return-void

    .line 1102
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setLimeEncryption(Lorg/linphone/core/LinphoneCore$LinphoneLimeState;)V
    .locals 3
    .param p1, "lime"    # Lorg/linphone/core/LinphoneCore$LinphoneLimeState;

    .prologue
    .line 1773
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v2, p1, Lorg/linphone/core/LinphoneCore$LinphoneLimeState;->mValue:I

    invoke-direct {p0, v0, v1, v2}, Lorg/linphone/core/LinphoneCoreImpl;->setLimeEncryption(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1774
    monitor-exit p0

    return-void

    .line 1773
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMaxCalls(I)V
    .locals 2
    .param p1, "max"    # I

    .prologue
    .line 883
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setMaxCalls(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 884
    monitor-exit p0

    return-void

    .line 883
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMediaEncryption(Lorg/linphone/core/LinphoneCore$MediaEncryption;)V
    .locals 3
    .param p1, "menc"    # Lorg/linphone/core/LinphoneCore$MediaEncryption;

    .prologue
    .line 858
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v2, p1, Lorg/linphone/core/LinphoneCore$MediaEncryption;->mValue:I

    invoke-direct {p0, v0, v1, v2}, Lorg/linphone/core/LinphoneCoreImpl;->setMediaEncryption(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 859
    monitor-exit p0

    return-void

    .line 858
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMediaEncryptionMandatory(Z)V
    .locals 2
    .param p1, "yesno"    # Z

    .prologue
    .line 861
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setMediaEncryptionMandatory(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 862
    monitor-exit p0

    return-void

    .line 861
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setMediaNetworkReachable(Z)V
    .locals 2
    .param p1, "isReachable"    # Z

    .prologue
    .line 1735
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setMediaNetworkReachable(JZ)V

    .line 1736
    return-void
.end method

.method public declared-synchronized setMicrophoneGain(F)V
    .locals 2
    .param p1, "gain"    # F

    .prologue
    .line 1121
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setMicrophoneGain(JF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1122
    monitor-exit p0

    return-void

    .line 1121
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setMtu(I)V
    .locals 2
    .param p1, "mtu"    # I

    .prologue
    .line 1412
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setMtu(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1413
    monitor-exit p0

    return-void

    .line 1412
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setNatPolicy(Lorg/linphone/core/LinphoneNatPolicy;)V
    .locals 4
    .param p1, "policy"    # Lorg/linphone/core/LinphoneNatPolicy;

    .prologue
    .line 560
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneNatPolicyImpl;

    .end local p1    # "policy":Lorg/linphone/core/LinphoneNatPolicy;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneNatPolicyImpl;->mNativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->setNatPolicy(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 561
    monitor-exit p0

    return-void

    .line 560
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setNetworkReachable(Z)V
    .locals 2
    .param p1, "isReachable"    # Z

    .prologue
    .line 338
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setNetworkStateReachable(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 339
    monitor-exit p0

    return-void

    .line 338
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setNortpTimeout(I)V
    .locals 2
    .param p1, "timeout"    # I

    .prologue
    .line 1717
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setNortpTimeout(JI)V

    .line 1718
    return-void
.end method

.method public setPCCWDoubleRegisterTimeout(I)V
    .locals 2
    .param p1, "timeout"    # I

    .prologue
    .line 1338
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setPCCWDoubleRegisterTimeout(JI)V

    .line 1339
    return-void
.end method

.method public declared-synchronized setPayloadTypeBitrate(Lorg/linphone/core/PayloadType;I)V
    .locals 7
    .param p1, "pt"    # Lorg/linphone/core/PayloadType;
    .param p2, "bitrate"    # I

    .prologue
    .line 1455
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/PayloadTypeImpl;

    .end local p1    # "pt":Lorg/linphone/core/PayloadType;
    iget-wide v4, p1, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    move-object v1, p0

    move v6, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;->setPayloadTypeBitrate(JJI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1456
    monitor-exit p0

    return-void

    .line 1455
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPayloadTypeNumber(Lorg/linphone/core/PayloadType;I)V
    .locals 7
    .param p1, "pt"    # Lorg/linphone/core/PayloadType;
    .param p2, "number"    # I

    .prologue
    .line 1466
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/PayloadTypeImpl;

    .end local p1    # "pt":Lorg/linphone/core/PayloadType;
    iget-wide v4, p1, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    move-object v1, p0

    move v6, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;->setPayloadTypeNumber(JJI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1467
    monitor-exit p0

    return-void

    .line 1466
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPlayFile(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 900
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setPlayFile(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 901
    monitor-exit p0

    return-void

    .line 900
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setPlayLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 430
    return-void
.end method

.method public declared-synchronized setPlaybackGain(F)V
    .locals 2
    .param p1, "gain"    # F

    .prologue
    .line 341
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setPlaybackGain(JF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 343
    monitor-exit p0

    return-void

    .line 341
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setPreferredFramerate(F)V
    .locals 2
    .param p1, "fps"    # F

    .prologue
    .line 1559
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setPreferredFramerate(JF)V

    .line 1560
    return-void
.end method

.method public declared-synchronized setPreferredVideoSize(Lorg/linphone/core/VideoSize;)V
    .locals 4
    .param p1, "vSize"    # Lorg/linphone/core/VideoSize;

    .prologue
    .line 608
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v2, p1, Lorg/linphone/core/VideoSize;->width:I

    iget v3, p1, Lorg/linphone/core/VideoSize;->height:I

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->setPreferredVideoSize(JII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 609
    monitor-exit p0

    return-void

    .line 608
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPreferredVideoSizeByName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 612
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setPreferredVideoSizeByName(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 613
    monitor-exit p0

    return-void

    .line 612
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPresenceInfo(ILjava/lang/String;Lorg/linphone/core/OnlineStatus;)V
    .locals 7
    .param p1, "minutes_away"    # I
    .param p2, "alternative_contact"    # Ljava/lang/String;
    .param p3, "status"    # Lorg/linphone/core/OnlineStatus;

    .prologue
    .line 509
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v6, p3, Lorg/linphone/core/OnlineStatus;->mValue:I

    move-object v1, p0

    move v4, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;->setPresenceInfo(JILjava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 511
    monitor-exit p0

    return-void

    .line 509
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPresenceModel(Lorg/linphone/core/PresenceModel;)V
    .locals 4
    .param p1, "presence"    # Lorg/linphone/core/PresenceModel;

    .prologue
    .line 517
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/PresenceModelImpl;

    .end local p1    # "presence":Lorg/linphone/core/PresenceModel;
    invoke-virtual {p1}, Lorg/linphone/core/PresenceModelImpl;->getNativePtr()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->setPresenceModel(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 518
    monitor-exit p0

    return-void

    .line 517
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPreviewWindow(Ljava/lang/Object;)V
    .locals 2
    .param p1, "w"    # Ljava/lang/Object;

    .prologue
    .line 529
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setPreviewWindowId(JLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 530
    monitor-exit p0

    return-void

    .line 529
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPrimaryContact(Ljava/lang/String;)V
    .locals 2
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 1125
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setPrimaryContact2(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1126
    monitor-exit p0

    return-void

    .line 1125
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPrimaryContact(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "displayName"    # Ljava/lang/String;
    .param p2, "username"    # Ljava/lang/String;

    .prologue
    .line 1133
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;->setPrimaryContact(JLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1134
    monitor-exit p0

    return-void

    .line 1133
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setProvisioningUri(Ljava/lang/String;)V
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 1668
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setProvisioningUri(JLjava/lang/String;)V

    .line 1669
    return-void
.end method

.method public setRemoteRingbackTone(Ljava/lang/String;)V
    .locals 2
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 1539
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setRemoteRingbackTone(JLjava/lang/String;)V

    .line 1540
    return-void
.end method

.method public declared-synchronized setRing(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 624
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setRing(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 625
    monitor-exit p0

    return-void

    .line 624
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRingback(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 639
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setRingback(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 640
    monitor-exit p0

    return-void

    .line 639
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRootCA(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 631
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setRootCA(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 632
    monitor-exit p0

    return-void

    .line 631
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setRootCAData(Ljava/lang/String;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 635
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setRootCAData(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 636
    monitor-exit p0

    return-void

    .line 635
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSignalingTransportPorts(Lorg/linphone/core/LinphoneCore$Transports;)V
    .locals 7
    .param p1, "transports"    # Lorg/linphone/core/LinphoneCore$Transports;

    .prologue
    .line 717
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v4, p1, Lorg/linphone/core/LinphoneCore$Transports;->udp:I

    iget v5, p1, Lorg/linphone/core/LinphoneCore$Transports;->tcp:I

    iget v6, p1, Lorg/linphone/core/LinphoneCore$Transports;->tls:I

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;->setSignalingTransportPorts(JIII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 718
    monitor-exit p0

    return-void

    .line 717
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setSipDscp(I)V
    .locals 2
    .param p1, "dscp"    # I

    .prologue
    .line 1223
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setSipDscp(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1224
    monitor-exit p0

    return-void

    .line 1223
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setSipNetworkReachable(Z)V
    .locals 2
    .param p1, "isReachable"    # Z

    .prologue
    .line 1729
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setSipNetworkReachable(JZ)V

    .line 1730
    return-void
.end method

.method public setSipTransportTimeout(I)V
    .locals 2
    .param p1, "timeout_ms"    # I

    .prologue
    .line 1706
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setSipTransportTimeout(JI)V

    .line 1707
    return-void
.end method

.method public setSpeakerphoneAlwaysOn(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 465
    iput-boolean p1, p0, Lorg/linphone/core/LinphoneCoreImpl;->mSpeakerphoneAlwaysOn:Z

    .line 466
    return-void
.end method

.method public declared-synchronized setStaticPicture(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1017
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setStaticPicture(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1018
    monitor-exit p0

    return-void

    .line 1017
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setStunServer(Ljava/lang/String;)V
    .locals 2
    .param p1, "stunServer"    # Ljava/lang/String;

    .prologue
    .line 569
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setStunServer(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 570
    monitor-exit p0

    return-void

    .line 569
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setTlsCertificate(Ljava/lang/String;)V
    .locals 2
    .param p1, "cert"    # Ljava/lang/String;

    .prologue
    .line 1808
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setTlsCertificate(JLjava/lang/String;)V

    .line 1809
    return-void
.end method

.method public setTlsCertificatePath(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1820
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setTlsCertificatePath(JLjava/lang/String;)V

    .line 1821
    return-void
.end method

.method public setTlsKey(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1814
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setTlsKey(JLjava/lang/String;)V

    .line 1815
    return-void
.end method

.method public setTlsKeyPath(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1826
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setTlsKeyPath(JLjava/lang/String;)V

    .line 1827
    return-void
.end method

.method public declared-synchronized setTone(Lorg/linphone/core/ToneID;Ljava/lang/String;)V
    .locals 3
    .param p1, "id"    # Lorg/linphone/core/ToneID;
    .param p2, "wavfile"    # Ljava/lang/String;

    .prologue
    .line 1430
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    iget v2, p1, Lorg/linphone/core/ToneID;->mValue:I

    invoke-direct {p0, v0, v1, v2, p2}, Lorg/linphone/core/LinphoneCoreImpl;->setTone(JILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1431
    monitor-exit p0

    return-void

    .line 1430
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUploadBandwidth(I)V
    .locals 2
    .param p1, "bw"    # I

    .prologue
    .line 596
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setUploadBandwidth(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 597
    monitor-exit p0

    return-void

    .line 596
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUploadPtime(I)V
    .locals 2
    .param p1, "ptime"    # I

    .prologue
    .line 744
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setUploadPtime(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 745
    monitor-exit p0

    return-void

    .line 744
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUseRfc2833ForDtmfs(Z)V
    .locals 2
    .param p1, "use"    # Z

    .prologue
    .line 1156
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setUseRfc2833ForDtmfs(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1157
    monitor-exit p0

    return-void

    .line 1156
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUseSipInfoForDtmfs(Z)V
    .locals 2
    .param p1, "use"    # Z

    .prologue
    .line 1146
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setUseSipInfoForDtmfs(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1147
    monitor-exit p0

    return-void

    .line 1146
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setUserAgent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "version"    # Ljava/lang/String;

    .prologue
    .line 1022
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;->setUserAgent(JLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1023
    monitor-exit p0

    return-void

    .line 1022
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setUserCertificatesPath(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1751
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setUserCertificatesPath(JLjava/lang/String;)V

    .line 1752
    return-void
.end method

.method public setVerifyServerCN(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 1838
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVerifyServerCN(JZ)V

    .line 1839
    return-void
.end method

.method public setVerifyServerCertificates(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 1832
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVerifyServerCertificates(JZ)V

    .line 1833
    return-void
.end method

.method public declared-synchronized setVideoCodecs([Lorg/linphone/core/PayloadType;)V
    .locals 4
    .param p1, "codecs"    # [Lorg/linphone/core/PayloadType;

    .prologue
    .line 659
    monitor-enter p0

    :try_start_0
    array-length v2, p1

    new-array v1, v2, [J

    .line 660
    .local v1, "typesPtr":[J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 661
    aget-object v2, p1, v0

    check-cast v2, Lorg/linphone/core/PayloadTypeImpl;

    iget-wide v2, v2, Lorg/linphone/core/PayloadTypeImpl;->nativePtr:J

    aput-wide v2, v1, v0

    .line 660
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 663
    :cond_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v2, v3, v1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoCodecs(J[J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 664
    monitor-exit p0

    return-void

    .line 659
    .end local v0    # "i":I
    .end local v1    # "typesPtr":[J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized setVideoDevice(I)V
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 754
    monitor-enter p0

    const/4 v0, 0x2

    :try_start_0
    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Setting camera id :"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->i([Ljava/lang/Object;)V

    .line 755
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoDevice(JI)I

    move-result v0

    if-eqz v0, :cond_0

    .line 756
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Failed to set video device to id:"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lorg/linphone/mediastream/Log;->e([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 758
    :cond_0
    monitor-exit p0

    return-void

    .line 754
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setVideoDscp(I)V
    .locals 2
    .param p1, "dscp"    # I

    .prologue
    .line 1246
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoDscp(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1247
    monitor-exit p0

    return-void

    .line 1246
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setVideoJittcomp(I)V
    .locals 2
    .param p1, "value"    # I

    .prologue
    .line 1499
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoJittcomp(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1500
    monitor-exit p0

    return-void

    .line 1499
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setVideoMulticastAddr(Ljava/lang/String;)V
    .locals 3
    .param p1, "ip"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 1577
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoMulticastAddr(JLjava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 1578
    new-instance v0, Lorg/linphone/core/LinphoneCoreException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad ip address ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1579
    :cond_0
    return-void
.end method

.method public setVideoMulticastTtl(I)V
    .locals 3
    .param p1, "ttl"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 1600
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoMulticastTtl(JI)I

    move-result v0

    if-eqz v0, :cond_0

    .line 1601
    new-instance v0, Lorg/linphone/core/LinphoneCoreException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "bad ttl value ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/linphone/core/LinphoneCoreException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1602
    :cond_0
    return-void
.end method

.method public declared-synchronized setVideoPolicy(ZZ)V
    .locals 2
    .param p1, "autoInitiate"    # Z
    .param p2, "autoAccept"    # Z

    .prologue
    .line 1004
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoPolicy(JZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1005
    monitor-exit p0

    return-void

    .line 1004
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setVideoPort(I)V
    .locals 2
    .param p1, "port"    # I

    .prologue
    .line 1090
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoPort(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1091
    monitor-exit p0

    return-void

    .line 1090
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setVideoPortRange(II)V
    .locals 2
    .param p1, "minPort"    # I
    .param p2, "maxPort"    # I

    .prologue
    .line 1098
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoPortRange(JII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1099
    monitor-exit p0

    return-void

    .line 1098
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setVideoPreset(Ljava/lang/String;)V
    .locals 2
    .param p1, "preset"    # Ljava/lang/String;

    .prologue
    .line 1649
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoPreset(JLjava/lang/String;)V

    .line 1650
    return-void
.end method

.method public declared-synchronized setVideoWindow(Ljava/lang/Object;)V
    .locals 2
    .param p1, "w"    # Ljava/lang/Object;

    .prologue
    .line 532
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setVideoWindowId(JLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 533
    monitor-exit p0

    return-void

    .line 532
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setZrtpSecretsCache(Ljava/lang/String;)V
    .locals 2
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 748
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->setZrtpSecretsCache(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 749
    monitor-exit p0

    return-void

    .line 748
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized soundResourcesLocked()Z
    .locals 2

    .prologue
    .line 877
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->soundResourcesLocked(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startConferenceRecording(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1207
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->startConferenceRecording(JLjava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1208
    monitor-exit p0

    return-void

    .line 1207
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startEchoCalibration(Lorg/linphone/core/LinphoneCoreListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/linphone/core/LinphoneCoreListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/linphone/core/LinphoneCoreException;
        }
    .end annotation

    .prologue
    .line 696
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->startEchoCalibration(JLjava/lang/Object;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 697
    monitor-exit p0

    return-void

    .line 696
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startEchoTester(I)I
    .locals 2
    .param p1, "rate"    # I

    .prologue
    .line 700
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->startEchoTester(JI)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startReferedCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)Lorg/linphone/core/LinphoneCall;
    .locals 8
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "params"    # Lorg/linphone/core/LinphoneCallParams;

    .prologue
    .line 1359
    monitor-enter p0

    :try_start_0
    check-cast p2, Lorg/linphone/core/LinphoneCallParamsImpl;

    .end local p2    # "params":Lorg/linphone/core/LinphoneCallParams;
    iget-wide v6, p2, Lorg/linphone/core/LinphoneCallParamsImpl;->nativePtr:J

    .line 1360
    .local v6, "ptrParams":J
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v4

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->startReferedCall(JJJ)Lorg/linphone/core/LinphoneCall;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 1359
    .end local v6    # "ptrParams":J
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopConferenceRecording()V
    .locals 2

    .prologue
    .line 1213
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->stopConferenceRecording(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1214
    monitor-exit p0

    return-void

    .line 1213
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopDtmf()V
    .locals 2

    .prologue
    .line 472
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->stopDtmf(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 473
    monitor-exit p0

    return-void

    .line 472
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopEchoTester()I
    .locals 2

    .prologue
    .line 704
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->stopEchoTester(J)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopRinging()V
    .locals 2

    .prologue
    .line 1450
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->stopRinging(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1451
    monitor-exit p0

    return-void

    .line 1450
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized subscribe(Lorg/linphone/core/LinphoneAddress;Ljava/lang/String;ILorg/linphone/core/LinphoneContent;)Lorg/linphone/core/LinphoneEvent;
    .locals 12
    .param p1, "resource"    # Lorg/linphone/core/LinphoneAddress;
    .param p2, "eventname"    # Ljava/lang/String;
    .param p3, "expires"    # I
    .param p4, "content"    # Lorg/linphone/core/LinphoneContent;

    .prologue
    .line 1265
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneAddressImpl;

    .end local p1    # "resource":Lorg/linphone/core/LinphoneAddress;
    iget-wide v4, p1, Lorg/linphone/core/LinphoneAddressImpl;->nativePtr:J

    if-eqz p4, :cond_0

    .line 1266
    invoke-interface/range {p4 .. p4}, Lorg/linphone/core/LinphoneContent;->getType()Ljava/lang/String;

    move-result-object v8

    :goto_0
    if-eqz p4, :cond_1

    invoke-interface/range {p4 .. p4}, Lorg/linphone/core/LinphoneContent;->getSubtype()Ljava/lang/String;

    move-result-object v9

    :goto_1
    if-eqz p4, :cond_2

    invoke-interface/range {p4 .. p4}, Lorg/linphone/core/LinphoneContent;->getData()[B

    move-result-object v10

    :goto_2
    if-eqz p4, :cond_3

    .line 1267
    invoke-interface/range {p4 .. p4}, Lorg/linphone/core/LinphoneContent;->getEncoding()Ljava/lang/String;

    move-result-object v11

    :goto_3
    move-object v1, p0

    move-object v6, p2

    move v7, p3

    .line 1265
    invoke-direct/range {v1 .. v11}, Lorg/linphone/core/LinphoneCoreImpl;->subscribe(JJLjava/lang/String;ILjava/lang/String;Ljava/lang/String;[BLjava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/linphone/core/LinphoneEvent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 1266
    :cond_0
    const/4 v8, 0x0

    goto :goto_0

    :cond_1
    const/4 v9, 0x0

    goto :goto_1

    :cond_2
    const/4 v10, 0x0

    goto :goto_2

    .line 1267
    :cond_3
    const/4 v11, 0x0

    goto :goto_3

    .line 1265
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized terminateAllCalls()V
    .locals 2

    .prologue
    .line 801
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->terminateAllCalls(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 802
    monitor-exit p0

    return-void

    .line 801
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized terminateCall(Lorg/linphone/core/LinphoneCall;)V
    .locals 4
    .param p1, "aCall"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 287
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/linphone/core/LinphoneCoreImpl;->isValid()V

    .line 288
    if-eqz p1, :cond_0

    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/LinphoneCallImpl;

    .end local p1    # "aCall":Lorg/linphone/core/LinphoneCall;
    iget-wide v2, p1, Lorg/linphone/core/LinphoneCallImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->terminateCall(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    :cond_0
    monitor-exit p0

    return-void

    .line 287
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized terminateConference()V
    .locals 2

    .prologue
    .line 781
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->terminateConference(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 782
    monitor-exit p0

    return-void

    .line 781
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized transferCall(Lorg/linphone/core/LinphoneCall;Ljava/lang/String;)V
    .locals 7
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "referTo"    # Ljava/lang/String;

    .prologue
    .line 837
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v4

    move-object v1, p0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lorg/linphone/core/LinphoneCoreImpl;->transferCall(JJLjava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 838
    monitor-exit p0

    return-void

    .line 837
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized transferCallToAnother(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCall;)V
    .locals 8
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "dest"    # Lorg/linphone/core/LinphoneCall;

    .prologue
    .line 842
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, p1}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v4

    invoke-direct {p0, p2}, Lorg/linphone/core/LinphoneCoreImpl;->getCallPtr(Lorg/linphone/core/LinphoneCall;)J

    move-result-wide v6

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->transferCallToAnother(JJJ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 843
    monitor-exit p0

    return-void

    .line 842
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tunnelAddServer(Lorg/linphone/core/TunnelConfig;)V
    .locals 4
    .param p1, "config"    # Lorg/linphone/core/TunnelConfig;

    .prologue
    .line 913
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    check-cast p1, Lorg/linphone/core/TunnelConfigImpl;

    .end local p1    # "config":Lorg/linphone/core/TunnelConfig;
    iget-wide v2, p1, Lorg/linphone/core/TunnelConfigImpl;->mNativePtr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelAddServer(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 914
    monitor-exit p0

    return-void

    .line 913
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tunnelAddServerAndMirror(Ljava/lang/String;III)V
    .locals 8
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "mirror"    # I
    .param p4, "ms"    # I

    .prologue
    .line 907
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelAddServerAndMirror(JLjava/lang/String;III)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 908
    monitor-exit p0

    return-void

    .line 907
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tunnelAutoDetect()V
    .locals 2

    .prologue
    .line 925
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelAutoDetect(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 926
    monitor-exit p0

    return-void

    .line 925
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tunnelCleanServers()V
    .locals 2

    .prologue
    .line 931
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelCleanServers(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 932
    monitor-exit p0

    return-void

    .line 931
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tunnelDualModeEnabled()Z
    .locals 2

    .prologue
    .line 973
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelDualModeEnabled(J)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized tunnelEnable(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 937
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelEnable(JZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 938
    monitor-exit p0

    return-void

    .line 937
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tunnelEnableDualMode(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 967
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelEnableDualMode(JZ)V

    .line 968
    return-void
.end method

.method public tunnelEnableSip(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 955
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1, p1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelEnableSip(JZ)V

    .line 956
    return-void
.end method

.method public declared-synchronized tunnelGetMode()Lorg/linphone/core/LinphoneCore$TunnelMode;
    .locals 2

    .prologue
    .line 949
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelGetMode(J)I

    move-result v0

    invoke-static {v0}, Lorg/linphone/core/LinphoneCore$TunnelMode;->intToEnum(I)Lorg/linphone/core/LinphoneCore$TunnelMode;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized tunnelGetServers()[Lorg/linphone/core/TunnelConfig;
    .locals 2

    .prologue
    .line 919
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelGetServers(J)[Lorg/linphone/core/TunnelConfig;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tunnelSetHttpProxy(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "proxy_host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "username"    # Ljava/lang/String;
    .param p4, "password"    # Ljava/lang/String;

    .prologue
    .line 1048
    monitor-enter p0

    :try_start_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v1, p0

    move-object v4, p1

    move v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelSetHttpProxy(JLjava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1049
    monitor-exit p0

    return-void

    .line 1048
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tunnelSetMode(Lorg/linphone/core/LinphoneCore$TunnelMode;)V
    .locals 3
    .param p1, "mode"    # Lorg/linphone/core/LinphoneCore$TunnelMode;

    .prologue
    .line 943
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-static {p1}, Lorg/linphone/core/LinphoneCore$TunnelMode;->enumToInt(Lorg/linphone/core/LinphoneCore$TunnelMode;)I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelSetMode(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 944
    monitor-exit p0

    return-void

    .line 943
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tunnelSipEnabled()Z
    .locals 2

    .prologue
    .line 961
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->tunnelSipEnabled(J)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized updateCall(Lorg/linphone/core/LinphoneCall;Lorg/linphone/core/LinphoneCallParams;)I
    .locals 8
    .param p1, "call"    # Lorg/linphone/core/LinphoneCall;
    .param p2, "params"    # Lorg/linphone/core/LinphoneCallParams;

    .prologue
    .line 585
    monitor-enter p0

    :try_start_0
    check-cast p1, Lorg/linphone/core/LinphoneCallImpl;

    .end local p1    # "call":Lorg/linphone/core/LinphoneCall;
    iget-wide v4, p1, Lorg/linphone/core/LinphoneCallImpl;->nativePtr:J

    .line 586
    .local v4, "ptrCall":J
    if-eqz p2, :cond_0

    check-cast p2, Lorg/linphone/core/LinphoneCallParamsImpl;

    .end local p2    # "params":Lorg/linphone/core/LinphoneCallParams;
    iget-wide v6, p2, Lorg/linphone/core/LinphoneCallParamsImpl;->nativePtr:J

    .line 588
    .local v6, "ptrParams":J
    :goto_0
    iget-wide v2, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lorg/linphone/core/LinphoneCoreImpl;->updateCall(JJJ)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 586
    .end local v6    # "ptrParams":J
    .restart local p2    # "params":Lorg/linphone/core/LinphoneCallParams;
    :cond_0
    const-wide/16 v6, 0x0

    goto :goto_0

    .line 585
    .end local v4    # "ptrCall":J
    .end local p2    # "params":Lorg/linphone/core/LinphoneCallParams;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public uploadLogCollection()V
    .locals 2

    .prologue
    .line 1550
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->uploadLogCollection(J)V

    .line 1551
    return-void
.end method

.method public declared-synchronized upnpAvailable()Z
    .locals 2

    .prologue
    .line 1192
    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->upnpAvailable(J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public usePCCWFallbackRegisterPort()Z
    .locals 2

    .prologue
    .line 1353
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->usePCCWFallbackRegisterPort(J)Z

    move-result v0

    return v0
.end method

.method public videoMulticastEnabled()Z
    .locals 2

    .prologue
    .line 1632
    iget-wide v0, p0, Lorg/linphone/core/LinphoneCoreImpl;->nativePtr:J

    invoke-direct {p0, v0, v1}, Lorg/linphone/core/LinphoneCoreImpl;->videoMulticastEnabled(J)Z

    move-result v0

    return v0
.end method
