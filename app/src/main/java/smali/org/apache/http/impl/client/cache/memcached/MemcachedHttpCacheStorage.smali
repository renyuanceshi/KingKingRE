.class public Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;
.super Ljava/lang/Object;
.source "MemcachedHttpCacheStorage.java"

# interfaces
.implements Lorg/apache/http/client/cache/HttpCacheStorage;


# static fields
.field private static final log:Lorg/apache/commons/logging/Log;


# instance fields
.field private final client:Lnet/spy/memcached/MemcachedClientIF;

.field private final keyHashingScheme:Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;

.field private final maxUpdateRetries:I

.field private final memcachedCacheEntryFactory:Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 88
    const-class v0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>(Ljava/net/InetSocketAddress;)V
    .locals 3
    .param p1, "address"    # Ljava/net/InetSocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    new-instance v0, Lnet/spy/memcached/MemcachedClient;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/net/InetSocketAddress;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-direct {v0, v1}, Lnet/spy/memcached/MemcachedClient;-><init>([Ljava/net/InetSocketAddress;)V

    invoke-direct {p0, v0}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;-><init>(Lnet/spy/memcached/MemcachedClientIF;)V

    .line 105
    return-void
.end method

.method public constructor <init>(Lnet/spy/memcached/MemcachedClientIF;)V
    .locals 3
    .param p1, "cache"    # Lnet/spy/memcached/MemcachedClientIF;

    .prologue
    .line 113
    sget-object v0, Lorg/apache/http/impl/client/cache/CacheConfig;->DEFAULT:Lorg/apache/http/impl/client/cache/CacheConfig;

    new-instance v1, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactoryImpl;

    invoke-direct {v1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactoryImpl;-><init>()V

    new-instance v2, Lorg/apache/http/impl/client/cache/memcached/SHA256KeyHashingScheme;

    invoke-direct {v2}, Lorg/apache/http/impl/client/cache/memcached/SHA256KeyHashingScheme;-><init>()V

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;-><init>(Lnet/spy/memcached/MemcachedClientIF;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Lnet/spy/memcached/MemcachedClientIF;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/client/cache/HttpCacheEntrySerializer;)V
    .locals 2
    .param p1, "client"    # Lnet/spy/memcached/MemcachedClientIF;
    .param p2, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;
    .param p3, "serializer"    # Lorg/apache/http/client/cache/HttpCacheEntrySerializer;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 137
    new-instance v0, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactoryImpl;

    invoke-direct {v0}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactoryImpl;-><init>()V

    new-instance v1, Lorg/apache/http/impl/client/cache/memcached/SHA256KeyHashingScheme;

    invoke-direct {v1}, Lorg/apache/http/impl/client/cache/memcached/SHA256KeyHashingScheme;-><init>()V

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;-><init>(Lnet/spy/memcached/MemcachedClientIF;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;)V

    .line 139
    return-void
.end method

.method public constructor <init>(Lnet/spy/memcached/MemcachedClientIF;Lorg/apache/http/impl/client/cache/CacheConfig;Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;)V
    .locals 1
    .param p1, "client"    # Lnet/spy/memcached/MemcachedClientIF;
    .param p2, "config"    # Lorg/apache/http/impl/client/cache/CacheConfig;
    .param p3, "memcachedCacheEntryFactory"    # Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;
    .param p4, "keyHashingScheme"    # Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;

    .prologue
    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->client:Lnet/spy/memcached/MemcachedClientIF;

    .line 156
    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/CacheConfig;->getMaxUpdateRetries()I

    move-result v0

    iput v0, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->maxUpdateRetries:I

    .line 157
    iput-object p3, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->memcachedCacheEntryFactory:Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;

    .line 158
    iput-object p4, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->keyHashingScheme:Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;

    .line 159
    return-void
.end method

.method private convertToByteArray(Ljava/lang/Object;)[B
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 194
    if-nez p1, :cond_0

    move-object p1, v0

    .line 201
    .end local p1    # "o":Ljava/lang/Object;
    :goto_0
    return-object p1

    .line 197
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v1, p1, [B

    if-nez v1, :cond_1

    .line 198
    sget-object v1, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "got a non-bytearray back from memcached: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    move-object p1, v0

    .line 199
    goto :goto_0

    .line 201
    :cond_1
    check-cast p1, [B

    .end local p1    # "o":Ljava/lang/Object;
    check-cast p1, [B

    goto :goto_0
.end method

.method private getCacheKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 176
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->keyHashingScheme:Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;

    invoke-interface {v1, p1}, Lorg/apache/http/impl/client/cache/memcached/KeyHashingScheme;->hash(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/apache/http/impl/client/cache/memcached/MemcachedKeyHashingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 178
    :goto_0
    return-object v1

    .line 177
    :catch_0
    move-exception v0

    .line 178
    .local v0, "mkhe":Lorg/apache/http/impl/client/cache/memcached/MemcachedKeyHashingException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private reconstituteEntry(Ljava/lang/Object;)Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 205
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->convertToByteArray(Ljava/lang/Object;)[B

    move-result-object v0

    .line 206
    .local v0, "bytes":[B
    if-nez v0, :cond_0

    move-object v1, v3

    .line 215
    :goto_0
    return-object v1

    .line 209
    :cond_0
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->memcachedCacheEntryFactory:Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;

    invoke-interface {v4}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;->getUnsetCacheEntry()Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;

    move-result-object v1

    .line 211
    .local v1, "mce":Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    :try_start_0
    invoke-interface {v1, v0}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;->set([B)V
    :try_end_0
    .catch Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 212
    :catch_0
    move-exception v2

    .local v2, "mse":Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;
    move-object v1, v3

    .line 213
    goto :goto_0
.end method

.method private serializeEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)[B
    .locals 4
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "hce"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->memcachedCacheEntryFactory:Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;

    invoke-interface {v3, p1, p2}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntryFactory;->getMemcachedCacheEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;

    move-result-object v1

    .line 185
    .local v1, "mce":Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    :try_start_0
    invoke-interface {v1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;->toByteArray()[B
    :try_end_0
    .catch Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    return-object v3

    .line 186
    :catch_0
    move-exception v2

    .line 187
    .local v2, "mse":Lorg/apache/http/impl/client/cache/memcached/MemcachedSerializationException;
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    .line 188
    .local v0, "ioe":Ljava/io/IOException;
    invoke-virtual {v0, v2}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 189
    throw v0
.end method


# virtual methods
.method public getEntry(Ljava/lang/String;)Lorg/apache/http/client/cache/HttpCacheEntry;
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 219
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->getCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 220
    .local v1, "key":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 228
    :cond_0
    :goto_0
    return-object v3

    .line 224
    :cond_1
    :try_start_0
    iget-object v4, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->client:Lnet/spy/memcached/MemcachedClientIF;

    invoke-interface {v4, v1}, Lnet/spy/memcached/MemcachedClientIF;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->reconstituteEntry(Ljava/lang/Object;)Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;

    move-result-object v2

    .line 225
    .local v2, "mce":Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    if-eqz v2, :cond_0

    invoke-interface {v2}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;->getStorageKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 228
    invoke-interface {v2}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;->getHttpCacheEntry()Lorg/apache/http/client/cache/HttpCacheEntry;
    :try_end_0
    .catch Lnet/spy/memcached/OperationTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 229
    .end local v2    # "mce":Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    :catch_0
    move-exception v0

    .line 230
    .local v0, "ex":Lnet/spy/memcached/OperationTimeoutException;
    new-instance v3, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;

    invoke-direct {v3, v0}, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public putEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 5
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "entry"    # Lorg/apache/http/client/cache/HttpCacheEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 162
    invoke-direct {p0, p1, p2}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->serializeEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)[B

    move-result-object v0

    .line 163
    .local v0, "bytes":[B
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->getCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 164
    .local v2, "key":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 172
    :goto_0
    return-void

    .line 168
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->client:Lnet/spy/memcached/MemcachedClientIF;

    const/4 v4, 0x0

    invoke-interface {v3, v2, v4, v0}, Lnet/spy/memcached/MemcachedClientIF;->set(Ljava/lang/String;ILjava/lang/Object;)Ljava/util/concurrent/Future;
    :try_end_0
    .catch Lnet/spy/memcached/OperationTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 169
    :catch_0
    move-exception v1

    .line 170
    .local v1, "ex":Lnet/spy/memcached/OperationTimeoutException;
    new-instance v3, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;

    invoke-direct {v3, v1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public removeEntry(Ljava/lang/String;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->getCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 236
    .local v1, "key":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 244
    :goto_0
    return-void

    .line 240
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->client:Lnet/spy/memcached/MemcachedClientIF;

    invoke-interface {v2, v1}, Lnet/spy/memcached/MemcachedClientIF;->delete(Ljava/lang/String;)Ljava/util/concurrent/Future;
    :try_end_0
    .catch Lnet/spy/memcached/OperationTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 241
    :catch_0
    move-exception v0

    .line 242
    .local v0, "ex":Lnet/spy/memcached/OperationTimeoutException;
    new-instance v2, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;

    invoke-direct {v2, v0}, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public updateEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheUpdateCallback;)V
    .locals 12
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/apache/http/client/cache/HttpCacheUpdateCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/cache/HttpCacheUpdateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    const/4 v5, 0x0

    .line 249
    .local v5, "numRetries":I
    invoke-direct {p0, p1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->getCacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 250
    .local v3, "key":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 251
    new-instance v9, Lorg/apache/http/client/cache/HttpCacheUpdateException;

    const-string/jumbo v10, "couldn\'t generate cache key"

    invoke-direct {v9, v10}, Lorg/apache/http/client/cache/HttpCacheUpdateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 255
    :cond_0
    :try_start_0
    iget-object v9, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->client:Lnet/spy/memcached/MemcachedClientIF;

    invoke-interface {v9, v3}, Lnet/spy/memcached/MemcachedClientIF;->gets(Ljava/lang/String;)Lnet/spy/memcached/CASValue;

    move-result-object v8

    .line 256
    .local v8, "v":Lnet/spy/memcached/CASValue;, "Lnet/spy/memcached/CASValue<Ljava/lang/Object;>;"
    if-nez v8, :cond_3

    const/4 v4, 0x0

    .line 258
    .local v4, "mce":Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    :goto_0
    if-eqz v4, :cond_1

    invoke-interface {v4}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;->getStorageKey()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 259
    const/4 v4, 0x0

    .line 261
    :cond_1
    if-nez v4, :cond_4

    const/4 v2, 0x0

    .line 263
    .local v2, "existingEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :goto_1
    invoke-interface {p2, v2}, Lorg/apache/http/client/cache/HttpCacheUpdateCallback;->update(Lorg/apache/http/client/cache/HttpCacheEntry;)Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v7

    .line 265
    .local v7, "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    if-nez v2, :cond_5

    .line 266
    invoke-virtual {p0, p1, v7}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->putEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)V

    .line 276
    :cond_2
    return-void

    .line 256
    .end local v2    # "existingEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v4    # "mce":Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    .end local v7    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_3
    invoke-virtual {v8}, Lnet/spy/memcached/CASValue;->getValue()Ljava/lang/Object;

    move-result-object v9

    invoke-direct {p0, v9}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->reconstituteEntry(Ljava/lang/Object;)Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;

    move-result-object v4

    goto :goto_0

    .line 261
    .restart local v4    # "mce":Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    :cond_4
    invoke-interface {v4}, Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;->getHttpCacheEntry()Lorg/apache/http/client/cache/HttpCacheEntry;

    move-result-object v2

    goto :goto_1

    .line 270
    .restart local v2    # "existingEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .restart local v7    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    :cond_5
    invoke-direct {p0, p1, v7}, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->serializeEntry(Ljava/lang/String;Lorg/apache/http/client/cache/HttpCacheEntry;)[B

    move-result-object v6

    .line 271
    .local v6, "updatedBytes":[B
    iget-object v9, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->client:Lnet/spy/memcached/MemcachedClientIF;

    invoke-virtual {v8}, Lnet/spy/memcached/CASValue;->getCas()J

    move-result-wide v10

    invoke-interface {v9, v3, v10, v11, v6}, Lnet/spy/memcached/MemcachedClientIF;->cas(Ljava/lang/String;JLjava/lang/Object;)Lnet/spy/memcached/CASResponse;

    move-result-object v0

    .line 273
    .local v0, "casResult":Lnet/spy/memcached/CASResponse;
    sget-object v9, Lnet/spy/memcached/CASResponse;->OK:Lnet/spy/memcached/CASResponse;
    :try_end_0
    .catch Lnet/spy/memcached/OperationTimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    if-eq v0, v9, :cond_2

    .line 274
    add-int/lit8 v5, v5, 0x1

    .line 282
    iget v9, p0, Lorg/apache/http/impl/client/cache/memcached/MemcachedHttpCacheStorage;->maxUpdateRetries:I

    if-le v5, v9, :cond_0

    .line 284
    new-instance v9, Lorg/apache/http/client/cache/HttpCacheUpdateException;

    const-string/jumbo v10, "Failed to update"

    invoke-direct {v9, v10}, Lorg/apache/http/client/cache/HttpCacheUpdateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 279
    .end local v0    # "casResult":Lnet/spy/memcached/CASResponse;
    .end local v2    # "existingEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v4    # "mce":Lorg/apache/http/impl/client/cache/memcached/MemcachedCacheEntry;
    .end local v6    # "updatedBytes":[B
    .end local v7    # "updatedEntry":Lorg/apache/http/client/cache/HttpCacheEntry;
    .end local v8    # "v":Lnet/spy/memcached/CASValue;, "Lnet/spy/memcached/CASValue<Ljava/lang/Object;>;"
    :catch_0
    move-exception v1

    .line 280
    .local v1, "ex":Lnet/spy/memcached/OperationTimeoutException;
    new-instance v9, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;

    invoke-direct {v9, v1}, Lorg/apache/http/impl/client/cache/memcached/MemcachedOperationTimeoutException;-><init>(Ljava/lang/Throwable;)V

    throw v9
.end method
