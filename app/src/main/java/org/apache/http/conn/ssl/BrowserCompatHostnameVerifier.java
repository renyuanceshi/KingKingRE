package org.apache.http.conn.ssl;

import javax.net.ssl.SSLException;
import org.apache.http.annotation.Immutable;

@Immutable
public class BrowserCompatHostnameVerifier extends AbstractVerifier {
    public final String toString() {
        return "BROWSER_COMPATIBLE";
    }

    /* access modifiers changed from: package-private */
    public boolean validCountryWildcard(String str) {
        return true;
    }

    public final void verify(String str, String[] strArr, String[] strArr2) throws SSLException {
        verify(str, strArr, strArr2, false);
    }
}
