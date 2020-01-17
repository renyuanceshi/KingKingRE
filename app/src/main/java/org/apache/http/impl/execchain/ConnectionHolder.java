package org.apache.http.impl.execchain;

import java.io.Closeable;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.http.HttpClientConnection;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.concurrent.Cancellable;
import org.apache.http.conn.ConnectionReleaseTrigger;
import org.apache.http.conn.HttpClientConnectionManager;

@ThreadSafe
class ConnectionHolder implements ConnectionReleaseTrigger, Cancellable, Closeable {
    private final Log log;
    private final HttpClientConnection managedConn;
    private final HttpClientConnectionManager manager;
    private volatile boolean released;
    private volatile boolean reusable;
    private volatile Object state;
    private volatile TimeUnit tunit;
    private volatile long validDuration;

    public ConnectionHolder(Log log2, HttpClientConnectionManager httpClientConnectionManager, HttpClientConnection httpClientConnection) {
        this.log = log2;
        this.manager = httpClientConnectionManager;
        this.managedConn = httpClientConnection;
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void abortConnection() {
        /*
            r8 = this;
            org.apache.http.HttpClientConnection r7 = r8.managedConn
            monitor-enter(r7)
            boolean r0 = r8.released     // Catch:{ all -> 0x0026 }
            if (r0 == 0) goto L_0x0009
            monitor-exit(r7)     // Catch:{ all -> 0x0026 }
        L_0x0008:
            return
        L_0x0009:
            r0 = 1
            r8.released = r0     // Catch:{ all -> 0x0026 }
            org.apache.http.HttpClientConnection r0 = r8.managedConn     // Catch:{ IOException -> 0x0029 }
            r0.shutdown()     // Catch:{ IOException -> 0x0029 }
            org.apache.commons.logging.Log r0 = r8.log     // Catch:{ IOException -> 0x0029 }
            java.lang.String r1 = "Connection discarded"
            r0.debug(r1)     // Catch:{ IOException -> 0x0029 }
            org.apache.http.conn.HttpClientConnectionManager r1 = r8.manager     // Catch:{ all -> 0x0026 }
            org.apache.http.HttpClientConnection r2 = r8.managedConn     // Catch:{ all -> 0x0026 }
            r3 = 0
            r4 = 0
            java.util.concurrent.TimeUnit r6 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ all -> 0x0026 }
            r1.releaseConnection(r2, r3, r4, r6)     // Catch:{ all -> 0x0026 }
        L_0x0024:
            monitor-exit(r7)     // Catch:{ all -> 0x0026 }
            goto L_0x0008
        L_0x0026:
            r0 = move-exception
            monitor-exit(r7)     // Catch:{ all -> 0x0026 }
            throw r0
        L_0x0029:
            r0 = move-exception
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x0048 }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ all -> 0x0048 }
            if (r1 == 0) goto L_0x003b
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x0048 }
            java.lang.String r2 = r0.getMessage()     // Catch:{ all -> 0x0048 }
            r1.debug(r2, r0)     // Catch:{ all -> 0x0048 }
        L_0x003b:
            org.apache.http.conn.HttpClientConnectionManager r1 = r8.manager     // Catch:{ all -> 0x0026 }
            org.apache.http.HttpClientConnection r2 = r8.managedConn     // Catch:{ all -> 0x0026 }
            r3 = 0
            r4 = 0
            java.util.concurrent.TimeUnit r6 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ all -> 0x0026 }
            r1.releaseConnection(r2, r3, r4, r6)     // Catch:{ all -> 0x0026 }
            goto L_0x0024
        L_0x0048:
            r0 = move-exception
            org.apache.http.conn.HttpClientConnectionManager r1 = r8.manager     // Catch:{ all -> 0x0026 }
            org.apache.http.HttpClientConnection r2 = r8.managedConn     // Catch:{ all -> 0x0026 }
            r3 = 0
            r4 = 0
            java.util.concurrent.TimeUnit r6 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ all -> 0x0026 }
            r1.releaseConnection(r2, r3, r4, r6)     // Catch:{ all -> 0x0026 }
            throw r0     // Catch:{ all -> 0x0026 }
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.execchain.ConnectionHolder.abortConnection():void");
    }

    public boolean cancel() {
        boolean z = this.released;
        this.log.debug("Cancelling request execution");
        abortConnection();
        return !z;
    }

    public void close() throws IOException {
        abortConnection();
    }

    public boolean isReleased() {
        return this.released;
    }

    public boolean isReusable() {
        return this.reusable;
    }

    public void markNonReusable() {
        this.reusable = false;
    }

    public void markReusable() {
        this.reusable = true;
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void releaseConnection() {
        /*
            r8 = this;
            org.apache.http.HttpClientConnection r7 = r8.managedConn
            monitor-enter(r7)
            boolean r0 = r8.released     // Catch:{ all -> 0x001f }
            if (r0 == 0) goto L_0x0009
            monitor-exit(r7)     // Catch:{ all -> 0x001f }
        L_0x0008:
            return
        L_0x0009:
            r0 = 1
            r8.released = r0     // Catch:{ all -> 0x001f }
            boolean r0 = r8.reusable     // Catch:{ all -> 0x001f }
            if (r0 == 0) goto L_0x0022
            org.apache.http.conn.HttpClientConnectionManager r1 = r8.manager     // Catch:{ all -> 0x001f }
            org.apache.http.HttpClientConnection r2 = r8.managedConn     // Catch:{ all -> 0x001f }
            java.lang.Object r3 = r8.state     // Catch:{ all -> 0x001f }
            long r4 = r8.validDuration     // Catch:{ all -> 0x001f }
            java.util.concurrent.TimeUnit r6 = r8.tunit     // Catch:{ all -> 0x001f }
            r1.releaseConnection(r2, r3, r4, r6)     // Catch:{ all -> 0x001f }
        L_0x001d:
            monitor-exit(r7)     // Catch:{ all -> 0x001f }
            goto L_0x0008
        L_0x001f:
            r0 = move-exception
            monitor-exit(r7)     // Catch:{ all -> 0x001f }
            throw r0
        L_0x0022:
            org.apache.http.HttpClientConnection r0 = r8.managedConn     // Catch:{ IOException -> 0x003b }
            r0.close()     // Catch:{ IOException -> 0x003b }
            org.apache.commons.logging.Log r0 = r8.log     // Catch:{ IOException -> 0x003b }
            java.lang.String r1 = "Connection discarded"
            r0.debug(r1)     // Catch:{ IOException -> 0x003b }
            org.apache.http.conn.HttpClientConnectionManager r1 = r8.manager     // Catch:{ all -> 0x001f }
            org.apache.http.HttpClientConnection r2 = r8.managedConn     // Catch:{ all -> 0x001f }
            r3 = 0
            r4 = 0
            java.util.concurrent.TimeUnit r6 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ all -> 0x001f }
            r1.releaseConnection(r2, r3, r4, r6)     // Catch:{ all -> 0x001f }
            goto L_0x001d
        L_0x003b:
            r0 = move-exception
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x005a }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ all -> 0x005a }
            if (r1 == 0) goto L_0x004d
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x005a }
            java.lang.String r2 = r0.getMessage()     // Catch:{ all -> 0x005a }
            r1.debug(r2, r0)     // Catch:{ all -> 0x005a }
        L_0x004d:
            org.apache.http.conn.HttpClientConnectionManager r1 = r8.manager     // Catch:{ all -> 0x001f }
            org.apache.http.HttpClientConnection r2 = r8.managedConn     // Catch:{ all -> 0x001f }
            r3 = 0
            r4 = 0
            java.util.concurrent.TimeUnit r6 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ all -> 0x001f }
            r1.releaseConnection(r2, r3, r4, r6)     // Catch:{ all -> 0x001f }
            goto L_0x001d
        L_0x005a:
            r0 = move-exception
            org.apache.http.conn.HttpClientConnectionManager r1 = r8.manager     // Catch:{ all -> 0x001f }
            org.apache.http.HttpClientConnection r2 = r8.managedConn     // Catch:{ all -> 0x001f }
            r3 = 0
            r4 = 0
            java.util.concurrent.TimeUnit r6 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ all -> 0x001f }
            r1.releaseConnection(r2, r3, r4, r6)     // Catch:{ all -> 0x001f }
            throw r0     // Catch:{ all -> 0x001f }
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.execchain.ConnectionHolder.releaseConnection():void");
    }

    public void setState(Object obj) {
        this.state = obj;
    }

    public void setValidFor(long j, TimeUnit timeUnit) {
        synchronized (this.managedConn) {
            this.validDuration = j;
            this.tunit = timeUnit;
        }
    }
}
