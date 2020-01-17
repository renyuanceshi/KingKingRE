package org.apache.commons.lang;

import java.io.PrintStream;
import java.io.PrintWriter;
import org.apache.commons.lang.exception.Nestable;
import org.apache.commons.lang.exception.NestableDelegate;

public class NotImplementedException extends UnsupportedOperationException implements Nestable {
    private static final String DEFAULT_MESSAGE = "Code is not implemented";
    private static final long serialVersionUID = -6894122266938754088L;
    private Throwable cause;
    private NestableDelegate delegate;

    public NotImplementedException() {
        super(DEFAULT_MESSAGE);
        this.delegate = new NestableDelegate(this);
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public NotImplementedException(Class cls) {
        super(cls == null ? DEFAULT_MESSAGE : new StringBuffer().append("Code is not implemented in ").append(cls).toString());
        this.delegate = new NestableDelegate(this);
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public NotImplementedException(String str) {
        super(str == null ? DEFAULT_MESSAGE : str);
        this.delegate = new NestableDelegate(this);
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public NotImplementedException(String str, Throwable th) {
        super(str == null ? DEFAULT_MESSAGE : str);
        this.delegate = new NestableDelegate(this);
        this.cause = th;
    }

    public NotImplementedException(Throwable th) {
        super(DEFAULT_MESSAGE);
        this.delegate = new NestableDelegate(this);
        this.cause = th;
    }

    public Throwable getCause() {
        return this.cause;
    }

    public String getMessage() {
        if (super.getMessage() != null) {
            return super.getMessage();
        }
        if (this.cause != null) {
            return this.cause.toString();
        }
        return null;
    }

    public String getMessage(int i) {
        return i == 0 ? super.getMessage() : this.delegate.getMessage(i);
    }

    public String[] getMessages() {
        return this.delegate.getMessages();
    }

    public Throwable getThrowable(int i) {
        return this.delegate.getThrowable(i);
    }

    public int getThrowableCount() {
        return this.delegate.getThrowableCount();
    }

    public Throwable[] getThrowables() {
        return this.delegate.getThrowables();
    }

    public int indexOfThrowable(Class cls) {
        return this.delegate.indexOfThrowable(cls, 0);
    }

    public int indexOfThrowable(Class cls, int i) {
        return this.delegate.indexOfThrowable(cls, i);
    }

    public final void printPartialStackTrace(PrintWriter printWriter) {
        super.printStackTrace(printWriter);
    }

    public void printStackTrace() {
        this.delegate.printStackTrace();
    }

    public void printStackTrace(PrintStream printStream) {
        this.delegate.printStackTrace(printStream);
    }

    public void printStackTrace(PrintWriter printWriter) {
        this.delegate.printStackTrace(printWriter);
    }
}
