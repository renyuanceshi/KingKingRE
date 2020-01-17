package org.apache.http.impl.conn;

import java.io.IOException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.pool.ConnPoolControl;
import org.apache.http.pool.PoolStats;
import org.apache.http.util.Args;

@Deprecated
@ThreadSafe
public class PoolingClientConnectionManager implements ClientConnectionManager, ConnPoolControl<HttpRoute> {
    private final DnsResolver dnsResolver;
    private final Log log;
    private final ClientConnectionOperator operator;
    private final HttpConnPool pool;
    private final SchemeRegistry schemeRegistry;

    public PoolingClientConnectionManager() {
        this(SchemeRegistryFactory.createDefault());
    }

    public PoolingClientConnectionManager(SchemeRegistry schemeRegistry2) {
        this(schemeRegistry2, -1, TimeUnit.MILLISECONDS);
    }

    public PoolingClientConnectionManager(SchemeRegistry schemeRegistry2, long j, TimeUnit timeUnit) {
        this(schemeRegistry2, j, timeUnit, new SystemDefaultDnsResolver());
    }

    public PoolingClientConnectionManager(SchemeRegistry schemeRegistry2, long j, TimeUnit timeUnit, DnsResolver dnsResolver2) {
        this.log = LogFactory.getLog(getClass());
        Args.notNull(schemeRegistry2, "Scheme registry");
        Args.notNull(dnsResolver2, "DNS resolver");
        this.schemeRegistry = schemeRegistry2;
        this.dnsResolver = dnsResolver2;
        this.operator = createConnectionOperator(schemeRegistry2);
        this.pool = new HttpConnPool(this.log, this.operator, 2, 20, j, timeUnit);
    }

    public PoolingClientConnectionManager(SchemeRegistry schemeRegistry2, DnsResolver dnsResolver2) {
        this(schemeRegistry2, -1, TimeUnit.MILLISECONDS, dnsResolver2);
    }

    private String format(HttpRoute httpRoute, Object obj) {
        StringBuilder sb = new StringBuilder();
        sb.append("[route: ").append(httpRoute).append("]");
        if (obj != null) {
            sb.append("[state: ").append(obj).append("]");
        }
        return sb.toString();
    }

    private String format(HttpPoolEntry httpPoolEntry) {
        StringBuilder sb = new StringBuilder();
        sb.append("[id: ").append(httpPoolEntry.getId()).append("]");
        sb.append("[route: ").append(httpPoolEntry.getRoute()).append("]");
        Object state = httpPoolEntry.getState();
        if (state != null) {
            sb.append("[state: ").append(state).append("]");
        }
        return sb.toString();
    }

    private String formatStats(HttpRoute httpRoute) {
        StringBuilder sb = new StringBuilder();
        PoolStats totalStats = this.pool.getTotalStats();
        PoolStats stats = this.pool.getStats(httpRoute);
        sb.append("[total kept alive: ").append(totalStats.getAvailable()).append("; ");
        sb.append("route allocated: ").append(stats.getLeased() + stats.getAvailable());
        sb.append(" of ").append(stats.getMax()).append("; ");
        sb.append("total allocated: ").append(totalStats.getLeased() + totalStats.getAvailable());
        sb.append(" of ").append(totalStats.getMax()).append("]");
        return sb.toString();
    }

    public void closeExpiredConnections() {
        this.log.debug("Closing expired connections");
        this.pool.closeExpired();
    }

    public void closeIdleConnections(long j, TimeUnit timeUnit) {
        if (this.log.isDebugEnabled()) {
            this.log.debug("Closing connections idle longer than " + j + StringUtils.SPACE + timeUnit);
        }
        this.pool.closeIdle(j, timeUnit);
    }

    /* access modifiers changed from: protected */
    public ClientConnectionOperator createConnectionOperator(SchemeRegistry schemeRegistry2) {
        return new DefaultClientConnectionOperator(schemeRegistry2, this.dnsResolver);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        try {
            shutdown();
        } finally {
            super.finalize();
        }
    }

    public int getDefaultMaxPerRoute() {
        return this.pool.getDefaultMaxPerRoute();
    }

    public int getMaxPerRoute(HttpRoute httpRoute) {
        return this.pool.getMaxPerRoute(httpRoute);
    }

    public int getMaxTotal() {
        return this.pool.getMaxTotal();
    }

    public SchemeRegistry getSchemeRegistry() {
        return this.schemeRegistry;
    }

    public PoolStats getStats(HttpRoute httpRoute) {
        return this.pool.getStats(httpRoute);
    }

    public PoolStats getTotalStats() {
        return this.pool.getTotalStats();
    }

    /* JADX WARNING: type inference failed for: r1v1, types: [java.lang.Throwable] */
    /* access modifiers changed from: package-private */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public org.apache.http.conn.ManagedClientConnection leaseConnection(java.util.concurrent.Future<org.apache.http.impl.conn.HttpPoolEntry> r5, long r6, java.util.concurrent.TimeUnit r8) throws java.lang.InterruptedException, org.apache.http.conn.ConnectionPoolTimeoutException {
        /*
            r4 = this;
            java.lang.Object r0 = r5.get(r6, r8)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            org.apache.http.impl.conn.HttpPoolEntry r0 = (org.apache.http.impl.conn.HttpPoolEntry) r0     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            if (r0 == 0) goto L_0x000e
            boolean r1 = r5.isCancelled()     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            if (r1 == 0) goto L_0x0028
        L_0x000e:
            java.lang.InterruptedException r0 = new java.lang.InterruptedException     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            r0.<init>()     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            throw r0     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
        L_0x0014:
            r0 = move-exception
            java.lang.Throwable r1 = r0.getCause()
            if (r1 != 0) goto L_0x0079
        L_0x001b:
            org.apache.commons.logging.Log r1 = r4.log
            java.lang.String r2 = "Unexpected exception leasing connection from pool"
            r1.error(r2, r0)
            java.lang.InterruptedException r0 = new java.lang.InterruptedException
            r0.<init>()
            throw r0
        L_0x0028:
            java.lang.Object r1 = r0.getConnection()     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            if (r1 == 0) goto L_0x006e
            r1 = 1
        L_0x002f:
            java.lang.String r2 = "Pool entry with no connection"
            org.apache.http.util.Asserts.check(r1, r2)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            org.apache.commons.logging.Log r1 = r4.log     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            if (r1 == 0) goto L_0x0066
            org.apache.commons.logging.Log r2 = r4.log     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            r1.<init>()     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            java.lang.String r3 = "Connection leased: "
            java.lang.StringBuilder r1 = r1.append(r3)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            java.lang.String r3 = r4.format(r0)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            java.lang.StringBuilder r3 = r1.append(r3)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            java.lang.Object r1 = r0.getRoute()     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            org.apache.http.conn.routing.HttpRoute r1 = (org.apache.http.conn.routing.HttpRoute) r1     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            java.lang.String r1 = r4.formatStats(r1)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            java.lang.StringBuilder r1 = r3.append(r1)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            java.lang.String r1 = r1.toString()     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            r2.debug(r1)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
        L_0x0066:
            org.apache.http.impl.conn.ManagedClientConnectionImpl r1 = new org.apache.http.impl.conn.ManagedClientConnectionImpl     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            org.apache.http.conn.ClientConnectionOperator r2 = r4.operator     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            r1.<init>(r4, r2, r0)     // Catch:{ ExecutionException -> 0x0014, TimeoutException -> 0x0070 }
            return r1
        L_0x006e:
            r1 = 0
            goto L_0x002f
        L_0x0070:
            r0 = move-exception
            org.apache.http.conn.ConnectionPoolTimeoutException r0 = new org.apache.http.conn.ConnectionPoolTimeoutException
            java.lang.String r1 = "Timeout waiting for connection from pool"
            r0.<init>(r1)
            throw r0
        L_0x0079:
            r0 = r1
            goto L_0x001b
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.PoolingClientConnectionManager.leaseConnection(java.util.concurrent.Future, long, java.util.concurrent.TimeUnit):org.apache.http.conn.ManagedClientConnection");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:50:?, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void releaseConnection(org.apache.http.conn.ManagedClientConnection r7, long r8, java.util.concurrent.TimeUnit r10) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof org.apache.http.impl.conn.ManagedClientConnectionImpl
            java.lang.String r1 = "Connection class mismatch, connection not obtained from this manager"
            org.apache.http.util.Args.check(r0, r1)
            org.apache.http.impl.conn.ManagedClientConnectionImpl r7 = (org.apache.http.impl.conn.ManagedClientConnectionImpl) r7
            org.apache.http.conn.ClientConnectionManager r0 = r7.getManager()
            if (r0 != r6) goto L_0x001e
            r0 = 1
        L_0x0010:
            java.lang.String r1 = "Connection not obtained from this manager"
            org.apache.http.util.Asserts.check(r0, r1)
            monitor-enter(r7)
            org.apache.http.impl.conn.HttpPoolEntry r1 = r7.detach()     // Catch:{ all -> 0x00ca }
            if (r1 != 0) goto L_0x0020
            monitor-exit(r7)     // Catch:{ all -> 0x00ca }
        L_0x001d:
            return
        L_0x001e:
            r0 = 0
            goto L_0x0010
        L_0x0020:
            boolean r0 = r7.isOpen()     // Catch:{ all -> 0x00df }
            if (r0 == 0) goto L_0x002f
            boolean r0 = r7.isMarkedReusable()     // Catch:{ all -> 0x00df }
            if (r0 != 0) goto L_0x002f
            r7.shutdown()     // Catch:{ IOException -> 0x00cd }
        L_0x002f:
            boolean r0 = r7.isMarkedReusable()     // Catch:{ all -> 0x00df }
            if (r0 == 0) goto L_0x008c
            if (r10 == 0) goto L_0x00ea
            r0 = r10
        L_0x0038:
            r1.updateExpiry(r8, r0)     // Catch:{ all -> 0x00df }
            org.apache.commons.logging.Log r0 = r6.log     // Catch:{ all -> 0x00df }
            boolean r0 = r0.isDebugEnabled()     // Catch:{ all -> 0x00df }
            if (r0 == 0) goto L_0x008c
            r2 = 0
            int r0 = (r8 > r2 ? 1 : (r8 == r2 ? 0 : -1))
            if (r0 <= 0) goto L_0x00ee
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ all -> 0x00df }
            r0.<init>()     // Catch:{ all -> 0x00df }
            java.lang.String r2 = "for "
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x00df }
            java.lang.StringBuilder r0 = r0.append(r8)     // Catch:{ all -> 0x00df }
            java.lang.String r2 = " "
            java.lang.StringBuilder r0 = r0.append(r2)     // Catch:{ all -> 0x00df }
            java.lang.StringBuilder r0 = r0.append(r10)     // Catch:{ all -> 0x00df }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x00df }
        L_0x0066:
            org.apache.commons.logging.Log r2 = r6.log     // Catch:{ all -> 0x00df }
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ all -> 0x00df }
            r3.<init>()     // Catch:{ all -> 0x00df }
            java.lang.String r4 = "Connection "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x00df }
            java.lang.String r4 = r6.format(r1)     // Catch:{ all -> 0x00df }
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x00df }
            java.lang.String r4 = " can be kept alive "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x00df }
            java.lang.StringBuilder r0 = r3.append(r0)     // Catch:{ all -> 0x00df }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x00df }
            r2.debug(r0)     // Catch:{ all -> 0x00df }
        L_0x008c:
            org.apache.http.impl.conn.HttpConnPool r0 = r6.pool     // Catch:{ all -> 0x00ca }
            boolean r2 = r7.isMarkedReusable()     // Catch:{ all -> 0x00ca }
            r0.release(r1, (boolean) r2)     // Catch:{ all -> 0x00ca }
            org.apache.commons.logging.Log r0 = r6.log     // Catch:{ all -> 0x00ca }
            boolean r0 = r0.isDebugEnabled()     // Catch:{ all -> 0x00ca }
            if (r0 == 0) goto L_0x00c7
            org.apache.commons.logging.Log r2 = r6.log     // Catch:{ all -> 0x00ca }
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ all -> 0x00ca }
            r0.<init>()     // Catch:{ all -> 0x00ca }
            java.lang.String r3 = "Connection released: "
            java.lang.StringBuilder r0 = r0.append(r3)     // Catch:{ all -> 0x00ca }
            java.lang.String r3 = r6.format(r1)     // Catch:{ all -> 0x00ca }
            java.lang.StringBuilder r3 = r0.append(r3)     // Catch:{ all -> 0x00ca }
            java.lang.Object r0 = r1.getRoute()     // Catch:{ all -> 0x00ca }
            org.apache.http.conn.routing.HttpRoute r0 = (org.apache.http.conn.routing.HttpRoute) r0     // Catch:{ all -> 0x00ca }
            java.lang.String r0 = r6.formatStats(r0)     // Catch:{ all -> 0x00ca }
            java.lang.StringBuilder r0 = r3.append(r0)     // Catch:{ all -> 0x00ca }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x00ca }
            r2.debug(r0)     // Catch:{ all -> 0x00ca }
        L_0x00c7:
            monitor-exit(r7)     // Catch:{ all -> 0x00ca }
            goto L_0x001d
        L_0x00ca:
            r0 = move-exception
            monitor-exit(r7)     // Catch:{ all -> 0x00ca }
            throw r0
        L_0x00cd:
            r0 = move-exception
            org.apache.commons.logging.Log r2 = r6.log     // Catch:{ all -> 0x00df }
            boolean r2 = r2.isDebugEnabled()     // Catch:{ all -> 0x00df }
            if (r2 == 0) goto L_0x002f
            org.apache.commons.logging.Log r2 = r6.log     // Catch:{ all -> 0x00df }
            java.lang.String r3 = "I/O exception shutting down released connection"
            r2.debug(r3, r0)     // Catch:{ all -> 0x00df }
            goto L_0x002f
        L_0x00df:
            r0 = move-exception
            org.apache.http.impl.conn.HttpConnPool r2 = r6.pool     // Catch:{ all -> 0x00ca }
            boolean r3 = r7.isMarkedReusable()     // Catch:{ all -> 0x00ca }
            r2.release(r1, (boolean) r3)     // Catch:{ all -> 0x00ca }
            throw r0     // Catch:{ all -> 0x00ca }
        L_0x00ea:
            java.util.concurrent.TimeUnit r0 = java.util.concurrent.TimeUnit.MILLISECONDS     // Catch:{ all -> 0x00df }
            goto L_0x0038
        L_0x00ee:
            java.lang.String r0 = "indefinitely"
            goto L_0x0066
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.PoolingClientConnectionManager.releaseConnection(org.apache.http.conn.ManagedClientConnection, long, java.util.concurrent.TimeUnit):void");
    }

    public ClientConnectionRequest requestConnection(HttpRoute httpRoute, Object obj) {
        Args.notNull(httpRoute, "HTTP route");
        if (this.log.isDebugEnabled()) {
            this.log.debug("Connection request: " + format(httpRoute, obj) + formatStats(httpRoute));
        }
        final Future lease = this.pool.lease(httpRoute, obj);
        return new ClientConnectionRequest() {
            public void abortRequest() {
                lease.cancel(true);
            }

            public ManagedClientConnection getConnection(long j, TimeUnit timeUnit) throws InterruptedException, ConnectionPoolTimeoutException {
                return PoolingClientConnectionManager.this.leaseConnection(lease, j, timeUnit);
            }
        };
    }

    public void setDefaultMaxPerRoute(int i) {
        this.pool.setDefaultMaxPerRoute(i);
    }

    public void setMaxPerRoute(HttpRoute httpRoute, int i) {
        this.pool.setMaxPerRoute(httpRoute, i);
    }

    public void setMaxTotal(int i) {
        this.pool.setMaxTotal(i);
    }

    public void shutdown() {
        this.log.debug("Connection manager is shutting down");
        try {
            this.pool.shutdown();
        } catch (IOException e) {
            this.log.debug("I/O exception shutting down connection manager", e);
        }
        this.log.debug("Connection manager shut down");
    }
}
