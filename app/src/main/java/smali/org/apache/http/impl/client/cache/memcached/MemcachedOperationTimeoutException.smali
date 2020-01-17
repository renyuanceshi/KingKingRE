.class Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;
.super Ljava/io/IOException;
.source "MemcachedOperationTimeoutException.java"


# static fields
.field private static final serialVersionUID:J = 0x1651f3f82551d672L


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-virtual {p0, p1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 41
    return-void
.end method
