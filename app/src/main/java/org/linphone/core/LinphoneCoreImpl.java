package org.linphone.core;

import android.content.Context;
import android.media.AudioManager;
import java.io.File;
import java.io.IOException;
import org.linphone.core.LinphoneAddressImpl;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallLog;
import org.linphone.core.LinphoneCore;
import org.linphone.mediastream.Factory;
import org.linphone.mediastream.Log;
import org.linphone.mediastream.video.AndroidVideoWindowImpl;
import org.linphone.mediastream.video.capture.hwconf.Hacks;

class LinphoneCoreImpl implements LinphoneCore {
    static int FIND_PAYLOAD_IGNORE_CHANNELS = -1;
    static int FIND_PAYLOAD_IGNORE_RATE = -1;
    private AudioManager mAudioManager = null;
    private Context mContext = null;
    private final LinphoneCoreListener mListener;
    private boolean mSpeakerEnabled = false;
    private boolean mSpeakerphoneAlwaysOn = false;
    protected long nativePtr = 0;
    private boolean openh264DownloadEnabled = false;

    LinphoneCoreImpl(LinphoneCoreListener linphoneCoreListener, File file, File file2, Object obj, Object obj2) throws IOException {
        String str = null;
        this.mListener = linphoneCoreListener;
        this.nativePtr = newLinphoneCore(linphoneCoreListener, file == null ? null : file.getCanonicalPath(), file2 != null ? file2.getCanonicalPath() : str, obj, obj2);
        setContext(obj2);
    }

    LinphoneCoreImpl(LinphoneCoreListener linphoneCoreListener, Object obj) throws IOException {
        this.mListener = linphoneCoreListener;
        this.nativePtr = newLinphoneCore(linphoneCoreListener, (String) null, (String) null, (Object) null, obj);
        setContext(obj);
    }

    private native void acceptCall(long j, long j2);

    private native void acceptCallUpdate(long j, long j2, long j3);

    private native void acceptCallWithParams(long j, long j2, long j3);

    private native boolean acceptEarlyMedia(long j, long j2);

    private native boolean acceptEarlyMediaWithParams(long j, long j2, long j3);

    private native void addAllToConference(long j);

    private native void addAuthInfo(long j, long j2);

    private native void addFriend(long j, long j2);

    private native void addFriendList(long j, long j2);

    private native void addListener(long j, LinphoneCoreListener linphoneCoreListener);

    private native int addProxyConfig(LinphoneProxyConfig linphoneProxyConfig, long j, long j2);

    private native void addToConference(long j, long j2);

    private void applyAudioHacks() {
        if (Hacks.needGalaxySAudioHack()) {
            setMicrophoneGain(-9.0f);
        }
    }

    private native boolean audioMulticastEnabled(long j);

    private native boolean chatEnabled(long j);

    private native void clearAuthInfos(long j);

    private native void clearCallLogs(long j);

    private native void clearProxyConfigs(long j);

    private boolean contextInitialized() {
        if (this.mContext != null) {
            return true;
        }
        Log.e("Context of LinphoneCore has not been initialized, call setContext() after creating LinphoneCore.");
        return false;
    }

    private native long createCallLog(long j, long j2, long j3, int i, int i2, long j4, long j5, int i3, boolean z, float f);

    private native long createCallParams(long j, long j2);

    private native LinphoneConference createConference(long j, LinphoneConferenceParams linphoneConferenceParams);

    private native Object createFriend(long j);

    private native Object createFriendWithAddress(long j, String str);

    private native long createInfoMessage(long j);

    private native long createLocalPlayer(long j, AndroidVideoWindowImpl androidVideoWindowImpl);

    private native Object createNatPolicy(long j);

    private native Object createPublish(long j, long j2, String str, int i);

    private native Object createSubscribe(long j, long j2, String str, int i);

    private native void declineCall(long j, long j2, int i);

    private native void deferCallUpdate(long j, long j2);

    private native void delete(long j);

    private native void disableChat(long j, int i);

    private native boolean dnsSrvEnabled(long j);

    private native void enableAdaptiveRateControl(long j, boolean z);

    private native void enableAudioMulticast(long j, boolean z);

    private native void enableChat(long j);

    private native void enableDnsSrv(long j, boolean z);

    private native void enableEchoCancellation(long j, boolean z);

    private native void enableEchoLimiter(long j, boolean z);

    private native void enableIpv6(long j, boolean z);

    private native void enableKeepAlive(long j, boolean z);

    private native void enablePCCWFallbackRegisterPort(long j, boolean z);

    private native int enablePayloadType(long j, long j2, boolean z);

    private native void enableSdp200Ack(long j, boolean z);

    private native void enableVideo(long j, boolean z, boolean z2);

    private native void enableVideoMulticast(long j, boolean z);

    private native boolean enterConference(long j);

    private native long findAuthInfos(long j, String str, String str2, String str3);

    private native Object findCallFromUri(long j, String str);

    private native LinphoneAddress[] findContactsByChar(long j, String str, boolean z);

    private native long findPayloadType(long j, String str, int i, int i2);

    private native void forceSpeakerState(long j, boolean z);

    private native String getAdaptiveRateAlgorithm(long j);

    private native int getAudioDscp(long j);

    private native String getAudioMulticastAddr(long j);

    private native int getAudioMulticastTtl(long j);

    private native long[] getAuthInfosList(long j);

    private native Object getCall(long j, int i);

    private native long getCallLog(long j, int i);

    private native long[] getCallLogs(long j);

    private long getCallParamsPtr(LinphoneCallParams linphoneCallParams) {
        return ((LinphoneCallParamsImpl) linphoneCallParams).nativePtr;
    }

    private long getCallPtr(LinphoneCall linphoneCall) {
        return ((LinphoneCallImpl) linphoneCall).nativePtr;
    }

    private native int getCallsNb(long j);

    private native Object getChatRoom(long j, long j2);

    private native Object[] getChatRooms(long j);

    private native LinphoneConference getConference(long j);

    private native int getConferenceSize(long j);

    private native long getConfig(long j);

    private native Object getCurrentCall(long j);

    private native LinphoneProxyConfig getDefaultProxyConfig(long j);

    private native int getDownloadBandwidth(long j);

    private native String getFileTransferServer(long j);

    private native int getFirewallPolicy(long j);

    private native LinphoneFriend getFriendByAddress(long j, String str);

    private native LinphoneFriend[] getFriendList(long j);

    private native LinphoneFriendList[] getFriendLists(long j);

    private native int getGlobalState(long j);

    private native String getHttpProxyHost(long j);

    private native int getHttpProxyPort(long j);

    private native int getInCallTimeout(long j);

    private native int getIncomingTimeout(long j);

    private native long getLastOutgoingCallLog(long j);

    private native int getLimeEncryption(long j);

    private native Object getMSFactory(long j);

    private native int getMaxCalls(long j);

    private native int getMediaEncryption(long j);

    private native int getMissedCallsCount(long j);

    private native int getMtu(long j);

    private native Object getNatPolicy(long j);

    private native int getNortpTimeout(long j);

    private native int getNumberOfCallLogs(long j);

    private native Object getOrCreateChatRoom(long j, String str);

    private native int getPCCWDoubleRegisterTimeout(long j);

    private native int getPayloadTypeBitrate(long j, long j2);

    private native int getPayloadTypeNumber(long j, long j2);

    private native float getPlaybackGain(long j);

    private native float getPreferredFramerate(long j);

    private native int[] getPreferredVideoSize(long j);

    private native int getPresenceInfo(long j);

    private native Object getPresenceModel(long j);

    private native String getPrimaryContact(long j);

    private native String getPrimaryContactDisplayName(long j);

    private native String getPrimaryContactUsername(long j);

    private native String getProvisioningUri(long j);

    private native LinphoneProxyConfig[] getProxyConfigList(long j);

    private native long getRemoteAddress(long j);

    private native String getRemoteRingbackTone(long j);

    private native String getRing(long j);

    private native int getSignalingTransportPort(long j, int i);

    private native int getSipDscp(long j);

    private native int getSipTransportTimeout(long j);

    private native String getStunServer(long j);

    private native String getTlsCertificate(long j);

    private native String getTlsCertificatePath(long j);

    private native String getTlsKey(long j);

    private native String getTlsKeyPath(long j);

    private native int getUploadBandwidth(long j);

    private native String getUpnpExternalIpaddress(long j);

    private native int getUpnpState(long j);

    private native boolean getUseRfc2833ForDtmfs(long j);

    private native boolean getUseSipInfoForDtmfs(long j);

    private native String getVersion(long j);

    private native boolean getVideoAutoAcceptPolicy(long j);

    private native boolean getVideoAutoInitiatePolicy(long j);

    private native int getVideoDevice(long j);

    private native int getVideoDscp(long j);

    private native String getVideoMulticastAddr(long j);

    private native int getVideoMulticastTtl(long j);

    private native String getVideoPreset(long j);

    private native boolean hasBuiltInEchoCanceler(long j);

    private native boolean hasCrappyOpenGL(long j);

    private native long interpretUrl(long j, String str);

    private native Object invite(long j, String str);

    private native Object inviteAddress(long j, long j2);

    private native Object inviteAddressWithParams(long j, long j2, long j3);

    private native boolean isAdaptiveRateControlEnabled(long j);

    private native boolean isEchoCancellationEnabled(long j);

    private native boolean isEchoLimiterEnabled(long j);

    private native boolean isInCall(long j);

    private native boolean isInComingInvitePending(long j);

    private native boolean isInConference(long j);

    private native boolean isIpv6Enabled(long j);

    private native boolean isKeepAliveEnabled(long j);

    private native boolean isLimeEncryptionAvailable(long j);

    private native boolean isMediaEncryptionMandatory(long j);

    private native boolean isMicMuted(long j);

    private native boolean isNetworkStateReachable(long j);

    private native boolean isPayloadTypeEnabled(long j, long j2);

    private native boolean isSdp200AckEnabled(long j);

    private native boolean isVCardSupported(long j);

    private void isValid() {
        if (this.nativePtr == 0) {
            throw new RuntimeException("object already destroyed");
        }
    }

    private native boolean isVideoEnabled(long j);

    private native boolean isVideoSupported(long j);

    private native void iterate(long j);

    private native void leaveConference(long j);

    private native long[] listAudioPayloadTypes(long j);

    private native String[] listSupportedVideoResolutions(long j);

    private native long[] listVideoPayloadTypes(long j);

    private native boolean mediaEncryptionSupported(long j, int i);

    private native void migrateCallLogs(long j);

    private native int migrateToMultiTransport(long j);

    private native void muteMic(long j, boolean z);

    private native boolean needsEchoCalibration(long j);

    private native long newLinphoneCore(LinphoneCoreListener linphoneCoreListener, String str, String str2, Object obj, Object obj2);

    private native int pauseAllCalls(long j);

    private native int pauseCall(long j, long j2);

    private native boolean payloadTypeIsVbr(long j, long j2);

    private native void playDtmf(long j, char c, int i);

    private native Object publish(long j, long j2, String str, int i, String str2, String str3, byte[] bArr, String str4);

    private native void refreshRegisters(long j);

    private native void reloadMsPlugins(long j, String str);

    private native void reloadSoundDevices(long j);

    private native void removeAuthInfo(long j, long j2);

    private native void removeCallLog(long j, long j2);

    private native void removeFriend(long j, long j2);

    private native void removeFriendList(long j, long j2);

    private native void removeFromConference(long j, long j2);

    private native void removeListener(long j, LinphoneCoreListener linphoneCoreListener);

    private native void removeProxyConfig(long j, long j2);

    private native void resetMissedCallsCount(long j);

    private native int resumeCall(long j, long j2);

    private native void sendDtmf(long j, char c);

    private native int sendDtmfs(long j, String str);

    private native void setAdaptiveRateAlgorithm(long j, String str);

    private native void setAndroidMulticastLock(long j, Object obj);

    private static native void setAndroidPowerManager(Object obj);

    private native void setAndroidWifiLock(long j, Object obj);

    private native void setAudioCodecs(long j, long[] jArr);

    private native void setAudioDscp(long j, int i);

    private native void setAudioJittcomp(long j, int i);

    private void setAudioModeIncallForGalaxyS() {
        if (contextInitialized()) {
            this.mAudioManager.setMode(2);
        }
    }

    private native int setAudioMulticastAddr(long j, String str);

    private native int setAudioMulticastTtl(long j, int i);

    private native void setAudioPort(long j, int i);

    private native void setAudioPortRange(long j, int i, int i2);

    private native void setCallErrorTone(long j, int i, String str);

    private native void setCallLogsDatabasePath(long j, String str);

    private native void setChatDatabasePath(long j, String str);

    private native void setCpuCountNative(long j, int i);

    private native void setDefaultProxyConfig(long j, long j2);

    private native void setDefaultSoundDevices(long j);

    private native void setDeviceRotation(long j, int i);

    private native void setDnsServers(long j, String[] strArr);

    private native void setDownloadBandwidth(long j, int i);

    private native void setDownloadPtime(long j, int i);

    private native void setFileTransferServer(long j, String str);

    private native void setFirewallPolicy(long j, int i);

    private native void setFriendsDatabasePath(long j, String str);

    private native void setHttpProxyHost(long j, String str);

    private native void setHttpProxyPort(long j, int i);

    private native void setInCallTimeout(long j, int i);

    private native void setIncomingTimeout(long j, int i);

    private native void setLimeEncryption(long j, int i);

    private native void setMaxCalls(long j, int i);

    private native void setMediaEncryption(long j, int i);

    private native void setMediaEncryptionMandatory(long j, boolean z);

    private native void setMediaNetworkReachable(long j, boolean z);

    private native void setMicrophoneGain(long j, float f);

    private native void setMtu(long j, int i);

    private native void setNatPolicy(long j, long j2);

    private native void setNetworkStateReachable(long j, boolean z);

    private native void setNortpTimeout(long j, int i);

    private native void setPCCWDoubleRegisterTimeout(long j, int i);

    private native void setPayloadTypeBitrate(long j, long j2, int i);

    private native void setPayloadTypeNumber(long j, long j2, int i);

    private native void setPlayFile(long j, String str);

    private native void setPlaybackGain(long j, float f);

    private native void setPreferredFramerate(long j, float f);

    private native void setPreferredVideoSize(long j, int i, int i2);

    private native void setPreferredVideoSizeByName(long j, String str);

    private native void setPresenceInfo(long j, int i, String str, int i2);

    private native void setPresenceModel(long j, long j2);

    private native void setPreviewWindowId(long j, Object obj);

    private native void setPrimaryContact(long j, String str, String str2);

    private native void setPrimaryContact2(long j, String str);

    private native void setProvisioningUri(long j, String str);

    private native void setRemoteRingbackTone(long j, String str);

    private native void setRing(long j, String str);

    private native void setRingback(long j, String str);

    private native void setRootCA(long j, String str);

    private native void setRootCAData(long j, String str);

    private native void setSignalingTransportPorts(long j, int i, int i2, int i3);

    private native void setSipDscp(long j, int i);

    private native void setSipNetworkReachable(long j, boolean z);

    private native void setSipTransportTimeout(long j, int i);

    private native void setStaticPicture(long j, String str);

    private native void setStunServer(long j, String str);

    private native void setTlsCertificate(long j, String str);

    private native void setTlsCertificatePath(long j, String str);

    private native void setTlsKey(long j, String str);

    private native void setTlsKeyPath(long j, String str);

    private native void setTone(long j, int i, String str);

    private native void setUploadBandwidth(long j, int i);

    private native void setUploadPtime(long j, int i);

    private native void setUseRfc2833ForDtmfs(long j, boolean z);

    private native void setUseSipInfoForDtmfs(long j, boolean z);

    private native void setUserAgent(long j, String str, String str2);

    private native void setUserCertificatesPath(long j, String str);

    private native void setVerifyServerCN(long j, boolean z);

    private native void setVerifyServerCertificates(long j, boolean z);

    private native void setVideoCodecs(long j, long[] jArr);

    private native int setVideoDevice(long j, int i);

    private native void setVideoDscp(long j, int i);

    private native void setVideoJittcomp(long j, int i);

    private native int setVideoMulticastAddr(long j, String str);

    private native int setVideoMulticastTtl(long j, int i);

    private native void setVideoPolicy(long j, boolean z, boolean z2);

    private native void setVideoPort(long j, int i);

    private native void setVideoPortRange(long j, int i, int i2);

    private native void setVideoPreset(long j, String str);

    private native void setVideoWindowId(long j, Object obj);

    private native void setZrtpSecretsCache(long j, String str);

    private native boolean soundResourcesLocked(long j);

    private native int startConferenceRecording(long j, String str);

    private native int startEchoCalibration(long j, Object obj);

    private native int startEchoTester(long j, int i);

    private native LinphoneCall startReferedCall(long j, long j2, long j3);

    private native int stopConferenceRecording(long j);

    private native void stopDtmf(long j);

    private native int stopEchoTester(long j);

    private native void stopRinging(long j);

    private native Object subscribe(long j, long j2, String str, int i, String str2, String str3, byte[] bArr, String str4);

    private native void terminateAllCalls(long j);

    private native void terminateCall(long j, long j2);

    private native void terminateConference(long j);

    private native int transferCall(long j, long j2, String str);

    private native int transferCallToAnother(long j, long j2, long j3);

    private native void tunnelAddServer(long j, long j2);

    private native void tunnelAddServerAndMirror(long j, String str, int i, int i2, int i3);

    private native void tunnelAutoDetect(long j);

    private native void tunnelCleanServers(long j);

    private native boolean tunnelDualModeEnabled(long j);

    private native void tunnelEnable(long j, boolean z);

    private native void tunnelEnableDualMode(long j, boolean z);

    private native void tunnelEnableSip(long j, boolean z);

    private native int tunnelGetMode(long j);

    private final native TunnelConfig[] tunnelGetServers(long j);

    private native void tunnelSetHttpProxy(long j, String str, int i, String str2, String str3);

    private native void tunnelSetMode(long j, int i);

    private native boolean tunnelSipEnabled(long j);

    private native int updateCall(long j, long j2, long j3);

    private native void uploadLogCollection(long j);

    private native boolean upnpAvailable(long j);

    private native boolean usePCCWFallbackRegisterPort(long j);

    private native boolean videoMulticastEnabled(long j);

    public void acceptCall(LinphoneCall linphoneCall) {
        synchronized (this) {
            isValid();
            acceptCall(this.nativePtr, ((LinphoneCallImpl) linphoneCall).nativePtr);
        }
    }

    public void acceptCallUpdate(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams) throws LinphoneCoreException {
        synchronized (this) {
            acceptCallUpdate(this.nativePtr, getCallPtr(linphoneCall), getCallParamsPtr(linphoneCallParams));
        }
    }

    public void acceptCallWithParams(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams) throws LinphoneCoreException {
        synchronized (this) {
            acceptCallWithParams(this.nativePtr, getCallPtr(linphoneCall), getCallParamsPtr(linphoneCallParams));
        }
    }

    public boolean acceptEarlyMedia(LinphoneCall linphoneCall) {
        boolean acceptEarlyMedia;
        synchronized (this) {
            acceptEarlyMedia = acceptEarlyMedia(this.nativePtr, getCallPtr(linphoneCall));
        }
        return acceptEarlyMedia;
    }

    public boolean acceptEarlyMediaWithParams(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams) {
        boolean acceptEarlyMediaWithParams;
        synchronized (this) {
            acceptEarlyMediaWithParams = acceptEarlyMediaWithParams(this.nativePtr, getCallPtr(linphoneCall), linphoneCallParams != null ? ((LinphoneCallParamsImpl) linphoneCallParams).nativePtr : 0);
        }
        return acceptEarlyMediaWithParams;
    }

    public void addAllToConference() {
        synchronized (this) {
            addAllToConference(this.nativePtr);
        }
    }

    public void addAuthInfo(LinphoneAuthInfo linphoneAuthInfo) {
        synchronized (this) {
            isValid();
            addAuthInfo(this.nativePtr, ((LinphoneAuthInfoImpl) linphoneAuthInfo).nativePtr);
        }
    }

    public void addFriend(LinphoneFriend linphoneFriend) throws LinphoneCoreException {
        synchronized (this) {
            addFriend(this.nativePtr, ((LinphoneFriendImpl) linphoneFriend).nativePtr);
        }
    }

    public void addFriendList(LinphoneFriendList linphoneFriendList) throws LinphoneCoreException {
        synchronized (this) {
            addFriendList(this.nativePtr, ((LinphoneFriendListImpl) linphoneFriendList).nativePtr);
        }
    }

    public void addListener(LinphoneCoreListener linphoneCoreListener) {
        synchronized (this) {
            addListener(this.nativePtr, linphoneCoreListener);
        }
    }

    public void addProxyConfig(LinphoneProxyConfig linphoneProxyConfig) throws LinphoneCoreException {
        synchronized (this) {
            isValid();
            if (addProxyConfig(linphoneProxyConfig, this.nativePtr, ((LinphoneProxyConfigImpl) linphoneProxyConfig).nativePtr) != 0) {
                throw new LinphoneCoreException("bad proxy config");
            }
            ((LinphoneProxyConfigImpl) linphoneProxyConfig).mCore = this;
        }
    }

    public void addToConference(LinphoneCall linphoneCall) {
        synchronized (this) {
            addToConference(this.nativePtr, getCallPtr(linphoneCall));
        }
    }

    public void adjustSoftwareVolume(int i) {
        synchronized (this) {
        }
    }

    public boolean audioMulticastEnabled() {
        return audioMulticastEnabled(this.nativePtr);
    }

    public boolean chatEnabled() {
        boolean chatEnabled;
        synchronized (this) {
            chatEnabled = chatEnabled(this.nativePtr);
        }
        return chatEnabled;
    }

    public void clearAuthInfos() {
        synchronized (this) {
            isValid();
            clearAuthInfos(this.nativePtr);
        }
    }

    public void clearCallLogs() {
        synchronized (this) {
            clearCallLogs(this.nativePtr);
        }
    }

    public void clearProxyConfigs() {
        synchronized (this) {
            isValid();
            clearProxyConfigs(this.nativePtr);
        }
    }

    public LinphoneCallLog createCallLog(LinphoneAddress linphoneAddress, LinphoneAddress linphoneAddress2, CallDirection callDirection, int i, long j, long j2, LinphoneCallLog.CallStatus callStatus, boolean z, float f) {
        return new LinphoneCallLogImpl(createCallLog(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr, ((LinphoneAddressImpl) linphoneAddress2).nativePtr, callDirection == CallDirection.Incoming ? 1 : 0, i, j, j2, callStatus.toInt(), z, f));
    }

    public LinphoneCallParams createCallParams(LinphoneCall linphoneCall) {
        long j = 0;
        if (linphoneCall != null) {
            j = ((LinphoneCallImpl) linphoneCall).nativePtr;
        }
        return new LinphoneCallParamsImpl(createCallParams(this.nativePtr, j));
    }

    public LinphoneConference createConference(LinphoneConferenceParams linphoneConferenceParams) {
        LinphoneConference createConference;
        synchronized (this) {
            createConference = createConference(this.nativePtr, linphoneConferenceParams);
        }
        return createConference;
    }

    public LinphoneFriend createFriend() {
        return (LinphoneFriend) createFriend(this.nativePtr);
    }

    public LinphoneFriend createFriendWithAddress(String str) {
        return (LinphoneFriend) createFriendWithAddress(this.nativePtr, str);
    }

    public LinphoneInfoMessage createInfoMessage() {
        LinphoneInfoMessageImpl linphoneInfoMessageImpl;
        synchronized (this) {
            linphoneInfoMessageImpl = new LinphoneInfoMessageImpl(createInfoMessage(this.nativePtr));
        }
        return linphoneInfoMessageImpl;
    }

    public LinphoneFriendList createLinphoneFriendList() {
        LinphoneFriendListImpl linphoneFriendListImpl;
        synchronized (this) {
            linphoneFriendListImpl = new LinphoneFriendListImpl(this);
        }
        return linphoneFriendListImpl;
    }

    public LinphonePlayer createLocalPlayer(AndroidVideoWindowImpl androidVideoWindowImpl) {
        LinphonePlayerImpl linphonePlayerImpl;
        synchronized (this) {
            long createLocalPlayer = createLocalPlayer(this.nativePtr, androidVideoWindowImpl);
            linphonePlayerImpl = createLocalPlayer != 0 ? new LinphonePlayerImpl(createLocalPlayer) : null;
        }
        return linphonePlayerImpl;
    }

    public LinphoneNatPolicy createNatPolicy() {
        LinphoneNatPolicy linphoneNatPolicy;
        synchronized (this) {
            linphoneNatPolicy = (LinphoneNatPolicy) createNatPolicy(this.nativePtr);
        }
        return linphoneNatPolicy;
    }

    public LinphoneProxyConfig createProxyConfig() {
        LinphoneProxyConfigImpl linphoneProxyConfigImpl;
        synchronized (this) {
            linphoneProxyConfigImpl = new LinphoneProxyConfigImpl(this);
        }
        return linphoneProxyConfigImpl;
    }

    public LinphoneProxyConfig createProxyConfig(String str, String str2, String str3, boolean z) throws LinphoneCoreException {
        LinphoneProxyConfigImpl linphoneProxyConfigImpl;
        synchronized (this) {
            isValid();
            try {
                linphoneProxyConfigImpl = new LinphoneProxyConfigImpl(this, str, str2, str3, z);
            } catch (LinphoneCoreException e) {
                linphoneProxyConfigImpl = null;
            }
        }
        return linphoneProxyConfigImpl;
    }

    public LinphoneEvent createPublish(LinphoneAddress linphoneAddress, String str, int i) {
        LinphoneEvent linphoneEvent;
        synchronized (this) {
            linphoneEvent = (LinphoneEvent) createPublish(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr, str, i);
        }
        return linphoneEvent;
    }

    public LinphoneEvent createSubscribe(LinphoneAddress linphoneAddress, String str, int i) {
        LinphoneEvent linphoneEvent;
        synchronized (this) {
            linphoneEvent = (LinphoneEvent) createSubscribe(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr, str, i);
        }
        return linphoneEvent;
    }

    public void declineCall(LinphoneCall linphoneCall, Reason reason) {
        synchronized (this) {
            declineCall(this.nativePtr, ((LinphoneCallImpl) linphoneCall).nativePtr, reason.mValue);
        }
    }

    public void deferCallUpdate(LinphoneCall linphoneCall) throws LinphoneCoreException {
        synchronized (this) {
            deferCallUpdate(this.nativePtr, getCallPtr(linphoneCall));
        }
    }

    public void destroy() {
        synchronized (this) {
            delete(this.nativePtr);
            setAndroidPowerManager((Object) null);
            this.nativePtr = 0;
        }
    }

    public void disableChat(Reason reason) {
        synchronized (this) {
            disableChat(this.nativePtr, reason.mValue);
        }
    }

    public boolean dnsSrvEnabled() {
        return dnsSrvEnabled(this.nativePtr);
    }

    public boolean downloadOpenH264Enabled() {
        return this.openh264DownloadEnabled;
    }

    public void enableAdaptiveRateControl(boolean z) {
        synchronized (this) {
            enableAdaptiveRateControl(this.nativePtr, z);
        }
    }

    public void enableAudioMulticast(boolean z) {
        enableAudioMulticast(this.nativePtr, z);
    }

    public void enableChat() {
        synchronized (this) {
            enableChat(this.nativePtr);
        }
    }

    public void enableDnsSrv(boolean z) {
        enableDnsSrv(this.nativePtr, z);
    }

    public void enableDownloadOpenH264(boolean z) {
        this.openh264DownloadEnabled = z;
    }

    public void enableEchoCancellation(boolean z) {
        synchronized (this) {
            isValid();
            enableEchoCancellation(this.nativePtr, z);
        }
    }

    public void enableEchoLimiter(boolean z) {
        synchronized (this) {
            enableEchoLimiter(this.nativePtr, z);
        }
    }

    public void enableIpv6(boolean z) {
        synchronized (this) {
            enableIpv6(this.nativePtr, z);
        }
    }

    public void enableKeepAlive(boolean z) {
        synchronized (this) {
            enableKeepAlive(this.nativePtr, z);
        }
    }

    public void enablePCCWFallbackRegisterPort(boolean z) {
        enablePCCWFallbackRegisterPort(this.nativePtr, z);
    }

    public void enablePayloadType(PayloadType payloadType, boolean z) throws LinphoneCoreException {
        synchronized (this) {
            isValid();
            if (enablePayloadType(this.nativePtr, ((PayloadTypeImpl) payloadType).nativePtr, z) != 0) {
                throw new LinphoneCoreException("cannot enable payload type [" + payloadType + "]");
            }
        }
    }

    public void enableSdp200Ack(boolean z) {
        synchronized (this) {
            enableSdp200Ack(this.nativePtr, z);
        }
    }

    public void enableSpeaker(boolean z) {
        boolean z2 = z || this.mSpeakerphoneAlwaysOn;
        LinphoneCall currentCall = getCurrentCall();
        this.mSpeakerEnabled = z2;
        applyAudioHacks();
        if (currentCall == null || currentCall.getState() != LinphoneCall.State.StreamsRunning || !Hacks.needGalaxySAudioHack()) {
            routeAudioToSpeakerHelper(z2);
            return;
        }
        Log.d("Hack to have speaker=", Boolean.valueOf(z2), " while on call");
        forceSpeakerState(this.nativePtr, z2);
    }

    public void enableVideo(boolean z, boolean z2) {
        synchronized (this) {
            enableVideo(this.nativePtr, z, z2);
        }
    }

    public void enableVideoMulticast(boolean z) {
        enableVideoMulticast(this.nativePtr, z);
    }

    public boolean enterConference() {
        boolean enterConference;
        synchronized (this) {
            enterConference = enterConference(this.nativePtr);
        }
        return enterConference;
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.nativePtr != 0) {
            destroy();
        }
    }

    public LinphoneAuthInfo findAuthInfo(String str, String str2, String str3) {
        LinphoneAuthInfoImpl linphoneAuthInfoImpl;
        synchronized (this) {
            long findAuthInfos = findAuthInfos(this.nativePtr, str, str2, str3);
            linphoneAuthInfoImpl = findAuthInfos == 0 ? null : new LinphoneAuthInfoImpl(findAuthInfos);
        }
        return linphoneAuthInfoImpl;
    }

    public LinphoneCall findCallFromUri(String str) {
        LinphoneCall linphoneCall;
        synchronized (this) {
            linphoneCall = (LinphoneCall) findCallFromUri(this.nativePtr, str);
        }
        return linphoneCall;
    }

    public LinphoneAddress[] findContactsByChar(String str, boolean z) {
        LinphoneAddress[] findContactsByChar;
        synchronized (this) {
            findContactsByChar = findContactsByChar(this.nativePtr, str, z);
        }
        return findContactsByChar;
    }

    public LinphoneFriend findFriendByAddress(String str) {
        LinphoneFriend friendByAddress;
        synchronized (this) {
            friendByAddress = getFriendByAddress(this.nativePtr, str);
        }
        return friendByAddress;
    }

    public PayloadType findPayloadType(String str) {
        PayloadType findPayloadType;
        synchronized (this) {
            findPayloadType = findPayloadType(str, FIND_PAYLOAD_IGNORE_RATE);
        }
        return findPayloadType;
    }

    public PayloadType findPayloadType(String str, int i) {
        PayloadType findPayloadType;
        synchronized (this) {
            findPayloadType = findPayloadType(str, i, FIND_PAYLOAD_IGNORE_CHANNELS);
        }
        return findPayloadType;
    }

    public PayloadType findPayloadType(String str, int i, int i2) {
        PayloadTypeImpl payloadTypeImpl;
        synchronized (this) {
            isValid();
            long findPayloadType = findPayloadType(this.nativePtr, str, i, i2);
            payloadTypeImpl = findPayloadType == 0 ? null : new PayloadTypeImpl(findPayloadType);
        }
        return payloadTypeImpl;
    }

    public LinphoneCore.AdaptiveRateAlgorithm getAdaptiveRateAlgorithm() {
        LinphoneCore.AdaptiveRateAlgorithm fromString;
        synchronized (this) {
            fromString = LinphoneCore.AdaptiveRateAlgorithm.fromString(getAdaptiveRateAlgorithm(this.nativePtr));
        }
        return fromString;
    }

    public PayloadType[] getAudioCodecs() {
        PayloadType[] payloadTypeArr;
        synchronized (this) {
            long[] listAudioPayloadTypes = listAudioPayloadTypes(this.nativePtr);
            if (listAudioPayloadTypes == null) {
                payloadTypeArr = null;
            } else {
                PayloadType[] payloadTypeArr2 = new PayloadType[listAudioPayloadTypes.length];
                for (int i = 0; i < payloadTypeArr2.length; i++) {
                    payloadTypeArr2[i] = new PayloadTypeImpl(listAudioPayloadTypes[i]);
                }
                payloadTypeArr = payloadTypeArr2;
            }
        }
        return payloadTypeArr;
    }

    public int getAudioDscp() {
        int audioDscp;
        synchronized (this) {
            audioDscp = getAudioDscp(this.nativePtr);
        }
        return audioDscp;
    }

    public String getAudioMulticastAddr() {
        return getAudioMulticastAddr(this.nativePtr);
    }

    public int getAudioMulticastTtl() {
        return getAudioMulticastTtl(this.nativePtr);
    }

    public LinphoneAuthInfo[] getAuthInfosList() {
        LinphoneAuthInfo[] linphoneAuthInfoArr;
        synchronized (this) {
            long[] authInfosList = getAuthInfosList(this.nativePtr);
            if (authInfosList == null) {
                linphoneAuthInfoArr = null;
            } else {
                LinphoneAuthInfo[] linphoneAuthInfoArr2 = new LinphoneAuthInfo[authInfosList.length];
                for (int i = 0; i < linphoneAuthInfoArr2.length; i++) {
                    linphoneAuthInfoArr2[i] = new LinphoneAuthInfoImpl(authInfosList[i]);
                }
                linphoneAuthInfoArr = linphoneAuthInfoArr2;
            }
        }
        return linphoneAuthInfoArr;
    }

    public LinphoneCallLog[] getCallLogs() {
        LinphoneCallLog[] linphoneCallLogArr;
        synchronized (this) {
            long[] callLogs = getCallLogs(this.nativePtr);
            if (callLogs == null) {
                linphoneCallLogArr = null;
            } else {
                isValid();
                LinphoneCallLog[] linphoneCallLogArr2 = new LinphoneCallLog[callLogs.length];
                for (int i = 0; i < linphoneCallLogArr2.length; i++) {
                    linphoneCallLogArr2[i] = new LinphoneCallLogImpl(callLogs[i]);
                }
                linphoneCallLogArr = linphoneCallLogArr2;
            }
        }
        return linphoneCallLogArr;
    }

    public LinphoneCall[] getCalls() {
        LinphoneCall[] linphoneCallArr;
        synchronized (this) {
            int callsNb = getCallsNb(this.nativePtr);
            linphoneCallArr = new LinphoneCall[callsNb];
            for (int i = 0; i < callsNb; i++) {
                linphoneCallArr[i] = (LinphoneCall) getCall(this.nativePtr, i);
            }
        }
        return linphoneCallArr;
    }

    public int getCallsNb() {
        int callsNb;
        synchronized (this) {
            callsNb = getCallsNb(this.nativePtr);
        }
        return callsNb;
    }

    public LinphoneChatRoom getChatRoom(LinphoneAddress linphoneAddress) {
        LinphoneChatRoom linphoneChatRoom;
        synchronized (this) {
            linphoneChatRoom = (LinphoneChatRoom) getChatRoom(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr);
        }
        return linphoneChatRoom;
    }

    public LinphoneChatRoom[] getChatRooms() {
        LinphoneChatRoom[] linphoneChatRoomArr;
        synchronized (this) {
            Object[] chatRooms = getChatRooms(this.nativePtr);
            if (chatRooms == null) {
                linphoneChatRoomArr = null;
            } else {
                LinphoneChatRoom[] linphoneChatRoomArr2 = new LinphoneChatRoom[chatRooms.length];
                int i = 0;
                while (true) {
                    int i2 = i;
                    if (i2 >= linphoneChatRoomArr2.length) {
                        break;
                    }
                    linphoneChatRoomArr2[i2] = (LinphoneChatRoom) chatRooms[i2];
                    i = i2 + 1;
                }
                linphoneChatRoomArr = linphoneChatRoomArr2;
            }
        }
        return linphoneChatRoomArr;
    }

    public LinphoneConference getConference() {
        LinphoneConference conference;
        synchronized (this) {
            conference = getConference(this.nativePtr);
        }
        return conference;
    }

    public int getConferenceSize() {
        int conferenceSize;
        synchronized (this) {
            conferenceSize = getConferenceSize(this.nativePtr);
        }
        return conferenceSize;
    }

    public LpConfig getConfig() {
        LpConfigImpl lpConfigImpl;
        synchronized (this) {
            lpConfigImpl = new LpConfigImpl(getConfig(this.nativePtr));
        }
        return lpConfigImpl;
    }

    public Context getContext() {
        return this.mContext;
    }

    public LinphoneCall getCurrentCall() {
        LinphoneCall linphoneCall;
        synchronized (this) {
            isValid();
            linphoneCall = (LinphoneCall) getCurrentCall(this.nativePtr);
        }
        return linphoneCall;
    }

    public LinphoneProxyConfig getDefaultProxyConfig() {
        LinphoneProxyConfig defaultProxyConfig;
        synchronized (this) {
            isValid();
            defaultProxyConfig = getDefaultProxyConfig(this.nativePtr);
        }
        return defaultProxyConfig;
    }

    public int getDownloadBandwidth() {
        int downloadBandwidth;
        synchronized (this) {
            downloadBandwidth = getDownloadBandwidth(this.nativePtr);
        }
        return downloadBandwidth;
    }

    public String getFileTransferServer() {
        String fileTransferServer;
        synchronized (this) {
            fileTransferServer = getFileTransferServer(this.nativePtr);
        }
        return fileTransferServer;
    }

    public LinphoneCore.FirewallPolicy getFirewallPolicy() {
        LinphoneCore.FirewallPolicy fromInt;
        synchronized (this) {
            fromInt = LinphoneCore.FirewallPolicy.fromInt(getFirewallPolicy(this.nativePtr));
        }
        return fromInt;
    }

    public LinphoneFriend[] getFriendList() {
        LinphoneFriend[] friendList;
        synchronized (this) {
            friendList = getFriendList(this.nativePtr);
        }
        return friendList;
    }

    public LinphoneFriendList[] getFriendLists() {
        LinphoneFriendList[] friendLists;
        synchronized (this) {
            friendLists = getFriendLists(this.nativePtr);
        }
        return friendLists;
    }

    public LinphoneCore.GlobalState getGlobalState() {
        return LinphoneCore.GlobalState.fromInt(getGlobalState(this.nativePtr));
    }

    public String getHttpProxyHost() {
        return getHttpProxyHost(this.nativePtr);
    }

    public int getHttpProxyPort() {
        return getHttpProxyPort(this.nativePtr);
    }

    public int getInCallTimeout() {
        int inCallTimeout;
        synchronized (this) {
            inCallTimeout = getInCallTimeout(this.nativePtr);
        }
        return inCallTimeout;
    }

    public int getIncomingTimeout() {
        int incomingTimeout;
        synchronized (this) {
            incomingTimeout = getIncomingTimeout(this.nativePtr);
        }
        return incomingTimeout;
    }

    public LinphoneCallLog getLastOutgoingCallLog() {
        LinphoneCallLogImpl linphoneCallLogImpl;
        synchronized (this) {
            isValid();
            linphoneCallLogImpl = new LinphoneCallLogImpl(getLastOutgoingCallLog(this.nativePtr));
        }
        return linphoneCallLogImpl;
    }

    public LinphoneCore.LinphoneLimeState getLimeEncryption() {
        LinphoneCore.LinphoneLimeState fromInt;
        synchronized (this) {
            fromInt = LinphoneCore.LinphoneLimeState.fromInt(getLimeEncryption(this.nativePtr));
        }
        return fromInt;
    }

    public Factory getMSFactory() {
        return (Factory) getMSFactory(this.nativePtr);
    }

    public int getMaxCalls() {
        int maxCalls;
        synchronized (this) {
            maxCalls = getMaxCalls(this.nativePtr);
        }
        return maxCalls;
    }

    public LinphoneCore.MediaEncryption getMediaEncryption() {
        LinphoneCore.MediaEncryption fromInt;
        synchronized (this) {
            fromInt = LinphoneCore.MediaEncryption.fromInt(getMediaEncryption(this.nativePtr));
        }
        return fromInt;
    }

    public int getMissedCallsCount() {
        int missedCallsCount;
        synchronized (this) {
            missedCallsCount = getMissedCallsCount(this.nativePtr);
        }
        return missedCallsCount;
    }

    public int getMtu() {
        int mtu;
        synchronized (this) {
            mtu = getMtu(this.nativePtr);
        }
        return mtu;
    }

    public LinphoneNatPolicy getNatPolicy() {
        LinphoneNatPolicy linphoneNatPolicy;
        synchronized (this) {
            linphoneNatPolicy = (LinphoneNatPolicy) getNatPolicy(this.nativePtr);
        }
        return linphoneNatPolicy;
    }

    public int getNortpTimeout() {
        return getNortpTimeout(this.nativePtr);
    }

    public LinphoneChatRoom getOrCreateChatRoom(String str) {
        LinphoneChatRoom linphoneChatRoom;
        synchronized (this) {
            linphoneChatRoom = (LinphoneChatRoom) getOrCreateChatRoom(this.nativePtr, str);
        }
        return linphoneChatRoom;
    }

    public int getPCCWDoubleRegisterTimeout() {
        return getPCCWDoubleRegisterTimeout(this.nativePtr);
    }

    public int getPayloadTypeBitrate(PayloadType payloadType) {
        int payloadTypeBitrate;
        synchronized (this) {
            payloadTypeBitrate = getPayloadTypeBitrate(this.nativePtr, ((PayloadTypeImpl) payloadType).nativePtr);
        }
        return payloadTypeBitrate;
    }

    public int getPayloadTypeNumber(PayloadType payloadType) {
        int payloadTypeNumber;
        synchronized (this) {
            payloadTypeNumber = getPayloadTypeNumber(this.nativePtr, ((PayloadTypeImpl) payloadType).nativePtr);
        }
        return payloadTypeNumber;
    }

    public int getPlayLevel() {
        return 0;
    }

    public float getPlaybackGain() {
        float playbackGain;
        synchronized (this) {
            playbackGain = getPlaybackGain(this.nativePtr);
        }
        return playbackGain;
    }

    public float getPreferredFramerate() {
        return getPreferredFramerate(this.nativePtr);
    }

    public VideoSize getPreferredVideoSize() {
        VideoSize videoSize;
        synchronized (this) {
            int[] preferredVideoSize = getPreferredVideoSize(this.nativePtr);
            videoSize = new VideoSize();
            videoSize.width = preferredVideoSize[0];
            videoSize.height = preferredVideoSize[1];
        }
        return videoSize;
    }

    public OnlineStatus getPresenceInfo() {
        OnlineStatus fromInt;
        synchronized (this) {
            fromInt = OnlineStatus.fromInt(getPresenceInfo(this.nativePtr));
        }
        return fromInt;
    }

    public PresenceModel getPresenceModel() {
        PresenceModel presenceModel;
        synchronized (this) {
            presenceModel = (PresenceModel) getPresenceModel(this.nativePtr);
        }
        return presenceModel;
    }

    public String getPrimaryContact() {
        String primaryContact;
        synchronized (this) {
            primaryContact = getPrimaryContact(this.nativePtr);
        }
        return primaryContact;
    }

    public String getPrimaryContactDisplayName() {
        String primaryContactDisplayName;
        synchronized (this) {
            primaryContactDisplayName = getPrimaryContactDisplayName(this.nativePtr);
        }
        return primaryContactDisplayName;
    }

    public String getPrimaryContactUsername() {
        String primaryContactUsername;
        synchronized (this) {
            primaryContactUsername = getPrimaryContactUsername(this.nativePtr);
        }
        return primaryContactUsername;
    }

    public String getProvisioningUri() {
        return getProvisioningUri(this.nativePtr);
    }

    public LinphoneProxyConfig[] getProxyConfigList() {
        LinphoneProxyConfig[] proxyConfigList;
        synchronized (this) {
            proxyConfigList = getProxyConfigList(this.nativePtr);
        }
        return proxyConfigList;
    }

    public LinphoneAddress getRemoteAddress() {
        LinphoneAddressImpl linphoneAddressImpl;
        synchronized (this) {
            isValid();
            long remoteAddress = getRemoteAddress(this.nativePtr);
            linphoneAddressImpl = remoteAddress == 0 ? null : new LinphoneAddressImpl(remoteAddress, LinphoneAddressImpl.WrapMode.FromConst);
        }
        return linphoneAddressImpl;
    }

    public String getRemoteRingbackTone() {
        return getRemoteRingbackTone(this.nativePtr);
    }

    public String getRing() {
        String ring;
        synchronized (this) {
            ring = getRing(this.nativePtr);
        }
        return ring;
    }

    public LinphoneCore.Transports getSignalingTransportPorts() {
        LinphoneCore.Transports transports;
        synchronized (this) {
            transports = new LinphoneCore.Transports();
            transports.udp = getSignalingTransportPort(this.nativePtr, 0);
            transports.tcp = getSignalingTransportPort(this.nativePtr, 1);
            transports.tls = getSignalingTransportPort(this.nativePtr, 3);
        }
        return transports;
    }

    public int getSipDscp() {
        int sipDscp;
        synchronized (this) {
            sipDscp = getSipDscp(this.nativePtr);
        }
        return sipDscp;
    }

    public int getSipTransportTimeout() {
        return getSipTransportTimeout(this.nativePtr);
    }

    public String getStunServer() {
        String stunServer;
        synchronized (this) {
            stunServer = getStunServer(this.nativePtr);
        }
        return stunServer;
    }

    public String[] getSupportedVideoSizes() {
        String[] listSupportedVideoResolutions;
        synchronized (this) {
            listSupportedVideoResolutions = listSupportedVideoResolutions(this.nativePtr);
        }
        return listSupportedVideoResolutions;
    }

    public String getTlsCertificate() {
        return getTlsCertificate(this.nativePtr);
    }

    public String getTlsCertificatePath() {
        return getTlsCertificatePath(this.nativePtr);
    }

    public String getTlsKey() {
        return getTlsKey(this.nativePtr);
    }

    public String getTlsKeyPath() {
        return getTlsKeyPath(this.nativePtr);
    }

    public int getUploadBandwidth() {
        int uploadBandwidth;
        synchronized (this) {
            uploadBandwidth = getUploadBandwidth(this.nativePtr);
        }
        return uploadBandwidth;
    }

    public String getUpnpExternalIpaddress() {
        String upnpExternalIpaddress;
        synchronized (this) {
            upnpExternalIpaddress = getUpnpExternalIpaddress(this.nativePtr);
        }
        return upnpExternalIpaddress;
    }

    public LinphoneCore.UpnpState getUpnpState() {
        LinphoneCore.UpnpState fromInt;
        synchronized (this) {
            fromInt = LinphoneCore.UpnpState.fromInt(getUpnpState(this.nativePtr));
        }
        return fromInt;
    }

    public boolean getUseRfc2833ForDtmfs() {
        boolean useRfc2833ForDtmfs;
        synchronized (this) {
            useRfc2833ForDtmfs = getUseRfc2833ForDtmfs(this.nativePtr);
        }
        return useRfc2833ForDtmfs;
    }

    public boolean getUseSipInfoForDtmfs() {
        boolean useSipInfoForDtmfs;
        synchronized (this) {
            useSipInfoForDtmfs = getUseSipInfoForDtmfs(this.nativePtr);
        }
        return useSipInfoForDtmfs;
    }

    public String getVersion() {
        return getVersion(this.nativePtr);
    }

    public boolean getVideoAutoAcceptPolicy() {
        boolean videoAutoAcceptPolicy;
        synchronized (this) {
            videoAutoAcceptPolicy = getVideoAutoAcceptPolicy(this.nativePtr);
        }
        return videoAutoAcceptPolicy;
    }

    public boolean getVideoAutoInitiatePolicy() {
        boolean videoAutoInitiatePolicy;
        synchronized (this) {
            videoAutoInitiatePolicy = getVideoAutoInitiatePolicy(this.nativePtr);
        }
        return videoAutoInitiatePolicy;
    }

    public PayloadType[] getVideoCodecs() {
        PayloadType[] payloadTypeArr;
        synchronized (this) {
            long[] listVideoPayloadTypes = listVideoPayloadTypes(this.nativePtr);
            if (listVideoPayloadTypes == null) {
                payloadTypeArr = null;
            } else {
                PayloadType[] payloadTypeArr2 = new PayloadType[listVideoPayloadTypes.length];
                for (int i = 0; i < payloadTypeArr2.length; i++) {
                    payloadTypeArr2[i] = new PayloadTypeImpl(listVideoPayloadTypes[i]);
                }
                payloadTypeArr = payloadTypeArr2;
            }
        }
        return payloadTypeArr;
    }

    public int getVideoDevice() {
        int videoDevice;
        synchronized (this) {
            videoDevice = getVideoDevice(this.nativePtr);
        }
        return videoDevice;
    }

    public int getVideoDscp() {
        int videoDscp;
        synchronized (this) {
            videoDscp = getVideoDscp(this.nativePtr);
        }
        return videoDscp;
    }

    public String getVideoMulticastAddr() {
        return getVideoMulticastAddr(this.nativePtr);
    }

    public int getVideoMulticastTtl() {
        return getVideoMulticastTtl(this.nativePtr);
    }

    public String getVideoPreset() {
        return getVideoPreset(this.nativePtr);
    }

    public boolean hasBuiltInEchoCanceler() {
        boolean hasBuiltInEchoCanceler;
        synchronized (this) {
            hasBuiltInEchoCanceler = hasBuiltInEchoCanceler(this.nativePtr);
        }
        return hasBuiltInEchoCanceler;
    }

    public boolean hasCrappyOpenGL() {
        boolean hasCrappyOpenGL;
        synchronized (this) {
            hasCrappyOpenGL = hasCrappyOpenGL(this.nativePtr);
        }
        return hasCrappyOpenGL;
    }

    public LinphoneAddress interpretUrl(String str) throws LinphoneCoreException {
        LinphoneAddressImpl linphoneAddressImpl;
        synchronized (this) {
            long interpretUrl = interpretUrl(this.nativePtr, str);
            if (interpretUrl != 0) {
                linphoneAddressImpl = new LinphoneAddressImpl(interpretUrl, LinphoneAddressImpl.WrapMode.FromNew);
            } else {
                throw new LinphoneCoreException("Cannot interpret [" + str + "]");
            }
        }
        return linphoneAddressImpl;
    }

    public LinphoneCall invite(String str) {
        LinphoneCall linphoneCall;
        synchronized (this) {
            isValid();
            linphoneCall = (LinphoneCall) invite(this.nativePtr, str);
        }
        return linphoneCall;
    }

    public LinphoneCall invite(LinphoneAddress linphoneAddress) throws LinphoneCoreException {
        LinphoneCall linphoneCall;
        synchronized (this) {
            linphoneCall = (LinphoneCall) inviteAddress(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr);
            if (linphoneCall == null) {
                throw new LinphoneCoreException("Unable to invite address " + linphoneAddress.asString());
            }
        }
        return linphoneCall;
    }

    public LinphoneCall inviteAddressWithParams(LinphoneAddress linphoneAddress, LinphoneCallParams linphoneCallParams) throws LinphoneCoreException {
        LinphoneCall linphoneCall;
        synchronized (this) {
            linphoneCall = (LinphoneCall) inviteAddressWithParams(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr, ((LinphoneCallParamsImpl) linphoneCallParams).nativePtr);
            if (linphoneCall == null) {
                throw new LinphoneCoreException("Unable to invite with params " + linphoneAddress.asString());
            }
        }
        return linphoneCall;
    }

    public boolean isAdaptiveRateControlEnabled() {
        boolean isAdaptiveRateControlEnabled;
        synchronized (this) {
            isAdaptiveRateControlEnabled = isAdaptiveRateControlEnabled(this.nativePtr);
        }
        return isAdaptiveRateControlEnabled;
    }

    public boolean isEchoCancellationEnabled() {
        boolean isEchoCancellationEnabled;
        synchronized (this) {
            isValid();
            isEchoCancellationEnabled = isEchoCancellationEnabled(this.nativePtr);
        }
        return isEchoCancellationEnabled;
    }

    public boolean isEchoLimiterEnabled() {
        boolean isEchoLimiterEnabled;
        synchronized (this) {
            isEchoLimiterEnabled = isEchoLimiterEnabled(this.nativePtr);
        }
        return isEchoLimiterEnabled;
    }

    public boolean isInComingInvitePending() {
        boolean isInComingInvitePending;
        synchronized (this) {
            isValid();
            isInComingInvitePending = isInComingInvitePending(this.nativePtr);
        }
        return isInComingInvitePending;
    }

    public boolean isInConference() {
        boolean isInConference;
        synchronized (this) {
            isInConference = isInConference(this.nativePtr);
        }
        return isInConference;
    }

    public boolean isIncall() {
        boolean isInCall;
        synchronized (this) {
            isValid();
            isInCall = isInCall(this.nativePtr);
        }
        return isInCall;
    }

    public boolean isIpv6Enabled() {
        boolean isIpv6Enabled;
        synchronized (this) {
            isIpv6Enabled = isIpv6Enabled(this.nativePtr);
        }
        return isIpv6Enabled;
    }

    public boolean isKeepAliveEnabled() {
        boolean isKeepAliveEnabled;
        synchronized (this) {
            isKeepAliveEnabled = isKeepAliveEnabled(this.nativePtr);
        }
        return isKeepAliveEnabled;
    }

    public boolean isLimeEncryptionAvailable() {
        boolean isLimeEncryptionAvailable;
        synchronized (this) {
            isLimeEncryptionAvailable = isLimeEncryptionAvailable(this.nativePtr);
        }
        return isLimeEncryptionAvailable;
    }

    public boolean isMediaEncryptionMandatory() {
        boolean isMediaEncryptionMandatory;
        synchronized (this) {
            isMediaEncryptionMandatory = isMediaEncryptionMandatory(this.nativePtr);
        }
        return isMediaEncryptionMandatory;
    }

    public boolean isMicMuted() {
        boolean isMicMuted;
        synchronized (this) {
            isMicMuted = isMicMuted(this.nativePtr);
        }
        return isMicMuted;
    }

    public boolean isMyself(String str) {
        LinphoneProxyConfig defaultProxyConfig = getDefaultProxyConfig();
        if (defaultProxyConfig == null) {
            return false;
        }
        return str.equals(defaultProxyConfig.getIdentity());
    }

    public boolean isNetworkReachable() {
        boolean isNetworkStateReachable;
        synchronized (this) {
            isNetworkStateReachable = isNetworkStateReachable(this.nativePtr);
        }
        return isNetworkStateReachable;
    }

    public boolean isPayloadTypeEnabled(PayloadType payloadType) {
        boolean isPayloadTypeEnabled;
        synchronized (this) {
            isValid();
            isPayloadTypeEnabled = isPayloadTypeEnabled(this.nativePtr, ((PayloadTypeImpl) payloadType).nativePtr);
        }
        return isPayloadTypeEnabled;
    }

    public boolean isSdp200AckEnabled() {
        boolean isSdp200AckEnabled;
        synchronized (this) {
            isSdp200AckEnabled = isSdp200AckEnabled(this.nativePtr);
        }
        return isSdp200AckEnabled;
    }

    public boolean isSpeakerEnabled() {
        return this.mSpeakerEnabled;
    }

    public native boolean isTunnelAvailable();

    public boolean isVCardSupported() {
        boolean isVCardSupported;
        synchronized (this) {
            isVCardSupported = isVCardSupported(this.nativePtr);
        }
        return isVCardSupported;
    }

    public boolean isVideoEnabled() {
        boolean isVideoEnabled;
        synchronized (this) {
            isVideoEnabled = isVideoEnabled(this.nativePtr);
        }
        return isVideoEnabled;
    }

    public boolean isVideoSupported() {
        boolean isVideoSupported;
        synchronized (this) {
            isVideoSupported = isVideoSupported(this.nativePtr);
        }
        return isVideoSupported;
    }

    public void iterate() {
        synchronized (this) {
            isValid();
            iterate(this.nativePtr);
        }
    }

    public void leaveConference() {
        synchronized (this) {
            leaveConference(this.nativePtr);
        }
    }

    public boolean mediaEncryptionSupported(LinphoneCore.MediaEncryption mediaEncryption) {
        boolean mediaEncryptionSupported;
        synchronized (this) {
            mediaEncryptionSupported = mediaEncryptionSupported(this.nativePtr, mediaEncryption.mValue);
        }
        return mediaEncryptionSupported;
    }

    public void migrateCallLogs() {
        synchronized (this) {
            migrateCallLogs(this.nativePtr);
        }
    }

    public int migrateToMultiTransport() {
        int migrateToMultiTransport;
        synchronized (this) {
            migrateToMultiTransport = migrateToMultiTransport(this.nativePtr);
        }
        return migrateToMultiTransport;
    }

    public void muteMic(boolean z) {
        synchronized (this) {
            muteMic(this.nativePtr, z);
        }
    }

    public boolean needsEchoCalibration() {
        boolean needsEchoCalibration;
        synchronized (this) {
            needsEchoCalibration = needsEchoCalibration(this.nativePtr);
        }
        return needsEchoCalibration;
    }

    public boolean pauseAllCalls() {
        boolean z;
        synchronized (this) {
            z = pauseAllCalls(this.nativePtr) == 0;
        }
        return z;
    }

    public boolean pauseCall(LinphoneCall linphoneCall) {
        boolean z;
        synchronized (this) {
            z = pauseCall(this.nativePtr, ((LinphoneCallImpl) linphoneCall).nativePtr) == 0;
        }
        return z;
    }

    public boolean payloadTypeIsVbr(PayloadType payloadType) {
        boolean payloadTypeIsVbr;
        synchronized (this) {
            isValid();
            payloadTypeIsVbr = payloadTypeIsVbr(this.nativePtr, ((PayloadTypeImpl) payloadType).nativePtr);
        }
        return payloadTypeIsVbr;
    }

    public void playDtmf(char c, int i) {
        synchronized (this) {
            playDtmf(this.nativePtr, c, i);
        }
    }

    public LinphoneEvent publish(LinphoneAddress linphoneAddress, String str, int i, LinphoneContent linphoneContent) {
        LinphoneEvent linphoneEvent;
        synchronized (this) {
            linphoneEvent = (LinphoneEvent) publish(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr, str, i, linphoneContent != null ? linphoneContent.getType() : null, linphoneContent != null ? linphoneContent.getSubtype() : null, linphoneContent != null ? linphoneContent.getData() : null, linphoneContent != null ? linphoneContent.getEncoding() : null);
        }
        return linphoneEvent;
    }

    public void refreshRegisters() {
        synchronized (this) {
            refreshRegisters(this.nativePtr);
        }
    }

    public void reloadMsPlugins(String str) {
        reloadMsPlugins(this.nativePtr, str);
    }

    public void reloadSoundDevices() {
        reloadSoundDevices(this.nativePtr);
    }

    public void removeAuthInfo(LinphoneAuthInfo linphoneAuthInfo) {
        synchronized (this) {
            isValid();
            removeAuthInfo(this.nativePtr, ((LinphoneAuthInfoImpl) linphoneAuthInfo).nativePtr);
        }
    }

    public void removeCallLog(LinphoneCallLog linphoneCallLog) {
        synchronized (this) {
            removeCallLog(this.nativePtr, ((LinphoneCallLogImpl) linphoneCallLog).getNativePtr());
        }
    }

    public void removeFriend(LinphoneFriend linphoneFriend) {
        synchronized (this) {
            removeFriend(this.nativePtr, linphoneFriend.getNativePtr());
        }
    }

    public void removeFriendList(LinphoneFriendList linphoneFriendList) throws LinphoneCoreException {
        synchronized (this) {
            removeFriendList(this.nativePtr, ((LinphoneFriendListImpl) linphoneFriendList).nativePtr);
        }
    }

    public void removeFromConference(LinphoneCall linphoneCall) {
        synchronized (this) {
            removeFromConference(this.nativePtr, getCallPtr(linphoneCall));
        }
    }

    public void removeListener(LinphoneCoreListener linphoneCoreListener) {
        synchronized (this) {
            removeListener(this.nativePtr, linphoneCoreListener);
        }
    }

    public void removeProxyConfig(LinphoneProxyConfig linphoneProxyConfig) {
        synchronized (this) {
            isValid();
            if (linphoneProxyConfig != null) {
                removeProxyConfig(this.nativePtr, ((LinphoneProxyConfigImpl) linphoneProxyConfig).nativePtr);
            }
        }
    }

    public native void resetLogCollection();

    public void resetMissedCallsCount() {
        synchronized (this) {
            resetMissedCallsCount(this.nativePtr);
        }
    }

    public boolean resumeCall(LinphoneCall linphoneCall) {
        boolean z;
        synchronized (this) {
            z = resumeCall(this.nativePtr, ((LinphoneCallImpl) linphoneCall).nativePtr) == 0;
        }
        return z;
    }

    public void routeAudioToSpeakerHelper(boolean z) {
        if (contextInitialized()) {
            if (Hacks.needGalaxySAudioHack()) {
                setAudioModeIncallForGalaxyS();
            }
            this.mAudioManager.setSpeakerphoneOn(z);
        }
    }

    public void sendDtmf(char c) {
        synchronized (this) {
            sendDtmf(this.nativePtr, c);
        }
    }

    public void sendDtmfs(String str) {
        synchronized (this) {
            sendDtmfs(this.nativePtr, str);
        }
    }

    public void setAdaptiveRateAlgorithm(LinphoneCore.AdaptiveRateAlgorithm adaptiveRateAlgorithm) {
        synchronized (this) {
            setAdaptiveRateAlgorithm(this.nativePtr, adaptiveRateAlgorithm.toString());
        }
    }

    public void setAudioCodecs(PayloadType[] payloadTypeArr) {
        synchronized (this) {
            long[] jArr = new long[payloadTypeArr.length];
            for (int i = 0; i < payloadTypeArr.length; i++) {
                jArr[i] = payloadTypeArr[i].nativePtr;
            }
            setAudioCodecs(this.nativePtr, jArr);
        }
    }

    public void setAudioDscp(int i) {
        synchronized (this) {
            setAudioDscp(this.nativePtr, i);
        }
    }

    public void setAudioJittcomp(int i) {
        synchronized (this) {
            setAudioJittcomp(this.nativePtr, i);
        }
    }

    public void setAudioMulticastAddr(String str) throws LinphoneCoreException {
        if (setAudioMulticastAddr(this.nativePtr, str) != 0) {
            throw new LinphoneCoreException("bad ip address [" + str + "]");
        }
    }

    public void setAudioMulticastTtl(int i) throws LinphoneCoreException {
        if (setAudioMulticastTtl(this.nativePtr, i) != 0) {
            throw new LinphoneCoreException("bad ttl value [" + i + "]");
        }
    }

    public void setAudioPort(int i) {
        synchronized (this) {
            setAudioPort(this.nativePtr, i);
        }
    }

    public void setAudioPortRange(int i, int i2) {
        synchronized (this) {
            setAudioPortRange(this.nativePtr, i, i2);
        }
    }

    public void setCallErrorTone(Reason reason, String str) {
        synchronized (this) {
            setCallErrorTone(this.nativePtr, reason.mValue, str);
        }
    }

    public void setCallLogsDatabasePath(String str) {
        synchronized (this) {
            setCallLogsDatabasePath(this.nativePtr, str);
        }
    }

    public void setChatDatabasePath(String str) {
        synchronized (this) {
            setChatDatabasePath(this.nativePtr, str);
        }
    }

    public void setContext(Object obj) {
        this.mContext = (Context) obj;
        reloadMsPlugins(this.mContext.getApplicationInfo().nativeLibraryDir);
        this.mAudioManager = (AudioManager) this.mContext.getSystemService(AUDIO_SERVICE);
    }

    public void setCpuCount(int i) {
        synchronized (this) {
            setCpuCountNative(this.nativePtr, i);
        }
    }

    public void setDefaultProxyConfig(LinphoneProxyConfig linphoneProxyConfig) {
        synchronized (this) {
            isValid();
            setDefaultProxyConfig(this.nativePtr, linphoneProxyConfig != null ? ((LinphoneProxyConfigImpl) linphoneProxyConfig).nativePtr : 0);
        }
    }

    public void setDefaultSoundDevices() {
        setDefaultSoundDevices(this.nativePtr);
    }

    public void setDeviceRotation(int i) {
        synchronized (this) {
            setDeviceRotation(this.nativePtr, i);
        }
    }

    public void setDnsServers(String[] strArr) {
        setDnsServers(this.nativePtr, strArr);
    }

    public void setDownloadBandwidth(int i) {
        synchronized (this) {
            setDownloadBandwidth(this.nativePtr, i);
        }
    }

    public void setDownloadPtime(int i) {
        synchronized (this) {
            setDownloadPtime(this.nativePtr, i);
        }
    }

    public void setFileTransferServer(String str) {
        synchronized (this) {
            setFileTransferServer(this.nativePtr, str);
        }
    }

    public void setFirewallPolicy(LinphoneCore.FirewallPolicy firewallPolicy) {
        synchronized (this) {
            setFirewallPolicy(this.nativePtr, firewallPolicy.value());
        }
    }

    public void setFriendsDatabasePath(String str) {
        synchronized (this) {
            setFriendsDatabasePath(this.nativePtr, str);
        }
    }

    public void setHttpProxyHost(String str) {
        setHttpProxyHost(this.nativePtr, str);
    }

    public void setHttpProxyPort(int i) {
        setHttpProxyPort(this.nativePtr, i);
    }

    public void setInCallTimeout(int i) {
        synchronized (this) {
            setInCallTimeout(this.nativePtr, i);
        }
    }

    public void setIncomingTimeout(int i) {
        synchronized (this) {
            setIncomingTimeout(this.nativePtr, i);
        }
    }

    public void setLimeEncryption(LinphoneCore.LinphoneLimeState linphoneLimeState) {
        synchronized (this) {
            setLimeEncryption(this.nativePtr, linphoneLimeState.mValue);
        }
    }

    public void setMaxCalls(int i) {
        synchronized (this) {
            setMaxCalls(this.nativePtr, i);
        }
    }

    public void setMediaEncryption(LinphoneCore.MediaEncryption mediaEncryption) {
        synchronized (this) {
            setMediaEncryption(this.nativePtr, mediaEncryption.mValue);
        }
    }

    public void setMediaEncryptionMandatory(boolean z) {
        synchronized (this) {
            setMediaEncryptionMandatory(this.nativePtr, z);
        }
    }

    public void setMediaNetworkReachable(boolean z) {
        setMediaNetworkReachable(this.nativePtr, z);
    }

    public void setMicrophoneGain(float f) {
        synchronized (this) {
            setMicrophoneGain(this.nativePtr, f);
        }
    }

    public void setMtu(int i) {
        synchronized (this) {
            setMtu(this.nativePtr, i);
        }
    }

    public void setNatPolicy(LinphoneNatPolicy linphoneNatPolicy) {
        synchronized (this) {
            setNatPolicy(this.nativePtr, ((LinphoneNatPolicyImpl) linphoneNatPolicy).mNativePtr);
        }
    }

    public void setNetworkReachable(boolean z) {
        synchronized (this) {
            setNetworkStateReachable(this.nativePtr, z);
        }
    }

    public void setNortpTimeout(int i) {
        setNortpTimeout(this.nativePtr, i);
    }

    public void setPCCWDoubleRegisterTimeout(int i) {
        setPCCWDoubleRegisterTimeout(this.nativePtr, i);
    }

    public void setPayloadTypeBitrate(PayloadType payloadType, int i) {
        synchronized (this) {
            setPayloadTypeBitrate(this.nativePtr, ((PayloadTypeImpl) payloadType).nativePtr, i);
        }
    }

    public void setPayloadTypeNumber(PayloadType payloadType, int i) {
        synchronized (this) {
            setPayloadTypeNumber(this.nativePtr, ((PayloadTypeImpl) payloadType).nativePtr, i);
        }
    }

    public void setPlayFile(String str) {
        synchronized (this) {
            setPlayFile(this.nativePtr, str);
        }
    }

    public void setPlayLevel(int i) {
    }

    public void setPlaybackGain(float f) {
        synchronized (this) {
            setPlaybackGain(this.nativePtr, f);
        }
    }

    public void setPreferredFramerate(float f) {
        setPreferredFramerate(this.nativePtr, f);
    }

    public void setPreferredVideoSize(VideoSize videoSize) {
        synchronized (this) {
            setPreferredVideoSize(this.nativePtr, videoSize.width, videoSize.height);
        }
    }

    public void setPreferredVideoSizeByName(String str) {
        synchronized (this) {
            setPreferredVideoSizeByName(this.nativePtr, str);
        }
    }

    public void setPresenceInfo(int i, String str, OnlineStatus onlineStatus) {
        synchronized (this) {
            setPresenceInfo(this.nativePtr, i, str, onlineStatus.mValue);
        }
    }

    public void setPresenceModel(PresenceModel presenceModel) {
        synchronized (this) {
            setPresenceModel(this.nativePtr, ((PresenceModelImpl) presenceModel).getNativePtr());
        }
    }

    public void setPreviewWindow(Object obj) {
        synchronized (this) {
            setPreviewWindowId(this.nativePtr, obj);
        }
    }

    public void setPrimaryContact(String str) {
        synchronized (this) {
            setPrimaryContact2(this.nativePtr, str);
        }
    }

    public void setPrimaryContact(String str, String str2) {
        synchronized (this) {
            setPrimaryContact(this.nativePtr, str, str2);
        }
    }

    public void setProvisioningUri(String str) {
        setProvisioningUri(this.nativePtr, str);
    }

    public void setRemoteRingbackTone(String str) {
        setRemoteRingbackTone(this.nativePtr, str);
    }

    public void setRing(String str) {
        synchronized (this) {
            setRing(this.nativePtr, str);
        }
    }

    public void setRingback(String str) {
        synchronized (this) {
            setRingback(this.nativePtr, str);
        }
    }

    public void setRootCA(String str) {
        synchronized (this) {
            setRootCA(this.nativePtr, str);
        }
    }

    public void setRootCAData(String str) {
        synchronized (this) {
            setRootCAData(this.nativePtr, str);
        }
    }

    public void setSignalingTransportPorts(LinphoneCore.Transports transports) {
        synchronized (this) {
            setSignalingTransportPorts(this.nativePtr, transports.udp, transports.tcp, transports.tls);
        }
    }

    public void setSipDscp(int i) {
        synchronized (this) {
            setSipDscp(this.nativePtr, i);
        }
    }

    public void setSipNetworkReachable(boolean z) {
        setSipNetworkReachable(this.nativePtr, z);
    }

    public void setSipTransportTimeout(int i) {
        setSipTransportTimeout(this.nativePtr, i);
    }

    public void setSpeakerphoneAlwaysOn(boolean z) {
        this.mSpeakerphoneAlwaysOn = z;
    }

    public void setStaticPicture(String str) {
        synchronized (this) {
            setStaticPicture(this.nativePtr, str);
        }
    }

    public void setStunServer(String str) {
        synchronized (this) {
            setStunServer(this.nativePtr, str);
        }
    }

    public void setTlsCertificate(String str) {
        setTlsCertificate(this.nativePtr, str);
    }

    public void setTlsCertificatePath(String str) {
        setTlsCertificatePath(this.nativePtr, str);
    }

    public void setTlsKey(String str) {
        setTlsKey(this.nativePtr, str);
    }

    public void setTlsKeyPath(String str) {
        setTlsKeyPath(this.nativePtr, str);
    }

    public void setTone(ToneID toneID, String str) {
        synchronized (this) {
            setTone(this.nativePtr, toneID.mValue, str);
        }
    }

    public void setUploadBandwidth(int i) {
        synchronized (this) {
            setUploadBandwidth(this.nativePtr, i);
        }
    }

    public void setUploadPtime(int i) {
        synchronized (this) {
            setUploadPtime(this.nativePtr, i);
        }
    }

    public void setUseRfc2833ForDtmfs(boolean z) {
        synchronized (this) {
            setUseRfc2833ForDtmfs(this.nativePtr, z);
        }
    }

    public void setUseSipInfoForDtmfs(boolean z) {
        synchronized (this) {
            setUseSipInfoForDtmfs(this.nativePtr, z);
        }
    }

    public void setUserAgent(String str, String str2) {
        synchronized (this) {
            setUserAgent(this.nativePtr, str, str2);
        }
    }

    public void setUserCertificatesPath(String str) {
        setUserCertificatesPath(this.nativePtr, str);
    }

    public void setVerifyServerCN(boolean z) {
        setVerifyServerCN(this.nativePtr, z);
    }

    public void setVerifyServerCertificates(boolean z) {
        setVerifyServerCertificates(this.nativePtr, z);
    }

    public void setVideoCodecs(PayloadType[] payloadTypeArr) {
        synchronized (this) {
            long[] jArr = new long[payloadTypeArr.length];
            for (int i = 0; i < payloadTypeArr.length; i++) {
                jArr[i] = payloadTypeArr[i].nativePtr;
            }
            setVideoCodecs(this.nativePtr, jArr);
        }
    }

    public void setVideoDevice(int i) {
        synchronized (this) {
            Log.i("Setting camera id :", Integer.valueOf(i));
            if (setVideoDevice(this.nativePtr, i) != 0) {
                Log.e("Failed to set video device to id:", Integer.valueOf(i));
            }
        }
    }

    public void setVideoDscp(int i) {
        synchronized (this) {
            setVideoDscp(this.nativePtr, i);
        }
    }

    public void setVideoJittcomp(int i) {
        synchronized (this) {
            setVideoJittcomp(this.nativePtr, i);
        }
    }

    public void setVideoMulticastAddr(String str) throws LinphoneCoreException {
        if (setVideoMulticastAddr(this.nativePtr, str) != 0) {
            throw new LinphoneCoreException("bad ip address [" + str + "]");
        }
    }

    public void setVideoMulticastTtl(int i) throws LinphoneCoreException {
        if (setVideoMulticastTtl(this.nativePtr, i) != 0) {
            throw new LinphoneCoreException("bad ttl value [" + i + "]");
        }
    }

    public void setVideoPolicy(boolean z, boolean z2) {
        synchronized (this) {
            setVideoPolicy(this.nativePtr, z, z2);
        }
    }

    public void setVideoPort(int i) {
        synchronized (this) {
            setVideoPort(this.nativePtr, i);
        }
    }

    public void setVideoPortRange(int i, int i2) {
        synchronized (this) {
            setVideoPortRange(this.nativePtr, i, i2);
        }
    }

    public void setVideoPreset(String str) {
        setVideoPreset(this.nativePtr, str);
    }

    public void setVideoWindow(Object obj) {
        synchronized (this) {
            setVideoWindowId(this.nativePtr, obj);
        }
    }

    public void setZrtpSecretsCache(String str) {
        synchronized (this) {
            setZrtpSecretsCache(this.nativePtr, str);
        }
    }

    public boolean soundResourcesLocked() {
        boolean soundResourcesLocked;
        synchronized (this) {
            soundResourcesLocked = soundResourcesLocked(this.nativePtr);
        }
        return soundResourcesLocked;
    }

    public void startConferenceRecording(String str) {
        synchronized (this) {
            startConferenceRecording(this.nativePtr, str);
        }
    }

    public void startEchoCalibration(LinphoneCoreListener linphoneCoreListener) throws LinphoneCoreException {
        synchronized (this) {
            startEchoCalibration(this.nativePtr, linphoneCoreListener);
        }
    }

    public int startEchoTester(int i) {
        int startEchoTester;
        synchronized (this) {
            startEchoTester = startEchoTester(this.nativePtr, i);
        }
        return startEchoTester;
    }

    public LinphoneCall startReferedCall(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams) {
        LinphoneCall startReferedCall;
        synchronized (this) {
            startReferedCall = startReferedCall(this.nativePtr, getCallPtr(linphoneCall), ((LinphoneCallParamsImpl) linphoneCallParams).nativePtr);
        }
        return startReferedCall;
    }

    public void stopConferenceRecording() {
        synchronized (this) {
            stopConferenceRecording(this.nativePtr);
        }
    }

    public void stopDtmf() {
        synchronized (this) {
            stopDtmf(this.nativePtr);
        }
    }

    public int stopEchoTester() {
        int stopEchoTester;
        synchronized (this) {
            stopEchoTester = stopEchoTester(this.nativePtr);
        }
        return stopEchoTester;
    }

    public void stopRinging() {
        synchronized (this) {
            stopRinging(this.nativePtr);
        }
    }

    public LinphoneEvent subscribe(LinphoneAddress linphoneAddress, String str, int i, LinphoneContent linphoneContent) {
        LinphoneEvent linphoneEvent;
        synchronized (this) {
            linphoneEvent = (LinphoneEvent) subscribe(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr, str, i, linphoneContent != null ? linphoneContent.getType() : null, linphoneContent != null ? linphoneContent.getSubtype() : null, linphoneContent != null ? linphoneContent.getData() : null, linphoneContent != null ? linphoneContent.getEncoding() : null);
        }
        return linphoneEvent;
    }

    public void terminateAllCalls() {
        synchronized (this) {
            terminateAllCalls(this.nativePtr);
        }
    }

    public void terminateCall(LinphoneCall linphoneCall) {
        synchronized (this) {
            isValid();
            if (linphoneCall != null) {
                terminateCall(this.nativePtr, ((LinphoneCallImpl) linphoneCall).nativePtr);
            }
        }
    }

    public void terminateConference() {
        synchronized (this) {
            terminateConference(this.nativePtr);
        }
    }

    public void transferCall(LinphoneCall linphoneCall, String str) {
        synchronized (this) {
            transferCall(this.nativePtr, getCallPtr(linphoneCall), str);
        }
    }

    public void transferCallToAnother(LinphoneCall linphoneCall, LinphoneCall linphoneCall2) {
        synchronized (this) {
            transferCallToAnother(this.nativePtr, getCallPtr(linphoneCall), getCallPtr(linphoneCall2));
        }
    }

    public void tunnelAddServer(TunnelConfig tunnelConfig) {
        synchronized (this) {
            tunnelAddServer(this.nativePtr, ((TunnelConfigImpl) tunnelConfig).mNativePtr);
        }
    }

    public void tunnelAddServerAndMirror(String str, int i, int i2, int i3) {
        synchronized (this) {
            tunnelAddServerAndMirror(this.nativePtr, str, i, i2, i3);
        }
    }

    public void tunnelAutoDetect() {
        synchronized (this) {
            tunnelAutoDetect(this.nativePtr);
        }
    }

    public void tunnelCleanServers() {
        synchronized (this) {
            tunnelCleanServers(this.nativePtr);
        }
    }

    public boolean tunnelDualModeEnabled() {
        return tunnelDualModeEnabled(this.nativePtr);
    }

    public void tunnelEnable(boolean z) {
        synchronized (this) {
            tunnelEnable(this.nativePtr, z);
        }
    }

    public void tunnelEnableDualMode(boolean z) {
        tunnelEnableDualMode(this.nativePtr, z);
    }

    public void tunnelEnableSip(boolean z) {
        tunnelEnableSip(this.nativePtr, z);
    }

    public LinphoneCore.TunnelMode tunnelGetMode() {
        LinphoneCore.TunnelMode intToEnum;
        synchronized (this) {
            intToEnum = LinphoneCore.TunnelMode.intToEnum(tunnelGetMode(this.nativePtr));
        }
        return intToEnum;
    }

    public final TunnelConfig[] tunnelGetServers() {
        TunnelConfig[] tunnelGetServers;
        synchronized (this) {
            tunnelGetServers = tunnelGetServers(this.nativePtr);
        }
        return tunnelGetServers;
    }

    public void tunnelSetHttpProxy(String str, int i, String str2, String str3) {
        synchronized (this) {
            tunnelSetHttpProxy(this.nativePtr, str, i, str2, str3);
        }
    }

    public void tunnelSetMode(LinphoneCore.TunnelMode tunnelMode) {
        synchronized (this) {
            tunnelSetMode(this.nativePtr, LinphoneCore.TunnelMode.enumToInt(tunnelMode));
        }
    }

    public boolean tunnelSipEnabled() {
        return tunnelSipEnabled(this.nativePtr);
    }

    public int updateCall(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams) {
        int updateCall;
        synchronized (this) {
            updateCall = updateCall(this.nativePtr, ((LinphoneCallImpl) linphoneCall).nativePtr, linphoneCallParams != null ? ((LinphoneCallParamsImpl) linphoneCallParams).nativePtr : 0);
        }
        return updateCall;
    }

    public void uploadLogCollection() {
        uploadLogCollection(this.nativePtr);
    }

    public boolean upnpAvailable() {
        boolean upnpAvailable;
        synchronized (this) {
            upnpAvailable = upnpAvailable(this.nativePtr);
        }
        return upnpAvailable;
    }

    public boolean usePCCWFallbackRegisterPort() {
        return usePCCWFallbackRegisterPort(this.nativePtr);
    }

    public boolean videoMulticastEnabled() {
        return videoMulticastEnabled(this.nativePtr);
    }
}
