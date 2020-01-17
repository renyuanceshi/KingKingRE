package org.apache.http.impl.client;

import java.io.Closeable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import javax.net.ssl.SSLContext;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthSchemeProvider;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.BackoffManager;
import org.apache.http.client.ConnectionBackoffStrategy;
import org.apache.http.client.CookieStore;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.RedirectStrategy;
import org.apache.http.client.ServiceUnavailableRetryStrategy;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.Lookup;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.ssl.X509HostnameVerifier;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.impl.execchain.ClientExecChain;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.util.TextUtils;
import org.apache.http.util.VersionInfo;

@NotThreadSafe
public class HttpClientBuilder {
    static final String DEFAULT_USER_AGENT;
    private boolean authCachingDisabled;
    private Lookup<AuthSchemeProvider> authSchemeRegistry;
    private boolean automaticRetriesDisabled;
    private BackoffManager backoffManager;
    private List<Closeable> closeables;
    private HttpClientConnectionManager connManager;
    private ConnectionBackoffStrategy connectionBackoffStrategy;
    private boolean connectionStateDisabled;
    private boolean contentCompressionDisabled;
    private boolean cookieManagementDisabled;
    private Lookup<CookieSpecProvider> cookieSpecRegistry;
    private CookieStore cookieStore;
    private CredentialsProvider credentialsProvider;
    private ConnectionConfig defaultConnectionConfig;
    private Collection<? extends Header> defaultHeaders;
    private RequestConfig defaultRequestConfig;
    private SocketConfig defaultSocketConfig;
    private X509HostnameVerifier hostnameVerifier;
    private HttpProcessor httpprocessor;
    private ConnectionKeepAliveStrategy keepAliveStrategy;
    private int maxConnPerRoute = 0;
    private int maxConnTotal = 0;
    private HttpHost proxy;
    private AuthenticationStrategy proxyAuthStrategy;
    private boolean redirectHandlingDisabled;
    private RedirectStrategy redirectStrategy;
    private HttpRequestExecutor requestExec;
    private LinkedList<HttpRequestInterceptor> requestFirst;
    private LinkedList<HttpRequestInterceptor> requestLast;
    private LinkedList<HttpResponseInterceptor> responseFirst;
    private LinkedList<HttpResponseInterceptor> responseLast;
    private HttpRequestRetryHandler retryHandler;
    private ConnectionReuseStrategy reuseStrategy;
    private HttpRoutePlanner routePlanner;
    private SchemePortResolver schemePortResolver;
    private ServiceUnavailableRetryStrategy serviceUnavailStrategy;
    private LayeredConnectionSocketFactory sslSocketFactory;
    private SSLContext sslcontext;
    private boolean systemProperties;
    private AuthenticationStrategy targetAuthStrategy;
    private String userAgent;
    private UserTokenHandler userTokenHandler;

    static {
        VersionInfo loadVersionInfo = VersionInfo.loadVersionInfo("org.apache.http.client", HttpClientBuilder.class.getClassLoader());
        DEFAULT_USER_AGENT = "Apache-HttpClient/" + (loadVersionInfo != null ? loadVersionInfo.getRelease() : VersionInfo.UNAVAILABLE) + " (java 1.5)";
    }

    protected HttpClientBuilder() {
    }

    public static HttpClientBuilder create() {
        return new HttpClientBuilder();
    }

    private static String[] split(String str) {
        if (TextUtils.isBlank(str)) {
            return null;
        }
        return str.split(" *, *");
    }

    /* access modifiers changed from: protected */
    public void addCloseable(Closeable closeable) {
        if (closeable != null) {
            if (this.closeables == null) {
                this.closeables = new ArrayList();
            }
            this.closeables.add(closeable);
        }
    }

    public final HttpClientBuilder addInterceptorFirst(HttpRequestInterceptor httpRequestInterceptor) {
        if (httpRequestInterceptor != null) {
            if (this.requestFirst == null) {
                this.requestFirst = new LinkedList<>();
            }
            this.requestFirst.addFirst(httpRequestInterceptor);
        }
        return this;
    }

    public final HttpClientBuilder addInterceptorFirst(HttpResponseInterceptor httpResponseInterceptor) {
        if (httpResponseInterceptor != null) {
            if (this.responseFirst == null) {
                this.responseFirst = new LinkedList<>();
            }
            this.responseFirst.addFirst(httpResponseInterceptor);
        }
        return this;
    }

    public final HttpClientBuilder addInterceptorLast(HttpRequestInterceptor httpRequestInterceptor) {
        if (httpRequestInterceptor != null) {
            if (this.requestLast == null) {
                this.requestLast = new LinkedList<>();
            }
            this.requestLast.addLast(httpRequestInterceptor);
        }
        return this;
    }

    public final HttpClientBuilder addInterceptorLast(HttpResponseInterceptor httpResponseInterceptor) {
        if (httpResponseInterceptor != null) {
            if (this.responseLast == null) {
                this.responseLast = new LinkedList<>();
            }
            this.responseLast.addLast(httpResponseInterceptor);
        }
        return this;
    }

    /* JADX WARNING: Removed duplicated region for block: B:101:0x01d2  */
    /* JADX WARNING: Removed duplicated region for block: B:104:0x01de  */
    /* JADX WARNING: Removed duplicated region for block: B:110:0x01f8  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x0109  */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x0150  */
    /* JADX WARNING: Removed duplicated region for block: B:89:0x01a2  */
    /* JADX WARNING: Removed duplicated region for block: B:92:0x01ae  */
    /* JADX WARNING: Removed duplicated region for block: B:95:0x01ba  */
    /* JADX WARNING: Removed duplicated region for block: B:98:0x01c6  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public org.apache.http.impl.client.CloseableHttpClient build() {
        /*
            r10 = this;
            r9 = 0
            org.apache.http.protocol.HttpRequestExecutor r1 = r10.requestExec
            if (r1 != 0) goto L_0x000a
            org.apache.http.protocol.HttpRequestExecutor r1 = new org.apache.http.protocol.HttpRequestExecutor
            r1.<init>()
        L_0x000a:
            org.apache.http.conn.HttpClientConnectionManager r2 = r10.connManager
            if (r2 != 0) goto L_0x00ab
            org.apache.http.conn.socket.LayeredConnectionSocketFactory r0 = r10.sslSocketFactory
            if (r0 != 0) goto L_0x0042
            boolean r0 = r10.systemProperties
            if (r0 == 0) goto L_0x011f
            java.lang.String r0 = "https.protocols"
            java.lang.String r0 = java.lang.System.getProperty(r0)
            java.lang.String[] r0 = split(r0)
            r2 = r0
        L_0x0021:
            boolean r0 = r10.systemProperties
            if (r0 == 0) goto L_0x0122
            java.lang.String r0 = "https.cipherSuites"
            java.lang.String r0 = java.lang.System.getProperty(r0)
            java.lang.String[] r0 = split(r0)
            r3 = r0
        L_0x0030:
            org.apache.http.conn.ssl.X509HostnameVerifier r0 = r10.hostnameVerifier
            if (r0 != 0) goto L_0x0358
            org.apache.http.conn.ssl.X509HostnameVerifier r0 = org.apache.http.conn.ssl.SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER
            r4 = r0
        L_0x0037:
            javax.net.ssl.SSLContext r0 = r10.sslcontext
            if (r0 == 0) goto L_0x0125
            org.apache.http.conn.ssl.SSLConnectionSocketFactory r0 = new org.apache.http.conn.ssl.SSLConnectionSocketFactory
            javax.net.ssl.SSLContext r5 = r10.sslcontext
            r0.<init>((javax.net.ssl.SSLContext) r5, (java.lang.String[]) r2, (java.lang.String[]) r3, (org.apache.http.conn.ssl.X509HostnameVerifier) r4)
        L_0x0042:
            org.apache.http.impl.conn.PoolingHttpClientConnectionManager r2 = new org.apache.http.impl.conn.PoolingHttpClientConnectionManager
            org.apache.http.config.RegistryBuilder r3 = org.apache.http.config.RegistryBuilder.create()
            java.lang.String r4 = "http"
            org.apache.http.conn.socket.PlainConnectionSocketFactory r5 = org.apache.http.conn.socket.PlainConnectionSocketFactory.getSocketFactory()
            org.apache.http.config.RegistryBuilder r3 = r3.register(r4, r5)
            java.lang.String r4 = "https"
            org.apache.http.config.RegistryBuilder r0 = r3.register(r4, r0)
            org.apache.http.config.Registry r0 = r0.build()
            r2.<init>((org.apache.http.config.Registry<org.apache.http.conn.socket.ConnectionSocketFactory>) r0)
            org.apache.http.config.SocketConfig r0 = r10.defaultSocketConfig
            if (r0 == 0) goto L_0x0068
            org.apache.http.config.SocketConfig r0 = r10.defaultSocketConfig
            r2.setDefaultSocketConfig(r0)
        L_0x0068:
            org.apache.http.config.ConnectionConfig r0 = r10.defaultConnectionConfig
            if (r0 == 0) goto L_0x0071
            org.apache.http.config.ConnectionConfig r0 = r10.defaultConnectionConfig
            r2.setDefaultConnectionConfig(r0)
        L_0x0071:
            boolean r0 = r10.systemProperties
            if (r0 == 0) goto L_0x0099
            java.lang.String r0 = "true"
            java.lang.String r3 = "http.keepAlive"
            java.lang.String r4 = "true"
            java.lang.String r3 = java.lang.System.getProperty(r3, r4)
            boolean r0 = r0.equalsIgnoreCase(r3)
            if (r0 == 0) goto L_0x0099
            java.lang.String r0 = "http.maxConnections"
            java.lang.String r3 = "5"
            java.lang.String r0 = java.lang.System.getProperty(r0, r3)
            int r0 = java.lang.Integer.parseInt(r0)
            r2.setDefaultMaxPerRoute(r0)
            int r0 = r0 * 2
            r2.setMaxTotal(r0)
        L_0x0099:
            int r0 = r10.maxConnTotal
            if (r0 <= 0) goto L_0x00a2
            int r0 = r10.maxConnTotal
            r2.setMaxTotal(r0)
        L_0x00a2:
            int r0 = r10.maxConnPerRoute
            if (r0 <= 0) goto L_0x00ab
            int r0 = r10.maxConnPerRoute
            r2.setDefaultMaxPerRoute(r0)
        L_0x00ab:
            org.apache.http.ConnectionReuseStrategy r3 = r10.reuseStrategy
            if (r3 != 0) goto L_0x00c5
            boolean r0 = r10.systemProperties
            if (r0 == 0) goto L_0x0145
            java.lang.String r0 = "true"
            java.lang.String r3 = "http.keepAlive"
            java.lang.String r4 = "true"
            java.lang.String r3 = java.lang.System.getProperty(r3, r4)
            boolean r0 = r0.equalsIgnoreCase(r3)
            if (r0 == 0) goto L_0x0142
            org.apache.http.impl.DefaultConnectionReuseStrategy r3 = org.apache.http.impl.DefaultConnectionReuseStrategy.INSTANCE
        L_0x00c5:
            org.apache.http.conn.ConnectionKeepAliveStrategy r4 = r10.keepAliveStrategy
            if (r4 != 0) goto L_0x00cb
            org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy r4 = org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy.INSTANCE
        L_0x00cb:
            org.apache.http.client.AuthenticationStrategy r5 = r10.targetAuthStrategy
            if (r5 != 0) goto L_0x00d1
            org.apache.http.impl.client.TargetAuthenticationStrategy r5 = org.apache.http.impl.client.TargetAuthenticationStrategy.INSTANCE
        L_0x00d1:
            org.apache.http.client.AuthenticationStrategy r6 = r10.proxyAuthStrategy
            if (r6 != 0) goto L_0x00d7
            org.apache.http.impl.client.ProxyAuthenticationStrategy r6 = org.apache.http.impl.client.ProxyAuthenticationStrategy.INSTANCE
        L_0x00d7:
            org.apache.http.client.UserTokenHandler r7 = r10.userTokenHandler
            if (r7 != 0) goto L_0x00e1
            boolean r0 = r10.connectionStateDisabled
            if (r0 != 0) goto L_0x0149
            org.apache.http.impl.client.DefaultUserTokenHandler r7 = org.apache.http.impl.client.DefaultUserTokenHandler.INSTANCE
        L_0x00e1:
            org.apache.http.impl.execchain.MainClientExec r0 = new org.apache.http.impl.execchain.MainClientExec
            r0.<init>(r1, r2, r3, r4, r5, r6, r7)
            org.apache.http.impl.execchain.ClientExecChain r3 = r10.decorateMainExec(r0)
            org.apache.http.protocol.HttpProcessor r0 = r10.httpprocessor
            if (r0 != 0) goto L_0x0212
            java.lang.String r0 = r10.userAgent
            if (r0 != 0) goto L_0x0355
            boolean r1 = r10.systemProperties
            if (r1 == 0) goto L_0x00fc
            java.lang.String r0 = "http.agent"
            java.lang.String r0 = java.lang.System.getProperty(r0)
        L_0x00fc:
            if (r0 != 0) goto L_0x0355
            java.lang.String r0 = DEFAULT_USER_AGENT
            r1 = r0
        L_0x0101:
            org.apache.http.protocol.HttpProcessorBuilder r4 = org.apache.http.protocol.HttpProcessorBuilder.create()
            java.util.LinkedList<org.apache.http.HttpRequestInterceptor> r0 = r10.requestFirst
            if (r0 == 0) goto L_0x014c
            java.util.LinkedList<org.apache.http.HttpRequestInterceptor> r0 = r10.requestFirst
            java.util.Iterator r5 = r0.iterator()
        L_0x010f:
            boolean r0 = r5.hasNext()
            if (r0 == 0) goto L_0x014c
            java.lang.Object r0 = r5.next()
            org.apache.http.HttpRequestInterceptor r0 = (org.apache.http.HttpRequestInterceptor) r0
            r4.addFirst((org.apache.http.HttpRequestInterceptor) r0)
            goto L_0x010f
        L_0x011f:
            r2 = r9
            goto L_0x0021
        L_0x0122:
            r3 = r9
            goto L_0x0030
        L_0x0125:
            boolean r0 = r10.systemProperties
            if (r0 == 0) goto L_0x0137
            org.apache.http.conn.ssl.SSLConnectionSocketFactory r5 = new org.apache.http.conn.ssl.SSLConnectionSocketFactory
            javax.net.SocketFactory r0 = javax.net.ssl.SSLSocketFactory.getDefault()
            javax.net.ssl.SSLSocketFactory r0 = (javax.net.ssl.SSLSocketFactory) r0
            r5.<init>((javax.net.ssl.SSLSocketFactory) r0, (java.lang.String[]) r2, (java.lang.String[]) r3, (org.apache.http.conn.ssl.X509HostnameVerifier) r4)
            r0 = r5
            goto L_0x0042
        L_0x0137:
            org.apache.http.conn.ssl.SSLConnectionSocketFactory r0 = new org.apache.http.conn.ssl.SSLConnectionSocketFactory
            javax.net.ssl.SSLContext r2 = org.apache.http.conn.ssl.SSLContexts.createDefault()
            r0.<init>((javax.net.ssl.SSLContext) r2, (org.apache.http.conn.ssl.X509HostnameVerifier) r4)
            goto L_0x0042
        L_0x0142:
            org.apache.http.impl.NoConnectionReuseStrategy r3 = org.apache.http.impl.NoConnectionReuseStrategy.INSTANCE
            goto L_0x00c5
        L_0x0145:
            org.apache.http.impl.DefaultConnectionReuseStrategy r3 = org.apache.http.impl.DefaultConnectionReuseStrategy.INSTANCE
            goto L_0x00c5
        L_0x0149:
            org.apache.http.impl.client.NoopUserTokenHandler r7 = org.apache.http.impl.client.NoopUserTokenHandler.INSTANCE
            goto L_0x00e1
        L_0x014c:
            java.util.LinkedList<org.apache.http.HttpResponseInterceptor> r0 = r10.responseFirst
            if (r0 == 0) goto L_0x0166
            java.util.LinkedList<org.apache.http.HttpResponseInterceptor> r0 = r10.responseFirst
            java.util.Iterator r5 = r0.iterator()
        L_0x0156:
            boolean r0 = r5.hasNext()
            if (r0 == 0) goto L_0x0166
            java.lang.Object r0 = r5.next()
            org.apache.http.HttpResponseInterceptor r0 = (org.apache.http.HttpResponseInterceptor) r0
            r4.addFirst((org.apache.http.HttpResponseInterceptor) r0)
            goto L_0x0156
        L_0x0166:
            r0 = 6
            org.apache.http.HttpRequestInterceptor[] r0 = new org.apache.http.HttpRequestInterceptor[r0]
            r5 = 0
            org.apache.http.client.protocol.RequestDefaultHeaders r6 = new org.apache.http.client.protocol.RequestDefaultHeaders
            java.util.Collection<? extends org.apache.http.Header> r7 = r10.defaultHeaders
            r6.<init>(r7)
            r0[r5] = r6
            r5 = 1
            org.apache.http.protocol.RequestContent r6 = new org.apache.http.protocol.RequestContent
            r6.<init>()
            r0[r5] = r6
            r5 = 2
            org.apache.http.protocol.RequestTargetHost r6 = new org.apache.http.protocol.RequestTargetHost
            r6.<init>()
            r0[r5] = r6
            r5 = 3
            org.apache.http.client.protocol.RequestClientConnControl r6 = new org.apache.http.client.protocol.RequestClientConnControl
            r6.<init>()
            r0[r5] = r6
            r5 = 4
            org.apache.http.protocol.RequestUserAgent r6 = new org.apache.http.protocol.RequestUserAgent
            r6.<init>(r1)
            r0[r5] = r6
            r1 = 5
            org.apache.http.client.protocol.RequestExpectContinue r5 = new org.apache.http.client.protocol.RequestExpectContinue
            r5.<init>()
            r0[r1] = r5
            r4.addAll((org.apache.http.HttpRequestInterceptor[]) r0)
            boolean r0 = r10.cookieManagementDisabled
            if (r0 != 0) goto L_0x01aa
            org.apache.http.client.protocol.RequestAddCookies r0 = new org.apache.http.client.protocol.RequestAddCookies
            r0.<init>()
            r4.add((org.apache.http.HttpRequestInterceptor) r0)
        L_0x01aa:
            boolean r0 = r10.contentCompressionDisabled
            if (r0 != 0) goto L_0x01b6
            org.apache.http.client.protocol.RequestAcceptEncoding r0 = new org.apache.http.client.protocol.RequestAcceptEncoding
            r0.<init>()
            r4.add((org.apache.http.HttpRequestInterceptor) r0)
        L_0x01b6:
            boolean r0 = r10.authCachingDisabled
            if (r0 != 0) goto L_0x01c2
            org.apache.http.client.protocol.RequestAuthCache r0 = new org.apache.http.client.protocol.RequestAuthCache
            r0.<init>()
            r4.add((org.apache.http.HttpRequestInterceptor) r0)
        L_0x01c2:
            boolean r0 = r10.cookieManagementDisabled
            if (r0 != 0) goto L_0x01ce
            org.apache.http.client.protocol.ResponseProcessCookies r0 = new org.apache.http.client.protocol.ResponseProcessCookies
            r0.<init>()
            r4.add((org.apache.http.HttpResponseInterceptor) r0)
        L_0x01ce:
            boolean r0 = r10.contentCompressionDisabled
            if (r0 != 0) goto L_0x01da
            org.apache.http.client.protocol.ResponseContentEncoding r0 = new org.apache.http.client.protocol.ResponseContentEncoding
            r0.<init>()
            r4.add((org.apache.http.HttpResponseInterceptor) r0)
        L_0x01da:
            java.util.LinkedList<org.apache.http.HttpRequestInterceptor> r0 = r10.requestLast
            if (r0 == 0) goto L_0x01f4
            java.util.LinkedList<org.apache.http.HttpRequestInterceptor> r0 = r10.requestLast
            java.util.Iterator r1 = r0.iterator()
        L_0x01e4:
            boolean r0 = r1.hasNext()
            if (r0 == 0) goto L_0x01f4
            java.lang.Object r0 = r1.next()
            org.apache.http.HttpRequestInterceptor r0 = (org.apache.http.HttpRequestInterceptor) r0
            r4.addLast((org.apache.http.HttpRequestInterceptor) r0)
            goto L_0x01e4
        L_0x01f4:
            java.util.LinkedList<org.apache.http.HttpResponseInterceptor> r0 = r10.responseLast
            if (r0 == 0) goto L_0x020e
            java.util.LinkedList<org.apache.http.HttpResponseInterceptor> r0 = r10.responseLast
            java.util.Iterator r1 = r0.iterator()
        L_0x01fe:
            boolean r0 = r1.hasNext()
            if (r0 == 0) goto L_0x020e
            java.lang.Object r0 = r1.next()
            org.apache.http.HttpResponseInterceptor r0 = (org.apache.http.HttpResponseInterceptor) r0
            r4.addLast((org.apache.http.HttpResponseInterceptor) r0)
            goto L_0x01fe
        L_0x020e:
            org.apache.http.protocol.HttpProcessor r0 = r4.build()
        L_0x0212:
            org.apache.http.impl.execchain.ProtocolExec r1 = new org.apache.http.impl.execchain.ProtocolExec
            r1.<init>(r3, r0)
            org.apache.http.impl.execchain.ClientExecChain r3 = r10.decorateProtocolExec(r1)
            boolean r0 = r10.automaticRetriesDisabled
            if (r0 != 0) goto L_0x0352
            org.apache.http.client.HttpRequestRetryHandler r0 = r10.retryHandler
            if (r0 != 0) goto L_0x0225
            org.apache.http.impl.client.DefaultHttpRequestRetryHandler r0 = org.apache.http.impl.client.DefaultHttpRequestRetryHandler.INSTANCE
        L_0x0225:
            org.apache.http.impl.execchain.RetryExec r1 = new org.apache.http.impl.execchain.RetryExec
            r1.<init>(r3, r0)
            r0 = r1
        L_0x022b:
            org.apache.http.conn.routing.HttpRoutePlanner r3 = r10.routePlanner
            if (r3 != 0) goto L_0x0240
            org.apache.http.conn.SchemePortResolver r1 = r10.schemePortResolver
            if (r1 != 0) goto L_0x0235
            org.apache.http.impl.conn.DefaultSchemePortResolver r1 = org.apache.http.impl.conn.DefaultSchemePortResolver.INSTANCE
        L_0x0235:
            org.apache.http.HttpHost r3 = r10.proxy
            if (r3 == 0) goto L_0x0330
            org.apache.http.impl.conn.DefaultProxyRoutePlanner r3 = new org.apache.http.impl.conn.DefaultProxyRoutePlanner
            org.apache.http.HttpHost r4 = r10.proxy
            r3.<init>(r4, r1)
        L_0x0240:
            boolean r1 = r10.redirectHandlingDisabled
            if (r1 != 0) goto L_0x0250
            org.apache.http.client.RedirectStrategy r1 = r10.redirectStrategy
            if (r1 != 0) goto L_0x024a
            org.apache.http.impl.client.DefaultRedirectStrategy r1 = org.apache.http.impl.client.DefaultRedirectStrategy.INSTANCE
        L_0x024a:
            org.apache.http.impl.execchain.RedirectExec r4 = new org.apache.http.impl.execchain.RedirectExec
            r4.<init>(r0, r3, r1)
            r0 = r4
        L_0x0250:
            org.apache.http.client.ServiceUnavailableRetryStrategy r4 = r10.serviceUnavailStrategy
            if (r4 == 0) goto L_0x025a
            org.apache.http.impl.execchain.ServiceUnavailableRetryExec r1 = new org.apache.http.impl.execchain.ServiceUnavailableRetryExec
            r1.<init>(r0, r4)
            r0 = r1
        L_0x025a:
            org.apache.http.client.BackoffManager r4 = r10.backoffManager
            org.apache.http.client.ConnectionBackoffStrategy r5 = r10.connectionBackoffStrategy
            if (r4 == 0) goto L_0x034f
            if (r5 == 0) goto L_0x034f
            org.apache.http.impl.execchain.BackoffStrategyExec r1 = new org.apache.http.impl.execchain.BackoffStrategyExec
            r1.<init>(r0, r5, r4)
        L_0x0267:
            org.apache.http.config.Lookup<org.apache.http.auth.AuthSchemeProvider> r5 = r10.authSchemeRegistry
            if (r5 != 0) goto L_0x02aa
            org.apache.http.config.RegistryBuilder r0 = org.apache.http.config.RegistryBuilder.create()
            java.lang.String r4 = "Basic"
            org.apache.http.impl.auth.BasicSchemeFactory r5 = new org.apache.http.impl.auth.BasicSchemeFactory
            r5.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r5)
            java.lang.String r4 = "Digest"
            org.apache.http.impl.auth.DigestSchemeFactory r5 = new org.apache.http.impl.auth.DigestSchemeFactory
            r5.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r5)
            java.lang.String r4 = "NTLM"
            org.apache.http.impl.auth.NTLMSchemeFactory r5 = new org.apache.http.impl.auth.NTLMSchemeFactory
            r5.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r5)
            java.lang.String r4 = "negotiate"
            org.apache.http.impl.auth.SPNegoSchemeFactory r5 = new org.apache.http.impl.auth.SPNegoSchemeFactory
            r5.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r5)
            java.lang.String r4 = "Kerberos"
            org.apache.http.impl.auth.KerberosSchemeFactory r5 = new org.apache.http.impl.auth.KerberosSchemeFactory
            r5.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r5)
            org.apache.http.config.Registry r5 = r0.build()
        L_0x02aa:
            org.apache.http.config.Lookup<org.apache.http.cookie.CookieSpecProvider> r4 = r10.cookieSpecRegistry
            if (r4 != 0) goto L_0x0303
            org.apache.http.config.RegistryBuilder r0 = org.apache.http.config.RegistryBuilder.create()
            java.lang.String r4 = "best-match"
            org.apache.http.impl.cookie.BestMatchSpecFactory r6 = new org.apache.http.impl.cookie.BestMatchSpecFactory
            r6.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r6)
            java.lang.String r4 = "standard"
            org.apache.http.impl.cookie.RFC2965SpecFactory r6 = new org.apache.http.impl.cookie.RFC2965SpecFactory
            r6.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r6)
            java.lang.String r4 = "compatibility"
            org.apache.http.impl.cookie.BrowserCompatSpecFactory r6 = new org.apache.http.impl.cookie.BrowserCompatSpecFactory
            r6.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r6)
            java.lang.String r4 = "netscape"
            org.apache.http.impl.cookie.NetscapeDraftSpecFactory r6 = new org.apache.http.impl.cookie.NetscapeDraftSpecFactory
            r6.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r6)
            java.lang.String r4 = "ignoreCookies"
            org.apache.http.impl.cookie.IgnoreSpecFactory r6 = new org.apache.http.impl.cookie.IgnoreSpecFactory
            r6.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r6)
            java.lang.String r4 = "rfc2109"
            org.apache.http.impl.cookie.RFC2109SpecFactory r6 = new org.apache.http.impl.cookie.RFC2109SpecFactory
            r6.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r6)
            java.lang.String r4 = "rfc2965"
            org.apache.http.impl.cookie.RFC2965SpecFactory r6 = new org.apache.http.impl.cookie.RFC2965SpecFactory
            r6.<init>()
            org.apache.http.config.RegistryBuilder r0 = r0.register(r4, r6)
            org.apache.http.config.Registry r4 = r0.build()
        L_0x0303:
            org.apache.http.client.CookieStore r6 = r10.cookieStore
            if (r6 != 0) goto L_0x030c
            org.apache.http.impl.client.BasicCookieStore r6 = new org.apache.http.impl.client.BasicCookieStore
            r6.<init>()
        L_0x030c:
            org.apache.http.client.CredentialsProvider r7 = r10.credentialsProvider
            if (r7 != 0) goto L_0x0319
            boolean r0 = r10.systemProperties
            if (r0 == 0) goto L_0x0346
            org.apache.http.impl.client.SystemDefaultCredentialsProvider r7 = new org.apache.http.impl.client.SystemDefaultCredentialsProvider
            r7.<init>()
        L_0x0319:
            org.apache.http.client.config.RequestConfig r0 = r10.defaultRequestConfig
            if (r0 == 0) goto L_0x034c
            org.apache.http.client.config.RequestConfig r8 = r10.defaultRequestConfig
        L_0x031f:
            java.util.List<java.io.Closeable> r0 = r10.closeables
            if (r0 == 0) goto L_0x032a
            java.util.ArrayList r9 = new java.util.ArrayList
            java.util.List<java.io.Closeable> r0 = r10.closeables
            r9.<init>(r0)
        L_0x032a:
            org.apache.http.impl.client.InternalHttpClient r0 = new org.apache.http.impl.client.InternalHttpClient
            r0.<init>(r1, r2, r3, r4, r5, r6, r7, r8, r9)
            return r0
        L_0x0330:
            boolean r3 = r10.systemProperties
            if (r3 == 0) goto L_0x033f
            org.apache.http.impl.conn.SystemDefaultRoutePlanner r3 = new org.apache.http.impl.conn.SystemDefaultRoutePlanner
            java.net.ProxySelector r4 = java.net.ProxySelector.getDefault()
            r3.<init>(r1, r4)
            goto L_0x0240
        L_0x033f:
            org.apache.http.impl.conn.DefaultRoutePlanner r3 = new org.apache.http.impl.conn.DefaultRoutePlanner
            r3.<init>(r1)
            goto L_0x0240
        L_0x0346:
            org.apache.http.impl.client.BasicCredentialsProvider r7 = new org.apache.http.impl.client.BasicCredentialsProvider
            r7.<init>()
            goto L_0x0319
        L_0x034c:
            org.apache.http.client.config.RequestConfig r8 = org.apache.http.client.config.RequestConfig.DEFAULT
            goto L_0x031f
        L_0x034f:
            r1 = r0
            goto L_0x0267
        L_0x0352:
            r0 = r3
            goto L_0x022b
        L_0x0355:
            r1 = r0
            goto L_0x0101
        L_0x0358:
            r4 = r0
            goto L_0x0037
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.client.HttpClientBuilder.build():org.apache.http.impl.client.CloseableHttpClient");
    }

    /* access modifiers changed from: protected */
    public ClientExecChain decorateMainExec(ClientExecChain clientExecChain) {
        return clientExecChain;
    }

    /* access modifiers changed from: protected */
    public ClientExecChain decorateProtocolExec(ClientExecChain clientExecChain) {
        return clientExecChain;
    }

    public final HttpClientBuilder disableAuthCaching() {
        this.authCachingDisabled = true;
        return this;
    }

    public final HttpClientBuilder disableAutomaticRetries() {
        this.automaticRetriesDisabled = true;
        return this;
    }

    public final HttpClientBuilder disableConnectionState() {
        this.connectionStateDisabled = true;
        return this;
    }

    public final HttpClientBuilder disableContentCompression() {
        this.contentCompressionDisabled = true;
        return this;
    }

    public final HttpClientBuilder disableCookieManagement() {
        this.cookieManagementDisabled = true;
        return this;
    }

    public final HttpClientBuilder disableRedirectHandling() {
        this.redirectHandlingDisabled = true;
        return this;
    }

    public final HttpClientBuilder setBackoffManager(BackoffManager backoffManager2) {
        this.backoffManager = backoffManager2;
        return this;
    }

    public final HttpClientBuilder setConnectionBackoffStrategy(ConnectionBackoffStrategy connectionBackoffStrategy2) {
        this.connectionBackoffStrategy = connectionBackoffStrategy2;
        return this;
    }

    public final HttpClientBuilder setConnectionManager(HttpClientConnectionManager httpClientConnectionManager) {
        this.connManager = httpClientConnectionManager;
        return this;
    }

    public final HttpClientBuilder setConnectionReuseStrategy(ConnectionReuseStrategy connectionReuseStrategy) {
        this.reuseStrategy = connectionReuseStrategy;
        return this;
    }

    public final HttpClientBuilder setDefaultAuthSchemeRegistry(Lookup<AuthSchemeProvider> lookup) {
        this.authSchemeRegistry = lookup;
        return this;
    }

    public final HttpClientBuilder setDefaultConnectionConfig(ConnectionConfig connectionConfig) {
        this.defaultConnectionConfig = connectionConfig;
        return this;
    }

    public final HttpClientBuilder setDefaultCookieSpecRegistry(Lookup<CookieSpecProvider> lookup) {
        this.cookieSpecRegistry = lookup;
        return this;
    }

    public final HttpClientBuilder setDefaultCookieStore(CookieStore cookieStore2) {
        this.cookieStore = cookieStore2;
        return this;
    }

    public final HttpClientBuilder setDefaultCredentialsProvider(CredentialsProvider credentialsProvider2) {
        this.credentialsProvider = credentialsProvider2;
        return this;
    }

    public final HttpClientBuilder setDefaultHeaders(Collection<? extends Header> collection) {
        this.defaultHeaders = collection;
        return this;
    }

    public final HttpClientBuilder setDefaultRequestConfig(RequestConfig requestConfig) {
        this.defaultRequestConfig = requestConfig;
        return this;
    }

    public final HttpClientBuilder setDefaultSocketConfig(SocketConfig socketConfig) {
        this.defaultSocketConfig = socketConfig;
        return this;
    }

    public final HttpClientBuilder setHostnameVerifier(X509HostnameVerifier x509HostnameVerifier) {
        this.hostnameVerifier = x509HostnameVerifier;
        return this;
    }

    public final HttpClientBuilder setHttpProcessor(HttpProcessor httpProcessor) {
        this.httpprocessor = httpProcessor;
        return this;
    }

    public final HttpClientBuilder setKeepAliveStrategy(ConnectionKeepAliveStrategy connectionKeepAliveStrategy) {
        this.keepAliveStrategy = connectionKeepAliveStrategy;
        return this;
    }

    public final HttpClientBuilder setMaxConnPerRoute(int i) {
        this.maxConnPerRoute = i;
        return this;
    }

    public final HttpClientBuilder setMaxConnTotal(int i) {
        this.maxConnTotal = i;
        return this;
    }

    public final HttpClientBuilder setProxy(HttpHost httpHost) {
        this.proxy = httpHost;
        return this;
    }

    public final HttpClientBuilder setProxyAuthenticationStrategy(AuthenticationStrategy authenticationStrategy) {
        this.proxyAuthStrategy = authenticationStrategy;
        return this;
    }

    public final HttpClientBuilder setRedirectStrategy(RedirectStrategy redirectStrategy2) {
        this.redirectStrategy = redirectStrategy2;
        return this;
    }

    public final HttpClientBuilder setRequestExecutor(HttpRequestExecutor httpRequestExecutor) {
        this.requestExec = httpRequestExecutor;
        return this;
    }

    public final HttpClientBuilder setRetryHandler(HttpRequestRetryHandler httpRequestRetryHandler) {
        this.retryHandler = httpRequestRetryHandler;
        return this;
    }

    public final HttpClientBuilder setRoutePlanner(HttpRoutePlanner httpRoutePlanner) {
        this.routePlanner = httpRoutePlanner;
        return this;
    }

    public final HttpClientBuilder setSSLSocketFactory(LayeredConnectionSocketFactory layeredConnectionSocketFactory) {
        this.sslSocketFactory = layeredConnectionSocketFactory;
        return this;
    }

    public final HttpClientBuilder setSchemePortResolver(SchemePortResolver schemePortResolver2) {
        this.schemePortResolver = schemePortResolver2;
        return this;
    }

    public final HttpClientBuilder setServiceUnavailableRetryStrategy(ServiceUnavailableRetryStrategy serviceUnavailableRetryStrategy) {
        this.serviceUnavailStrategy = serviceUnavailableRetryStrategy;
        return this;
    }

    public final HttpClientBuilder setSslcontext(SSLContext sSLContext) {
        this.sslcontext = sSLContext;
        return this;
    }

    public final HttpClientBuilder setTargetAuthenticationStrategy(AuthenticationStrategy authenticationStrategy) {
        this.targetAuthStrategy = authenticationStrategy;
        return this;
    }

    public final HttpClientBuilder setUserAgent(String str) {
        this.userAgent = str;
        return this;
    }

    public final HttpClientBuilder setUserTokenHandler(UserTokenHandler userTokenHandler2) {
        this.userTokenHandler = userTokenHandler2;
        return this;
    }

    public final HttpClientBuilder useSystemProperties() {
        this.systemProperties = true;
        return this;
    }
}
