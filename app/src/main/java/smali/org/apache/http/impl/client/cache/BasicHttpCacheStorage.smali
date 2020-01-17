.class public Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;
.super Ljava/lang/Object;
.source "BasicHttpCacheStorage.java"

# interfaces
.implements Lorg/apache/http/client/cache/HttpCacheStorage;


# annotations
.annotation build Lorg/apache/http/annotation/ThreadSafe;
.end annotation


# instance fields
.field private final entries:Lorg/apache/http/impl/client/cache/CacheMap;


# direct methods
.method public constructor <init>(Lorg/apache/http/impl/client/cache/CacheConfig;)V
    .locals 2
    .param p1, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Lorg/apache/http/impl/client/cache/CacheMap;

    invoke-virtual {p1}, Lorg/apache/http/impl/client/cache/CacheConfig;->getMaxCacheEntries()I

    move-result v1

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/cache/CacheMap;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;->entries:Lorg/apache/http/impl/client/cache/CacheMap;

    .line 54
    return-void
.end method


# virtual methods
.method public declared-synchronized getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;->entries:Lorg/apache/http/impl/client/cache/CacheMap;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/client/cache/CacheMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized putEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;->entries:Lorg/apache/http/impl/client/cache/CacheMap;

    invoke-virtual {v0, p1, p2}, Lorg/apache/http/impl/client/cache/CacheMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    monitor-exit p0

    return-void

    .line 65
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeEntry(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;->entries:Lorg/apache/http/impl/client/cache/CacheMap;

    invoke-virtual {v0, p1}, Lorg/apache/http/impl/client/cache/CacheMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    monitor-exit p0

    return-void

    .line 86
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized updateEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheUpdateCallback;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/apache/http/client/cache/HttpCacheUpdateCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;->entries:Lorg/apache/http/impl/client/cache/CacheMap;

    invoke-virtual {v1, p1}, Lorg/apache/http/impl/client/cache/CacheMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/cache/HttpCacheEntry;

    .line 93
    .local v0, "existingEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/BasicHttpCacheStorage;->entries:Lorg/apache/http/impl/client/cache/CacheMap;

    invoke-interface {p2, v0}, Lorg/apache/http/client/cache/HttpCacheUpdateCallback;->update(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/apache/http/impl/client/cache/CacheMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    monitor-exit p0

    return-void

    .line 92
    .end local v0    # "existingEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
