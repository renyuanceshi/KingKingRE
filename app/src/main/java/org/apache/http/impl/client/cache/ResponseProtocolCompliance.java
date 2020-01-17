package org.apache.http.impl.client.cache;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.utils.DateUtils;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;

@Immutable
class ResponseProtocolCompliance {
    private static final String UNEXPECTED_100_CONTINUE = "The incoming request did not contain a 100-continue header, but the response was a Status 100, continue.";
    private static final String UNEXPECTED_PARTIAL_CONTENT = "partial content was returned for a request that did not ask for it";

    ResponseProtocolCompliance() {
    }

    private boolean backendResponseMustNotHaveBody(HttpRequest httpRequest, HttpResponse httpResponse) {
        return "HEAD".equals(httpRequest.getRequestLine().getMethod()) || httpResponse.getStatusLine().getStatusCode() == 204 || httpResponse.getStatusLine().getStatusCode() == 205 || httpResponse.getStatusLine().getStatusCode() == 304;
    }

    private void consumeBody(HttpResponse httpResponse) throws IOException {
        HttpEntity entity = httpResponse.getEntity();
        if (entity != null) {
            IOUtils.consume(entity);
        }
    }

    private void ensure200ForOPTIONSRequestWithNoBodyHasContentLengthZero(HttpRequest httpRequest, HttpResponse httpResponse) {
        if (httpRequest.getRequestLine().getMethod().equalsIgnoreCase("OPTIONS") && httpResponse.getStatusLine().getStatusCode() == 200 && httpResponse.getFirstHeader("Content-Length") == null) {
            httpResponse.addHeader("Content-Length", "0");
        }
    }

    private void ensure206ContainsDateHeader(HttpResponse httpResponse) {
        if (httpResponse.getFirstHeader("Date") == null) {
            httpResponse.addHeader("Date", DateUtils.formatDate(new Date()));
        }
    }

    private void ensure304DoesNotContainExtraEntityHeaders(HttpResponse httpResponse) {
        String[] strArr = {"Allow", "Content-Encoding", HttpHeaders.CONTENT_LANGUAGE, "Content-Length", HttpHeaders.CONTENT_MD5, "Content-Range", "Content-Type", "Last-Modified"};
        if (httpResponse.getStatusLine().getStatusCode() == 304) {
            for (String removeHeaders : strArr) {
                httpResponse.removeHeaders(removeHeaders);
            }
        }
    }

    private void ensurePartialContentIsNotSentToAClientThatDidNotRequestIt(HttpRequest httpRequest, HttpResponse httpResponse) throws IOException {
        if (httpRequest.getFirstHeader("Range") == null && httpResponse.getStatusLine().getStatusCode() == 206) {
            consumeBody(httpResponse);
            throw new ClientProtocolException(UNEXPECTED_PARTIAL_CONTENT);
        }
    }

    private void identityIsNotUsedInContentEncoding(HttpResponse httpResponse) {
        Header[] headers = httpResponse.getHeaders("Content-Encoding");
        if (headers != null && headers.length != 0) {
            ArrayList<Header> arrayList = new ArrayList<>();
            boolean z = false;
            for (Header elements : headers) {
                StringBuilder sb = new StringBuilder();
                boolean z2 = true;
                for (HeaderElement headerElement : elements.getElements()) {
                    if (HTTP.IDENTITY_CODING.equalsIgnoreCase(headerElement.getName())) {
                        z = true;
                    } else {
                        if (!z2) {
                            sb.append(",");
                        }
                        sb.append(headerElement.toString());
                        z2 = false;
                    }
                }
                String sb2 = sb.toString();
                if (!"".equals(sb2)) {
                    arrayList.add(new BasicHeader("Content-Encoding", sb2));
                }
            }
            if (z) {
                httpResponse.removeHeaders("Content-Encoding");
                for (Header addHeader : arrayList) {
                    httpResponse.addHeader(addHeader);
                }
            }
        }
    }

    private void removeResponseTransferEncoding(HttpResponse httpResponse) {
        httpResponse.removeHeaders(HttpHeaders.TE);
        httpResponse.removeHeaders("Transfer-Encoding");
    }

    private void requestDidNotExpect100ContinueButResponseIsOne(HttpRequestWrapper httpRequestWrapper, HttpResponse httpResponse) throws IOException {
        if (httpResponse.getStatusLine().getStatusCode() == 100) {
            HttpRequest original = httpRequestWrapper.getOriginal();
            if (!(original instanceof HttpEntityEnclosingRequest) || !((HttpEntityEnclosingRequest) original).expectContinue()) {
                consumeBody(httpResponse);
                throw new ClientProtocolException(UNEXPECTED_100_CONTINUE);
            }
        }
    }

    private void transferEncodingIsNotReturnedTo1_0Client(HttpRequestWrapper httpRequestWrapper, HttpResponse httpResponse) {
        if (httpRequestWrapper.getOriginal().getProtocolVersion().compareToVersion(HttpVersion.HTTP_1_1) < 0) {
            removeResponseTransferEncoding(httpResponse);
        }
    }

    private void warningsWithNonMatchingWarnDatesAreRemoved(HttpResponse httpResponse) {
        Header[] headers;
        Date parseDate = DateUtils.parseDate(httpResponse.getFirstHeader("Date").getValue());
        if (parseDate != null && (headers = httpResponse.getHeaders("Warning")) != null && headers.length != 0) {
            ArrayList<Header> arrayList = new ArrayList<>();
            boolean z = false;
            for (Header warningValues : headers) {
                for (WarningValue warningValue : WarningValue.getWarningValues(warningValues)) {
                    Date warnDate = warningValue.getWarnDate();
                    if (warnDate == null || warnDate.equals(parseDate)) {
                        arrayList.add(new BasicHeader("Warning", warningValue.toString()));
                    } else {
                        z = true;
                    }
                }
            }
            if (z) {
                httpResponse.removeHeaders("Warning");
                for (Header addHeader : arrayList) {
                    httpResponse.addHeader(addHeader);
                }
            }
        }
    }

    public void ensureProtocolCompliance(HttpRequestWrapper httpRequestWrapper, HttpResponse httpResponse) throws IOException {
        if (backendResponseMustNotHaveBody(httpRequestWrapper, httpResponse)) {
            consumeBody(httpResponse);
            httpResponse.setEntity((HttpEntity) null);
        }
        requestDidNotExpect100ContinueButResponseIsOne(httpRequestWrapper, httpResponse);
        transferEncodingIsNotReturnedTo1_0Client(httpRequestWrapper, httpResponse);
        ensurePartialContentIsNotSentToAClientThatDidNotRequestIt(httpRequestWrapper, httpResponse);
        ensure200ForOPTIONSRequestWithNoBodyHasContentLengthZero(httpRequestWrapper, httpResponse);
        ensure206ContainsDateHeader(httpResponse);
        ensure304DoesNotContainExtraEntityHeaders(httpResponse);
        identityIsNotUsedInContentEncoding(httpResponse);
        warningsWithNonMatchingWarnDatesAreRemoved(httpResponse);
    }
}
