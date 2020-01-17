package org.linphone.core;

import org.linphone.core.LinphoneAddressImpl;
import org.linphone.core.LinphoneCall;

class LinphoneCallImpl implements LinphoneCall {
    LinphoneCore mCore;
    protected final long nativePtr;
    boolean ownPtr = false;
    Object userData;

    private LinphoneCallImpl(long j) {
        this.nativePtr = j;
        this.mCore = getCore(this.nativePtr);
    }

    private native boolean askedToAutoAnswer(long j);

    private native boolean cameraEnabled(long j);

    private native void declineWithErrorInfo(long j, long j2);

    private native void enableCamera(long j, boolean z);

    private native void enableEchoCancellation(long j, boolean z);

    private native void enableEchoLimiter(long j, boolean z);

    private native void finalize(long j);

    private native String getAuthenticationToken(long j);

    private native float getAverageQuality(long j);

    private native long getCallLog(long j);

    private native Object getChatRoom(long j);

    private native LinphoneCore getCore(long j);

    private native long getCurrentParams(long j);

    private native float getCurrentQuality(long j);

    private native long getDiversionAddress(long j);

    private native int getDuration(long j);

    private native long getErrorInfo(long j);

    private native float getPlayVolume(long j);

    private native long getPlayer(long j);

    private native long getRemoteAddress(long j);

    private native String getRemoteContact(long j);

    private native long getRemoteParams(long j);

    private native String getRemoteUserAgent(long j);

    private native Object getReplacedCall(long j);

    private native int getState(long j);

    private native Object getStats(long j, int i);

    private native int getTransferState(long j);

    private native Object getTransferTargetCall(long j);

    private native Object getTransfererCall(long j);

    private native boolean isAuthenticationTokenVerified(long j);

    private native boolean isEchoCancellationEnabled(long j);

    private native boolean isEchoLimiterEnabled(long j);

    private native boolean isIncoming(long j);

    private native boolean mediaInProgress(long j);

    private native int sendInfoMessage(long j, long j2);

    private native void setAuthenticationTokenVerified(long j, boolean z);

    private native void setListener(long j, LinphoneCall.LinphoneCallListener linphoneCallListener);

    private native void setVideoWindowId(long j, Object obj);

    private native void startRecording(long j);

    private native void stopRecording(long j);

    private native void takeSnapshot(long j, String str);

    private native void terminateWithErrorInfo(long j, long j2);

    private native void zoomVideo(long j, float f, float f2, float f3);

    public boolean askedToAutoAnswer() {
        return askedToAutoAnswer(this.nativePtr);
    }

    public boolean cameraEnabled() {
        return cameraEnabled(this.nativePtr);
    }

    public void declineWithErrorInfo(ErrorInfo errorInfo) {
        synchronized (this.mCore) {
            declineWithErrorInfo(this.nativePtr, ((ErrorInfoImpl) errorInfo).mNativePtr);
        }
    }

    public void enableCamera(boolean z) {
        synchronized (this.mCore) {
            enableCamera(this.nativePtr, z);
        }
    }

    public void enableEchoCancellation(boolean z) {
        enableEchoCancellation(this.nativePtr, z);
    }

    public void enableEchoLimiter(boolean z) {
        enableEchoLimiter(this.nativePtr, z);
    }

    public boolean equals(Object obj) {
        return this == obj || (obj != null && (obj instanceof LinphoneCallImpl) && this.nativePtr == ((LinphoneCallImpl) obj).nativePtr);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        finalize(this.nativePtr);
    }

    public LinphoneCallStats getAudioStats() {
        LinphoneCallStats linphoneCallStats;
        synchronized (this.mCore) {
            linphoneCallStats = (LinphoneCallStats) getStats(this.nativePtr, 0);
        }
        return linphoneCallStats;
    }

    public String getAuthenticationToken() {
        return getAuthenticationToken(this.nativePtr);
    }

    public float getAverageQuality() {
        return getAverageQuality(this.nativePtr);
    }

    public LinphoneCallLog getCallLog() {
        long callLog = getCallLog(this.nativePtr);
        if (callLog != 0) {
            return new LinphoneCallLogImpl(callLog);
        }
        return null;
    }

    public LinphoneChatRoom getChatRoom() {
        LinphoneChatRoom linphoneChatRoom;
        synchronized (this.mCore) {
            linphoneChatRoom = (LinphoneChatRoom) getChatRoom(this.nativePtr);
        }
        return linphoneChatRoom;
    }

    public LinphoneConference getConference() {
        return getConference(this.nativePtr);
    }

    public native LinphoneConference getConference(long j);

    public LinphoneCallParams getCurrentParams() {
        LinphoneCallParamsImpl linphoneCallParamsImpl;
        synchronized (this.mCore) {
            linphoneCallParamsImpl = new LinphoneCallParamsImpl(getCurrentParams(this.nativePtr));
        }
        return linphoneCallParamsImpl;
    }

    public LinphoneCallParams getCurrentParamsCopy() {
        return getCurrentParams();
    }

    public float getCurrentQuality() {
        return getCurrentQuality(this.nativePtr);
    }

    public CallDirection getDirection() {
        return isIncoming(this.nativePtr) ? CallDirection.Incoming : CallDirection.Outgoing;
    }

    public LinphoneAddress getDiversionAddress() {
        long diversionAddress = getDiversionAddress(this.nativePtr);
        if (diversionAddress != 0) {
            return new LinphoneAddressImpl(diversionAddress, LinphoneAddressImpl.WrapMode.FromConst);
        }
        return null;
    }

    public int getDuration() {
        return getDuration(this.nativePtr);
    }

    public ErrorInfo getErrorInfo() {
        ErrorInfoImpl errorInfoImpl;
        synchronized (this.mCore) {
            errorInfoImpl = new ErrorInfoImpl(getErrorInfo(this.nativePtr));
        }
        return errorInfoImpl;
    }

    public float getPlayVolume() {
        return getPlayVolume(this.nativePtr);
    }

    public LinphonePlayer getPlayer() {
        LinphonePlayerImpl linphonePlayerImpl;
        synchronized (this.mCore) {
            linphonePlayerImpl = new LinphonePlayerImpl(getPlayer(this.nativePtr));
        }
        return linphonePlayerImpl;
    }

    public Reason getReason() {
        return null;
    }

    public LinphoneAddress getRemoteAddress() {
        long remoteAddress = getRemoteAddress(this.nativePtr);
        if (remoteAddress != 0) {
            return new LinphoneAddressImpl(remoteAddress, LinphoneAddressImpl.WrapMode.FromConst);
        }
        return null;
    }

    public String getRemoteContact() {
        return getRemoteContact(this.nativePtr);
    }

    public LinphoneCallParams getRemoteParams() {
        LinphoneCallParamsImpl linphoneCallParamsImpl;
        synchronized (this.mCore) {
            long remoteParams = getRemoteParams(this.nativePtr);
            linphoneCallParamsImpl = remoteParams == 0 ? null : new LinphoneCallParamsImpl(remoteParams);
        }
        return linphoneCallParamsImpl;
    }

    public String getRemoteUserAgent() {
        return getRemoteUserAgent(this.nativePtr);
    }

    public LinphoneCall getReplacedCall() {
        return (LinphoneCall) getReplacedCall(this.nativePtr);
    }

    public LinphoneCall.State getState() {
        return LinphoneCall.State.fromInt(getState(this.nativePtr));
    }

    public LinphoneCall.State getTransferState() {
        return LinphoneCall.State.fromInt(getTransferState(this.nativePtr));
    }

    public LinphoneCall getTransferTargetCall() {
        return (LinphoneCall) getTransferTargetCall(this.nativePtr);
    }

    public LinphoneCall getTransfererCall() {
        return (LinphoneCall) getTransfererCall(this.nativePtr);
    }

    public Object getUserData() {
        return this.userData;
    }

    public LinphoneCallStats getVideoStats() {
        LinphoneCallStats linphoneCallStats;
        synchronized (this.mCore) {
            linphoneCallStats = (LinphoneCallStats) getStats(this.nativePtr, 1);
        }
        return linphoneCallStats;
    }

    public int hashCode() {
        return ((int) (this.nativePtr ^ (this.nativePtr >>> 32))) + 527;
    }

    public boolean isAuthenticationTokenVerified() {
        return isAuthenticationTokenVerified(this.nativePtr);
    }

    public boolean isEchoCancellationEnabled() {
        return isEchoCancellationEnabled(this.nativePtr);
    }

    public boolean isEchoLimiterEnabled() {
        return isEchoLimiterEnabled(this.nativePtr);
    }

    public boolean isInConference() {
        return getConference() != null;
    }

    public boolean mediaInProgress() {
        return mediaInProgress(this.nativePtr);
    }

    public void sendInfoMessage(LinphoneInfoMessage linphoneInfoMessage) {
        synchronized (this.mCore) {
            sendInfoMessage(this.nativePtr, ((LinphoneInfoMessageImpl) linphoneInfoMessage).nativePtr);
        }
    }

    public void setAuthenticationTokenVerified(boolean z) {
        setAuthenticationTokenVerified(this.nativePtr, z);
    }

    public void setListener(LinphoneCall.LinphoneCallListener linphoneCallListener) {
        synchronized (this.mCore) {
            setListener(this.nativePtr, linphoneCallListener);
        }
    }

    public void setUserData(Object obj) {
        this.userData = obj;
    }

    public void setVideoWindow(Object obj) {
        synchronized (this) {
            setVideoWindowId(this.nativePtr, obj);
        }
    }

    public void startRecording() {
        synchronized (this.mCore) {
            startRecording(this.nativePtr);
        }
    }

    public void stopRecording() {
        synchronized (this.mCore) {
            stopRecording(this.nativePtr);
        }
    }

    public void takeSnapshot(String str) {
        synchronized (this.mCore) {
            takeSnapshot(this.nativePtr, str);
        }
    }

    public void terminateWithErrorInfo(ErrorInfo errorInfo) {
        synchronized (this.mCore) {
            terminateWithErrorInfo(this.nativePtr, ((ErrorInfoImpl) errorInfo).mNativePtr);
        }
    }

    public String toString() {
        return "Call " + this.nativePtr;
    }

    public void zoomVideo(float f, float f2, float f3) {
        zoomVideo(this.nativePtr, f, f2, f3);
    }
}
