package org.apache.http.impl.client.cache;

import java.util.Date;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolVersion;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.utils.DateUtils;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicHttpResponse;

@Immutable
class CachedHttpResponseGenerator {
    private final CacheValidityPolicy validityStrategy;

    CachedHttpResponseGenerator() {
        this(new CacheValidityPolicy());
    }

    CachedHttpResponseGenerator(CacheValidityPolicy cacheValidityPolicy) {
        this.validityStrategy = cacheValidityPolicy;
    }

    private void addMissingContentLengthHeader(HttpResponse httpResponse, HttpEntity httpEntity) {
        if (!transferEncodingIsPresent(httpResponse) && httpResponse.getFirstHeader("Content-Length") == null) {
            httpResponse.setHeader(new BasicHeader("Content-Length", Long.toString(httpEntity.getContentLength())));
        }
    }

    private boolean transferEncodingIsPresent(HttpResponse httpResponse) {
        return httpResponse.getFirstHeader("Transfer-Encoding") != null;
    }

    /* access modifiers changed from: package-private */
    public CloseableHttpResponse generateNotModifiedResponse(HttpCacheEntry httpCacheEntry) {
        BasicHttpResponse basicHttpResponse = new BasicHttpResponse((ProtocolVersion) HttpVersion.HTTP_1_1, (int) HttpStatus.SC_NOT_MODIFIED, "Not Modified");
        Header firstHeader = httpCacheEntry.getFirstHeader("Date");
        if (firstHeader == null) {
            firstHeader = new BasicHeader("Date", DateUtils.formatDate(new Date()));
        }
        basicHttpResponse.addHeader(firstHeader);
        Header firstHeader2 = httpCacheEntry.getFirstHeader("ETag");
        if (firstHeader2 != null) {
            basicHttpResponse.addHeader(firstHeader2);
        }
        Header firstHeader3 = httpCacheEntry.getFirstHeader(HttpHeaders.CONTENT_LOCATION);
        if (firstHeader3 != null) {
            basicHttpResponse.addHeader(firstHeader3);
        }
        Header firstHeader4 = httpCacheEntry.getFirstHeader("Expires");
        if (firstHeader4 != null) {
            basicHttpResponse.addHeader(firstHeader4);
        }
        Header firstHeader5 = httpCacheEntry.getFirstHeader("Cache-Control");
        if (firstHeader5 != null) {
            basicHttpResponse.addHeader(firstHeader5);
        }
        Header firstHeader6 = httpCacheEntry.getFirstHeader("Vary");
        if (firstHeader6 != null) {
            basicHttpResponse.addHeader(firstHeader6);
        }
        return Proxies.enhanceResponse(basicHttpResponse);
    }

    /* access modifiers changed from: package-private */
    public CloseableHttpResponse generateResponse(HttpCacheEntry httpCacheEntry) {
        Date date = new Date();
        BasicHttpResponse basicHttpResponse = new BasicHttpResponse((ProtocolVersion) HttpVersion.HTTP_1_1, httpCacheEntry.getStatusCode(), httpCacheEntry.getReasonPhrase());
        basicHttpResponse.setHeaders(httpCacheEntry.getAllHeaders());
        if (httpCacheEntry.getResource() != null) {
            CacheEntity cacheEntity = new CacheEntity(httpCacheEntry);
            addMissingContentLengthHeader(basicHttpResponse, cacheEntity);
            basicHttpResponse.setEntity(cacheEntity);
        }
        long currentAgeSecs = this.validityStrategy.getCurrentAgeSecs(httpCacheEntry, date);
        if (currentAgeSecs > 0) {
            if (currentAgeSecs >= 2147483647L) {
                basicHttpResponse.setHeader("Age", "2147483648");
            } else {
                basicHttpResponse.setHeader("Age", "" + ((int) currentAgeSecs));
            }
        }
        return Proxies.enhanceResponse(basicHttpResponse);
    }
}
