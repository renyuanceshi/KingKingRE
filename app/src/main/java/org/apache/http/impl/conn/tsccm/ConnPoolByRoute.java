package org.apache.http.impl.conn.tsccm;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ConnectionPoolTimeoutException;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.conn.params.ConnPerRoute;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
public class ConnPoolByRoute extends AbstractConnPool {
    protected final ConnPerRoute connPerRoute;
    private final long connTTL;
    private final TimeUnit connTTLTimeUnit;
    protected final Queue<BasicPoolEntry> freeConnections;
    protected final Set<BasicPoolEntry> leasedConnections;
    private final Log log;
    protected volatile int maxTotalConnections;
    protected volatile int numConnections;
    protected final ClientConnectionOperator operator;
    /* access modifiers changed from: private */
    public final Lock poolLock;
    protected final Map<HttpRoute, RouteSpecificPool> routeToPool;
    protected volatile boolean shutdown;
    protected final Queue<WaitingThread> waitingThreads;

    public ConnPoolByRoute(ClientConnectionOperator clientConnectionOperator, ConnPerRoute connPerRoute2, int i) {
        this(clientConnectionOperator, connPerRoute2, i, -1, TimeUnit.MILLISECONDS);
    }

    public ConnPoolByRoute(ClientConnectionOperator clientConnectionOperator, ConnPerRoute connPerRoute2, int i, long j, TimeUnit timeUnit) {
        this.log = LogFactory.getLog(getClass());
        Args.notNull(clientConnectionOperator, "Connection operator");
        Args.notNull(connPerRoute2, "Connections per route");
        this.poolLock = this.poolLock;
        this.leasedConnections = this.leasedConnections;
        this.operator = clientConnectionOperator;
        this.connPerRoute = connPerRoute2;
        this.maxTotalConnections = i;
        this.freeConnections = createFreeConnQueue();
        this.waitingThreads = createWaitingThreadQueue();
        this.routeToPool = createRouteToPoolMap();
        this.connTTL = j;
        this.connTTLTimeUnit = timeUnit;
    }

    @Deprecated
    public ConnPoolByRoute(ClientConnectionOperator clientConnectionOperator, HttpParams httpParams) {
        this(clientConnectionOperator, ConnManagerParams.getMaxConnectionsPerRoute(httpParams), ConnManagerParams.getMaxTotalConnections(httpParams));
    }

    private void closeConnection(BasicPoolEntry basicPoolEntry) {
        OperatedClientConnection connection = basicPoolEntry.getConnection();
        if (connection != null) {
            try {
                connection.close();
            } catch (IOException e) {
                this.log.debug("I/O error closing connection", e);
            }
        }
    }

    public void closeExpiredConnections() {
        this.log.debug("Closing expired connections");
        long currentTimeMillis = System.currentTimeMillis();
        this.poolLock.lock();
        try {
            Iterator it = this.freeConnections.iterator();
            while (it.hasNext()) {
                BasicPoolEntry basicPoolEntry = (BasicPoolEntry) it.next();
                if (basicPoolEntry.isExpired(currentTimeMillis)) {
                    if (this.log.isDebugEnabled()) {
                        this.log.debug("Closing connection expired @ " + new Date(basicPoolEntry.getExpiry()));
                    }
                    it.remove();
                    deleteEntry(basicPoolEntry);
                }
            }
        } finally {
            this.poolLock.unlock();
        }
    }

    public void closeIdleConnections(long j, TimeUnit timeUnit) {
        Args.notNull(timeUnit, "Time unit");
        if (j <= 0) {
            j = 0;
        }
        if (this.log.isDebugEnabled()) {
            this.log.debug("Closing connections idle longer than " + j + StringUtils.SPACE + timeUnit);
        }
        long currentTimeMillis = System.currentTimeMillis();
        long millis = timeUnit.toMillis(j);
        this.poolLock.lock();
        try {
            Iterator it = this.freeConnections.iterator();
            while (it.hasNext()) {
                BasicPoolEntry basicPoolEntry = (BasicPoolEntry) it.next();
                if (basicPoolEntry.getUpdated() <= currentTimeMillis - millis) {
                    if (this.log.isDebugEnabled()) {
                        this.log.debug("Closing connection last used @ " + new Date(basicPoolEntry.getUpdated()));
                    }
                    it.remove();
                    deleteEntry(basicPoolEntry);
                }
            }
        } finally {
            this.poolLock.unlock();
        }
    }

    /* access modifiers changed from: protected */
    public BasicPoolEntry createEntry(RouteSpecificPool routeSpecificPool, ClientConnectionOperator clientConnectionOperator) {
        if (this.log.isDebugEnabled()) {
            this.log.debug("Creating new connection [" + routeSpecificPool.getRoute() + "]");
        }
        BasicPoolEntry basicPoolEntry = new BasicPoolEntry(clientConnectionOperator, routeSpecificPool.getRoute(), this.connTTL, this.connTTLTimeUnit);
        this.poolLock.lock();
        try {
            routeSpecificPool.createdEntry(basicPoolEntry);
            this.numConnections++;
            this.leasedConnections.add(basicPoolEntry);
            return basicPoolEntry;
        } finally {
            this.poolLock.unlock();
        }
    }

    /* access modifiers changed from: protected */
    public Queue<BasicPoolEntry> createFreeConnQueue() {
        return new LinkedList();
    }

    /* access modifiers changed from: protected */
    public Map<HttpRoute, RouteSpecificPool> createRouteToPoolMap() {
        return new HashMap();
    }

    /* access modifiers changed from: protected */
    public Queue<WaitingThread> createWaitingThreadQueue() {
        return new LinkedList();
    }

    public void deleteClosedConnections() {
        this.poolLock.lock();
        try {
            Iterator it = this.freeConnections.iterator();
            while (it.hasNext()) {
                BasicPoolEntry basicPoolEntry = (BasicPoolEntry) it.next();
                if (!basicPoolEntry.getConnection().isOpen()) {
                    it.remove();
                    deleteEntry(basicPoolEntry);
                }
            }
        } finally {
            this.poolLock.unlock();
        }
    }

    /* access modifiers changed from: protected */
    public void deleteEntry(BasicPoolEntry basicPoolEntry) {
        HttpRoute plannedRoute = basicPoolEntry.getPlannedRoute();
        if (this.log.isDebugEnabled()) {
            this.log.debug("Deleting connection [" + plannedRoute + "][" + basicPoolEntry.getState() + "]");
        }
        this.poolLock.lock();
        try {
            closeConnection(basicPoolEntry);
            RouteSpecificPool routePool = getRoutePool(plannedRoute, true);
            routePool.deleteEntry(basicPoolEntry);
            this.numConnections--;
            if (routePool.isUnused()) {
                this.routeToPool.remove(plannedRoute);
            }
        } finally {
            this.poolLock.unlock();
        }
    }

    /* access modifiers changed from: protected */
    public void deleteLeastUsedEntry() {
        this.poolLock.lock();
        try {
            BasicPoolEntry remove = this.freeConnections.remove();
            if (remove != null) {
                deleteEntry(remove);
            } else if (this.log.isDebugEnabled()) {
                this.log.debug("No free connection to delete");
            }
        } finally {
            this.poolLock.unlock();
        }
    }

    public void freeEntry(BasicPoolEntry basicPoolEntry, boolean z, long j, TimeUnit timeUnit) {
        HttpRoute plannedRoute = basicPoolEntry.getPlannedRoute();
        if (this.log.isDebugEnabled()) {
            this.log.debug("Releasing connection [" + plannedRoute + "][" + basicPoolEntry.getState() + "]");
        }
        this.poolLock.lock();
        try {
            if (this.shutdown) {
                closeConnection(basicPoolEntry);
                return;
            }
            this.leasedConnections.remove(basicPoolEntry);
            RouteSpecificPool routePool = getRoutePool(plannedRoute, true);
            if (!z || routePool.getCapacity() < 0) {
                closeConnection(basicPoolEntry);
                routePool.dropEntry();
                this.numConnections--;
            } else {
                if (this.log.isDebugEnabled()) {
                    this.log.debug("Pooling connection [" + plannedRoute + "][" + basicPoolEntry.getState() + "]; keep alive " + (j > 0 ? "for " + j + StringUtils.SPACE + timeUnit : "indefinitely"));
                }
                routePool.freeEntry(basicPoolEntry);
                basicPoolEntry.updateExpiry(j, timeUnit);
                this.freeConnections.add(basicPoolEntry);
            }
            notifyWaitingThread(routePool);
            this.poolLock.unlock();
        } finally {
            this.poolLock.unlock();
        }
    }

    public int getConnectionsInPool() {
        this.poolLock.lock();
        try {
            return this.numConnections;
        } finally {
            this.poolLock.unlock();
        }
    }

    public int getConnectionsInPool(HttpRoute httpRoute) {
        int i = 0;
        this.poolLock.lock();
        try {
            RouteSpecificPool routePool = getRoutePool(httpRoute, false);
            if (routePool != null) {
                i = routePool.getEntryCount();
            }
            return i;
        } finally {
            this.poolLock.unlock();
        }
    }

    /* access modifiers changed from: protected */
    public BasicPoolEntry getEntryBlocking(HttpRoute httpRoute, Object obj, long j, TimeUnit timeUnit, WaitingThreadAborter waitingThreadAborter) throws ConnectionPoolTimeoutException, InterruptedException {
        WaitingThread waitingThread;
        RouteSpecificPool routePool;
        Date date = null;
        if (j > 0) {
            date = new Date(System.currentTimeMillis() + timeUnit.toMillis(j));
        }
        BasicPoolEntry basicPoolEntry = null;
        this.poolLock.lock();
        try {
            waitingThread = null;
            routePool = getRoutePool(httpRoute, true);
            while (basicPoolEntry == null) {
                Asserts.check(!this.shutdown, "Connection pool shut down");
                if (this.log.isDebugEnabled()) {
                    this.log.debug("[" + httpRoute + "] total kept alive: " + this.freeConnections.size() + ", total issued: " + this.leasedConnections.size() + ", total allocated: " + this.numConnections + " out of " + this.maxTotalConnections);
                }
                basicPoolEntry = getFreeEntry(routePool, obj);
                if (basicPoolEntry != null) {
                    break;
                }
                boolean z = routePool.getCapacity() > 0;
                if (this.log.isDebugEnabled()) {
                    this.log.debug("Available capacity: " + routePool.getCapacity() + " out of " + routePool.getMaxEntries() + " [" + httpRoute + "][" + obj + "]");
                }
                if (z && this.numConnections < this.maxTotalConnections) {
                    basicPoolEntry = createEntry(routePool, this.operator);
                } else if (!z || this.freeConnections.isEmpty()) {
                    if (this.log.isDebugEnabled()) {
                        this.log.debug("Need to wait for connection [" + httpRoute + "][" + obj + "]");
                    }
                    if (waitingThread == null) {
                        waitingThread = newWaitingThread(this.poolLock.newCondition(), routePool);
                        waitingThreadAborter.setWaitingThread(waitingThread);
                    }
                    routePool.queueThread(waitingThread);
                    this.waitingThreads.add(waitingThread);
                    boolean await = waitingThread.await(date);
                    routePool.removeThread(waitingThread);
                    this.waitingThreads.remove(waitingThread);
                    if (!await && date != null && date.getTime() <= System.currentTimeMillis()) {
                        throw new ConnectionPoolTimeoutException("Timeout waiting for connection from pool");
                    }
                } else {
                    deleteLeastUsedEntry();
                    RouteSpecificPool routePool2 = getRoutePool(httpRoute, true);
                    basicPoolEntry = createEntry(routePool2, this.operator);
                    routePool = routePool2;
                }
            }
            BasicPoolEntry basicPoolEntry2 = basicPoolEntry;
            this.poolLock.unlock();
            return basicPoolEntry2;
        } catch (Throwable th) {
            this.poolLock.unlock();
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public BasicPoolEntry getFreeEntry(RouteSpecificPool routeSpecificPool, Object obj) {
        BasicPoolEntry basicPoolEntry = null;
        this.poolLock.lock();
        boolean z = false;
        while (!z) {
            try {
                basicPoolEntry = routeSpecificPool.allocEntry(obj);
                if (basicPoolEntry != null) {
                    if (this.log.isDebugEnabled()) {
                        this.log.debug("Getting free connection [" + routeSpecificPool.getRoute() + "][" + obj + "]");
                    }
                    this.freeConnections.remove(basicPoolEntry);
                    if (basicPoolEntry.isExpired(System.currentTimeMillis())) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Closing expired free connection [" + routeSpecificPool.getRoute() + "][" + obj + "]");
                        }
                        closeConnection(basicPoolEntry);
                        routeSpecificPool.dropEntry();
                        this.numConnections--;
                    } else {
                        this.leasedConnections.add(basicPoolEntry);
                        z = true;
                    }
                } else if (this.log.isDebugEnabled()) {
                    this.log.debug("No free connections [" + routeSpecificPool.getRoute() + "][" + obj + "]");
                    z = true;
                } else {
                    z = true;
                }
            } catch (Throwable th) {
                this.poolLock.unlock();
                throw th;
            }
        }
        this.poolLock.unlock();
        return basicPoolEntry;
    }

    /* access modifiers changed from: protected */
    public Lock getLock() {
        return this.poolLock;
    }

    public int getMaxTotalConnections() {
        return this.maxTotalConnections;
    }

    /* access modifiers changed from: protected */
    public RouteSpecificPool getRoutePool(HttpRoute httpRoute, boolean z) {
        this.poolLock.lock();
        try {
            RouteSpecificPool routeSpecificPool = this.routeToPool.get(httpRoute);
            if (routeSpecificPool == null && z) {
                routeSpecificPool = newRouteSpecificPool(httpRoute);
                this.routeToPool.put(httpRoute, routeSpecificPool);
            }
            return routeSpecificPool;
        } finally {
            this.poolLock.unlock();
        }
    }

    /* access modifiers changed from: protected */
    public void handleLostEntry(HttpRoute httpRoute) {
        this.poolLock.lock();
        try {
            RouteSpecificPool routePool = getRoutePool(httpRoute, true);
            routePool.dropEntry();
            if (routePool.isUnused()) {
                this.routeToPool.remove(httpRoute);
            }
            this.numConnections--;
            notifyWaitingThread(routePool);
        } finally {
            this.poolLock.unlock();
        }
    }

    /* access modifiers changed from: protected */
    public RouteSpecificPool newRouteSpecificPool(HttpRoute httpRoute) {
        return new RouteSpecificPool(httpRoute, this.connPerRoute);
    }

    /* access modifiers changed from: protected */
    public WaitingThread newWaitingThread(Condition condition, RouteSpecificPool routeSpecificPool) {
        return new WaitingThread(condition, routeSpecificPool);
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x003e A[Catch:{ all -> 0x0077 }] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void notifyWaitingThread(org.apache.http.impl.conn.tsccm.RouteSpecificPool r4) {
        /*
            r3 = this;
            r0 = 0
            java.util.concurrent.locks.Lock r1 = r3.poolLock
            r1.lock()
            if (r4 == 0) goto L_0x0047
            boolean r1 = r4.hasThread()     // Catch:{ all -> 0x0077 }
            if (r1 == 0) goto L_0x0047
            org.apache.commons.logging.Log r0 = r3.log     // Catch:{ all -> 0x0077 }
            boolean r0 = r0.isDebugEnabled()     // Catch:{ all -> 0x0077 }
            if (r0 == 0) goto L_0x0038
            org.apache.commons.logging.Log r0 = r3.log     // Catch:{ all -> 0x0077 }
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ all -> 0x0077 }
            r1.<init>()     // Catch:{ all -> 0x0077 }
            java.lang.String r2 = "Notifying thread waiting on pool ["
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x0077 }
            org.apache.http.conn.routing.HttpRoute r2 = r4.getRoute()     // Catch:{ all -> 0x0077 }
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x0077 }
            java.lang.String r2 = "]"
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x0077 }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x0077 }
            r0.debug(r1)     // Catch:{ all -> 0x0077 }
        L_0x0038:
            org.apache.http.impl.conn.tsccm.WaitingThread r0 = r4.nextThread()     // Catch:{ all -> 0x0077 }
        L_0x003c:
            if (r0 == 0) goto L_0x0041
            r0.wakeup()     // Catch:{ all -> 0x0077 }
        L_0x0041:
            java.util.concurrent.locks.Lock r0 = r3.poolLock
            r0.unlock()
            return
        L_0x0047:
            java.util.Queue<org.apache.http.impl.conn.tsccm.WaitingThread> r1 = r3.waitingThreads     // Catch:{ all -> 0x0077 }
            boolean r1 = r1.isEmpty()     // Catch:{ all -> 0x0077 }
            if (r1 != 0) goto L_0x0067
            org.apache.commons.logging.Log r0 = r3.log     // Catch:{ all -> 0x0077 }
            boolean r0 = r0.isDebugEnabled()     // Catch:{ all -> 0x0077 }
            if (r0 == 0) goto L_0x005e
            org.apache.commons.logging.Log r0 = r3.log     // Catch:{ all -> 0x0077 }
            java.lang.String r1 = "Notifying thread waiting on any pool"
            r0.debug(r1)     // Catch:{ all -> 0x0077 }
        L_0x005e:
            java.util.Queue<org.apache.http.impl.conn.tsccm.WaitingThread> r0 = r3.waitingThreads     // Catch:{ all -> 0x0077 }
            java.lang.Object r0 = r0.remove()     // Catch:{ all -> 0x0077 }
            org.apache.http.impl.conn.tsccm.WaitingThread r0 = (org.apache.http.impl.conn.tsccm.WaitingThread) r0     // Catch:{ all -> 0x0077 }
            goto L_0x003c
        L_0x0067:
            org.apache.commons.logging.Log r1 = r3.log     // Catch:{ all -> 0x0077 }
            boolean r1 = r1.isDebugEnabled()     // Catch:{ all -> 0x0077 }
            if (r1 == 0) goto L_0x003c
            org.apache.commons.logging.Log r1 = r3.log     // Catch:{ all -> 0x0077 }
            java.lang.String r2 = "Notifying no-one, there are no waiting threads"
            r1.debug(r2)     // Catch:{ all -> 0x0077 }
            goto L_0x003c
        L_0x0077:
            r0 = move-exception
            java.util.concurrent.locks.Lock r1 = r3.poolLock
            r1.unlock()
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.tsccm.ConnPoolByRoute.notifyWaitingThread(org.apache.http.impl.conn.tsccm.RouteSpecificPool):void");
    }

    public PoolEntryRequest requestPoolEntry(final HttpRoute httpRoute, final Object obj) {
        final WaitingThreadAborter waitingThreadAborter = new WaitingThreadAborter();
        return new PoolEntryRequest() {
            public void abortRequest() {
                ConnPoolByRoute.this.poolLock.lock();
                try {
                    waitingThreadAborter.abort();
                } finally {
                    ConnPoolByRoute.this.poolLock.unlock();
                }
            }

            public BasicPoolEntry getPoolEntry(long j, TimeUnit timeUnit) throws InterruptedException, ConnectionPoolTimeoutException {
                return ConnPoolByRoute.this.getEntryBlocking(httpRoute, obj, j, timeUnit, waitingThreadAborter);
            }
        };
    }

    public void setMaxTotalConnections(int i) {
        this.poolLock.lock();
        try {
            this.maxTotalConnections = i;
        } finally {
            this.poolLock.unlock();
        }
    }

    public void shutdown() {
        this.poolLock.lock();
        try {
            if (!this.shutdown) {
                this.shutdown = true;
                Iterator<BasicPoolEntry> it = this.leasedConnections.iterator();
                while (it.hasNext()) {
                    it.remove();
                    closeConnection(it.next());
                }
                Iterator it2 = this.freeConnections.iterator();
                while (it2.hasNext()) {
                    BasicPoolEntry basicPoolEntry = (BasicPoolEntry) it2.next();
                    it2.remove();
                    if (this.log.isDebugEnabled()) {
                        this.log.debug("Closing connection [" + basicPoolEntry.getPlannedRoute() + "][" + basicPoolEntry.getState() + "]");
                    }
                    closeConnection(basicPoolEntry);
                }
                Iterator it3 = this.waitingThreads.iterator();
                while (it3.hasNext()) {
                    it3.remove();
                    ((WaitingThread) it3.next()).wakeup();
                }
                this.routeToPool.clear();
                this.poolLock.unlock();
            }
        } finally {
            this.poolLock.unlock();
        }
    }
}
