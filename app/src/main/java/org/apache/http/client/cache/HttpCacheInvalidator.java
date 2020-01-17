package org.apache.http.client.cache;

import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;

public interface HttpCacheInvalidator {
    void flushInvalidatedCacheEntries(HttpHost httpHost, HttpRequest httpRequest);

    void flushInvalidatedCacheEntries(HttpHost httpHost, HttpRequest httpRequest, HttpResponse httpResponse);
}
