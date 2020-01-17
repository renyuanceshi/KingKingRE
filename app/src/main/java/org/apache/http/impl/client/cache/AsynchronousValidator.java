package org.apache.http.impl.client.cache;

import java.io.Closeable;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.RejectedExecutionException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.client.methods.HttpExecutionAware;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.routing.HttpRoute;

class AsynchronousValidator implements Closeable {
    private final CacheKeyGenerator cacheKeyGenerator;
    private final FailureCache failureCache;
    private final Log log;
    private final Set<String> queued;
    private final SchedulingStrategy schedulingStrategy;

    public AsynchronousValidator(CacheConfig cacheConfig) {
        this((SchedulingStrategy) new ImmediateSchedulingStrategy(cacheConfig));
    }

    AsynchronousValidator(SchedulingStrategy schedulingStrategy2) {
        this.log = LogFactory.getLog(getClass());
        this.schedulingStrategy = schedulingStrategy2;
        this.queued = new HashSet();
        this.cacheKeyGenerator = new CacheKeyGenerator();
        this.failureCache = new DefaultFailureCache();
    }

    public void close() throws IOException {
        this.schedulingStrategy.close();
    }

    /* access modifiers changed from: package-private */
    public Set<String> getScheduledIdentifiers() {
        return Collections.unmodifiableSet(this.queued);
    }

    /* access modifiers changed from: package-private */
    public void jobFailed(String str) {
        this.failureCache.increaseErrorCount(str);
    }

    /* access modifiers changed from: package-private */
    public void jobSuccessful(String str) {
        this.failureCache.resetErrorCount(str);
    }

    /* access modifiers changed from: package-private */
    public void markComplete(String str) {
        synchronized (this) {
            this.queued.remove(str);
        }
    }

    public void revalidateCacheEntry(CachingExec cachingExec, HttpRoute httpRoute, HttpRequestWrapper httpRequestWrapper, HttpClientContext httpClientContext, HttpExecutionAware httpExecutionAware, HttpCacheEntry httpCacheEntry) {
        synchronized (this) {
            String variantURI = this.cacheKeyGenerator.getVariantURI(httpClientContext.getTargetHost(), httpRequestWrapper, httpCacheEntry);
            if (!this.queued.contains(variantURI)) {
                try {
                    this.schedulingStrategy.schedule(new AsynchronousValidationRequest(this, cachingExec, httpRoute, httpRequestWrapper, httpClientContext, httpExecutionAware, httpCacheEntry, variantURI, this.failureCache.getErrorCount(variantURI)));
                    this.queued.add(variantURI);
                } catch (RejectedExecutionException e) {
                    this.log.debug("Revalidation for [" + variantURI + "] not scheduled: " + e);
                }
            }
        }
        return;
    }
}
