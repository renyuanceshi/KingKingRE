package org.apache.http.auth;

import java.io.Serializable;
import java.security.Principal;
import java.util.Locale;
import org.apache.http.annotation.Immutable;
import org.apache.http.util.Args;
import org.apache.http.util.LangUtils;

@Immutable
public class NTUserPrincipal implements Principal, Serializable {
    private static final long serialVersionUID = -6870169797924406894L;
    private final String domain;
    private final String ntname;
    private final String username;

    public NTUserPrincipal(String str, String str2) {
        Args.notNull(str2, "User name");
        this.username = str2;
        if (str != null) {
            this.domain = str.toUpperCase(Locale.ENGLISH);
        } else {
            this.domain = null;
        }
        if (this.domain == null || this.domain.length() <= 0) {
            this.ntname = this.username;
            return;
        }
        this.ntname = this.domain + '\\' + this.username;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof NTUserPrincipal) {
            NTUserPrincipal nTUserPrincipal = (NTUserPrincipal) obj;
            return LangUtils.equals((Object) this.username, (Object) nTUserPrincipal.username) && LangUtils.equals((Object) this.domain, (Object) nTUserPrincipal.domain);
        }
    }

    public String getDomain() {
        return this.domain;
    }

    public String getName() {
        return this.ntname;
    }

    public String getUsername() {
        return this.username;
    }

    public int hashCode() {
        return LangUtils.hashCode(LangUtils.hashCode(17, (Object) this.username), (Object) this.domain);
    }

    public String toString() {
        return this.ntname;
    }
}
