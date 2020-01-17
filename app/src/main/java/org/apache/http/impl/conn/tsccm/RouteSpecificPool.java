package org.apache.http.impl.conn.tsccm;

import java.util.LinkedList;
import java.util.Queue;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.conn.params.ConnPerRoute;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
public class RouteSpecificPool {
    protected final ConnPerRoute connPerRoute;
    protected final LinkedList<BasicPoolEntry> freeEntries;
    private final Log log = LogFactory.getLog(getClass());
    protected final int maxEntries;
    protected int numEntries;
    protected final HttpRoute route;
    protected final Queue<WaitingThread> waitingThreads;

    @Deprecated
    public RouteSpecificPool(HttpRoute httpRoute, int i) {
        this.route = httpRoute;
        this.maxEntries = i;
        this.connPerRoute = new ConnPerRoute() {
            public int getMaxForRoute(HttpRoute httpRoute) {
                return RouteSpecificPool.this.maxEntries;
            }
        };
        this.freeEntries = new LinkedList<>();
        this.waitingThreads = new LinkedList();
        this.numEntries = 0;
    }

    public RouteSpecificPool(HttpRoute httpRoute, ConnPerRoute connPerRoute2) {
        this.route = httpRoute;
        this.connPerRoute = connPerRoute2;
        this.maxEntries = connPerRoute2.getMaxForRoute(httpRoute);
        this.freeEntries = new LinkedList<>();
        this.waitingThreads = new LinkedList();
        this.numEntries = 0;
    }

    /* JADX WARNING: Removed duplicated region for block: B:5:0x001a  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public org.apache.http.impl.conn.tsccm.BasicPoolEntry allocEntry(java.lang.Object r5) {
        /*
            r4 = this;
            java.util.LinkedList<org.apache.http.impl.conn.tsccm.BasicPoolEntry> r0 = r4.freeEntries
            boolean r0 = r0.isEmpty()
            if (r0 != 0) goto L_0x0034
            java.util.LinkedList<org.apache.http.impl.conn.tsccm.BasicPoolEntry> r0 = r4.freeEntries
            java.util.LinkedList<org.apache.http.impl.conn.tsccm.BasicPoolEntry> r1 = r4.freeEntries
            int r1 = r1.size()
            java.util.ListIterator r1 = r0.listIterator(r1)
        L_0x0014:
            boolean r0 = r1.hasPrevious()
            if (r0 == 0) goto L_0x0034
            java.lang.Object r0 = r1.previous()
            org.apache.http.impl.conn.tsccm.BasicPoolEntry r0 = (org.apache.http.impl.conn.tsccm.BasicPoolEntry) r0
            java.lang.Object r2 = r0.getState()
            if (r2 == 0) goto L_0x0030
            java.lang.Object r2 = r0.getState()
            boolean r2 = org.apache.http.util.LangUtils.equals((java.lang.Object) r5, (java.lang.Object) r2)
            if (r2 == 0) goto L_0x0014
        L_0x0030:
            r1.remove()
        L_0x0033:
            return r0
        L_0x0034:
            int r0 = r4.getCapacity()
            if (r0 != 0) goto L_0x005e
            java.util.LinkedList<org.apache.http.impl.conn.tsccm.BasicPoolEntry> r0 = r4.freeEntries
            boolean r0 = r0.isEmpty()
            if (r0 != 0) goto L_0x005e
            java.util.LinkedList<org.apache.http.impl.conn.tsccm.BasicPoolEntry> r0 = r4.freeEntries
            java.lang.Object r0 = r0.remove()
            org.apache.http.impl.conn.tsccm.BasicPoolEntry r0 = (org.apache.http.impl.conn.tsccm.BasicPoolEntry) r0
            r0.shutdownEntry()
            org.apache.http.conn.OperatedClientConnection r1 = r0.getConnection()
            r1.close()     // Catch:{ IOException -> 0x0055 }
            goto L_0x0033
        L_0x0055:
            r1 = move-exception
            org.apache.commons.logging.Log r2 = r4.log
            java.lang.String r3 = "I/O error closing connection"
            r2.debug(r3, r1)
            goto L_0x0033
        L_0x005e:
            r0 = 0
            goto L_0x0033
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.conn.tsccm.RouteSpecificPool.allocEntry(java.lang.Object):org.apache.http.impl.conn.tsccm.BasicPoolEntry");
    }

    public void createdEntry(BasicPoolEntry basicPoolEntry) {
        Args.check(this.route.equals(basicPoolEntry.getPlannedRoute()), "Entry not planned for this pool");
        this.numEntries++;
    }

    public boolean deleteEntry(BasicPoolEntry basicPoolEntry) {
        boolean remove = this.freeEntries.remove(basicPoolEntry);
        if (remove) {
            this.numEntries--;
        }
        return remove;
    }

    public void dropEntry() {
        Asserts.check(this.numEntries > 0, "There is no entry that could be dropped");
        this.numEntries--;
    }

    public void freeEntry(BasicPoolEntry basicPoolEntry) {
        if (this.numEntries < 1) {
            throw new IllegalStateException("No entry created for this pool. " + this.route);
        } else if (this.numEntries <= this.freeEntries.size()) {
            throw new IllegalStateException("No entry allocated from this pool. " + this.route);
        } else {
            this.freeEntries.add(basicPoolEntry);
        }
    }

    public int getCapacity() {
        return this.connPerRoute.getMaxForRoute(this.route) - this.numEntries;
    }

    public final int getEntryCount() {
        return this.numEntries;
    }

    public final int getMaxEntries() {
        return this.maxEntries;
    }

    public final HttpRoute getRoute() {
        return this.route;
    }

    public boolean hasThread() {
        return !this.waitingThreads.isEmpty();
    }

    public boolean isUnused() {
        return this.numEntries < 1 && this.waitingThreads.isEmpty();
    }

    public WaitingThread nextThread() {
        return this.waitingThreads.peek();
    }

    public void queueThread(WaitingThread waitingThread) {
        Args.notNull(waitingThread, "Waiting thread");
        this.waitingThreads.add(waitingThread);
    }

    public void removeThread(WaitingThread waitingThread) {
        if (waitingThread != null) {
            this.waitingThreads.remove(waitingThread);
        }
    }
}
