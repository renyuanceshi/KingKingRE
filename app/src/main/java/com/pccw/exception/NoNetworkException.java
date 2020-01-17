package com.pccw.exception;

public class NoNetworkException extends Exception {
    String message;

    public NoNetworkException(String str) {
        this.message = str;
    }

    public String getMessage() {
        return this.message;
    }
}
