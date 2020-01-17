package org.apache.http.impl.execchain;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthState;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.client.protocol.RequestClientConnControl;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.routing.BasicRouteDirector;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRouteDirector;
import org.apache.http.conn.routing.RouteTracker;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.impl.auth.HttpAuthenticator;
import org.apache.http.message.BasicHttpRequest;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.protocol.ImmutableHttpProcessor;
import org.apache.http.protocol.RequestTargetHost;
import org.apache.http.util.Args;
import org.apache.http.util.EntityUtils;

@Immutable
public class MainClientExec implements ClientExecChain {
    private final HttpAuthenticator authenticator;
    private final HttpClientConnectionManager connManager;
    private final ConnectionKeepAliveStrategy keepAliveStrategy;
    private final Log log = LogFactory.getLog(getClass());
    private final AuthenticationStrategy proxyAuthStrategy;
    private final HttpProcessor proxyHttpProcessor;
    private final HttpRequestExecutor requestExecutor;
    private final ConnectionReuseStrategy reuseStrategy;
    private final HttpRouteDirector routeDirector;
    private final AuthenticationStrategy targetAuthStrategy;
    private final UserTokenHandler userTokenHandler;

    public MainClientExec(HttpRequestExecutor httpRequestExecutor, HttpClientConnectionManager httpClientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy, AuthenticationStrategy authenticationStrategy, AuthenticationStrategy authenticationStrategy2, UserTokenHandler userTokenHandler2) {
        Args.notNull(httpRequestExecutor, "HTTP request executor");
        Args.notNull(httpClientConnectionManager, "Client connection manager");
        Args.notNull(connectionReuseStrategy, "Connection reuse strategy");
        Args.notNull(connectionKeepAliveStrategy, "Connection keep alive strategy");
        Args.notNull(authenticationStrategy, "Target authentication strategy");
        Args.notNull(authenticationStrategy2, "Proxy authentication strategy");
        Args.notNull(userTokenHandler2, "User token handler");
        this.authenticator = new HttpAuthenticator();
        this.proxyHttpProcessor = new ImmutableHttpProcessor(new RequestTargetHost(), new RequestClientConnControl());
        this.routeDirector = new BasicRouteDirector();
        this.requestExecutor = httpRequestExecutor;
        this.connManager = httpClientConnectionManager;
        this.reuseStrategy = connectionReuseStrategy;
        this.keepAliveStrategy = connectionKeepAliveStrategy;
        this.targetAuthStrategy = authenticationStrategy;
        this.proxyAuthStrategy = authenticationStrategy2;
        this.userTokenHandler = userTokenHandler2;
    }

    private boolean createTunnelToProxy(HttpRoute httpRoute, int i, HttpClientContext httpClientContext) throws HttpException {
        throw new HttpException("Proxy chains are not supported.");
    }

    private boolean createTunnelToTarget(AuthState authState, HttpClientConnection httpClientConnection, HttpRoute httpRoute, HttpRequest httpRequest, HttpClientContext httpClientContext) throws HttpException, IOException {
        HttpResponse execute;
        RequestConfig requestConfig = httpClientContext.getRequestConfig();
        int connectTimeout = requestConfig.getConnectTimeout();
        HttpHost targetHost = httpRoute.getTargetHost();
        HttpHost proxyHost = httpRoute.getProxyHost();
        BasicHttpRequest basicHttpRequest = new BasicHttpRequest("CONNECT", targetHost.toHostString(), httpRequest.getProtocolVersion());
        this.requestExecutor.preProcess(basicHttpRequest, this.proxyHttpProcessor, httpClientContext);
        while (true) {
            if (!httpClientConnection.isOpen()) {
                this.connManager.connect(httpClientConnection, httpRoute, connectTimeout > 0 ? connectTimeout : 0, httpClientContext);
            }
            basicHttpRequest.removeHeaders("Proxy-Authorization");
            this.authenticator.generateAuthResponse(basicHttpRequest, authState, httpClientContext);
            execute = this.requestExecutor.execute(basicHttpRequest, httpClientConnection, httpClientContext);
            if (execute.getStatusLine().getStatusCode() < 200) {
                throw new HttpException("Unexpected response to CONNECT request: " + execute.getStatusLine());
            } else if (requestConfig.isAuthenticationEnabled()) {
                if (this.authenticator.isAuthenticationRequested(proxyHost, execute, this.proxyAuthStrategy, authState, httpClientContext) && this.authenticator.handleAuthChallenge(proxyHost, execute, this.proxyAuthStrategy, authState, httpClientContext)) {
                    if (this.reuseStrategy.keepAlive(execute, httpClientContext)) {
                        this.log.debug("Connection kept alive");
                        EntityUtils.consume(execute.getEntity());
                    } else {
                        httpClientConnection.close();
                    }
                }
            }
        }
        if (execute.getStatusLine().getStatusCode() <= 299) {
            return false;
        }
        HttpEntity entity = execute.getEntity();
        if (entity != null) {
            execute.setEntity(new BufferedHttpEntity(entity));
        }
        httpClientConnection.close();
        throw new TunnelRefusedException("CONNECT refused by proxy: " + execute.getStatusLine(), execute);
    }

    private boolean needAuthentication(AuthState authState, AuthState authState2, HttpRoute httpRoute, HttpResponse httpResponse, HttpClientContext httpClientContext) {
        if (httpClientContext.getRequestConfig().isAuthenticationEnabled()) {
            HttpHost targetHost = httpClientContext.getTargetHost();
            if (targetHost == null) {
                targetHost = httpRoute.getTargetHost();
            }
            HttpHost httpHost = targetHost.getPort() < 0 ? new HttpHost(targetHost.getHostName(), httpRoute.getTargetHost().getPort(), targetHost.getSchemeName()) : targetHost;
            boolean isAuthenticationRequested = this.authenticator.isAuthenticationRequested(httpHost, httpResponse, this.targetAuthStrategy, authState, httpClientContext);
            HttpHost proxyHost = httpRoute.getProxyHost();
            if (proxyHost == null) {
                proxyHost = httpRoute.getTargetHost();
            }
            boolean isAuthenticationRequested2 = this.authenticator.isAuthenticationRequested(proxyHost, httpResponse, this.proxyAuthStrategy, authState2, httpClientContext);
            if (isAuthenticationRequested) {
                return this.authenticator.handleAuthChallenge(httpHost, httpResponse, this.targetAuthStrategy, authState, httpClientContext);
            } else if (isAuthenticationRequested2) {
                return this.authenticator.handleAuthChallenge(proxyHost, httpResponse, this.proxyAuthStrategy, authState2, httpClientContext);
            }
        }
        return false;
    }

    /* access modifiers changed from: package-private */
    public void establishRoute(AuthState authState, HttpClientConnection httpClientConnection, HttpRoute httpRoute, HttpRequest httpRequest, HttpClientContext httpClientContext) throws HttpException, IOException {
        int nextStep;
        int connectTimeout = httpClientContext.getRequestConfig().getConnectTimeout();
        RouteTracker routeTracker = new RouteTracker(httpRoute);
        do {
            HttpRoute route = routeTracker.toRoute();
            nextStep = this.routeDirector.nextStep(httpRoute, route);
            switch (nextStep) {
                case -1:
                    throw new HttpException("Unable to establish route: planned = " + httpRoute + "; current = " + route);
                case 0:
                    this.connManager.routeComplete(httpClientConnection, httpRoute, httpClientContext);
                    continue;
                case 1:
                    this.connManager.connect(httpClientConnection, httpRoute, connectTimeout > 0 ? connectTimeout : 0, httpClientContext);
                    routeTracker.connectTarget(httpRoute.isSecure());
                    continue;
                case 2:
                    this.connManager.connect(httpClientConnection, httpRoute, connectTimeout > 0 ? connectTimeout : 0, httpClientContext);
                    routeTracker.connectProxy(httpRoute.getProxyHost(), false);
                    continue;
                case 3:
                    boolean createTunnelToTarget = createTunnelToTarget(authState, httpClientConnection, httpRoute, httpRequest, httpClientContext);
                    this.log.debug("Tunnel to target created.");
                    routeTracker.tunnelTarget(createTunnelToTarget);
                    continue;
                case 4:
                    int hopCount = route.getHopCount() - 1;
                    boolean createTunnelToProxy = createTunnelToProxy(httpRoute, hopCount, httpClientContext);
                    this.log.debug("Tunnel to proxy created.");
                    routeTracker.tunnelProxy(httpRoute.getHopTarget(hopCount), createTunnelToProxy);
                    continue;
                case 5:
                    this.connManager.upgrade(httpClientConnection, httpRoute, httpClientContext);
                    routeTracker.layerProtocol(httpRoute.isSecure());
                    continue;
                default:
                    throw new IllegalStateException("Unknown step indicator " + nextStep + " from RouteDirector.");
            }
        } while (nextStep > 0);
    }

    /* JADX WARNING: type inference failed for: r3v2, types: [java.lang.Throwable] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public org.apache.http.client.methods.CloseableHttpResponse execute(org.apache.http.conn.routing.HttpRoute r19, org.apache.http.client.methods.HttpRequestWrapper r20, org.apache.http.client.protocol.HttpClientContext r21, org.apache.http.client.methods.HttpExecutionAware r22) throws java.io.IOException, org.apache.http.HttpException {
        /*
            r18 = this;
            java.lang.String r2 = "HTTP route"
            r0 = r19
            org.apache.http.util.Args.notNull(r0, r2)
            java.lang.String r2 = "HTTP request"
            r0 = r20
            org.apache.http.util.Args.notNull(r0, r2)
            java.lang.String r2 = "HTTP context"
            r0 = r21
            org.apache.http.util.Args.notNull(r0, r2)
            org.apache.http.auth.AuthState r2 = r21.getTargetAuthState()
            if (r2 != 0) goto L_0x0369
            org.apache.http.auth.AuthState r2 = new org.apache.http.auth.AuthState
            r2.<init>()
            java.lang.String r3 = "http.auth.target-scope"
            r0 = r21
            r0.setAttribute(r3, r2)
            r11 = r2
        L_0x0028:
            org.apache.http.auth.AuthState r3 = r21.getProxyAuthState()
            if (r3 != 0) goto L_0x003a
            org.apache.http.auth.AuthState r3 = new org.apache.http.auth.AuthState
            r3.<init>()
            java.lang.String r2 = "http.auth.proxy-scope"
            r0 = r21
            r0.setAttribute(r2, r3)
        L_0x003a:
            r0 = r20
            boolean r2 = r0 instanceof org.apache.http.HttpEntityEnclosingRequest
            if (r2 == 0) goto L_0x0047
            r2 = r20
            org.apache.http.HttpEntityEnclosingRequest r2 = (org.apache.http.HttpEntityEnclosingRequest) r2
            org.apache.http.impl.execchain.Proxies.enhanceEntity(r2)
        L_0x0047:
            java.lang.Object r13 = r21.getUserToken()
            r0 = r18
            org.apache.http.conn.HttpClientConnectionManager r2 = r0.connManager
            r0 = r19
            org.apache.http.conn.ConnectionRequest r2 = r2.requestConnection(r0, r13)
            if (r22 == 0) goto L_0x006d
            boolean r4 = r22.isAborted()
            if (r4 == 0) goto L_0x0068
            r2.cancel()
            org.apache.http.impl.execchain.RequestAbortedException r2 = new org.apache.http.impl.execchain.RequestAbortedException
            java.lang.String r3 = "Request aborted"
            r2.<init>(r3)
            throw r2
        L_0x0068:
            r0 = r22
            r0.setCancellable(r2)
        L_0x006d:
            org.apache.http.client.config.RequestConfig r14 = r21.getRequestConfig()
            int r4 = r14.getConnectionRequestTimeout()     // Catch:{ InterruptedException -> 0x00e2, ExecutionException -> 0x00f2 }
            if (r4 <= 0) goto L_0x00df
            long r4 = (long) r4     // Catch:{ InterruptedException -> 0x00e2, ExecutionException -> 0x00f2 }
        L_0x0078:
            java.util.concurrent.TimeUnit r6 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ InterruptedException -> 0x00e2, ExecutionException -> 0x00f2 }
            org.apache.http.HttpClientConnection r4 = r2.get(r4, r6)     // Catch:{ InterruptedException -> 0x00e2, ExecutionException -> 0x00f2 }
            java.lang.String r2 = "http.connection"
            r0 = r21
            r0.setAttribute(r2, r4)
            boolean r2 = r14.isStaleConnectionCheckEnabled()
            if (r2 == 0) goto L_0x00ac
            boolean r2 = r4.isOpen()
            if (r2 == 0) goto L_0x00ac
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log
            java.lang.String r5 = "Stale connection check"
            r2.debug(r5)
            boolean r2 = r4.isStale()
            if (r2 == 0) goto L_0x00ac
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log
            java.lang.String r5 = "Stale connection detected"
            r2.debug(r5)
            r4.close()
        L_0x00ac:
            org.apache.http.impl.execchain.ConnectionHolder r15 = new org.apache.http.impl.execchain.ConnectionHolder
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log
            r0 = r18
            org.apache.http.conn.HttpClientConnectionManager r5 = r0.connManager
            r15.<init>(r2, r5, r4)
            if (r22 == 0) goto L_0x00c0
            r0 = r22
            r0.setCancellable(r15)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x00c0:
            r2 = 1
            r12 = r2
        L_0x00c2:
            r2 = 1
            if (r12 <= r2) goto L_0x0101
            boolean r2 = org.apache.http.impl.execchain.Proxies.isRepeatable(r20)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != 0) goto L_0x0101
            org.apache.http.client.NonRepeatableRequestException r2 = new org.apache.http.client.NonRepeatableRequestException     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r3 = "Cannot retry request with a non-repeatable request entity."
            r2.<init>(r3)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            throw r2     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x00d3:
            r2 = move-exception
            java.io.InterruptedIOException r3 = new java.io.InterruptedIOException
            java.lang.String r4 = "Connection has been shut down"
            r3.<init>(r4)
            r3.initCause(r2)
            throw r3
        L_0x00df:
            r4 = 0
            goto L_0x0078
        L_0x00e2:
            r2 = move-exception
            java.lang.Thread r3 = java.lang.Thread.currentThread()
            r3.interrupt()
            org.apache.http.impl.execchain.RequestAbortedException r3 = new org.apache.http.impl.execchain.RequestAbortedException
            java.lang.String r4 = "Request aborted"
            r3.<init>(r4, r2)
            throw r3
        L_0x00f2:
            r2 = move-exception
            java.lang.Throwable r3 = r2.getCause()
            if (r3 != 0) goto L_0x0366
        L_0x00f9:
            org.apache.http.impl.execchain.RequestAbortedException r3 = new org.apache.http.impl.execchain.RequestAbortedException
            java.lang.String r4 = "Request execution failed"
            r3.<init>(r4, r2)
            throw r3
        L_0x0101:
            if (r22 == 0) goto L_0x0116
            boolean r2 = r22.isAborted()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x0116
            org.apache.http.impl.execchain.RequestAbortedException r2 = new org.apache.http.impl.execchain.RequestAbortedException     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r3 = "Request aborted"
            r2.<init>(r3)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            throw r2     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x0111:
            r2 = move-exception
            r15.abortConnection()
            throw r2
        L_0x0116:
            boolean r2 = r4.isOpen()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != 0) goto L_0x0143
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r5.<init>()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r6 = "Opening connection "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r19
            java.lang.StringBuilder r5 = r5.append(r0)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = r5.toString()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r2.debug(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r2 = r18
            r5 = r19
            r6 = r20
            r7 = r21
            r2.establishRoute(r3, r4, r5, r6, r7)     // Catch:{ TunnelRefusedException -> 0x0161 }
        L_0x0143:
            int r2 = r14.getSocketTimeout()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 < 0) goto L_0x014c
            r4.setSocketTimeout(r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x014c:
            if (r22 == 0) goto L_0x01a8
            boolean r2 = r22.isAborted()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x01a8
            org.apache.http.impl.execchain.RequestAbortedException r2 = new org.apache.http.impl.execchain.RequestAbortedException     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r3 = "Request aborted"
            r2.<init>(r3)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            throw r2     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x015c:
            r2 = move-exception
            r15.abortConnection()
            throw r2
        L_0x0161:
            r2 = move-exception
            r0 = r18
            org.apache.commons.logging.Log r3 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            boolean r3 = r3.isDebugEnabled()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r3 == 0) goto L_0x0177
            r0 = r18
            org.apache.commons.logging.Log r3 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r4 = r2.getMessage()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r3.debug(r4)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x0177:
            org.apache.http.HttpResponse r9 = r2.getResponse()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x017b:
            if (r13 != 0) goto L_0x0363
            r0 = r18
            org.apache.http.client.UserTokenHandler r2 = r0.userTokenHandler     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r21
            java.lang.Object r2 = r2.getUserToken(r0)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r3 = "http.user-token"
            r0 = r21
            r0.setAttribute(r3, r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x018e:
            if (r2 == 0) goto L_0x0193
            r15.setState(r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x0193:
            org.apache.http.HttpEntity r2 = r9.getEntity()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x019f
            boolean r2 = r2.isStreaming()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != 0) goto L_0x035d
        L_0x019f:
            r15.releaseConnection()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r2 = 0
            org.apache.http.client.methods.CloseableHttpResponse r2 = org.apache.http.impl.execchain.Proxies.enhanceResponse(r9, r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x01a7:
            return r2
        L_0x01a8:
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            boolean r2 = r2.isDebugEnabled()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x01d0
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r5.<init>()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r6 = "Executing request "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            org.apache.http.RequestLine r6 = r20.getRequestLine()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = r5.toString()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r2.debug(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x01d0:
            java.lang.String r2 = "Authorization"
            r0 = r20
            boolean r2 = r0.containsHeader(r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != 0) goto L_0x020d
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            boolean r2 = r2.isDebugEnabled()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x0202
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r5.<init>()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r6 = "Target auth state: "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            org.apache.http.auth.AuthProtocolState r6 = r11.getState()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = r5.toString()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r2.debug(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x0202:
            r0 = r18
            org.apache.http.impl.auth.HttpAuthenticator r2 = r0.authenticator     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r20
            r1 = r21
            r2.generateAuthResponse(r0, r11, r1)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x020d:
            java.lang.String r2 = "Proxy-Authorization"
            r0 = r20
            boolean r2 = r0.containsHeader(r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != 0) goto L_0x0250
            boolean r2 = r19.isTunnelled()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != 0) goto L_0x0250
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            boolean r2 = r2.isDebugEnabled()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x0245
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r5.<init>()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r6 = "Proxy auth state: "
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            org.apache.http.auth.AuthProtocolState r6 = r3.getState()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = r5.toString()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r2.debug(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x0245:
            r0 = r18
            org.apache.http.impl.auth.HttpAuthenticator r2 = r0.authenticator     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r20
            r1 = r21
            r2.generateAuthResponse(r0, r3, r1)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x0250:
            r0 = r18
            org.apache.http.protocol.HttpRequestExecutor r2 = r0.requestExecutor     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r20
            r1 = r21
            org.apache.http.HttpResponse r9 = r2.execute(r0, r4, r1)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r18
            org.apache.http.ConnectionReuseStrategy r2 = r0.reuseStrategy     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r21
            boolean r2 = r2.keepAlive(r9, r0)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x0308
            r0 = r18
            org.apache.http.conn.ConnectionKeepAliveStrategy r2 = r0.keepAliveStrategy     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r21
            long r6 = r2.getKeepAliveDuration(r9, r0)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            boolean r2 = r2.isDebugEnabled()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x02bb
            r16 = 0
            int r2 = (r6 > r16 ? 1 : (r6 == r16 ? 0 : -1))
            if (r2 <= 0) goto L_0x0305
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r2.<init>()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = "for "
            java.lang.StringBuilder r2 = r2.append(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r2 = r2.append(r6)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = " "
            java.lang.StringBuilder r2 = r2.append(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.util.concurrent.TimeUnit r5 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r2 = r2.append(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r2 = r2.toString()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x02a1:
            r0 = r18
            org.apache.commons.logging.Log r5 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r8.<init>()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r10 = "Connection can be kept alive "
            java.lang.StringBuilder r8 = r8.append(r10)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.StringBuilder r2 = r8.append(r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r2 = r2.toString()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r5.debug(r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x02bb:
            java.util.concurrent.TimeUnit r2 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r15.setValidFor(r6, r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r15.markReusable()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x02c3:
            r5 = r18
            r6 = r11
            r7 = r3
            r8 = r19
            r10 = r21
            boolean r2 = r5.needAuthentication(r6, r7, r8, r9, r10)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x017b
            org.apache.http.HttpEntity r2 = r9.getEntity()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            boolean r5 = r15.isReusable()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r5 == 0) goto L_0x0311
            org.apache.http.util.EntityUtils.consume(r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x02de:
            org.apache.http.HttpRequest r2 = r20.getOriginal()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = "Authorization"
            boolean r5 = r2.containsHeader(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r5 != 0) goto L_0x02f1
            java.lang.String r5 = "Authorization"
            r0 = r20
            r0.removeHeaders(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x02f1:
            java.lang.String r5 = "Proxy-Authorization"
            boolean r2 = r2.containsHeader(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != 0) goto L_0x0300
            java.lang.String r2 = "Proxy-Authorization"
            r0 = r20
            r0.removeHeaders(r2)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x0300:
            int r2 = r12 + 1
            r12 = r2
            goto L_0x00c2
        L_0x0305:
            java.lang.String r2 = "indefinitely"
            goto L_0x02a1
        L_0x0308:
            r15.markNonReusable()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            goto L_0x02c3
        L_0x030c:
            r2 = move-exception
            r15.abortConnection()
            throw r2
        L_0x0311:
            r4.close()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            org.apache.http.auth.AuthProtocolState r2 = r3.getState()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            org.apache.http.auth.AuthProtocolState r5 = org.apache.http.auth.AuthProtocolState.SUCCESS     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != r5) goto L_0x0338
            org.apache.http.auth.AuthScheme r2 = r3.getAuthScheme()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x0338
            org.apache.http.auth.AuthScheme r2 = r3.getAuthScheme()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            boolean r2 = r2.isConnectionBased()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x0338
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = "Resetting proxy auth state"
            r2.debug(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r3.reset()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
        L_0x0338:
            org.apache.http.auth.AuthProtocolState r2 = r11.getState()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            org.apache.http.auth.AuthProtocolState r5 = org.apache.http.auth.AuthProtocolState.SUCCESS     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 != r5) goto L_0x02de
            org.apache.http.auth.AuthScheme r2 = r11.getAuthScheme()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x02de
            org.apache.http.auth.AuthScheme r2 = r11.getAuthScheme()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            boolean r2 = r2.isConnectionBased()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            if (r2 == 0) goto L_0x02de
            r0 = r18
            org.apache.commons.logging.Log r2 = r0.log     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            java.lang.String r5 = "Resetting target auth state"
            r2.debug(r5)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            r11.reset()     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            goto L_0x02de
        L_0x035d:
            org.apache.http.client.methods.CloseableHttpResponse r2 = org.apache.http.impl.execchain.Proxies.enhanceResponse(r9, r15)     // Catch:{ ConnectionShutdownException -> 0x00d3, HttpException -> 0x0111, IOException -> 0x015c, RuntimeException -> 0x030c }
            goto L_0x01a7
        L_0x0363:
            r2 = r13
            goto L_0x018e
        L_0x0366:
            r2 = r3
            goto L_0x00f9
        L_0x0369:
            r11 = r2
            goto L_0x0028
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.execchain.MainClientExec.execute(org.apache.http.conn.routing.HttpRoute, org.apache.http.client.methods.HttpRequestWrapper, org.apache.http.client.protocol.HttpClientContext, org.apache.http.client.methods.HttpExecutionAware):org.apache.http.client.methods.CloseableHttpResponse");
    }
}
