package org.apache.http.conn.routing;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.conn.routing.RouteInfo;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public final class HttpRoute implements RouteInfo, Cloneable {
    private final RouteInfo.LayerType layered;
    private final InetAddress localAddress;
    private final List<HttpHost> proxyChain;
    private final boolean secure;
    private final HttpHost targetHost;
    private final RouteInfo.TunnelType tunnelled;

    public HttpRoute(HttpHost httpHost) {
        this(httpHost, (InetAddress) null, (List<HttpHost>) Collections.emptyList(), false, RouteInfo.TunnelType.PLAIN, RouteInfo.LayerType.PLAIN);
    }

    private HttpRoute(HttpHost httpHost, InetAddress inetAddress, List<HttpHost> list, boolean z, RouteInfo.TunnelType tunnelType, RouteInfo.LayerType layerType) {
        Args.notNull(httpHost, "Target host");
        this.targetHost = httpHost;
        this.localAddress = inetAddress;
        if (list == null || list.isEmpty()) {
            this.proxyChain = null;
        } else {
            this.proxyChain = new ArrayList(list);
        }
        if (tunnelType == RouteInfo.TunnelType.TUNNELLED) {
            Args.check(this.proxyChain != null, "Proxy required if tunnelled");
        }
        this.secure = z;
        this.tunnelled = tunnelType == null ? RouteInfo.TunnelType.PLAIN : tunnelType;
        this.layered = layerType == null ? RouteInfo.LayerType.PLAIN : layerType;
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public HttpRoute(HttpHost httpHost, InetAddress inetAddress, HttpHost httpHost2, boolean z) {
        this(httpHost, inetAddress, (List<HttpHost>) Collections.singletonList(Args.notNull(httpHost2, "Proxy host")), z, z ? RouteInfo.TunnelType.TUNNELLED : RouteInfo.TunnelType.PLAIN, z ? RouteInfo.LayerType.LAYERED : RouteInfo.LayerType.PLAIN);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public HttpRoute(HttpHost httpHost, InetAddress inetAddress, HttpHost httpHost2, boolean z, RouteInfo.TunnelType tunnelType, RouteInfo.LayerType layerType) {
        this(httpHost, inetAddress, (List<HttpHost>) httpHost2 != null ? Collections.singletonList(httpHost2) : null, z, tunnelType, layerType);
    }

    public HttpRoute(HttpHost httpHost, InetAddress inetAddress, boolean z) {
        this(httpHost, inetAddress, (List<HttpHost>) Collections.emptyList(), z, RouteInfo.TunnelType.PLAIN, RouteInfo.LayerType.PLAIN);
    }

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public HttpRoute(HttpHost httpHost, InetAddress inetAddress, HttpHost[] httpHostArr, boolean z, RouteInfo.TunnelType tunnelType, RouteInfo.LayerType layerType) {
        this(httpHost, inetAddress, (List<HttpHost>) httpHostArr != null ? Arrays.asList(httpHostArr) : null, z, tunnelType, layerType);
    }

    public HttpRoute(HttpHost httpHost, HttpHost httpHost2) {
        this(httpHost, (InetAddress) null, httpHost2, false);
    }

    public Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof HttpRoute)) {
            return false;
        }
        HttpRoute httpRoute = (HttpRoute) obj;
        return this.secure == httpRoute.secure && this.tunnelled == httpRoute.tunnelled && this.layered == httpRoute.layered && LangUtils.equals((Object) this.targetHost, (Object) httpRoute.targetHost) && LangUtils.equals((Object) this.localAddress, (Object) httpRoute.localAddress) && LangUtils.equals((Object) this.proxyChain, (Object) httpRoute.proxyChain);
    }

    public final int getHopCount() {
        if (this.proxyChain != null) {
            return this.proxyChain.size() + 1;
        }
        return 1;
    }

    public final HttpHost getHopTarget(int i) {
        Args.notNegative(i, "Hop index");
        int hopCount = getHopCount();
        Args.check(i < hopCount, "Hop index exceeds tracked route length");
        return i < hopCount + -1 ? this.proxyChain.get(i) : this.targetHost;
    }

    public final RouteInfo.LayerType getLayerType() {
        return this.layered;
    }

    public final InetAddress getLocalAddress() {
        return this.localAddress;
    }

    public final InetSocketAddress getLocalSocketAddress() {
        if (this.localAddress != null) {
            return new InetSocketAddress(this.localAddress, 0);
        }
        return null;
    }

    public final HttpHost getProxyHost() {
        if (this.proxyChain == null || this.proxyChain.isEmpty()) {
            return null;
        }
        return this.proxyChain.get(0);
    }

    public final HttpHost getTargetHost() {
        return this.targetHost;
    }

    public final RouteInfo.TunnelType getTunnelType() {
        return this.tunnelled;
    }

    public final int hashCode() {
        int i;
        int hashCode = LangUtils.hashCode(LangUtils.hashCode(17, (Object) this.targetHost), (Object) this.localAddress);
        if (this.proxyChain != null) {
            Iterator<HttpHost> it = this.proxyChain.iterator();
            while (true) {
                i = hashCode;
                if (!it.hasNext()) {
                    break;
                }
                hashCode = LangUtils.hashCode(i, (Object) it.next());
            }
        } else {
            i = hashCode;
        }
        return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(i, this.secure), (Object) this.tunnelled), (Object) this.layered);
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

    public final String toString() {
        StringBuilder sb = new StringBuilder((getHopCount() * 30) + 50);
        if (this.localAddress != null) {
            sb.append(this.localAddress);
            sb.append("->");
        }
        sb.append('{');
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
        return sb.toString();
    }
}
