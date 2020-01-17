package org.apache.http.impl.client.cache.ehcache;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.client.cache.HttpCacheEntrySerializer;
import org.apache.http.client.cache.HttpCacheStorage;
import org.apache.http.client.cache.HttpCacheUpdateCallback;
import org.apache.http.client.cache.HttpCacheUpdateException;
import org.apache.http.impl.client.cache.CacheConfig;
import org.apache.http.impl.client.cache.DefaultHttpCacheEntrySerializer;

public class EhcacheHttpCacheStorage implements HttpCacheStorage {
    private final Ehcache cache;
    private final int maxUpdateRetries;
    private final HttpCacheEntrySerializer serializer;

    public EhcacheHttpCacheStorage(Ehcache ehcache) {
        this(ehcache, CacheConfig.DEFAULT, new DefaultHttpCacheEntrySerializer());
    }

    public EhcacheHttpCacheStorage(Ehcache ehcache, CacheConfig cacheConfig) {
        this(ehcache, cacheConfig, new DefaultHttpCacheEntrySerializer());
    }

    public EhcacheHttpCacheStorage(Ehcache ehcache, CacheConfig cacheConfig, HttpCacheEntrySerializer httpCacheEntrySerializer) {
        this.cache = ehcache;
        this.maxUpdateRetries = cacheConfig.getMaxUpdateRetries();
        this.serializer = httpCacheEntrySerializer;
    }

    public HttpCacheEntry getEntry(String str) throws IOException {
        HttpCacheEntry readFrom;
        synchronized (this) {
            Element element = this.cache.get(str);
            readFrom = element == null ? null : this.serializer.readFrom(new ByteArrayInputStream((byte[]) element.getValue()));
        }
        return readFrom;
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [byte[], java.io.Serializable] */
    public void putEntry(String str, HttpCacheEntry httpCacheEntry) throws IOException {
        synchronized (this) {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            this.serializer.writeTo(httpCacheEntry, byteArrayOutputStream);
            this.cache.put(new Element(str, byteArrayOutputStream.toByteArray()));
        }
    }

    public void removeEntry(String str) {
        synchronized (this) {
            this.cache.remove(str);
        }
    }

    /* JADX WARNING: type inference failed for: r0v7, types: [byte[], java.io.Serializable] */
    public void updateEntry(String str, HttpCacheUpdateCallback httpCacheUpdateCallback) throws IOException, HttpCacheUpdateException {
        synchronized (this) {
            int i = 0;
            while (true) {
                int i2 = i;
                Element element = this.cache.get(str);
                HttpCacheEntry httpCacheEntry = null;
                if (element != null) {
                    httpCacheEntry = this.serializer.readFrom(new ByteArrayInputStream((byte[]) element.getValue()));
                }
                HttpCacheEntry update = httpCacheUpdateCallback.update(httpCacheEntry);
                if (httpCacheEntry != null) {
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    this.serializer.writeTo(update, byteArrayOutputStream);
                    if (this.cache.replace(element, new Element(str, byteArrayOutputStream.toByteArray()))) {
                        break;
                    }
                    i = i2 + 1;
                    if (i > this.maxUpdateRetries) {
                        throw new HttpCacheUpdateException("Failed to update");
                    }
                } else {
                    putEntry(str, update);
                    break;
                }
            }
        }
    }
}
