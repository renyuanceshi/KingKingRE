package org.linphone.core;

import java.io.Serializable;
import org.linphone.core.LinphoneAddressImpl;
import org.linphone.core.LinphoneFriend;

public class LinphoneFriendImpl implements LinphoneFriend, Serializable {
    protected final long nativePtr;
    private Object userdData;

    protected LinphoneFriendImpl() {
        this.nativePtr = newLinphoneFriend((String) null);
    }

    protected LinphoneFriendImpl(long j) {
        this.nativePtr = j;
    }

    protected LinphoneFriendImpl(String str) {
        this.nativePtr = newLinphoneFriend(str);
    }

    private native void addAddress(long j, long j2);

    private native void addPhoneNumber(long j, String str);

    private native void done(long j);

    private native void edit(long j);

    private native void enableSubscribes(long j, boolean z);

    private native void finalize(long j);

    private native long getAddress(long j);

    private native long[] getAddresses(long j);

    private native Object getCore(long j);

    private native String getFamilyName(long j);

    private native String getGivenName(long j);

    private native int getIncSubscribePolicy(long j);

    private native String getName(long j);

    private native String getOrganization(long j);

    private native Object[] getPhoneNumbers(long j);

    private native Object getPresenceModel(long j);

    private native Object getPresenceModelForUri(long j, String str);

    private native String getRefKey(long j);

    private native int getStatus(long j);

    private Object getSyncObject() {
        Object core = getCore(this.nativePtr);
        return core != null ? core : this;
    }

    private native String getVcardToString(long j);

    private native boolean isAlreadyPresentInFriendList(long j);

    private native boolean isPresenceReceived(long j);

    private native boolean isSubscribesEnabled(long j);

    private native long newLinphoneFriend(String str);

    private native void removeAddress(long j, long j2);

    private native void removePhoneNumber(long j, String str);

    private native void setAddress(long j, long j2);

    private native void setFamilyName(long j, String str);

    private native void setGivenName(long j, String str);

    private native void setIncSubscribePolicy(long j, int i);

    private native void setName(long j, String str);

    private native void setOrganization(long j, String str);

    private native void setPresenceModel(long j, long j2);

    private native void setRefKey(long j, String str);

    public void addAddress(LinphoneAddress linphoneAddress) {
        addAddress(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr);
    }

    public void addPhoneNumber(String str) {
        addPhoneNumber(this.nativePtr, str);
    }

    public void done() {
        synchronized (getSyncObject()) {
            done(this.nativePtr);
        }
    }

    public void edit() {
        synchronized (getSyncObject()) {
            edit(this.nativePtr);
        }
    }

    public void enableSubscribes(boolean z) {
        synchronized (getSyncObject()) {
            enableSubscribes(this.nativePtr, z);
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.nativePtr != 0) {
            finalize(this.nativePtr);
        }
        super.finalize();
    }

    public LinphoneAddress getAddress() {
        long address = getAddress(this.nativePtr);
        if (address != 0) {
            return new LinphoneAddressImpl(address, LinphoneAddressImpl.WrapMode.FromConst);
        }
        return null;
    }

    public LinphoneAddress[] getAddresses() {
        long[] addresses = getAddresses(this.nativePtr);
        if (addresses == null) {
            return null;
        }
        LinphoneAddress[] linphoneAddressArr = new LinphoneAddress[addresses.length];
        for (int i = 0; i < linphoneAddressArr.length; i++) {
            linphoneAddressArr[i] = new LinphoneAddressImpl(addresses[i], LinphoneAddressImpl.WrapMode.FromConst);
        }
        return linphoneAddressArr;
    }

    public String getFamilyName() {
        return getFamilyName(this.nativePtr);
    }

    public String getGivenName() {
        return getGivenName(this.nativePtr);
    }

    public LinphoneFriend.SubscribePolicy getIncSubscribePolicy() {
        return LinphoneFriend.SubscribePolicy.fromInt(getIncSubscribePolicy(this.nativePtr));
    }

    public String getName() {
        return getName(this.nativePtr);
    }

    public long getNativePtr() {
        return this.nativePtr;
    }

    public String getOrganization() {
        return getOrganization(this.nativePtr);
    }

    public String[] getPhoneNumbers() {
        Object[] phoneNumbers = getPhoneNumbers(this.nativePtr);
        if (phoneNumbers == null) {
            return null;
        }
        String[] strArr = new String[phoneNumbers.length];
        for (int i = 0; i < phoneNumbers.length; i++) {
            strArr[i] = phoneNumbers[i].toString();
        }
        return strArr;
    }

    public PresenceModel getPresenceModel() {
        return (PresenceModel) getPresenceModel(this.nativePtr);
    }

    public PresenceModel getPresenceModelForUri(String str) {
        return (PresenceModel) getPresenceModelForUri(this.nativePtr, str);
    }

    public String getRefKey() {
        return getRefKey(this.nativePtr);
    }

    public OnlineStatus getStatus() {
        return OnlineStatus.fromInt(getStatus(this.nativePtr));
    }

    public Object getUserData() {
        return this.userdData;
    }

    public String getVcardToString() {
        String vcardToString;
        synchronized (this) {
            vcardToString = getVcardToString(this.nativePtr);
        }
        return vcardToString;
    }

    public boolean isAlreadyPresentInFriendList() {
        return isAlreadyPresentInFriendList(this.nativePtr);
    }

    public boolean isPresenceReceived() {
        return isPresenceReceived(this.nativePtr);
    }

    public boolean isSubscribesEnabled() {
        return isSubscribesEnabled(this.nativePtr);
    }

    public void removeAddress(LinphoneAddress linphoneAddress) {
        removeAddress(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr);
    }

    public void removePhoneNumber(String str) {
        removePhoneNumber(this.nativePtr, str);
    }

    public void setAddress(LinphoneAddress linphoneAddress) {
        setAddress(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr);
    }

    public void setFamilyName(String str) {
        setFamilyName(this.nativePtr, str);
    }

    public void setGivenName(String str) {
        setGivenName(this.nativePtr, str);
    }

    public void setIncSubscribePolicy(LinphoneFriend.SubscribePolicy subscribePolicy) {
        synchronized (getSyncObject()) {
            setIncSubscribePolicy(this.nativePtr, subscribePolicy.mValue);
        }
    }

    public void setName(String str) {
        setName(this.nativePtr, str);
    }

    public void setOrganization(String str) {
        setOrganization(this.nativePtr, str);
    }

    public void setPresenceModel(PresenceModel presenceModel) {
        setPresenceModel(this.nativePtr, ((PresenceModelImpl) presenceModel).getNativePtr());
    }

    public void setRefKey(String str) {
        synchronized (getSyncObject()) {
            setRefKey(this.nativePtr, str);
        }
    }

    public void setUserData(Object obj) {
        this.userdData = obj;
    }
}
