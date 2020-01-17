package org.apache.http.impl.client.cache;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolVersion;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.cache.HeaderConstants;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.entity.AbstractHttpEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.message.BasicStatusLine;
import org.apache.http.protocol.HTTP;

@Immutable
class RequestProtocolCompliance {
    private static final List<String> disallowedWithNoCache = Arrays.asList(new String[]{HeaderConstants.CACHE_CONTROL_MIN_FRESH, HeaderConstants.CACHE_CONTROL_MAX_STALE, "max-age"});
    private final boolean weakETagOnPutDeleteAllowed;

    public RequestProtocolCompliance() {
        this.weakETagOnPutDeleteAllowed = false;
    }

    public RequestProtocolCompliance(boolean z) {
        this.weakETagOnPutDeleteAllowed = z;
    }

    private void add100ContinueHeaderIfMissing(HttpRequest httpRequest) {
        boolean z = false;
        for (Header elements : httpRequest.getHeaders("Expect")) {
            for (HeaderElement name : elements.getElements()) {
                if (HTTP.EXPECT_CONTINUE.equalsIgnoreCase(name.getName())) {
                    z = true;
                }
            }
        }
        if (!z) {
            httpRequest.addHeader("Expect", HTTP.EXPECT_CONTINUE);
        }
    }

    private void addContentTypeHeaderIfMissing(HttpEntityEnclosingRequest httpEntityEnclosingRequest) {
        if (httpEntityEnclosingRequest.getEntity().getContentType() == null) {
            ((AbstractHttpEntity) httpEntityEnclosingRequest.getEntity()).setContentType(ContentType.APPLICATION_OCTET_STREAM.getMimeType());
        }
    }

    private String buildHeaderFromElements(List<HeaderElement> list) {
        StringBuilder sb = new StringBuilder("");
        boolean z = true;
        for (HeaderElement next : list) {
            if (!z) {
                sb.append(",");
            } else {
                z = false;
            }
            sb.append(next.toString());
        }
        return sb.toString();
    }

    private void decrementOPTIONSMaxForwardsIfGreaterThen0(HttpRequest httpRequest) {
        Header firstHeader;
        if ("OPTIONS".equals(httpRequest.getRequestLine().getMethod()) && (firstHeader = httpRequest.getFirstHeader("Max-Forwards")) != null) {
            httpRequest.removeHeaders("Max-Forwards");
            httpRequest.setHeader("Max-Forwards", Integer.toString(Integer.parseInt(firstHeader.getValue()) - 1));
        }
    }

    private void remove100ContinueHeaderIfExists(HttpRequest httpRequest) {
        Header[] headers = httpRequest.getHeaders("Expect");
        ArrayList<HeaderElement> arrayList = new ArrayList<>();
        boolean z = false;
        for (Header header : headers) {
            for (HeaderElement headerElement : header.getElements()) {
                if (!HTTP.EXPECT_CONTINUE.equalsIgnoreCase(headerElement.getName())) {
                    arrayList.add(headerElement);
                } else {
                    z = true;
                }
            }
            if (z) {
                httpRequest.removeHeader(header);
                for (HeaderElement name : arrayList) {
                    httpRequest.addHeader(new BasicHeader("Expect", name.getName()));
                }
                return;
            }
            arrayList = new ArrayList<>();
        }
    }

    private RequestProtocolError requestContainsNoCacheDirectiveWithFieldName(HttpRequest httpRequest) {
        for (Header elements : httpRequest.getHeaders("Cache-Control")) {
            for (HeaderElement headerElement : elements.getElements()) {
                if (HeaderConstants.CACHE_CONTROL_NO_CACHE.equalsIgnoreCase(headerElement.getName()) && headerElement.getValue() != null) {
                    return RequestProtocolError.NO_CACHE_DIRECTIVE_WITH_FIELD_NAME;
                }
            }
        }
        return null;
    }

    private RequestProtocolError requestHasWeakETagAndRange(HttpRequest httpRequest) {
        Header firstHeader;
        if ("GET".equals(httpRequest.getRequestLine().getMethod()) && httpRequest.getFirstHeader("Range") != null && (firstHeader = httpRequest.getFirstHeader("If-Range")) != null && firstHeader.getValue().startsWith("W/")) {
            return RequestProtocolError.WEAK_ETAG_AND_RANGE_ERROR;
        }
        return null;
    }

    private RequestProtocolError requestHasWeekETagForPUTOrDELETEIfMatch(HttpRequest httpRequest) {
        String method = httpRequest.getRequestLine().getMethod();
        if (!"PUT".equals(method) && !"DELETE".equals(method)) {
            return null;
        }
        Header firstHeader = httpRequest.getFirstHeader("If-Match");
        if (firstHeader == null) {
            Header firstHeader2 = httpRequest.getFirstHeader("If-None-Match");
            if (firstHeader2 == null || !firstHeader2.getValue().startsWith("W/")) {
                return null;
            }
            return RequestProtocolError.WEAK_ETAG_ON_PUTDELETE_METHOD_ERROR;
        } else if (firstHeader.getValue().startsWith("W/")) {
            return RequestProtocolError.WEAK_ETAG_ON_PUTDELETE_METHOD_ERROR;
        } else {
            return null;
        }
    }

    private boolean requestMustNotHaveEntity(HttpRequest httpRequest) {
        return "TRACE".equals(httpRequest.getRequestLine().getMethod()) && (httpRequest instanceof HttpEntityEnclosingRequest);
    }

    private void stripOtherFreshnessDirectivesWithNoCache(HttpRequest httpRequest) {
        ArrayList arrayList = new ArrayList();
        boolean z = false;
        for (Header elements : httpRequest.getHeaders("Cache-Control")) {
            for (HeaderElement headerElement : elements.getElements()) {
                if (!disallowedWithNoCache.contains(headerElement.getName())) {
                    arrayList.add(headerElement);
                }
                if (HeaderConstants.CACHE_CONTROL_NO_CACHE.equals(headerElement.getName())) {
                    z = true;
                }
            }
        }
        if (z) {
            httpRequest.removeHeaders("Cache-Control");
            httpRequest.setHeader("Cache-Control", buildHeaderFromElements(arrayList));
        }
    }

    private void verifyOPTIONSRequestWithBodyHasContentType(HttpRequest httpRequest) {
        if ("OPTIONS".equals(httpRequest.getRequestLine().getMethod()) && (httpRequest instanceof HttpEntityEnclosingRequest)) {
            addContentTypeHeaderIfMissing((HttpEntityEnclosingRequest) httpRequest);
        }
    }

    private void verifyRequestWithExpectContinueFlagHas100continueHeader(HttpRequest httpRequest) {
        if (!(httpRequest instanceof HttpEntityEnclosingRequest)) {
            remove100ContinueHeaderIfExists(httpRequest);
        } else if (!((HttpEntityEnclosingRequest) httpRequest).expectContinue() || ((HttpEntityEnclosingRequest) httpRequest).getEntity() == null) {
            remove100ContinueHeaderIfExists(httpRequest);
        } else {
            add100ContinueHeaderIfMissing(httpRequest);
        }
    }

    public HttpResponse getErrorForRequest(RequestProtocolError requestProtocolError) {
        switch (requestProtocolError) {
            case BODY_BUT_NO_LENGTH_ERROR:
                return new BasicHttpResponse(new BasicStatusLine(HttpVersion.HTTP_1_1, HttpStatus.SC_LENGTH_REQUIRED, ""));
            case WEAK_ETAG_AND_RANGE_ERROR:
                return new BasicHttpResponse(new BasicStatusLine(HttpVersion.HTTP_1_1, HttpStatus.SC_BAD_REQUEST, "Weak eTag not compatible with byte range"));
            case WEAK_ETAG_ON_PUTDELETE_METHOD_ERROR:
                return new BasicHttpResponse(new BasicStatusLine(HttpVersion.HTTP_1_1, HttpStatus.SC_BAD_REQUEST, "Weak eTag not compatible with PUT or DELETE requests"));
            case NO_CACHE_DIRECTIVE_WITH_FIELD_NAME:
                return new BasicHttpResponse(new BasicStatusLine(HttpVersion.HTTP_1_1, HttpStatus.SC_BAD_REQUEST, "No-Cache directive MUST NOT include a field name"));
            default:
                throw new IllegalStateException("The request was compliant, therefore no error can be generated for it.");
        }
    }

    public void makeRequestCompliant(HttpRequestWrapper httpRequestWrapper) throws ClientProtocolException {
        if (requestMustNotHaveEntity(httpRequestWrapper)) {
            ((HttpEntityEnclosingRequest) httpRequestWrapper).setEntity((HttpEntity) null);
        }
        verifyRequestWithExpectContinueFlagHas100continueHeader(httpRequestWrapper);
        verifyOPTIONSRequestWithBodyHasContentType(httpRequestWrapper);
        decrementOPTIONSMaxForwardsIfGreaterThen0(httpRequestWrapper);
        stripOtherFreshnessDirectivesWithNoCache(httpRequestWrapper);
        if (requestVersionIsTooLow(httpRequestWrapper) || requestMinorVersionIsTooHighMajorVersionsMatch(httpRequestWrapper)) {
            httpRequestWrapper.setProtocolVersion(HttpVersion.HTTP_1_1);
        }
    }

    public List<RequestProtocolError> requestIsFatallyNonCompliant(HttpRequest httpRequest) {
        RequestProtocolError requestHasWeekETagForPUTOrDELETEIfMatch;
        ArrayList arrayList = new ArrayList();
        RequestProtocolError requestHasWeakETagAndRange = requestHasWeakETagAndRange(httpRequest);
        if (requestHasWeakETagAndRange != null) {
            arrayList.add(requestHasWeakETagAndRange);
        }
        if (!this.weakETagOnPutDeleteAllowed && (requestHasWeekETagForPUTOrDELETEIfMatch = requestHasWeekETagForPUTOrDELETEIfMatch(httpRequest)) != null) {
            arrayList.add(requestHasWeekETagForPUTOrDELETEIfMatch);
        }
        RequestProtocolError requestContainsNoCacheDirectiveWithFieldName = requestContainsNoCacheDirectiveWithFieldName(httpRequest);
        if (requestContainsNoCacheDirectiveWithFieldName != null) {
            arrayList.add(requestContainsNoCacheDirectiveWithFieldName);
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public boolean requestMinorVersionIsTooHighMajorVersionsMatch(HttpRequest httpRequest) {
        ProtocolVersion protocolVersion = httpRequest.getProtocolVersion();
        return protocolVersion.getMajor() == HttpVersion.HTTP_1_1.getMajor() && protocolVersion.getMinor() > HttpVersion.HTTP_1_1.getMinor();
    }

    /* access modifiers changed from: protected */
    public boolean requestVersionIsTooLow(HttpRequest httpRequest) {
        return httpRequest.getProtocolVersion().compareToVersion(HttpVersion.HTTP_1_1) < 0;
    }
}
