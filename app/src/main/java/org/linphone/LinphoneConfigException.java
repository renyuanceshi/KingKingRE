package org.linphone;

public class LinphoneConfigException extends LinphoneException {
    public LinphoneConfigException() {
    }

    public LinphoneConfigException(String str) {
        super(str);
    }

    public LinphoneConfigException(String str, Throwable th) {
        super(str, th);
    }

    public LinphoneConfigException(Throwable th) {
        super(th);
    }
}
