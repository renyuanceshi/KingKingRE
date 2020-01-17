.class Lorg/apache/http/impl/client/cache/CombinedEntity;
.super Lorg/apache/http/entity/AbstractHttpEntity;
.source "CombinedEntity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/client/cache/CombinedEntity$ResourceStream;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final combinedStream:Ljava/io/InputStream;

.field private final resource:Lorg/apache/http/client/cache/Resource;


# direct methods
.method constructor <init>(Lorg/apache/http/client/cache/Resource;Ljava/io/InputStream;)V
    .locals 3
    .param p1, "resource"    # Lorg/apache/http/client/cache/Resource;
    .param p2, "instream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/http/entity/AbstractHttpEntity;-><init>()V

    .line 48
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CombinedEntity;->resource:Lorg/apache/http/client/cache/Resource;

    .line 49
    new-instance v0, Ljava/io/SequenceInputStream;

    new-instance v1, Lorg/apache/http/impl/client/cache/CombinedEntity$ResourceStream;

    invoke-interface {p1}, Lorg/apache/http/client/cache/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lorg/apache/http/impl/client/cache/CombinedEntity$ResourceStream;-><init>(Lorg/apache/http/impl/client/cache/CombinedEntity;Ljava/io/InputStream;)V

    invoke-direct {v0, v1, p2}, Ljava/io/SequenceInputStream;-><init>(Ljava/io/InputStream;Ljava/io/InputStream;)V

    iput-object v0, p0, Lorg/apache/http/impl/client/cache/CombinedEntity;->combinedStream:Ljava/io/InputStream;

    .line 51
    return-void
.end method

.method static synthetic access$000(Lorg/apache/http/impl/client/cache/CombinedEntity;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/http/impl/client/cache/CombinedEntity;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/http/impl/client/cache/CombinedEntity;->dispose()V

    return-void
.end method

.method private dispose()V
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CombinedEntity;->resource:Lorg/apache/http/client/cache/Resource;

    invoke-interface {v0}, Lorg/apache/http/client/cache/Resource;->dispose()V

    .line 85
    return-void
.end method


# virtual methods
.method public getContent()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CombinedEntity;->combinedStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 54
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public isRepeatable()Z
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x1

    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "outstream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    const-string/jumbo v3, "Output stream"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    invoke-virtual {p0}, Lorg/apache/http/impl/client/cache/CombinedEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .line 74
    .local v0, "instream":Ljava/io/InputStream;
    const/16 v3, 0x800

    :try_start_0
    new-array v2, v3, [B

    .line 75
    .local v2, "tmp":[B
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "l":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_0

    .line 76
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 79
    .end local v1    # "l":I
    .end local v2    # "tmp":[B
    :catchall_0
    move-exception v3

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v3

    .restart local v1    # "l":I
    .restart local v2    # "tmp":[B
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 81
    return-void
.end method
