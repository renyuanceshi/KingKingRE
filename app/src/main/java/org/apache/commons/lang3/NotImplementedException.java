package org.apache.commons.lang3;

public class NotImplementedException extends UnsupportedOperationException {
    private static final long serialVersionUID = 20131021;
    private String code;

    public NotImplementedException(String str) {
        super(str);
    }

    public NotImplementedException(String str, String str2) {
        super(str);
        this.code = str2;
    }

    public NotImplementedException(String str, Throwable th) {
        super(str, th);
    }

    public NotImplementedException(String str, Throwable th, String str2) {
        super(str, th);
        this.code = str2;
    }

    public NotImplementedException(Throwable th) {
        super(th);
    }

    public NotImplementedException(Throwable th, String str) {
        super(th);
        this.code = str;
    }

    public String getCode() {
        return this.code;
    }
}
