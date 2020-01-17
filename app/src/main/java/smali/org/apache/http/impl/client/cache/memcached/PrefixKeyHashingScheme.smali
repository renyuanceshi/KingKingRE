.class public Lorg/apache/http/impl/client/cache/memcached/PrefixKeyHashingScheme;
.super Ljava/lang/Object;
.source "PrefixKeyHashingScheme.java"

# interfaces
.implements Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;


# instance fields
.field private final backingScheme:Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;

.field private final prefix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "backingScheme"    # Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/memcached/PrefixKeyHashingScheme;->prefix:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/memcached/PrefixKeyHashingScheme;->backingScheme:Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;

    .line 53
    return-void
.end method


# virtual methods
.method public hash(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "storageKey"    # Ljava/lang/String;

    .prologue
    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/memcached/PrefixKeyHashingScheme;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/memcached/PrefixKeyHashingScheme;->backingScheme:Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;

    invoke-interface {v1, p1}, Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
