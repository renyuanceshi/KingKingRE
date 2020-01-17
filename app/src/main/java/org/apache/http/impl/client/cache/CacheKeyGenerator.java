package org.apache.http.impl.client.cache;

import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import org.apache.http.Consts;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.client.utils.URIUtils;

@Immutable
class CacheKeyGenerator {
    private static final URI BASE_URI = URI.create("http://example.com/");

    CacheKeyGenerator() {
    }

    private int canonicalizePort(int i, String str) {
        if (i == -1 && HttpHost.DEFAULT_SCHEME_NAME.equalsIgnoreCase(str)) {
            return 80;
        }
        if (i != -1 || !"https".equalsIgnoreCase(str)) {
            return i;
        }
        return 443;
    }

    private boolean isRelativeRequest(HttpRequest httpRequest) {
        String uri = httpRequest.getRequestLine().getUri();
        return "*".equals(uri) || uri.startsWith("/");
    }

    public String canonicalizeUri(String str) {
        try {
            URL url = new URL(URIUtils.resolve(BASE_URI, str).toASCIIString());
            String protocol = url.getProtocol();
            String host = url.getHost();
            int canonicalizePort = canonicalizePort(url.getPort(), protocol);
            String path = url.getPath();
            String query = url.getQuery();
            if (query != null) {
                path = path + "?" + query;
            }
            return new URL(protocol, host, canonicalizePort, path).toString();
        } catch (IllegalArgumentException | MalformedURLException e) {
            return str;
        }
    }

    /* access modifiers changed from: protected */
    public String getFullHeaderValue(Header[] headerArr) {
        if (headerArr == null) {
            return "";
        }
        StringBuilder sb = new StringBuilder("");
        boolean z = true;
        int length = headerArr.length;
        int i = 0;
        while (i < length) {
            Header header = headerArr[i];
            if (!z) {
                sb.append(", ");
            }
            sb.append(header.getValue().trim());
            i++;
            z = false;
        }
        return sb.toString();
    }

    public String getURI(HttpHost httpHost, HttpRequest httpRequest) {
        if (!isRelativeRequest(httpRequest)) {
            return canonicalizeUri(httpRequest.getRequestLine().getUri());
        }
        return canonicalizeUri(String.format("%s%s", new Object[]{httpHost.toString(), httpRequest.getRequestLine().getUri()}));
    }

    public String getVariantKey(HttpRequest httpRequest, HttpCacheEntry httpCacheEntry) {
        ArrayList<String> arrayList = new ArrayList<>();
        for (Header elements : httpCacheEntry.getHeaders("Vary")) {
            for (HeaderElement name : elements.getElements()) {
                arrayList.add(name.getName());
            }
        }
        Collections.sort(arrayList);
        try {
            StringBuilder sb = new StringBuilder("{");
            boolean z = true;
            for (String str : arrayList) {
                if (!z) {
                    sb.append("&");
                }
                sb.append(URLEncoder.encode(str, Consts.UTF_8.name()));
                sb.append("=");
                sb.append(URLEncoder.encode(getFullHeaderValue(httpRequest.getHeaders(str)), Consts.UTF_8.name()));
                z = false;
            }
            sb.append("}");
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("couldn't encode to UTF-8", e);
        }
    }

    public String getVariantURI(HttpHost httpHost, HttpRequest httpRequest, HttpCacheEntry httpCacheEntry) {
        return !httpCacheEntry.hasVariants() ? getURI(httpHost, httpRequest) : getVariantKey(httpRequest, httpCacheEntry) + getURI(httpHost, httpRequest);
    }
}
