.class public Lorg/apache/http/client/cache/HttpCacheEntry;
.super Ljava/lang/Object;
.source "HttpCacheEntry.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x576fdc1d5b5b2ca5L


# instance fields
.field private final date:Ljava/util/Date;

.field private final requestDate:Ljava/util/Date;

.field private final resource:Lorg/apache/http/client/cache/Resource;

.field private final responseDate:Ljava/util/Date;

.field private final responseHeaders:Lorg/apache/http/message/HeaderGroup;

.field private final statusLine:Lorg/apache/http/StatusLine;

.field private final variantMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/StatusLine;[Lorg/apache/http/Header;Lorg/apache/http/client/cache/Resource;)V
    .locals 7
    .param p1, "requestDate"    # Ljava/util/Date;
    .param p2, "responseDate"    # Ljava/util/Date;
    .param p3, "statusLine"    # Lorg/apache/http/StatusLine;
    .param p4, "responseHeaders"    # [Lorg/apache/http/Header;
    .param p5, "resource"    # Lorg/apache/http/client/cache/Resource;

    .prologue
    .line 125
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/apache/http/client/cache/HttpCacheEntry;-><init>(Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/StatusLine;[Lorg/apache/http/Header;Lorg/apache/http/client/cache/Resource;Ljava/util/Map;)V

    .line 127
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;Ljava/util/Date;Lorg/apache/http/StatusLine;[Lorg/apache/http/Header;Lorg/apache/http/client/cache/Resource;Ljava/util/Map;)V
    .locals 1
    .param p1, "requestDate"    # Ljava/util/Date;
    .param p2, "responseDate"    # Ljava/util/Date;
    .param p3, "statusLine"    # Lorg/apache/http/StatusLine;
    .param p4, "responseHeaders"    # [Lorg/apache/http/Header;
    .param p5, "resource"    # Lorg/apache/http/client/cache/Resource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            "Ljava/util/Date;",
            "Lorg/apache/http/StatusLine;",
            "[",
            "Lorg/apache/http/Header;",
            "Lorg/apache/http/client/cache/Resource;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p6, "variantMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    const-string/jumbo v0, "Request date"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 93
    const-string/jumbo v0, "Response date"

    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 94
    const-string/jumbo v0, "Status line"

    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 95
    const-string/jumbo v0, "Response headers"

    invoke-static {p4, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 96
    iput-object p1, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->requestDate:Ljava/util/Date;

    .line 97
    iput-object p2, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->responseDate:Ljava/util/Date;

    .line 98
    iput-object p3, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->statusLine:Lorg/apache/http/StatusLine;

    .line 99
    new-instance v0, Lorg/apache/http/message/HeaderGroup;

    invoke-direct {v0}, Lorg/apache/http/message/HeaderGroup;-><init>()V

    iput-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->responseHeaders:Lorg/apache/http/message/HeaderGroup;

    .line 100
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->responseHeaders:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p4}, Lorg/apache/http/message/HeaderGroup;->setHeaders([Lorg/apache/http/Header;)V

    .line 101
    iput-object p5, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->resource:Lorg/apache/http/client/cache/Resource;

    .line 102
    if-eqz p6, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p6}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    :goto_0
    iput-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->variantMap:Ljava/util/Map;

    .line 105
    invoke-direct {p0}, Lorg/apache/http/client/cache/HttpCacheEntry;->parseDate()Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->date:Ljava/util/Date;

    .line 106
    return-void

    .line 102
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private parseDate()Ljava/util/Date;
    .locals 2

    .prologue
    .line 134
    const-string/jumbo v1, "Date"

    invoke-virtual {p0, v1}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    .line 135
    .local v0, "dateHdr":Lorg/apache/http/Header;
    if-nez v0, :cond_0

    .line 136
    const/4 v1, 0x0

    .line 138
    :goto_0
    return-object v1

    :cond_0
    invoke-interface {v0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/http/client/utils/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    goto :goto_0
.end method


# virtual methods
.method public getAllHeaders()[Lorg/apache/http/Header;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->responseHeaders:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0}, Lorg/apache/http/message/HeaderGroup;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public getDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 220
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->date:Ljava/util/Date;

    return-object v0
.end method

.method public getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->responseHeaders:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/http/message/HeaderGroup;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 210
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->responseHeaders:Lorg/apache/http/message/HeaderGroup;

    invoke-virtual {v0, p1}, Lorg/apache/http/message/HeaderGroup;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public getProtocolVersion()Lorg/apache/http/ProtocolVersion;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->statusLine:Lorg/apache/http/StatusLine;

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    return-object v0
.end method

.method public getReasonPhrase()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->statusLine:Lorg/apache/http/StatusLine;

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRequestDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->requestDate:Ljava/util/Date;

    return-object v0
.end method

.method public getResource()Lorg/apache/http/client/cache/Resource;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->resource:Lorg/apache/http/client/cache/Resource;

    return-object v0
.end method

.method public getResponseDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->responseDate:Ljava/util/Date;

    return-object v0
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->statusLine:Lorg/apache/http/StatusLine;

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    return v0
.end method

.method public getStatusLine()Lorg/apache/http/StatusLine;
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->statusLine:Lorg/apache/http/StatusLine;

    return-object v0
.end method

.method public getVariantMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 250
    iget-object v0, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->variantMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public hasVariants()Z
    .locals 1

    .prologue
    .line 237
    const-string/jumbo v0, "Vary"

    invoke-virtual {p0, v0}, Lorg/apache/http/client/cache/HttpCacheEntry;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 259
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "[request date="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->requestDate:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "; response date="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->responseDate:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "; statusLine="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/http/client/cache/HttpCacheEntry;->statusLine:Lorg/apache/http/StatusLine;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
