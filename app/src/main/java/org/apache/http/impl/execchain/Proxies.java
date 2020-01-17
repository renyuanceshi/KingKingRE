package org.apache.http.impl.execchain;

import java.lang.reflect.Proxy;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.methods.CloseableHttpResponse;

@NotThreadSafe
class Proxies {
    Proxies() {
    }

    static void enhanceEntity(HttpEntityEnclosingRequest httpEntityEnclosingRequest) {
        HttpEntity entity = httpEntityEnclosingRequest.getEntity();
        if (entity != null && !entity.isRepeatable() && !isEnhanced(entity)) {
            ClassLoader classLoader = HttpEntity.class.getClassLoader();
            RequestEntityExecHandler requestEntityExecHandler = new RequestEntityExecHandler(entity);
            httpEntityEnclosingRequest.setEntity((HttpEntity) Proxy.newProxyInstance(classLoader, new Class[]{HttpEntity.class}, requestEntityExecHandler));
        }
    }

    public static CloseableHttpResponse enhanceResponse(HttpResponse httpResponse, ConnectionHolder connectionHolder) {
        return (CloseableHttpResponse) Proxy.newProxyInstance(ResponseProxyHandler.class.getClassLoader(), new Class[]{CloseableHttpResponse.class}, new ResponseProxyHandler(httpResponse, connectionHolder));
    }

    static boolean isEnhanced(HttpEntity httpEntity) {
        if (httpEntity == null || !Proxy.isProxyClass(httpEntity.getClass())) {
            return false;
        }
        return Proxy.getInvocationHandler(httpEntity) instanceof RequestEntityExecHandler;
    }

    static boolean isRepeatable(HttpRequest httpRequest) {
        HttpEntity entity;
        if (!(httpRequest instanceof HttpEntityEnclosingRequest) || (entity = ((HttpEntityEnclosingRequest) httpRequest).getEntity()) == null) {
            return true;
        }
        if (!isEnhanced(entity) || ((RequestEntityExecHandler) Proxy.getInvocationHandler(entity)).isConsumed()) {
            return entity.isRepeatable();
        }
        return true;
    }
}
