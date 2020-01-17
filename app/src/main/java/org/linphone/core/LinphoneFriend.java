package org.linphone.core;

import java.util.Vector;

public interface LinphoneFriend {

    public static class SubscribePolicy {
        public static final SubscribePolicy SPAccept = new SubscribePolicy(2, "SPAccept");
        public static final SubscribePolicy SPDeny = new SubscribePolicy(1, "SPDeny");
        public static final SubscribePolicy SPWait = new SubscribePolicy(0, "SPWait");
        private static Vector<SubscribePolicy> values = new Vector<>();
        private final String mStringValue;
        protected final int mValue;

        private SubscribePolicy(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static SubscribePolicy fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    SubscribePolicy elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("Policy not found [" + i + "]");
                }
            }
        }

        public String toString() {
            return this.mStringValue;
        }
    }

    void addAddress(LinphoneAddress linphoneAddress);

    void addPhoneNumber(String str);

    void done();

    void edit();

    void enableSubscribes(boolean z);

    LinphoneAddress getAddress();

    LinphoneAddress[] getAddresses();

    String getFamilyName();

    String getGivenName();

    SubscribePolicy getIncSubscribePolicy();

    String getName();

    long getNativePtr();

    String getOrganization();

    String[] getPhoneNumbers();

    @Deprecated
    PresenceModel getPresenceModel();

    PresenceModel getPresenceModelForUri(String str);

    String getRefKey();

    @Deprecated
    OnlineStatus getStatus();

    String getVcardToString();

    boolean isAlreadyPresentInFriendList();

    boolean isPresenceReceived();

    boolean isSubscribesEnabled();

    void removeAddress(LinphoneAddress linphoneAddress);

    void removePhoneNumber(String str);

    void setAddress(LinphoneAddress linphoneAddress);

    void setFamilyName(String str);

    void setGivenName(String str);

    void setIncSubscribePolicy(SubscribePolicy subscribePolicy);

    void setName(String str);

    void setOrganization(String str);

    void setPresenceModel(PresenceModel presenceModel);

    void setRefKey(String str);

    String toString();
}
