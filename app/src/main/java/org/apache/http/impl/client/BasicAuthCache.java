package org.apache.http.impl.client;

import java.util.HashMap;
import org.apache.http.HttpHost;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.auth.AuthScheme;
import org.apache.http.client.AuthCache;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.UnsupportedSchemeException;
import org.apache.http.impl.conn.DefaultSchemePortResolver;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicAuthCache implements AuthCache {
    private final HashMap<HttpHost, AuthScheme> map;
    private final SchemePortResolver schemePortResolver;

    public BasicAuthCache() {
        this((SchemePortResolver) null);
    }

    public BasicAuthCache(SchemePortResolver schemePortResolver2) {
        this.map = new HashMap<>();
        this.schemePortResolver = schemePortResolver2 == null ? DefaultSchemePortResolver.INSTANCE : schemePortResolver2;
    }

    public void clear() {
        this.map.clear();
    }

    public AuthScheme get(HttpHost httpHost) {
        Args.notNull(httpHost, "HTTP host");
        return this.map.get(getKey(httpHost));
    }

    /* access modifiers changed from: protected */
    public HttpHost getKey(HttpHost httpHost) {
        if (httpHost.getPort() > 0) {
            return httpHost;
        }
        try {
            return new HttpHost(httpHost.getHostName(), this.schemePortResolver.resolve(httpHost), httpHost.getSchemeName());
        } catch (UnsupportedSchemeException e) {
            return httpHost;
        }
    }

    public void put(HttpHost httpHost, AuthScheme authScheme) {
        Args.notNull(httpHost, "HTTP host");
        this.map.put(getKey(httpHost), authScheme);
    }

    public void remove(HttpHost httpHost) {
        Args.notNull(httpHost, "HTTP host");
        this.map.remove(getKey(httpHost));
    }

    public String toString() {
        return this.map.toString();
    }
}
