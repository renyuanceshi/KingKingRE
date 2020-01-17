package com.google.android.gms.internal;

import java.net.URI;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpPatch;

public final class zzal extends HttpEntityEnclosingRequestBase {
    public zzal() {
    }

    public zzal(String str) {
        setURI(URI.create(str));
    }

    public final String getMethod() {
        return HttpPatch.METHOD_NAME;
    }
}
