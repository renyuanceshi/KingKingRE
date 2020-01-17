package org.apache.http.impl.client.cache;

import java.lang.ref.PhantomReference;
import java.lang.ref.ReferenceQueue;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.client.cache.Resource;
import org.apache.http.util.Args;

@Immutable
class ResourceReference extends PhantomReference<HttpCacheEntry> {
    private final Resource resource;

    public ResourceReference(HttpCacheEntry httpCacheEntry, ReferenceQueue<HttpCacheEntry> referenceQueue) {
        super(httpCacheEntry, referenceQueue);
        Args.notNull(httpCacheEntry.getResource(), "Resource");
        this.resource = httpCacheEntry.getResource();
    }

    public boolean equals(Object obj) {
        return this.resource.equals(obj);
    }

    public Resource getResource() {
        return this.resource;
    }

    public int hashCode() {
        return this.resource.hashCode();
    }
}
