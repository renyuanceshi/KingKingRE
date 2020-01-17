package org.apache.http.impl.client.cache;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import org.apache.http.annotation.ThreadSafe;

@ThreadSafe
public class DefaultFailureCache implements FailureCache {
    static final int DEFAULT_MAX_SIZE = 1000;
    static final int MAX_UPDATE_TRIES = 10;
    private final int maxSize;
    private final ConcurrentMap<String, FailureCacheValue> storage;

    public DefaultFailureCache() {
        this(1000);
    }

    public DefaultFailureCache(int i) {
        this.maxSize = i;
        this.storage = new ConcurrentHashMap();
    }

    private FailureCacheValue findValueWithOldestTimestamp() {
        long j = Long.MAX_VALUE;
        FailureCacheValue failureCacheValue = null;
        for (Map.Entry entry : this.storage.entrySet()) {
            long creationTimeInNanos = ((FailureCacheValue) entry.getValue()).getCreationTimeInNanos();
            if (creationTimeInNanos < j) {
                failureCacheValue = (FailureCacheValue) entry.getValue();
                j = creationTimeInNanos;
            }
        }
        return failureCacheValue;
    }

    private void removeOldestEntryIfMapSizeExceeded() {
        FailureCacheValue findValueWithOldestTimestamp;
        if (this.storage.size() > this.maxSize && (findValueWithOldestTimestamp = findValueWithOldestTimestamp()) != null) {
            this.storage.remove(findValueWithOldestTimestamp.getKey(), findValueWithOldestTimestamp);
        }
    }

    private void updateValue(String str) {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < 10) {
                FailureCacheValue failureCacheValue = (FailureCacheValue) this.storage.get(str);
                if (failureCacheValue == null) {
                    if (this.storage.putIfAbsent(str, new FailureCacheValue(str, 1)) == null) {
                        return;
                    }
                } else {
                    int errorCount = failureCacheValue.getErrorCount();
                    if (errorCount != Integer.MAX_VALUE) {
                        if (this.storage.replace(str, failureCacheValue, new FailureCacheValue(str, errorCount + 1))) {
                            return;
                        }
                    } else {
                        return;
                    }
                }
                i = i2 + 1;
            } else {
                return;
            }
        }
    }

    public int getErrorCount(String str) {
        if (str == null) {
            throw new IllegalArgumentException("identifier may not be null");
        }
        FailureCacheValue failureCacheValue = (FailureCacheValue) this.storage.get(str);
        if (failureCacheValue != null) {
            return failureCacheValue.getErrorCount();
        }
        return 0;
    }

    public void increaseErrorCount(String str) {
        if (str == null) {
            throw new IllegalArgumentException("identifier may not be null");
        }
        updateValue(str);
        removeOldestEntryIfMapSizeExceeded();
    }

    public void resetErrorCount(String str) {
        if (str == null) {
            throw new IllegalArgumentException("identifier may not be null");
        }
        this.storage.remove(str);
    }
}
