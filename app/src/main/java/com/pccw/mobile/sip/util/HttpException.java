package com.pccw.mobile.sip.util;

public class HttpException extends RuntimeException {
    public int httpStatusCode;

    public HttpException(int i) {
        this.httpStatusCode = i;
    }

    public HttpException(int i, String str) {
        super(str);
        this.httpStatusCode = i;
    }

    public HttpException(int i, String str, Throwable th) {
        super(str, th);
        this.httpStatusCode = i;
    }

    public HttpException(int i, Throwable th) {
        super(th);
        this.httpStatusCode = i;
    }

    public String toString() {
        return super.toString() + ": " + this.httpStatusCode;
    }
}
