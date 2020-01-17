package org.apache.http.impl.conn;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.params.ConnRouteParams;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@NotThreadSafe
@Deprecated
public class ProxySelectorRoutePlanner implements HttpRoutePlanner {
    protected ProxySelector proxySelector;
    protected final SchemeRegistry schemeRegistry;

    /* renamed from: org.apache.http.impl.conn.ProxySelectorRoutePlanner$1  reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$java$net$Proxy$Type = new int[Proxy.Type.values().length];

        static {
            try {
                $SwitchMap$java$net$Proxy$Type[Proxy.Type.DIRECT.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$java$net$Proxy$Type[Proxy.Type.HTTP.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$java$net$Proxy$Type[Proxy.Type.SOCKS.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    public ProxySelectorRoutePlanner(SchemeRegistry schemeRegistry2, ProxySelector proxySelector2) {
        Args.notNull(schemeRegistry2, "SchemeRegistry");
        this.schemeRegistry = schemeRegistry2;
        this.proxySelector = proxySelector2;
    }

    /* access modifiers changed from: protected */
    public Proxy chooseProxy(List<Proxy> list, HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) {
        Args.notEmpty(list, "List of proxies");
        Proxy proxy = null;
        int i = 0;
        while (proxy == null && i < list.size()) {
            Proxy proxy2 = list.get(i);
            switch (AnonymousClass1.$SwitchMap$java$net$Proxy$Type[proxy2.type().ordinal()]) {
                case 1:
                case 2:
                    break;
                default:
                    proxy2 = proxy;
                    break;
            }
            i++;
            proxy = proxy2;
        }
        return proxy == null ? Proxy.NO_PROXY : proxy;
    }

    /* access modifiers changed from: protected */
    public HttpHost determineProxy(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws HttpException {
        ProxySelector proxySelector2 = this.proxySelector;
        if (proxySelector2 == null) {
            proxySelector2 = ProxySelector.getDefault();
        }
        if (proxySelector2 == null) {
            return null;
        }
        try {
            Proxy chooseProxy = chooseProxy(proxySelector2.select(new URI(httpHost.toURI())), httpHost, httpRequest, httpContext);
            if (chooseProxy.type() != Proxy.Type.HTTP) {
                return null;
            }
            if (!(chooseProxy.address() instanceof InetSocketAddress)) {
                throw new HttpException("Unable to handle non-Inet proxy address: " + chooseProxy.address());
            }
            InetSocketAddress inetSocketAddress = (InetSocketAddress) chooseProxy.address();
            return new HttpHost(getHost(inetSocketAddress), inetSocketAddress.getPort());
        } catch (URISyntaxException e) {
            throw new HttpException("Cannot convert host to URI: " + httpHost, e);
        }
    }

    public HttpRoute determineRoute(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws HttpException {
        Args.notNull(httpRequest, "HTTP request");
        HttpRoute forcedRoute = ConnRouteParams.getForcedRoute(httpRequest.getParams());
        if (forcedRoute != null) {
            return forcedRoute;
        }
        Asserts.notNull(httpHost, "Target host");
        InetAddress localAddress = ConnRouteParams.getLocalAddress(httpRequest.getParams());
        HttpHost determineProxy = determineProxy(httpHost, httpRequest, httpContext);
        boolean isLayered = this.schemeRegistry.getScheme(httpHost.getSchemeName()).isLayered();
        return determineProxy == null ? new HttpRoute(httpHost, localAddress, isLayered) : new HttpRoute(httpHost, localAddress, determineProxy, isLayered);
    }

    /* access modifiers changed from: protected */
    public String getHost(InetSocketAddress inetSocketAddress) {
        return inetSocketAddress.isUnresolved() ? inetSocketAddress.getHostName() : inetSocketAddress.getAddress().getHostAddress();
    }

    public ProxySelector getProxySelector() {
        return this.proxySelector;
    }

    public void setProxySelector(ProxySelector proxySelector2) {
        this.proxySelector = proxySelector2;
    }
}
