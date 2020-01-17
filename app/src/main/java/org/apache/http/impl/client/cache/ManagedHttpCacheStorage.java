package org.apache.http.impl.client.cache;

import java.io.Closeable;
import java.io.IOException;
import java.lang.ref.ReferenceQueue;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.client.cache.HttpCacheStorage;
import org.apache.http.client.cache.HttpCacheUpdateCallback;
import org.apache.http.util.Args;

@ThreadSafe
public class ManagedHttpCacheStorage implements HttpCacheStorage, Closeable {
    private final AtomicBoolean active = new AtomicBoolean(true);
    private final CacheMap entries;
    private final ReferenceQueue<HttpCacheEntry> morque = new ReferenceQueue<>();
    private final Set<ResourceReference> resources = new HashSet();

    public ManagedHttpCacheStorage(CacheConfig cacheConfig) {
        this.entries = new CacheMap(cacheConfig.getMaxCacheEntries());
    }

    private void ensureValidState() throws IllegalStateException {
        if (!this.active.get()) {
            throw new IllegalStateException("Cache has been shut down");
        }
    }

    private void keepResourceReference(HttpCacheEntry httpCacheEntry) {
        if (httpCacheEntry.getResource() != null) {
            this.resources.add(new ResourceReference(httpCacheEntry, this.morque));
        }
    }

    public void cleanResources() {
        if (this.active.get()) {
            while (true) {
                ResourceReference resourceReference = (ResourceReference) this.morque.poll();
                if (resourceReference != null) {
                    synchronized (this) {
                        this.resources.remove(resourceReference);
                    }
                    resourceReference.getResource().dispose();
                } else {
                    return;
                }
            }
            while (true) {
            }
        }
    }

    public void close() {
        shutdown();
    }

    public HttpCacheEntry getEntry(String str) throws IOException {
        HttpCacheEntry httpCacheEntry;
        Args.notNull(str, "URL");
        ensureValidState();
        synchronized (this) {
            httpCacheEntry = (HttpCacheEntry) this.entries.get(str);
        }
        return httpCacheEntry;
    }

    public void putEntry(String str, HttpCacheEntry httpCacheEntry) throws IOException {
        Args.notNull(str, "URL");
        Args.notNull(httpCacheEntry, "Cache entry");
        ensureValidState();
        synchronized (this) {
            this.entries.put(str, httpCacheEntry);
            keepResourceReference(httpCacheEntry);
        }
    }

    public void removeEntry(String str) throws IOException {
        Args.notNull(str, "URL");
        ensureValidState();
        synchronized (this) {
            this.entries.remove(str);
        }
    }

    public void shutdown() {
        if (this.active.compareAndSet(true, false)) {
            synchronized (this) {
                this.entries.clear();
                for (ResourceReference resource : this.resources) {
                    resource.getResource().dispose();
                }
                this.resources.clear();
                do {
                } while (this.morque.poll() != null);
            }
        }
    }

    public void updateEntry(String str, HttpCacheUpdateCallback httpCacheUpdateCallback) throws IOException {
        Args.notNull(str, "URL");
        Args.notNull(httpCacheUpdateCallback, "Callback");
        ensureValidState();
        synchronized (this) {
            HttpCacheEntry httpCacheEntry = (HttpCacheEntry) this.entries.get(str);
            HttpCacheEntry update = httpCacheUpdateCallback.update(httpCacheEntry);
            this.entries.put(str, update);
            if (httpCacheEntry != update) {
                keepResourceReference(update);
            }
        }
    }
}
