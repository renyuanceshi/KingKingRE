package org.apache.http.impl.conn;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpConnection;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.protocol.HttpContext;

@NotThreadSafe
class CPoolProxy implements InvocationHandler {
    private static final Method CLOSE_METHOD;
    private static final Method IS_OPEN_METHOD;
    private static final Method IS_STALE_METHOD;
    private static final Method SHUTDOWN_METHOD;
    private volatile CPoolEntry poolEntry;

    static {
        try {
            CLOSE_METHOD = HttpConnection.class.getMethod("close", new Class[0]);
            SHUTDOWN_METHOD = HttpConnection.class.getMethod("shutdown", new Class[0]);
            IS_OPEN_METHOD = HttpConnection.class.getMethod("isOpen", new Class[0]);
            IS_STALE_METHOD = HttpConnection.class.getMethod("isStale", new Class[0]);
        } catch (NoSuchMethodException e) {
            throw new Error(e);
        }
    }

    CPoolProxy(CPoolEntry cPoolEntry) {
        this.poolEntry = cPoolEntry;
    }

    public static CPoolEntry detach(HttpClientConnection httpClientConnection) {
        return getHandler(httpClientConnection).detach();
    }

    private static CPoolProxy getHandler(HttpClientConnection httpClientConnection) {
        InvocationHandler invocationHandler = Proxy.getInvocationHandler(httpClientConnection);
        if (CPoolProxy.class.isInstance(invocationHandler)) {
            return CPoolProxy.class.cast(invocationHandler);
        }
        throw new IllegalStateException("Unexpected proxy handler class: " + invocationHandler);
    }

    public static CPoolEntry getPoolEntry(HttpClientConnection httpClientConnection) {
        CPoolEntry poolEntry2 = getHandler(httpClientConnection).getPoolEntry();
        if (poolEntry2 != null) {
            return poolEntry2;
        }
        throw new ConnectionShutdownException();
    }

    public static HttpClientConnection newProxy(CPoolEntry cPoolEntry) {
        return (HttpClientConnection) Proxy.newProxyInstance(CPoolProxy.class.getClassLoader(), new Class[]{ManagedHttpClientConnection.class, HttpContext.class}, new CPoolProxy(cPoolEntry));
    }

    public void close() throws IOException {
        CPoolEntry cPoolEntry = this.poolEntry;
        if (cPoolEntry != null) {
            cPoolEntry.closeConnection();
        }
    }

    /* access modifiers changed from: package-private */
    public CPoolEntry detach() {
        CPoolEntry cPoolEntry = this.poolEntry;
        this.poolEntry = null;
        return cPoolEntry;
    }

    /* access modifiers changed from: package-private */
    public HttpClientConnection getConnection() {
        CPoolEntry cPoolEntry = this.poolEntry;
        if (cPoolEntry == null) {
            return null;
        }
        return (HttpClientConnection) cPoolEntry.getConnection();
    }

    /* access modifiers changed from: package-private */
    public CPoolEntry getPoolEntry() {
        return this.poolEntry;
    }

    public Object invoke(Object obj, Method method, Object[] objArr) throws Throwable {
        if (method.equals(CLOSE_METHOD)) {
            close();
            return null;
        } else if (method.equals(SHUTDOWN_METHOD)) {
            shutdown();
            return null;
        } else if (method.equals(IS_OPEN_METHOD)) {
            return Boolean.valueOf(isOpen());
        } else {
            if (method.equals(IS_STALE_METHOD)) {
                return Boolean.valueOf(isStale());
            }
            HttpClientConnection connection = getConnection();
            if (connection == null) {
                throw new ConnectionShutdownException();
            }
            try {
                return method.invoke(connection, objArr);
            } catch (InvocationTargetException e) {
                Throwable cause = e.getCause();
                if (cause != null) {
                    throw cause;
                }
                throw e;
            }
        }
    }

    public boolean isOpen() {
        CPoolEntry cPoolEntry = this.poolEntry;
        return cPoolEntry != null && !cPoolEntry.isClosed();
    }

    public boolean isStale() {
        HttpClientConnection connection = getConnection();
        if (connection != null) {
            return connection.isStale();
        }
        return true;
    }

    public void shutdown() throws IOException {
        CPoolEntry cPoolEntry = this.poolEntry;
        if (cPoolEntry != null) {
            cPoolEntry.shutdownConnection();
        }
    }
}
