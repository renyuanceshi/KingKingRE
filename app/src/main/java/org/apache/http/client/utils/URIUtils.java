package org.apache.http.client.utils;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Stack;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.TextUtils;

@Immutable
public class URIUtils {
    private URIUtils() {
    }

    @Deprecated
    public static URI createURI(String str, String str2, int i, String str3, String str4, String str5) throws URISyntaxException {
        StringBuilder sb = new StringBuilder();
        if (str2 != null) {
            if (str != null) {
                sb.append(str);
                sb.append("://");
            }
            sb.append(str2);
            if (i > 0) {
                sb.append(':');
                sb.append(i);
            }
        }
        if (str3 == null || !str3.startsWith("/")) {
            sb.append('/');
        }
        if (str3 != null) {
            sb.append(str3);
        }
        if (str4 != null) {
            sb.append('?');
            sb.append(str4);
        }
        if (str5 != null) {
            sb.append('#');
            sb.append(str5);
        }
        return new URI(sb.toString());
    }

    public static HttpHost extractHost(URI uri) {
        int i;
        String str;
        int indexOf;
        if (uri == null) {
            return null;
        }
        if (uri.isAbsolute()) {
            int port = uri.getPort();
            String host = uri.getHost();
            if (host != null || (host = uri.getAuthority()) == null) {
                i = port;
                str = host;
            } else {
                int indexOf2 = host.indexOf(64);
                String substring = indexOf2 >= 0 ? host.length() > indexOf2 + 1 ? host.substring(indexOf2 + 1) : null : host;
                if (substring == null || (indexOf = substring.indexOf(58)) < 0) {
                    i = port;
                    str = substring;
                } else {
                    int i2 = indexOf + 1;
                    int i3 = 0;
                    int i4 = i2;
                    while (i4 < substring.length() && Character.isDigit(substring.charAt(i4))) {
                        i3++;
                        i4++;
                    }
                    if (i3 > 0) {
                        try {
                            i = Integer.parseInt(substring.substring(i2, i3 + i2));
                        } catch (NumberFormatException e) {
                            i = port;
                        }
                    } else {
                        i = port;
                    }
                    str = substring.substring(0, indexOf);
                }
            }
            String scheme = uri.getScheme();
            if (str != null) {
                return new HttpHost(str, i, scheme);
            }
        }
        return null;
    }

    private static URI normalizeSyntax(URI uri) {
        if (uri.isOpaque() || uri.getAuthority() == null) {
            return uri;
        }
        Args.check(uri.isAbsolute(), "Base URI must be absolute");
        String path = uri.getPath() == null ? "" : uri.getPath();
        String[] split = path.split("/");
        Stack stack = new Stack();
        for (String str : split) {
            if (str.length() != 0 && !".".equals(str)) {
                if (!"..".equals(str)) {
                    stack.push(str);
                } else if (!stack.isEmpty()) {
                    stack.pop();
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        Iterator it = stack.iterator();
        while (it.hasNext()) {
            sb.append('/').append((String) it.next());
        }
        if (path.lastIndexOf(47) == path.length() - 1) {
            sb.append('/');
        }
        try {
            URI uri2 = new URI(uri.getScheme().toLowerCase(), uri.getAuthority().toLowerCase(), sb.toString(), (String) null, (String) null);
            if (uri.getQuery() == null && uri.getFragment() == null) {
                return uri2;
            }
            StringBuilder sb2 = new StringBuilder(uri2.toASCIIString());
            if (uri.getQuery() != null) {
                sb2.append('?').append(uri.getRawQuery());
            }
            if (uri.getFragment() != null) {
                sb2.append('#').append(uri.getRawFragment());
            }
            return URI.create(sb2.toString());
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public static URI resolve(URI uri, String str) {
        return resolve(uri, URI.create(str));
    }

    public static URI resolve(URI uri, URI uri2) {
        Args.notNull(uri, "Base URI");
        Args.notNull(uri2, "Reference URI");
        String uri3 = uri2.toString();
        if (uri3.startsWith("?")) {
            return resolveReferenceStartingWithQueryString(uri, uri2);
        }
        boolean z = uri3.length() == 0;
        if (z) {
            uri2 = URI.create("#");
        }
        URI resolve = uri.resolve(uri2);
        if (z) {
            String uri4 = resolve.toString();
            resolve = URI.create(uri4.substring(0, uri4.indexOf(35)));
        }
        return normalizeSyntax(resolve);
    }

    public static URI resolve(URI uri, HttpHost httpHost, List<URI> list) throws URISyntaxException {
        URIBuilder uRIBuilder;
        Args.notNull(uri, "Request URI");
        if (list == null || list.isEmpty()) {
            uRIBuilder = new URIBuilder(uri);
        } else {
            URIBuilder uRIBuilder2 = new URIBuilder(list.get(list.size() - 1));
            String fragment = uRIBuilder2.getFragment();
            int size = list.size() - 1;
            while (fragment == null && size >= 0) {
                fragment = list.get(size).getFragment();
                size--;
            }
            uRIBuilder2.setFragment(fragment);
            uRIBuilder = uRIBuilder2;
        }
        if (uRIBuilder.getFragment() == null) {
            uRIBuilder.setFragment(uri.getFragment());
        }
        if (httpHost != null && !uRIBuilder.isAbsolute()) {
            uRIBuilder.setScheme(httpHost.getSchemeName());
            uRIBuilder.setHost(httpHost.getHostName());
            uRIBuilder.setPort(httpHost.getPort());
        }
        return uRIBuilder.build();
    }

    private static URI resolveReferenceStartingWithQueryString(URI uri, URI uri2) {
        String uri3 = uri.toString();
        if (uri3.indexOf(63) > -1) {
            uri3 = uri3.substring(0, uri3.indexOf(63));
        }
        return URI.create(uri3 + uri2.toString());
    }

    public static URI rewriteURI(URI uri) throws URISyntaxException {
        Args.notNull(uri, "URI");
        if (uri.isOpaque()) {
            return uri;
        }
        URIBuilder uRIBuilder = new URIBuilder(uri);
        if (uRIBuilder.getUserInfo() != null) {
            uRIBuilder.setUserInfo((String) null);
        }
        if (TextUtils.isEmpty(uRIBuilder.getPath())) {
            uRIBuilder.setPath("/");
        }
        if (uRIBuilder.getHost() != null) {
            uRIBuilder.setHost(uRIBuilder.getHost().toLowerCase(Locale.ENGLISH));
        }
        uRIBuilder.setFragment((String) null);
        return uRIBuilder.build();
    }

    public static URI rewriteURI(URI uri, HttpHost httpHost) throws URISyntaxException {
        return rewriteURI(uri, httpHost, false);
    }

    public static URI rewriteURI(URI uri, HttpHost httpHost, boolean z) throws URISyntaxException {
        Args.notNull(uri, "URI");
        if (uri.isOpaque()) {
            return uri;
        }
        URIBuilder uRIBuilder = new URIBuilder(uri);
        if (httpHost != null) {
            uRIBuilder.setScheme(httpHost.getSchemeName());
            uRIBuilder.setHost(httpHost.getHostName());
            uRIBuilder.setPort(httpHost.getPort());
        } else {
            uRIBuilder.setScheme((String) null);
            uRIBuilder.setHost((String) null);
            uRIBuilder.setPort(-1);
        }
        if (z) {
            uRIBuilder.setFragment((String) null);
        }
        if (TextUtils.isEmpty(uRIBuilder.getPath())) {
            uRIBuilder.setPath("/");
        }
        return uRIBuilder.build();
    }
}
