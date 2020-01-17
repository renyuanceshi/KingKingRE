package org.apache.http.impl.client;

import org.apache.http.annotation.Immutable;
import org.apache.http.client.methods.HttpPost;

@Immutable
public class LaxRedirectStrategy extends DefaultRedirectStrategy {
    private static final String[] REDIRECT_METHODS = {"GET", HttpPost.METHOD_NAME, "HEAD"};

    /* access modifiers changed from: protected */
    public boolean isRedirectable(String str) {
        for (String equalsIgnoreCase : REDIRECT_METHODS) {
            if (equalsIgnoreCase.equalsIgnoreCase(str)) {
                return true;
            }
        }
        return false;
    }
}
