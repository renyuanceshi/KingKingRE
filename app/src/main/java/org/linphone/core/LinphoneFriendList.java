package org.linphone.core;

import java.util.Vector;

public interface LinphoneFriendList {

    public interface LinphoneFriendListListener {
        void onLinphoneFriendCreated(LinphoneFriendList linphoneFriendList, LinphoneFriend linphoneFriend);

        void onLinphoneFriendDeleted(LinphoneFriendList linphoneFriendList, LinphoneFriend linphoneFriend);

        void onLinphoneFriendSyncStatusChanged(LinphoneFriendList linphoneFriendList, State state, String str);

        void onLinphoneFriendUpdated(LinphoneFriendList linphoneFriendList, LinphoneFriend linphoneFriend, LinphoneFriend linphoneFriend2);
    }

    public static class State {
        public static final State SyncFailure = new State(2, "SyncFailure");
        public static final State SyncStarted = new State(0, "SyncStarted");
        public static final State SyncSuccessful = new State(1, "SyncSuccessful");
        private static Vector<State> values = new Vector<>();
        private final String mStringValue;
        private final int mValue;

        private State(int i, String str) {
            this.mValue = i;
            values.addElement(this);
            this.mStringValue = str;
        }

        public static State fromInt(int i) {
            int i2 = 0;
            while (true) {
                int i3 = i2;
                if (i3 < values.size()) {
                    State elementAt = values.elementAt(i3);
                    if (elementAt.mValue == i) {
                        return elementAt;
                    }
                    i2 = i3 + 1;
                } else {
                    throw new RuntimeException("state not found [" + i + "]");
                }
            }
        }

        public int toInt() {
            return this.mValue;
        }

        public String toString() {
            return this.mStringValue;
        }

        public final int value() {
            return this.mValue;
        }
    }

    void addFriend(LinphoneFriend linphoneFriend);

    void addLocalFriend(LinphoneFriend linphoneFriend);

    void enableSubscriptions(boolean z);

    void exportFriendsToVCardFile(String str);

    LinphoneFriend findFriendByUri(String str);

    LinphoneFriend[] getFriendList();

    long getNativePtr();

    String getRLSUri();

    int importFriendsFromVCardBuffer(String str);

    int importFriendsFromVCardFile(String str);

    void setListener(LinphoneFriendListListener linphoneFriendListListener);

    void setRLSAddress(LinphoneAddress linphoneAddress);

    void setRLSUri(String str);

    void setUri(String str);

    void synchronizeFriendsFromServer();

    void updateSubscriptions();
}
