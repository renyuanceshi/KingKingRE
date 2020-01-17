package org.apache.http.impl.execchain;

import java.net.URI;
import java.net.URISyntaxException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpHost;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.protocol.RequestClientConnControl;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.protocol.ImmutableHttpProcessor;
import org.apache.http.protocol.RequestContent;
import org.apache.http.protocol.RequestTargetHost;
import org.apache.http.protocol.RequestUserAgent;
import org.apache.http.util.Args;
import org.apache.http.util.VersionInfo;

@Immutable
public class MinimalClientExec implements ClientExecChain {
    private final HttpClientConnectionManager connManager;
    private final HttpProcessor httpProcessor;
    private final ConnectionKeepAliveStrategy keepAliveStrategy;
    private final Log log = LogFactory.getLog(getClass());
    private final HttpRequestExecutor requestExecutor;
    private final ConnectionReuseStrategy reuseStrategy;

    public MinimalClientExec(HttpRequestExecutor httpRequestExecutor, HttpClientConnectionManager httpClientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy) {
        Args.notNull(httpRequestExecutor, "HTTP request executor");
        Args.notNull(httpClientConnectionManager, "Client connection manager");
        Args.notNull(connectionReuseStrategy, "Connection reuse strategy");
        Args.notNull(connectionKeepAliveStrategy, "Connection keep alive strategy");
        this.httpProcessor = new ImmutableHttpProcessor(new RequestContent(), new RequestTargetHost(), new RequestClientConnControl(), new RequestUserAgent(VersionInfo.getUserAgent("Apache-HttpClient", "org.apache.http.client", getClass())));
        this.requestExecutor = httpRequestExecutor;
        this.connManager = httpClientConnectionManager;
        this.reuseStrategy = connectionReuseStrategy;
        this.keepAliveStrategy = connectionKeepAliveStrategy;
    }

    static void rewriteRequestURI(HttpRequestWrapper httpRequestWrapper, HttpRoute httpRoute) throws ProtocolException {
        try {
            URI uri = httpRequestWrapper.getURI();
            if (uri != null) {
                httpRequestWrapper.setURI(uri.isAbsolute() ? URIUtils.rewriteURI(uri, (HttpHost) null, true) : URIUtils.rewriteURI(uri));
            }
        } catch (URISyntaxException e) {
            throw new ProtocolException("Invalid URI: " + httpRequestWrapper.getRequestLine().getUri(), e);
        }
    }

    /* JADX WARNING: type inference failed for: r1v1, types: [java.lang.Throwable] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00d3 A[Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }] */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x0103 A[Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }] */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x0129 A[Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }] */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public org.apache.http.client.methods.CloseableHttpResponse execute(org.apache.http.conn.routing.HttpRoute r7, org.apache.http.client.methods.HttpRequestWrapper r8, org.apache.http.client.protocol.HttpClientContext r9, org.apache.http.client.methods.HttpExecutionAware r10) throws java.io.IOException, org.apache.http.HttpException {
        /*
            r6 = this;
            r1 = 0
            java.lang.String r0 = "HTTP route"
            org.apache.http.util.Args.notNull(r7, r0)
            java.lang.String r0 = "HTTP request"
            org.apache.http.util.Args.notNull(r8, r0)
            java.lang.String r0 = "HTTP context"
            org.apache.http.util.Args.notNull(r9, r0)
            rewriteRequestURI(r8, r7)
            org.apache.http.conn.HttpClientConnectionManager r0 = r6.connManager
            org.apache.http.conn.ConnectionRequest r0 = r0.requestConnection(r7, r1)
            if (r10 == 0) goto L_0x002f
            boolean r2 = r10.isAborted()
            if (r2 == 0) goto L_0x002c
            r0.cancel()
            org.apache.http.impl.execchain.RequestAbortedException r0 = new org.apache.http.impl.execchain.RequestAbortedException
            java.lang.String r1 = "Request aborted"
            r0.<init>(r1)
            throw r0
        L_0x002c:
            r10.setCancellable(r0)
        L_0x002f:
            org.apache.http.client.config.RequestConfig r4 = r9.getRequestConfig()
            int r2 = r4.getConnectionRequestTimeout()     // Catch:{ InterruptedException -> 0x006b, ExecutionException -> 0x007b }
            if (r2 <= 0) goto L_0x0068
            long r2 = (long) r2     // Catch:{ InterruptedException -> 0x006b, ExecutionException -> 0x007b }
        L_0x003a:
            java.util.concurrent.TimeUnit r5 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ InterruptedException -> 0x006b, ExecutionException -> 0x007b }
            org.apache.http.HttpClientConnection r2 = r0.get(r2, r5)     // Catch:{ InterruptedException -> 0x006b, ExecutionException -> 0x007b }
            org.apache.http.impl.execchain.ConnectionHolder r3 = new org.apache.http.impl.execchain.ConnectionHolder
            org.apache.commons.logging.Log r0 = r6.log
            org.apache.http.conn.HttpClientConnectionManager r5 = r6.connManager
            r3.<init>(r0, r5, r2)
            if (r10 == 0) goto L_0x008d
            boolean r0 = r10.isAborted()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r0 == 0) goto L_0x008a
            r3.close()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            org.apache.http.impl.execchain.RequestAbortedException r0 = new org.apache.http.impl.execchain.RequestAbortedException     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            java.lang.String r1 = "Request aborted"
            r0.<init>(r1)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            throw r0     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
        L_0x005c:
            r0 = move-exception
            java.io.InterruptedIOException r1 = new java.io.InterruptedIOException
            java.lang.String r2 = "Connection has been shut down"
            r1.<init>(r2)
            r1.initCause(r0)
            throw r1
        L_0x0068:
            r2 = 0
            goto L_0x003a
        L_0x006b:
            r0 = move-exception
            java.lang.Thread r1 = java.lang.Thread.currentThread()
            r1.interrupt()
            org.apache.http.impl.execchain.RequestAbortedException r1 = new org.apache.http.impl.execchain.RequestAbortedException
            java.lang.String r2 = "Request aborted"
            r1.<init>(r2, r0)
            throw r1
        L_0x007b:
            r0 = move-exception
            java.lang.Throwable r1 = r0.getCause()
            if (r1 != 0) goto L_0x0143
        L_0x0082:
            org.apache.http.impl.execchain.RequestAbortedException r1 = new org.apache.http.impl.execchain.RequestAbortedException
            java.lang.String r2 = "Request execution failed"
            r1.<init>(r2, r0)
            throw r1
        L_0x008a:
            r10.setCancellable(r3)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
        L_0x008d:
            boolean r0 = r2.isOpen()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r0 != 0) goto L_0x00a3
            int r0 = r4.getConnectTimeout()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            org.apache.http.conn.HttpClientConnectionManager r5 = r6.connManager     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r0 <= 0) goto L_0x0126
        L_0x009b:
            r5.connect(r2, r7, r0, r9)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            org.apache.http.conn.HttpClientConnectionManager r0 = r6.connManager     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            r0.routeComplete(r2, r7, r9)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
        L_0x00a3:
            int r0 = r4.getSocketTimeout()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r0 < 0) goto L_0x00ac
            r2.setSocketTimeout(r0)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
        L_0x00ac:
            org.apache.http.HttpRequest r0 = r8.getOriginal()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            boolean r4 = r0 instanceof org.apache.http.client.methods.HttpUriRequest     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r4 == 0) goto L_0x0141
            org.apache.http.client.methods.HttpUriRequest r0 = (org.apache.http.client.methods.HttpUriRequest) r0     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            java.net.URI r4 = r0.getURI()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            boolean r0 = r4.isAbsolute()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r0 == 0) goto L_0x0141
            org.apache.http.HttpHost r0 = new org.apache.http.HttpHost     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            java.lang.String r1 = r4.getHost()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            int r5 = r4.getPort()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            java.lang.String r4 = r4.getScheme()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            r0.<init>((java.lang.String) r1, (int) r5, (java.lang.String) r4)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
        L_0x00d1:
            if (r0 != 0) goto L_0x00d7
            org.apache.http.HttpHost r0 = r7.getTargetHost()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
        L_0x00d7:
            java.lang.String r1 = "http.target_host"
            r9.setAttribute(r1, r0)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            java.lang.String r0 = "http.request"
            r9.setAttribute(r0, r8)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            java.lang.String r0 = "http.connection"
            r9.setAttribute(r0, r2)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            java.lang.String r0 = "http.route"
            r9.setAttribute(r0, r7)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            org.apache.http.protocol.HttpProcessor r0 = r6.httpProcessor     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            r0.process(r8, r9)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            org.apache.http.protocol.HttpRequestExecutor r0 = r6.requestExecutor     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            org.apache.http.HttpResponse r0 = r0.execute(r8, r2, r9)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            org.apache.http.protocol.HttpProcessor r1 = r6.httpProcessor     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            r1.process(r0, r9)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            org.apache.http.ConnectionReuseStrategy r1 = r6.reuseStrategy     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            boolean r1 = r1.keepAlive(r0, r9)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r1 == 0) goto L_0x0129
            org.apache.http.conn.ConnectionKeepAliveStrategy r1 = r6.keepAliveStrategy     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            long r4 = r1.getKeepAliveDuration(r0, r9)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            java.util.concurrent.TimeUnit r1 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            r3.setValidFor(r4, r1)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            r3.markReusable()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
        L_0x0111:
            org.apache.http.HttpEntity r1 = r0.getEntity()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r1 == 0) goto L_0x011d
            boolean r1 = r1.isStreaming()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            if (r1 != 0) goto L_0x0132
        L_0x011d:
            r3.releaseConnection()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            r1 = 0
            org.apache.http.client.methods.CloseableHttpResponse r0 = org.apache.http.impl.execchain.Proxies.enhanceResponse(r0, r1)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
        L_0x0125:
            return r0
        L_0x0126:
            r0 = 0
            goto L_0x009b
        L_0x0129:
            r3.markNonReusable()     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            goto L_0x0111
        L_0x012d:
            r0 = move-exception
            r3.abortConnection()
            throw r0
        L_0x0132:
            org.apache.http.client.methods.CloseableHttpResponse r0 = org.apache.http.impl.execchain.Proxies.enhanceResponse(r0, r3)     // Catch:{ ConnectionShutdownException -> 0x005c, HttpException -> 0x012d, IOException -> 0x0137, RuntimeException -> 0x013c }
            goto L_0x0125
        L_0x0137:
            r0 = move-exception
            r3.abortConnection()
            throw r0
        L_0x013c:
            r0 = move-exception
            r3.abortConnection()
            throw r0
        L_0x0141:
            r0 = r1
            goto L_0x00d1
        L_0x0143:
            r0 = r1
            goto L_0x0082
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.execchain.MinimalClientExec.execute(org.apache.http.conn.routing.HttpRoute, org.apache.http.client.methods.HttpRequestWrapper, org.apache.http.client.protocol.HttpClientContext, org.apache.http.client.methods.HttpExecutionAware):org.apache.http.client.methods.CloseableHttpResponse");
    }
}
