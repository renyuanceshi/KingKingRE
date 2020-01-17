package org.apache.http.conn.routing;

import java.net.InetAddress;
import org.apache.http.HttpHost;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.routing.RouteInfo;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;
import org.apache.http.util.LangUtils;

@NotThreadSafe
public final class RouteTracker implements RouteInfo, Cloneable {
    private boolean connected;
    private RouteInfo.LayerType layered;
    private final InetAddress localAddress;
    private HttpHost[] proxyChain;
    private boolean secure;
    private final HttpHost targetHost;
    private RouteInfo.TunnelType tunnelled;

    public RouteTracker(HttpHost httpHost, InetAddress inetAddress) {
        Args.notNull(httpHost, "Target host");
        this.targetHost = httpHost;
        this.localAddress = inetAddress;
        this.tunnelled = RouteInfo.TunnelType.PLAIN;
        this.layered = RouteInfo.LayerType.PLAIN;
    }

    public RouteTracker(HttpRoute httpRoute) {
        this(httpRoute.getTargetHost(), httpRoute.getLocalAddress());
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    public final void connectProxy(HttpHost httpHost, boolean z) {
        Args.notNull(httpHost, "Proxy host");
        Asserts.check(!this.connected, "Already connected");
        this.connected = true;
        this.proxyChain = new HttpHost[]{httpHost};
        this.secure = z;
    }

    public final void connectTarget(boolean z) {
        Asserts.check(!this.connected, "Already connected");
        this.connected = true;
        this.secure = z;
    }

    public final boolean equals(Object obj) {
        if (obj != this) {
            if (!(obj instanceof RouteTracker)) {
                return false;
            }
            RouteTracker routeTracker = (RouteTracker) obj;
            if (!(this.connected == routeTracker.connected && this.secure == routeTracker.secure && this.tunnelled == routeTracker.tunnelled && this.layered == routeTracker.layered && LangUtils.equals((Object) this.targetHost, (Object) routeTracker.targetHost) && LangUtils.equals((Object) this.localAddress, (Object) routeTracker.localAddress) && LangUtils.equals((Object[]) this.proxyChain, (Object[]) routeTracker.proxyChain))) {
                return false;
            }
        }
        return true;
    }

    public final int getHopCount() {
        if (!this.connected) {
            return 0;
        }
        if (this.proxyChain == null) {
            return 1;
        }
        return this.proxyChain.length + 1;
    }

    public final HttpHost getHopTarget(int i) {
        Args.notNegative(i, "Hop index");
        int hopCount = getHopCount();
        Args.check(i < hopCount, "Hop index exceeds tracked route length");
        return i < hopCount + -1 ? this.proxyChain[i] : this.targetHost;
    }

    public final RouteInfo.LayerType getLayerType() {
        return this.layered;
    }

    public final InetAddress getLocalAddress() {
        return this.localAddress;
    }

    public final HttpHost getProxyHost() {
        if (this.proxyChain == null) {
            return null;
        }
        return this.proxyChain[0];
    }

    public final HttpHost getTargetHost() {
        return this.targetHost;
    }

    public final RouteInfo.TunnelType getTunnelType() {
        return this.tunnelled;
    }

    public final int hashCode() {
        int hashCode = LangUtils.hashCode(LangUtils.hashCode(17, (Object) this.targetHost), (Object) this.localAddress);
        if (this.proxyChain != null) {
            for (HttpHost hashCode2 : this.proxyChain) {
                hashCode = LangUtils.hashCode(hashCode, (Object) hashCode2);
            }
        }
        return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(hashCode, this.connected), this.secure), (Object) this.tunnelled), (Object) this.layered);
    }

    public final boolean isConnected() {
        return this.connected;
    }

    public final boolean isLayered() {
        return this.layered == RouteInfo.LayerType.LAYERED;
    }

    public final boolean isSecure() {
        return this.secure;
    }

    public final boolean isTunnelled() {
        return this.tunnelled == RouteInfo.TunnelType.TUNNELLED;
    }

    public final void layerProtocol(boolean z) {
        Asserts.check(this.connected, "No layered protocol unless connected");
        this.layered = RouteInfo.LayerType.LAYERED;
        this.secure = z;
    }

    public void reset() {
        this.connected = false;
        this.proxyChain = null;
        this.tunnelled = RouteInfo.TunnelType.PLAIN;
        this.layered = RouteInfo.LayerType.PLAIN;
        this.secure = false;
    }

    public final HttpRoute toRoute() {
        if (!this.connected) {
            return null;
        }
        return new HttpRoute(this.targetHost, this.localAddress, this.proxyChain, this.secure, this.tunnelled, this.layered);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder((getHopCount() * 30) + 50);
        sb.append("RouteTracker[");
        if (this.localAddress != null) {
            sb.append(this.localAddress);
            sb.append("->");
        }
        sb.append('{');
        if (this.connected) {
            sb.append('c');
        }
        if (this.tunnelled == RouteInfo.TunnelType.TUNNELLED) {
            sb.append('t');
        }
        if (this.layered == RouteInfo.LayerType.LAYERED) {
            sb.append('l');
        }
        if (this.secure) {
            sb.append('s');
        }
        sb.append("}->");
        if (this.proxyChain != null) {
            for (HttpHost append : this.proxyChain) {
                sb.append(append);
                sb.append("->");
            }
        }
        sb.append(this.targetHost);
        sb.append(']');
        return sb.toString();
    }

    public final void tunnelProxy(HttpHost httpHost, boolean z) {
        Args.notNull(httpHost, "Proxy host");
        Asserts.check(this.connected, "No tunnel unless connected");
        Asserts.notNull(this.proxyChain, "No tunnel without proxy");
        HttpHost[] httpHostArr = new HttpHost[(this.proxyChain.length + 1)];
        System.arraycopy(this.proxyChain, 0, httpHostArr, 0, this.proxyChain.length);
        httpHostArr[httpHostArr.length - 1] = httpHost;
        this.proxyChain = httpHostArr;
        this.secure = z;
    }

    public final void tunnelTarget(boolean z) {
        Asserts.check(this.connected, "No tunnel unless connected");
        Asserts.notNull(this.proxyChain, "No tunnel without proxy");
        this.tunnelled = RouteInfo.TunnelType.TUNNELLED;
        this.secure = z;
    }
}
