package org.apache.http.impl.client.cache;

import android.support.v4.media.session.PlaybackStateCompat;
import android.support.v7.widget.ActivityChooserView;
import org.apache.http.util.Args;

public class CacheConfig implements Cloneable {
    public static final CacheConfig DEFAULT = new Builder().build();
    public static final boolean DEFAULT_303_CACHING_ENABLED = false;
    public static final int DEFAULT_ASYNCHRONOUS_WORKERS_CORE = 1;
    public static final int DEFAULT_ASYNCHRONOUS_WORKERS_MAX = 1;
    public static final int DEFAULT_ASYNCHRONOUS_WORKER_IDLE_LIFETIME_SECS = 60;
    public static final boolean DEFAULT_HEURISTIC_CACHING_ENABLED = false;
    public static final float DEFAULT_HEURISTIC_COEFFICIENT = 0.1f;
    public static final long DEFAULT_HEURISTIC_LIFETIME = 0;
    public static final int DEFAULT_MAX_CACHE_ENTRIES = 1000;
    public static final int DEFAULT_MAX_OBJECT_SIZE_BYTES = 8192;
    public static final int DEFAULT_MAX_UPDATE_RETRIES = 1;
    public static final int DEFAULT_REVALIDATION_QUEUE_SIZE = 100;
    public static final boolean DEFAULT_WEAK_ETAG_ON_PUTDELETE_ALLOWED = false;
    private boolean allow303Caching;
    private int asynchronousWorkerIdleLifetimeSecs;
    private int asynchronousWorkersCore;
    private int asynchronousWorkersMax;
    private boolean heuristicCachingEnabled;
    private float heuristicCoefficient;
    private long heuristicDefaultLifetime;
    private boolean isSharedCache;
    private int maxCacheEntries;
    private long maxObjectSize;
    private int maxUpdateRetries;
    private boolean neverCacheHTTP10ResponsesWithQuery;
    private int revalidationQueueSize;
    private boolean weakETagOnPutDeleteAllowed;

    public static class Builder {
        private boolean allow303Caching = false;
        private int asynchronousWorkerIdleLifetimeSecs = 60;
        private int asynchronousWorkersCore = 1;
        private int asynchronousWorkersMax = 1;
        private boolean heuristicCachingEnabled = false;
        private float heuristicCoefficient = 0.1f;
        private long heuristicDefaultLifetime = 0;
        private boolean isSharedCache = true;
        private int maxCacheEntries = 1000;
        private long maxObjectSize = PlaybackStateCompat.ACTION_PLAY_FROM_URI;
        private int maxUpdateRetries = 1;
        private boolean neverCacheHTTP10ResponsesWithQuery;
        private int revalidationQueueSize = 100;
        private boolean weakETagOnPutDeleteAllowed = false;

        Builder() {
        }

        public CacheConfig build() {
            return new CacheConfig(this.maxObjectSize, this.maxCacheEntries, this.maxUpdateRetries, this.allow303Caching, this.weakETagOnPutDeleteAllowed, this.heuristicCachingEnabled, this.heuristicCoefficient, this.heuristicDefaultLifetime, this.isSharedCache, this.asynchronousWorkersMax, this.asynchronousWorkersCore, this.asynchronousWorkerIdleLifetimeSecs, this.revalidationQueueSize, this.neverCacheHTTP10ResponsesWithQuery);
        }

        public Builder setAllow303Caching(boolean z) {
            this.allow303Caching = z;
            return this;
        }

        public Builder setAsynchronousWorkerIdleLifetimeSecs(int i) {
            this.asynchronousWorkerIdleLifetimeSecs = i;
            return this;
        }

        public Builder setAsynchronousWorkersCore(int i) {
            this.asynchronousWorkersCore = i;
            return this;
        }

        public Builder setAsynchronousWorkersMax(int i) {
            this.asynchronousWorkersMax = i;
            return this;
        }

        public Builder setHeuristicCachingEnabled(boolean z) {
            this.heuristicCachingEnabled = z;
            return this;
        }

        public Builder setHeuristicCoefficient(float f) {
            this.heuristicCoefficient = f;
            return this;
        }

        public Builder setHeuristicDefaultLifetime(long j) {
            this.heuristicDefaultLifetime = j;
            return this;
        }

        public Builder setMaxCacheEntries(int i) {
            this.maxCacheEntries = i;
            return this;
        }

        public Builder setMaxObjectSize(long j) {
            this.maxObjectSize = j;
            return this;
        }

        public Builder setMaxUpdateRetries(int i) {
            this.maxUpdateRetries = i;
            return this;
        }

        public Builder setNeverCacheHTTP10ResponsesWithQueryString(boolean z) {
            this.neverCacheHTTP10ResponsesWithQuery = z;
            return this;
        }

        public Builder setRevalidationQueueSize(int i) {
            this.revalidationQueueSize = i;
            return this;
        }

        public Builder setSharedCache(boolean z) {
            this.isSharedCache = z;
            return this;
        }

        public Builder setWeakETagOnPutDeleteAllowed(boolean z) {
            this.weakETagOnPutDeleteAllowed = z;
            return this;
        }
    }

    @Deprecated
    public CacheConfig() {
        this.maxObjectSize = PlaybackStateCompat.ACTION_PLAY_FROM_URI;
        this.maxCacheEntries = 1000;
        this.maxUpdateRetries = 1;
        this.allow303Caching = false;
        this.weakETagOnPutDeleteAllowed = false;
        this.heuristicCachingEnabled = false;
        this.heuristicCoefficient = 0.1f;
        this.heuristicDefaultLifetime = 0;
        this.isSharedCache = true;
        this.asynchronousWorkersMax = 1;
        this.asynchronousWorkersCore = 1;
        this.asynchronousWorkerIdleLifetimeSecs = 60;
        this.revalidationQueueSize = 100;
    }

    CacheConfig(long j, int i, int i2, boolean z, boolean z2, boolean z3, float f, long j2, boolean z4, int i3, int i4, int i5, int i6, boolean z5) {
        this.maxObjectSize = j;
        this.maxCacheEntries = i;
        this.maxUpdateRetries = i2;
        this.allow303Caching = z;
        this.weakETagOnPutDeleteAllowed = z2;
        this.heuristicCachingEnabled = z3;
        this.heuristicCoefficient = f;
        this.heuristicDefaultLifetime = j2;
        this.isSharedCache = z4;
        this.asynchronousWorkersMax = i3;
        this.asynchronousWorkersCore = i4;
        this.asynchronousWorkerIdleLifetimeSecs = i5;
        this.revalidationQueueSize = i6;
    }

    public static Builder copy(CacheConfig cacheConfig) {
        Args.notNull(cacheConfig, "Cache config");
        return new Builder().setMaxObjectSize(cacheConfig.getMaxObjectSize()).setMaxCacheEntries(cacheConfig.getMaxCacheEntries()).setMaxUpdateRetries(cacheConfig.getMaxUpdateRetries()).setHeuristicCachingEnabled(cacheConfig.isHeuristicCachingEnabled()).setHeuristicCoefficient(cacheConfig.getHeuristicCoefficient()).setHeuristicDefaultLifetime(cacheConfig.getHeuristicDefaultLifetime()).setSharedCache(cacheConfig.isSharedCache()).setAsynchronousWorkersMax(cacheConfig.getAsynchronousWorkersMax()).setAsynchronousWorkersCore(cacheConfig.getAsynchronousWorkersCore()).setAsynchronousWorkerIdleLifetimeSecs(cacheConfig.getAsynchronousWorkerIdleLifetimeSecs()).setRevalidationQueueSize(cacheConfig.getRevalidationQueueSize()).setNeverCacheHTTP10ResponsesWithQueryString(cacheConfig.isNeverCacheHTTP10ResponsesWithQuery());
    }

    public static Builder custom() {
        return new Builder();
    }

    /* access modifiers changed from: protected */
    public CacheConfig clone() throws CloneNotSupportedException {
        return (CacheConfig) super.clone();
    }

    public int getAsynchronousWorkerIdleLifetimeSecs() {
        return this.asynchronousWorkerIdleLifetimeSecs;
    }

    public int getAsynchronousWorkersCore() {
        return this.asynchronousWorkersCore;
    }

    public int getAsynchronousWorkersMax() {
        return this.asynchronousWorkersMax;
    }

    public float getHeuristicCoefficient() {
        return this.heuristicCoefficient;
    }

    public long getHeuristicDefaultLifetime() {
        return this.heuristicDefaultLifetime;
    }

    public int getMaxCacheEntries() {
        return this.maxCacheEntries;
    }

    public long getMaxObjectSize() {
        return this.maxObjectSize;
    }

    @Deprecated
    public int getMaxObjectSizeBytes() {
        return this.maxObjectSize > 2147483647L ? ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED : (int) this.maxObjectSize;
    }

    public int getMaxUpdateRetries() {
        return this.maxUpdateRetries;
    }

    public int getRevalidationQueueSize() {
        return this.revalidationQueueSize;
    }

    public boolean is303CachingEnabled() {
        return this.allow303Caching;
    }

    public boolean isHeuristicCachingEnabled() {
        return this.heuristicCachingEnabled;
    }

    public boolean isNeverCacheHTTP10ResponsesWithQuery() {
        return this.neverCacheHTTP10ResponsesWithQuery;
    }

    public boolean isSharedCache() {
        return this.isSharedCache;
    }

    public boolean isWeakETagOnPutDeleteAllowed() {
        return this.weakETagOnPutDeleteAllowed;
    }

    @Deprecated
    public void setAsynchronousWorkerIdleLifetimeSecs(int i) {
        this.asynchronousWorkerIdleLifetimeSecs = i;
    }

    @Deprecated
    public void setAsynchronousWorkersCore(int i) {
        this.asynchronousWorkersCore = i;
    }

    @Deprecated
    public void setAsynchronousWorkersMax(int i) {
        this.asynchronousWorkersMax = i;
    }

    @Deprecated
    public void setHeuristicCachingEnabled(boolean z) {
        this.heuristicCachingEnabled = z;
    }

    @Deprecated
    public void setHeuristicCoefficient(float f) {
        this.heuristicCoefficient = f;
    }

    @Deprecated
    public void setHeuristicDefaultLifetime(long j) {
        this.heuristicDefaultLifetime = j;
    }

    @Deprecated
    public void setMaxCacheEntries(int i) {
        this.maxCacheEntries = i;
    }

    @Deprecated
    public void setMaxObjectSize(long j) {
        this.maxObjectSize = j;
    }

    @Deprecated
    public void setMaxObjectSizeBytes(int i) {
        if (i > Integer.MAX_VALUE) {
            this.maxObjectSize = 2147483647L;
        } else {
            this.maxObjectSize = (long) i;
        }
    }

    @Deprecated
    public void setMaxUpdateRetries(int i) {
        this.maxUpdateRetries = i;
    }

    @Deprecated
    public void setRevalidationQueueSize(int i) {
        this.revalidationQueueSize = i;
    }

    @Deprecated
    public void setSharedCache(boolean z) {
        this.isSharedCache = z;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[maxObjectSize=").append(this.maxObjectSize).append(", maxCacheEntries=").append(this.maxCacheEntries).append(", maxUpdateRetries=").append(this.maxUpdateRetries).append(", 303CachingEnabled=").append(this.allow303Caching).append(", weakETagOnPutDeleteAllowed=").append(this.weakETagOnPutDeleteAllowed).append(", heuristicCachingEnabled=").append(this.heuristicCachingEnabled).append(", heuristicCoefficient=").append(this.heuristicCoefficient).append(", heuristicDefaultLifetime=").append(this.heuristicDefaultLifetime).append(", isSharedCache=").append(this.isSharedCache).append(", asynchronousWorkersMax=").append(this.asynchronousWorkersMax).append(", asynchronousWorkersCore=").append(this.asynchronousWorkersCore).append(", asynchronousWorkerIdleLifetimeSecs=").append(this.asynchronousWorkerIdleLifetimeSecs).append(", revalidationQueueSize=").append(this.revalidationQueueSize).append(", neverCacheHTTP10ResponsesWithQuery=").append(this.neverCacheHTTP10ResponsesWithQuery).append("]");
        return sb.toString();
    }
}
