package org.linphone.core;

import org.linphone.core.LinphoneAccountCreator;

public class LinphoneAccountCreatorImpl implements LinphoneAccountCreator {
    protected long nativePtr;

    protected LinphoneAccountCreatorImpl(long j) {
        this.nativePtr = j;
    }

    public LinphoneAccountCreatorImpl(LinphoneCore linphoneCore, String str) {
        this.nativePtr = newLinphoneAccountCreator(((LinphoneCoreImpl) linphoneCore).nativePtr, str);
    }

    private native int activateAccount(long j);

    private native int activatePhoneNumberLink(long j);

    private native LinphoneProxyConfig configure(long j);

    private native int createAccount(long j);

    private native String getDisplayName(long j);

    private native String getDomain(long j);

    private native String getEmail(long j);

    private native String getHa1(long j);

    private native String getPassword(long j);

    private native String getPhoneNumber(long j);

    private native String getPrefix(long j, String str);

    private native String getUsername(long j);

    private native int isAccountActivated(long j);

    private native int isAccountLinked(long j);

    private native int isAccountUsed(long j);

    private native int isPhoneNumberUsed(long j);

    private native int linkPhoneNumberWithAccount(long j);

    private native long newLinphoneAccountCreator(long j, String str);

    private native int recoverPhoneAccount(long j);

    private native int setActivationCode(long j, String str);

    private native int setDisplayName(long j, String str);

    private native int setDomain(long j, String str);

    private native int setEmail(long j, String str);

    private native int setHa1(long j, String str);

    private native int setLanguage(long j, String str);

    private native void setListener(long j, LinphoneAccountCreator.LinphoneAccountCreatorListener linphoneAccountCreatorListener);

    private native int setPassword(long j, String str);

    private native int setPhoneNumber(long j, String str, String str2);

    private native int setUsername(long j, String str);

    private native void unref(long j);

    private native int updatePassword(long j, String str);

    public LinphoneAccountCreator.RequestStatus activateAccount() {
        return LinphoneAccountCreator.RequestStatus.fromInt(activateAccount(this.nativePtr));
    }

    public LinphoneAccountCreator.RequestStatus activatePhoneNumberLink() {
        return LinphoneAccountCreator.RequestStatus.fromInt(activatePhoneNumberLink(this.nativePtr));
    }

    public LinphoneProxyConfig configure() {
        return configure(this.nativePtr);
    }

    public LinphoneAccountCreator.RequestStatus createAccount() {
        return LinphoneAccountCreator.RequestStatus.fromInt(createAccount(this.nativePtr));
    }

    /* access modifiers changed from: protected */
    public void finalize() {
        if (this.nativePtr != 0) {
            unref(this.nativePtr);
        }
    }

    public String getDisplayName() {
        return getDisplayName(this.nativePtr);
    }

    public String getDomain() {
        return getDomain(this.nativePtr);
    }

    public String getEmail() {
        return getEmail(this.nativePtr);
    }

    public String getHa1() {
        return getHa1(this.nativePtr);
    }

    public long getNativePtr() {
        return this.nativePtr;
    }

    public String getPassword() {
        return getPassword(this.nativePtr);
    }

    public String getPhoneNumber() {
        return getPhoneNumber(this.nativePtr);
    }

    public String getPrefix(String str) {
        return getPrefix(this.nativePtr, str);
    }

    public String getUsername() {
        return getUsername(this.nativePtr);
    }

    public LinphoneAccountCreator.RequestStatus isAccountActivated() {
        return LinphoneAccountCreator.RequestStatus.fromInt(isAccountActivated(this.nativePtr));
    }

    public LinphoneAccountCreator.RequestStatus isAccountLinked() {
        return LinphoneAccountCreator.RequestStatus.fromInt(isAccountLinked(this.nativePtr));
    }

    public LinphoneAccountCreator.RequestStatus isAccountUsed() {
        return LinphoneAccountCreator.RequestStatus.fromInt(isAccountUsed(this.nativePtr));
    }

    public LinphoneAccountCreator.RequestStatus isPhoneNumberUsed() {
        return LinphoneAccountCreator.RequestStatus.fromInt(isPhoneNumberUsed(this.nativePtr));
    }

    public LinphoneAccountCreator.RequestStatus linkPhoneNumberWithAccount() {
        return LinphoneAccountCreator.RequestStatus.fromInt(linkPhoneNumberWithAccount(this.nativePtr));
    }

    public LinphoneAccountCreator.RequestStatus recoverPhoneAccount() {
        return LinphoneAccountCreator.RequestStatus.fromInt(recoverPhoneAccount(this.nativePtr));
    }

    public LinphoneAccountCreator.ActivationCodeCheck setActivationCode(String str) {
        return LinphoneAccountCreator.ActivationCodeCheck.fromInt(setActivationCode(this.nativePtr, str));
    }

    public LinphoneAccountCreator.UsernameCheck setDisplayName(String str) {
        return LinphoneAccountCreator.UsernameCheck.fromInt(setDisplayName(this.nativePtr, str));
    }

    public LinphoneAccountCreator.DomainCheck setDomain(String str) {
        return LinphoneAccountCreator.DomainCheck.fromInt(setDomain(this.nativePtr, str));
    }

    public LinphoneAccountCreator.EmailCheck setEmail(String str) {
        return LinphoneAccountCreator.EmailCheck.fromInt(setEmail(this.nativePtr, str));
    }

    public LinphoneAccountCreator.PasswordCheck setHa1(String str) {
        return LinphoneAccountCreator.PasswordCheck.fromInt(setHa1(this.nativePtr, str));
    }

    public LinphoneAccountCreator.LanguageCheck setLanguage(String str) {
        return LinphoneAccountCreator.LanguageCheck.fromInt(setLanguage(this.nativePtr, str));
    }

    public void setListener(LinphoneAccountCreator.LinphoneAccountCreatorListener linphoneAccountCreatorListener) {
        setListener(this.nativePtr, linphoneAccountCreatorListener);
    }

    public LinphoneAccountCreator.PasswordCheck setPassword(String str) {
        return LinphoneAccountCreator.PasswordCheck.fromInt(setPassword(this.nativePtr, str));
    }

    public int setPhoneNumber(String str, String str2) {
        return setPhoneNumber(this.nativePtr, str, str2);
    }

    public LinphoneAccountCreator.UsernameCheck setUsername(String str) {
        return LinphoneAccountCreator.UsernameCheck.fromInt(setUsername(this.nativePtr, str));
    }

    public LinphoneAccountCreator.RequestStatus updatePassword(String str) {
        return LinphoneAccountCreator.RequestStatus.fromInt(updatePassword(this.nativePtr, str));
    }
}
