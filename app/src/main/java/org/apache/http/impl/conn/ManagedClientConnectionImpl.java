package org.apache.http.impl.conn;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetAddress;
import java.net.Socket;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import org.apache.http.HttpConnectionMetrics;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.RouteTracker;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@NotThreadSafe
@Deprecated
class ManagedClientConnectionImpl implements ManagedClientConnection {
    private volatile long duration = Long.MAX_VALUE;
    private final ClientConnectionManager manager;
    private final ClientConnectionOperator operator;
    private volatile HttpPoolEntry poolEntry;
    private volatile boolean reusable = false;

    ManagedClientConnectionImpl(ClientConnectionManager clientConnectionManager, ClientConnectionOperator clientConnectionOperator, HttpPoolEntry httpPoolEntry) {
        Args.notNull(clientConnectionManager, "Connection manager");
        Args.notNull(clientConnectionOperator, "Connection operator");
        Args.notNull(httpPoolEntry, "HTTP pool entry");
        this.manager = clientConnectionManager;
        this.operator = clientConnectionOperator;
        this.poolEntry = httpPoolEntry;
    }

    private OperatedClientConnection ensureConnection() {
        HttpPoolEntry httpPoolEntry = this.poolEntry;
        if (httpPoolEntry != null) {
            return (OperatedClientConnection) httpPoolEntry.getConnection();
        }
        throw new ConnectionShutdownException();
    }

    private HttpPoolEntry ensurePoolEntry() {
        HttpPoolEntry httpPoolEntry = this.poolEntry;
        if (httpPoolEntry != null) {
            return httpPoolEntry;
        }
        throw new ConnectionShutdownException();
    }

    private OperatedClientConnection getConnection() {
        HttpPoolEntry httpPoolEntry = this.poolEntry;
        if (httpPoolEntry == null) {
            return null;
        }
        return (OperatedClientConnection) httpPoolEntry.getConnection();
    }

    public void abortConnection() {
        synchronized (this) {
            if (this.poolEntry != null) {
                this.reusable = false;
                try {
                    ((OperatedClientConnection) this.poolEntry.getConnection()).shutdown();
                } catch (IOException e) {
                }
                this.manager.releaseConnection(this, this.duration, TimeUnit.MILLISECONDS);
                this.poolEntry = null;
            }
        }
    }

    public void bind(Socket socket) throws IOException {
        throw new UnsupportedOperationException();
    }

    public void close() throws IOException {
        HttpPoolEntry httpPoolEntry = this.poolEntry;
        if (httpPoolEntry != null) {
            httpPoolEntry.getTracker().reset();
            ((OperatedClientConnection) httpPoolEntry.getConnection()).close();
        }
    }

    /* access modifiers changed from: package-private */
    public HttpPoolEntry detach() {
        HttpPoolEntry httpPoolEntry = this.poolEntry;
        this.poolEntry = null;
        return httpPoolEntry;
    }

    public void flush() throws IOException {
        ensureConnection().flush();
    }

    public Object getAttribute(String str) {
        OperatedClientConnection ensureConnection = ensureConnection();
        if (ensureConnection instanceof HttpContext) {
            return ((HttpContext) ensureConnection).getAttribute(str);
        }
        return null;
    }

    public String getId() {
        return null;
    }

    public InetAddress getLocalAddress() {
        return ensureConnection().getLocalAddress();
    }

    public int getLocalPort() {
        return ensureConnection().getLocalPort();
    }

    public ClientConnectionManager getManager() {
        return this.manager;
    }

    public HttpConnectionMetrics getMetrics() {
        return ensureConnection().getMetrics();
    }

    /* access modifiers changed from: package-private */
    public HttpPoolEntry getPoolEntry() {
        return this.poolEntry;
    }

    public InetAddress getRemoteAddress() {
        return ensureConnection().getRemoteAddress();
    }

    public int getRemotePort() {
        return ensureConnection().getRemotePort();
    }

    public HttpRoute getRoute() {
        return ensurePoolEntry().getEffectiveRoute();
    }

    public SSLSession getSSLSession() {
        Socket socket = ensureConnection().getSocket();
        if (socket instanceof SSLSocket) {
            return ((SSLSocket) socket).getSession();
        }
        return null;
    }

    public Socket getSocket() {
        return ensureConnection().getSocket();
    }

    public int getSocketTimeout() {
        return ensureConnection().getSocketTimeout();
    }

    public Object getState() {
        return ensurePoolEntry().getState();
    }

    public boolean isMarkedReusable() {
        return this.reusable;
    }

    public boolean isOpen() {
        OperatedClientConnection connection = getConnection();
        if (connection != null) {
            return connection.isOpen();
        }
        return false;
    }

    public boolean isResponseAvailable(int i) throws IOException {
        return ensureConnection().isResponseAvailable(i);
    }

    public boolean isSecure() {
        return ensureConnection().isSecure();
    }

    public boolean isStale() {
        OperatedClientConnection connection = getConnection();
        if (connection != null) {
            return connection.isStale();
        }
        return true;
    }

    public void layerProtocol(HttpContext httpContext, HttpParams httpParams) throws IOException {
        HttpHost targetHost;
        OperatedClientConnection operatedClientConnection;
        Args.notNull(httpParams, "HTTP parameters");
        synchronized (this) {
            if (this.poolEntry == null) {
                throw new ConnectionShutdownException();
            }
            RouteTracker tracker = this.poolEntry.getTracker();
            Asserts.notNull(tracker, "Route tracker");
            Asserts.check(tracker.isConnected(), "Connection not open");
            Asserts.check(tracker.isTunnelled(), "Protocol layering without a tunnel not supported");
            Asserts.check(!tracker.isLayered(), "Multiple protocol layering not supported");
            targetHost = tracker.getTargetHost();
            operatedClientConnection = (OperatedClientConnection) this.poolEntry.getConnection();
        }
        this.operator.updateSecureConnection(operatedClientConnection, targetHost, httpContext, httpParams);
        synchronized (this) {
            if (this.poolEntry == null) {
                throw new InterruptedIOException();
            }
            this.poolEntry.getTracker().layerProtocol(operatedClientConnection.isSecure());
        }
    }

    public void markReusable() {
        this.reusable = true;
    }

    public void open(HttpRoute httpRoute, HttpContext httpContext, HttpParams httpParams) throws IOException {
        OperatedClientConnection operatedClientConnection;
        Args.notNull(httpRoute, "Route");
        Args.notNull(httpParams, "HTTP parameters");
        synchronized (this) {
            if (this.poolEntry == null) {
                throw new ConnectionShutdownException();
            }
            RouteTracker tracker = this.poolEntry.getTracker();
            Asserts.notNull(tracker, "Route tracker");
            Asserts.check(!tracker.isConnected(), "Connection already open");
            operatedClientConnection = (OperatedClientConnection) this.poolEntry.getConnection();
        }
        HttpHost proxyHost = httpRoute.getProxyHost();
        this.operator.openConnection(operatedClientConnection, proxyHost != null ? proxyHost : httpRoute.getTargetHost(), httpRoute.getLocalAddress(), httpContext, httpParams);
        synchronized (this) {
            if (this.poolEntry == null) {
                throw new InterruptedIOException();
            }
            RouteTracker tracker2 = this.poolEntry.getTracker();
            if (proxyHost == null) {
                tracker2.connectTarget(operatedClientConnection.isSecure());
            } else {
                tracker2.connectProxy(proxyHost, operatedClientConnection.isSecure());
            }
        }
    }

    public void receiveResponseEntity(HttpResponse httpResponse) throws HttpException, IOException {
        ensureConnection().receiveResponseEntity(httpResponse);
    }

    public HttpResponse receiveResponseHeader() throws HttpException, IOException {
        return ensureConnection().receiveResponseHeader();
    }

    public void releaseConnection() {
        synchronized (this) {
            if (this.poolEntry != null) {
                this.manager.releaseConnection(this, this.duration, TimeUnit.MILLISECONDS);
                this.poolEntry = null;
            }
        }
    }

    public Object removeAttribute(String str) {
        OperatedClientConnection ensureConnection = ensureConnection();
        if (ensureConnection instanceof HttpContext) {
            return ((HttpContext) ensureConnection).removeAttribute(str);
        }
        return null;
    }

    public void sendRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws HttpException, IOException {
        ensureConnection().sendRequestEntity(httpEntityEnclosingRequest);
    }

    public void sendRequestHeader(HttpRequest httpRequest) throws HttpException, IOException {
        ensureConnection().sendRequestHeader(httpRequest);
    }

    public void setAttribute(String str, Object obj) {
        OperatedClientConnection ensureConnection = ensureConnection();
        if (ensureConnection instanceof HttpContext) {
            ((HttpContext) ensureConnection).setAttribute(str, obj);
        }
    }

    public void setIdleDuration(long j, TimeUnit timeUnit) {
        if (j > 0) {
            this.duration = timeUnit.toMillis(j);
        } else {
            this.duration = -1;
        }
    }

    public void setSocketTimeout(int i) {
        ensureConnection().setSocketTimeout(i);
    }

    public void setState(Object obj) {
        ensurePoolEntry().setState(obj);
    }

    public void shutdown() throws IOException {
        HttpPoolEntry httpPoolEntry = this.poolEntry;
        if (httpPoolEntry != null) {
            httpPoolEntry.getTracker().reset();
            ((OperatedClientConnection) httpPoolEntry.getConnection()).shutdown();
        }
    }

    public void tunnelProxy(HttpHost httpHost, boolean z, HttpParams httpParams) throws IOException {
        OperatedClientConnection operatedClientConnection;
        Args.notNull(httpHost, "Next proxy");
        Args.notNull(httpParams, "HTTP parameters");
        synchronized (this) {
            if (this.poolEntry == null) {
                throw new ConnectionShutdownException();
            }
            RouteTracker tracker = this.poolEntry.getTracker();
            Asserts.notNull(tracker, "Route tracker");
            Asserts.check(tracker.isConnected(), "Connection not open");
            operatedClientConnection = (OperatedClientConnection) this.poolEntry.getConnection();
        }
        operatedClientConnection.update((Socket) null, httpHost, z, httpParams);
        synchronized (this) {
            if (this.poolEntry == null) {
                throw new InterruptedIOException();
            }
            this.poolEntry.getTracker().tunnelProxy(httpHost, z);
        }
    }

    public void tunnelTarget(boolean z, HttpParams httpParams) throws IOException {
        HttpHost targetHost;
        OperatedClientConnection operatedClientConnection;
        Args.notNull(httpParams, "HTTP parameters");
        synchronized (this) {
            if (this.poolEntry == null) {
                throw new ConnectionShutdownException();
            }
            RouteTracker tracker = this.poolEntry.getTracker();
            Asserts.notNull(tracker, "Route tracker");
            Asserts.check(tracker.isConnected(), "Connection not open");
            Asserts.check(!tracker.isTunnelled(), "Connection is already tunnelled");
            targetHost = tracker.getTargetHost();
            operatedClientConnection = (OperatedClientConnection) this.poolEntry.getConnection();
        }
        operatedClientConnection.update((Socket) null, targetHost, z, httpParams);
        synchronized (this) {
            if (this.poolEntry == null) {
                throw new InterruptedIOException();
            }
            this.poolEntry.getTracker().tunnelTarget(z);
        }
    }

    public void unmarkReusable() {
        this.reusable = false;
    }
}
