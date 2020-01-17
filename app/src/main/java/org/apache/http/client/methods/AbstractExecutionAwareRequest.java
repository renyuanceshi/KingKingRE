package org.apache.http.client.methods;

import java.io.IOException;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.http.HttpRequest;
import org.apache.http.client.utils.CloneUtils;
import org.apache.http.concurrent.Cancellable;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ConnectionReleaseTrigger;
import org.apache.http.message.AbstractHttpMessage;
import org.apache.http.message.HeaderGroup;
import org.apache.http.params.HttpParams;

public abstract class AbstractExecutionAwareRequest extends AbstractHttpMessage implements HttpExecutionAware, AbortableHttpRequest, Cloneable, HttpRequest {
    private Lock abortLock = new ReentrantLock();
    private volatile boolean aborted;
    private volatile Cancellable cancellable;

    protected AbstractExecutionAwareRequest() {
    }

    private void cancelExecution() {
        if (this.cancellable != null) {
            this.cancellable.cancel();
            this.cancellable = null;
        }
    }

    public void abort() {
        if (!this.aborted) {
            this.abortLock.lock();
            try {
                this.aborted = true;
                cancelExecution();
            } finally {
                this.abortLock.unlock();
            }
        }
    }

    public Object clone() throws CloneNotSupportedException {
        AbstractExecutionAwareRequest abstractExecutionAwareRequest = (AbstractExecutionAwareRequest) super.clone();
        abstractExecutionAwareRequest.headergroup = (HeaderGroup) CloneUtils.cloneObject(this.headergroup);
        abstractExecutionAwareRequest.params = (HttpParams) CloneUtils.cloneObject(this.params);
        abstractExecutionAwareRequest.abortLock = new ReentrantLock();
        abstractExecutionAwareRequest.cancellable = null;
        abstractExecutionAwareRequest.aborted = false;
        return abstractExecutionAwareRequest;
    }

    public void completed() {
        this.abortLock.lock();
        try {
            this.cancellable = null;
        } finally {
            this.abortLock.unlock();
        }
    }

    public boolean isAborted() {
        return this.aborted;
    }

    public void reset() {
        this.abortLock.lock();
        try {
            cancelExecution();
            this.aborted = false;
        } finally {
            this.abortLock.unlock();
        }
    }

    public void setCancellable(Cancellable cancellable2) {
        if (!this.aborted) {
            this.abortLock.lock();
            try {
                this.cancellable = cancellable2;
            } finally {
                this.abortLock.unlock();
            }
        }
    }

    @Deprecated
    public void setConnectionRequest(final ClientConnectionRequest clientConnectionRequest) {
        if (!this.aborted) {
            this.abortLock.lock();
            try {
                this.cancellable = new Cancellable() {
                    public boolean cancel() {
                        clientConnectionRequest.abortRequest();
                        return true;
                    }
                };
            } finally {
                this.abortLock.unlock();
            }
        }
    }

    @Deprecated
    public void setReleaseTrigger(final ConnectionReleaseTrigger connectionReleaseTrigger) {
        if (!this.aborted) {
            this.abortLock.lock();
            try {
                this.cancellable = new Cancellable() {
                    public boolean cancel() {
                        try {
                            connectionReleaseTrigger.abortConnection();
                            return true;
                        } catch (IOException e) {
                            return false;
                        }
                    }
                };
            } finally {
                this.abortLock.unlock();
            }
        }
    }
}
