.class public abstract Lorg/apache/http/client/methods/HttpRequestBase;
.super Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;
.source "HttpRequestBase.java"

# interfaces
.implements Lorg/apache/http/client/methods/HttpUriRequest;
.implements Lorg/apache/http/client/methods/Configurable;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private config:Lorg/apache/http/client/config/RequestConfig;

.field private uri:Ljava/net/URI;

.field private version:Lorg/apache/http/ProtocolVersion;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;-><init>()V

    return-void
.end method


# virtual methods
.method public getConfig()Lorg/apache/http/client/config/RequestConfig;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestBase;->config:Lorg/apache/http/client/config/RequestConfig;

    return-object v0
.end method

.method public abstract getMethod()Ljava/lang/String;
.end method

.method public getProtocolVersion()Lorg/apache/http/ProtocolVersion;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestBase;->version:Lorg/apache/http/ProtocolVersion;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestBase;->version:Lorg/apache/http/ProtocolVersion;

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/http/params/HttpProtocolParams;->getVersion(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/ProtocolVersion;

    move-result-object v0

    goto :goto_0
.end method

.method public getRequestLine()Lorg/apache/http/RequestLine;
    .locals 5

    .prologue
    .line 77
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "method":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v3

    .line 79
    .local v3, "ver":Lorg/apache/http/ProtocolVersion;
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v1

    .line 80
    .local v1, "uri":Ljava/net/URI;
    const/4 v2, 0x0

    .line 81
    .local v2, "uritext":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 82
    invoke-virtual {v1}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v2

    .line 84
    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    .line 85
    :cond_1
    const-string/jumbo v2, "/"

    .line 87
    :cond_2
    new-instance v4, Lorg/apache/http/message/BasicRequestLine;

    invoke-direct {v4, v0, v2, v3}, Lorg/apache/http/message/BasicRequestLine;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    return-object v4
.end method

.method public getURI()Ljava/net/URI;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/http/client/methods/HttpRequestBase;->uri:Ljava/net/URI;

    return-object v0
.end method

.method public releaseConnection()V
    .locals 0

    .prologue
    .line 116
    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->reset()V

    .line 117
    return-void
.end method

.method public setConfig(Lorg/apache/http/client/config/RequestConfig;)V
    .locals 0
    .param p1, "config"    # Lorg/apache/http/client/config/RequestConfig;

    .prologue
    .line 96
    iput-object p1, p0, Lorg/apache/http/client/methods/HttpRequestBase;->config:Lorg/apache/http/client/config/RequestConfig;

    .line 97
    return-void
.end method

.method public setProtocolVersion(Lorg/apache/http/ProtocolVersion;)V
    .locals 0
    .param p1, "version"    # Lorg/apache/http/ProtocolVersion;

    .prologue
    .line 59
    iput-object p1, p0, Lorg/apache/http/client/methods/HttpRequestBase;->version:Lorg/apache/http/ProtocolVersion;

    .line 60
    return-void
.end method

.method public setURI(Ljava/net/URI;)V
    .locals 0
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 100
    iput-object p1, p0, Lorg/apache/http/client/methods/HttpRequestBase;->uri:Ljava/net/URI;

    .line 101
    return-void
.end method

.method public started()V
    .locals 0

    .prologue
    .line 107
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/methods/HttpRequestBase;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
