package org.apache.http.impl.client.cache;

import java.io.File;
import org.apache.http.annotation.Immutable;
import org.apache.http.impl.client.CloseableHttpClient;

@Immutable
public class CachingHttpClients {
    private CachingHttpClients() {
    }

    public static CloseableHttpClient createFileBound(File file) {
        return CachingHttpClientBuilder.create().setCacheDir(file).build();
    }

    public static CloseableHttpClient createMemoryBound() {
        return CachingHttpClientBuilder.create().build();
    }

    public static CachingHttpClientBuilder custom() {
        return CachingHttpClientBuilder.create();
    }
}
