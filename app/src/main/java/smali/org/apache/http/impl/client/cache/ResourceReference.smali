.class Lorg/apache/http/impl/client/cache/ResourceReference;
.super Ljava/lang/ref/PhantomReference;
.source "ResourceReference.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/PhantomReference",
        "<",
        "Lorg/apache/http/client/cache/HttpCacheEntry;",
        ">;"
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private final resource:Lorg/apache/http/client/cache/Resource;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/lang/ref/ReferenceQueue;)V
    .locals 2
    .param p1, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/cache/HttpCacheEntry;",
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Lorg/apache/http/client/cache/HttpCacheEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p2, "q":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<Lorg/apache/http/client/cache/HttpCacheEntry;>;"
    invoke-direct {p0, p1, p2}, Ljava/lang/ref/PhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 44
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v0

    const-string/jumbo v1, "Resource"

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    invoke-virtual {p1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/ResourceReference;->resource:Lorg/apache/http/client/cache/Resource;

    .line 46
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ResourceReference;->resource:Lorg/apache/http/client/cache/Resource;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getResource()Lorg/apache/http/client/cache/Resource;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ResourceReference;->resource:Lorg/apache/http/client/cache/Resource;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ResourceReference;->resource:Lorg/apache/http/client/cache/Resource;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method
