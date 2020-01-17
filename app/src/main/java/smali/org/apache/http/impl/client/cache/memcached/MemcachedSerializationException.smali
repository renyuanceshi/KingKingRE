.class public Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;
.super Ljava/lang/RuntimeException;
.source "MemcachedSerializationException.java"


# static fields
.field private static final serialVersionUID:J = 0x1e8dd7baeac07a4cL


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 39
    return-void
.end method
