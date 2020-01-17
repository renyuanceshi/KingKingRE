package org.linphone.core;

public class LinphoneEventImpl implements LinphoneEvent {
    private long mNativePtr;
    private Object mUserContext;

    protected LinphoneEventImpl(long j) {
        this.mNativePtr = j;
    }

    private native int acceptSubscription(long j);

    private native void addCustomHeader(long j, String str, String str2);

    private native int denySubscription(long j, int i);

    private native Object getCore(long j);

    private native String getCustomHeader(long j, String str);

    private native long getErrorInfo(long j);

    private native String getEventName(long j);

    private native int getReason(long j);

    private native int getSubscriptionDir(long j);

    private native int getSubscriptionState(long j);

    private native int notify(long j, String str, String str2, byte[] bArr, String str3);

    private native void sendPublish(long j, String str, String str2, byte[] bArr, String str3);

    private native void sendSubscribe(long j, String str, String str2, byte[] bArr, String str3);

    private native int terminate(long j);

    private native void unref(long j);

    private native int updatePublish(long j, String str, String str2, byte[] bArr, String str3);

    private native int updateSubscribe(long j, String str, String str2, byte[] bArr, String str3);

    public void acceptSubscription() {
        synchronized (this) {
            synchronized (getCore()) {
                acceptSubscription(this.mNativePtr);
            }
        }
    }

    public void addCustomHeader(String str, String str2) {
        synchronized (this) {
            addCustomHeader(this.mNativePtr, str, str2);
        }
    }

    public void denySubscription(Reason reason) {
        synchronized (this) {
            synchronized (getCore()) {
                denySubscription(this.mNativePtr, reason.mValue);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() {
        unref(this.mNativePtr);
    }

    public LinphoneCore getCore() {
        LinphoneCore linphoneCore;
        synchronized (this) {
            linphoneCore = (LinphoneCore) getCore(this.mNativePtr);
        }
        return linphoneCore;
    }

    public String getCustomHeader(String str) {
        String customHeader;
        synchronized (this) {
            customHeader = getCustomHeader(this.mNativePtr, str);
        }
        return customHeader;
    }

    public ErrorInfo getErrorInfo() {
        ErrorInfoImpl errorInfoImpl;
        synchronized (this) {
            errorInfoImpl = new ErrorInfoImpl(getErrorInfo(this.mNativePtr));
        }
        return errorInfoImpl;
    }

    public String getEventName() {
        String eventName;
        synchronized (this) {
            eventName = getEventName(this.mNativePtr);
        }
        return eventName;
    }

    public Reason getReason() {
        Reason fromInt;
        synchronized (this) {
            fromInt = Reason.fromInt(getReason(this.mNativePtr));
        }
        return fromInt;
    }

    public SubscriptionDir getSubscriptionDir() {
        SubscriptionDir fromInt;
        synchronized (this) {
            fromInt = SubscriptionDir.fromInt(getSubscriptionDir(this.mNativePtr));
        }
        return fromInt;
    }

    public SubscriptionState getSubscriptionState() {
        SubscriptionState subscriptionState;
        synchronized (this) {
            try {
                subscriptionState = SubscriptionState.fromInt(getSubscriptionState(this.mNativePtr));
            } catch (LinphoneCoreException e) {
                e.printStackTrace();
                subscriptionState = SubscriptionState.Error;
            }
        }
        return subscriptionState;
    }

    public Object getUserContext() {
        Object obj;
        synchronized (this) {
            obj = this.mUserContext;
        }
        return obj;
    }

    public void notify(LinphoneContent linphoneContent) {
        synchronized (getCore()) {
            notify(this.mNativePtr, linphoneContent.getType(), linphoneContent.getSubtype(), linphoneContent.getData(), linphoneContent.getEncoding());
        }
    }

    public void sendPublish(LinphoneContent linphoneContent) {
        synchronized (getCore()) {
            if (linphoneContent != null) {
                sendPublish(this.mNativePtr, linphoneContent.getType(), linphoneContent.getSubtype(), linphoneContent.getData(), linphoneContent.getEncoding());
            } else {
                sendPublish(this.mNativePtr, (String) null, (String) null, (byte[]) null, (String) null);
            }
        }
    }

    public void sendSubscribe(LinphoneContent linphoneContent) {
        synchronized (getCore()) {
            if (linphoneContent != null) {
                sendSubscribe(this.mNativePtr, linphoneContent.getType(), linphoneContent.getSubtype(), linphoneContent.getData(), linphoneContent.getEncoding());
            } else {
                sendSubscribe(this.mNativePtr, (String) null, (String) null, (byte[]) null, (String) null);
            }
        }
    }

    public void setUserContext(Object obj) {
        synchronized (this) {
            this.mUserContext = obj;
        }
    }

    public void terminate() {
        synchronized (getCore()) {
            terminate(this.mNativePtr);
        }
    }

    public void updatePublish(LinphoneContent linphoneContent) {
        synchronized (getCore()) {
            updatePublish(this.mNativePtr, linphoneContent.getType(), linphoneContent.getSubtype(), linphoneContent.getData(), linphoneContent.getEncoding());
        }
    }

    public void updateSubscribe(LinphoneContent linphoneContent) {
        synchronized (getCore()) {
            updateSubscribe(this.mNativePtr, linphoneContent.getType(), linphoneContent.getSubtype(), linphoneContent.getData(), linphoneContent.getEncoding());
        }
    }
}
