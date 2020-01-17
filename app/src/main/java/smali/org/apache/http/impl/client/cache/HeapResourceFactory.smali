.class public Lorg/apache/http/impl/client/cache/HeapResourceFactory;
.super Ljava/lang/Object;
.source "HeapResourceFactory.java"

# interfaces
.implements Lorg/apache/http/client/cache/ResourceFactory;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public copy(Ljava/lang/String;Lorg/apache/http/client/cache/Resource;)Lorg/apache/http/client/cache/Resource;
    .locals 3
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "resource"    # Lorg/apache/http/client/cache/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    instance-of v2, p2, Lorg/apache/http/impl/client/cache/HeapResource;

    if-eqz v2, :cond_0

    .line 70
    check-cast p2, Lorg/apache/http/impl/client/cache/HeapResource;

    .end local p2    # "resource":Lorg/apache/http/client/cache/Resource;
    invoke-virtual {p2}, Lorg/apache/http/impl/client/cache/HeapResource;->getByteArray()[B

    move-result-object v0

    .line 76
    .local v0, "body":[B
    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/client/cache/HeapResourceFactory;->createResource([B)Lorg/apache/http/client/cache/Resource;

    move-result-object v2

    return-object v2

    .line 72
    .end local v0    # "body":[B
    .restart local p2    # "resource":Lorg/apache/http/client/cache/Resource;
    :cond_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 73
    .local v1, "outstream":Ljava/io/ByteArrayOutputStream;
    invoke-interface {p2}, Lorg/apache/http/client/cache/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2, v1}, Lorg/apache/http/impl/client/cache/IOUtils;->copyAndClose(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 74
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .restart local v0    # "body":[B
    goto :goto_0
.end method

.method createResource([B)Lorg/apache/http/client/cache/Resource;
    .locals 1
    .param p1, "buf"    # [B

    .prologue
    .line 80
    new-instance v0, Lorg/apache/http/impl/client/cache/HeapResource;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/cache/HeapResource;-><init>([B)V

    return-object v0
.end method

.method public generate(Ljava/lang/String;Ljava/io/InputStream;Lorg/apache/http/client/cache/InputLimit;)Lorg/apache/http/client/cache/Resource;
    .locals 8
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "instream"    # Ljava/io/InputStream;
    .param p3, "limit"    # Lorg/apache/http/client/cache/InputLimit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 51
    .local v2, "outstream":Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x800

    new-array v0, v3, [B

    .line 52
    .local v0, "buf":[B
    const-wide/16 v4, 0x0

    .line 54
    .local v4, "total":J
    :cond_0
    invoke-virtual {p2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "l":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 55
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 56
    int-to-long v6, v1

    add-long/2addr v4, v6

    .line 57
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Lorg/apache/http/client/cache/InputLimit;->getValue()J

    move-result-wide v6

    cmp-long v3, v4, v6

    if-lez v3, :cond_0

    .line 58
    invoke-virtual {p3}, Lorg/apache/http/client/cache/InputLimit;->reached()V

    .line 62
    :cond_1
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/http/impl/client/cache/HeapResourceFactory;->createResource([B)Lorg/apache/http/client/cache/Resource;

    move-result-object v3

    return-object v3
.end method
