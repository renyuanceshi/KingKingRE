.class public Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
.super Lorg/apache/http/impl/client/HttpClientBuilder;
.source "CachingHttpClientBuilder.java"


# instance fields
.field private cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

.field private cacheDir:Ljava/io/File;

.field private httpCacheInvalidator:Lorg/apache/http/client/cache/HttpCacheInvalidator;

.field private resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

.field private schedulingStrategy:Lorg/apache/http/impl/client/cache/SchedulingStrategy;

.field private storage:Lorg/apache/http/client/cache/HttpCacheStorage;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/apache/http/impl/client/HttpClientBuilder;-><init>()V

    .line 58
    return-void
.end method

.method public static create()Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;-><init>()V

    return-object v0
.end method

.method private createAsynchronousRevalidator(Lorg/apache/http/impl/client/cache/CacheConfig;)Lorg/apache/http/impl/client/cache/AsynchronousValidator;
    .locals 3
    .param p1, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 134
    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/CacheConfig;->getAsynchronousWorkersMax()I

    move-result v2

    if-lez v2, :cond_0

    .line 135
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->createSchedulingStrategy(Lorg/apache/http/impl/client/cache/CacheConfig;)Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    move-result-object v0

    .line 136
    .local v0, "configuredSchedulingStrategy":Lorg/apache/http/impl/client/cache/SchedulingStrategy;
    new-instance v1, Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    invoke-direct {v1, v0}, Lorg/apache/http/impl/client/cache/AsynchronousValidator;-><init>(Lorg/apache/http/impl/client/cache/SchedulingStrategy;)V

    .line 138
    .local v1, "revalidator":Lorg/apache/http/impl/client/cache/AsynchronousValidator;
    invoke-virtual {p0, v1}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->addCloseable(Ljava/io/Closeable;)V

    .line 141
    .end local v0    # "configuredSchedulingStrategy":Lorg/apache/http/impl/client/cache/SchedulingStrategy;
    .end local v1    # "revalidator":Lorg/apache/http/impl/client/cache/AsynchronousValidator;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private createSchedulingStrategy(Lorg/apache/http/impl/client/cache/CacheConfig;)Lorg/apache/http/impl/client/cache/SchedulingStrategy;
    .locals 1
    .param p1, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->schedulingStrategy:Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->schedulingStrategy:Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/cache/ImmediateSchedulingStrategy;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V

    goto :goto_0
.end method


# virtual methods
.method protected decorateMainExec(Lorg/apache/http/impl/execchain/ClientExecChain;)Lorg/apache/http/impl/execchain/ClientExecChain;
    .locals 9
    .param p1, "mainExec"    # Lorg/apache/http/impl/execchain/ClientExecChain;

    .prologue
    .line 98
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    if-eqz v0, :cond_3

    iget-object v3, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    .line 99
    .local v3, "config":Lorg/apache/http/impl/client/cache/CacheConfig;
    :goto_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    .line 100
    .local v1, "resourceFactory":Lorg/apache/http/client/cache/ResourceFactory;
    if-nez v1, :cond_0

    .line 101
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->cacheDir:Ljava/io/File;

    if-nez v0, :cond_4

    .line 102
    new-instance v1, Lorg/apache/http/impl/client/cache/HeapResourceFactory;

    .end local v1    # "resourceFactory":Lorg/apache/http/client/cache/ResourceFactory;
    invoke-direct {v1}, Lorg/apache/http/impl/client/cache/HeapResourceFactory;-><init>()V

    .line 107
    .restart local v1    # "resourceFactory":Lorg/apache/http/client/cache/ResourceFactory;
    :cond_0
    :goto_1
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    .line 108
    .local v2, "storage":Lorg/apache/http/client/cache/HttpCacheStorage;
    if-nez v2, :cond_1

    .line 109
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->cacheDir:Ljava/io/File;

    if-nez v0, :cond_5

    .line 110
    new-instance v2, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;

    .end local v2    # "storage":Lorg/apache/http/client/cache/HttpCacheStorage;
    invoke-direct {v2, v3}, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 117
    .restart local v2    # "storage":Lorg/apache/http/client/cache/HttpCacheStorage;
    :cond_1
    :goto_2
    invoke-direct {p0, v3}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->createAsynchronousRevalidator(Lorg/apache/http/impl/client/cache/CacheConfig;)Lorg/apache/http/impl/client/cache/AsynchronousValidator;

    move-result-object v7

    .line 118
    .local v7, "revalidator":Lorg/apache/http/impl/client/cache/AsynchronousValidator;
    new-instance v4, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;

    invoke-direct {v4}, Lorg/apache/http/impl/client/cache/CacheKeyGenerator;-><init>()V

    .line 120
    .local v4, "uriExtractor":Lorg/apache/http/impl/client/cache/CacheKeyGenerator;
    iget-object v5, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->httpCacheInvalidator:Lorg/apache/http/client/cache/HttpCacheInvalidator;

    .line 121
    .local v5, "cacheInvalidator":Lorg/apache/http/client/cache/HttpCacheInvalidator;
    if-nez v5, :cond_2

    .line 122
    new-instance v5, Lorg/apache/http/impl/client/cache/CacheInvalidator;

    .end local v5    # "cacheInvalidator":Lorg/apache/http/client/cache/HttpCacheInvalidator;
    invoke-direct {v5, v4, v2}, Lorg/apache/http/impl/client/cache/CacheInvalidator;-><init>(Lorg/apache/http/impl/client/cache/CacheKeyGenerator;Lorg/apache/http/client/cache/HttpCacheStorage;)V

    .line 125
    .restart local v5    # "cacheInvalidator":Lorg/apache/http/client/cache/HttpCacheInvalidator;
    :cond_2
    new-instance v8, Lorg/apache/http/impl/client/cache/CachingExec;

    new-instance v0, Lorg/apache/http/impl/client/cache/BasicHttpCache;

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/impl/client/cache/BasicHttpCache;-><init>(Lorg/apache/http/client/cache/ResourceFactory;Lorg/apache/http/client/cache/HttpCacheStorage;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/CacheKeyGenerator;Lorg/apache/http/client/cache/HttpCacheInvalidator;)V

    invoke-direct {v8, p1, v0, v3, v7}, Lorg/apache/http/impl/client/cache/CachingExec;-><init>(Lorg/apache/http/impl/execchain/ClientExecChain;Lorg/apache/http/impl/client/cache/HttpCache;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/AsynchronousValidator;)V

    return-object v8

    .line 98
    .end local v1    # "resourceFactory":Lorg/apache/http/client/cache/ResourceFactory;
    .end local v2    # "storage":Lorg/apache/http/client/cache/HttpCacheStorage;
    .end local v3    # "config":Lorg/apache/http/impl/client/cache/CacheConfig;
    .end local v4    # "uriExtractor":Lorg/apache/http/impl/client/cache/CacheKeyGenerator;
    .end local v5    # "cacheInvalidator":Lorg/apache/http/client/cache/HttpCacheInvalidator;
    .end local v7    # "revalidator":Lorg/apache/http/impl/client/cache/AsynchronousValidator;
    :cond_3
    sget-object v3, Lorg/apache/http/impl/client/cache/CacheConfig;->DEFAULT:Lorg/apache/http/impl/client/cache/CacheConfig;

    goto :goto_0

    .line 104
    .restart local v1    # "resourceFactory":Lorg/apache/http/client/cache/ResourceFactory;
    .restart local v3    # "config":Lorg/apache/http/impl/client/cache/CacheConfig;
    :cond_4
    new-instance v1, Lorg/apache/http/impl/client/cache/FileResourceFactory;

    .end local v1    # "resourceFactory":Lorg/apache/http/client/cache/ResourceFactory;
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->cacheDir:Ljava/io/File;

    invoke-direct {v1, v0}, Lorg/apache/http/impl/client/cache/FileResourceFactory;-><init>(Ljava/io/File;)V

    .restart local v1    # "resourceFactory":Lorg/apache/http/client/cache/ResourceFactory;
    goto :goto_1

    .line 112
    .restart local v2    # "storage":Lorg/apache/http/client/cache/HttpCacheStorage;
    :cond_5
    new-instance v6, Lorg/apache/http/impl/client/cache/ManagedHttpCacheStorage;

    invoke-direct {v6, v3}, Lorg/apache/http/impl/client/cache/ManagedHttpCacheStorage;-><init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V

    .line 113
    .local v6, "managedStorage":Lorg/apache/http/impl/client/cache/ManagedHttpCacheStorage;
    invoke-virtual {p0, v6}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->addCloseable(Ljava/io/Closeable;)V

    .line 114
    move-object v2, v6

    goto :goto_2
.end method

.method public final setCacheConfig(Lorg/apache/http/impl/client/cache/CacheConfig;)Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
    .locals 0
    .param p1, "cacheConfig"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 80
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->cacheConfig:Lorg/apache/http/impl/client/cache/CacheConfig;

    .line 81
    return-object p0
.end method

.method public final setCacheDir(Ljava/io/File;)Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
    .locals 0
    .param p1, "cacheDir"    # Ljava/io/File;

    .prologue
    .line 74
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->cacheDir:Ljava/io/File;

    .line 75
    return-object p0
.end method

.method public final setHttpCacheInvalidator(Lorg/apache/http/client/cache/HttpCacheInvalidator;)Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
    .locals 0
    .param p1, "cacheInvalidator"    # Lorg/apache/http/client/cache/HttpCacheInvalidator;

    .prologue
    .line 92
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->httpCacheInvalidator:Lorg/apache/http/client/cache/HttpCacheInvalidator;

    .line 93
    return-object p0
.end method

.method public final setHttpCacheStorage(Lorg/apache/http/client/cache/HttpCacheStorage;)Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
    .locals 0
    .param p1, "storage"    # Lorg/apache/http/client/cache/HttpCacheStorage;

    .prologue
    .line 68
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->storage:Lorg/apache/http/client/cache/HttpCacheStorage;

    .line 69
    return-object p0
.end method

.method public final setResourceFactory(Lorg/apache/http/client/cache/ResourceFactory;)Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
    .locals 0
    .param p1, "resourceFactory"    # Lorg/apache/http/client/cache/ResourceFactory;

    .prologue
    .line 62
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->resourceFactory:Lorg/apache/http/client/cache/ResourceFactory;

    .line 63
    return-object p0
.end method

.method public final setSchedulingStrategy(Lorg/apache/http/impl/client/cache/SchedulingStrategy;)Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
    .locals 0
    .param p1, "schedulingStrategy"    # Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->schedulingStrategy:Lorg/apache/http/impl/client/cache/SchedulingStrategy;

    .line 87
    return-object p0
.end method
