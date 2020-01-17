.class public Lcom/pccw/mobile/sip/util/HttpUtils;
.super Ljava/lang/Object;
.source "HttpUtils.java"


# static fields
.field public static final DEFAULT_CHARSET:Ljava/lang/String; = "UTF-8"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static buildNameValuePairList([Ljava/lang/Object;)Ljava/util/List;
    .locals 5
    .param p0, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 95
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v1, "nvpairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 98
    aget-object v2, p0, v0

    instance-of v2, v2, Ljava/lang/String;

    if-nez v2, :cond_0

    .line 99
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "Odd numbered parameters must be of type String"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 102
    :cond_0
    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    aget-object v3, p0, v0

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v4, v0, 0x1

    aget-object v4, p0, v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 104
    :cond_1
    return-object v1
.end method

.method private static getHttpClient()Lorg/apache/http/client/HttpClient;
    .locals 10

    .prologue
    const/16 v9, 0x2710

    .line 110
    new-instance v4, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v4}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 114
    .local v4, "supportedSchemes":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v5, Lorg/apache/http/conn/scheme/Scheme;

    const-string/jumbo v6, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v7

    const/16 v8, 0x50

    invoke-direct {v5, v6, v7, v8}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v4, v5}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 118
    new-instance v3, Lcom/pccw/mobile/sip/util/EasySSLSocketFactory;

    invoke-direct {v3}, Lcom/pccw/mobile/sip/util/EasySSLSocketFactory;-><init>()V

    .line 119
    .local v3, "sf":Lcom/pccw/mobile/sip/util/EasySSLSocketFactory;
    new-instance v5, Lorg/apache/http/conn/scheme/Scheme;

    const-string/jumbo v6, "https"

    const/16 v7, 0x1bb

    invoke-direct {v5, v6, v3, v7}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v4, v5}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 123
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 124
    .local v2, "params":Lorg/apache/http/params/HttpParams;
    sget-object v5, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v2, v5}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 125
    const-string/jumbo v5, "UTF-8"

    invoke-static {v2, v5}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 126
    const/4 v5, 0x1

    invoke-static {v2, v5}, Lorg/apache/http/params/HttpProtocolParams;->setUseExpectContinue(Lorg/apache/http/params/HttpParams;Z)V

    .line 129
    new-instance v0, Lorg/apache/http/impl/conn/SingleClientConnManager;

    invoke-direct {v0, v2, v4}, Lorg/apache/http/impl/conn/SingleClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 131
    .local v0, "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v0, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    .line 135
    .local v1, "client":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    const-string/jumbo v6, "http.useragent"

    const-string/jumbo v7, "0060e Android"

    invoke-interface {v5, v6, v7}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 136
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    const-string/jumbo v6, "http.connection.timeout"

    .line 137
    invoke-interface {v5, v6, v9}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 138
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v5

    const-string/jumbo v6, "http.socket.timeout"

    invoke-interface {v5, v6, v9}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    .line 172
    return-object v1
.end method

.method public static varargs post(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 11
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 47
    const/4 v7, 0x0

    .line 48
    .local v7, "result":Ljava/lang/String;
    invoke-static {}, Lcom/pccw/mobile/sip/util/HttpUtils;->getHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v0

    .line 49
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    new-instance v5, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v5, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 50
    .local v5, "post":Lorg/apache/http/client/methods/HttpPost;
    const/4 v1, 0x0

    .line 52
    .local v1, "e":Lorg/apache/http/HttpEntity;
    :try_start_0
    invoke-static {p1}, Lcom/pccw/mobile/sip/util/HttpUtils;->buildNameValuePairList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    .line 53
    .local v4, "nvpairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v1, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    .end local v1    # "e":Lorg/apache/http/HttpEntity;
    const-string/jumbo v9, "UTF-8"

    invoke-direct {v1, v4, v9}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 57
    .restart local v1    # "e":Lorg/apache/http/HttpEntity;
    invoke-virtual {v5, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 58
    const/4 v6, 0x0

    .line 59
    .local v6, "response":Lorg/apache/http/HttpResponse;
    const/4 v2, 0x0

    .line 60
    .local v2, "entity":Lorg/apache/http/HttpEntity;
    const-string/jumbo v9, "Accept-Charset"

    const-string/jumbo v10, "UTF-8"

    invoke-virtual {v5, v9, v10}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    :try_start_1
    invoke-interface {v0, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 63
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    .line 66
    .local v8, "statusCode":I
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    .line 67
    const-string/jumbo v9, "UTF8"

    invoke-static {v2, v9}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 69
    const/16 v9, 0xc8

    if-eq v8, v9, :cond_0

    .line 70
    new-instance v9, Lcom/pccw/mobile/sip/util/HttpException;

    invoke-direct {v9, v8}, Lcom/pccw/mobile/sip/util/HttpException;-><init>(I)V

    throw v9
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .end local v8    # "statusCode":I
    :catch_0
    move-exception v3

    .line 75
    .local v3, "ex":Ljava/lang/RuntimeException;
    :try_start_2
    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 85
    .end local v3    # "ex":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v9

    .line 87
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v10

    invoke-interface {v10}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    throw v9

    .line 54
    .end local v1    # "e":Lorg/apache/http/HttpEntity;
    .end local v2    # "entity":Lorg/apache/http/HttpEntity;
    .end local v4    # "nvpairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    :catch_1
    move-exception v3

    .line 55
    .local v3, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v9, Ljava/lang/RuntimeException;

    const-string/jumbo v10, "encoding failed?"

    invoke-direct {v9, v10, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 87
    .end local v3    # "ex":Ljava/io/UnsupportedEncodingException;
    .restart local v1    # "e":Lorg/apache/http/HttpEntity;
    .restart local v2    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v4    # "nvpairs":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v6    # "response":Lorg/apache/http/HttpResponse;
    .restart local v8    # "statusCode":I
    :cond_0
    invoke-interface {v0}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 91
    return-object v7

    .line 76
    .end local v8    # "statusCode":I
    :catch_2
    move-exception v3

    .line 79
    .local v3, "ex":Ljava/io/IOException;
    :try_start_3
    new-instance v9, Lcom/pccw/mobile/sip/util/NetworkException;

    invoke-direct {v9, v3}, Lcom/pccw/mobile/sip/util/NetworkException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 80
    .end local v3    # "ex":Ljava/io/IOException;
    :catch_3
    move-exception v3

    .line 83
    .local v3, "ex":Ljava/lang/Exception;
    new-instance v9, Ljava/lang/RuntimeException;

    invoke-direct {v9, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method
