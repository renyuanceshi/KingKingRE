package org.apache.http.client.protocol;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Date;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.config.Lookup;
import org.apache.http.conn.routing.RouteInfo;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.cookie.SetCookie2;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.TextUtils;

@Immutable
public class RequestAddCookies implements HttpRequestInterceptor {
    private final Log log = LogFactory.getLog(getClass());

    public void process(HttpRequest httpRequest, HttpContext httpContext) throws HttpException, IOException {
        URI uri;
        Header versionHeader;
        boolean z = false;
        Args.notNull(httpRequest, "HTTP request");
        Args.notNull(httpContext, "HTTP context");
        if (!httpRequest.getRequestLine().getMethod().equalsIgnoreCase("CONNECT")) {
            HttpClientContext adapt = HttpClientContext.adapt(httpContext);
            CookieStore cookieStore = adapt.getCookieStore();
            if (cookieStore == null) {
                this.log.debug("Cookie store not specified in HTTP context");
                return;
            }
            Lookup<CookieSpecProvider> cookieSpecRegistry = adapt.getCookieSpecRegistry();
            if (cookieSpecRegistry == null) {
                this.log.debug("CookieSpec registry not specified in HTTP context");
                return;
            }
            HttpHost targetHost = adapt.getTargetHost();
            if (targetHost == null) {
                this.log.debug("Target host not set in the context");
                return;
            }
            RouteInfo httpRoute = adapt.getHttpRoute();
            if (httpRoute == null) {
                this.log.debug("Connection route not set in the context");
                return;
            }
            String cookieSpec = adapt.getRequestConfig().getCookieSpec();
            String str = cookieSpec == null ? "best-match" : cookieSpec;
            if (this.log.isDebugEnabled()) {
                this.log.debug("CookieSpec selected: " + str);
            }
            if (httpRequest instanceof HttpUriRequest) {
                uri = ((HttpUriRequest) httpRequest).getURI();
            } else {
                try {
                    uri = new URI(httpRequest.getRequestLine().getUri());
                } catch (URISyntaxException e) {
                    uri = null;
                }
            }
            String path = uri != null ? uri.getPath() : null;
            String hostName = targetHost.getHostName();
            int port = targetHost.getPort();
            if (port < 0) {
                port = httpRoute.getTargetHost().getPort();
            }
            if (port < 0) {
                port = 0;
            }
            if (TextUtils.isEmpty(path)) {
                path = "/";
            }
            CookieOrigin cookieOrigin = new CookieOrigin(hostName, port, path, httpRoute.isSecure());
            CookieSpecProvider lookup = cookieSpecRegistry.lookup(str);
            if (lookup == null) {
                throw new HttpException("Unsupported cookie policy: " + str);
            }
            CookieSpec create = lookup.create(adapt);
            ArrayList<Cookie> arrayList = new ArrayList<>(cookieStore.getCookies());
            ArrayList<Cookie> arrayList2 = new ArrayList<>();
            Date date = new Date();
            for (Cookie cookie : arrayList) {
                if (!cookie.isExpired(date)) {
                    if (create.match(cookie, cookieOrigin)) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Cookie " + cookie + " match " + cookieOrigin);
                        }
                        arrayList2.add(cookie);
                    }
                } else if (this.log.isDebugEnabled()) {
                    this.log.debug("Cookie " + cookie + " expired");
                }
            }
            if (!arrayList2.isEmpty()) {
                for (Header addHeader : create.formatCookies(arrayList2)) {
                    httpRequest.addHeader(addHeader);
                }
            }
            int version = create.getVersion();
            if (version > 0) {
                for (Cookie cookie2 : arrayList2) {
                    if (version != cookie2.getVersion() || !(cookie2 instanceof SetCookie2)) {
                        z = true;
                    }
                }
                if (z && (versionHeader = create.getVersionHeader()) != null) {
                    httpRequest.addHeader(versionHeader);
                }
            }
            httpContext.setAttribute("http.cookie-spec", create);
            httpContext.setAttribute("http.cookie-origin", cookieOrigin);
        }
    }
}
