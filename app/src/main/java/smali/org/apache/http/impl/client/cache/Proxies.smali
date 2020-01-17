.class Lorg/apache/http/impl/client/cache/Proxies;
.super Ljava/lang/Object;
.source "Proxies.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static enhanceResponse(Lorg/apache/http/HttpResponse;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 4
    .param p0, "original"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 45
    const-string/jumbo v0, "HTTP response"

    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 46
    instance-of v0, p0, Lorg/apache/http/client/methods/CloseableHttpResponse;

    if-eqz v0, :cond_0

    .line 47
    check-cast p0, Lorg/apache/http/client/methods/CloseableHttpResponse;

    .line 49
    .end local p0    # "original":Lorg/apache/http/HttpResponse;
    :goto_0
    return-object p0

    .restart local p0    # "original":Lorg/apache/http/HttpResponse;
    :cond_0
    const-class v0, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Lorg/apache/http/client/methods/CloseableHttpResponse;

    aput-object v3, v1, v2

    new-instance v2, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;

    invoke-direct {v2, p0}, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;-><init>(Lorg/apache/http/HttpResponse;)V

    invoke-static {v0, v1, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-object p0, v0

    goto :goto_0
.end method
