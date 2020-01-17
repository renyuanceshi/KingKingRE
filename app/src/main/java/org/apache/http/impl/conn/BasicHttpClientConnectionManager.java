package org.apache.http.impl.conn;

import java.io.Closeable;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpHost;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.Lookup;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.ConnectionRequest;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.HttpConnectionFactory;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.LangUtils;

@ThreadSafe
public class BasicHttpClientConnectionManager implements HttpClientConnectionManager, Closeable {
    @GuardedBy("this")
    private ManagedHttpClientConnection conn;
    @GuardedBy("this")
    private ConnectionConfig connConfig;
    private final HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> connFactory;
    private final HttpClientConnectionOperator connectionOperator;
    @GuardedBy("this")
    private long expiry;
    @GuardedBy("this")
    private boolean leased;
    private final Log log;
    @GuardedBy("this")
    private HttpRoute route;
    @GuardedBy("this")
    private volatile boolean shutdown;
    @GuardedBy("this")
    private SocketConfig socketConfig;
    @GuardedBy("this")
    private Object state;
    @GuardedBy("this")
    private long updated;

    public BasicHttpClientConnectionManager() {
        this(getDefaultRegistry(), (HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection>) null, (SchemePortResolver) null, (DnsResolver) null);
    }

    public BasicHttpClientConnectionManager(Lookup<ConnectionSocketFactory> lookup) {
        this(lookup, (HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection>) null, (SchemePortResolver) null, (DnsResolver) null);
    }

    public BasicHttpClientConnectionManager(Lookup<ConnectionSocketFactory> lookup, HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> httpConnectionFactory) {
        this(lookup, httpConnectionFactory, (SchemePortResolver) null, (DnsResolver) null);
    }

    public BasicHttpClientConnectionManager(Lookup<ConnectionSocketFactory> lookup, HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection> httpConnectionFactory, SchemePortResolver schemePortResolver, DnsResolver dnsResolver) {
        this.log = LogFactory.getLog(getClass());
        this.connectionOperator = new HttpClientConnectionOperator(lookup, schemePortResolver, dnsResolver);
        this.connFactory = httpConnectionFactory == null ? ManagedHttpClientConnectionFactory.INSTANCE : httpConnectionFactory;
        this.expiry = Long.MAX_VALUE;
        this.socketConfig = SocketConfig.DEFAULT;
        this.connConfig = ConnectionConfig.DEFAULT;
    }

    private void checkExpiry() {
        if (this.conn != null && System.currentTimeMillis() >= this.expiry) {
            if (this.log.isDebugEnabled()) {
                this.log.debug("Connection expired @ " + new Date(this.expiry));
            }
            closeConnection();
        }
    }

    private void closeConnection() {
        if (this.conn != null) {
            this.log.debug("Closing connection");
            try {
                this.conn.close();
            } catch (IOException e) {
                if (this.log.isDebugEnabled()) {
                    this.log.debug("I/O exception closing connection", e);
                }
            }
            this.conn = null;
        }
    }

    private static Registry<ConnectionSocketFactory> getDefaultRegistry() {
        return RegistryBuilder.create().register(HttpHost.DEFAULT_SCHEME_NAME, PlainConnectionSocketFactory.getSocketFactory()).register("https", SSLConnectionSocketFactory.getSocketFactory()).build();
    }

    private void shutdownConnection() {
        if (this.conn != null) {
            this.log.debug("Shutting down connection");
            try {
                this.conn.shutdown();
            } catch (IOException e) {
                if (this.log.isDebugEnabled()) {
                    this.log.debug("I/O exception shutting down connection", e);
                }
            }
            this.conn = null;
        }
    }

    public void close() {
        shutdown();
    }

    public void closeExpiredConnections() {
        synchronized (this) {
            if (!this.shutdown) {
                if (!this.leased) {
                    checkExpiry();
                }
            }
        }
    }

    public void closeIdleConnections(long j, TimeUnit timeUnit) {
        long j2 = 0;
        synchronized (this) {
            Args.notNull(timeUnit, "Time unit");
            if (!this.shutdown) {
                if (!this.leased) {
                    long millis = timeUnit.toMillis(j);
                    if (millis >= 0) {
                        j2 = millis;
                    }
                    if (this.updated <= System.currentTimeMillis() - j2) {
                        closeConnection();
                    }
                }
            }
        }
    }

    public void connect(HttpClientConnection httpClientConnection, HttpRoute httpRoute, int i, HttpContext httpContext) throws IOException {
        Args.notNull(httpClientConnection, "Connection");
        Args.notNull(httpRoute, "HTTP route");
        Asserts.check(httpClientConnection == this.conn, "Connection not obtained from this manager");
        this.connectionOperator.connect(this.conn, httpRoute.getProxyHost() != null ? httpRoute.getProxyHost() : httpRoute.getTargetHost(), httpRoute.getLocalSocketAddress(), i, this.socketConfig, httpContext);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        try {
            shutdown();
        } finally {
            super.finalize();
        }
    }

    /* access modifiers changed from: package-private */
    public HttpClientConnection getConnection(HttpRoute httpRoute, Object obj) {
        ManagedHttpClientConnection managedHttpClientConnection;
        boolean z = true;
        synchronized (this) {
            Asserts.check(!this.shutdown, "Connection manager has been shut down");
            if (this.log.isDebugEnabled()) {
                this.log.debug("Get connection for route " + httpRoute);
            }
            if (this.leased) {
                z = false;
            }
            Asserts.check(z, "Connection is still allocated");
            if (!LangUtils.equals((Object) this.route, (Object) httpRoute) || !LangUtils.equals(this.state, obj)) {
                closeConnection();
            }
            this.route = httpRoute;
            this.state = obj;
            checkExpiry();
            if (this.conn == null) {
                this.conn = this.connFactory.create(httpRoute, this.connConfig);
            }
            this.leased = true;
            managedHttpClientConnection = this.conn;
        }
        return managedHttpClientConnection;
    }

    public ConnectionConfig getConnectionConfig() {
        ConnectionConfig connectionConfig;
        synchronized (this) {
            connectionConfig = this.connConfig;
        }
        return connectionConfig;
    }

    /* access modifiers changed from: package-private */
    public HttpRoute getRoute() {
        return this.route;
    }

    public SocketConfig getSocketConfig() {
        SocketConfig socketConfig2;
        synchronized (this) {
            socketConfig2 = this.socketConfig;
        }
        return socketConfig2;
    }

    /* access modifiers changed from: package-private */
    public Object getState() {
        return this.state;
    }

    /* JADX INFO: finally extract failed */
    public void releaseConnection(HttpClientConnection httpClientConnection, Object obj, long j, TimeUnit timeUnit) {
        boolean z = false;
        synchronized (this) {
            Args.notNull(httpClientConnection, "Connection");
            if (httpClientConnection == this.conn) {
                z = true;
            }
            Asserts.check(z, "Connection not obtained from this manager");
            if (this.log.isDebugEnabled()) {
                this.log.debug("Releasing connection " + httpClientConnection);
            }
            if (this.shutdown) {
                shutdownConnection();
            } else {
                try {
                    this.updated = System.currentTimeMillis();
                    if (!this.conn.isOpen()) {
                        this.conn = null;
                        this.route = null;
                        this.conn = null;
                        this.expiry = Long.MAX_VALUE;
                    } else {
                        this.state = obj;
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Connection can be kept alive " + (j > 0 ? "for " + j + StringUtils.SPACE + timeUnit : "indefinitely"));
                        }
                        if (j > 0) {
                            this.expiry = this.updated + timeUnit.toMillis(j);
                        } else {
                            this.expiry = Long.MAX_VALUE;
                        }
                    }
                    this.leased = false;
                } catch (Throwable th) {
                    this.leased = false;
                    throw th;
                }
            }
        }
    }

    public final ConnectionRequest requestConnection(final HttpRoute httpRoute, final Object obj) {
        Args.notNull(httpRoute, "Route");
        return new ConnectionRequest() {
            public boolean cancel() {
                return false;
            }

            public HttpClientConnection get(long j, TimeUnit timeUnit) {
                return BasicHttpClientConnectionManager.this.getConnection(httpRoute, obj);
            }
        };
    }

    public void routeComplete(HttpClientConnection httpClientConnection, HttpRoute httpRoute, HttpContext httpContext) throws IOException {
    }

    public void setConnectionConfig(ConnectionConfig connectionConfig) {
        synchronized (this) {
            if (connectionConfig == null) {
                connectionConfig = ConnectionConfig.DEFAULT;
            }
            this.connConfig = connectionConfig;
        }
    }

    public void setSocketConfig(SocketConfig socketConfig2) {
        synchronized (this) {
            if (socketConfig2 == null) {
                socketConfig2 = SocketConfig.DEFAULT;
            }
            this.socketConfig = socketConfig2;
        }
    }

    public void shutdown() {
        synchronized (this) {
            if (!this.shutdown) {
                this.shutdown = true;
                shutdownConnection();
            }
        }
    }

    public void upgrade(HttpClientConnection httpClientConnection, HttpRoute httpRoute, HttpContext httpContext) throws IOException {
        Args.notNull(httpClientConnection, "Connection");
        Args.notNull(httpRoute, "HTTP route");
        Asserts.check(httpClientConnection == this.conn, "Connection not obtained from this manager");
        this.connectionOperator.upgrade(this.conn, httpRoute.getTargetHost(), httpContext);
    }
}
