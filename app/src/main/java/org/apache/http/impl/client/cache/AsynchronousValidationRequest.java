package org.apache.http.impl.client.cache;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.client.methods.HttpExecutionAware;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.routing.HttpRoute;

class AsynchronousValidationRequest implements Runnable {
    private final HttpCacheEntry cacheEntry;
    private final CachingExec cachingExec;
    private final int consecutiveFailedAttempts;
    private final HttpClientContext context;
    private final HttpExecutionAware execAware;
    private final String identifier;
    private final Log log = LogFactory.getLog(getClass());
    private final AsynchronousValidator parent;
    private final HttpRequestWrapper request;
    private final HttpRoute route;

    AsynchronousValidationRequest(AsynchronousValidator asynchronousValidator, CachingExec cachingExec2, HttpRoute httpRoute, HttpRequestWrapper httpRequestWrapper, HttpClientContext httpClientContext, HttpExecutionAware httpExecutionAware, HttpCacheEntry httpCacheEntry, String str, int i) {
        this.parent = asynchronousValidator;
        this.cachingExec = cachingExec2;
        this.route = httpRoute;
        this.request = httpRequestWrapper;
        this.context = httpClientContext;
        this.execAware = httpExecutionAware;
        this.cacheEntry = httpCacheEntry;
        this.identifier = str;
        this.consecutiveFailedAttempts = i;
    }

    private boolean isNotServerError(int i) {
        return i < 500;
    }

    private boolean isNotStale(HttpResponse httpResponse) {
        Header[] headers = httpResponse.getHeaders("Warning");
        if (headers != null) {
            for (Header value : headers) {
                String value2 = value.getValue();
                if (value2.startsWith("110") || value2.startsWith("111")) {
                    return false;
                }
            }
        }
        return true;
    }

    public int getConsecutiveFailedAttempts() {
        return this.consecutiveFailedAttempts;
    }

    /* access modifiers changed from: package-private */
    public String getIdentifier() {
        return this.identifier;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean revalidateCacheEntry() {
        /*
            r7 = this;
            r6 = 0
            org.apache.http.impl.client.cache.CachingExec r0 = r7.cachingExec     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
            org.apache.http.conn.routing.HttpRoute r1 = r7.route     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
            org.apache.http.client.methods.HttpRequestWrapper r2 = r7.request     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
            org.apache.http.client.protocol.HttpClientContext r3 = r7.context     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
            org.apache.http.client.methods.HttpExecutionAware r4 = r7.execAware     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
            org.apache.http.client.cache.HttpCacheEntry r5 = r7.cacheEntry     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
            org.apache.http.client.methods.CloseableHttpResponse r1 = r0.revalidateCacheEntry(r1, r2, r3, r4, r5)     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
            org.apache.http.StatusLine r0 = r1.getStatusLine()     // Catch:{ all -> 0x002c }
            int r0 = r0.getStatusCode()     // Catch:{ all -> 0x002c }
            boolean r0 = r7.isNotServerError(r0)     // Catch:{ all -> 0x002c }
            if (r0 == 0) goto L_0x002a
            boolean r0 = r7.isNotStale(r1)     // Catch:{ all -> 0x002c }
            if (r0 == 0) goto L_0x002a
            r0 = 1
        L_0x0026:
            r1.close()     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
        L_0x0029:
            return r0
        L_0x002a:
            r0 = r6
            goto L_0x0026
        L_0x002c:
            r0 = move-exception
            r1.close()     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
            throw r0     // Catch:{ IOException -> 0x0031, HttpException -> 0x003b, RuntimeException -> 0x0045 }
        L_0x0031:
            r0 = move-exception
            org.apache.commons.logging.Log r1 = r7.log
            java.lang.String r2 = "Asynchronous revalidation failed due to I/O error"
            r1.debug(r2, r0)
            r0 = r6
            goto L_0x0029
        L_0x003b:
            r0 = move-exception
            org.apache.commons.logging.Log r1 = r7.log
            java.lang.String r2 = "HTTP protocol exception during asynchronous revalidation"
            r1.error(r2, r0)
            r0 = r6
            goto L_0x0029
        L_0x0045:
            r0 = move-exception
            org.apache.commons.logging.Log r1 = r7.log
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "RuntimeException thrown during asynchronous revalidation: "
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.StringBuilder r0 = r2.append(r0)
            java.lang.String r0 = r0.toString()
            r1.error(r0)
            r0 = r6
            goto L_0x0029
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.client.cache.AsynchronousValidationRequest.revalidateCacheEntry():boolean");
    }

    public void run() {
        try {
            if (revalidateCacheEntry()) {
                this.parent.jobSuccessful(this.identifier);
            } else {
                this.parent.jobFailed(this.identifier);
            }
        } finally {
            this.parent.markComplete(this.identifier);
        }
    }
}
