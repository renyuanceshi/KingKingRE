package org.apache.http.impl.client.cache;

import java.io.IOException;
import java.lang.reflect.UndeclaredThrowableException;
import java.net.URI;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpMessage;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolException;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.cache.CacheResponseStatus;
import org.apache.http.client.cache.HeaderConstants;
import org.apache.http.client.cache.HttpCacheEntry;
import org.apache.http.client.cache.HttpCacheStorage;
import org.apache.http.client.cache.ResourceFactory;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.DateParseException;
import org.apache.http.impl.cookie.DateUtils;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.VersionInfo;

@Deprecated
@ThreadSafe
public class CachingHttpClient implements HttpClient {
    public static final String CACHE_RESPONSE_STATUS = "http.cache.response.status";
    private static final boolean SUPPORTS_RANGE_AND_CONTENT_RANGE_HEADERS = false;
    private final AsynchronousValidator asynchRevalidator;
    private final HttpClient backend;
    private final AtomicLong cacheHits;
    private final AtomicLong cacheMisses;
    private final AtomicLong cacheUpdates;
    private final CacheableRequestPolicy cacheableRequestPolicy;
    private final ConditionalRequestBuilder conditionalRequestBuilder;
    private final Log log;
    private final long maxObjectSizeBytes;
    private final RequestProtocolCompliance requestCompliance;
    private final HttpCache responseCache;
    private final ResponseCachingPolicy responseCachingPolicy;
    private final ResponseProtocolCompliance responseCompliance;
    private final CachedHttpResponseGenerator responseGenerator;
    private final boolean sharedCache;
    private final CachedResponseSuitabilityChecker suitabilityChecker;
    private final CacheValidityPolicy validityPolicy;
    private final Map<ProtocolVersion, String> viaHeaders;

    static class AsynchronousValidationRequest implements Runnable {
        private final HttpCacheEntry cacheEntry;
        private final CachingHttpClient cachingClient;
        private final HttpContext context;
        private final String identifier;
        private final Log log = LogFactory.getLog(getClass());
        private final AsynchronousValidator parent;
        private final HttpRequestWrapper request;
        private final HttpHost target;

        AsynchronousValidationRequest(AsynchronousValidator asynchronousValidator, CachingHttpClient cachingHttpClient, HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, HttpCacheEntry httpCacheEntry, String str) {
            this.parent = asynchronousValidator;
            this.cachingClient = cachingHttpClient;
            this.target = httpHost;
            this.request = httpRequestWrapper;
            this.context = httpContext;
            this.cacheEntry = httpCacheEntry;
            this.identifier = str;
        }

        /* access modifiers changed from: package-private */
        public String getIdentifier() {
            return this.identifier;
        }

        public void run() {
            try {
                this.cachingClient.revalidateCacheEntry(this.target, this.request, this.context, this.cacheEntry);
            } catch (IOException e) {
                this.log.debug("Asynchronous revalidation failed due to exception: " + e);
            } catch (ProtocolException e2) {
                this.log.error("ProtocolException thrown during asynchronous revalidation: " + e2);
            } finally {
                this.parent.markComplete(this.identifier);
            }
        }
    }

    static class AsynchronousValidator {
        private final CacheKeyGenerator cacheKeyGenerator;
        private final CachingHttpClient cachingClient;
        private final ExecutorService executor;
        private final Log log;
        private final Set<String> queued;

        AsynchronousValidator(CachingHttpClient cachingHttpClient, ExecutorService executorService) {
            this.log = LogFactory.getLog(getClass());
            this.cachingClient = cachingHttpClient;
            this.executor = executorService;
            this.queued = new HashSet();
            this.cacheKeyGenerator = new CacheKeyGenerator();
        }

        public AsynchronousValidator(CachingHttpClient cachingHttpClient, CacheConfig cacheConfig) {
            this(cachingHttpClient, (ExecutorService) new ThreadPoolExecutor(cacheConfig.getAsynchronousWorkersCore(), cacheConfig.getAsynchronousWorkersMax(), (long) cacheConfig.getAsynchronousWorkerIdleLifetimeSecs(), TimeUnit.SECONDS, new ArrayBlockingQueue(cacheConfig.getRevalidationQueueSize())));
        }

        /* access modifiers changed from: package-private */
        public ExecutorService getExecutor() {
            return this.executor;
        }

        /* access modifiers changed from: package-private */
        public Set<String> getScheduledIdentifiers() {
            return Collections.unmodifiableSet(this.queued);
        }

        /* access modifiers changed from: package-private */
        public void markComplete(String str) {
            synchronized (this) {
                this.queued.remove(str);
            }
        }

        public void revalidateCacheEntry(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, HttpCacheEntry httpCacheEntry) {
            synchronized (this) {
                String variantURI = this.cacheKeyGenerator.getVariantURI(httpHost, httpRequestWrapper, httpCacheEntry);
                if (!this.queued.contains(variantURI)) {
                    try {
                        this.executor.execute(new AsynchronousValidationRequest(this, this.cachingClient, httpHost, httpRequestWrapper, httpContext, httpCacheEntry, variantURI));
                        this.queued.add(variantURI);
                    } catch (RejectedExecutionException e) {
                        this.log.debug("Revalidation for [" + variantURI + "] not scheduled: " + e);
                    }
                }
            }
            return;
        }
    }

    public CachingHttpClient() {
        this((HttpClient) new DefaultHttpClient(), (HttpCache) new BasicHttpCache(), new CacheConfig());
    }

    public CachingHttpClient(HttpClient httpClient) {
        this(httpClient, (HttpCache) new BasicHttpCache(), new CacheConfig());
    }

    public CachingHttpClient(HttpClient httpClient, HttpCacheStorage httpCacheStorage, CacheConfig cacheConfig) {
        this(httpClient, (HttpCache) new BasicHttpCache(new HeapResourceFactory(), httpCacheStorage, cacheConfig), cacheConfig);
    }

    public CachingHttpClient(HttpClient httpClient, ResourceFactory resourceFactory, HttpCacheStorage httpCacheStorage, CacheConfig cacheConfig) {
        this(httpClient, (HttpCache) new BasicHttpCache(resourceFactory, httpCacheStorage, cacheConfig), cacheConfig);
    }

    public CachingHttpClient(HttpClient httpClient, CacheConfig cacheConfig) {
        this(httpClient, (HttpCache) new BasicHttpCache(cacheConfig), cacheConfig);
    }

    CachingHttpClient(HttpClient httpClient, CacheValidityPolicy cacheValidityPolicy, ResponseCachingPolicy responseCachingPolicy2, HttpCache httpCache, CachedHttpResponseGenerator cachedHttpResponseGenerator, CacheableRequestPolicy cacheableRequestPolicy2, CachedResponseSuitabilityChecker cachedResponseSuitabilityChecker, ConditionalRequestBuilder conditionalRequestBuilder2, ResponseProtocolCompliance responseProtocolCompliance, RequestProtocolCompliance requestProtocolCompliance) {
        this.cacheHits = new AtomicLong();
        this.cacheMisses = new AtomicLong();
        this.cacheUpdates = new AtomicLong();
        this.viaHeaders = new HashMap(4);
        this.log = LogFactory.getLog(getClass());
        CacheConfig cacheConfig = new CacheConfig();
        this.maxObjectSizeBytes = cacheConfig.getMaxObjectSize();
        this.sharedCache = cacheConfig.isSharedCache();
        this.backend = httpClient;
        this.validityPolicy = cacheValidityPolicy;
        this.responseCachingPolicy = responseCachingPolicy2;
        this.responseCache = httpCache;
        this.responseGenerator = cachedHttpResponseGenerator;
        this.cacheableRequestPolicy = cacheableRequestPolicy2;
        this.suitabilityChecker = cachedResponseSuitabilityChecker;
        this.conditionalRequestBuilder = conditionalRequestBuilder2;
        this.responseCompliance = responseProtocolCompliance;
        this.requestCompliance = requestProtocolCompliance;
        this.asynchRevalidator = makeAsynchronousValidator(cacheConfig);
    }

    CachingHttpClient(HttpClient httpClient, HttpCache httpCache, CacheConfig cacheConfig) {
        this.cacheHits = new AtomicLong();
        this.cacheMisses = new AtomicLong();
        this.cacheUpdates = new AtomicLong();
        this.viaHeaders = new HashMap(4);
        this.log = LogFactory.getLog(getClass());
        Args.notNull(httpClient, "HttpClient");
        Args.notNull(httpCache, "HttpCache");
        Args.notNull(cacheConfig, "CacheConfig");
        this.maxObjectSizeBytes = cacheConfig.getMaxObjectSize();
        this.sharedCache = cacheConfig.isSharedCache();
        this.backend = httpClient;
        this.responseCache = httpCache;
        this.validityPolicy = new CacheValidityPolicy();
        this.responseCachingPolicy = new ResponseCachingPolicy(this.maxObjectSizeBytes, this.sharedCache, cacheConfig.isNeverCacheHTTP10ResponsesWithQuery(), cacheConfig.is303CachingEnabled());
        this.responseGenerator = new CachedHttpResponseGenerator(this.validityPolicy);
        this.cacheableRequestPolicy = new CacheableRequestPolicy();
        this.suitabilityChecker = new CachedResponseSuitabilityChecker(this.validityPolicy, cacheConfig);
        this.conditionalRequestBuilder = new ConditionalRequestBuilder();
        this.responseCompliance = new ResponseProtocolCompliance();
        this.requestCompliance = new RequestProtocolCompliance(cacheConfig.isWeakETagOnPutDeleteAllowed());
        this.asynchRevalidator = makeAsynchronousValidator(cacheConfig);
    }

    public CachingHttpClient(CacheConfig cacheConfig) {
        this((HttpClient) new DefaultHttpClient(), (HttpCache) new BasicHttpCache(cacheConfig), cacheConfig);
    }

    private boolean alreadyHaveNewerCacheEntry(HttpHost httpHost, HttpRequest httpRequest, HttpResponse httpResponse) {
        Header firstHeader;
        Header firstHeader2;
        HttpCacheEntry httpCacheEntry = null;
        try {
            httpCacheEntry = this.responseCache.getCacheEntry(httpHost, httpRequest);
        } catch (IOException e) {
        }
        if (httpCacheEntry == null || (firstHeader = httpCacheEntry.getFirstHeader("Date")) == null || (firstHeader2 = httpResponse.getFirstHeader("Date")) == null) {
            return false;
        }
        try {
            return DateUtils.parseDate(firstHeader2.getValue()).before(DateUtils.parseDate(firstHeader.getValue()));
        } catch (DateParseException e2) {
            return false;
        }
    }

    private boolean explicitFreshnessRequest(HttpRequestWrapper httpRequestWrapper, HttpCacheEntry httpCacheEntry, Date date) {
        for (Header elements : httpRequestWrapper.getHeaders("Cache-Control")) {
            for (HeaderElement headerElement : elements.getElements()) {
                if (HeaderConstants.CACHE_CONTROL_MAX_STALE.equals(headerElement.getName())) {
                    try {
                        if (this.validityPolicy.getCurrentAgeSecs(httpCacheEntry, date) - this.validityPolicy.getFreshnessLifetimeSecs(httpCacheEntry) > ((long) Integer.parseInt(headerElement.getValue()))) {
                            return true;
                        }
                    } catch (NumberFormatException e) {
                        return true;
                    }
                } else if (HeaderConstants.CACHE_CONTROL_MIN_FRESH.equals(headerElement.getName()) || "max-age".equals(headerElement.getName())) {
                    return true;
                }
            }
        }
        return false;
    }

    private void flushEntriesInvalidatedByRequest(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper) {
        try {
            this.responseCache.flushInvalidatedCacheEntriesFor(httpHost, httpRequestWrapper);
        } catch (IOException e) {
            this.log.warn("Unable to flush invalidated entries from cache", e);
        }
    }

    private HttpResponse generateCachedResponse(HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, HttpCacheEntry httpCacheEntry, Date date) {
        CloseableHttpResponse generateNotModifiedResponse = (httpRequestWrapper.containsHeader("If-None-Match") || httpRequestWrapper.containsHeader("If-Modified-Since")) ? this.responseGenerator.generateNotModifiedResponse(httpCacheEntry) : this.responseGenerator.generateResponse(httpCacheEntry);
        setResponseStatus(httpContext, CacheResponseStatus.CACHE_HIT);
        if (this.validityPolicy.getStalenessSecs(httpCacheEntry, date) > 0) {
            generateNotModifiedResponse.addHeader("Warning", "110 localhost \"Response is stale\"");
        }
        return generateNotModifiedResponse;
    }

    private HttpResponse generateGatewayTimeout(HttpContext httpContext) {
        setResponseStatus(httpContext, CacheResponseStatus.CACHE_MODULE_RESPONSE);
        return new BasicHttpResponse((ProtocolVersion) HttpVersion.HTTP_1_1, (int) HttpStatus.SC_GATEWAY_TIMEOUT, "Gateway Timeout");
    }

    private String generateViaHeader(HttpMessage httpMessage) {
        ProtocolVersion protocolVersion = httpMessage.getProtocolVersion();
        String str = this.viaHeaders.get(protocolVersion);
        if (str == null) {
            VersionInfo loadVersionInfo = VersionInfo.loadVersionInfo("org.apache.http.client", getClass().getClassLoader());
            String release = loadVersionInfo != null ? loadVersionInfo.getRelease() : VersionInfo.UNAVAILABLE;
            str = HttpHost.DEFAULT_SCHEME_NAME.equalsIgnoreCase(protocolVersion.getProtocol()) ? String.format("%d.%d localhost (Apache-HttpClient/%s (cache))", new Object[]{Integer.valueOf(protocolVersion.getMajor()), Integer.valueOf(protocolVersion.getMinor()), release}) : String.format("%s/%d.%d localhost (Apache-HttpClient/%s (cache))", new Object[]{protocolVersion.getProtocol(), Integer.valueOf(protocolVersion.getMajor()), Integer.valueOf(protocolVersion.getMinor()), release});
            this.viaHeaders.put(protocolVersion, str);
        }
        return str;
    }

    private Map<String, Variant> getExistingCacheVariants(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper) {
        try {
            return this.responseCache.getVariantCacheEntriesWithEtags(httpHost, httpRequestWrapper);
        } catch (IOException e) {
            this.log.warn("Unable to retrieve variant entries from cache", e);
            return null;
        }
    }

    private HttpResponse getFatallyNoncompliantResponse(HttpRequestWrapper httpRequestWrapper, HttpContext httpContext) {
        HttpResponse httpResponse = null;
        for (RequestProtocolError errorForRequest : this.requestCompliance.requestIsFatallyNonCompliant(httpRequestWrapper)) {
            setResponseStatus(httpContext, CacheResponseStatus.CACHE_MODULE_RESPONSE);
            httpResponse = this.requestCompliance.getErrorForRequest(errorForRequest);
        }
        return httpResponse;
    }

    private HttpCacheEntry getUpdatedVariantEntry(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, Date date, Date date2, HttpResponse httpResponse, Variant variant, HttpCacheEntry httpCacheEntry) {
        try {
            return this.responseCache.updateVariantCacheEntry(httpHost, httpRequestWrapper, httpCacheEntry, httpResponse, date, date2, variant.getCacheKey());
        } catch (IOException e) {
            this.log.warn("Could not update cache entry", e);
            return httpCacheEntry;
        }
    }

    private <T> T handleAndConsume(ResponseHandler<? extends T> responseHandler, HttpResponse httpResponse) throws Error, IOException {
        try {
            T handleResponse = responseHandler.handleResponse(httpResponse);
            IOUtils.consume(httpResponse.getEntity());
            return handleResponse;
        } catch (Exception e) {
            try {
                IOUtils.consume(httpResponse.getEntity());
            } catch (Exception e2) {
                this.log.warn("Error consuming content after an exception.", e2);
            }
            if (e instanceof RuntimeException) {
                throw ((RuntimeException) e);
            } else if (e instanceof IOException) {
                throw ((IOException) e);
            } else {
                throw new UndeclaredThrowableException(e);
            }
        }
    }

    private HttpResponse handleCacheHit(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, HttpCacheEntry httpCacheEntry) throws ClientProtocolException, IOException {
        HttpResponse generateGatewayTimeout;
        recordCacheHit(httpHost, httpRequestWrapper);
        Date currentDate = getCurrentDate();
        if (this.suitabilityChecker.canCachedResponseBeUsed(httpHost, httpRequestWrapper, httpCacheEntry, currentDate)) {
            this.log.debug("Cache hit");
            generateGatewayTimeout = generateCachedResponse(httpRequestWrapper, httpContext, httpCacheEntry, currentDate);
        } else if (!mayCallBackend(httpRequestWrapper)) {
            this.log.debug("Cache entry not suitable but only-if-cached requested");
            generateGatewayTimeout = generateGatewayTimeout(httpContext);
        } else {
            this.log.debug("Revalidating cache entry");
            return revalidateCacheEntry(httpHost, httpRequestWrapper, httpContext, httpCacheEntry, currentDate);
        }
        if (httpContext == null) {
            return generateGatewayTimeout;
        }
        httpContext.setAttribute("http.target_host", httpHost);
        httpContext.setAttribute("http.request", httpRequestWrapper);
        httpContext.setAttribute("http.response", generateGatewayTimeout);
        httpContext.setAttribute("http.request_sent", Boolean.TRUE);
        return generateGatewayTimeout;
    }

    private HttpResponse handleCacheMiss(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext) throws IOException {
        recordCacheMiss(httpHost, httpRequestWrapper);
        if (!mayCallBackend(httpRequestWrapper)) {
            return new BasicHttpResponse((ProtocolVersion) HttpVersion.HTTP_1_1, (int) HttpStatus.SC_GATEWAY_TIMEOUT, "Gateway Timeout");
        }
        Map<String, Variant> existingCacheVariants = getExistingCacheVariants(httpHost, httpRequestWrapper);
        return (existingCacheVariants == null || existingCacheVariants.size() <= 0) ? callBackend(httpHost, httpRequestWrapper, httpContext) : negotiateResponseFromVariants(httpHost, httpRequestWrapper, httpContext, existingCacheVariants);
    }

    private HttpResponse handleRevalidationFailure(HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, HttpCacheEntry httpCacheEntry, Date date) {
        return staleResponseNotAllowed(httpRequestWrapper, httpCacheEntry, date) ? generateGatewayTimeout(httpContext) : unvalidatedCacheHit(httpContext, httpCacheEntry);
    }

    private AsynchronousValidator makeAsynchronousValidator(CacheConfig cacheConfig) {
        if (cacheConfig.getAsynchronousWorkersMax() > 0) {
            return new AsynchronousValidator(this, cacheConfig);
        }
        return null;
    }

    private boolean mayCallBackend(HttpRequestWrapper httpRequestWrapper) {
        for (Header elements : httpRequestWrapper.getHeaders("Cache-Control")) {
            for (HeaderElement name : elements.getElements()) {
                if ("only-if-cached".equals(name.getName())) {
                    this.log.trace("Request marked only-if-cached");
                    return false;
                }
            }
        }
        return true;
    }

    private void recordCacheHit(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper) {
        this.cacheHits.getAndIncrement();
        if (this.log.isTraceEnabled()) {
            this.log.trace("Cache hit [host: " + httpHost + "; uri: " + httpRequestWrapper.getRequestLine().getUri() + "]");
        }
    }

    private void recordCacheMiss(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper) {
        this.cacheMisses.getAndIncrement();
        if (this.log.isTraceEnabled()) {
            this.log.trace("Cache miss [host: " + httpHost + "; uri: " + httpRequestWrapper.getRequestLine().getUri() + "]");
        }
    }

    private void recordCacheUpdate(HttpContext httpContext) {
        this.cacheUpdates.getAndIncrement();
        setResponseStatus(httpContext, CacheResponseStatus.VALIDATED);
    }

    private HttpResponse retryRequestUnconditionally(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, HttpCacheEntry httpCacheEntry) throws IOException {
        return callBackend(httpHost, this.conditionalRequestBuilder.buildUnconditionalRequest(httpRequestWrapper, httpCacheEntry), httpContext);
    }

    private HttpResponse revalidateCacheEntry(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, HttpCacheEntry httpCacheEntry, Date date) throws ClientProtocolException {
        try {
            if (this.asynchRevalidator == null || staleResponseNotAllowed(httpRequestWrapper, httpCacheEntry, date) || !this.validityPolicy.mayReturnStaleWhileRevalidating(httpCacheEntry, date)) {
                return revalidateCacheEntry(httpHost, httpRequestWrapper, httpContext, httpCacheEntry);
            }
            this.log.trace("Serving stale with asynchronous revalidation");
            HttpResponse generateCachedResponse = generateCachedResponse(httpRequestWrapper, httpContext, httpCacheEntry, date);
            this.asynchRevalidator.revalidateCacheEntry(httpHost, httpRequestWrapper, httpContext, httpCacheEntry);
            return generateCachedResponse;
        } catch (IOException e) {
            return handleRevalidationFailure(httpRequestWrapper, httpContext, httpCacheEntry, date);
        } catch (ProtocolException e2) {
            throw new ClientProtocolException((Throwable) e2);
        }
    }

    private boolean revalidationResponseIsTooOld(HttpResponse httpResponse, HttpCacheEntry httpCacheEntry) {
        Header firstHeader = httpCacheEntry.getFirstHeader("Date");
        Header firstHeader2 = httpResponse.getFirstHeader("Date");
        if (!(firstHeader == null || firstHeader2 == null)) {
            try {
                if (DateUtils.parseDate(firstHeader2.getValue()).before(DateUtils.parseDate(firstHeader.getValue()))) {
                    return true;
                }
            } catch (DateParseException e) {
            }
        }
        return false;
    }

    private HttpCacheEntry satisfyFromCache(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper) {
        try {
            return this.responseCache.getCacheEntry(httpHost, httpRequestWrapper);
        } catch (IOException e) {
            this.log.warn("Unable to retrieve entries from cache", e);
            return null;
        }
    }

    private void setResponseStatus(HttpContext httpContext, CacheResponseStatus cacheResponseStatus) {
        if (httpContext != null) {
            httpContext.setAttribute("http.cache.response.status", cacheResponseStatus);
        }
    }

    private boolean shouldSendNotModifiedResponse(HttpRequestWrapper httpRequestWrapper, HttpCacheEntry httpCacheEntry) {
        return this.suitabilityChecker.isConditional(httpRequestWrapper) && this.suitabilityChecker.allConditionalsMatch(httpRequestWrapper, httpCacheEntry, new Date());
    }

    private boolean staleIfErrorAppliesTo(int i) {
        return i == 500 || i == 502 || i == 503 || i == 504;
    }

    private boolean staleResponseNotAllowed(HttpRequestWrapper httpRequestWrapper, HttpCacheEntry httpCacheEntry, Date date) {
        return this.validityPolicy.mustRevalidate(httpCacheEntry) || (isSharedCache() && this.validityPolicy.proxyRevalidate(httpCacheEntry)) || explicitFreshnessRequest(httpRequestWrapper, httpCacheEntry, date);
    }

    private void storeRequestIfModifiedSinceFor304Response(HttpRequest httpRequest, HttpResponse httpResponse) {
        Header firstHeader;
        if (httpResponse.getStatusLine().getStatusCode() == 304 && (firstHeader = httpRequest.getFirstHeader("If-Modified-Since")) != null) {
            httpResponse.addHeader("Last-Modified", firstHeader.getValue());
        }
    }

    private void tryToUpdateVariantMap(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, Variant variant) {
        try {
            this.responseCache.reuseVariantEntryFor(httpHost, httpRequestWrapper, variant);
        } catch (IOException e) {
            this.log.warn("Could not update cache entry to reuse variant", e);
        }
    }

    private HttpResponse unvalidatedCacheHit(HttpContext httpContext, HttpCacheEntry httpCacheEntry) {
        CloseableHttpResponse generateResponse = this.responseGenerator.generateResponse(httpCacheEntry);
        setResponseStatus(httpContext, CacheResponseStatus.CACHE_HIT);
        generateResponse.addHeader("Warning", "111 localhost \"Revalidation failed\"");
        return generateResponse;
    }

    /* access modifiers changed from: package-private */
    public HttpResponse callBackend(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext) throws IOException {
        Date currentDate = getCurrentDate();
        this.log.trace("Calling the backend");
        HttpResponse execute = this.backend.execute(httpHost, (HttpRequest) httpRequestWrapper, httpContext);
        execute.addHeader("Via", generateViaHeader(execute));
        return handleBackendResponse(httpHost, httpRequestWrapper, currentDate, getCurrentDate(), execute);
    }

    /* access modifiers changed from: package-private */
    public boolean clientRequestsOurOptions(HttpRequest httpRequest) {
        RequestLine requestLine = httpRequest.getRequestLine();
        return "OPTIONS".equals(requestLine.getMethod()) && "*".equals(requestLine.getUri()) && "0".equals(httpRequest.getFirstHeader("Max-Forwards").getValue());
    }

    public <T> T execute(HttpHost httpHost, HttpRequest httpRequest, ResponseHandler<? extends T> responseHandler) throws IOException {
        return execute(httpHost, httpRequest, responseHandler, (HttpContext) null);
    }

    public <T> T execute(HttpHost httpHost, HttpRequest httpRequest, ResponseHandler<? extends T> responseHandler, HttpContext httpContext) throws IOException {
        return handleAndConsume(responseHandler, execute(httpHost, httpRequest, httpContext));
    }

    public <T> T execute(HttpUriRequest httpUriRequest, ResponseHandler<? extends T> responseHandler) throws IOException {
        return execute(httpUriRequest, responseHandler, (HttpContext) null);
    }

    public <T> T execute(HttpUriRequest httpUriRequest, ResponseHandler<? extends T> responseHandler, HttpContext httpContext) throws IOException {
        return handleAndConsume(responseHandler, execute(httpUriRequest, httpContext));
    }

    public HttpResponse execute(HttpHost httpHost, HttpRequest httpRequest) throws IOException {
        return execute(httpHost, httpRequest, (HttpContext) null);
    }

    public HttpResponse execute(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws IOException {
        HttpRequestWrapper wrap = httpRequest instanceof HttpRequestWrapper ? (HttpRequestWrapper) httpRequest : HttpRequestWrapper.wrap(httpRequest);
        String generateViaHeader = generateViaHeader(httpRequest);
        setResponseStatus(httpContext, CacheResponseStatus.CACHE_MISS);
        if (clientRequestsOurOptions(wrap)) {
            setResponseStatus(httpContext, CacheResponseStatus.CACHE_MODULE_RESPONSE);
            return new OptionsHttp11Response();
        }
        HttpResponse fatallyNoncompliantResponse = getFatallyNoncompliantResponse(wrap, httpContext);
        if (fatallyNoncompliantResponse != null) {
            return fatallyNoncompliantResponse;
        }
        this.requestCompliance.makeRequestCompliant(wrap);
        wrap.addHeader("Via", generateViaHeader);
        flushEntriesInvalidatedByRequest(httpHost, wrap);
        if (!this.cacheableRequestPolicy.isServableFromCache(wrap)) {
            this.log.debug("Request is not servable from cache");
            return callBackend(httpHost, wrap, httpContext);
        }
        HttpCacheEntry satisfyFromCache = satisfyFromCache(httpHost, wrap);
        if (satisfyFromCache != null) {
            return handleCacheHit(httpHost, wrap, httpContext, satisfyFromCache);
        }
        this.log.debug("Cache miss");
        return handleCacheMiss(httpHost, wrap, httpContext);
    }

    public HttpResponse execute(HttpUriRequest httpUriRequest) throws IOException {
        return execute(httpUriRequest, (HttpContext) null);
    }

    public HttpResponse execute(HttpUriRequest httpUriRequest, HttpContext httpContext) throws IOException {
        URI uri = httpUriRequest.getURI();
        return execute(new HttpHost(uri.getHost(), uri.getPort(), uri.getScheme()), (HttpRequest) httpUriRequest, httpContext);
    }

    public long getCacheHits() {
        return this.cacheHits.get();
    }

    public long getCacheMisses() {
        return this.cacheMisses.get();
    }

    public long getCacheUpdates() {
        return this.cacheUpdates.get();
    }

    public ClientConnectionManager getConnectionManager() {
        return this.backend.getConnectionManager();
    }

    /* access modifiers changed from: package-private */
    public Date getCurrentDate() {
        return new Date();
    }

    public HttpParams getParams() {
        return this.backend.getParams();
    }

    /* access modifiers changed from: package-private */
    public HttpResponse handleBackendResponse(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, Date date, Date date2, HttpResponse httpResponse) throws IOException {
        this.log.trace("Handling Backend response");
        this.responseCompliance.ensureProtocolCompliance(httpRequestWrapper, httpResponse);
        boolean isResponseCacheable = this.responseCachingPolicy.isResponseCacheable((HttpRequest) httpRequestWrapper, httpResponse);
        this.responseCache.flushInvalidatedCacheEntriesFor(httpHost, httpRequestWrapper, httpResponse);
        if (isResponseCacheable && !alreadyHaveNewerCacheEntry(httpHost, httpRequestWrapper, httpResponse)) {
            try {
                storeRequestIfModifiedSinceFor304Response(httpRequestWrapper, httpResponse);
                return this.responseCache.cacheAndReturnResponse(httpHost, (HttpRequest) httpRequestWrapper, httpResponse, date, date2);
            } catch (IOException e) {
                this.log.warn("Unable to store entries in cache", e);
            }
        }
        if (isResponseCacheable) {
            return httpResponse;
        }
        try {
            this.responseCache.flushCacheEntriesFor(httpHost, httpRequestWrapper);
            return httpResponse;
        } catch (IOException e2) {
            this.log.warn("Unable to flush invalid cache entries", e2);
            return httpResponse;
        }
    }

    public boolean isSharedCache() {
        return this.sharedCache;
    }

    /* access modifiers changed from: package-private */
    public HttpResponse negotiateResponseFromVariants(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, Map<String, Variant> map) throws IOException {
        HttpRequestWrapper buildConditionalRequestFromVariants = this.conditionalRequestBuilder.buildConditionalRequestFromVariants(httpRequestWrapper, map);
        Date currentDate = getCurrentDate();
        HttpResponse execute = this.backend.execute(httpHost, (HttpRequest) buildConditionalRequestFromVariants, httpContext);
        Date currentDate2 = getCurrentDate();
        execute.addHeader("Via", generateViaHeader(execute));
        if (execute.getStatusLine().getStatusCode() != 304) {
            return handleBackendResponse(httpHost, httpRequestWrapper, currentDate, currentDate2, execute);
        }
        Header firstHeader = execute.getFirstHeader("ETag");
        if (firstHeader == null) {
            this.log.warn("304 response did not contain ETag");
            return callBackend(httpHost, httpRequestWrapper, httpContext);
        }
        Variant variant = map.get(firstHeader.getValue());
        if (variant == null) {
            this.log.debug("304 response did not contain ETag matching one sent in If-None-Match");
            return callBackend(httpHost, httpRequestWrapper, httpContext);
        }
        HttpCacheEntry entry = variant.getEntry();
        if (revalidationResponseIsTooOld(execute, entry)) {
            IOUtils.consume(execute.getEntity());
            return retryRequestUnconditionally(httpHost, httpRequestWrapper, httpContext, entry);
        }
        recordCacheUpdate(httpContext);
        HttpCacheEntry updatedVariantEntry = getUpdatedVariantEntry(httpHost, buildConditionalRequestFromVariants, currentDate, currentDate2, execute, variant, entry);
        CloseableHttpResponse generateResponse = this.responseGenerator.generateResponse(updatedVariantEntry);
        tryToUpdateVariantMap(httpHost, httpRequestWrapper, variant);
        return shouldSendNotModifiedResponse(httpRequestWrapper, updatedVariantEntry) ? this.responseGenerator.generateNotModifiedResponse(updatedVariantEntry) : generateResponse;
    }

    /* access modifiers changed from: package-private */
    public HttpResponse revalidateCacheEntry(HttpHost httpHost, HttpRequestWrapper httpRequestWrapper, HttpContext httpContext, HttpCacheEntry httpCacheEntry) throws IOException, ProtocolException {
        HttpRequestWrapper buildConditionalRequest = this.conditionalRequestBuilder.buildConditionalRequest(httpRequestWrapper, httpCacheEntry);
        Date currentDate = getCurrentDate();
        HttpResponse execute = this.backend.execute(httpHost, (HttpRequest) buildConditionalRequest, httpContext);
        Date currentDate2 = getCurrentDate();
        if (revalidationResponseIsTooOld(execute, httpCacheEntry)) {
            IOUtils.consume(execute.getEntity());
            HttpRequestWrapper buildUnconditionalRequest = this.conditionalRequestBuilder.buildUnconditionalRequest(httpRequestWrapper, httpCacheEntry);
            currentDate = getCurrentDate();
            execute = this.backend.execute(httpHost, (HttpRequest) buildUnconditionalRequest, httpContext);
            currentDate2 = getCurrentDate();
        }
        execute.addHeader("Via", generateViaHeader(execute));
        int statusCode = execute.getStatusLine().getStatusCode();
        if (statusCode == 304 || statusCode == 200) {
            recordCacheUpdate(httpContext);
        }
        if (statusCode == 304) {
            HttpCacheEntry updateCacheEntry = this.responseCache.updateCacheEntry(httpHost, httpRequestWrapper, httpCacheEntry, execute, currentDate, currentDate2);
            if (this.suitabilityChecker.isConditional(httpRequestWrapper)) {
                if (this.suitabilityChecker.allConditionalsMatch(httpRequestWrapper, updateCacheEntry, new Date())) {
                    return this.responseGenerator.generateNotModifiedResponse(updateCacheEntry);
                }
            }
            return this.responseGenerator.generateResponse(updateCacheEntry);
        }
        if (staleIfErrorAppliesTo(statusCode)) {
            if (!staleResponseNotAllowed(httpRequestWrapper, httpCacheEntry, getCurrentDate()) && this.validityPolicy.mayReturnStaleIfError(httpRequestWrapper, httpCacheEntry, currentDate2)) {
                CloseableHttpResponse generateResponse = this.responseGenerator.generateResponse(httpCacheEntry);
                generateResponse.addHeader("Warning", "110 localhost \"Response is stale\"");
                HttpEntity entity = execute.getEntity();
                if (entity == null) {
                    return generateResponse;
                }
                IOUtils.consume(entity);
                return generateResponse;
            }
        }
        return handleBackendResponse(httpHost, buildConditionalRequest, currentDate, currentDate2, execute);
    }

    public boolean supportsRangeAndContentRangeHeaders() {
        return false;
    }
}
