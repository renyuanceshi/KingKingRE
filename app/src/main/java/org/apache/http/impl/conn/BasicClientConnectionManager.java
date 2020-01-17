package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpClientConnection;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@ThreadSafe
public class BasicClientConnectionManager implements ClientConnectionManager {
    private static final AtomicLong COUNTER = new AtomicLong();
    public static final String MISUSE_MESSAGE = "Invalid use of BasicClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one.";
    @GuardedBy("this")
    private ManagedClientConnectionImpl conn;
    private final ClientConnectionOperator connOperator;
    private final Log log;
    @GuardedBy("this")
    private HttpPoolEntry poolEntry;
    private final SchemeRegistry schemeRegistry;
    @GuardedBy("this")
    private volatile boolean shutdown;

    public BasicClientConnectionManager() {
        this(SchemeRegistryFactory.createDefault());
    }

    public BasicClientConnectionManager(SchemeRegistry schemeRegistry2) {
        this.log = LogFactory.getLog(getClass());
        Args.notNull(schemeRegistry2, "Scheme registry");
        this.schemeRegistry = schemeRegistry2;
        this.connOperator = createConnectionOperator(schemeRegistry2);
    }

    private void assertNotShutdown() {
        Asserts.check(!this.shutdown, "Connection manager has been shut down");
    }

    private void shutdownConnection(HttpClientConnection httpClientConnection) {
        try {
            httpClientConnection.shutdown();
        } catch (IOException e) {
            if (this.log.isDebugEnabled()) {
                this.log.debug("I/O exception shutting down connection", e);
            }
        }
    }

    public void closeExpiredConnections() {
        synchronized (this) {
            assertNotShutdown();
            long currentTimeMillis = System.currentTimeMillis();
            if (this.poolEntry != null && this.poolEntry.isExpired(currentTimeMillis)) {
                this.poolEntry.close();
                this.poolEntry.getTracker().reset();
            }
        }
    }

    public void closeIdleConnections(long j, TimeUnit timeUnit) {
        long j2 = 0;
        Args.notNull(timeUnit, "Time unit");
        synchronized (this) {
            assertNotShutdown();
            long millis = timeUnit.toMillis(j);
            if (millis >= 0) {
                j2 = millis;
            }
            long currentTimeMillis = System.currentTimeMillis();
            if (this.poolEntry != null && this.poolEntry.getUpdated() <= currentTimeMillis - j2) {
                this.poolEntry.close();
                this.poolEntry.getTracker().reset();
            }
        }
    }

    /* access modifiers changed from: protected */
    public ClientConnectionOperator createConnectionOperator(SchemeRegistry schemeRegistry2) {
        return new DefaultClientConnectionOperator(schemeRegistry2);
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
    public ManagedClientConnection getConnection(HttpRoute httpRoute, Object obj) {
        ManagedClientConnectionImpl managedClientConnectionImpl;
        Args.notNull(httpRoute, "Route");
        synchronized (this) {
            assertNotShutdown();
            if (this.log.isDebugEnabled()) {
                this.log.debug("Get connection for route " + httpRoute);
            }
            Asserts.check(this.conn == null, MISUSE_MESSAGE);
            if (this.poolEntry != null && !this.poolEntry.getPlannedRoute().equals(httpRoute)) {
                this.poolEntry.close();
                this.poolEntry = null;
            }
            if (this.poolEntry == null) {
                this.poolEntry = new HttpPoolEntry(this.log, Long.toString(COUNTER.getAndIncrement()), httpRoute, this.connOperator.createConnection(), 0, TimeUnit.MILLISECONDS);
            }
            if (this.poolEntry.isExpired(System.currentTimeMillis())) {
                this.poolEntry.close();
                this.poolEntry.getTracker().reset();
            }
            this.conn = new ManagedClientConnectionImpl(this, this.connOperator, this.poolEntry);
            managedClientConnectionImpl = this.conn;
        }
        return managedClientConnectionImpl;
    }

    public SchemeRegistry getSchemeRegistry() {
        return this.schemeRegistry;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:65:?, code lost:
        return;
     */
    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void releaseConnection(org.apache.http.conn.ManagedClientConnection r7, long r8, java.util.concurrent.TimeUnit r10) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof org.apache.http.impl.conn.ManagedClientConnectionImpl
            java.lang.String r1 = "Connection class mismatch, connection not obtained from this manager"
            org.apache.http.util.Args.check(r0, r1)
            r0 = r7
            org.apache.http.impl.conn.ManagedClientConnectionImpl r0 = (org.apache.http.impl.conn.ManagedClientConnectionImpl) r0
            monitor-enter(r0)
            org.apache.commons.logging.Log r1 = r6.log     // Catch:{ all -> 0x004a }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ all -> 0x004a }
            if (r1 == 0) goto L_0x002b
            org.apache.commons.logging.Log r1 = r6.log     // Catch:{ all -> 0x004a }
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch:{ all -> 0x004a }
            r2.<init>()     // Catch:{ all -> 0x004a }
            java.lang.String r3 = "Releasing connection "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch:{ all -> 0x004a }
            java.lang.StringBuilder r2 = r2.append(r7)     // Catch:{ all -> 0x004a }
            java.lang.String r2 = r2.toString()     // Catch:{ all -> 0x004a }
            r1.debug(r2)     // Catch:{ all -> 0x004a }
        L_0x002b:
            org.apache.http.impl.conn.HttpPoolEntry r1 = r0.getPoolEntry()     // Catch:{ all -> 0x004a }
            if (r1 != 0) goto L_0x0033
            monitor-exit(r0)     // Catch:{ all -> 0x004a }
        L_0x0032:
            return
        L_0x0033:
            org.apache.http.conn.ClientConnectionManager r1 = r0.getManager()     // Catch:{ all -> 0x004a }
            if (r1 != r6) goto L_0x004d
            r1 = 1
        L_0x003a:
            java.lang.String r2 = "Connection not obtained from this manager"
            org.apache.http.util.Asserts.check(r1, r2)     // Catch:{ all -> 0x004a }
            monitor-enter(r6)     // Catch:{ all -> 0x004a }
            boolean r1 = r6.shutdown     // Catch:{ all -> 0x00dd }
            if (r1 == 0) goto L_0x004f
            r6.shutdownConnection(r0)     // Catch:{ all -> 0x00dd }
            monitor-exit(r6)     // Catch:{ all -> 0x00dd }
            monitor-exit(r0)     // Catch:{ all -> 0x004a }
            goto L_0x0032
        L_0x004a:
            r1 = move-exception
            monitor-exit(r0)     // Catch:{ all -> 0x004a }
            throw r1
        L_0x004d:
            r1 = 0
            goto L_0x003a
        L_0x004f:
            boolean r1 = r0.isOpen()     // Catch:{ all -> 0x00ca }
            if (r1 == 0) goto L_0x005e
            boolean r1 = r0.isMarkedReusable()     // Catch:{ all -> 0x00ca }
            if (r1 != 0) goto L_0x005e
            r6.shutdownConnection(r0)     // Catch:{ all -> 0x00ca }
        L_0x005e:
            boolean r1 = r0.isMarkedReusable()     // Catch:{ all -> 0x00ca }
            if (r1 == 0) goto L_0x00af
            org.apache.http.impl.conn.HttpPoolEntry r2 = r6.poolEntry     // Catch:{ all -> 0x00ca }
            if (r10 == 0) goto L_0x00c4
            r1 = r10
        L_0x0069:
            r2.updateExpiry(r8, r1)     // Catch:{ all -> 0x00ca }
            org.apache.commons.logging.Log r1 = r6.log     // Catch:{ all -> 0x00ca }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ all -> 0x00ca }
            if (r1 == 0) goto L_0x00af
            r2 = 0
            int r1 = (r8 > r2 ? 1 : (r8 == r2 ? 0 : -1))
            if (r1 <= 0) goto L_0x00c7
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ all -> 0x00ca }
            r1.<init>()     // Catch:{ all -> 0x00ca }
            java.lang.String r2 = "for "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x00ca }
            java.lang.StringBuilder r1 = r1.append(r8)     // Catch:{ all -> 0x00ca }
            java.lang.String r2 = " "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x00ca }
            java.lang.StringBuilder r1 = r1.append(r10)     // Catch:{ all -> 0x00ca }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x00ca }
        L_0x0097:
            org.apache.commons.logging.Log r2 = r6.log     // Catch:{ all -> 0x00ca }
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ all -> 0x00ca }
            r3.<init>()     // Catch:{ all -> 0x00ca }
            java.lang.String r4 = "Connection can be kept alive "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x00ca }
            java.lang.StringBuilder r1 = r3.append(r1)     // Catch:{ all -> 0x00ca }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x00ca }
            r2.debug(r1)     // Catch:{ all -> 0x00ca }
        L_0x00af:
            r0.detach()     // Catch:{ all -> 0x00dd }
            r1 = 0
            r6.conn = r1     // Catch:{ all -> 0x00dd }
            org.apache.http.impl.conn.HttpPoolEntry r1 = r6.poolEntry     // Catch:{ all -> 0x00dd }
            boolean r1 = r1.isClosed()     // Catch:{ all -> 0x00dd }
            if (r1 == 0) goto L_0x00c0
            r1 = 0
            r6.poolEntry = r1     // Catch:{ all -> 0x00dd }
        L_0x00c0:
            monitor-exit(r6)     // Catch:{ all -> 0x00dd }
            monitor-exit(r0)     // Catch:{ all -> 0x004a }
            goto L_0x0032
        L_0x00c4:
            java.util.concurrent.TimeUnit r1 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ all -> 0x00ca }
            goto L_0x0069
        L_0x00c7:
            java.lang.String r1 = "indefinitely"
            goto L_0x0097
        L_0x00ca:
            r1 = move-exception
            r0.detach()     // Catch:{ all -> 0x00dd }
            r2 = 0
            r6.conn = r2     // Catch:{ all -> 0x00dd }
            org.apache.http.impl.conn.HttpPoolEntry r2 = r6.poolEntry     // Catch:{ all -> 0x00dd }
            boolean r2 = r2.isClosed()     // Catch:{ all -> 0x00dd }
            if (r2 == 0) goto L_0x00dc
            r2 = 0
            r6.poolEntry = r2     // Catch:{ all -> 0x00dd }
        L_0x00dc:
            throw r1     // Catch:{ all -> 0x00dd }
        L_0x00dd:
            r1 = move-exception
            monitor-exit(r6)     // Catch:{ all -> 0x00dd }
            throw r1     // Catch:{ all -> 0x004a }
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.BasicClientConnectionManager.releaseConnection(org.apache.http.conn.ManagedClientConnection, long, java.util.concurrent.TimeUnit):void");
    }

    public final ClientConnectionRequest requestConnection(final HttpRoute httpRoute, final Object obj) {
        return new ClientConnectionRequest() {
            public void abortRequest() {
            }

            public ManagedClientConnection getConnection(long j, TimeUnit timeUnit) {
                return BasicClientConnectionManager.this.getConnection(httpRoute, obj);
            }
        };
    }

    public void shutdown() {
        synchronized (this) {
            this.shutdown = true;
            try {
                if (this.poolEntry != null) {
                    this.poolEntry.close();
                }
                this.poolEntry = null;
                this.conn = null;
            } catch (Throwable th) {
                this.poolEntry = null;
                this.conn = null;
                throw th;
            }
        }
    }
}
