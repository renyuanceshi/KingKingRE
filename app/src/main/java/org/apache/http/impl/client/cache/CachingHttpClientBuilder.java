package org.apache.http.impl.client.cache;

import java.io.File;
import org.apache.http.client.cache.HttpCacheInvalidator;
import org.apache.http.client.cache.HttpCacheStorage;
import org.apache.http.client.cache.ResourceFactory;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.execchain.ClientExecChain;

public class CachingHttpClientBuilder extends HttpClientBuilder {
    private CacheConfig cacheConfig;
    private File cacheDir;
    private HttpCacheInvalidator httpCacheInvalidator;
    private ResourceFactory resourceFactory;
    private SchedulingStrategy schedulingStrategy;
    private HttpCacheStorage storage;

    protected CachingHttpClientBuilder() {
    }

    public static CachingHttpClientBuilder create() {
        return new CachingHttpClientBuilder();
    }

    private AsynchronousValidator createAsynchronousRevalidator(CacheConfig cacheConfig2) {
        if (cacheConfig2.getAsynchronousWorkersMax() <= 0) {
            return null;
        }
        AsynchronousValidator asynchronousValidator = new AsynchronousValidator(createSchedulingStrategy(cacheConfig2));
        addCloseable(asynchronousValidator);
        return asynchronousValidator;
    }

    private SchedulingStrategy createSchedulingStrategy(CacheConfig cacheConfig2) {
        return this.schedulingStrategy != null ? this.schedulingStrategy : new ImmediateSchedulingStrategy(cacheConfig2);
    }

    /* access modifiers changed from: protected */
    public ClientExecChain decorateMainExec(ClientExecChain clientExecChain) {
        CacheConfig cacheConfig2 = this.cacheConfig != null ? this.cacheConfig : CacheConfig.DEFAULT;
        ResourceFactory resourceFactory2 = this.resourceFactory;
        if (resourceFactory2 == null) {
            resourceFactory2 = this.cacheDir == null ? new HeapResourceFactory() : new FileResourceFactory(this.cacheDir);
        }
        HttpCacheStorage httpCacheStorage = this.storage;
        BasicHttpCacheStorage basicHttpCacheStorage = httpCacheStorage;
        if (httpCacheStorage == null) {
            if (this.cacheDir == null) {
                basicHttpCacheStorage = new BasicHttpCacheStorage(cacheConfig2);
            } else {
                ManagedHttpCacheStorage managedHttpCacheStorage = new ManagedHttpCacheStorage(cacheConfig2);
                addCloseable(managedHttpCacheStorage);
                basicHttpCacheStorage = managedHttpCacheStorage;
            }
        }
        AsynchronousValidator createAsynchronousRevalidator = createAsynchronousRevalidator(cacheConfig2);
        CacheKeyGenerator cacheKeyGenerator = new CacheKeyGenerator();
        HttpCacheInvalidator httpCacheInvalidator2 = this.httpCacheInvalidator;
        if (httpCacheInvalidator2 == null) {
            httpCacheInvalidator2 = new CacheInvalidator(cacheKeyGenerator, basicHttpCacheStorage);
        }
        return new CachingExec(clientExecChain, (HttpCache) new BasicHttpCache(resourceFactory2, basicHttpCacheStorage, cacheConfig2, cacheKeyGenerator, httpCacheInvalidator2), cacheConfig2, createAsynchronousRevalidator);
    }

    public final CachingHttpClientBuilder setCacheConfig(CacheConfig cacheConfig2) {
        this.cacheConfig = cacheConfig2;
        return this;
    }

    public final CachingHttpClientBuilder setCacheDir(File file) {
        this.cacheDir = file;
        return this;
    }

    public final CachingHttpClientBuilder setHttpCacheInvalidator(HttpCacheInvalidator httpCacheInvalidator2) {
        this.httpCacheInvalidator = httpCacheInvalidator2;
        return this;
    }

    public final CachingHttpClientBuilder setHttpCacheStorage(HttpCacheStorage httpCacheStorage) {
        this.storage = httpCacheStorage;
        return this;
    }

    public final CachingHttpClientBuilder setResourceFactory(ResourceFactory resourceFactory2) {
        this.resourceFactory = resourceFactory2;
        return this;
    }

    public final CachingHttpClientBuilder setSchedulingStrategy(SchedulingStrategy schedulingStrategy2) {
        this.schedulingStrategy = schedulingStrategy2;
        return this;
    }
}
