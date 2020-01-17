package org.linphone.core;

import java.io.Serializable;
import org.linphone.core.LinphoneFriendList;

class LinphoneFriendListImpl implements LinphoneFriendList, Serializable {
    protected final long nativePtr;

    protected LinphoneFriendListImpl(long j) {
        this.nativePtr = j;
    }

    protected LinphoneFriendListImpl(LinphoneCoreImpl linphoneCoreImpl) {
        this.nativePtr = newLinphoneFriendList(linphoneCoreImpl.nativePtr);
    }

    private native void addFriend(long j, long j2);

    private native void addLocalFriend(long j, long j2);

    private native void enableSubscriptions(long j, boolean z);

    private native void exportFriendsToVCardFile(long j, String str);

    private native void finalize(long j);

    private native LinphoneFriend findFriendByUri(long j, String str);

    private native Object getCore(long j);

    private native LinphoneFriend[] getFriendList(long j);

    private native String getRLSUri(long j);

    private Object getSyncObject() {
        return this;
    }

    private native int importFriendsFromVCardBuffer(long j, String str);

    private native int importFriendsFromVCardFile(long j, String str);

    private native long newLinphoneFriendList(long j);

    private native void setListener(long j, LinphoneFriendList.LinphoneFriendListListener linphoneFriendListListener);

    private native void setRLSAddress(long j, long j2);

    private native void setRLSUri(long j, String str);

    private native void setUri(long j, String str);

    private native void synchronizeFriendsFromServer(long j);

    private native void updateSubscriptions(long j);

    public void addFriend(LinphoneFriend linphoneFriend) {
        synchronized (getSyncObject()) {
            addFriend(this.nativePtr, linphoneFriend.getNativePtr());
        }
    }

    public void addLocalFriend(LinphoneFriend linphoneFriend) {
        synchronized (getSyncObject()) {
            addLocalFriend(this.nativePtr, linphoneFriend.getNativePtr());
        }
    }

    public void enableSubscriptions(boolean z) {
        synchronized (getSyncObject()) {
            enableSubscriptions(this.nativePtr, z);
        }
    }

    public void exportFriendsToVCardFile(String str) {
        exportFriendsToVCardFile(this.nativePtr, str);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.nativePtr != 0) {
            finalize(this.nativePtr);
        }
        super.finalize();
    }

    public LinphoneFriend findFriendByUri(String str) {
        LinphoneFriend findFriendByUri;
        synchronized (getSyncObject()) {
            findFriendByUri = findFriendByUri(this.nativePtr, str);
        }
        return findFriendByUri;
    }

    public LinphoneFriend[] getFriendList() {
        LinphoneFriend[] friendList;
        synchronized (getSyncObject()) {
            friendList = getFriendList(this.nativePtr);
        }
        return friendList;
    }

    public long getNativePtr() {
        return this.nativePtr;
    }

    public String getRLSUri() {
        String rLSUri;
        synchronized (getSyncObject()) {
            rLSUri = getRLSUri(this.nativePtr);
        }
        return rLSUri;
    }

    public int importFriendsFromVCardBuffer(String str) {
        return importFriendsFromVCardBuffer(this.nativePtr, str);
    }

    public int importFriendsFromVCardFile(String str) {
        return importFriendsFromVCardFile(this.nativePtr, str);
    }

    public void setListener(LinphoneFriendList.LinphoneFriendListListener linphoneFriendListListener) {
        setListener(this.nativePtr, linphoneFriendListListener);
    }

    public void setRLSAddress(LinphoneAddress linphoneAddress) {
        synchronized (getSyncObject()) {
            setRLSAddress(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr);
        }
    }

    public void setRLSUri(String str) {
        synchronized (getSyncObject()) {
            setRLSUri(this.nativePtr, str);
        }
    }

    public void setUri(String str) {
        synchronized (getSyncObject()) {
            setUri(this.nativePtr, str);
        }
    }

    public void synchronizeFriendsFromServer() {
        synchronized (getSyncObject()) {
            synchronizeFriendsFromServer(this.nativePtr);
        }
    }

    public void updateSubscriptions() {
        synchronized (getSyncObject()) {
            updateSubscriptions(this.nativePtr);
        }
    }
}
