.class public Lorg/apache/http/impl/client/cache/memcached/MemcachedKeyHashingException;
.super Ljava/lang/RuntimeException;
.source "MemcachedKeyHashingException.java"


# static fields
.field private static final serialVersionUID:J = -0x68d2ff1ae2912e7aL


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 40
    return-void
.end method
