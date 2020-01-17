package org.apache.http.impl.conn.tsccm;

import java.util.concurrent.TimeUnit;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ClientConnectionRequest;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.params.ConnPerRouteBean;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.conn.DefaultClientConnectionOperator;
import org.apache.http.impl.conn.SchemeRegistryFactory;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@ThreadSafe
public class ThreadSafeClientConnManager implements ClientConnectionManager {
    protected final ClientConnectionOperator connOperator;
    protected final ConnPerRouteBean connPerRoute;
    protected final AbstractConnPool connectionPool;
    /* access modifiers changed from: private */
    public final Log log;
    protected final ConnPoolByRoute pool;
    protected final SchemeRegistry schemeRegistry;

    public ThreadSafeClientConnManager() {
        this(SchemeRegistryFactory.createDefault());
    }

    public ThreadSafeClientConnManager(SchemeRegistry schemeRegistry2) {
        this(schemeRegistry2, -1, TimeUnit.MILLISECONDS);
    }

    public ThreadSafeClientConnManager(SchemeRegistry schemeRegistry2, long j, TimeUnit timeUnit) {
        this(schemeRegistry2, j, timeUnit, new ConnPerRouteBean());
    }

    public ThreadSafeClientConnManager(SchemeRegistry schemeRegistry2, long j, TimeUnit timeUnit, ConnPerRouteBean connPerRouteBean) {
        Args.notNull(schemeRegistry2, "Scheme registry");
        this.log = LogFactory.getLog(getClass());
        this.schemeRegistry = schemeRegistry2;
        this.connPerRoute = connPerRouteBean;
        this.connOperator = createConnectionOperator(schemeRegistry2);
        this.pool = createConnectionPool(j, timeUnit);
        this.connectionPool = this.pool;
    }

    @Deprecated
    public ThreadSafeClientConnManager(HttpParams httpParams, SchemeRegistry schemeRegistry2) {
        Args.notNull(schemeRegistry2, "Scheme registry");
        this.log = LogFactory.getLog(getClass());
        this.schemeRegistry = schemeRegistry2;
        this.connPerRoute = new ConnPerRouteBean();
        this.connOperator = createConnectionOperator(schemeRegistry2);
        this.pool = (ConnPoolByRoute) createConnectionPool(httpParams);
        this.connectionPool = this.pool;
    }

    public void closeExpiredConnections() {
        this.log.debug("Closing expired connections");
        this.pool.closeExpiredConnections();
    }

    public void closeIdleConnections(long j, TimeUnit timeUnit) {
        if (this.log.isDebugEnabled()) {
            this.log.debug("Closing connections idle longer than " + j + StringUtils.SPACE + timeUnit);
        }
        this.pool.closeIdleConnections(j, timeUnit);
    }

    /* access modifiers changed from: protected */
    public ClientConnectionOperator createConnectionOperator(SchemeRegistry schemeRegistry2) {
        return new DefaultClientConnectionOperator(schemeRegistry2);
    }

    /* access modifiers changed from: protected */
    @Deprecated
    public AbstractConnPool createConnectionPool(HttpParams httpParams) {
        return new ConnPoolByRoute(this.connOperator, httpParams);
    }

    /* access modifiers changed from: protected */
    public ConnPoolByRoute createConnectionPool(long j, TimeUnit timeUnit) {
        return new ConnPoolByRoute(this.connOperator, this.connPerRoute, 20, j, timeUnit);
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        try {
            shutdown();
        } finally {
            super.finalize();
        }
    }

    public int getConnectionsInPool() {
        return this.pool.getConnectionsInPool();
    }

    public int getConnectionsInPool(HttpRoute httpRoute) {
        return this.pool.getConnectionsInPool(httpRoute);
    }

    public int getDefaultMaxPerRoute() {
        return this.connPerRoute.getDefaultMaxPerRoute();
    }

    public int getMaxForRoute(HttpRoute httpRoute) {
        return this.connPerRoute.getMaxForRoute(httpRoute);
    }

    public int getMaxTotal() {
        return this.pool.getMaxTotalConnections();
    }

    public SchemeRegistry getSchemeRegistry() {
        return this.schemeRegistry;
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:36:0x0073=Splitter:B:36:0x0073, B:18:0x0037=Splitter:B:18:0x0037} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void releaseConnection(org.apache.http.conn.ManagedClientConnection r9, long r10, java.util.concurrent.TimeUnit r12) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof org.apache.http.impl.conn.tsccm.BasicPooledConnAdapter
            java.lang.String r1 = "Connection class mismatch, connection not obtained from this manager"
            org.apache.http.util.Args.check(r0, r1)
            org.apache.http.impl.conn.tsccm.BasicPooledConnAdapter r9 = (org.apache.http.impl.conn.tsccm.BasicPooledConnAdapter) r9
            org.apache.http.impl.conn.AbstractPoolEntry r0 = r9.getPoolEntry()
            if (r0 == 0) goto L_0x001b
            org.apache.http.conn.ClientConnectionManager r0 = r9.getManager()
            if (r0 != r8) goto L_0x0026
            r0 = 1
        L_0x0016:
            java.lang.String r1 = "Connection not obtained from this manager"
            org.apache.http.util.Asserts.check(r0, r1)
        L_0x001b:
            monitor-enter(r9)
            org.apache.http.impl.conn.AbstractPoolEntry r2 = r9.getPoolEntry()     // Catch:{ all -> 0x0058 }
            org.apache.http.impl.conn.tsccm.BasicPoolEntry r2 = (org.apache.http.impl.conn.tsccm.BasicPoolEntry) r2     // Catch:{ all -> 0x0058 }
            if (r2 != 0) goto L_0x0028
            monitor-exit(r9)     // Catch:{ all -> 0x0058 }
        L_0x0025:
            return
        L_0x0026:
            r0 = 0
            goto L_0x0016
        L_0x0028:
            boolean r0 = r9.isOpen()     // Catch:{ IOException -> 0x0063 }
            if (r0 == 0) goto L_0x0037
            boolean r0 = r9.isMarkedReusable()     // Catch:{ IOException -> 0x0063 }
            if (r0 != 0) goto L_0x0037
            r9.shutdown()     // Catch:{ IOException -> 0x0063 }
        L_0x0037:
            boolean r3 = r9.isMarkedReusable()     // Catch:{ all -> 0x0058 }
            org.apache.commons.logging.Log r0 = r8.log     // Catch:{ all -> 0x0058 }
            boolean r0 = r0.isDebugEnabled()     // Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x004c
            if (r3 == 0) goto L_0x005b
            org.apache.commons.logging.Log r0 = r8.log     // Catch:{ all -> 0x0058 }
            java.lang.String r1 = "Released connection is reusable."
            r0.debug(r1)     // Catch:{ all -> 0x0058 }
        L_0x004c:
            r9.detach()     // Catch:{ all -> 0x0058 }
            org.apache.http.impl.conn.tsccm.ConnPoolByRoute r1 = r8.pool     // Catch:{ all -> 0x0058 }
            r4 = r10
            r6 = r12
            r1.freeEntry(r2, r3, r4, r6)     // Catch:{ all -> 0x0058 }
        L_0x0056:
            monitor-exit(r9)     // Catch:{ all -> 0x0058 }
            goto L_0x0025
        L_0x0058:
            r0 = move-exception
            monitor-exit(r9)     // Catch:{ all -> 0x0058 }
            throw r0
        L_0x005b:
            org.apache.commons.logging.Log r0 = r8.log     // Catch:{ all -> 0x0058 }
            java.lang.String r1 = "Released connection is not reusable."
            r0.debug(r1)     // Catch:{ all -> 0x0058 }
            goto L_0x004c
        L_0x0063:
            r0 = move-exception
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x009b }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ all -> 0x009b }
            if (r1 == 0) goto L_0x0073
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x009b }
            java.lang.String r3 = "Exception shutting down released connection."
            r1.debug(r3, r0)     // Catch:{ all -> 0x009b }
        L_0x0073:
            boolean r3 = r9.isMarkedReusable()     // Catch:{ all -> 0x0058 }
            org.apache.commons.logging.Log r0 = r8.log     // Catch:{ all -> 0x0058 }
            boolean r0 = r0.isDebugEnabled()     // Catch:{ all -> 0x0058 }
            if (r0 == 0) goto L_0x0088
            if (r3 == 0) goto L_0x0093
            org.apache.commons.logging.Log r0 = r8.log     // Catch:{ all -> 0x0058 }
            java.lang.String r1 = "Released connection is reusable."
            r0.debug(r1)     // Catch:{ all -> 0x0058 }
        L_0x0088:
            r9.detach()     // Catch:{ all -> 0x0058 }
            org.apache.http.impl.conn.tsccm.ConnPoolByRoute r1 = r8.pool     // Catch:{ all -> 0x0058 }
            r4 = r10
            r6 = r12
            r1.freeEntry(r2, r3, r4, r6)     // Catch:{ all -> 0x0058 }
            goto L_0x0056
        L_0x0093:
            org.apache.commons.logging.Log r0 = r8.log     // Catch:{ all -> 0x0058 }
            java.lang.String r1 = "Released connection is not reusable."
            r0.debug(r1)     // Catch:{ all -> 0x0058 }
            goto L_0x0088
        L_0x009b:
            r0 = move-exception
            boolean r3 = r9.isMarkedReusable()     // Catch:{ all -> 0x0058 }
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x0058 }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ all -> 0x0058 }
            if (r1 == 0) goto L_0x00b1
            if (r3 == 0) goto L_0x00bc
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x0058 }
            java.lang.String r4 = "Released connection is reusable."
            r1.debug(r4)     // Catch:{ all -> 0x0058 }
        L_0x00b1:
            r9.detach()     // Catch:{ all -> 0x0058 }
            org.apache.http.impl.conn.tsccm.ConnPoolByRoute r1 = r8.pool     // Catch:{ all -> 0x0058 }
            r4 = r10
            r6 = r12
            r1.freeEntry(r2, r3, r4, r6)     // Catch:{ all -> 0x0058 }
            throw r0     // Catch:{ all -> 0x0058 }
        L_0x00bc:
            org.apache.commons.logging.Log r1 = r8.log     // Catch:{ all -> 0x0058 }
            java.lang.String r4 = "Released connection is not reusable."
            r1.debug(r4)     // Catch:{ all -> 0x0058 }
            goto L_0x00b1
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager.releaseConnection(org.apache.http.conn.ManagedClientConnection, long, java.util.concurrent.TimeUnit):void");
    }

    public ClientConnectionRequest requestConnection(final HttpRoute httpRoute, Object obj) {
        final PoolEntryRequest requestPoolEntry = this.pool.requestPoolEntry(httpRoute, obj);
        return new ClientConnectionRequest() {
            public void abortRequest() {
                requestPoolEntry.abortRequest();
            }

            public ManagedClientConnection getConnection(long j, TimeUnit timeUnit) throws InterruptedException, ConnectionPoolTimeoutException {
                Args.notNull(httpRoute, "Route");
                if (ThreadSafeClientConnManager.this.log.isDebugEnabled()) {
                    ThreadSafeClientConnManager.this.log.debug("Get connection: " + httpRoute + ", timeout = " + j);
                }
                return new BasicPooledConnAdapter(ThreadSafeClientConnManager.this, requestPoolEntry.getPoolEntry(j, timeUnit));
            }
        };
    }

    public void setDefaultMaxPerRoute(int i) {
        this.connPerRoute.setDefaultMaxPerRoute(i);
    }

    public void setMaxForRoute(HttpRoute httpRoute, int i) {
        this.connPerRoute.setMaxForRoute(httpRoute, i);
    }

    public void setMaxTotal(int i) {
        this.pool.setMaxTotalConnections(i);
    }

    public void shutdown() {
        this.log.debug("Shutting down");
        this.pool.shutdown();
    }
}
