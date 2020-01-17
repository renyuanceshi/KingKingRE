package org.apache.http.impl.client.cache;

import com.pccwmobile.common.BuildConfig;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpMessage;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.HttpVersion;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.cache.HeaderConstants;
import org.apache.http.client.utils.DateUtils;

@Immutable
class ResponseCachingPolicy {
    private static final String[] AUTH_CACHEABLE_PARAMS = {"s-maxage", HeaderConstants.CACHE_CONTROL_MUST_REVALIDATE, HeaderConstants.PUBLIC};
    private static final Set<Integer> cacheableStatuses = new HashSet(Arrays.asList(new Integer[]{200, Integer.valueOf(HttpStatus.SC_NON_AUTHORITATIVE_INFORMATION), Integer.valueOf(HttpStatus.SC_MULTIPLE_CHOICES), Integer.valueOf(HttpStatus.SC_MOVED_PERMANENTLY), Integer.valueOf(HttpStatus.SC_GONE)}));
    private final Log log = LogFactory.getLog(getClass());
    private final long maxObjectSizeBytes;
    private final boolean neverCache1_0ResponsesWithQueryString;
    private final boolean sharedCache;
    private final Set<Integer> uncacheableStatuses;

    public ResponseCachingPolicy(long j, boolean z, boolean z2, boolean z3) {
        this.maxObjectSizeBytes = j;
        this.sharedCache = z;
        this.neverCache1_0ResponsesWithQueryString = z2;
        if (z3) {
            this.uncacheableStatuses = new HashSet(Arrays.asList(new Integer[]{Integer.valueOf(HttpStatus.SC_PARTIAL_CONTENT)}));
            return;
        }
        this.uncacheableStatuses = new HashSet(Arrays.asList(new Integer[]{Integer.valueOf(HttpStatus.SC_PARTIAL_CONTENT), Integer.valueOf(HttpStatus.SC_SEE_OTHER)}));
    }

    private boolean expiresHeaderLessOrEqualToDateHeaderAndNoCacheControl(HttpResponse httpResponse) {
        if (httpResponse.getFirstHeader("Cache-Control") != null) {
            return false;
        }
        Header firstHeader = httpResponse.getFirstHeader("Expires");
        Header firstHeader2 = httpResponse.getFirstHeader("Date");
        if (firstHeader == null || firstHeader2 == null) {
            return false;
        }
        Date parseDate = DateUtils.parseDate(firstHeader.getValue());
        Date parseDate2 = DateUtils.parseDate(firstHeader2.getValue());
        if (parseDate == null || parseDate2 == null) {
            return false;
        }
        return parseDate.equals(parseDate2) || parseDate.before(parseDate2);
    }

    private boolean from1_0Origin(HttpResponse httpResponse) {
        Header firstHeader = httpResponse.getFirstHeader("Via");
        if (firstHeader != null) {
            HeaderElement[] elements = firstHeader.getElements();
            if (elements.length < 0) {
                String str = elements[0].toString().split("\\s")[0];
                return str.contains("/") ? str.equals("HTTP/1.0") : str.equals(BuildConfig.VERSION_NAME);
            }
        }
        return HttpVersion.HTTP_1_0.equals(httpResponse.getProtocolVersion());
    }

    private boolean requestProtocolGreaterThanAccepted(HttpRequest httpRequest) {
        return httpRequest.getProtocolVersion().compareToVersion(HttpVersion.HTTP_1_1) > 0;
    }

    private boolean unknownStatusCode(int i) {
        if (i >= 100 && i <= 101) {
            return false;
        }
        if (i >= 200 && i <= 206) {
            return false;
        }
        if (i >= 300 && i <= 307) {
            return false;
        }
        if (i < 400 || i > 417) {
            return i < 500 || i > 505;
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean hasCacheControlParameterFrom(HttpMessage httpMessage, String[] strArr) {
        for (Header elements : httpMessage.getHeaders("Cache-Control")) {
            for (HeaderElement headerElement : elements.getElements()) {
                for (String equalsIgnoreCase : strArr) {
                    if (equalsIgnoreCase.equalsIgnoreCase(headerElement.getName())) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean isExplicitlyCacheable(HttpResponse httpResponse) {
        if (httpResponse.getFirstHeader("Expires") != null) {
            return true;
        }
        return hasCacheControlParameterFrom(httpResponse, new String[]{"max-age", "s-maxage", HeaderConstants.CACHE_CONTROL_MUST_REVALIDATE, HeaderConstants.CACHE_CONTROL_PROXY_REVALIDATE, HeaderConstants.PUBLIC});
    }

    /* access modifiers changed from: protected */
    public boolean isExplicitlyNonCacheable(HttpResponse httpResponse) {
        for (Header elements : httpResponse.getHeaders("Cache-Control")) {
            for (HeaderElement headerElement : elements.getElements()) {
                if (HeaderConstants.CACHE_CONTROL_NO_STORE.equals(headerElement.getName()) || HeaderConstants.CACHE_CONTROL_NO_CACHE.equals(headerElement.getName()) || (this.sharedCache && HeaderConstants.PRIVATE.equals(headerElement.getName()))) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isResponseCacheable(String str, HttpResponse httpResponse) {
        boolean z;
        if (!"GET".equals(str)) {
            this.log.debug("Response was not cacheable.");
            return false;
        }
        int statusCode = httpResponse.getStatusLine().getStatusCode();
        if (cacheableStatuses.contains(Integer.valueOf(statusCode))) {
            z = true;
        } else if (this.uncacheableStatuses.contains(Integer.valueOf(statusCode)) || unknownStatusCode(statusCode)) {
            return false;
        } else {
            z = false;
        }
        Header firstHeader = httpResponse.getFirstHeader("Content-Length");
        if ((firstHeader != null && ((long) Integer.parseInt(firstHeader.getValue())) > this.maxObjectSizeBytes) || httpResponse.getHeaders("Age").length > 1 || httpResponse.getHeaders("Expires").length > 1) {
            return false;
        }
        Header[] headers = httpResponse.getHeaders("Date");
        if (headers.length != 1 || DateUtils.parseDate(headers[0].getValue()) == null) {
            return false;
        }
        for (Header elements : httpResponse.getHeaders("Vary")) {
            for (HeaderElement name : elements.getElements()) {
                if ("*".equals(name.getName())) {
                    return false;
                }
            }
        }
        if (!isExplicitlyNonCacheable(httpResponse)) {
            return z || isExplicitlyCacheable(httpResponse);
        }
        return false;
    }

    public boolean isResponseCacheable(HttpRequest httpRequest, HttpResponse httpResponse) {
        Header[] headers;
        if (requestProtocolGreaterThanAccepted(httpRequest)) {
            this.log.debug("Response was not cacheable.");
            return false;
        }
        if (hasCacheControlParameterFrom(httpRequest, new String[]{HeaderConstants.CACHE_CONTROL_NO_STORE})) {
            return false;
        }
        if (httpRequest.getRequestLine().getUri().contains("?")) {
            if (this.neverCache1_0ResponsesWithQueryString && from1_0Origin(httpResponse)) {
                this.log.debug("Response was not cacheable as it had a query string.");
                return false;
            } else if (!isExplicitlyCacheable(httpResponse)) {
                this.log.debug("Response was not cacheable as it is missing explicit caching headers.");
                return false;
            }
        }
        if (expiresHeaderLessOrEqualToDateHeaderAndNoCacheControl(httpResponse)) {
            return false;
        }
        if (!this.sharedCache || (headers = httpRequest.getHeaders("Authorization")) == null || headers.length <= 0 || hasCacheControlParameterFrom(httpResponse, AUTH_CACHEABLE_PARAMS)) {
            return isResponseCacheable(httpRequest.getRequestLine().getMethod(), httpResponse);
        }
        return false;
    }
}
