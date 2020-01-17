package org.apache.http.impl.cookie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.NameValuePair;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.params.CookiePolicy;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.cookie.Cookie;
import org.apache.http.cookie.CookieAttributeHandler;
import org.apache.http.cookie.CookieOrigin;
import org.apache.http.cookie.MalformedCookieException;
import org.apache.http.cookie.SM;
import org.apache.http.message.BufferedHeader;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class RFC2965Spec extends RFC2109Spec {
    public RFC2965Spec() {
        this((String[]) null, false);
    }

    public RFC2965Spec(String[] strArr, boolean z) {
        super(strArr, z);
        registerAttribHandler(ClientCookie.DOMAIN_ATTR, new RFC2965DomainAttributeHandler());
        registerAttribHandler(ClientCookie.PORT_ATTR, new RFC2965PortAttributeHandler());
        registerAttribHandler(ClientCookie.COMMENTURL_ATTR, new RFC2965CommentUrlAttributeHandler());
        registerAttribHandler(ClientCookie.DISCARD_ATTR, new RFC2965DiscardAttributeHandler());
        registerAttribHandler("version", new RFC2965VersionAttributeHandler());
    }

    private static CookieOrigin adjustEffectiveHost(CookieOrigin cookieOrigin) {
        boolean z = false;
        String host = cookieOrigin.getHost();
        int i = 0;
        while (true) {
            if (i >= host.length()) {
                z = true;
                break;
            }
            char charAt = host.charAt(i);
            if (charAt == '.' || charAt == ':') {
                break;
            }
            i++;
        }
        return z ? new CookieOrigin(host + ".local", cookieOrigin.getPort(), cookieOrigin.getPath(), cookieOrigin.isSecure()) : cookieOrigin;
    }

    private List<Cookie> createCookies(HeaderElement[] headerElementArr, CookieOrigin cookieOrigin) throws MalformedCookieException {
        ArrayList arrayList = new ArrayList(headerElementArr.length);
        for (HeaderElement headerElement : headerElementArr) {
            String name = headerElement.getName();
            String value = headerElement.getValue();
            if (name == null || name.length() == 0) {
                throw new MalformedCookieException("Cookie name may not be empty");
            }
            BasicClientCookie2 basicClientCookie2 = new BasicClientCookie2(name, value);
            basicClientCookie2.setPath(getDefaultPath(cookieOrigin));
            basicClientCookie2.setDomain(getDefaultDomain(cookieOrigin));
            basicClientCookie2.setPorts(new int[]{cookieOrigin.getPort()});
            NameValuePair[] parameters = headerElement.getParameters();
            HashMap hashMap = new HashMap(parameters.length);
            for (int length = parameters.length - 1; length >= 0; length--) {
                NameValuePair nameValuePair = parameters[length];
                hashMap.put(nameValuePair.getName().toLowerCase(Locale.ENGLISH), nameValuePair);
            }
            for (Map.Entry value2 : hashMap.entrySet()) {
                NameValuePair nameValuePair2 = (NameValuePair) value2.getValue();
                String lowerCase = nameValuePair2.getName().toLowerCase(Locale.ENGLISH);
                basicClientCookie2.setAttribute(lowerCase, nameValuePair2.getValue());
                CookieAttributeHandler findAttribHandler = findAttribHandler(lowerCase);
                if (findAttribHandler != null) {
                    findAttribHandler.parse(basicClientCookie2, nameValuePair2.getValue());
                }
            }
            arrayList.add(basicClientCookie2);
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public void formatCookieAsVer(CharArrayBuffer charArrayBuffer, Cookie cookie, int i) {
        String attribute;
        int[] ports;
        super.formatCookieAsVer(charArrayBuffer, cookie, i);
        if ((cookie instanceof ClientCookie) && (attribute = ((ClientCookie) cookie).getAttribute(ClientCookie.PORT_ATTR)) != null) {
            charArrayBuffer.append("; $Port");
            charArrayBuffer.append("=\"");
            if (attribute.trim().length() > 0 && (ports = cookie.getPorts()) != null) {
                int length = ports.length;
                for (int i2 = 0; i2 < length; i2++) {
                    if (i2 > 0) {
                        charArrayBuffer.append(",");
                    }
                    charArrayBuffer.append(Integer.toString(ports[i2]));
                }
            }
            charArrayBuffer.append("\"");
        }
    }

    public int getVersion() {
        return 1;
    }

    public Header getVersionHeader() {
        CharArrayBuffer charArrayBuffer = new CharArrayBuffer(40);
        charArrayBuffer.append(SM.COOKIE2);
        charArrayBuffer.append(": ");
        charArrayBuffer.append("$Version=");
        charArrayBuffer.append(Integer.toString(getVersion()));
        return new BufferedHeader(charArrayBuffer);
    }

    public boolean match(Cookie cookie, CookieOrigin cookieOrigin) {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(cookieOrigin, "Cookie origin");
        return super.match(cookie, adjustEffectiveHost(cookieOrigin));
    }

    public List<Cookie> parse(Header header, CookieOrigin cookieOrigin) throws MalformedCookieException {
        Args.notNull(header, "Header");
        Args.notNull(cookieOrigin, "Cookie origin");
        if (header.getName().equalsIgnoreCase(SM.SET_COOKIE2)) {
            return createCookies(header.getElements(), adjustEffectiveHost(cookieOrigin));
        }
        throw new MalformedCookieException("Unrecognized cookie header '" + header.toString() + "'");
    }

    /* access modifiers changed from: protected */
    public List<Cookie> parse(HeaderElement[] headerElementArr, CookieOrigin cookieOrigin) throws MalformedCookieException {
        return createCookies(headerElementArr, adjustEffectiveHost(cookieOrigin));
    }

    public String toString() {
        return CookiePolicy.RFC_2965;
    }

    public void validate(Cookie cookie, CookieOrigin cookieOrigin) throws MalformedCookieException {
        Args.notNull(cookie, SM.COOKIE);
        Args.notNull(cookieOrigin, "Cookie origin");
        super.validate(cookie, adjustEffectiveHost(cookieOrigin));
    }
}
