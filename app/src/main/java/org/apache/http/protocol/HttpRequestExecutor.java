package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public class HttpRequestExecutor {
    public static final int DEFAULT_WAIT_FOR_CONTINUE = 3000;
    private final int waitForContinue;

    public HttpRequestExecutor() {
        this(DEFAULT_WAIT_FOR_CONTINUE);
    }

    public HttpRequestExecutor(int i) {
        this.waitForContinue = Args.positive(i, "Wait for continue time");
    }

    private static void closeConnection(HttpClientConnection httpClientConnection) {
        try {
            httpClientConnection.close();
        } catch (IOException e) {
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:2:0x0012, code lost:
        r1 = r5.getStatusLine().getStatusCode();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean canResponseHaveBody(org.apache.http.HttpRequest r4, org.apache.http.HttpResponse r5) {
        /*
            r3 = this;
            r0 = 0
            java.lang.String r1 = "HEAD"
            org.apache.http.RequestLine r2 = r4.getRequestLine()
            java.lang.String r2 = r2.getMethod()
            boolean r1 = r1.equalsIgnoreCase(r2)
            if (r1 == 0) goto L_0x0012
        L_0x0011:
            return r0
        L_0x0012:
            org.apache.http.StatusLine r1 = r5.getStatusLine()
            int r1 = r1.getStatusCode()
            r2 = 200(0xc8, float:2.8E-43)
            if (r1 < r2) goto L_0x0011
            r2 = 204(0xcc, float:2.86E-43)
            if (r1 == r2) goto L_0x0011
            r2 = 304(0x130, float:4.26E-43)
            if (r1 == r2) goto L_0x0011
            r2 = 205(0xcd, float:2.87E-43)
            if (r1 == r2) goto L_0x0011
            r0 = 1
            goto L_0x0011
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.protocol.HttpRequestExecutor.canResponseHaveBody(org.apache.http.HttpRequest, org.apache.http.HttpResponse):boolean");
    }

    /* access modifiers changed from: protected */
    public HttpResponse doReceiveResponse(HttpRequest httpRequest, HttpClientConnection httpClientConnection, HttpContext httpContext) throws HttpException, IOException {
        Args.notNull(httpRequest, "HTTP request");
        Args.notNull(httpClientConnection, "Client connection");
        Args.notNull(httpContext, "HTTP context");
        HttpResponse httpResponse = null;
        int i = 0;
        while (true) {
            if (httpResponse != null && i >= 200) {
                return httpResponse;
            }
            httpResponse = httpClientConnection.receiveResponseHeader();
            if (canResponseHaveBody(httpRequest, httpResponse)) {
                httpClientConnection.receiveResponseEntity(httpResponse);
            }
            i = httpResponse.getStatusLine().getStatusCode();
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x0085  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public org.apache.http.HttpResponse doSendRequest(org.apache.http.HttpRequest r6, org.apache.http.HttpClientConnection r7, org.apache.http.protocol.HttpContext r8) throws java.io.IOException, org.apache.http.HttpException {
        /*
            r5 = this;
            r1 = 0
            java.lang.String r0 = "HTTP request"
            org.apache.http.util.Args.notNull(r6, r0)
            java.lang.String r0 = "Client connection"
            org.apache.http.util.Args.notNull(r7, r0)
            java.lang.String r0 = "HTTP context"
            org.apache.http.util.Args.notNull(r8, r0)
            java.lang.String r0 = "http.connection"
            r8.setAttribute(r0, r7)
            java.lang.String r0 = "http.request_sent"
            java.lang.Boolean r2 = java.lang.Boolean.FALSE
            r8.setAttribute(r0, r2)
            r7.sendRequestHeader(r6)
            boolean r0 = r6 instanceof org.apache.http.HttpEntityEnclosingRequest
            if (r0 == 0) goto L_0x009a
            r2 = 1
            org.apache.http.RequestLine r0 = r6.getRequestLine()
            org.apache.http.ProtocolVersion r3 = r0.getProtocolVersion()
            r0 = r6
            org.apache.http.HttpEntityEnclosingRequest r0 = (org.apache.http.HttpEntityEnclosingRequest) r0
            boolean r0 = r0.expectContinue()
            if (r0 == 0) goto L_0x0098
            org.apache.http.HttpVersion r0 = org.apache.http.HttpVersion.HTTP_1_0
            boolean r0 = r3.lessEquals(r0)
            if (r0 != 0) goto L_0x0098
            r7.flush()
            int r0 = r5.waitForContinue
            boolean r0 = r7.isResponseAvailable(r0)
            if (r0 == 0) goto L_0x0098
            org.apache.http.HttpResponse r0 = r7.receiveResponseHeader()
            boolean r3 = r5.canResponseHaveBody(r6, r0)
            if (r3 == 0) goto L_0x0055
            r7.receiveResponseEntity(r0)
        L_0x0055:
            org.apache.http.StatusLine r3 = r0.getStatusLine()
            int r3 = r3.getStatusCode()
            r4 = 200(0xc8, float:2.8E-43)
            if (r3 >= r4) goto L_0x0095
            r4 = 100
            if (r3 == r4) goto L_0x0082
            org.apache.http.ProtocolException r1 = new org.apache.http.ProtocolException
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "Unexpected response: "
            java.lang.StringBuilder r2 = r2.append(r3)
            org.apache.http.StatusLine r0 = r0.getStatusLine()
            java.lang.StringBuilder r0 = r2.append(r0)
            java.lang.String r0 = r0.toString()
            r1.<init>(r0)
            throw r1
        L_0x0082:
            r0 = r1
        L_0x0083:
            if (r2 == 0) goto L_0x008a
            org.apache.http.HttpEntityEnclosingRequest r6 = (org.apache.http.HttpEntityEnclosingRequest) r6
            r7.sendRequestEntity(r6)
        L_0x008a:
            r7.flush()
            java.lang.String r1 = "http.request_sent"
            java.lang.Boolean r2 = java.lang.Boolean.TRUE
            r8.setAttribute(r1, r2)
            return r0
        L_0x0095:
            r1 = 0
            r2 = r1
            goto L_0x0083
        L_0x0098:
            r0 = r1
            goto L_0x0083
        L_0x009a:
            r0 = r1
            goto L_0x008a
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.protocol.HttpRequestExecutor.doSendRequest(org.apache.http.HttpRequest, org.apache.http.HttpClientConnection, org.apache.http.protocol.HttpContext):org.apache.http.HttpResponse");
    }

    public HttpResponse execute(HttpRequest httpRequest, HttpClientConnection httpClientConnection, HttpContext httpContext) throws IOException, HttpException {
        Args.notNull(httpRequest, "HTTP request");
        Args.notNull(httpClientConnection, "Client connection");
        Args.notNull(httpContext, "HTTP context");
        try {
            HttpResponse doSendRequest = doSendRequest(httpRequest, httpClientConnection, httpContext);
            return doSendRequest == null ? doReceiveResponse(httpRequest, httpClientConnection, httpContext) : doSendRequest;
        } catch (IOException e) {
            closeConnection(httpClientConnection);
            throw e;
        } catch (HttpException e2) {
            closeConnection(httpClientConnection);
            throw e2;
        } catch (RuntimeException e3) {
            closeConnection(httpClientConnection);
            throw e3;
        }
    }

    public void postProcess(HttpResponse httpResponse, HttpProcessor httpProcessor, HttpContext httpContext) throws HttpException, IOException {
        Args.notNull(httpResponse, "HTTP response");
        Args.notNull(httpProcessor, "HTTP processor");
        Args.notNull(httpContext, "HTTP context");
        httpContext.setAttribute("http.response", httpResponse);
        httpProcessor.process(httpResponse, httpContext);
    }

    public void preProcess(HttpRequest httpRequest, HttpProcessor httpProcessor, HttpContext httpContext) throws HttpException, IOException {
        Args.notNull(httpRequest, "HTTP request");
        Args.notNull(httpProcessor, "HTTP processor");
        Args.notNull(httpContext, "HTTP context");
        httpContext.setAttribute("http.request", httpRequest);
        httpProcessor.process(httpRequest, httpContext);
    }
}
