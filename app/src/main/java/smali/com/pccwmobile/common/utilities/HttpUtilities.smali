.class public Lcom/pccwmobile/common/utilities/HttpUtilities;
.super Ljava/lang/Object;
.source "HttpUtilities.java"


# static fields
.field private static TAG_TAG:Ljava/lang/String;

.field public static timeoutConnection:I

.field public static timeoutSocket:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x2710

    .line 46
    const-string/jumbo v0, "testing"

    sput-object v0, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    .line 50
    sput v1, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutConnection:I

    .line 55
    sput v1, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutSocket:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static executeHttpDelete(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
    .locals 11
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 284
    const/4 v3, 0x0

    .line 285
    .local v3, "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v0, 0x0

    .line 286
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    const/4 v5, 0x0

    .line 289
    .local v5, "request":Lorg/apache/http/client/methods/HttpDelete;
    :try_start_0
    new-instance v4, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4}, Lorg/apache/http/params/BasicHttpParams;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .local v4, "httpParameters":Lorg/apache/http/params/HttpParams;
    :try_start_1
    sget v8, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutConnection:I

    invoke-static {v4, v8}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 292
    sget v8, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutSocket:I

    invoke-static {v4, v8}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 293
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 294
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .local v1, "client":Lorg/apache/http/client/HttpClient;
    :try_start_2
    new-instance v6, Lorg/apache/http/client/methods/HttpDelete;

    invoke-direct {v6}, Lorg/apache/http/client/methods/HttpDelete;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 295
    .end local v5    # "request":Lorg/apache/http/client/methods/HttpDelete;
    .local v6, "request":Lorg/apache/http/client/methods/HttpDelete;
    :try_start_3
    new-instance v8, Ljava/net/URI;

    invoke-direct {v8, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Lorg/apache/http/client/methods/HttpDelete;->setURI(Ljava/net/URI;)V

    .line 296
    invoke-interface {v1, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-result-object v7

    .line 307
    .local v7, "response":Lorg/apache/http/HttpResponse;
    const/4 v3, 0x0

    .line 308
    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v0, 0x0

    .line 309
    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    const/4 v5, 0x0

    .line 303
    .end local v6    # "request":Lorg/apache/http/client/methods/HttpDelete;
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    .restart local v5    # "request":Lorg/apache/http/client/methods/HttpDelete;
    :goto_0
    return-object v7

    .line 299
    :catch_0
    move-exception v2

    .line 301
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 302
    sget-object v8, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "executeHttpDelete: error="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 303
    const/4 v7, 0x0

    .line 307
    const/4 v3, 0x0

    .line 308
    const/4 v0, 0x0

    .line 309
    const/4 v5, 0x0

    .line 303
    goto :goto_0

    .line 307
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    :goto_2
    const/4 v3, 0x0

    .line 308
    const/4 v0, 0x0

    .line 309
    const/4 v5, 0x0

    throw v8

    .line 307
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_1
    move-exception v8

    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_2
    move-exception v8

    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v5    # "request":Lorg/apache/http/client/methods/HttpDelete;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v6    # "request":Lorg/apache/http/client/methods/HttpDelete;
    :catchall_3
    move-exception v8

    move-object v5, v6

    .end local v6    # "request":Lorg/apache/http/client/methods/HttpDelete;
    .restart local v5    # "request":Lorg/apache/http/client/methods/HttpDelete;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .line 299
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_1
    move-exception v2

    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v5    # "request":Lorg/apache/http/client/methods/HttpDelete;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v6    # "request":Lorg/apache/http/client/methods/HttpDelete;
    :catch_3
    move-exception v2

    move-object v5, v6

    .end local v6    # "request":Lorg/apache/http/client/methods/HttpDelete;
    .restart local v5    # "request":Lorg/apache/http/client/methods/HttpDelete;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1
.end method

.method public static executeHttpGet(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
    .locals 11
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 212
    const/4 v3, 0x0

    .line 213
    .local v3, "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v0, 0x0

    .line 214
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    const/4 v5, 0x0

    .line 217
    .local v5, "request":Lorg/apache/http/client/methods/HttpGet;
    :try_start_0
    new-instance v4, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v4}, Lorg/apache/http/params/BasicHttpParams;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .local v4, "httpParameters":Lorg/apache/http/params/HttpParams;
    :try_start_1
    sget v8, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutConnection:I

    invoke-static {v4, v8}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 220
    sget v8, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutSocket:I

    invoke-static {v4, v8}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 221
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v4}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 222
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .local v1, "client":Lorg/apache/http/client/HttpClient;
    :try_start_2
    new-instance v6, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v6}, Lorg/apache/http/client/methods/HttpGet;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 223
    .end local v5    # "request":Lorg/apache/http/client/methods/HttpGet;
    .local v6, "request":Lorg/apache/http/client/methods/HttpGet;
    :try_start_3
    new-instance v8, Ljava/net/URI;

    invoke-direct {v8, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Lorg/apache/http/client/methods/HttpGet;->setURI(Ljava/net/URI;)V

    .line 224
    invoke-interface {v1, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    move-result-object v7

    .line 235
    .local v7, "response":Lorg/apache/http/HttpResponse;
    const/4 v3, 0x0

    .line 236
    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v0, 0x0

    .line 237
    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    const/4 v5, 0x0

    .line 231
    .end local v6    # "request":Lorg/apache/http/client/methods/HttpGet;
    .end local v7    # "response":Lorg/apache/http/HttpResponse;
    .restart local v5    # "request":Lorg/apache/http/client/methods/HttpGet;
    :goto_0
    return-object v7

    .line 227
    :catch_0
    move-exception v2

    .line 229
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 230
    sget-object v8, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "executeHttpGet: error="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 231
    const/4 v7, 0x0

    .line 235
    const/4 v3, 0x0

    .line 236
    const/4 v0, 0x0

    .line 237
    const/4 v5, 0x0

    .line 231
    goto :goto_0

    .line 235
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v8

    :goto_2
    const/4 v3, 0x0

    .line 236
    const/4 v0, 0x0

    .line 237
    const/4 v5, 0x0

    throw v8

    .line 235
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_1
    move-exception v8

    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_2
    move-exception v8

    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v5    # "request":Lorg/apache/http/client/methods/HttpGet;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v6    # "request":Lorg/apache/http/client/methods/HttpGet;
    :catchall_3
    move-exception v8

    move-object v5, v6

    .end local v6    # "request":Lorg/apache/http/client/methods/HttpGet;
    .restart local v5    # "request":Lorg/apache/http/client/methods/HttpGet;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .line 227
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_1
    move-exception v2

    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v5    # "request":Lorg/apache/http/client/methods/HttpGet;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v6    # "request":Lorg/apache/http/client/methods/HttpGet;
    :catch_3
    move-exception v2

    move-object v5, v6

    .end local v6    # "request":Lorg/apache/http/client/methods/HttpGet;
    .restart local v5    # "request":Lorg/apache/http/client/methods/HttpGet;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v3, v4

    .end local v4    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1
.end method

.method public static executeHttpPost(Ljava/lang/String;Ljava/util/List;)Lorg/apache/http/HttpResponse;
    .locals 13
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/message/BasicNameValuePair;",
            ">;)",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .prologue
    .line 160
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    const/4 v5, 0x0

    .line 161
    .local v5, "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v0, 0x0

    .line 162
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    const/4 v7, 0x0

    .line 163
    .local v7, "request":Lorg/apache/http/client/methods/HttpPost;
    const/4 v3, 0x0

    .line 166
    .local v3, "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :try_start_0
    new-instance v6, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v6}, Lorg/apache/http/params/BasicHttpParams;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .local v6, "httpParameters":Lorg/apache/http/params/HttpParams;
    :try_start_1
    sget v10, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutConnection:I

    invoke-static {v6, v10}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 169
    sget v10, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutSocket:I

    invoke-static {v6, v10}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 170
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 171
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .local v1, "client":Lorg/apache/http/client/HttpClient;
    :try_start_2
    new-instance v8, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v8}, Lorg/apache/http/client/methods/HttpPost;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 172
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    .local v8, "request":Lorg/apache/http/client/methods/HttpPost;
    if-eqz p1, :cond_0

    .line 174
    :try_start_3
    new-instance v4, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v4, p1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 175
    .end local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .local v4, "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :try_start_4
    const-string/jumbo v10, "UTF-8"

    invoke-virtual {v4, v10}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;->setContentEncoding(Ljava/lang/String;)V

    .line 176
    invoke-virtual {v8, v4}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    move-object v3, v4

    .line 178
    .end local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :cond_0
    :try_start_5
    new-instance v10, Ljava/net/URI;

    invoke-direct {v10, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v10}, Lorg/apache/http/client/methods/HttpPost;->setURI(Ljava/net/URI;)V

    .line 180
    invoke-interface {v1, v8}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move-result-object v9

    .line 191
    .local v9, "response":Lorg/apache/http/HttpResponse;
    const/4 v5, 0x0

    .line 192
    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v0, 0x0

    .line 193
    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    const/4 v7, 0x0

    .line 194
    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    const/4 v3, 0x0

    .line 187
    .end local v9    # "response":Lorg/apache/http/HttpResponse;
    :goto_0
    return-object v9

    .line 183
    :catch_0
    move-exception v2

    .line 185
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_6
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 186
    sget-object v10, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "executeHttpPost: error="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 187
    const/4 v9, 0x0

    .line 191
    const/4 v5, 0x0

    .line 192
    const/4 v0, 0x0

    .line 193
    const/4 v7, 0x0

    .line 194
    const/4 v3, 0x0

    .line 187
    goto :goto_0

    .line 191
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v10

    :goto_2
    const/4 v5, 0x0

    .line 192
    const/4 v0, 0x0

    .line 193
    const/4 v7, 0x0

    .line 194
    const/4 v3, 0x0

    throw v10

    .line 191
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_1
    move-exception v10

    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_2
    move-exception v10

    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    :catchall_3
    move-exception v10

    move-object v7, v8

    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    :catchall_4
    move-exception v10

    move-object v3, v4

    .end local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    move-object v7, v8

    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .line 183
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_1
    move-exception v2

    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    :catch_3
    move-exception v2

    move-object v7, v8

    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    :catch_4
    move-exception v2

    move-object v3, v4

    .end local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    move-object v7, v8

    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPost;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPost;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1
.end method

.method public static executeHttpPostMultipart(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Landroid/util/Pair;II)Lorg/apache/http/HttpResponse;
    .locals 16
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "fileFormatcontentType"    # Ljava/lang/String;
    .param p4, "connectionTimeout"    # I
    .param p5, "socketTimeout"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/io/File;",
            ">;II)",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .prologue
    .line 70
    .local p2, "params":Ljava/util/List;, "Ljava/util/List<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    .local p3, "nameFilePair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/io/File;>;"
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 71
    .local v2, "client":Lorg/apache/http/client/HttpClient;
    const/4 v7, 0x0

    .line 75
    .local v7, "httpParameters":Lorg/apache/http/params/HttpParams;
    :try_start_0
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V
    :try_end_0
    .catch Landroid/net/ParseException; {:try_start_0 .. :try_end_0} :catch_11
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .local v3, "client":Lorg/apache/http/client/HttpClient;
    :try_start_1
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v13

    const-string/jumbo v14, "http.protocol.version"

    sget-object v15, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-interface {v13, v14, v15}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 78
    new-instance v8, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v8}, Lorg/apache/http/params/BasicHttpParams;-><init>()V
    :try_end_1
    .catch Landroid/net/ParseException; {:try_start_1 .. :try_end_1} :catch_12
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_1 .. :try_end_1} :catch_e
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_b
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 79
    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .local v8, "httpParameters":Lorg/apache/http/params/HttpParams;
    :try_start_2
    move/from16 v0, p4

    invoke-static {v8, v0}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 81
    move/from16 v0, p5

    invoke-static {v8, v0}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 82
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2, v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V
    :try_end_2
    .catch Landroid/net/ParseException; {:try_start_2 .. :try_end_2} :catch_13
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_f
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_c
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_6
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 84
    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    :try_start_3
    new-instance v11, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v11}, Lorg/apache/http/client/methods/HttpPost;-><init>()V

    .line 85
    .local v11, "post":Lorg/apache/http/client/methods/HttpPost;
    new-instance v13, Ljava/net/URI;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v13}, Lorg/apache/http/client/methods/HttpPost;->setURI(Ljava/net/URI;)V

    .line 87
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v1

    .line 88
    .local v1, "builder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    sget-object v13, Lorg/apache/http/entity/mime/HttpMultipartMode;->BROWSER_COMPATIBLE:Lorg/apache/http/entity/mime/HttpMultipartMode;

    invoke-virtual {v1, v13}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->setMode(Lorg/apache/http/entity/mime/HttpMultipartMode;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 90
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_0

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/util/Pair;

    .line 92
    .local v10, "param":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v13, v10, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v13, Ljava/lang/String;

    iget-object v14, v10, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v1, v13, v14}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    :try_end_3
    .catch Landroid/net/ParseException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_3 .. :try_end_3} :catch_10
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_d
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_a
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_7
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    goto :goto_0

    .line 107
    .end local v1    # "builder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v10    # "param":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "post":Lorg/apache/http/client/methods/HttpPost;
    :catch_0
    move-exception v4

    move-object v7, v8

    .line 109
    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .local v4, "e":Landroid/net/ParseException;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :goto_1
    :try_start_4
    sget-object v13, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "executeHttpPostMultipart: error="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v4}, Landroid/net/ParseException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 110
    const/4 v12, 0x0

    .line 133
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 134
    const/4 v7, 0x0

    .line 135
    const/4 v2, 0x0

    .line 129
    .end local v4    # "e":Landroid/net/ParseException;
    :goto_2
    return-object v12

    .line 97
    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "builder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v11    # "post":Lorg/apache/http/client/methods/HttpPost;
    :cond_0
    :try_start_5
    move-object/from16 v0, p3

    iget-object v6, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    .line 98
    .local v6, "filePartParamName":Ljava/lang/String;
    move-object/from16 v0, p3

    iget-object v9, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v9, Ljava/io/File;

    .line 100
    .local v9, "imageFile":Ljava/io/File;
    invoke-static/range {p1 .. p1}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v13

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v6, v9, v13, v14}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addBinaryBody(Ljava/lang/String;Ljava/io/File;Lorg/apache/http/entity/ContentType;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 102
    invoke-virtual {v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v5

    .line 103
    .local v5, "entity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v11, v5}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 104
    invoke-interface {v2, v11}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_5
    .catch Landroid/net/ParseException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_5 .. :try_end_5} :catch_10
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_d
    .catch Ljava/net/URISyntaxException; {:try_start_5 .. :try_end_5} :catch_a
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_7
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move-result-object v12

    .line 133
    .local v12, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 134
    const/4 v7, 0x0

    .line 135
    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v2, 0x0

    .line 105
    goto :goto_2

    .line 112
    .end local v1    # "builder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v5    # "entity":Lorg/apache/http/HttpEntity;
    .end local v6    # "filePartParamName":Ljava/lang/String;
    .end local v9    # "imageFile":Ljava/io/File;
    .end local v11    # "post":Lorg/apache/http/client/methods/HttpPost;
    .end local v12    # "response":Lorg/apache/http/HttpResponse;
    :catch_1
    move-exception v4

    .line 114
    .local v4, "e":Lorg/apache/http/client/ClientProtocolException;
    :goto_3
    :try_start_6
    sget-object v13, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "executeHttpPostMultipart: error="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v4}, Lorg/apache/http/client/ClientProtocolException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 115
    const/4 v12, 0x0

    .line 133
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 134
    const/4 v7, 0x0

    .line 135
    const/4 v2, 0x0

    .line 115
    goto :goto_2

    .line 117
    .end local v4    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_2
    move-exception v4

    .line 119
    .local v4, "e":Ljava/io/IOException;
    :goto_4
    :try_start_7
    sget-object v13, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "executeHttpPostMultipart: error="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v4}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 120
    const/4 v12, 0x0

    .line 133
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 134
    const/4 v7, 0x0

    .line 135
    const/4 v2, 0x0

    .line 120
    goto :goto_2

    .line 122
    .end local v4    # "e":Ljava/io/IOException;
    :catch_3
    move-exception v4

    .line 124
    .local v4, "e":Ljava/net/URISyntaxException;
    :goto_5
    :try_start_8
    sget-object v13, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "executeHttpPostMultipart: error="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v4}, Ljava/net/URISyntaxException;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 125
    const/4 v12, 0x0

    .line 133
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 134
    const/4 v7, 0x0

    .line 135
    const/4 v2, 0x0

    .line 125
    goto/16 :goto_2

    .line 127
    .end local v4    # "e":Ljava/net/URISyntaxException;
    :catch_4
    move-exception v4

    .line 128
    .local v4, "e":Ljava/lang/Exception;
    :goto_6
    :try_start_9
    sget-object v13, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "executeHttpPostMultipart: error="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 129
    const/4 v12, 0x0

    .line 133
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v13

    invoke-interface {v13}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 134
    const/4 v7, 0x0

    .line 135
    const/4 v2, 0x0

    .line 129
    goto/16 :goto_2

    .line 133
    .end local v4    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v13

    :goto_7
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v14

    invoke-interface {v14}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 134
    const/4 v7, 0x0

    .line 135
    const/4 v2, 0x0

    throw v13

    .line 133
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    :catchall_1
    move-exception v13

    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto :goto_7

    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_2
    move-exception v13

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto :goto_7

    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_3
    move-exception v13

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_7

    .line 127
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    :catch_5
    move-exception v4

    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto :goto_6

    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_6
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto :goto_6

    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_7
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_6

    .line 122
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    :catch_8
    move-exception v4

    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto :goto_5

    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_9
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto :goto_5

    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_a
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_5

    .line 117
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    :catch_b
    move-exception v4

    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto/16 :goto_4

    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_c
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto/16 :goto_4

    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_d
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto/16 :goto_4

    .line 112
    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    :catch_e
    move-exception v4

    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto/16 :goto_3

    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_f
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto/16 :goto_3

    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_10
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto/16 :goto_3

    .line 107
    :catch_11
    move-exception v4

    goto/16 :goto_1

    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    :catch_12
    move-exception v4

    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto/16 :goto_1

    .end local v2    # "client":Lorg/apache/http/client/HttpClient;
    .end local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_13
    move-exception v4

    move-object v7, v8

    .end local v8    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v7    # "httpParameters":Lorg/apache/http/params/HttpParams;
    move-object v2, v3

    .end local v3    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v2    # "client":Lorg/apache/http/client/HttpClient;
    goto/16 :goto_1
.end method

.method public static executeHttpPut(Ljava/lang/String;Ljava/util/List;)Lorg/apache/http/HttpResponse;
    .locals 13
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/message/BasicNameValuePair;",
            ">;)",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .prologue
    .line 244
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/message/BasicNameValuePair;>;"
    const/4 v5, 0x0

    .line 245
    .local v5, "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v0, 0x0

    .line 246
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    const/4 v7, 0x0

    .line 247
    .local v7, "request":Lorg/apache/http/client/methods/HttpPut;
    const/4 v3, 0x0

    .line 250
    .local v3, "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :try_start_0
    new-instance v6, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v6}, Lorg/apache/http/params/BasicHttpParams;-><init>()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 251
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .local v6, "httpParameters":Lorg/apache/http/params/HttpParams;
    :try_start_1
    sget v10, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutConnection:I

    invoke-static {v6, v10}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 253
    sget v10, Lcom/pccwmobile/common/utilities/HttpUtilities;->timeoutSocket:I

    invoke-static {v6, v10}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 254
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 255
    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .local v1, "client":Lorg/apache/http/client/HttpClient;
    :try_start_2
    new-instance v8, Lorg/apache/http/client/methods/HttpPut;

    invoke-direct {v8}, Lorg/apache/http/client/methods/HttpPut;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 256
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    .local v8, "request":Lorg/apache/http/client/methods/HttpPut;
    if-eqz p1, :cond_0

    .line 258
    :try_start_3
    new-instance v4, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-direct {v4, p1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 259
    .end local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .local v4, "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :try_start_4
    const-string/jumbo v10, "UTF-8"

    invoke-virtual {v4, v10}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;->setContentEncoding(Ljava/lang/String;)V

    .line 260
    invoke-virtual {v8, v4}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    move-object v3, v4

    .line 262
    .end local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :cond_0
    :try_start_5
    new-instance v10, Ljava/net/URI;

    invoke-direct {v10, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v10}, Lorg/apache/http/client/methods/HttpPut;->setURI(Ljava/net/URI;)V

    .line 264
    invoke-interface {v1, v8}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move-result-object v9

    .line 275
    .local v9, "response":Lorg/apache/http/HttpResponse;
    const/4 v5, 0x0

    .line 276
    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    const/4 v0, 0x0

    .line 277
    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    const/4 v7, 0x0

    .line 278
    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    const/4 v3, 0x0

    .line 271
    .end local v9    # "response":Lorg/apache/http/HttpResponse;
    :goto_0
    return-object v9

    .line 267
    :catch_0
    move-exception v2

    .line 269
    .local v2, "e":Ljava/lang/Exception;
    :goto_1
    :try_start_6
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 270
    sget-object v10, Lcom/pccwmobile/common/utilities/HttpUtilities;->TAG_TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "executeHttpPut: error="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 271
    const/4 v9, 0x0

    .line 275
    const/4 v5, 0x0

    .line 276
    const/4 v0, 0x0

    .line 277
    const/4 v7, 0x0

    .line 278
    const/4 v3, 0x0

    .line 271
    goto :goto_0

    .line 275
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v10

    :goto_2
    const/4 v5, 0x0

    .line 276
    const/4 v0, 0x0

    .line 277
    const/4 v7, 0x0

    .line 278
    const/4 v3, 0x0

    throw v10

    .line 275
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_1
    move-exception v10

    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catchall_2
    move-exception v10

    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    :catchall_3
    move-exception v10

    move-object v7, v8

    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    :catchall_4
    move-exception v10

    move-object v3, v4

    .end local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    move-object v7, v8

    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_2

    .line 267
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_1
    move-exception v2

    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    :catch_2
    move-exception v2

    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    :catch_3
    move-exception v2

    move-object v7, v8

    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1

    .end local v0    # "client":Lorg/apache/http/client/HttpClient;
    .end local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .end local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .end local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    :catch_4
    move-exception v2

    move-object v3, v4

    .end local v4    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    .restart local v3    # "form":Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    move-object v7, v8

    .end local v8    # "request":Lorg/apache/http/client/methods/HttpPut;
    .restart local v7    # "request":Lorg/apache/http/client/methods/HttpPut;
    move-object v0, v1

    .end local v1    # "client":Lorg/apache/http/client/HttpClient;
    .restart local v0    # "client":Lorg/apache/http/client/HttpClient;
    move-object v5, v6

    .end local v6    # "httpParameters":Lorg/apache/http/params/HttpParams;
    .restart local v5    # "httpParameters":Lorg/apache/http/params/HttpParams;
    goto :goto_1
.end method
