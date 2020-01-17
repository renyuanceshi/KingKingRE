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
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.protocol.HttpContext;

@NotThreadSafe
@Deprecated
public abstract class AbstractClientConnAdapter implements ManagedClientConnection, HttpContext {
    private final ClientConnectionManager connManager;
    private volatile long duration = Long.MAX_VALUE;
    private volatile boolean markedReusable = false;
    private volatile boolean released = false;
    private volatile OperatedClientConnection wrappedConnection;

    protected AbstractClientConnAdapter(ClientConnectionManager clientConnectionManager, OperatedClientConnection operatedClientConnection) {
        this.connManager = clientConnectionManager;
        this.wrappedConnection = operatedClientConnection;
    }

    public void abortConnection() {
        synchronized (this) {
            if (!this.released) {
                this.released = true;
                unmarkReusable();
                try {
                    shutdown();
                } catch (IOException e) {
                }
                this.connManager.releaseConnection(this, this.duration, TimeUnit.MILLISECONDS);
            }
        }
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public final void assertNotAborted() throws InterruptedIOException {
        if (isReleased()) {
            throw new InterruptedIOException("Connection has been shut down");
        }
    }

    /* access modifiers changed from: protected */
    public final void assertValid(OperatedClientConnection operatedClientConnection) throws ConnectionShutdownException {
        if (isReleased() || operatedClientConnection == null) {
            throw new ConnectionShutdownException();
        }
    }

    public void bind(Socket socket) throws IOException {
        throw new UnsupportedOperationException();
    }

    /* access modifiers changed from: protected */
    public void detach() {
        synchronized (this) {
            this.wrappedConnection = null;
            this.duration = Long.MAX_VALUE;
        }
    }

    public void flush() throws IOException {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        wrappedConnection2.flush();
    }

    public Object getAttribute(String str) {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        if (wrappedConnection2 instanceof HttpContext) {
            return ((HttpContext) wrappedConnection2).getAttribute(str);
        }
        return null;
    }

    public InetAddress getLocalAddress() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        return wrappedConnection2.getLocalAddress();
    }

    public int getLocalPort() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        return wrappedConnection2.getLocalPort();
    }

    /* access modifiers changed from: protected */
    public ClientConnectionManager getManager() {
        return this.connManager;
    }

    public HttpConnectionMetrics getMetrics() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        return wrappedConnection2.getMetrics();
    }

    public InetAddress getRemoteAddress() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        return wrappedConnection2.getRemoteAddress();
    }

    public int getRemotePort() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        return wrappedConnection2.getRemotePort();
    }

    public SSLSession getSSLSession() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        if (!isOpen()) {
            return null;
        }
        Socket socket = wrappedConnection2.getSocket();
        if (socket instanceof SSLSocket) {
            return ((SSLSocket) socket).getSession();
        }
        return null;
    }

    public Socket getSocket() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        if (!isOpen()) {
            return null;
        }
        return wrappedConnection2.getSocket();
    }

    public int getSocketTimeout() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        return wrappedConnection2.getSocketTimeout();
    }

    /* access modifiers changed from: protected */
    public OperatedClientConnection getWrappedConnection() {
        return this.wrappedConnection;
    }

    public boolean isMarkedReusable() {
        return this.markedReusable;
    }

    public boolean isOpen() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        if (wrappedConnection2 == null) {
            return false;
        }
        return wrappedConnection2.isOpen();
    }

    /* access modifiers changed from: protected */
    public boolean isReleased() {
        return this.released;
    }

    public boolean isResponseAvailable(int i) throws IOException {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        return wrappedConnection2.isResponseAvailable(i);
    }

    public boolean isSecure() {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        return wrappedConnection2.isSecure();
    }

    public boolean isStale() {
        OperatedClientConnection wrappedConnection2;
        if (!isReleased() && (wrappedConnection2 = getWrappedConnection()) != null) {
            return wrappedConnection2.isStale();
        }
        return true;
    }

    public void markReusable() {
        this.markedReusable = true;
    }

    public void receiveResponseEntity(HttpResponse httpResponse) throws HttpException, IOException {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        unmarkReusable();
        wrappedConnection2.receiveResponseEntity(httpResponse);
    }

    public HttpResponse receiveResponseHeader() throws HttpException, IOException {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        unmarkReusable();
        return wrappedConnection2.receiveResponseHeader();
    }

    public void releaseConnection() {
        synchronized (this) {
            if (!this.released) {
                this.released = true;
                this.connManager.releaseConnection(this, this.duration, TimeUnit.MILLISECONDS);
            }
        }
    }

    public Object removeAttribute(String str) {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        if (wrappedConnection2 instanceof HttpContext) {
            return ((HttpContext) wrappedConnection2).removeAttribute(str);
        }
        return null;
    }

    public void sendRequestEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) throws HttpException, IOException {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        unmarkReusable();
        wrappedConnection2.sendRequestEntity(httpEntityEnclosingRequest);
    }

    public void sendRequestHeader(HttpRequest httpRequest) throws HttpException, IOException {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        unmarkReusable();
        wrappedConnection2.sendRequestHeader(httpRequest);
    }

    public void setAttribute(String str, Object obj) {
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        if (wrappedConnection2 instanceof HttpContext) {
            ((HttpContext) wrappedConnection2).setAttribute(str, obj);
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
        OperatedClientConnection wrappedConnection2 = getWrappedConnection();
        assertValid(wrappedConnection2);
        wrappedConnection2.setSocketTimeout(i);
    }

    public void unmarkReusable() {
        this.markedReusable = false;
    }
}
