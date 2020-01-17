package org.apache.http.conn.routing;

import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;

@Immutable
public class BasicRouteDirector implements HttpRouteDirector {
    /* access modifiers changed from: protected */
    public int directStep(RouteInfo routeInfo, RouteInfo routeInfo2) {
        if (routeInfo2.getHopCount() <= 1 && routeInfo.getTargetHost().equals(routeInfo2.getTargetHost()) && routeInfo.isSecure() == routeInfo2.isSecure()) {
            return (routeInfo.getLocalAddress() == null || routeInfo.getLocalAddress().equals(routeInfo2.getLocalAddress())) ? 0 : -1;
        }
        return -1;
    }

    /* access modifiers changed from: protected */
    public int firstStep(RouteInfo routeInfo) {
        return routeInfo.getHopCount() > 1 ? 2 : 1;
    }

    public int nextStep(RouteInfo routeInfo, RouteInfo routeInfo2) {
        Args.notNull(routeInfo, "Planned route");
        return (routeInfo2 == null || routeInfo2.getHopCount() < 1) ? firstStep(routeInfo) : routeInfo.getHopCount() > 1 ? proxiedStep(routeInfo, routeInfo2) : directStep(routeInfo, routeInfo2);
    }

    /* access modifiers changed from: protected */
    public int proxiedStep(RouteInfo routeInfo, RouteInfo routeInfo2) {
        int hopCount;
        int hopCount2;
        if (routeInfo2.getHopCount() <= 1 || !routeInfo.getTargetHost().equals(routeInfo2.getTargetHost()) || (hopCount = routeInfo.getHopCount()) < (hopCount2 = routeInfo2.getHopCount())) {
            return -1;
        }
        for (int i = 0; i < hopCount2 - 1; i++) {
            if (!routeInfo.getHopTarget(i).equals(routeInfo2.getHopTarget(i))) {
                return -1;
            }
        }
        if (hopCount > hopCount2) {
            return 4;
        }
        if (routeInfo2.isTunnelled() && !routeInfo.isTunnelled()) {
            return -1;
        }
        if (routeInfo2.isLayered() && !routeInfo.isLayered()) {
            return -1;
        }
        if (routeInfo.isTunnelled() && !routeInfo2.isTunnelled()) {
            return 3;
        }
        if (!routeInfo.isLayered() || routeInfo2.isLayered()) {
            return routeInfo.isSecure() == routeInfo2.isSecure() ? 0 : -1;
        }
        return 5;
    }
}
