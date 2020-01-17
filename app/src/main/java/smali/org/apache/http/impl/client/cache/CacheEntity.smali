.class Lorg/apache/http/impl/client/cache/CacheEntity;
.super Ljava/lang/Object;
.source "CacheEntity.java"

# interfaces
.implements Lorg/apache/http/HttpEntity;
.implements Ljava/io/Serializable;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x301d8cf7d0140f29L


# instance fields
.field private final cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;


# direct methods
.method public constructor <init>(Lorg/apache/http/client/cache/HttpCacheEntry;)V
    .locals 0
    .param p1, "cacheEntry"    # Lorg/apache/http/client/cache/HttpCacheEntry;

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CacheEntity;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    .line 51
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public consumeContent()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    return-void
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CacheEntity;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-virtual {v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/client/cache/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getContentEncoding()Lorg/apache/http/Header;
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CacheEntity;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    const-string/jumbo v1, "Content-Encoding"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CacheEntity;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-virtual {v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/client/cache/Resource;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public getContentType()Lorg/apache/http/Header;
    .locals 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CacheEntity;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    const-string/jumbo v1, "Content-Type"

    invoke-virtual {v0, v1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public isChunked()Z
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method public isRepeatable()Z
    .locals 1

    .prologue
    .line 66
    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const-string/jumbo v1, "Output stream"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 79
    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CacheEntity;->cacheEntry:Lorg/apache/http/client/cache/HttpCacheEntry;

    invoke-virtual {v1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getResource()Lorg/apache/http/client/cache/Resource;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/client/cache/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 81
    .local v0, "instream":Ljava/io/InputStream;
    :try_start_0
    invoke-static {v0, p1}, Lorg/apache/http/impl/client/cache/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 85
    return-void

    .line 83
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v1
.end method
