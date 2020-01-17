.class public Lorg/apache/http/client/cache/HttpCacheContext;
.super Lorg/apache/http/client/protocol/HttpClientContext;
.source "HttpCacheContext.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field public static final CACHE_RESPONSE_STATUS:Ljava/lang/String; = "http.cache.response.status"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/apache/http/client/protocol/HttpClientContext;-><init>()V

    .line 65
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpContext;)V
    .locals 0
    .param p1, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lorg/apache/http/client/protocol/HttpClientContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    .line 61
    return-void
.end method

.method public static adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/cache/HttpCacheContext;
    .locals 1
    .param p0, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 48
    instance-of v0, p0, Lorg/apache/http/client/cache/HttpCacheContext;

    if-eqz v0, :cond_0

    .line 49
    check-cast p0, Lorg/apache/http/client/cache/HttpCacheContext;

    .line 51
    .end local p0    # "context":Lorg/apache/http/protocol/HttpContext;
    :goto_0
    return-object p0

    .restart local p0    # "context":Lorg/apache/http/protocol/HttpContext;
    :cond_0
    new-instance v0, Lorg/apache/http/client/cache/HttpCacheContext;

    invoke-direct {v0, p0}, Lorg/apache/http/client/cache/HttpCacheContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    move-object p0, v0

    goto :goto_0
.end method

.method public static create()Lorg/apache/http/client/cache/HttpCacheContext;
    .locals 2

    .prologue
    .line 56
    new-instance v0, Lorg/apache/http/client/cache/HttpCacheContext;

    new-instance v1, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v1}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/http/client/cache/HttpCacheContext;-><init>(Lorg/apache/http/protocol/HttpContext;)V

    return-object v0
.end method


# virtual methods
.method public getCacheResponseStatus()Lorg/apache/http/client/cache/CacheResponseStatus;
    .locals 2

    .prologue
    .line 68
    const-string/jumbo v0, "http.cache.response.status"

    const-class v1, Lorg/apache/http/client/cache/CacheResponseStatus;

    invoke-virtual {p0, v0, v1}, Lorg/apache/http/client/cache/HttpCacheContext;->getAttribute(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/cache/CacheResponseStatus;

    return-object v0
.end method
