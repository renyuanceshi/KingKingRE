.class public Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;
.super Ljava/lang/Object;
.source "MemcachedCacheEntryImpl.java"

# interfaces
.implements Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;


# instance fields
.field private httpCacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

.field private key:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 0
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "httpCacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;->key:Ljava/lang/String;

    .line 49
    iput-object p2, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;->httpCacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    .line 50
    return-void
.end method


# virtual methods
.method public declared-synchronized getHttpCacheEntry()Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 1

    .prologue
    .line 83
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;->httpCacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getStorageKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;->key:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized set([B)V
    .locals 7
    .param p1, "bytes"    # [B

    .prologue
    .line 90
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    .local v0, "bis":Ljava/io/ByteArrayInputStream;
    :try_start_1
    new-instance v4, Ljava/io/ObjectInputStream;

    invoke-direct {v4, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 96
    .local v4, "ois":Ljava/io/ObjectInputStream;
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 97
    .local v5, "s":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/http/client/cache/HttpCacheEntry;

    .line 98
    .local v2, "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    invoke-virtual {v4}, Ljava/io/ObjectInputStream;->close()V

    .line 99
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 105
    :try_start_2
    iput-object v5, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;->key:Ljava/lang/String;

    .line 106
    iput-object v2, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;->httpCacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    monitor-exit p0

    return-void

    .line 100
    .end local v2    # "entry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v4    # "ois":Ljava/io/ObjectInputStream;
    .end local v5    # "s":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 101
    .local v3, "ioe":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;

    invoke-direct {v6, v3}, Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 90
    .end local v0    # "bis":Ljava/io/ByteArrayInputStream;
    .end local v3    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 102
    .restart local v0    # "bis":Ljava/io/ByteArrayInputStream;
    :catch_1
    move-exception v1

    .line 103
    .local v1, "cnfe":Ljava/lang/ClassNotFoundException;
    :try_start_4
    new-instance v6, Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;

    invoke-direct {v6, v1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public declared-synchronized toByteArray()[B
    .locals 4

    .prologue
    .line 59
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 63
    .local v2, "oos":Ljava/io/ObjectOutputStream;
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 64
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryImpl;->httpCacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-virtual {v2, v3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 65
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    monitor-exit p0

    return-object v3

    .line 66
    .end local v2    # "oos":Ljava/io/ObjectOutputStream;
    :catch_0
    move-exception v1

    .line 67
    .local v1, "ioe":Ljava/io/IOException;
    :try_start_3
    new-instance v3, Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;

    invoke-direct {v3, v1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    .end local v0    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method
