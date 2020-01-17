package com.pccw.mobile.sip.util;

public class NetworkException extends RuntimeException {
    public NetworkException() {
    }

    public NetworkException(String str) {
        super(str);
    }

    public NetworkException(String str, Throwable th) {
        super(str, th);
    }

    public NetworkException(Throwable th) {
        super(th);
    }
}
