package org.linphone.core.tutorials;

import java.nio.ByteBuffer;
import org.apache.commons.lang3.StringUtils;
import org.linphone.core.LinphoneAddress;
import org.linphone.core.LinphoneAuthInfo;
import org.linphone.core.LinphoneCall;
import org.linphone.core.LinphoneCallStats;
import org.linphone.core.LinphoneChatMessage;
import org.linphone.core.LinphoneChatRoom;
import org.linphone.core.LinphoneContent;
import org.linphone.core.LinphoneCore;
import org.linphone.core.LinphoneCoreException;
import org.linphone.core.LinphoneCoreFactory;
import org.linphone.core.LinphoneCoreListener;
import org.linphone.core.LinphoneEvent;
import org.linphone.core.LinphoneFriend;
import org.linphone.core.LinphoneFriendList;
import org.linphone.core.LinphoneInfoMessage;
import org.linphone.core.LinphoneProxyConfig;
import org.linphone.core.OnlineStatus;
import org.linphone.core.PublishState;
import org.linphone.core.SubscriptionState;

public class TutorialBuddyStatus implements LinphoneCoreListener {
    private TutorialNotifier TutorialNotifier;
    private boolean running;

    public TutorialBuddyStatus() {
        this.TutorialNotifier = new TutorialNotifier();
    }

    public TutorialBuddyStatus(TutorialNotifier tutorialNotifier) {
        this.TutorialNotifier = tutorialNotifier;
    }

    public static void main(String[] strArr) {
        String str = null;
        if (strArr.length < 1 || strArr.length > 3) {
            throw new IllegalArgumentException("Bad number of arguments [" + strArr.length + "] should be 1, 2 or 3");
        }
        TutorialBuddyStatus tutorialBuddyStatus = new TutorialBuddyStatus();
        String str2 = strArr[1];
        String str3 = strArr.length > 1 ? strArr[1] : null;
        try {
            if (strArr.length > 2) {
                str = strArr[2];
            }
            tutorialBuddyStatus.launchTutorial(str2, str3, str);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void write(String str) {
        this.TutorialNotifier.notify(str);
    }

    public void authInfoRequested(LinphoneCore linphoneCore, String str, String str2, String str3) {
    }

    public void authenticationRequested(LinphoneCore linphoneCore, LinphoneAuthInfo linphoneAuthInfo, LinphoneCore.AuthMethod authMethod) {
    }

    public void byeReceived(LinphoneCore linphoneCore, String str) {
    }

    public void callEncryptionChanged(LinphoneCore linphoneCore, LinphoneCall linphoneCall, boolean z, String str) {
    }

    public void callState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state, String str) {
    }

    public void callStatsUpdated(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCallStats linphoneCallStats) {
    }

    public void configuringStatus(LinphoneCore linphoneCore, LinphoneCore.RemoteProvisioningState remoteProvisioningState, String str) {
    }

    public void displayMessage(LinphoneCore linphoneCore, String str) {
    }

    public void displayStatus(LinphoneCore linphoneCore, String str) {
    }

    public void displayWarning(LinphoneCore linphoneCore, String str) {
    }

    public void dtmfReceived(LinphoneCore linphoneCore, LinphoneCall linphoneCall, int i) {
    }

    public void ecCalibrationStatus(LinphoneCore linphoneCore, LinphoneCore.EcCalibratorStatus ecCalibratorStatus, int i, Object obj) {
    }

    public void fileTransferProgressIndication(LinphoneCore linphoneCore, LinphoneChatMessage linphoneChatMessage, LinphoneContent linphoneContent, int i) {
    }

    public void fileTransferRecv(LinphoneCore linphoneCore, LinphoneChatMessage linphoneChatMessage, LinphoneContent linphoneContent, byte[] bArr, int i) {
    }

    public int fileTransferSend(LinphoneCore linphoneCore, LinphoneChatMessage linphoneChatMessage, LinphoneContent linphoneContent, ByteBuffer byteBuffer, int i) {
        return 0;
    }

    public void friendListCreated(LinphoneCore linphoneCore, LinphoneFriendList linphoneFriendList) {
    }

    public void friendListRemoved(LinphoneCore linphoneCore, LinphoneFriendList linphoneFriendList) {
    }

    public void globalState(LinphoneCore linphoneCore, LinphoneCore.GlobalState globalState, String str) {
    }

    public void infoReceived(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneInfoMessage linphoneInfoMessage) {
    }

    public void isComposingReceived(LinphoneCore linphoneCore, LinphoneChatRoom linphoneChatRoom) {
    }

    public void launchTutorial(String str, String str2, String str3) throws LinphoneCoreException {
        String str4;
        String str5;
        LinphoneCoreFactory instance = LinphoneCoreFactory.instance();
        LinphoneCore createLinphoneCore = instance.createLinphoneCore(this, (Object) null);
        try {
            LinphoneFriend createFriendWithAddress = createLinphoneCore.createFriendWithAddress(str);
            if (createFriendWithAddress == null) {
                write("Could not create friend; weird SIP address?");
                return;
            }
            if (str2 != null) {
                LinphoneAddress createLinphoneAddress = instance.createLinphoneAddress(str2);
                String userName = createLinphoneAddress.getUserName();
                String domain = createLinphoneAddress.getDomain();
                if (str3 != null) {
                    createLinphoneCore.addAuthInfo(instance.createAuthInfo(userName, str3, (String) null, domain));
                }
                LinphoneProxyConfig createProxyConfig = createLinphoneCore.createProxyConfig(str2, domain, (String) null, true);
                createProxyConfig.enablePublish(true);
                createLinphoneCore.addProxyConfig(createProxyConfig);
                createLinphoneCore.setDefaultProxyConfig(createProxyConfig);
                while (!createProxyConfig.isRegistered()) {
                    createLinphoneCore.iterate();
                    Thread.sleep(1000);
                }
            }
            createFriendWithAddress.enableSubscribes(true);
            createFriendWithAddress.setIncSubscribePolicy(LinphoneFriend.SubscribePolicy.SPAccept);
            try {
                createLinphoneCore.addFriend(createFriendWithAddress);
                createLinphoneCore.setPresenceInfo(0, (String) null, OnlineStatus.Online);
                this.running = true;
                while (this.running) {
                    createLinphoneCore.iterate();
                    try {
                        Thread.sleep(50);
                    } catch (InterruptedException e) {
                        write("Interrupted!\nAborting");
                        write("Shutting down...");
                        createLinphoneCore.destroy();
                        write("Exited");
                        return;
                    }
                }
                createLinphoneCore.setPresenceInfo(0, (String) null, OnlineStatus.Offline);
                createLinphoneCore.iterate();
                createFriendWithAddress.edit();
                createFriendWithAddress.enableSubscribes(false);
                createFriendWithAddress.done();
                createLinphoneCore.iterate();
                write("Shutting down...");
                createLinphoneCore.destroy();
                write("Exited");
            } catch (LinphoneCoreException e2) {
                write("Error while adding friend " + createFriendWithAddress.getAddress().getUserName() + " to linphone");
                write("Shutting down...");
                createLinphoneCore.destroy();
                write("Exited");
            }
        } catch (InterruptedException e3) {
            write("Interrupted!\nAborting");
        } finally {
            str4 = "Shutting down...";
            write(str4);
            createLinphoneCore.destroy();
            str5 = "Exited";
            write(str5);
        }
    }

    public void messageReceived(LinphoneCore linphoneCore, LinphoneChatRoom linphoneChatRoom, LinphoneChatMessage linphoneChatMessage) {
    }

    public void messageReceivedUnableToDecrypted(LinphoneCore linphoneCore, LinphoneChatRoom linphoneChatRoom, LinphoneChatMessage linphoneChatMessage) {
    }

    public void networkReachableChanged(LinphoneCore linphoneCore, boolean z) {
    }

    public void newSubscriptionRequest(LinphoneCore linphoneCore, LinphoneFriend linphoneFriend, String str) {
        write("[" + linphoneFriend.getAddress().getUserName() + "] wants to see your status, accepting");
        linphoneFriend.edit();
        linphoneFriend.setIncSubscribePolicy(LinphoneFriend.SubscribePolicy.SPAccept);
        linphoneFriend.done();
        try {
            linphoneCore.addFriend(linphoneFriend);
        } catch (LinphoneCoreException e) {
            write("Error while adding friend [" + linphoneFriend.getAddress().getUserName() + "] to linphone in the callback");
        }
    }

    public void notifyPresenceReceived(LinphoneCore linphoneCore, LinphoneFriend linphoneFriend) {
        write("New state [" + linphoneFriend.getStatus() + "] for user id [" + linphoneFriend.getAddress().getUserName() + "]");
    }

    public void notifyReceived(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneAddress linphoneAddress, byte[] bArr) {
    }

    public void notifyReceived(LinphoneCore linphoneCore, LinphoneEvent linphoneEvent, String str, LinphoneContent linphoneContent) {
    }

    public void publishStateChanged(LinphoneCore linphoneCore, LinphoneEvent linphoneEvent, PublishState publishState) {
    }

    public void registrationState(LinphoneCore linphoneCore, LinphoneProxyConfig linphoneProxyConfig, LinphoneCore.RegistrationState registrationState, String str) {
        write(linphoneProxyConfig.getIdentity() + " : " + str + StringUtils.LF);
    }

    public void show(LinphoneCore linphoneCore) {
    }

    public void stopMainLoop() {
        this.running = false;
    }

    public void subscriptionStateChanged(LinphoneCore linphoneCore, LinphoneEvent linphoneEvent, SubscriptionState subscriptionState) {
    }

    public void transferState(LinphoneCore linphoneCore, LinphoneCall linphoneCall, LinphoneCall.State state) {
    }

    public void uploadProgressIndication(LinphoneCore linphoneCore, int i, int i2) {
    }

    public void uploadStateChanged(LinphoneCore linphoneCore, LinphoneCore.LogCollectionUploadState logCollectionUploadState, String str) {
    }
}
