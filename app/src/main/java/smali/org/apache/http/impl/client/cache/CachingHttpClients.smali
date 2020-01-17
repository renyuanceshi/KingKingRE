.class public Lorg/apache/http/impl/client/cache/CachingHttpClients;
.super Ljava/lang/Object;
.source "CachingHttpClients.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    return-void
.end method

.method public static createFileBound(Ljava/io/File;)Lorg/apache/http/impl/client/CloseableHttpClient;
    .locals 1
    .param p0, "cacheDir"    # Ljava/io/File;

    .prologue
    .line 71
    invoke-static {}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->create()Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->setCacheDir(Ljava/io/File;)Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->build()Lorg/apache/http/impl/client/CloseableHttpClient;

    move-result-object v0

    return-object v0
.end method

.method public static createMemoryBound()Lorg/apache/http/impl/client/CloseableHttpClient;
    .locals 1

    .prologue
    .line 61
    invoke-static {}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->create()Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->build()Lorg/apache/http/impl/client/CloseableHttpClient;

    move-result-object v0

    return-object v0
.end method

.method public static custom()Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;
    .locals 1

    .prologue
    .line 53
    invoke-static {}, Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;->create()Lorg/apache/http/impl/client/cache/CachingHttpClientBuilder;

    move-result-object v0

    return-object v0
.end method
