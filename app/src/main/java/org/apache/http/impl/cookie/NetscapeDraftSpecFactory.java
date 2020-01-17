package org.apache.http.impl.cookie;

import java.util.Collection;
import org.apache.http.annotation.Immutable;
import org.apache.http.cookie.CookieSpec;
import org.apache.http.cookie.CookieSpecFactory;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.cookie.params.CookieSpecPNames;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

@Immutable
public class NetscapeDraftSpecFactory implements CookieSpecFactory, CookieSpecProvider {
    private final String[] datepatterns;

    public NetscapeDraftSpecFactory() {
        this((String[]) null);
    }

    public NetscapeDraftSpecFactory(String[] strArr) {
        this.datepatterns = strArr;
    }

    public CookieSpec create(HttpContext httpContext) {
        return new NetscapeDraftSpec(this.datepatterns);
    }

    public CookieSpec newInstance(HttpParams httpParams) {
        if (httpParams == null) {
            return new NetscapeDraftSpec();
        }
        Collection collection = (Collection) httpParams.getParameter(CookieSpecPNames.DATE_PATTERNS);
        return new NetscapeDraftSpec(collection != null ? (String[]) collection.toArray(new String[collection.size()]) : null);
    }
}
