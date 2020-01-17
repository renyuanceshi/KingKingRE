package org.apache.commons.lang3.concurrent;

import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class TimedSemaphore {
    public static final int NO_LIMIT = 0;
    private static final int THREAD_POOL_SIZE = 1;
    private int acquireCount;
    private final ScheduledExecutorService executorService;
    private int lastCallsPerPeriod;
    private int limit;
    private final boolean ownExecutor;
    private final long period;
    private long periodCount;
    private boolean shutdown;
    private ScheduledFuture<?> task;
    private long totalAcquireCount;
    private final TimeUnit unit;

    public TimedSemaphore(long j, TimeUnit timeUnit, int i) {
        this((ScheduledExecutorService) null, j, timeUnit, i);
    }

    public TimedSemaphore(ScheduledExecutorService scheduledExecutorService, long j, TimeUnit timeUnit, int i) {
        if (j <= 0) {
            throw new IllegalArgumentException("Time period must be greater 0!");
        }
        this.period = j;
        this.unit = timeUnit;
        if (scheduledExecutorService != null) {
            this.executorService = scheduledExecutorService;
            this.ownExecutor = false;
        } else {
            ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);
            scheduledThreadPoolExecutor.setContinueExistingPeriodicTasksAfterShutdownPolicy(false);
            scheduledThreadPoolExecutor.setExecuteExistingDelayedTasksAfterShutdownPolicy(false);
            this.executorService = scheduledThreadPoolExecutor;
            this.ownExecutor = true;
        }
        setLimit(i);
    }

    public void acquire() throws InterruptedException {
        boolean z;
        synchronized (this) {
            if (isShutdown()) {
                throw new IllegalStateException("TimedSemaphore is shut down!");
            }
            if (this.task == null) {
                this.task = startTimer();
            }
            do {
                z = getLimit() <= 0 || this.acquireCount < getLimit();
                if (!z) {
                    wait();
                    continue;
                } else {
                    this.acquireCount++;
                }
            } while (!z);
        }
    }

    /* access modifiers changed from: package-private */
    public void endOfPeriod() {
        synchronized (this) {
            this.lastCallsPerPeriod = this.acquireCount;
            this.totalAcquireCount += (long) this.acquireCount;
            this.periodCount++;
            this.acquireCount = 0;
            notifyAll();
        }
    }

    public int getAcquireCount() {
        int i;
        synchronized (this) {
            i = this.acquireCount;
        }
        return i;
    }

    public int getAvailablePermits() {
        int limit2;
        int acquireCount2;
        synchronized (this) {
            limit2 = getLimit();
            acquireCount2 = getAcquireCount();
        }
        return limit2 - acquireCount2;
    }

    public double getAverageCallsPerPeriod() {
        double d;
        synchronized (this) {
            if (this.periodCount == 0) {
                d = 0.0d;
            } else {
                d = ((double) this.totalAcquireCount) / ((double) this.periodCount);
            }
        }
        return d;
    }

    /* access modifiers changed from: protected */
    public ScheduledExecutorService getExecutorService() {
        return this.executorService;
    }

    public int getLastAcquiresPerPeriod() {
        int i;
        synchronized (this) {
            i = this.lastCallsPerPeriod;
        }
        return i;
    }

    public final int getLimit() {
        int i;
        synchronized (this) {
            i = this.limit;
        }
        return i;
    }

    public long getPeriod() {
        return this.period;
    }

    public TimeUnit getUnit() {
        return this.unit;
    }

    public boolean isShutdown() {
        boolean z;
        synchronized (this) {
            z = this.shutdown;
        }
        return z;
    }

    public final void setLimit(int i) {
        synchronized (this) {
            this.limit = i;
        }
    }

    public void shutdown() {
        synchronized (this) {
            if (!this.shutdown) {
                if (this.ownExecutor) {
                    getExecutorService().shutdownNow();
                }
                if (this.task != null) {
                    this.task.cancel(false);
                }
                this.shutdown = true;
            }
        }
    }

    /* access modifiers changed from: protected */
    public ScheduledFuture<?> startTimer() {
        return getExecutorService().scheduleAtFixedRate(new Runnable() {
            public void run() {
                TimedSemaphore.this.endOfPeriod();
            }
        }, getPeriod(), getPeriod(), getUnit());
    }
}
