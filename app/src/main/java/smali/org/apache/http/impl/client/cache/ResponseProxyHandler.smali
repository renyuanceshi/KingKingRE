.class Lorg/apache/http/impl/client/cache/ResponseProxyHandler;
.super Ljava/lang/Object;
.source "ResponseProxyHandler.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final CLOSE_METHOD:Ljava/lang/reflect/Method;


# instance fields
.field private final original:Lorg/apache/http/HttpResponse;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 52
    :try_start_0
    const-class v1, Ljava/io/Closeable;

    const-string/jumbo v2, "close"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;->CLOSE_METHOD:Ljava/lang/reflect/Method;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/Error;

    invoke-direct {v1, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method constructor <init>(Lorg/apache/http/HttpResponse;)V
    .locals 0
    .param p1, "original"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;->original:Lorg/apache/http/HttpResponse;

    .line 63
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;->original:Lorg/apache/http/HttpResponse;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/http/impl/client/cache/IOUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 67
    return-void
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 71
    sget-object v2, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;->CLOSE_METHOD:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v2}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 72
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;->close()V

    .line 73
    const/4 v2, 0x0

    .line 76
    :goto_0
    return-object v2

    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;->original:Lorg/apache/http/HttpResponse;

    invoke-virtual {p2, v2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 77
    :catch_0
    move-exception v1

    .line 78
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 79
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_1

    .line 80
    throw v0

    .line 82
    :cond_1
    throw v1
.end method
