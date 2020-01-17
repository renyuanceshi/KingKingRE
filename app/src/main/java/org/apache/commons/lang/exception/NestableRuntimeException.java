package org.apache.commons.lang.exception;

import java.io.PrintStream;
import java.io.PrintWriter;

public class NestableRuntimeException extends RuntimeException implements Nestable {
    private static final long serialVersionUID = 1;
    private Throwable cause = null;
    protected NestableDelegate delegate = new NestableDelegate(this);

    public NestableRuntimeException() {
    }

    public NestableRuntimeException(String str) {
        super(str);
    }

    public NestableRuntimeException(String str, Throwable th) {
        super(str);
        this.cause = th;
    }

    public NestableRuntimeException(Throwable th) {
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
