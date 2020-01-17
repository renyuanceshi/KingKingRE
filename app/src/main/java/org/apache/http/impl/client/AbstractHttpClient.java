package org.apache.http.impl.client;

import java.io.IOException;
import java.lang.reflect.UndeclaredThrowableException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.auth.AuthSchemeRegistry;
import org.apache.http.client.AuthenticationHandler;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.BackoffManager;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ConnectionBackoffStrategy;
import org.apache.http.client.CookieStore;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.RedirectStrategy;
import org.apache.http.client.RequestDirector;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.client.params.CookiePolicy;
import org.apache.http.client.params.HttpClientParamConfig;
import org.apache.http.client.protocol.ClientContext;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.cookie.CookieSpecRegistry;
import org.apache.http.impl.DefaultConnectionReuseStrategy;
import org.apache.http.impl.auth.BasicSchemeFactory;
import org.apache.http.impl.auth.DigestSchemeFactory;
import org.apache.http.impl.auth.KerberosSchemeFactory;
import org.apache.http.impl.auth.NTLMSchemeFactory;
import org.apache.http.impl.auth.SPNegoSchemeFactory;
import org.apache.http.impl.conn.DefaultHttpRoutePlanner;
import org.apache.http.impl.cookie.BestMatchSpecFactory;
import org.apache.http.impl.cookie.BrowserCompatSpecFactory;
import org.apache.http.impl.cookie.IgnoreSpecFactory;
import org.apache.http.impl.cookie.NetscapeDraftSpecFactory;
import org.apache.http.impl.cookie.RFC2109SpecFactory;
import org.apache.http.impl.cookie.RFC2965SpecFactory;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.BasicHttpProcessor;
import org.apache.http.protocol.DefaultedHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.protocol.ImmutableHttpProcessor;
import org.apache.http.util.Args;

@Deprecated
@ThreadSafe
public abstract class AbstractHttpClient extends CloseableHttpClient {
    @GuardedBy("this")
    private BackoffManager backoffManager;
    @GuardedBy("this")
    private ClientConnectionManager connManager;
    @GuardedBy("this")
    private ConnectionBackoffStrategy connectionBackoffStrategy;
    @GuardedBy("this")
    private CookieStore cookieStore;
    @GuardedBy("this")
    private CredentialsProvider credsProvider;
    @GuardedBy("this")
    private HttpParams defaultParams;
    @GuardedBy("this")
    private ConnectionKeepAliveStrategy keepAliveStrategy;
    private final Log log = LogFactory.getLog(getClass());
    @GuardedBy("this")
    private BasicHttpProcessor mutableProcessor;
    @GuardedBy("this")
    private ImmutableHttpProcessor protocolProcessor;
    @GuardedBy("this")
    private AuthenticationStrategy proxyAuthStrategy;
    @GuardedBy("this")
    private RedirectStrategy redirectStrategy;
    @GuardedBy("this")
    private HttpRequestExecutor requestExec;
    @GuardedBy("this")
    private HttpRequestRetryHandler retryHandler;
    @GuardedBy("this")
    private ConnectionReuseStrategy reuseStrategy;
    @GuardedBy("this")
    private HttpRoutePlanner routePlanner;
    @GuardedBy("this")
    private AuthSchemeRegistry supportedAuthSchemes;
    @GuardedBy("this")
    private CookieSpecRegistry supportedCookieSpecs;
    @GuardedBy("this")
    private AuthenticationStrategy targetAuthStrategy;
    @GuardedBy("this")
    private UserTokenHandler userTokenHandler;

    protected AbstractHttpClient(ClientConnectionManager clientConnectionManager, HttpParams httpParams) {
        this.defaultParams = httpParams;
        this.connManager = clientConnectionManager;
    }

    private HttpProcessor getProtocolProcessor() {
        ImmutableHttpProcessor immutableHttpProcessor;
        synchronized (this) {
            if (this.protocolProcessor == null) {
                BasicHttpProcessor httpProcessor = getHttpProcessor();
                int requestInterceptorCount = httpProcessor.getRequestInterceptorCount();
                HttpRequestInterceptor[] httpRequestInterceptorArr = new HttpRequestInterceptor[requestInterceptorCount];
                for (int i = 0; i < requestInterceptorCount; i++) {
                    httpRequestInterceptorArr[i] = httpProcessor.getRequestInterceptor(i);
                }
                int responseInterceptorCount = httpProcessor.getResponseInterceptorCount();
                HttpResponseInterceptor[] httpResponseInterceptorArr = new HttpResponseInterceptor[responseInterceptorCount];
                for (int i2 = 0; i2 < responseInterceptorCount; i2++) {
                    httpResponseInterceptorArr[i2] = httpProcessor.getResponseInterceptor(i2);
                }
                this.protocolProcessor = new ImmutableHttpProcessor(httpRequestInterceptorArr, httpResponseInterceptorArr);
            }
            immutableHttpProcessor = this.protocolProcessor;
        }
        return immutableHttpProcessor;
    }

    public void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor) {
        synchronized (this) {
            getHttpProcessor().addInterceptor(httpRequestInterceptor);
            this.protocolProcessor = null;
        }
    }

    public void addRequestInterceptor(HttpRequestInterceptor httpRequestInterceptor, int i) {
        synchronized (this) {
            getHttpProcessor().addInterceptor(httpRequestInterceptor, i);
            this.protocolProcessor = null;
        }
    }

    public void addResponseInterceptor(HttpResponseInterceptor httpResponseInterceptor) {
        synchronized (this) {
            getHttpProcessor().addInterceptor(httpResponseInterceptor);
            this.protocolProcessor = null;
        }
    }

    public void addResponseInterceptor(HttpResponseInterceptor httpResponseInterceptor, int i) {
        synchronized (this) {
            getHttpProcessor().addInterceptor(httpResponseInterceptor, i);
            this.protocolProcessor = null;
        }
    }

    public void clearRequestInterceptors() {
        synchronized (this) {
            getHttpProcessor().clearRequestInterceptors();
            this.protocolProcessor = null;
        }
    }

    public void clearResponseInterceptors() {
        synchronized (this) {
            getHttpProcessor().clearResponseInterceptors();
            this.protocolProcessor = null;
        }
    }

    public void close() {
        getConnectionManager().shutdown();
    }

    /* access modifiers changed from: protected */
    public AuthSchemeRegistry createAuthSchemeRegistry() {
        AuthSchemeRegistry authSchemeRegistry = new AuthSchemeRegistry();
        authSchemeRegistry.register("Basic", new BasicSchemeFactory());
        authSchemeRegistry.register("Digest", new DigestSchemeFactory());
        authSchemeRegistry.register("NTLM", new NTLMSchemeFactory());
        authSchemeRegistry.register("negotiate", new SPNegoSchemeFactory());
        authSchemeRegistry.register("Kerberos", new KerberosSchemeFactory());
        return authSchemeRegistry;
    }

    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r2v6, resolved type: java.lang.Object} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v0, resolved type: org.apache.http.conn.ClientConnectionManagerFactory} */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public org.apache.http.conn.ClientConnectionManager createClientConnectionManager() {
        /*
            r5 = this;
            org.apache.http.conn.scheme.SchemeRegistry r3 = org.apache.http.impl.conn.SchemeRegistryFactory.createDefault()
            org.apache.http.params.HttpParams r4 = r5.getParams()
            r2 = 0
            java.lang.String r1 = "http.connection-manager.factory-class-name"
            java.lang.Object r1 = r4.getParameter(r1)
            java.lang.String r1 = (java.lang.String) r1
            if (r1 == 0) goto L_0x005c
            java.lang.Class r2 = java.lang.Class.forName(r1)     // Catch:{ ClassNotFoundException -> 0x0026, IllegalAccessException -> 0x0040, InstantiationException -> 0x004b }
            java.lang.Object r2 = r2.newInstance()     // Catch:{ ClassNotFoundException -> 0x0026, IllegalAccessException -> 0x0040, InstantiationException -> 0x004b }
            r0 = r2
            org.apache.http.conn.ClientConnectionManagerFactory r0 = (org.apache.http.conn.ClientConnectionManagerFactory) r0     // Catch:{ ClassNotFoundException -> 0x0026, IllegalAccessException -> 0x0040, InstantiationException -> 0x004b }
            r1 = r0
        L_0x001f:
            if (r1 == 0) goto L_0x0056
            org.apache.http.conn.ClientConnectionManager r1 = r1.newInstance(r4, r3)
        L_0x0025:
            return r1
        L_0x0026:
            r2 = move-exception
            java.lang.IllegalStateException r2 = new java.lang.IllegalStateException
            java.lang.StringBuilder r3 = new java.lang.StringBuilder
            r3.<init>()
            java.lang.String r4 = "Invalid class name: "
            java.lang.StringBuilder r3 = r3.append(r4)
            java.lang.StringBuilder r1 = r3.append(r1)
            java.lang.String r1 = r1.toString()
            r2.<init>(r1)
            throw r2
        L_0x0040:
            r1 = move-exception
            java.lang.IllegalAccessError r2 = new java.lang.IllegalAccessError
            java.lang.String r1 = r1.getMessage()
            r2.<init>(r1)
            throw r2
        L_0x004b:
            r1 = move-exception
            java.lang.InstantiationError r2 = new java.lang.InstantiationError
            java.lang.String r1 = r1.getMessage()
            r2.<init>(r1)
            throw r2
        L_0x0056:
            org.apache.http.impl.conn.BasicClientConnectionManager r1 = new org.apache.http.impl.conn.BasicClientConnectionManager
            r1.<init>(r3)
            goto L_0x0025
        L_0x005c:
            r1 = r2
            goto L_0x001f
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.client.AbstractHttpClient.createClientConnectionManager():org.apache.http.conn.ClientConnectionManager");
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public RequestDirector createClientRequestDirector(HttpRequestExecutor httpRequestExecutor, ClientConnectionManager clientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy, HttpRoutePlanner httpRoutePlanner, HttpProcessor httpProcessor, HttpRequestRetryHandler httpRequestRetryHandler, RedirectHandler redirectHandler, AuthenticationHandler authenticationHandler, AuthenticationHandler authenticationHandler2, UserTokenHandler userTokenHandler2, HttpParams httpParams) {
        return new DefaultRequestDirector(httpRequestExecutor, clientConnectionManager, connectionReuseStrategy, connectionKeepAliveStrategy, httpRoutePlanner, httpProcessor, httpRequestRetryHandler, redirectHandler, authenticationHandler, authenticationHandler2, userTokenHandler2, httpParams);
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public RequestDirector createClientRequestDirector(HttpRequestExecutor httpRequestExecutor, ClientConnectionManager clientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy, HttpRoutePlanner httpRoutePlanner, HttpProcessor httpProcessor, HttpRequestRetryHandler httpRequestRetryHandler, RedirectStrategy redirectStrategy2, AuthenticationHandler authenticationHandler, AuthenticationHandler authenticationHandler2, UserTokenHandler userTokenHandler2, HttpParams httpParams) {
        return new DefaultRequestDirector(this.log, httpRequestExecutor, clientConnectionManager, connectionReuseStrategy, connectionKeepAliveStrategy, httpRoutePlanner, httpProcessor, httpRequestRetryHandler, redirectStrategy2, authenticationHandler, authenticationHandler2, userTokenHandler2, httpParams);
    }

    /* access modifiers changed from: protected */
    public RequestDirector createClientRequestDirector(HttpRequestExecutor httpRequestExecutor, ClientConnectionManager clientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy, HttpRoutePlanner httpRoutePlanner, HttpProcessor httpProcessor, HttpRequestRetryHandler httpRequestRetryHandler, RedirectStrategy redirectStrategy2, AuthenticationStrategy authenticationStrategy, AuthenticationStrategy authenticationStrategy2, UserTokenHandler userTokenHandler2, HttpParams httpParams) {
        return new DefaultRequestDirector(this.log, httpRequestExecutor, clientConnectionManager, connectionReuseStrategy, connectionKeepAliveStrategy, httpRoutePlanner, httpProcessor, httpRequestRetryHandler, redirectStrategy2, authenticationStrategy, authenticationStrategy2, userTokenHandler2, httpParams);
    }

    /* access modifiers changed from: protected */
    public ConnectionKeepAliveStrategy createConnectionKeepAliveStrategy() {
        return new DefaultConnectionKeepAliveStrategy();
    }

    /* access modifiers changed from: protected */
    public ConnectionReuseStrategy createConnectionReuseStrategy() {
        return new DefaultConnectionReuseStrategy();
    }

    /* access modifiers changed from: protected */
    public CookieSpecRegistry createCookieSpecRegistry() {
        CookieSpecRegistry cookieSpecRegistry = new CookieSpecRegistry();
        cookieSpecRegistry.register("best-match", new BestMatchSpecFactory());
        cookieSpecRegistry.register("compatibility", new BrowserCompatSpecFactory());
        cookieSpecRegistry.register("netscape", new NetscapeDraftSpecFactory());
        cookieSpecRegistry.register(CookiePolicy.RFC_2109, new RFC2109SpecFactory());
        cookieSpecRegistry.register(CookiePolicy.RFC_2965, new RFC2965SpecFactory());
        cookieSpecRegistry.register("ignoreCookies", new IgnoreSpecFactory());
        return cookieSpecRegistry;
    }

    /* access modifiers changed from: protected */
    public CookieStore createCookieStore() {
        return new BasicCookieStore();
    }

    /* access modifiers changed from: protected */
    public CredentialsProvider createCredentialsProvider() {
        return new BasicCredentialsProvider();
    }

    /* access modifiers changed from: protected */
    public HttpContext createHttpContext() {
        BasicHttpContext basicHttpContext = new BasicHttpContext();
        basicHttpContext.setAttribute(ClientContext.SCHEME_REGISTRY, getConnectionManager().getSchemeRegistry());
        basicHttpContext.setAttribute("http.authscheme-registry", getAuthSchemes());
        basicHttpContext.setAttribute("http.cookiespec-registry", getCookieSpecs());
        basicHttpContext.setAttribute("http.cookie-store", getCookieStore());
        basicHttpContext.setAttribute("http.auth.credentials-provider", getCredentialsProvider());
        return basicHttpContext;
    }

    /* access modifiers changed from: protected */
    public abstract HttpParams createHttpParams();

    /* access modifiers changed from: protected */
    public abstract BasicHttpProcessor createHttpProcessor();

    /* access modifiers changed from: protected */
    public HttpRequestRetryHandler createHttpRequestRetryHandler() {
        return new DefaultHttpRequestRetryHandler();
    }

    /* access modifiers changed from: protected */
    public HttpRoutePlanner createHttpRoutePlanner() {
        return new DefaultHttpRoutePlanner(getConnectionManager().getSchemeRegistry());
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public AuthenticationHandler createProxyAuthenticationHandler() {
        return new DefaultProxyAuthenticationHandler();
    }

    /* access modifiers changed from: protected */
    public AuthenticationStrategy createProxyAuthenticationStrategy() {
        return new ProxyAuthenticationStrategy();
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public RedirectHandler createRedirectHandler() {
        return new DefaultRedirectHandler();
    }

    /* access modifiers changed from: protected */
    public HttpRequestExecutor createRequestExecutor() {
        return new HttpRequestExecutor();
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public AuthenticationHandler createTargetAuthenticationHandler() {
        return new DefaultTargetAuthenticationHandler();
    }

    /* access modifiers changed from: protected */
    public AuthenticationStrategy createTargetAuthenticationStrategy() {
        return new TargetAuthenticationStrategy();
    }

    /* access modifiers changed from: protected */
    public UserTokenHandler createUserTokenHandler() {
        return new DefaultUserTokenHandler();
    }

    /* access modifiers changed from: protected */
    public HttpParams determineParams(HttpRequest httpRequest) {
        return new ClientParamsStack((HttpParams) null, getParams(), httpRequest.getParams(), (HttpParams) null);
    }

    /* access modifiers changed from: protected */
    public final CloseableHttpResponse doExecute(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws IOException, ClientProtocolException {
        DefaultedHttpContext defaultedHttpContext;
        RequestDirector createClientRequestDirector;
        HttpRoutePlanner routePlanner2;
        ConnectionBackoffStrategy connectionBackoffStrategy2;
        BackoffManager backoffManager2;
        HttpRoute determineRoute;
        Args.notNull(httpRequest, "HTTP request");
        synchronized (this) {
            HttpContext createHttpContext = createHttpContext();
            defaultedHttpContext = httpContext == null ? createHttpContext : new DefaultedHttpContext(httpContext, createHttpContext);
            HttpParams determineParams = determineParams(httpRequest);
            defaultedHttpContext.setAttribute("http.request-config", HttpClientParamConfig.getRequestConfig(determineParams));
            createClientRequestDirector = createClientRequestDirector(getRequestExecutor(), getConnectionManager(), getConnectionReuseStrategy(), getConnectionKeepAliveStrategy(), getRoutePlanner(), getProtocolProcessor(), getHttpRequestRetryHandler(), getRedirectStrategy(), getTargetAuthenticationStrategy(), getProxyAuthenticationStrategy(), getUserTokenHandler(), determineParams);
            routePlanner2 = getRoutePlanner();
            connectionBackoffStrategy2 = getConnectionBackoffStrategy();
            backoffManager2 = getBackoffManager();
        }
        if (connectionBackoffStrategy2 == null || backoffManager2 == null) {
            return CloseableHttpResponseProxy.newProxy(createClientRequestDirector.execute(httpHost, httpRequest, defaultedHttpContext));
        }
        try {
            determineRoute = routePlanner2.determineRoute(httpHost != null ? httpHost : (HttpHost) determineParams(httpRequest).getParameter(ClientPNames.DEFAULT_HOST), httpRequest, defaultedHttpContext);
            CloseableHttpResponse newProxy = CloseableHttpResponseProxy.newProxy(createClientRequestDirector.execute(httpHost, httpRequest, defaultedHttpContext));
            if (connectionBackoffStrategy2.shouldBackoff((HttpResponse) newProxy)) {
                backoffManager2.backOff(determineRoute);
                return newProxy;
            }
            backoffManager2.probe(determineRoute);
            return newProxy;
        } catch (RuntimeException e) {
            if (connectionBackoffStrategy2.shouldBackoff((Throwable) e)) {
                backoffManager2.backOff(determineRoute);
            }
            throw e;
        } catch (Exception e2) {
            if (connectionBackoffStrategy2.shouldBackoff((Throwable) e2)) {
                backoffManager2.backOff(determineRoute);
            }
            if (e2 instanceof HttpException) {
                throw ((HttpException) e2);
            } else if (e2 instanceof IOException) {
                throw ((IOException) e2);
            } else {
                throw new UndeclaredThrowableException(e2);
            }
        } catch (HttpException e3) {
            throw new ClientProtocolException((Throwable) e3);
        }
    }

    public final AuthSchemeRegistry getAuthSchemes() {
        AuthSchemeRegistry authSchemeRegistry;
        synchronized (this) {
            if (this.supportedAuthSchemes == null) {
                this.supportedAuthSchemes = createAuthSchemeRegistry();
            }
            authSchemeRegistry = this.supportedAuthSchemes;
        }
        return authSchemeRegistry;
    }

    public final BackoffManager getBackoffManager() {
        BackoffManager backoffManager2;
        synchronized (this) {
            backoffManager2 = this.backoffManager;
        }
        return backoffManager2;
    }

    public final ConnectionBackoffStrategy getConnectionBackoffStrategy() {
        ConnectionBackoffStrategy connectionBackoffStrategy2;
        synchronized (this) {
            connectionBackoffStrategy2 = this.connectionBackoffStrategy;
        }
        return connectionBackoffStrategy2;
    }

    public final ConnectionKeepAliveStrategy getConnectionKeepAliveStrategy() {
        ConnectionKeepAliveStrategy connectionKeepAliveStrategy;
        synchronized (this) {
            if (this.keepAliveStrategy == null) {
                this.keepAliveStrategy = createConnectionKeepAliveStrategy();
            }
            connectionKeepAliveStrategy = this.keepAliveStrategy;
        }
        return connectionKeepAliveStrategy;
    }

    public final ClientConnectionManager getConnectionManager() {
        ClientConnectionManager clientConnectionManager;
        synchronized (this) {
            if (this.connManager == null) {
                this.connManager = createClientConnectionManager();
            }
            clientConnectionManager = this.connManager;
        }
        return clientConnectionManager;
    }

    public final ConnectionReuseStrategy getConnectionReuseStrategy() {
        ConnectionReuseStrategy connectionReuseStrategy;
        synchronized (this) {
            if (this.reuseStrategy == null) {
                this.reuseStrategy = createConnectionReuseStrategy();
            }
            connectionReuseStrategy = this.reuseStrategy;
        }
        return connectionReuseStrategy;
    }

    public final CookieSpecRegistry getCookieSpecs() {
        CookieSpecRegistry cookieSpecRegistry;
        synchronized (this) {
            if (this.supportedCookieSpecs == null) {
                this.supportedCookieSpecs = createCookieSpecRegistry();
            }
            cookieSpecRegistry = this.supportedCookieSpecs;
        }
        return cookieSpecRegistry;
    }

    public final CookieStore getCookieStore() {
        CookieStore cookieStore2;
        synchronized (this) {
            if (this.cookieStore == null) {
                this.cookieStore = createCookieStore();
            }
            cookieStore2 = this.cookieStore;
        }
        return cookieStore2;
    }

    public final CredentialsProvider getCredentialsProvider() {
        CredentialsProvider credentialsProvider;
        synchronized (this) {
            if (this.credsProvider == null) {
                this.credsProvider = createCredentialsProvider();
            }
            credentialsProvider = this.credsProvider;
        }
        return credentialsProvider;
    }

    /* access modifiers changed from: protected */
    public final BasicHttpProcessor getHttpProcessor() {
        BasicHttpProcessor basicHttpProcessor;
        synchronized (this) {
            if (this.mutableProcessor == null) {
                this.mutableProcessor = createHttpProcessor();
            }
            basicHttpProcessor = this.mutableProcessor;
        }
        return basicHttpProcessor;
    }

    public final HttpRequestRetryHandler getHttpRequestRetryHandler() {
        HttpRequestRetryHandler httpRequestRetryHandler;
        synchronized (this) {
            if (this.retryHandler == null) {
                this.retryHandler = createHttpRequestRetryHandler();
            }
            httpRequestRetryHandler = this.retryHandler;
        }
        return httpRequestRetryHandler;
    }

    public final HttpParams getParams() {
        HttpParams httpParams;
        synchronized (this) {
            if (this.defaultParams == null) {
                this.defaultParams = createHttpParams();
            }
            httpParams = this.defaultParams;
        }
        return httpParams;
    }

    @Deprecated
    public final AuthenticationHandler getProxyAuthenticationHandler() {
        AuthenticationHandler createProxyAuthenticationHandler;
        synchronized (this) {
            createProxyAuthenticationHandler = createProxyAuthenticationHandler();
        }
        return createProxyAuthenticationHandler;
    }

    public final AuthenticationStrategy getProxyAuthenticationStrategy() {
        AuthenticationStrategy authenticationStrategy;
        synchronized (this) {
            if (this.proxyAuthStrategy == null) {
                this.proxyAuthStrategy = createProxyAuthenticationStrategy();
            }
            authenticationStrategy = this.proxyAuthStrategy;
        }
        return authenticationStrategy;
    }

    @Deprecated
    public final RedirectHandler getRedirectHandler() {
        RedirectHandler createRedirectHandler;
        synchronized (this) {
            createRedirectHandler = createRedirectHandler();
        }
        return createRedirectHandler;
    }

    public final RedirectStrategy getRedirectStrategy() {
        RedirectStrategy redirectStrategy2;
        synchronized (this) {
            if (this.redirectStrategy == null) {
                this.redirectStrategy = new DefaultRedirectStrategy();
            }
            redirectStrategy2 = this.redirectStrategy;
        }
        return redirectStrategy2;
    }

    public final HttpRequestExecutor getRequestExecutor() {
        HttpRequestExecutor httpRequestExecutor;
        synchronized (this) {
            if (this.requestExec == null) {
                this.requestExec = createRequestExecutor();
            }
            httpRequestExecutor = this.requestExec;
        }
        return httpRequestExecutor;
    }

    public HttpRequestInterceptor getRequestInterceptor(int i) {
        HttpRequestInterceptor requestInterceptor;
        synchronized (this) {
            requestInterceptor = getHttpProcessor().getRequestInterceptor(i);
        }
        return requestInterceptor;
    }

    public int getRequestInterceptorCount() {
        int requestInterceptorCount;
        synchronized (this) {
            requestInterceptorCount = getHttpProcessor().getRequestInterceptorCount();
        }
        return requestInterceptorCount;
    }

    public HttpResponseInterceptor getResponseInterceptor(int i) {
        HttpResponseInterceptor responseInterceptor;
        synchronized (this) {
            responseInterceptor = getHttpProcessor().getResponseInterceptor(i);
        }
        return responseInterceptor;
    }

    public int getResponseInterceptorCount() {
        int responseInterceptorCount;
        synchronized (this) {
            responseInterceptorCount = getHttpProcessor().getResponseInterceptorCount();
        }
        return responseInterceptorCount;
    }

    public final HttpRoutePlanner getRoutePlanner() {
        HttpRoutePlanner httpRoutePlanner;
        synchronized (this) {
            if (this.routePlanner == null) {
                this.routePlanner = createHttpRoutePlanner();
            }
            httpRoutePlanner = this.routePlanner;
        }
        return httpRoutePlanner;
    }

    @Deprecated
    public final AuthenticationHandler getTargetAuthenticationHandler() {
        AuthenticationHandler createTargetAuthenticationHandler;
        synchronized (this) {
            createTargetAuthenticationHandler = createTargetAuthenticationHandler();
        }
        return createTargetAuthenticationHandler;
    }

    public final AuthenticationStrategy getTargetAuthenticationStrategy() {
        AuthenticationStrategy authenticationStrategy;
        synchronized (this) {
            if (this.targetAuthStrategy == null) {
                this.targetAuthStrategy = createTargetAuthenticationStrategy();
            }
            authenticationStrategy = this.targetAuthStrategy;
        }
        return authenticationStrategy;
    }

    public final UserTokenHandler getUserTokenHandler() {
        UserTokenHandler userTokenHandler2;
        synchronized (this) {
            if (this.userTokenHandler == null) {
                this.userTokenHandler = createUserTokenHandler();
            }
            userTokenHandler2 = this.userTokenHandler;
        }
        return userTokenHandler2;
    }

    public void removeRequestInterceptorByClass(Class<? extends HttpRequestInterceptor> cls) {
        synchronized (this) {
            getHttpProcessor().removeRequestInterceptorByClass(cls);
            this.protocolProcessor = null;
        }
    }

    public void removeResponseInterceptorByClass(Class<? extends HttpResponseInterceptor> cls) {
        synchronized (this) {
            getHttpProcessor().removeResponseInterceptorByClass(cls);
            this.protocolProcessor = null;
        }
    }

    public void setAuthSchemes(AuthSchemeRegistry authSchemeRegistry) {
        synchronized (this) {
            this.supportedAuthSchemes = authSchemeRegistry;
        }
    }

    public void setBackoffManager(BackoffManager backoffManager2) {
        synchronized (this) {
            this.backoffManager = backoffManager2;
        }
    }

    public void setConnectionBackoffStrategy(ConnectionBackoffStrategy connectionBackoffStrategy2) {
        synchronized (this) {
            this.connectionBackoffStrategy = connectionBackoffStrategy2;
        }
    }

    public void setCookieSpecs(CookieSpecRegistry cookieSpecRegistry) {
        synchronized (this) {
            this.supportedCookieSpecs = cookieSpecRegistry;
        }
    }

    public void setCookieStore(CookieStore cookieStore2) {
        synchronized (this) {
            this.cookieStore = cookieStore2;
        }
    }

    public void setCredentialsProvider(CredentialsProvider credentialsProvider) {
        synchronized (this) {
            this.credsProvider = credentialsProvider;
        }
    }

    public void setHttpRequestRetryHandler(HttpRequestRetryHandler httpRequestRetryHandler) {
        synchronized (this) {
            this.retryHandler = httpRequestRetryHandler;
        }
    }

    public void setKeepAliveStrategy(ConnectionKeepAliveStrategy connectionKeepAliveStrategy) {
        synchronized (this) {
            this.keepAliveStrategy = connectionKeepAliveStrategy;
        }
    }

    public void setParams(HttpParams httpParams) {
        synchronized (this) {
            this.defaultParams = httpParams;
        }
    }

    @Deprecated
    public void setProxyAuthenticationHandler(AuthenticationHandler authenticationHandler) {
        synchronized (this) {
            this.proxyAuthStrategy = new AuthenticationStrategyAdaptor(authenticationHandler);
        }
    }

    public void setProxyAuthenticationStrategy(AuthenticationStrategy authenticationStrategy) {
        synchronized (this) {
            this.proxyAuthStrategy = authenticationStrategy;
        }
    }

    @Deprecated
    public void setRedirectHandler(RedirectHandler redirectHandler) {
        synchronized (this) {
            this.redirectStrategy = new DefaultRedirectStrategyAdaptor(redirectHandler);
        }
    }

    public void setRedirectStrategy(RedirectStrategy redirectStrategy2) {
        synchronized (this) {
            this.redirectStrategy = redirectStrategy2;
        }
    }

    public void setReuseStrategy(ConnectionReuseStrategy connectionReuseStrategy) {
        synchronized (this) {
            this.reuseStrategy = connectionReuseStrategy;
        }
    }

    public void setRoutePlanner(HttpRoutePlanner httpRoutePlanner) {
        synchronized (this) {
            this.routePlanner = httpRoutePlanner;
        }
    }

    @Deprecated
    public void setTargetAuthenticationHandler(AuthenticationHandler authenticationHandler) {
        synchronized (this) {
            this.targetAuthStrategy = new AuthenticationStrategyAdaptor(authenticationHandler);
        }
    }

    public void setTargetAuthenticationStrategy(AuthenticationStrategy authenticationStrategy) {
        synchronized (this) {
            this.targetAuthStrategy = authenticationStrategy;
        }
    }

    public void setUserTokenHandler(UserTokenHandler userTokenHandler2) {
        synchronized (this) {
            this.userTokenHandler = userTokenHandler2;
        }
    }
}
