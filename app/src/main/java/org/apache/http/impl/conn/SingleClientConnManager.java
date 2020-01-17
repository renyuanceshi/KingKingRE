package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.concurrent.TimeUnit;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.annotation.GuardedBy;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.RouteTracker;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@ThreadSafe
public class SingleClientConnManager implements ClientConnectionManager {
    public static final String MISUSE_MESSAGE = "Invalid use of SingleClientConnManager: connection still allocated.\nMake sure to release the connection before allocating another one.";
    protected final boolean alwaysShutDown;
    protected final ClientConnectionOperator connOperator;
    @GuardedBy("this")
    protected volatile long connectionExpiresTime;
    protected volatile boolean isShutDown;
    @GuardedBy("this")
    protected volatile long lastReleaseTime;
    private final Log log;
    @GuardedBy("this")
    protected volatile ConnAdapter managedConn;
    protected final SchemeRegistry schemeRegistry;
    @GuardedBy("this")
    protected volatile PoolEntry uniquePoolEntry;

    protected class ConnAdapter extends AbstractPooledConnAdapter {
        protected ConnAdapter(PoolEntry poolEntry, HttpRoute httpRoute) {
            super(SingleClientConnManager.this, poolEntry);
            markReusable();
            poolEntry.route = httpRoute;
        }
    }

    protected class PoolEntry extends AbstractPoolEntry {
        protected PoolEntry() {
            super(SingleClientConnManager.this.connOperator, (HttpRoute) null);
        }

        /* access modifiers changed from: protected */
        public void close() throws IOException {
            shutdownEntry();
            if (this.connection.isOpen()) {
                this.connection.close();
            }
        }

        /* access modifiers changed from: protected */
        public void shutdown() throws IOException {
            shutdownEntry();
            if (this.connection.isOpen()) {
                this.connection.shutdown();
            }
        }
    }

    public SingleClientConnManager() {
        this(SchemeRegistryFactory.createDefault());
    }

    public SingleClientConnManager(SchemeRegistry schemeRegistry2) {
        this.log = LogFactory.getLog(getClass());
        Args.notNull(schemeRegistry2, "Scheme registry");
        this.schemeRegistry = schemeRegistry2;
        this.connOperator = createConnectionOperator(schemeRegistry2);
        this.uniquePoolEntry = new PoolEntry();
        this.managedConn = null;
        this.lastReleaseTime = -1;
        this.alwaysShutDown = false;
        this.isShutDown = false;
    }

    @Deprecated
    public SingleClientConnManager(HttpParams httpParams, SchemeRegistry schemeRegistry2) {
        this(schemeRegistry2);
    }

    /* access modifiers changed from: protected */
    public final void assertStillUp() throws IllegalStateException {
        Asserts.check(!this.isShutDown, "Manager is shut down");
    }

    public void closeExpiredConnections() {
        if (System.currentTimeMillis() >= this.connectionExpiresTime) {
            closeIdleConnections(0, TimeUnit.MILLISECONDS);
        }
    }

    public void closeIdleConnections(long j, TimeUnit timeUnit) {
        assertStillUp();
        Args.notNull(timeUnit, "Time unit");
        synchronized (this) {
            if (this.managedConn == null && this.uniquePoolEntry.connection.isOpen()) {
                if (this.lastReleaseTime <= System.currentTimeMillis() - timeUnit.toMillis(j)) {
                    try {
                        this.uniquePoolEntry.close();
                    } catch (IOException e) {
                        this.log.debug("Problem closing idle connection.", e);
                    }
                }
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

    public ManagedClientConnection getConnection(HttpRoute httpRoute, Object obj) {
        boolean z;
        boolean z2;
        ConnAdapter connAdapter;
        Args.notNull(httpRoute, "Route");
        assertStillUp();
        if (this.log.isDebugEnabled()) {
            this.log.debug("Get connection for route " + httpRoute);
        }
        synchronized (this) {
            Asserts.check(this.managedConn == null, MISUSE_MESSAGE);
            closeExpiredConnections();
            if (this.uniquePoolEntry.connection.isOpen()) {
                RouteTracker routeTracker = this.uniquePoolEntry.tracker;
                if (routeTracker == null || !routeTracker.toRoute().equals(httpRoute)) {
                    z = true;
                    z2 = false;
                } else {
                    z = false;
                    z2 = false;
                }
            } else {
                z = false;
                z2 = true;
            }
            if (z) {
                try {
                    this.uniquePoolEntry.shutdown();
                    z2 = true;
                } catch (IOException e) {
                    this.log.debug("Problem shutting down connection.", e);
                    z2 = true;
                }
            }
            if (z2) {
                this.uniquePoolEntry = new PoolEntry();
            }
            this.managedConn = new ConnAdapter(this.uniquePoolEntry, httpRoute);
            connAdapter = this.managedConn;
        }
        return connAdapter;
    }

    public SchemeRegistry getSchemeRegistry() {
        return this.schemeRegistry;
    }

    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:52:0x00a0=Splitter:B:52:0x00a0, B:24:0x0063=Splitter:B:24:0x0063, B:33:0x007e=Splitter:B:33:0x007e} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void releaseConnection(org.apache.http.conn.ManagedClientConnection r7, long r8, java.util.concurrent.TimeUnit r10) {
        /*
            r6 = this;
            r4 = 0
            boolean r0 = r7 instanceof org.apache.http.impl.conn.SingleClientConnManager.ConnAdapter
            java.lang.String r1 = "Connection class mismatch, connection not obtained from this manager"
            org.apache.http.util.Args.check(r0, r1)
            r6.assertStillUp()
            org.apache.commons.logging.Log r0 = r6.log
            boolean r0 = r0.isDebugEnabled()
            if (r0 == 0) goto L_0x002c
            org.apache.commons.logging.Log r0 = r6.log
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>()
            java.lang.String r2 = "Releasing connection "
            java.lang.StringBuilder r1 = r1.append(r2)
            java.lang.StringBuilder r1 = r1.append(r7)
            java.lang.String r1 = r1.toString()
            r0.debug(r1)
        L_0x002c:
            org.apache.http.impl.conn.SingleClientConnManager$ConnAdapter r7 = (org.apache.http.impl.conn.SingleClientConnManager.ConnAdapter) r7
            monitor-enter(r7)
            org.apache.http.impl.conn.AbstractPoolEntry r0 = r7.poolEntry     // Catch:{ all -> 0x0080 }
            if (r0 != 0) goto L_0x0035
            monitor-exit(r7)     // Catch:{ all -> 0x0080 }
        L_0x0034:
            return
        L_0x0035:
            org.apache.http.conn.ClientConnectionManager r0 = r7.getManager()     // Catch:{ all -> 0x0080 }
            if (r0 != r6) goto L_0x0083
            r0 = 1
        L_0x003c:
            java.lang.String r1 = "Connection not obtained from this manager"
            org.apache.http.util.Asserts.check(r0, r1)     // Catch:{ all -> 0x0080 }
            boolean r0 = r7.isOpen()     // Catch:{ IOException -> 0x0090 }
            if (r0 == 0) goto L_0x0063
            boolean r0 = r6.alwaysShutDown     // Catch:{ IOException -> 0x0090 }
            if (r0 != 0) goto L_0x0051
            boolean r0 = r7.isMarkedReusable()     // Catch:{ IOException -> 0x0090 }
            if (r0 != 0) goto L_0x0063
        L_0x0051:
            org.apache.commons.logging.Log r0 = r6.log     // Catch:{ IOException -> 0x0090 }
            boolean r0 = r0.isDebugEnabled()     // Catch:{ IOException -> 0x0090 }
            if (r0 == 0) goto L_0x0060
            org.apache.commons.logging.Log r0 = r6.log     // Catch:{ IOException -> 0x0090 }
            java.lang.String r1 = "Released connection open but not reusable."
            r0.debug(r1)     // Catch:{ IOException -> 0x0090 }
        L_0x0060:
            r7.shutdown()     // Catch:{ IOException -> 0x0090 }
        L_0x0063:
            r7.detach()     // Catch:{ all -> 0x0080 }
            monitor-enter(r6)     // Catch:{ all -> 0x0080 }
            r0 = 0
            r6.managedConn = r0     // Catch:{ all -> 0x008d }
            long r0 = java.lang.System.currentTimeMillis()     // Catch:{ all -> 0x008d }
            r6.lastReleaseTime = r0     // Catch:{ all -> 0x008d }
            int r0 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r0 <= 0) goto L_0x0085
            long r0 = r10.toMillis(r8)     // Catch:{ all -> 0x008d }
            long r2 = r6.lastReleaseTime     // Catch:{ all -> 0x008d }
            long r0 = r0 + r2
            r6.connectionExpiresTime = r0     // Catch:{ all -> 0x008d }
        L_0x007d:
            monitor-exit(r6)     // Catch:{ all -> 0x008d }
        L_0x007e:
            monitor-exit(r7)     // Catch:{ all -> 0x0080 }
            goto L_0x0034
        L_0x0080:
            r0 = move-exception
            monitor-exit(r7)     // Catch:{ all -> 0x0080 }
            throw r0
        L_0x0083:
            r0 = 0
            goto L_0x003c
        L_0x0085:
            r0 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            r6.connectionExpiresTime = r0     // Catch:{ all -> 0x008d }
            goto L_0x007d
        L_0x008d:
            r0 = move-exception
            monitor-exit(r6)     // Catch:{ all -> 0x008d }
            throw r0     // Catch:{ all -> 0x0080 }
        L_0x0090:
            r0 = move-exception
            org.apache.commons.logging.Log r1 = r6.log     // Catch:{ all -> 0x00c7 }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ all -> 0x00c7 }
            if (r1 == 0) goto L_0x00a0
            org.apache.commons.logging.Log r1 = r6.log     // Catch:{ all -> 0x00c7 }
            java.lang.String r2 = "Exception shutting down released connection."
            r1.debug(r2, r0)     // Catch:{ all -> 0x00c7 }
        L_0x00a0:
            r7.detach()     // Catch:{ all -> 0x0080 }
            monitor-enter(r6)     // Catch:{ all -> 0x0080 }
            r0 = 0
            r6.managedConn = r0     // Catch:{ all -> 0x00bc }
            long r0 = java.lang.System.currentTimeMillis()     // Catch:{ all -> 0x00bc }
            r6.lastReleaseTime = r0     // Catch:{ all -> 0x00bc }
            int r0 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r0 <= 0) goto L_0x00bf
            long r0 = r10.toMillis(r8)     // Catch:{ all -> 0x00bc }
            long r2 = r6.lastReleaseTime     // Catch:{ all -> 0x00bc }
            long r0 = r0 + r2
            r6.connectionExpiresTime = r0     // Catch:{ all -> 0x00bc }
        L_0x00ba:
            monitor-exit(r6)     // Catch:{ all -> 0x00bc }
            goto L_0x007e
        L_0x00bc:
            r0 = move-exception
            monitor-exit(r6)     // Catch:{ all -> 0x00bc }
            throw r0     // Catch:{ all -> 0x0080 }
        L_0x00bf:
            r0 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            r6.connectionExpiresTime = r0     // Catch:{ all -> 0x00bc }
            goto L_0x00ba
        L_0x00c7:
            r0 = move-exception
            r7.detach()     // Catch:{ all -> 0x0080 }
            monitor-enter(r6)     // Catch:{ all -> 0x0080 }
            r1 = 0
            r6.managedConn = r1     // Catch:{ all -> 0x00ec }
            long r2 = java.lang.System.currentTimeMillis()     // Catch:{ all -> 0x00ec }
            r6.lastReleaseTime = r2     // Catch:{ all -> 0x00ec }
            int r1 = (r8 > r4 ? 1 : (r8 == r4 ? 0 : -1))
            if (r1 <= 0) goto L_0x00e4
            long r2 = r10.toMillis(r8)     // Catch:{ all -> 0x00ec }
            long r4 = r6.lastReleaseTime     // Catch:{ all -> 0x00ec }
            long r2 = r2 + r4
            r6.connectionExpiresTime = r2     // Catch:{ all -> 0x00ec }
        L_0x00e2:
            monitor-exit(r6)     // Catch:{ all -> 0x00ec }
            throw r0     // Catch:{ all -> 0x0080 }
        L_0x00e4:
            r2 = 9223372036854775807(0x7fffffffffffffff, double:NaN)
            r6.connectionExpiresTime = r2     // Catch:{ all -> 0x00ec }
            goto L_0x00e2
        L_0x00ec:
            r0 = move-exception
            monitor-exit(r6)     // Catch:{ all -> 0x00ec }
            throw r0     // Catch:{ all -> 0x0080 }
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.SingleClientConnManager.releaseConnection(org.apache.http.conn.ManagedClientConnection, long, java.util.concurrent.TimeUnit):void");
    }

    public final ClientConnectionRequest requestConnection(final HttpRoute httpRoute, final Object obj) {
        return new ClientConnectionRequest() {
            public void abortRequest() {
            }

            public ManagedClientConnection getConnection(long j, TimeUnit timeUnit) {
                return SingleClientConnManager.this.getConnection(httpRoute, obj);
            }
        };
    }

    /* access modifiers changed from: protected */
    public void revokeConnection() {
        ConnAdapter connAdapter = this.managedConn;
        if (connAdapter != null) {
            connAdapter.detach();
            synchronized (this) {
                try {
                    this.uniquePoolEntry.shutdown();
                } catch (IOException e) {
                    this.log.debug("Problem while shutting down connection.", e);
                }
            }
            return;
        }
        return;
    }

    public void shutdown() {
        this.isShutDown = true;
        synchronized (this) {
            try {
                if (this.uniquePoolEntry != null) {
                    this.uniquePoolEntry.shutdown();
                }
                this.uniquePoolEntry = null;
                this.managedConn = null;
            } catch (IOException e) {
                this.log.debug("Problem while shutting down manager.", e);
                this.uniquePoolEntry = null;
                this.managedConn = null;
            } catch (Throwable th) {
                this.uniquePoolEntry = null;
                this.managedConn = null;
                throw th;
            }
        }
    }
}
