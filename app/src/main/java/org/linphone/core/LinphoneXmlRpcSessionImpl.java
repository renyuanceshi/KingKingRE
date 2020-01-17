package org.linphone.core;

public class LinphoneXmlRpcSessionImpl implements LinphoneXmlRpcSession {
    protected long nativePtr;

    public LinphoneXmlRpcSessionImpl(LinphoneCore linphoneCore, String str) {
        this.nativePtr = newLinphoneXmlRpcSession(((LinphoneCoreImpl) linphoneCore).nativePtr, str);
    }

    private native long newLinphoneXmlRpcSession(long j, String str);

    private native void sendRequest(long j, long j2);

    private native void unref(long j);

    /* access modifiers changed from: protected */
    public void finalize() {
        unref(this.nativePtr);
    }

    public long getNativePtr() {
        return this.nativePtr;
    }

    public void sendRequest(LinphoneXmlRpcRequest linphoneXmlRpcRequest) {
        sendRequest(this.nativePtr, ((LinphoneXmlRpcRequestImpl) linphoneXmlRpcRequest).getNativePtr());
    }
}
