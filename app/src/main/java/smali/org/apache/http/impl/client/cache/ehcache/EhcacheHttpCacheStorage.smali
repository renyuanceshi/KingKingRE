.class public Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;
.super Ljava/lang/Object;
.source "EhcacheHttpCacheStorage.java"

# interfaces
.implements Lorg/apache/http/client/cache/HttpCacheStorage;


# instance fields
.field private final cache:Lnet/sf/ehcache/Ehcache;

.field private final maxUpdateRetries:I

.field private final serializer:Lorg/apache/http/client/cache/HttpCacheEntrySerializer;


# direct methods
.method public constructor <init>(Lnet/sf/ehcache/Ehcache;)V
    .locals 2
    .param p1, "cache"    # Lnet/sf/ehcache/Ehcache;

    .prologue
    .line 73
    sget-object v0, Lorg/apache/http/impl/client/cache/CacheConfig;->DEFAULT:Lorg/apache/http/impl/client/cache/CacheConfig;

    new-instance v1, Lorg/apache/http/impl/client/cache/DefaultHttpCacheEntrySerializer;

    invoke-direct {v1}, Lorg/apache/http/impl/client/cache/DefaultHttpCacheEntrySerializer;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;-><init>(Lnet/sf/ehcache/Ehcache;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/client/cache/HttpCacheEntrySerializer;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Lnet/sf/ehcache/Ehcache;Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 1
    .param p1, "cache"    # Lnet/sf/ehcache/Ehcache;
    .param p2, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 85
    new-instance v0, Lorg/apache/http/impl/client/cache/DefaultHttpCacheEntrySerializer;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/DefaultHttpCacheEntrySerializer;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;-><init>(Lnet/sf/ehcache/Ehcache;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/client/cache/HttpCacheEntrySerializer;)V

    .line 86
    return-void
.end method

.method public constructor <init>(Lnet/sf/ehcache/Ehcache;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/client/cache/HttpCacheEntrySerializer;)V
    .locals 1
    .param p1, "cache"    # Lnet/sf/ehcache/Ehcache;
    .param p2, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;
    .param p3, "serializer"    # Lorg/apache/http/client/cache/HttpCacheEntrySerializer;

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->cache:Lnet/sf/ehcache/Ehcache;

    .line 100
    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->getMaxUpdateRetries()I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->maxUpdateRetries:I

    .line 101
    iput-object p3, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->serializer:Lorg/apache/http/client/cache/HttpCacheEntrySerializer;

    .line 102
    return-void
.end method


# virtual methods
.method public declared-synchronized getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->cache:Lnet/sf/ehcache/Ehcache;

    invoke-interface {v3, p1}, Lnet/sf/ehcache/Ehcache;->get(Ljava/io/Serializable;)Lnet/sf/ehcache/Element;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 112
    .local v2, "e":Lnet/sf/ehcache/Element;
    if-nez v2, :cond_0

    .line 113
    const/4 v3, 0x0

    .line 117
    :goto_0
    monitor-exit p0

    return-object v3

    .line 116
    :cond_0
    :try_start_1
    invoke-virtual {v2}, Lnet/sf/ehcache/Element;->getValue()Ljava/io/Serializable;

    move-result-object v3

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object v1, v0

    .line 117
    .local v1, "data":[B
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->serializer:Lorg/apache/http/client/cache/HttpCacheEntrySerializer;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-direct {v4, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-interface {v3, v4}, Lorg/apache/http/client/cache/HttpCacheEntrySerializer;->readFrom(Ljava/io/InputStream;)Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    goto :goto_0

    .line 111
    .end local v1    # "data":[B
    .end local v2    # "e":Lnet/sf/ehcache/Element;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized putEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 106
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->serializer:Lorg/apache/http/client/cache/HttpCacheEntrySerializer;

    invoke-interface {v1, p2, v0}, Lorg/apache/http/client/cache/HttpCacheEntrySerializer;->writeTo(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/io/OutputStream;)V

    .line 107
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->cache:Lnet/sf/ehcache/Ehcache;

    new-instance v2, Lnet/sf/ehcache/Element;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-direct {v2, p1, v3}, Lnet/sf/ehcache/Element;-><init>(Ljava/io/Serializable;Ljava/io/Serializable;)V

    invoke-interface {v1, v2}, Lnet/sf/ehcache/Ehcache;->put(Lnet/sf/ehcache/Element;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    monitor-exit p0

    return-void

    .line 105
    .end local v0    # "bos":Ljava/io/ByteArrayOutputStream;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized removeEntry(Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 121
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->cache:Lnet/sf/ehcache/Ehcache;

    invoke-interface {v0, p1}, Lnet/sf/ehcache/Ehcache;->remove(Ljava/io/Serializable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    monitor-exit p0

    return-void

    .line 121
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized updateEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheUpdateCallback;)V
    .locals 10
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/apache/http/client/cache/HttpCacheUpdateCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/cache/HttpCacheUpdateException;
        }
    .end annotation

    .prologue
    .line 126
    monitor-enter p0

    const/4 v5, 0x0

    .line 128
    .local v5, "numRetries":I
    :cond_0
    :try_start_0
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->cache:Lnet/sf/ehcache/Ehcache;

    invoke-interface {v8, p1}, Lnet/sf/ehcache/Ehcache;->get(Ljava/io/Serializable;)Lnet/sf/ehcache/Element;

    move-result-object v6

    .line 130
    .local v6, "oldElement":Lnet/sf/ehcache/Element;
    const/4 v3, 0x0

    .line 131
    .local v3, "existingEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-eqz v6, :cond_1

    .line 132
    invoke-virtual {v6}, Lnet/sf/ehcache/Element;->getValue()Ljava/io/Serializable;

    move-result-object v8

    check-cast v8, [B

    move-object v0, v8

    check-cast v0, [B

    move-object v2, v0

    .line 133
    .local v2, "data":[B
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->serializer:Lorg/apache/http/client/cache/HttpCacheEntrySerializer;

    new-instance v9, Ljava/io/ByteArrayInputStream;

    invoke-direct {v9, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-interface {v8, v9}, Lorg/apache/http/client/cache/HttpCacheEntrySerializer;->readFrom(Ljava/io/InputStream;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v3

    .line 136
    .end local v2    # "data":[B
    :cond_1
    invoke-interface {p2, v3}, Lorg/apache/http/client/cache/HttpCacheUpdateCallback;->update(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v7

    .line 138
    .local v7, "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-nez v3, :cond_3

    .line 139
    invoke-virtual {p0, p1, v7}, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->putEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    :cond_2
    monitor-exit p0

    return-void

    .line 145
    :cond_3
    :try_start_1
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 146
    .local v1, "bos":Ljava/io/ByteArrayOutputStream;
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->serializer:Lorg/apache/http/client/cache/HttpCacheEntrySerializer;

    invoke-interface {v8, v7, v1}, Lorg/apache/http/client/cache/HttpCacheEntrySerializer;->writeTo(Lorg/apache/http/client/cache/HttpCacheEntry;Ljava/io/OutputStream;)V

    .line 147
    new-instance v4, Lnet/sf/ehcache/Element;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v8

    invoke-direct {v4, p1, v8}, Lnet/sf/ehcache/Element;-><init>(Ljava/io/Serializable;Ljava/io/Serializable;)V

    .line 148
    .local v4, "newElement":Lnet/sf/ehcache/Element;
    iget-object v8, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->cache:Lnet/sf/ehcache/Ehcache;

    invoke-interface {v8, v6, v4}, Lnet/sf/ehcache/Ehcache;->replace(Lnet/sf/ehcache/Element;Lnet/sf/ehcache/Element;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 151
    add-int/lit8 v5, v5, 0x1

    .line 154
    iget v8, p0, Lorg/apache/http/impl/client/cache/ehcache/EhcacheHttpCacheStorage;->maxUpdateRetries:I

    if-le v5, v8, :cond_0

    .line 155
    new-instance v8, Lorg/apache/http/client/cache/HttpCacheUpdateException;

    const-string/jumbo v9, "Failed to update"

    invoke-direct {v8, v9}, Lorg/apache/http/client/cache/HttpCacheUpdateException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    .end local v1    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "existingEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v4    # "newElement":Lnet/sf/ehcache/Element;
    .end local v6    # "oldElement":Lnet/sf/ehcache/Element;
    .end local v7    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :catchall_0
    move-exception v8

    monitor-exit p0

    throw v8
.end method
