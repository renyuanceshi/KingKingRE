package org.linphone.core;

import com.facebook.internal.AnalyticsEvents;
import com.pccw.mobile.server.response.CheckSMSDeliveryStatusResponse;
import java.util.Vector;
import org.linphone.core.LinphoneCallLog;
import org.linphone.mediastream.Factory;
import org.linphone.mediastream.video.AndroidVideoWindowImpl;

public interface LinphoneCore {

    public static final class AdaptiveRateAlgorithm {
        public static final AdaptiveRateAlgorithm Simple = new AdaptiveRateAlgorithm(0, "Simple");
        public static final AdaptiveRateAlgorithm Stateful = new AdaptiveRateAlgorithm(1, "Stateful");
        private static Vector<AdaptiveRateAlgorithm> values = new Vector<>();
        private final String mStringValue;
        protected final int mValue;

        private AdaptiveRateAlgorithm(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static AdaptiveRateAlgorithm fromString(String str) {
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 < values.size()) {
                    AdaptiveRateAlgorithm elementAt = values.elementAt(i2);
                    if (elementAt.mStringValue.equalsIgnoreCase(str)) {
                        return elementAt;
                    }
                    i = i2 + 1;
                } else {
                    throw new RuntimeException("AdaptiveRateAlgorithm not found [" + str + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static class AuthMethod {
        public static AuthMethod AuthMethodHttpDigest = new AuthMethod(0, "AuthMethodHttpDigest");
        public static AuthMethod AuthMethodTls = new AuthMethod(1, "AuthMethodTls");
        private static Vector<AuthMethod> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private AuthMethod(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static AuthMethod fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    AuthMethod elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("auth method not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static class EcCalibratorStatus {
        public static final int DONE_NO_ECHO_STATUS = 3;
        public static final int DONE_STATUS = 1;
        public static EcCalibratorStatus Done = new EcCalibratorStatus(1, "Done");
        public static EcCalibratorStatus DoneNoEcho = new EcCalibratorStatus(3, "DoneNoEcho");
        public static final int FAILED_STATUS = 2;
        public static EcCalibratorStatus Failed = new EcCalibratorStatus(2, "Failed");
        public static final int IN_PROGRESS_STATUS = 0;
        public static EcCalibratorStatus InProgress = new EcCalibratorStatus(0, "InProgress");
        private static Vector<EcCalibratorStatus> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private EcCalibratorStatus(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static EcCalibratorStatus fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    EcCalibratorStatus elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("status not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }

        public int value() {
            return this.mValue;
        }
    }

    @Deprecated
    public static class FirewallPolicy {
        public static FirewallPolicy NoFirewall = new FirewallPolicy(0, "NoFirewall");
        public static FirewallPolicy UseIce = new FirewallPolicy(3, "UseIce");
        public static FirewallPolicy UseNatAddress = new FirewallPolicy(1, "UseNatAddress");
        public static FirewallPolicy UseStun = new FirewallPolicy(2, "UseStun");
        public static FirewallPolicy UseUpnp = new FirewallPolicy(4, "UseUpnp");
        private static Vector<FirewallPolicy> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private FirewallPolicy(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static FirewallPolicy fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    FirewallPolicy elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("state not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }

        public int value() {
            return this.mValue;
        }
    }

    public static class GlobalState {
        public static GlobalState GlobalConfiguring = new GlobalState(4, "GlobalConfiguring");
        public static GlobalState GlobalOff = new GlobalState(0, "GlobalOff");
        public static GlobalState GlobalOn = new GlobalState(2, "GlobalOn");
        public static GlobalState GlobalShutdown = new GlobalState(3, "GlobalShutdown");
        public static GlobalState GlobalStartup = new GlobalState(1, "GlobalStartup");
        private static Vector<GlobalState> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private GlobalState(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static GlobalState fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    GlobalState elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("state not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static final class LinphoneLimeState {
        public static final LinphoneLimeState Disabled = new LinphoneLimeState(0, "None");
        public static final LinphoneLimeState Mandatory = new LinphoneLimeState(1, "Mandatory");
        public static final LinphoneLimeState Preferred = new LinphoneLimeState(2, "Preferred");
        private static Vector<LinphoneLimeState> values = new Vector<>();
        private final String mStringValue;
        protected final int mValue;

        private LinphoneLimeState(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static LinphoneLimeState fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    LinphoneLimeState elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("LinphoneLimeState not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static class LogCollectionUploadState {
        public static LogCollectionUploadState LogCollectionUploadStateDelivered = new LogCollectionUploadState(1, "LinphoneCoreLogCollectionUploadStateDelivered");
        public static LogCollectionUploadState LogCollectionUploadStateInProgress = new LogCollectionUploadState(0, "LinphoneCoreLogCollectionUploadStateInProgress");
        public static LogCollectionUploadState LogCollectionUploadStateNotDelivered = new LogCollectionUploadState(2, "LinphoneCoreLogCollectionUploadStateNotDelivered");
        private static Vector<LogCollectionUploadState> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private LogCollectionUploadState(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static LogCollectionUploadState fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    LogCollectionUploadState elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("state not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static final class MediaDirection {
        public static final MediaDirection Inactive = new MediaDirection(0, "Inactive");
        public static final MediaDirection Invalid = new MediaDirection(-1, "Invalid");
        public static final MediaDirection RecvOnly = new MediaDirection(2, "RecvOnly");
        public static final MediaDirection SendOnly = new MediaDirection(1, "SendOnly");
        public static final MediaDirection SendRecv = new MediaDirection(3, "SendRecv");
        private static Vector<MediaDirection> values = new Vector<>();
        private final String mStringValue;
        protected final int mValue;

        private MediaDirection(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static MediaDirection fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    MediaDirection elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("MediaDirection not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static final class MediaEncryption {
        public static final MediaEncryption DTLS = new MediaEncryption(3, "DTLS");
        public static final MediaEncryption None = new MediaEncryption(0, "None");
        public static final MediaEncryption SRTP = new MediaEncryption(1, "SRTP");
        public static final MediaEncryption ZRTP = new MediaEncryption(2, "ZRTP");
        private static Vector<MediaEncryption> values = new Vector<>();
        private final String mStringValue;
        protected final int mValue;

        private MediaEncryption(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static MediaEncryption fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    MediaEncryption elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("MediaEncryption not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static class RegistrationState {
        public static RegistrationState RegistrationCleared = new RegistrationState(3, "RegistrationCleared");
        public static RegistrationState RegistrationFailed = new RegistrationState(4, "RegistrationFailed");
        public static RegistrationState RegistrationNone = new RegistrationState(0, "RegistrationNone");
        public static RegistrationState RegistrationOk = new RegistrationState(2, "RegistrationOk");
        public static RegistrationState RegistrationProgress = new RegistrationState(1, "RegistrationProgress");
        private static Vector<RegistrationState> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private RegistrationState(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static RegistrationState fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    RegistrationState elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("state not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static class RemoteProvisioningState {
        public static RemoteProvisioningState ConfiguringFailed = new RemoteProvisioningState(1, "ConfiguringFailed");
        public static RemoteProvisioningState ConfiguringSkipped = new RemoteProvisioningState(2, "ConfiguringSkipped");
        public static RemoteProvisioningState ConfiguringSuccessful = new RemoteProvisioningState(0, "ConfiguringSuccessful");
        private static Vector<RemoteProvisioningState> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private RemoteProvisioningState(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static RemoteProvisioningState fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    RemoteProvisioningState elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("state not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static final class StreamType {
        public static final StreamType Audio = new StreamType(0, "Audio");
        public static final StreamType Text = new StreamType(2, "Text");
        public static final StreamType Unknown = new StreamType(3, AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN);
        public static final StreamType Video = new StreamType(1, "Video");
        private static Vector<StreamType> values = new Vector<>();
        private final String mStringValue;
        protected final int mValue;

        private StreamType(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static StreamType fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    StreamType elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("StreamType not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    public static class Transports {
        public int tcp;
        public int tls;
        public int udp;

        public Transports() {
        }

        public Transports(Transports transports) {
            this.udp = transports.udp;
            this.tcp = transports.tcp;
            this.tls = transports.tls;
        }

        public String toString() {
            return "udp[" + this.udp + "] tcp[" + this.tcp + "] tls[" + this.tls + "]";
        }
    }

    public enum TunnelMode {
        disable(0),
        enable(1),
        auto(2);
        
        private final int value;

        private TunnelMode(int i) {
            this.value = i;
        }

        public static int enumToInt(TunnelMode tunnelMode) {
            return tunnelMode.value;
        }

        public static TunnelMode intToEnum(int i) {
            switch (i) {
                case 0:
                    return disable;
                case 1:
                    return enable;
                case 2:
                    return auto;
                default:
                    return disable;
            }
        }
    }

    public static class UpnpState {
        public static UpnpState Adding = new UpnpState(2, "Adding");
        public static UpnpState Blacklisted = new UpnpState(7, "Blacklisted");
        public static UpnpState Idle = new UpnpState(0, "Idle");
        public static UpnpState Ko = new UpnpState(6, "Ko");
        public static UpnpState NotAvailable = new UpnpState(4, "Not available");
        public static UpnpState Ok = new UpnpState(5, "Ok");
        public static UpnpState Pending = new UpnpState(1, CheckSMSDeliveryStatusResponse.PENDING);
        public static UpnpState Removing = new UpnpState(3, "Removing");
        private static Vector<UpnpState> values = new Vector<>();
        private final String mStringValue;
        protected final int mValue;

        private UpnpState(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static UpnpState fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    UpnpState elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("UpnpState not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    void acceptCall(LinphoneCall linphoneCall) throws LinphoneCoreException;

    void acceptCallUpdate(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams) throws LinphoneCoreException;

    void acceptCallWithParams(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams) throws LinphoneCoreException;

    boolean acceptEarlyMedia(LinphoneCall linphoneCall);

    boolean acceptEarlyMediaWithParams(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams);

    void addAllToConference();

    void addAuthInfo(LinphoneAuthInfo linphoneAuthInfo);

    void addFriend(LinphoneFriend linphoneFriend) throws LinphoneCoreException;

    void addFriendList(LinphoneFriendList linphoneFriendList) throws LinphoneCoreException;

    void addListener(LinphoneCoreListener linphoneCoreListener);

    void addProxyConfig(LinphoneProxyConfig linphoneProxyConfig) throws LinphoneCoreException;

    void addToConference(LinphoneCall linphoneCall);

    @Deprecated
    void adjustSoftwareVolume(int i);

    boolean audioMulticastEnabled();

    boolean chatEnabled();

    void clearAuthInfos();

    void clearCallLogs();

    void clearProxyConfigs();

    LinphoneCallLog createCallLog(LinphoneAddress linphoneAddress, LinphoneAddress linphoneAddress2, CallDirection callDirection, int i, long j, long j2, LinphoneCallLog.CallStatus callStatus, boolean z, float f);

    LinphoneCallParams createCallParams(LinphoneCall linphoneCall);

    LinphoneConference createConference(LinphoneConferenceParams linphoneConferenceParams);

    LinphoneFriend createFriend();

    LinphoneFriend createFriendWithAddress(String str);

    LinphoneInfoMessage createInfoMessage();

    LinphoneFriendList createLinphoneFriendList() throws LinphoneCoreException;

    LinphonePlayer createLocalPlayer(AndroidVideoWindowImpl androidVideoWindowImpl);

    LinphoneNatPolicy createNatPolicy();

    LinphoneProxyConfig createProxyConfig();

    LinphoneProxyConfig createProxyConfig(String str, String str2, String str3, boolean z) throws LinphoneCoreException;

    LinphoneEvent createPublish(LinphoneAddress linphoneAddress, String str, int i);

    LinphoneEvent createSubscribe(LinphoneAddress linphoneAddress, String str, int i);

    void declineCall(LinphoneCall linphoneCall, Reason reason);

    void deferCallUpdate(LinphoneCall linphoneCall) throws LinphoneCoreException;

    void destroy();

    void disableChat(Reason reason);

    boolean dnsSrvEnabled();

    boolean downloadOpenH264Enabled();

    void enableAdaptiveRateControl(boolean z);

    void enableAudioMulticast(boolean z);

    void enableChat();

    void enableDnsSrv(boolean z);

    void enableDownloadOpenH264(boolean z);

    void enableEchoCancellation(boolean z);

    void enableEchoLimiter(boolean z);

    void enableIpv6(boolean z);

    void enableKeepAlive(boolean z);

    void enablePCCWFallbackRegisterPort(boolean z);

    void enablePayloadType(PayloadType payloadType, boolean z) throws LinphoneCoreException;

    void enableSdp200Ack(boolean z);

    void enableSpeaker(boolean z);

    void enableVideo(boolean z, boolean z2);

    void enableVideoMulticast(boolean z);

    boolean enterConference();

    LinphoneAuthInfo findAuthInfo(String str, String str2, String str3);

    LinphoneCall findCallFromUri(String str);

    LinphoneAddress[] findContactsByChar(String str, boolean z);

    LinphoneFriend findFriendByAddress(String str);

    PayloadType findPayloadType(String str);

    PayloadType findPayloadType(String str, int i);

    PayloadType findPayloadType(String str, int i, int i2);

    AdaptiveRateAlgorithm getAdaptiveRateAlgorithm();

    PayloadType[] getAudioCodecs();

    int getAudioDscp();

    String getAudioMulticastAddr();

    int getAudioMulticastTtl();

    LinphoneAuthInfo[] getAuthInfosList();

    LinphoneCallLog[] getCallLogs();

    LinphoneCall[] getCalls();

    int getCallsNb();

    LinphoneChatRoom getChatRoom(LinphoneAddress linphoneAddress);

    LinphoneChatRoom[] getChatRooms();

    LinphoneConference getConference();

    int getConferenceSize();

    LpConfig getConfig();

    LinphoneCall getCurrentCall();

    LinphoneProxyConfig getDefaultProxyConfig();

    int getDownloadBandwidth();

    String getFileTransferServer();

    @Deprecated
    FirewallPolicy getFirewallPolicy();

    LinphoneFriend[] getFriendList();

    LinphoneFriendList[] getFriendLists();

    GlobalState getGlobalState();

    String getHttpProxyHost();

    int getHttpProxyPort();

    int getInCallTimeout();

    int getIncomingTimeout();

    LinphoneCallLog getLastOutgoingCallLog();

    LinphoneLimeState getLimeEncryption();

    Factory getMSFactory();

    int getMaxCalls();

    MediaEncryption getMediaEncryption();

    int getMissedCallsCount();

    int getMtu();

    LinphoneNatPolicy getNatPolicy();

    int getNortpTimeout();

    LinphoneChatRoom getOrCreateChatRoom(String str);

    int getPCCWDoubleRegisterTimeout();

    int getPayloadTypeBitrate(PayloadType payloadType);

    int getPayloadTypeNumber(PayloadType payloadType);

    int getPlayLevel();

    float getPlaybackGain();

    float getPreferredFramerate();

    VideoSize getPreferredVideoSize();

    @Deprecated
    OnlineStatus getPresenceInfo();

    PresenceModel getPresenceModel();

    String getPrimaryContact();

    String getPrimaryContactDisplayName();

    String getPrimaryContactUsername();

    String getProvisioningUri();

    LinphoneProxyConfig[] getProxyConfigList();

    LinphoneAddress getRemoteAddress();

    String getRemoteRingbackTone();

    String getRing();

    Transports getSignalingTransportPorts();

    int getSipDscp();

    int getSipTransportTimeout();

    String getStunServer();

    String[] getSupportedVideoSizes();

    String getTlsCertificate();

    String getTlsCertificatePath();

    String getTlsKey();

    String getTlsKeyPath();

    int getUploadBandwidth();

    String getUpnpExternalIpaddress();

    UpnpState getUpnpState();

    boolean getUseRfc2833ForDtmfs();

    boolean getUseSipInfoForDtmfs();

    String getVersion();

    boolean getVideoAutoAcceptPolicy();

    boolean getVideoAutoInitiatePolicy();

    PayloadType[] getVideoCodecs();

    int getVideoDevice();

    int getVideoDscp();

    String getVideoMulticastAddr();

    int getVideoMulticastTtl();

    String getVideoPreset();

    boolean hasBuiltInEchoCanceler();

    boolean hasCrappyOpenGL();

    LinphoneAddress interpretUrl(String str) throws LinphoneCoreException;

    LinphoneCall invite(String str) throws LinphoneCoreException;

    LinphoneCall invite(LinphoneAddress linphoneAddress) throws LinphoneCoreException;

    LinphoneCall inviteAddressWithParams(LinphoneAddress linphoneAddress, LinphoneCallParams linphoneCallParams) throws LinphoneCoreException;

    boolean isAdaptiveRateControlEnabled();

    boolean isEchoCancellationEnabled();

    boolean isEchoLimiterEnabled();

    boolean isInComingInvitePending();

    boolean isInConference();

    boolean isIncall();

    boolean isIpv6Enabled();

    boolean isKeepAliveEnabled();

    boolean isLimeEncryptionAvailable();

    boolean isMediaEncryptionMandatory();

    boolean isMicMuted();

    @Deprecated
    boolean isMyself(String str);

    boolean isNetworkReachable();

    boolean isPayloadTypeEnabled(PayloadType payloadType);

    boolean isSdp200AckEnabled();

    boolean isSpeakerEnabled();

    boolean isTunnelAvailable();

    boolean isVCardSupported();

    boolean isVideoEnabled();

    boolean isVideoSupported();

    void iterate();

    void leaveConference();

    boolean mediaEncryptionSupported(MediaEncryption mediaEncryption);

    void migrateCallLogs();

    int migrateToMultiTransport();

    void muteMic(boolean z);

    boolean needsEchoCalibration();

    boolean pauseAllCalls();

    boolean pauseCall(LinphoneCall linphoneCall);

    boolean payloadTypeIsVbr(PayloadType payloadType);

    void playDtmf(char c, int i);

    LinphoneEvent publish(LinphoneAddress linphoneAddress, String str, int i, LinphoneContent linphoneContent);

    void refreshRegisters();

    void reloadMsPlugins(String str);

    void reloadSoundDevices();

    void removeAuthInfo(LinphoneAuthInfo linphoneAuthInfo);

    void removeCallLog(LinphoneCallLog linphoneCallLog);

    void removeFriend(LinphoneFriend linphoneFriend);

    void removeFriendList(LinphoneFriendList linphoneFriendList) throws LinphoneCoreException;

    void removeFromConference(LinphoneCall linphoneCall);

    void removeListener(LinphoneCoreListener linphoneCoreListener);

    void removeProxyConfig(LinphoneProxyConfig linphoneProxyConfig);

    void resetLogCollection();

    void resetMissedCallsCount();

    boolean resumeCall(LinphoneCall linphoneCall);

    void sendDtmf(char c);

    void sendDtmfs(String str);

    void setAdaptiveRateAlgorithm(AdaptiveRateAlgorithm adaptiveRateAlgorithm);

    void setAudioCodecs(PayloadType[] payloadTypeArr);

    void setAudioDscp(int i);

    void setAudioJittcomp(int i);

    void setAudioMulticastAddr(String str) throws LinphoneCoreException;

    void setAudioMulticastTtl(int i) throws LinphoneCoreException;

    void setAudioPort(int i);

    void setAudioPortRange(int i, int i2);

    void setCallErrorTone(Reason reason, String str);

    void setCallLogsDatabasePath(String str);

    void setChatDatabasePath(String str);

    void setContext(Object obj);

    void setCpuCount(int i);

    void setDefaultProxyConfig(LinphoneProxyConfig linphoneProxyConfig);

    void setDefaultSoundDevices();

    void setDeviceRotation(int i);

    void setDnsServers(String[] strArr);

    void setDownloadBandwidth(int i);

    void setDownloadPtime(int i);

    void setFileTransferServer(String str);

    @Deprecated
    void setFirewallPolicy(FirewallPolicy firewallPolicy);

    void setFriendsDatabasePath(String str);

    void setHttpProxyHost(String str);

    void setHttpProxyPort(int i);

    void setInCallTimeout(int i);

    void setIncomingTimeout(int i);

    void setLimeEncryption(LinphoneLimeState linphoneLimeState);

    void setMaxCalls(int i);

    void setMediaEncryption(MediaEncryption mediaEncryption);

    void setMediaEncryptionMandatory(boolean z);

    void setMediaNetworkReachable(boolean z);

    void setMicrophoneGain(float f);

    void setMtu(int i);

    void setNatPolicy(LinphoneNatPolicy linphoneNatPolicy);

    void setNetworkReachable(boolean z);

    void setNortpTimeout(int i);

    void setPCCWDoubleRegisterTimeout(int i);

    void setPayloadTypeBitrate(PayloadType payloadType, int i);

    void setPayloadTypeNumber(PayloadType payloadType, int i);

    void setPlayFile(String str);

    void setPlayLevel(int i);

    void setPlaybackGain(float f);

    void setPreferredFramerate(float f);

    void setPreferredVideoSize(VideoSize videoSize);

    void setPreferredVideoSizeByName(String str);

    @Deprecated
    void setPresenceInfo(int i, String str, OnlineStatus onlineStatus);

    void setPresenceModel(PresenceModel presenceModel);

    void setPreviewWindow(Object obj);

    void setPrimaryContact(String str);

    void setPrimaryContact(String str, String str2);

    void setProvisioningUri(String str);

    void setRemoteRingbackTone(String str);

    void setRing(String str);

    void setRingback(String str);

    void setRootCA(String str);

    void setRootCAData(String str);

    void setSignalingTransportPorts(Transports transports);

    void setSipDscp(int i);

    void setSipNetworkReachable(boolean z);

    void setSipTransportTimeout(int i);

    void setSpeakerphoneAlwaysOn(boolean z);

    void setStaticPicture(String str);

    void setStunServer(String str);

    void setTlsCertificate(String str);

    void setTlsCertificatePath(String str);

    void setTlsKey(String str);

    void setTlsKeyPath(String str);

    void setTone(ToneID toneID, String str);

    void setUploadBandwidth(int i);

    void setUploadPtime(int i);

    void setUseRfc2833ForDtmfs(boolean z);

    void setUseSipInfoForDtmfs(boolean z);

    void setUserAgent(String str, String str2);

    void setUserCertificatesPath(String str);

    void setVerifyServerCN(boolean z);

    void setVerifyServerCertificates(boolean z);

    void setVideoCodecs(PayloadType[] payloadTypeArr);

    void setVideoDevice(int i);

    void setVideoDscp(int i);

    void setVideoJittcomp(int i);

    void setVideoMulticastAddr(String str) throws LinphoneCoreException;

    void setVideoMulticastTtl(int i) throws LinphoneCoreException;

    void setVideoPolicy(boolean z, boolean z2);

    void setVideoPort(int i);

    void setVideoPortRange(int i, int i2);

    void setVideoPreset(String str);

    void setVideoWindow(Object obj);

    void setZrtpSecretsCache(String str);

    boolean soundResourcesLocked();

    void startConferenceRecording(String str);

    void startEchoCalibration(LinphoneCoreListener linphoneCoreListener) throws LinphoneCoreException;

    int startEchoTester(int i);

    LinphoneCall startReferedCall(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams);

    void stopConferenceRecording();

    void stopDtmf();

    int stopEchoTester();

    void stopRinging();

    LinphoneEvent subscribe(LinphoneAddress linphoneAddress, String str, int i, LinphoneContent linphoneContent);

    void terminateAllCalls();

    void terminateCall(LinphoneCall linphoneCall);

    void terminateConference();

    void transferCall(LinphoneCall linphoneCall, String str);

    void transferCallToAnother(LinphoneCall linphoneCall, LinphoneCall linphoneCall2);

    void tunnelAddServer(TunnelConfig tunnelConfig);

    void tunnelAddServerAndMirror(String str, int i, int i2, int i3);

    @Deprecated
    void tunnelAutoDetect();

    void tunnelCleanServers();

    boolean tunnelDualModeEnabled();

    @Deprecated
    void tunnelEnable(boolean z);

    void tunnelEnableDualMode(boolean z);

    void tunnelEnableSip(boolean z);

    TunnelMode tunnelGetMode();

    TunnelConfig[] tunnelGetServers();

    void tunnelSetHttpProxy(String str, int i, String str2, String str3);

    void tunnelSetMode(TunnelMode tunnelMode);

    boolean tunnelSipEnabled();

    int updateCall(LinphoneCall linphoneCall, LinphoneCallParams linphoneCallParams);

    void uploadLogCollection();

    boolean upnpAvailable();

    boolean usePCCWFallbackRegisterPort();

    boolean videoMulticastEnabled();
}
