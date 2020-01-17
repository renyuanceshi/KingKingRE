package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class HttpPatch extends HttpEntityEnclosingRequestBase {
    public static final String METHOD_NAME = "PATCH";

    public HttpPatch() {
    }

    public HttpPatch(String str) {
        setURI(URI.create(str));
    }

    public HttpPatch(URI uri) {
        setURI(uri);
    }

    public String getMethod() {
        return METHOD_NAME;
    }
}
