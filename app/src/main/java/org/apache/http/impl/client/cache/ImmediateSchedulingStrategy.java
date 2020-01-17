package org.apache.http.impl.client.cache;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.apache.http.annotation.ThreadSafe;

@ThreadSafe
public class ImmediateSchedulingStrategy implements SchedulingStrategy {
    private final ExecutorService executor;

    ImmediateSchedulingStrategy(ExecutorService executorService) {
        this.executor = executorService;
    }

    public ImmediateSchedulingStrategy(CacheConfig cacheConfig) {
        this((ExecutorService) new ThreadPoolExecutor(cacheConfig.getAsynchronousWorkersCore(), cacheConfig.getAsynchronousWorkersMax(), (long) cacheConfig.getAsynchronousWorkerIdleLifetimeSecs(), TimeUnit.SECONDS, new ArrayBlockingQueue(cacheConfig.getRevalidationQueueSize())));
    }

    /* access modifiers changed from: package-private */
    public void awaitTermination(long j, TimeUnit timeUnit) throws InterruptedException {
        this.executor.awaitTermination(j, timeUnit);
    }

    public void close() {
        this.executor.shutdown();
    }

    public void schedule(AsynchronousValidationRequest asynchronousValidationRequest) {
        if (asynchronousValidationRequest == null) {
            throw new IllegalArgumentException("AsynchronousValidationRequest may not be null");
        }
        this.executor.execute(asynchronousValidationRequest);
    }
}
