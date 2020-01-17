package org.apache.http.auth;

import java.util.Locale;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public class AuthScope {
    public static final AuthScope ANY = new AuthScope(ANY_HOST, -1, ANY_REALM, ANY_SCHEME);
    public static final String ANY_HOST = null;
    public static final int ANY_PORT = -1;
    public static final String ANY_REALM = null;
    public static final String ANY_SCHEME = null;
    private final String host;
    private final int port;
    private final String realm;
    private final String scheme;

    public AuthScope(String str, int i) {
        this(str, i, ANY_REALM, ANY_SCHEME);
    }

    public AuthScope(String str, int i, String str2) {
        this(str, i, str2, ANY_SCHEME);
    }

    public AuthScope(String str, int i, String str2, String str3) {
        this.host = str == null ? ANY_HOST : str.toLowerCase(Locale.ENGLISH);
        this.port = i < 0 ? -1 : i;
        this.realm = str2 == null ? ANY_REALM : str2;
        this.scheme = str3 == null ? ANY_SCHEME : str3.toUpperCase(Locale.ENGLISH);
    }

    public AuthScope(HttpHost httpHost) {
        this(httpHost, ANY_REALM, ANY_SCHEME);
    }

    public AuthScope(HttpHost httpHost, String str, String str2) {
        this(httpHost.getHostName(), httpHost.getPort(), str, str2);
    }

    public AuthScope(AuthScope authScope) {
        Args.notNull(authScope, "Scope");
        this.host = authScope.getHost();
        this.port = authScope.getPort();
        this.realm = authScope.getRealm();
        this.scheme = authScope.getScheme();
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj != this) {
            if (!(obj instanceof AuthScope)) {
                return super.equals(obj);
            }
            AuthScope authScope = (AuthScope) obj;
            if (!LangUtils.equals((Object) this.host, (Object) authScope.host) || this.port != authScope.port || !LangUtils.equals((Object) this.realm, (Object) authScope.realm) || !LangUtils.equals((Object) this.scheme, (Object) authScope.scheme)) {
                return false;
            }
        }
        return true;
    }

    public String getHost() {
        return this.host;
    }

    public int getPort() {
        return this.port;
    }

    public String getRealm() {
        return this.realm;
    }

    public String getScheme() {
        return this.scheme;
    }

    public int hashCode() {
        return LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(LangUtils.hashCode(17, (Object) this.host), this.port), (Object) this.realm), (Object) this.scheme);
    }

    public int match(AuthScope authScope) {
        int i = 0;
        if (LangUtils.equals((Object) this.scheme, (Object) authScope.scheme)) {
            i = 1;
        } else if (!(this.scheme == ANY_SCHEME || authScope.scheme == ANY_SCHEME)) {
            return -1;
        }
        if (LangUtils.equals((Object) this.realm, (Object) authScope.realm)) {
            i += 2;
        } else if (!(this.realm == ANY_REALM || authScope.realm == ANY_REALM)) {
            return -1;
        }
        if (this.port == authScope.port) {
            i += 4;
        } else if (!(this.port == -1 || authScope.port == -1)) {
            return -1;
        }
        if (LangUtils.equals((Object) this.host, (Object) authScope.host)) {
            return i + 8;
        }
        if (this.host == ANY_HOST || authScope.host == ANY_HOST) {
            return i;
        }
        return -1;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (this.scheme != null) {
            sb.append(this.scheme.toUpperCase(Locale.ENGLISH));
            sb.append(' ');
        }
        if (this.realm != null) {
            sb.append('\'');
            sb.append(this.realm);
            sb.append('\'');
        } else {
            sb.append("<any realm>");
        }
        if (this.host != null) {
            sb.append('@');
            sb.append(this.host);
            if (this.port >= 0) {
                sb.append(':');
                sb.append(this.port);
            }
        }
        return sb.toString();
    }
}
