package org.apache.http.protocol;

import java.io.IOException;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseFactory;
import org.apache.http.HttpStatus;
import org.apache.http.MethodNotSupportedException;
import org.apache.http.ProtocolException;
import org.apache.http.UnsupportedHttpVersionException;
import org.apache.http.annotation.Immutable;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.DefaultConnectionReuseStrategy;
import org.apache.http.impl.DefaultHttpResponseFactory;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.EncodingUtils;

@Immutable
public class HttpService {
    private volatile ConnectionReuseStrategy connStrategy;
    private volatile HttpExpectationVerifier expectationVerifier;
    private volatile HttpRequestHandlerMapper handlerMapper;
    private volatile HttpParams params;
    private volatile HttpProcessor processor;
    private volatile HttpResponseFactory responseFactory;

    @Deprecated
    private static class HttpRequestHandlerResolverAdapter implements HttpRequestHandlerMapper {
        private final HttpRequestHandlerResolver resolver;

        public HttpRequestHandlerResolverAdapter(HttpRequestHandlerResolver httpRequestHandlerResolver) {
            this.resolver = httpRequestHandlerResolver;
        }

        public HttpRequestHandler lookup(HttpRequest httpRequest) {
            return this.resolver.lookup(httpRequest.getRequestLine().getUri());
        }
    }

    @Deprecated
    public HttpService(HttpProcessor httpProcessor, ConnectionReuseStrategy connectionReuseStrategy, HttpResponseFactory httpResponseFactory) {
        this.params = null;
        this.processor = null;
        this.handlerMapper = null;
        this.connStrategy = null;
        this.responseFactory = null;
        this.expectationVerifier = null;
        setHttpProcessor(httpProcessor);
        setConnReuseStrategy(connectionReuseStrategy);
        setResponseFactory(httpResponseFactory);
    }

    public HttpService(HttpProcessor httpProcessor, ConnectionReuseStrategy connectionReuseStrategy, HttpResponseFactory httpResponseFactory, HttpRequestHandlerMapper httpRequestHandlerMapper) {
        this(httpProcessor, connectionReuseStrategy, httpResponseFactory, httpRequestHandlerMapper, (HttpExpectationVerifier) null);
    }

    public HttpService(HttpProcessor httpProcessor, ConnectionReuseStrategy connectionReuseStrategy, HttpResponseFactory httpResponseFactory, HttpRequestHandlerMapper httpRequestHandlerMapper, HttpExpectationVerifier httpExpectationVerifier) {
        this.params = null;
        this.processor = null;
        this.handlerMapper = null;
        this.connStrategy = null;
        this.responseFactory = null;
        this.expectationVerifier = null;
        this.processor = (HttpProcessor) Args.notNull(httpProcessor, "HTTP processor");
        this.connStrategy = connectionReuseStrategy == null ? DefaultConnectionReuseStrategy.INSTANCE : connectionReuseStrategy;
        this.responseFactory = httpResponseFactory == null ? DefaultHttpResponseFactory.INSTANCE : httpResponseFactory;
        this.handlerMapper = httpRequestHandlerMapper;
        this.expectationVerifier = httpExpectationVerifier;
    }

    @Deprecated
    public HttpService(HttpProcessor httpProcessor, ConnectionReuseStrategy connectionReuseStrategy, HttpResponseFactory httpResponseFactory, HttpRequestHandlerResolver httpRequestHandlerResolver, HttpParams httpParams) {
        this(httpProcessor, connectionReuseStrategy, httpResponseFactory, (HttpRequestHandlerMapper) new HttpRequestHandlerResolverAdapter(httpRequestHandlerResolver), (HttpExpectationVerifier) null);
        this.params = httpParams;
    }

    @Deprecated
    public HttpService(HttpProcessor httpProcessor, ConnectionReuseStrategy connectionReuseStrategy, HttpResponseFactory httpResponseFactory, HttpRequestHandlerResolver httpRequestHandlerResolver, HttpExpectationVerifier httpExpectationVerifier, HttpParams httpParams) {
        this(httpProcessor, connectionReuseStrategy, httpResponseFactory, (HttpRequestHandlerMapper) new HttpRequestHandlerResolverAdapter(httpRequestHandlerResolver), httpExpectationVerifier);
        this.params = httpParams;
    }

    public HttpService(HttpProcessor httpProcessor, HttpRequestHandlerMapper httpRequestHandlerMapper) {
        this(httpProcessor, (ConnectionReuseStrategy) null, (HttpResponseFactory) null, httpRequestHandlerMapper, (HttpExpectationVerifier) null);
    }

    /* access modifiers changed from: protected */
    public void doService(HttpRequest httpRequest, HttpResponse httpResponse, HttpContext httpContext) throws HttpException, IOException {
        HttpRequestHandler httpRequestHandler = null;
        if (this.handlerMapper != null) {
            httpRequestHandler = this.handlerMapper.lookup(httpRequest);
        }
        if (httpRequestHandler != null) {
            httpRequestHandler.handle(httpRequest, httpResponse, httpContext);
        } else {
            httpResponse.setStatusCode(HttpStatus.SC_NOT_IMPLEMENTED);
        }
    }

    @Deprecated
    public HttpParams getParams() {
        return this.params;
    }

    /* access modifiers changed from: protected */
    public void handleException(HttpException httpException, HttpResponse httpResponse) {
        if (httpException instanceof MethodNotSupportedException) {
            httpResponse.setStatusCode(HttpStatus.SC_NOT_IMPLEMENTED);
        } else if (httpException instanceof UnsupportedHttpVersionException) {
            httpResponse.setStatusCode(HttpStatus.SC_HTTP_VERSION_NOT_SUPPORTED);
        } else if (httpException instanceof ProtocolException) {
            httpResponse.setStatusCode(HttpStatus.SC_BAD_REQUEST);
        } else {
            httpResponse.setStatusCode(HttpStatus.SC_INTERNAL_SERVER_ERROR);
        }
        String message = httpException.getMessage();
        if (message == null) {
            message = httpException.toString();
        }
        ByteArrayEntity byteArrayEntity = new ByteArrayEntity(EncodingUtils.getAsciiBytes(message));
        byteArrayEntity.setContentType("text/plain; charset=US-ASCII");
        httpResponse.setEntity(byteArrayEntity);
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x004e A[Catch:{ HttpException -> 0x009c }] */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0064 A[Catch:{ HttpException -> 0x009c }] */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0088  */
    /* JADX WARNING: Removed duplicated region for block: B:35:? A[RETURN, SYNTHETIC] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void handleRequest(org.apache.http.HttpServerConnection r10, org.apache.http.protocol.HttpContext r11) throws java.io.IOException, org.apache.http.HttpException {
        /*
            r9 = this;
            r4 = 0
            r8 = 500(0x1f4, float:7.0E-43)
            r7 = 200(0xc8, float:2.8E-43)
            java.lang.String r1 = "http.connection"
            r11.setAttribute(r1, r10)
            org.apache.http.HttpRequest r2 = r10.receiveRequestHeader()     // Catch:{ HttpException -> 0x009c }
            boolean r1 = r2 instanceof org.apache.http.HttpEntityEnclosingRequest     // Catch:{ HttpException -> 0x009c }
            if (r1 == 0) goto L_0x0046
            r0 = r2
            org.apache.http.HttpEntityEnclosingRequest r0 = (org.apache.http.HttpEntityEnclosingRequest) r0     // Catch:{ HttpException -> 0x009c }
            r1 = r0
            boolean r1 = r1.expectContinue()     // Catch:{ HttpException -> 0x009c }
            if (r1 == 0) goto L_0x00aa
            org.apache.http.HttpResponseFactory r1 = r9.responseFactory     // Catch:{ HttpException -> 0x009c }
            org.apache.http.HttpVersion r3 = org.apache.http.HttpVersion.HTTP_1_1     // Catch:{ HttpException -> 0x009c }
            r5 = 100
            org.apache.http.HttpResponse r1 = r1.newHttpResponse(r3, r5, r11)     // Catch:{ HttpException -> 0x009c }
            org.apache.http.protocol.HttpExpectationVerifier r3 = r9.expectationVerifier     // Catch:{ HttpException -> 0x009c }
            if (r3 == 0) goto L_0x002f
            org.apache.http.protocol.HttpExpectationVerifier r3 = r9.expectationVerifier     // Catch:{ HttpException -> 0x008c }
            r3.verify(r2, r1, r11)     // Catch:{ HttpException -> 0x008c }
        L_0x002f:
            org.apache.http.StatusLine r3 = r1.getStatusLine()     // Catch:{ HttpException -> 0x009c }
            int r3 = r3.getStatusCode()     // Catch:{ HttpException -> 0x009c }
            if (r3 >= r7) goto L_0x0047
            r10.sendResponseHeader(r1)     // Catch:{ HttpException -> 0x009c }
            r10.flush()     // Catch:{ HttpException -> 0x009c }
            r0 = r2
            org.apache.http.HttpEntityEnclosingRequest r0 = (org.apache.http.HttpEntityEnclosingRequest) r0     // Catch:{ HttpException -> 0x009c }
            r1 = r0
            r10.receiveRequestEntity(r1)     // Catch:{ HttpException -> 0x009c }
        L_0x0046:
            r1 = r4
        L_0x0047:
            java.lang.String r3 = "http.request"
            r11.setAttribute(r3, r2)     // Catch:{ HttpException -> 0x009c }
            if (r1 != 0) goto L_0x0060
            org.apache.http.HttpResponseFactory r1 = r9.responseFactory     // Catch:{ HttpException -> 0x009c }
            org.apache.http.HttpVersion r3 = org.apache.http.HttpVersion.HTTP_1_1     // Catch:{ HttpException -> 0x009c }
            r4 = 200(0xc8, float:2.8E-43)
            org.apache.http.HttpResponse r1 = r1.newHttpResponse(r3, r4, r11)     // Catch:{ HttpException -> 0x009c }
            org.apache.http.protocol.HttpProcessor r3 = r9.processor     // Catch:{ HttpException -> 0x009c }
            r3.process(r2, r11)     // Catch:{ HttpException -> 0x009c }
            r9.doService(r2, r1, r11)     // Catch:{ HttpException -> 0x009c }
        L_0x0060:
            boolean r3 = r2 instanceof org.apache.http.HttpEntityEnclosingRequest     // Catch:{ HttpException -> 0x009c }
            if (r3 == 0) goto L_0x006d
            org.apache.http.HttpEntityEnclosingRequest r2 = (org.apache.http.HttpEntityEnclosingRequest) r2     // Catch:{ HttpException -> 0x009c }
            org.apache.http.HttpEntity r2 = r2.getEntity()     // Catch:{ HttpException -> 0x009c }
            org.apache.http.util.EntityUtils.consume(r2)     // Catch:{ HttpException -> 0x009c }
        L_0x006d:
            java.lang.String r2 = "http.response"
            r11.setAttribute(r2, r1)
            org.apache.http.protocol.HttpProcessor r2 = r9.processor
            r2.process(r1, r11)
            r10.sendResponseHeader(r1)
            r10.sendResponseEntity(r1)
            r10.flush()
            org.apache.http.ConnectionReuseStrategy r2 = r9.connStrategy
            boolean r1 = r2.keepAlive(r1, r11)
            if (r1 != 0) goto L_0x008b
            r10.close()
        L_0x008b:
            return
        L_0x008c:
            r1 = move-exception
            r3 = r1
            org.apache.http.HttpResponseFactory r1 = r9.responseFactory     // Catch:{ HttpException -> 0x009c }
            org.apache.http.HttpVersion r5 = org.apache.http.HttpVersion.HTTP_1_0     // Catch:{ HttpException -> 0x009c }
            r6 = 500(0x1f4, float:7.0E-43)
            org.apache.http.HttpResponse r1 = r1.newHttpResponse(r5, r6, r11)     // Catch:{ HttpException -> 0x009c }
            r9.handleException(r3, r1)     // Catch:{ HttpException -> 0x009c }
            goto L_0x002f
        L_0x009c:
            r1 = move-exception
            r2 = r1
            org.apache.http.HttpResponseFactory r1 = r9.responseFactory
            org.apache.http.HttpVersion r3 = org.apache.http.HttpVersion.HTTP_1_0
            org.apache.http.HttpResponse r1 = r1.newHttpResponse(r3, r8, r11)
            r9.handleException(r2, r1)
            goto L_0x006d
        L_0x00aa:
            r0 = r2
            org.apache.http.HttpEntityEnclosingRequest r0 = (org.apache.http.HttpEntityEnclosingRequest) r0     // Catch:{ HttpException -> 0x009c }
            r1 = r0
            r10.receiveRequestEntity(r1)     // Catch:{ HttpException -> 0x009c }
            r1 = r4
            goto L_0x0047
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.protocol.HttpService.handleRequest(org.apache.http.HttpServerConnection, org.apache.http.protocol.HttpContext):void");
    }

    @Deprecated
    public void setConnReuseStrategy(ConnectionReuseStrategy connectionReuseStrategy) {
        Args.notNull(connectionReuseStrategy, "Connection reuse strategy");
        this.connStrategy = connectionReuseStrategy;
    }

    @Deprecated
    public void setExpectationVerifier(HttpExpectationVerifier httpExpectationVerifier) {
        this.expectationVerifier = httpExpectationVerifier;
    }

    @Deprecated
    public void setHandlerResolver(HttpRequestHandlerResolver httpRequestHandlerResolver) {
        this.handlerMapper = new HttpRequestHandlerResolverAdapter(httpRequestHandlerResolver);
    }

    @Deprecated
    public void setHttpProcessor(HttpProcessor httpProcessor) {
        Args.notNull(httpProcessor, "HTTP processor");
        this.processor = httpProcessor;
    }

    @Deprecated
    public void setParams(HttpParams httpParams) {
        this.params = httpParams;
    }

    @Deprecated
    public void setResponseFactory(HttpResponseFactory httpResponseFactory) {
        Args.notNull(httpResponseFactory, "Response factory");
        this.responseFactory = httpResponseFactory;
    }
}
