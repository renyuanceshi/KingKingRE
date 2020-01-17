package org.linphone.core;

import org.linphone.core.LinphoneAddressImpl;
import org.linphone.core.LinphoneCore;

class LinphoneProxyConfigImpl implements LinphoneProxyConfig {
    protected LinphoneCoreImpl mCore;
    protected final long nativePtr;
    Object userData;

    protected LinphoneProxyConfigImpl(LinphoneCoreImpl linphoneCoreImpl) {
        this.mCore = linphoneCoreImpl;
        this.nativePtr = createProxyConfig(linphoneCoreImpl.nativePtr);
    }

    protected LinphoneProxyConfigImpl(LinphoneCoreImpl linphoneCoreImpl, long j) {
        this.mCore = linphoneCoreImpl;
        this.nativePtr = j;
    }

    protected LinphoneProxyConfigImpl(LinphoneCoreImpl linphoneCoreImpl, String str, String str2, String str3, boolean z) throws LinphoneCoreException {
        this.mCore = linphoneCoreImpl;
        this.nativePtr = createProxyConfig(linphoneCoreImpl.nativePtr);
        setIdentity(str);
        setProxy(str2);
        setRoute(str3);
        enableRegister(z);
    }

    private native boolean avpfEnabled(long j);

    private native long createProxyConfig(long j);

    private native void done(long j);

    private native void edit(long j);

    private native void enableAvpf(long j, boolean z);

    private native void enablePublish(long j, boolean z);

    private native void enableQualityReporting(long j, boolean z);

    private native void enableRegister(long j, boolean z);

    private native void finalize(long j);

    private native long getAddress(long j);

    private native int getAvpfRRInterval(long j);

    private native String getContactParameters(long j);

    private native String getContactUriParameters(long j);

    private native String getCustomHeader(long j, String str);

    private native boolean getDialEscapePlus(long j);

    private native String getDialPrefix(long j);

    private native String getDomain(long j);

    private native int getError(long j);

    private native long getErrorInfo(long j);

    private native int getExpires(long j);

    private native String getIdentity(long j);

    private native Object getNatPolicy(long j);

    private native int getPrivacy(long j);

    private native String getProxy(long j);

    private native int getPublishExpires(long j);

    private native String getQualityReportingCollector(long j);

    private native int getQualityReportingInterval(long j);

    private native String getRealm(long j);

    private native String getRoute(long j);

    private native int getState(long j);

    private native boolean isPhoneNumber(long j, String str);

    private native boolean isRegisterEnabled(long j);

    private native boolean isRegistered(long j);

    private void isValid() {
        if (this.nativePtr == 0) {
            throw new RuntimeException("proxy config removed");
        }
    }

    private native int lookupCCCFromE164(long j, String str);

    private native int lookupCCCFromIso(long j, String str);

    private native long newLinphoneProxyConfig();

    private native String normalizePhoneNumber(long j, String str);

    private native long normalizeSipUri(long j, String str);

    private native void pauseRegister(long j);

    private native boolean publishEnabled(long j);

    private native boolean qualityReportingEnabled(long j);

    private native void refreshRegister(long j);

    private native void setAddress(long j, long j2);

    private native void setAvpfRRInterval(long j, int i);

    private native void setContactParameters(long j, String str);

    private native void setContactUriParameters(long j, String str);

    private native void setCustomHeader(long j, String str, String str2);

    private native void setDialEscapePlus(long j, boolean z);

    private native void setDialPrefix(long j, String str);

    private native void setExpires(long j, int i);

    private native void setIdentity(long j, String str);

    private native void setNatPolicy(long j, long j2);

    private native void setPrivacy(long j, int i);

    private native int setProxy(long j, String str);

    private native void setPublishExpires(long j, int i);

    private native void setQualityReportingCollector(long j, String str);

    private native void setQualityReportingInterval(long j, int i);

    private native void setRealm(long j, String str);

    private native int setRoute(long j, String str);

    public boolean avpfEnabled() {
        isValid();
        return avpfEnabled(this.nativePtr);
    }

    public void done() {
        isValid();
        synchronized ((this.mCore != null ? this.mCore : this)) {
            done(this.nativePtr);
        }
    }

    public LinphoneProxyConfig edit() {
        isValid();
        synchronized ((this.mCore != null ? this.mCore : this)) {
            edit(this.nativePtr);
        }
        return this;
    }

    public void enableAvpf(boolean z) {
        isValid();
        enableAvpf(this.nativePtr, z);
    }

    public void enablePublish(boolean z) {
        isValid();
        enablePublish(this.nativePtr, z);
    }

    public void enableQualityReporting(boolean z) {
        isValid();
        enableQualityReporting(this.nativePtr, z);
    }

    public LinphoneProxyConfig enableRegister(boolean z) {
        isValid();
        enableRegister(this.nativePtr, z);
        return this;
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        if (this.nativePtr != 0) {
            finalize(this.nativePtr);
        }
        super.finalize();
    }

    public LinphoneAddress getAddress() {
        isValid();
        long address = getAddress(this.nativePtr);
        if (address == 0) {
            return null;
        }
        return new LinphoneAddressImpl(address, LinphoneAddressImpl.WrapMode.FromConst);
    }

    public int getAvpfRRInterval() {
        isValid();
        return getAvpfRRInterval(this.nativePtr);
    }

    public String getContactParameters() {
        isValid();
        return getContactParameters(this.nativePtr);
    }

    public String getContactUriParameters() {
        isValid();
        return getContactUriParameters(this.nativePtr);
    }

    public String getCustomHeader(String str) {
        return getCustomHeader(this.nativePtr, str);
    }

    public boolean getDialEscapePlus() {
        isValid();
        return getDialEscapePlus(this.nativePtr);
    }

    public String getDialPrefix() {
        isValid();
        return getDialPrefix(this.nativePtr);
    }

    public String getDomain() {
        isValid();
        return getDomain(this.nativePtr);
    }

    public Reason getError() {
        isValid();
        return Reason.fromInt(getError(this.nativePtr));
    }

    public ErrorInfo getErrorInfo() {
        return new ErrorInfoImpl(getErrorInfo(this.nativePtr));
    }

    public int getExpires() {
        isValid();
        return getExpires(this.nativePtr);
    }

    public String getIdentity() {
        isValid();
        return getIdentity(this.nativePtr);
    }

    public LinphoneNatPolicy getNatPolicy() {
        isValid();
        return (LinphoneNatPolicy) getNatPolicy(this.nativePtr);
    }

    public int getPrivacy() {
        isValid();
        return getPrivacy(this.nativePtr);
    }

    public String getProxy() {
        isValid();
        return getProxy(this.nativePtr);
    }

    public int getPublishExpires() {
        isValid();
        return getPublishExpires(this.nativePtr);
    }

    public String getQualityReportingCollector() {
        isValid();
        return getQualityReportingCollector(this.nativePtr);
    }

    public int getQualityReportingInterval() {
        isValid();
        return getQualityReportingInterval(this.nativePtr);
    }

    public String getRealm() {
        isValid();
        return getRealm(this.nativePtr);
    }

    public String getRoute() {
        isValid();
        return getRoute(this.nativePtr);
    }

    public LinphoneCore.RegistrationState getState() {
        isValid();
        return LinphoneCore.RegistrationState.fromInt(getState(this.nativePtr));
    }

    public Object getUserData() {
        return this.userData;
    }

    public boolean isPhoneNumber(String str) {
        return isPhoneNumber(this.nativePtr, str);
    }

    public boolean isRegistered() {
        isValid();
        return isRegistered(this.nativePtr);
    }

    public int lookupCCCFromE164(String str) {
        isValid();
        return lookupCCCFromE164(this.nativePtr, str);
    }

    public int lookupCCCFromIso(String str) {
        isValid();
        return lookupCCCFromIso(this.nativePtr, str);
    }

    public String normalizePhoneNumber(String str) {
        isValid();
        return normalizePhoneNumber(this.nativePtr, str);
    }

    public LinphoneAddress normalizeSipUri(String str) {
        isValid();
        long normalizeSipUri = normalizeSipUri(this.nativePtr, str);
        if (normalizeSipUri == 0) {
            return null;
        }
        return new LinphoneAddressImpl(normalizeSipUri, LinphoneAddressImpl.WrapMode.FromConst);
    }

    public void pauseRegister() {
        pauseRegister(this.nativePtr);
    }

    public boolean publishEnabled() {
        isValid();
        return publishEnabled(this.nativePtr);
    }

    public boolean qualityReportingEnabled() {
        isValid();
        return avpfEnabled(this.nativePtr);
    }

    public void refreshRegister() {
        refreshRegister(this.nativePtr);
    }

    public boolean registerEnabled() {
        isValid();
        return isRegisterEnabled(this.nativePtr);
    }

    public void setAddress(LinphoneAddress linphoneAddress) throws LinphoneCoreException {
        isValid();
        setAddress(this.nativePtr, ((LinphoneAddressImpl) linphoneAddress).nativePtr);
    }

    public void setAvpfRRInterval(int i) {
        isValid();
        setAvpfRRInterval(this.nativePtr, i);
    }

    public void setContactParameters(String str) {
        isValid();
        setContactParameters(this.nativePtr, str);
    }

    public void setContactUriParameters(String str) {
        isValid();
        setContactUriParameters(this.nativePtr, str);
    }

    public void setCustomHeader(String str, String str2) {
        setCustomHeader(this.nativePtr, str, str2);
    }

    public void setDialEscapePlus(boolean z) {
        isValid();
        setDialEscapePlus(this.nativePtr, z);
    }

    public void setDialPrefix(String str) {
        isValid();
        setDialPrefix(this.nativePtr, str);
    }

    public void setExpires(int i) {
        isValid();
        setExpires(this.nativePtr, i);
    }

    public void setIdentity(String str) throws LinphoneCoreException {
        isValid();
        setIdentity(this.nativePtr, str);
    }

    public void setNatPolicy(LinphoneNatPolicy linphoneNatPolicy) {
        isValid();
        setNatPolicy(this.nativePtr, ((LinphoneNatPolicyImpl) linphoneNatPolicy).mNativePtr);
    }

    public void setPrivacy(int i) {
        isValid();
        setPrivacy(this.nativePtr, i);
    }

    public void setProxy(String str) throws LinphoneCoreException {
        isValid();
        if (setProxy(this.nativePtr, str) != 0) {
            throw new LinphoneCoreException("Bad proxy address [" + str + "]");
        }
    }

    public void setPublishExpires(int i) {
        isValid();
        setPublishExpires(this.nativePtr, i);
    }

    public void setQualityReportingCollector(String str) {
        isValid();
        setQualityReportingCollector(this.nativePtr, str);
    }

    public void setQualityReportingInterval(int i) {
        isValid();
        setQualityReportingInterval(this.nativePtr, i);
    }

    public void setRealm(String str) {
        isValid();
        setRealm(this.nativePtr, str);
    }

    public void setRoute(String str) throws LinphoneCoreException {
        isValid();
        if (setRoute(this.nativePtr, str) != 0) {
            throw new LinphoneCoreException("cannot set route [" + str + "]");
        }
    }

    public void setUserData(Object obj) {
        this.userData = obj;
    }
}
