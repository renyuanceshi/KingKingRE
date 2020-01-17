package org.apache.http.pool;

import java.io.IOException;
import java.util.Date;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.util.Args;

@ThreadSafe
abstract class PoolEntryFuture<T> implements Future<T> {
    private final FutureCallback<T> callback;
    private volatile boolean cancelled;
    private volatile boolean completed;
    private final Condition condition;
    private final Lock lock;
    private T result;

    PoolEntryFuture(Lock lock2, FutureCallback<T> futureCallback) {
        this.lock = lock2;
        this.condition = lock2.newCondition();
        this.callback = futureCallback;
    }

    public boolean await(Date date) throws InterruptedException {
        boolean z;
        this.lock.lock();
        try {
            if (this.cancelled) {
                throw new InterruptedException("Operation interrupted");
            }
            if (date != null) {
                z = this.condition.awaitUntil(date);
            } else {
                this.condition.await();
                z = true;
            }
            if (!this.cancelled) {
                return z;
            }
            throw new InterruptedException("Operation interrupted");
        } finally {
            this.lock.unlock();
        }
    }

    public boolean cancel(boolean z) {
        this.lock.lock();
        try {
            if (this.completed) {
                return false;
            }
            this.completed = true;
            this.cancelled = true;
            if (this.callback != null) {
                this.callback.cancelled();
            }
            this.condition.signalAll();
            this.lock.unlock();
            return true;
        } finally {
            this.lock.unlock();
        }
    }

    public T get() throws InterruptedException, ExecutionException {
        try {
            return get(0, TimeUnit.MILLISECONDS);
        } catch (TimeoutException e) {
            throw new ExecutionException(e);
        }
    }

    public T get(long j, TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        T t;
        Args.notNull(timeUnit, "Time unit");
        this.lock.lock();
        try {
            if (this.completed) {
                t = this.result;
                this.lock.unlock();
            } else {
                this.result = getPoolEntry(j, timeUnit);
                this.completed = true;
                if (this.callback != null) {
                    this.callback.completed(this.result);
                }
                t = this.result;
                this.lock.unlock();
            }
            return t;
        } catch (IOException e) {
            this.completed = true;
            this.result = null;
            if (this.callback != null) {
                this.callback.failed(e);
            }
            throw new ExecutionException(e);
        } catch (Throwable th) {
            this.lock.unlock();
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public abstract T getPoolEntry(long j, TimeUnit timeUnit) throws IOException, InterruptedException, TimeoutException;

    public boolean isCancelled() {
        return this.cancelled;
    }

    public boolean isDone() {
        return this.completed;
    }

    public void wakeup() {
        this.lock.lock();
        try {
            this.condition.signalAll();
        } finally {
            this.lock.unlock();
        }
    }
}
