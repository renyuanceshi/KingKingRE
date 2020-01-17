package org.apache.http.client.cache;

import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;

@NotThreadSafe
public class HttpCacheContext extends HttpClientContext {
    public static final String CACHE_RESPONSE_STATUS = "http.cache.response.status";

    public HttpCacheContext() {
    }

    public HttpCacheContext(HttpContext httpContext) {
        super(httpContext);
    }

    public static HttpCacheContext adapt(HttpContext httpContext) {
        return httpContext instanceof HttpCacheContext ? (HttpCacheContext) httpContext : new HttpCacheContext(httpContext);
    }

    public static HttpCacheContext create() {
        return new HttpCacheContext(new BasicHttpContext());
    }

    public CacheResponseStatus getCacheResponseStatus() {
        return (CacheResponseStatus) getAttribute("http.cache.response.status", CacheResponseStatus.class);
    }
}
