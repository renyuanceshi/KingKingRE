package org.apache.http.impl.client.cache;

import java.lang.reflect.Proxy;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.util.Args;

@NotThreadSafe
class Proxies {
    Proxies() {
    }

    public static CloseableHttpResponse enhanceResponse(HttpResponse httpResponse) {
        Args.notNull(httpResponse, "HTTP response");
        if (httpResponse instanceof CloseableHttpResponse) {
            return (CloseableHttpResponse) httpResponse;
        }
        return (CloseableHttpResponse) Proxy.newProxyInstance(ResponseProxyHandler.class.getClassLoader(), new Class[]{CloseableHttpResponse.class}, new ResponseProxyHandler(httpResponse));
    }
}
