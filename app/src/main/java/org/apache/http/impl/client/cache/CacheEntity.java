package org.apache.http.impl.client.cache;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.util.Args;

@Immutable
class CacheEntity implements HttpEntity, Serializable {
    private static final long serialVersionUID = -3467082284120936233L;
    private final HttpCacheEntry cacheEntry;

    public CacheEntity(HttpCacheEntry httpCacheEntry) {
        this.cacheEntry = httpCacheEntry;
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    public void consumeContent() throws IOException {
    }

    public InputStream getContent() throws IOException {
        return this.cacheEntry.getResource().getInputStream();
    }

    public Header getContentEncoding() {
        return this.cacheEntry.getFirstHeader("Content-Encoding");
    }

    public long getContentLength() {
        return this.cacheEntry.getResource().length();
    }

    public Header getContentType() {
        return this.cacheEntry.getFirstHeader("Content-Type");
    }

    public boolean isChunked() {
        return false;
    }

    public boolean isRepeatable() {
        return true;
    }

    public boolean isStreaming() {
        return false;
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        Args.notNull(outputStream, "Output stream");
        InputStream inputStream = this.cacheEntry.getResource().getInputStream();
        try {
            IOUtils.copy(inputStream, outputStream);
        } finally {
            inputStream.close();
        }
    }
}
