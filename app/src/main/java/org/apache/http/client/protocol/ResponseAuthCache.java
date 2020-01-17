package org.apache.http.client.protocol;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthState;
import org.apache.http.client.AuthCache;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.protocol.ExecutionContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
@Deprecated
public class ResponseAuthCache implements HttpResponseInterceptor {
    private final Log log = LogFactory.getLog(getClass());

    private void cache(AuthCache authCache, HttpHost httpHost, AuthScheme authScheme) {
        if (this.log.isDebugEnabled()) {
            this.log.debug("Caching '" + authScheme.getSchemeName() + "' auth scheme for " + httpHost);
        }
        authCache.put(httpHost, authScheme);
    }

    private boolean isCachable(AuthState authState) {
        AuthScheme authScheme = authState.getAuthScheme();
        if (authScheme == null || !authScheme.isComplete()) {
            return false;
        }
        String schemeName = authScheme.getSchemeName();
        return schemeName.equalsIgnoreCase("Basic") || schemeName.equalsIgnoreCase("Digest");
    }

    private void uncache(AuthCache authCache, HttpHost httpHost, AuthScheme authScheme) {
        if (this.log.isDebugEnabled()) {
            this.log.debug("Removing from cache '" + authScheme.getSchemeName() + "' auth scheme for " + httpHost);
        }
        authCache.remove(httpHost);
    }

    public void process(HttpResponse httpResponse, HttpContext httpContext) throws HttpException, IOException {
        AuthCache authCache;
        HttpHost httpHost;
        Args.notNull(httpResponse, "HTTP request");
        Args.notNull(httpContext, "HTTP context");
        AuthCache authCache2 = (AuthCache) httpContext.getAttribute("http.auth.auth-cache");
        HttpHost httpHost2 = (HttpHost) httpContext.getAttribute("http.target_host");
        AuthState authState = (AuthState) httpContext.getAttribute("http.auth.target-scope");
        if (!(httpHost2 == null || authState == null)) {
            if (this.log.isDebugEnabled()) {
                this.log.debug("Target auth state: " + authState.getState());
            }
            if (isCachable(authState)) {
                SchemeRegistry schemeRegistry = (SchemeRegistry) httpContext.getAttribute(ClientContext.SCHEME_REGISTRY);
                if (httpHost2.getPort() < 0) {
                    httpHost2 = new HttpHost(httpHost2.getHostName(), schemeRegistry.getScheme(httpHost2).resolvePort(httpHost2.getPort()), httpHost2.getSchemeName());
                }
                if (authCache2 == null) {
                    authCache2 = new BasicAuthCache();
                    httpContext.setAttribute("http.auth.auth-cache", authCache2);
                }
                switch (authState.getState()) {
                    case CHALLENGED:
                        cache(authCache2, httpHost2, authState.getAuthScheme());
                        authCache = authCache2;
                        break;
                    case FAILURE:
                        uncache(authCache2, httpHost2, authState.getAuthScheme());
                        authCache = authCache2;
                        break;
                    default:
                        authCache = authCache2;
                        break;
                }
                httpHost = (HttpHost) httpContext.getAttribute(ExecutionContext.HTTP_PROXY_HOST);
                AuthState authState2 = (AuthState) httpContext.getAttribute("http.auth.proxy-scope");
                if (httpHost != null && authState2 != null) {
                    if (this.log.isDebugEnabled()) {
                        this.log.debug("Proxy auth state: " + authState2.getState());
                    }
                    if (isCachable(authState2)) {
                        if (authCache == null) {
                            authCache = new BasicAuthCache();
                            httpContext.setAttribute("http.auth.auth-cache", authCache);
                        }
                        switch (authState2.getState()) {
                            case CHALLENGED:
                                cache(authCache, httpHost, authState2.getAuthScheme());
                                return;
                            case FAILURE:
                                uncache(authCache, httpHost, authState2.getAuthScheme());
                                return;
                            default:
                                return;
                        }
                    } else {
                        return;
                    }
                }
            }
        }
        authCache = authCache2;
        httpHost = (HttpHost) httpContext.getAttribute(ExecutionContext.HTTP_PROXY_HOST);
        AuthState authState22 = (AuthState) httpContext.getAttribute("http.auth.proxy-scope");
        if (httpHost != null) {
        }
    }
}
