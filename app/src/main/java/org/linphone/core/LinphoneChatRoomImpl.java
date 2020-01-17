package org.linphone.core;

import org.linphone.core.LinphoneAddressImpl;
import org.linphone.core.LinphoneChatMessage;

class LinphoneChatRoomImpl implements LinphoneChatRoom {
    protected final long nativePtr;

    protected LinphoneChatRoomImpl(long j) {
        this.nativePtr = j;
    }

    private native void compose(long j);

    private native Object createFileTransferMessage(long j, String str, String str2, String str3, int i);

    private native Object createLinphoneChatMessage(long j, String str);

    private native void deleteHistory(long j);

    private native void deleteMessage(long j, long j2);

    private native void destroy(long j);

    private native void finalize(long j);

    private native Object getCall(long j);

    private native long getChar(long j);

    private native Object getCore(long j);

    private native Object[] getHistory(long j, int i);

    private LinphoneChatMessage[] getHistoryPrivate(Object[] objArr) {
        return (LinphoneChatMessage[]) objArr;
    }

    private native Object[] getHistoryRange(long j, int i, int i2);

    private native int getHistorySize(long j);

    private native long getPeerAddress(long j);

    private native int getUnreadMessagesCount(long j);

    private native boolean isRemoteComposing(long j);

    private native boolean islimeAvailable(long j);

    private native void markAsRead(long j);

    private native void sendChatMessage(long j, Object obj, long j2);

    private native void sendMessage(long j, String str);

    private native void sendMessage2(long j, Object obj, long j2, LinphoneChatMessage.StateListener stateListener);

    public void compose() {
        synchronized (getCore()) {
            compose(this.nativePtr);
        }
    }

    public LinphoneChatMessage createFileTransferMessage(LinphoneContent linphoneContent) {
        LinphoneChatMessage linphoneChatMessage;
        synchronized (getCore()) {
            linphoneChatMessage = (LinphoneChatMessage) createFileTransferMessage(this.nativePtr, linphoneContent.getName(), linphoneContent.getType(), linphoneContent.getSubtype(), linphoneContent.getRealSize());
        }
        return linphoneChatMessage;
    }

    public LinphoneChatMessage createLinphoneChatMessage(String str) {
        LinphoneChatMessage linphoneChatMessage;
        synchronized (getCore()) {
            linphoneChatMessage = (LinphoneChatMessage) createLinphoneChatMessage(this.nativePtr, str);
        }
        return linphoneChatMessage;
    }

    public void deleteHistory() {
        synchronized (getCore()) {
            deleteHistory(this.nativePtr);
        }
    }

    public void deleteMessage(LinphoneChatMessage linphoneChatMessage) {
        synchronized (getCore()) {
            if (linphoneChatMessage != null) {
                deleteMessage(this.nativePtr, ((LinphoneChatMessageImpl) linphoneChatMessage).getNativePtr());
            }
        }
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.nativePtr != 0) {
            finalize(this.nativePtr);
        }
        super.finalize();
    }

    public LinphoneCall getCall() {
        return (LinphoneCall) getCall(this.nativePtr);
    }

    public long getChar() {
        return getChar(this.nativePtr);
    }

    public LinphoneCore getCore() {
        LinphoneCore linphoneCore;
        synchronized (this) {
            linphoneCore = (LinphoneCore) getCore(this.nativePtr);
        }
        return linphoneCore;
    }

    public LinphoneChatMessage[] getHistory() {
        LinphoneChatMessage[] history;
        synchronized (getCore()) {
            history = getHistory(0);
        }
        return history;
    }

    public LinphoneChatMessage[] getHistory(int i) {
        LinphoneChatMessage[] historyPrivate;
        synchronized (getCore()) {
            historyPrivate = getHistoryPrivate(getHistory(this.nativePtr, i));
        }
        return historyPrivate;
    }

    public LinphoneChatMessage[] getHistoryRange(int i, int i2) {
        LinphoneChatMessage[] historyPrivate;
        synchronized (getCore()) {
            historyPrivate = getHistoryPrivate(getHistoryRange(this.nativePtr, i, i2));
        }
        return historyPrivate;
    }

    public int getHistorySize() {
        int historySize;
        synchronized (getCore()) {
            historySize = getHistorySize(this.nativePtr);
        }
        return historySize;
    }

    public LinphoneAddress getPeerAddress() {
        return new LinphoneAddressImpl(getPeerAddress(this.nativePtr), LinphoneAddressImpl.WrapMode.FromConst);
    }

    public int getUnreadMessagesCount() {
        int unreadMessagesCount;
        synchronized (getCore()) {
            unreadMessagesCount = getUnreadMessagesCount(this.nativePtr);
        }
        return unreadMessagesCount;
    }

    public boolean isRemoteComposing() {
        boolean isRemoteComposing;
        synchronized (getCore()) {
            isRemoteComposing = isRemoteComposing(this.nativePtr);
        }
        return isRemoteComposing;
    }

    public boolean islimeAvailable() {
        return islimeAvailable(this.nativePtr);
    }

    public void markAsRead() {
        synchronized (getCore()) {
            markAsRead(this.nativePtr);
        }
    }

    public void sendChatMessage(LinphoneChatMessage linphoneChatMessage) {
        sendChatMessage(this.nativePtr, linphoneChatMessage, ((LinphoneChatMessageImpl) linphoneChatMessage).getNativePtr());
    }

    public void sendMessage(String str) {
        synchronized (getCore()) {
            sendMessage(this.nativePtr, str);
        }
    }

    public void sendMessage(LinphoneChatMessage linphoneChatMessage, LinphoneChatMessage.StateListener stateListener) {
        synchronized (getCore()) {
            sendMessage2(this.nativePtr, linphoneChatMessage, ((LinphoneChatMessageImpl) linphoneChatMessage).getNativePtr(), stateListener);
        }
    }
}
