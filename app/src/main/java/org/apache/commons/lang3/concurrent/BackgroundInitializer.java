package org.apache.commons.lang3.concurrent;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public abstract class BackgroundInitializer<T> implements ConcurrentInitializer<T> {
    private ExecutorService executor;
    private ExecutorService externalExecutor;
    private Future<T> future;

    private class InitializationTask implements Callable<T> {
        private final ExecutorService execFinally;

        public InitializationTask(ExecutorService executorService) {
            this.execFinally = executorService;
        }

        public T call() throws Exception {
            try {
                return BackgroundInitializer.this.initialize();
            } finally {
                if (this.execFinally != null) {
                    this.execFinally.shutdown();
                }
            }
        }
    }

    protected BackgroundInitializer() {
        this((ExecutorService) null);
    }

    protected BackgroundInitializer(ExecutorService executorService) {
        setExternalExecutor(executorService);
    }

    private ExecutorService createExecutor() {
        return Executors.newFixedThreadPool(getTaskCount());
    }

    private Callable<T> createTask(ExecutorService executorService) {
        return new InitializationTask(executorService);
    }

    public T get() throws ConcurrentException {
        try {
            return getFuture().get();
        } catch (ExecutionException e) {
            ConcurrentUtils.handleCause(e);
            return null;
        } catch (InterruptedException e2) {
            Thread.currentThread().interrupt();
            throw new ConcurrentException(e2);
        }
    }

    /* access modifiers changed from: protected */
    public final ExecutorService getActiveExecutor() {
        ExecutorService executorService;
        synchronized (this) {
            executorService = this.executor;
        }
        return executorService;
    }

    public final ExecutorService getExternalExecutor() {
        ExecutorService executorService;
        synchronized (this) {
            executorService = this.externalExecutor;
        }
        return executorService;
    }

    public Future<T> getFuture() {
        Future<T> future2;
        synchronized (this) {
            if (this.future == null) {
                throw new IllegalStateException("start() must be called first!");
            }
            future2 = this.future;
        }
        return future2;
    }

    /* access modifiers changed from: protected */
    public int getTaskCount() {
        return 1;
    }

    /* access modifiers changed from: protected */
    public abstract T initialize() throws Exception;

    public boolean isStarted() {
        boolean z;
        synchronized (this) {
            z = this.future != null;
        }
        return z;
    }

    public final void setExternalExecutor(ExecutorService executorService) {
        synchronized (this) {
            if (isStarted()) {
                throw new IllegalStateException("Cannot set ExecutorService after start()!");
            }
            this.externalExecutor = executorService;
        }
    }

    public boolean start() {
        boolean z;
        ExecutorService executorService;
        synchronized (this) {
            if (!isStarted()) {
                this.executor = getExternalExecutor();
                if (this.executor == null) {
                    executorService = createExecutor();
                    this.executor = executorService;
                } else {
                    executorService = null;
                }
                this.future = this.executor.submit(createTask(executorService));
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }
}
