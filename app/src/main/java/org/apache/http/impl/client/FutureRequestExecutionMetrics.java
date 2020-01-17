package org.apache.http.impl.client;

import java.util.concurrent.atomic.AtomicLong;

public final class FutureRequestExecutionMetrics {
    private final AtomicLong activeConnections = new AtomicLong();
    private final DurationCounter failedConnections = new DurationCounter();
    private final DurationCounter requests = new DurationCounter();
    private final AtomicLong scheduledConnections = new AtomicLong();
    private final DurationCounter successfulConnections = new DurationCounter();
    private final DurationCounter tasks = new DurationCounter();

    static class DurationCounter {
        private final AtomicLong count = new AtomicLong(0);
        private final AtomicLong cumulativeDuration = new AtomicLong(0);

        DurationCounter() {
        }

        public long averageDuration() {
            long j = this.count.get();
            if (j > 0) {
                return this.cumulativeDuration.get() / j;
            }
            return 0;
        }

        public long count() {
            return this.count.get();
        }

        public void increment(long j) {
            this.count.incrementAndGet();
            this.cumulativeDuration.addAndGet(System.currentTimeMillis() - j);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("[count=").append(count()).append(", averageDuration=").append(averageDuration()).append("]");
            return sb.toString();
        }
    }

    FutureRequestExecutionMetrics() {
    }

    public long getActiveConnectionCount() {
        return this.activeConnections.get();
    }

    /* access modifiers changed from: package-private */
    public AtomicLong getActiveConnections() {
        return this.activeConnections;
    }

    public long getFailedConnectionAverageDuration() {
        return this.failedConnections.averageDuration();
    }

    public long getFailedConnectionCount() {
        return this.failedConnections.count();
    }

    /* access modifiers changed from: package-private */
    public DurationCounter getFailedConnections() {
        return this.failedConnections;
    }

    public long getRequestAverageDuration() {
        return this.requests.averageDuration();
    }

    public long getRequestCount() {
        return this.requests.count();
    }

    /* access modifiers changed from: package-private */
    public DurationCounter getRequests() {
        return this.requests;
    }

    public long getScheduledConnectionCount() {
        return this.scheduledConnections.get();
    }

    /* access modifiers changed from: package-private */
    public AtomicLong getScheduledConnections() {
        return this.scheduledConnections;
    }

    public long getSuccessfulConnectionAverageDuration() {
        return this.successfulConnections.averageDuration();
    }

    public long getSuccessfulConnectionCount() {
        return this.successfulConnections.count();
    }

    /* access modifiers changed from: package-private */
    public DurationCounter getSuccessfulConnections() {
        return this.successfulConnections;
    }

    public long getTaskAverageDuration() {
        return this.tasks.averageDuration();
    }

    public long getTaskCount() {
        return this.tasks.count();
    }

    /* access modifiers changed from: package-private */
    public DurationCounter getTasks() {
        return this.tasks;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[activeConnections=").append(this.activeConnections).append(", scheduledConnections=").append(this.scheduledConnections).append(", successfulConnections=").append(this.successfulConnections).append(", failedConnections=").append(this.failedConnections).append(", requests=").append(this.requests).append(", tasks=").append(this.tasks).append("]");
        return sb.toString();
    }
}
