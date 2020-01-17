.class public Lorg/apache/http/impl/client/DefaultRequestDirector;
.super Ljava/lang/Object;
.source "DefaultRequestDirector.java"

# interfaces
.implements Lorg/apache/http/client/RequestDirector;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

.field protected final connManager:Lorg/apache/http/conn/ClientConnectionManager;

.field private execCount:I

.field protected final httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

.field protected final keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

.field private final log:Lorg/apache/commons/logging/Log;

.field protected managedConn:Lorg/apache/http/conn/ManagedClientConnection;

.field private final maxRedirects:I

.field protected final params:Lorg/apache/http/params/HttpParams;

.field protected final proxyAuthHandler:Lorg/apache/http/client/AuthenticationHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final proxyAuthState:Lorg/apache/http/auth/AuthState;

.field protected final proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field private redirectCount:I

.field protected final redirectHandler:Lorg/apache/http/client/RedirectHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

.field protected final requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

.field protected final retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

.field protected final reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

.field protected final routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

.field protected final targetAuthHandler:Lorg/apache/http/client/AuthenticationHandler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final targetAuthState:Lorg/apache/http/auth/AuthState;

.field protected final targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field protected final userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

.field private virtualHost:Lorg/apache/http/HttpHost;


# direct methods
.method public constructor <init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V
    .locals 15
    .param p1, "log"    # Lorg/apache/commons/logging/Log;
    .param p2, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p3, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p4, "reustrat"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p5, "kastrat"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p6, "rouplan"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p7, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p8, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;
    .param p9, "redirectStrategy"    # Lorg/apache/http/client/RedirectStrategy;
    .param p10, "targetAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p11, "proxyAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p12, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;
    .param p13, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 244
    const-class v1, Lorg/apache/http/impl/client/DefaultRequestDirector;

    invoke-static {v1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v11, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    move-object/from16 v0, p10

    invoke-direct {v11, v0}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    new-instance v12, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    move-object/from16 v0, p11

    invoke-direct {v12, v0}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    move-object v1, p0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    invoke-direct/range {v1 .. v14}, Lorg/apache/http/impl/client/DefaultRequestDirector;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V

    .line 251
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V
    .locals 4
    .param p1, "log"    # Lorg/apache/commons/logging/Log;
    .param p2, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p3, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p4, "reustrat"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p5, "kastrat"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p6, "rouplan"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p7, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p8, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;
    .param p9, "redirectStrategy"    # Lorg/apache/http/client/RedirectStrategy;
    .param p10, "targetAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p11, "proxyAuthStrategy"    # Lorg/apache/http/client/AuthenticationStrategy;
    .param p12, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;
    .param p13, "params"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 269
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 271
    const-string/jumbo v1, "Log"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 272
    const-string/jumbo v1, "Request executor"

    invoke-static {p2, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 273
    const-string/jumbo v1, "Client connection manager"

    invoke-static {p3, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 274
    const-string/jumbo v1, "Connection reuse strategy"

    invoke-static {p4, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 275
    const-string/jumbo v1, "Connection keep alive strategy"

    invoke-static {p5, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 276
    const-string/jumbo v1, "Route planner"

    invoke-static {p6, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 277
    const-string/jumbo v1, "HTTP protocol processor"

    invoke-static {p7, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 278
    const-string/jumbo v1, "HTTP request retry handler"

    invoke-static {p8, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 279
    const-string/jumbo v1, "Redirect strategy"

    invoke-static {p9, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 280
    const-string/jumbo v1, "Target authentication strategy"

    invoke-static {p10, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 281
    const-string/jumbo v1, "Proxy authentication strategy"

    invoke-static {p11, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 282
    const-string/jumbo v1, "User token handler"

    move-object/from16 v0, p12

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 283
    const-string/jumbo v1, "HTTP parameters"

    move-object/from16 v0, p13

    invoke-static {v0, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 284
    iput-object p1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    .line 285
    new-instance v1, Lorg/apache/http/impl/client/HttpAuthenticator;

    invoke-direct {v1, p1}, Lorg/apache/http/impl/client/HttpAuthenticator;-><init>(Lorg/apache/commons/logging/Log;)V

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    .line 286
    iput-object p2, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 287
    iput-object p3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    .line 288
    iput-object p4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 289
    iput-object p5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .line 290
    iput-object p6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    .line 291
    iput-object p7, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    .line 292
    iput-object p8, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    .line 293
    iput-object p9, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    .line 294
    iput-object p10, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 295
    iput-object p11, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 296
    move-object/from16 v0, p12

    iput-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    .line 297
    move-object/from16 v0, p13

    iput-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    .line 299
    instance-of v1, p9, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;

    if-eqz v1, :cond_0

    .line 300
    check-cast p9, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;

    .end local p9    # "redirectStrategy":Lorg/apache/http/client/RedirectStrategy;
    invoke-virtual {p9}, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;->getHandler()Lorg/apache/http/client/RedirectHandler;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectHandler:Lorg/apache/http/client/RedirectHandler;

    .line 304
    :goto_0
    instance-of v1, p10, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    if-eqz v1, :cond_1

    .line 305
    check-cast p10, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    .end local p10    # "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    invoke-virtual {p10}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;->getHandler()Lorg/apache/http/client/AuthenticationHandler;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthHandler:Lorg/apache/http/client/AuthenticationHandler;

    .line 309
    :goto_1
    instance-of v1, p11, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    if-eqz v1, :cond_2

    .line 310
    check-cast p11, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    .end local p11    # "proxyAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    invoke-virtual {p11}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;->getHandler()Lorg/apache/http/client/AuthenticationHandler;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthHandler:Lorg/apache/http/client/AuthenticationHandler;

    .line 315
    :goto_2
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 317
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->execCount:I

    .line 318
    const/4 v1, 0x0

    iput v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectCount:I

    .line 319
    new-instance v1, Lorg/apache/http/auth/AuthState;

    invoke-direct {v1}, Lorg/apache/http/auth/AuthState;-><init>()V

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    .line 320
    new-instance v1, Lorg/apache/http/auth/AuthState;

    invoke-direct {v1}, Lorg/apache/http/auth/AuthState;-><init>()V

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    .line 321
    iget-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    const-string/jumbo v2, "http.protocol.max-redirects"

    const/16 v3, 0x64

    invoke-interface {v1, v2, v3}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->maxRedirects:I

    .line 322
    return-void

    .line 302
    .restart local p9    # "redirectStrategy":Lorg/apache/http/client/RedirectStrategy;
    .restart local p10    # "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    .restart local p11    # "proxyAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectHandler:Lorg/apache/http/client/RedirectHandler;

    goto :goto_0

    .line 307
    .end local p9    # "redirectStrategy":Lorg/apache/http/client/RedirectStrategy;
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthHandler:Lorg/apache/http/client/AuthenticationHandler;

    goto :goto_1

    .line 312
    .end local p10    # "targetAuthStrategy":Lorg/apache/http/client/AuthenticationStrategy;
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthHandler:Lorg/apache/http/client/AuthenticationHandler;

    goto :goto_2
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/AuthenticationHandler;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V
    .locals 15
    .param p1, "requestExec"    # Lorg/apache/http/protocol/HttpRequestExecutor;
    .param p2, "conman"    # Lorg/apache/http/conn/ClientConnectionManager;
    .param p3, "reustrat"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p4, "kastrat"    # Lorg/apache/http/conn/ConnectionKeepAliveStrategy;
    .param p5, "rouplan"    # Lorg/apache/http/conn/routing/HttpRoutePlanner;
    .param p6, "httpProcessor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p7, "retryHandler"    # Lorg/apache/http/client/HttpRequestRetryHandler;
    .param p8, "redirectHandler"    # Lorg/apache/http/client/RedirectHandler;
    .param p9, "targetAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p10, "proxyAuthHandler"    # Lorg/apache/http/client/AuthenticationHandler;
    .param p11, "userTokenHandler"    # Lorg/apache/http/client/UserTokenHandler;
    .param p12, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 219
    const-class v1, Lorg/apache/http/impl/client/DefaultRequestDirector;

    invoke-static {v1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    new-instance v10, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;

    move-object/from16 v0, p8

    invoke-direct {v10, v0}, Lorg/apache/http/impl/client/DefaultRedirectStrategyAdaptor;-><init>(Lorg/apache/http/client/RedirectHandler;)V

    new-instance v11, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    move-object/from16 v0, p9

    invoke-direct {v11, v0}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    new-instance v12, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;

    move-object/from16 v0, p10

    invoke-direct {v12, v0}, Lorg/apache/http/impl/client/AuthenticationStrategyAdaptor;-><init>(Lorg/apache/http/client/AuthenticationHandler;)V

    move-object v1, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v13, p11

    move-object/from16 v14, p12

    invoke-direct/range {v1 .. v14}, Lorg/apache/http/impl/client/DefaultRequestDirector;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/conn/routing/HttpRoutePlanner;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/HttpRequestRetryHandler;Lorg/apache/http/client/RedirectStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;Lorg/apache/http/params/HttpParams;)V

    .line 226
    return-void
.end method

.method private abortConnection()V
    .locals 5

    .prologue
    .line 1127
    iget-object v2, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 1128
    .local v2, "mcc":Lorg/apache/http/conn/ManagedClientConnection;
    if-eqz v2, :cond_1

    .line 1131
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 1133
    :try_start_0
    invoke-interface {v2}, Lorg/apache/http/conn/ManagedClientConnection;->abortConnection()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1141
    :cond_0
    :goto_0
    :try_start_1
    invoke-interface {v2}, Lorg/apache/http/conn/ManagedClientConnection;->releaseConnection()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1146
    :cond_1
    :goto_1
    return-void

    .line 1134
    :catch_0
    move-exception v0

    .line 1135
    .local v0, "ex":Ljava/io/IOException;
    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1136
    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 1142
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_1
    move-exception v1

    .line 1143
    .local v1, "ignored":Ljava/io/IOException;
    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v4, "Error releasing connection"

    invoke-interface {v3, v4, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private tryConnect(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/protocol/HttpContext;)V
    .locals 7
    .param p1, "req"    # Lorg/apache/http/impl/client/RoutedRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 601
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v2

    .line 602
    .local v2, "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRequest()Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v3

    .line 604
    .local v3, "wrapper":Lorg/apache/http/HttpRequest;
    const/4 v0, 0x0

    .line 606
    .local v0, "connectCount":I
    :cond_0
    :goto_0
    const-string/jumbo v4, "http.request"

    invoke-interface {p2, v4, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 608
    add-int/lit8 v0, v0, 0x1

    .line 610
    :try_start_0
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v4}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v4

    if-nez v4, :cond_1

    .line 611
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v4, v2, p2, v5}, Lorg/apache/http/conn/ManagedClientConnection;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 615
    :goto_1
    invoke-virtual {p0, v2, p2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->establishRoute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V

    .line 639
    return-void

    .line 613
    :cond_1
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v5}, Lorg/apache/http/params/HttpConnectionParams;->getSoTimeout(Lorg/apache/http/params/HttpParams;)I

    move-result v5

    invoke-interface {v4, v5}, Lorg/apache/http/conn/ManagedClientConnection;->setSocketTimeout(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 617
    :catch_0
    move-exception v1

    .line 619
    .local v1, "ex":Ljava/io/IOException;
    :try_start_1
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v4}, Lorg/apache/http/conn/ManagedClientConnection;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 622
    :goto_2
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    invoke-interface {v4, v1, v0, p2}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 623
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 624
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "I/O exception ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ") caught when connecting to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 629
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 630
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 632
    :cond_2
    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Retrying connect to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 635
    :cond_3
    throw v1

    .line 620
    :catch_1
    move-exception v4

    goto :goto_2
.end method

.method private tryExecute(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 9
    .param p1, "req"    # Lorg/apache/http/impl/client/RoutedRequest;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 646
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRequest()Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v5

    .line 647
    .local v5, "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v3

    .line 648
    .local v3, "route":Lorg/apache/http/conn/routing/HttpRoute;
    const/4 v1, 0x0

    .line 650
    .local v1, "response":Lorg/apache/http/HttpResponse;
    const/4 v2, 0x0

    .line 653
    .local v2, "retryReason":Ljava/lang/Exception;
    :goto_0
    iget v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->execCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->execCount:I

    .line 655
    invoke-virtual {v5}, Lorg/apache/http/impl/client/RequestWrapper;->incrementExecCount()V

    .line 656
    invoke-virtual {v5}, Lorg/apache/http/impl/client/RequestWrapper;->isRepeatable()Z

    move-result v6

    if-nez v6, :cond_1

    .line 657
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v7, "Cannot retry non-repeatable request"

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 658
    if-eqz v2, :cond_0

    .line 659
    new-instance v6, Lorg/apache/http/client/NonRepeatableRequestException;

    const-string/jumbo v7, "Cannot retry request with a non-repeatable request entity.  The cause lists the reason the original request failed."

    invoke-direct {v6, v7, v2}, Lorg/apache/http/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 663
    :cond_0
    new-instance v6, Lorg/apache/http/client/NonRepeatableRequestException;

    const-string/jumbo v7, "Cannot retry request with a non-repeatable request entity."

    invoke-direct {v6, v7}, Lorg/apache/http/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 669
    :cond_1
    :try_start_0
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v6}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v6

    if-nez v6, :cond_2

    .line 672
    invoke-virtual {v3}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v6

    if-nez v6, :cond_4

    .line 673
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v7, "Reopening the direct connection."

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 674
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v7, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v6, v3, p2, v7}, Lorg/apache/http/conn/ManagedClientConnection;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 682
    :cond_2
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 683
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Attempt "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->execCount:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " to execute request"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 685
    :cond_3
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v7, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-virtual {v6, v5, v7, p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 721
    :goto_1
    return-object v1

    .line 677
    :cond_4
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v7, "Proxied connection. Need to start over."

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 688
    :catch_0
    move-exception v0

    .line 689
    .local v0, "ex":Ljava/io/IOException;
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v7, "Closing the connection."

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 691
    :try_start_1
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v6}, Lorg/apache/http/conn/ManagedClientConnection;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 694
    :goto_2
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    invoke-virtual {v5}, Lorg/apache/http/impl/client/RequestWrapper;->getExecCount()I

    move-result v7

    invoke-interface {v6, v0, v7, p2}, Lorg/apache/http/client/HttpRequestRetryHandler;->retryRequest(Ljava/io/IOException;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 695
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 696
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "I/O exception ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ") caught when processing request to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 702
    :cond_5
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 703
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 705
    :cond_6
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 706
    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Retrying request to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 708
    :cond_7
    move-object v2, v0

    goto/16 :goto_0

    .line 710
    :cond_8
    instance-of v6, v0, Lorg/apache/http/NoHttpResponseException;

    if-eqz v6, :cond_9

    .line 711
    new-instance v4, Lorg/apache/http/NoHttpResponseException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " failed to respond"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lorg/apache/http/NoHttpResponseException;-><init>(Ljava/lang/String;)V

    .line 713
    .local v4, "updatedex":Lorg/apache/http/NoHttpResponseException;
    invoke-virtual {v0}, Ljava/io/IOException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/apache/http/NoHttpResponseException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 714
    throw v4

    .line 716
    .end local v4    # "updatedex":Lorg/apache/http/NoHttpResponseException;
    :cond_9
    throw v0

    .line 692
    :catch_1
    move-exception v6

    goto/16 :goto_2
.end method

.method private wrapRequest(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/RequestWrapper;
    .locals 1
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 327
    instance-of v0, p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v0, :cond_0

    .line 328
    new-instance v0, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;

    check-cast p1, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local p1    # "request":Lorg/apache/http/HttpRequest;
    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/EntityEnclosingRequestWrapper;-><init>(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 331
    :goto_0
    return-object v0

    .restart local p1    # "request":Lorg/apache/http/HttpRequest;
    :cond_0
    new-instance v0, Lorg/apache/http/impl/client/RequestWrapper;

    invoke-direct {v0, p1}, Lorg/apache/http/impl/client/RequestWrapper;-><init>(Lorg/apache/http/HttpRequest;)V

    goto :goto_0
.end method


# virtual methods
.method protected createConnectRequest(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpRequest;
    .locals 10
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;

    .prologue
    .line 987
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v6

    .line 989
    .local v6, "target":Lorg/apache/http/HttpHost;
    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v2

    .line 990
    .local v2, "host":Ljava/lang/String;
    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v3

    .line 991
    .local v3, "port":I
    if-gez v3, :cond_0

    .line 992
    iget-object v8, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    invoke-interface {v8}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v8

    invoke-virtual {v6}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Ljava/lang/String;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v5

    .line 994
    .local v5, "scheme":Lorg/apache/http/conn/scheme/Scheme;
    invoke-virtual {v5}, Lorg/apache/http/conn/scheme/Scheme;->getDefaultPort()I

    move-result v3

    .line 997
    .end local v5    # "scheme":Lorg/apache/http/conn/scheme/Scheme;
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, 0x6

    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 998
    .local v1, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 999
    const/16 v8, 0x3a

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1000
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1002
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1003
    .local v0, "authority":Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v8}, Lorg/apache/http/params/HttpProtocolParams;->getVersion(Lorg/apache/http/params/HttpParams;)Lorg/apache/http/ProtocolVersion;

    move-result-object v7

    .line 1004
    .local v7, "ver":Lorg/apache/http/ProtocolVersion;
    new-instance v4, Lorg/apache/http/message/BasicHttpRequest;

    const-string/jumbo v8, "CONNECT"

    invoke-direct {v4, v8, v0, v7}, Lorg/apache/http/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    .line 1007
    .local v4, "req":Lorg/apache/http/HttpRequest;
    return-object v4
.end method

.method protected createTunnelToProxy(Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)Z
    .locals 2
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "hop"    # I
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 967
    new-instance v0, Lorg/apache/http/HttpException;

    const-string/jumbo v1, "Proxy chains are not supported."

    invoke-direct {v0, v1}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected createTunnelToTarget(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)Z
    .locals 10
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 856
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 857
    .local v1, "proxy":Lorg/apache/http/HttpHost;
    invoke-virtual {p1}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v9

    .line 858
    .local v9, "target":Lorg/apache/http/HttpHost;
    const/4 v2, 0x0

    .line 861
    .local v2, "response":Lorg/apache/http/HttpResponse;
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v0

    if-nez v0, :cond_1

    .line 862
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v0, p1, p2, v3}, Lorg/apache/http/conn/ManagedClientConnection;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 865
    :cond_1
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->createConnectRequest(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpRequest;

    move-result-object v6

    .line 866
    .local v6, "connect":Lorg/apache/http/HttpRequest;
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v6, v0}, Lorg/apache/http/HttpRequest;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 869
    const-string/jumbo v0, "http.target_host"

    invoke-interface {p2, v0, v9}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 870
    const-string/jumbo v0, "http.proxy_host"

    invoke-interface {p2, v0, v1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 871
    const-string/jumbo v0, "http.connection"

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {p2, v0, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 872
    const-string/jumbo v0, "http.request"

    invoke-interface {p2, v0, v6}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 874
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-virtual {v0, v6, v3, p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->preProcess(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 876
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-virtual {v0, v6, v3, p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 878
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v2, v0}, Lorg/apache/http/HttpResponse;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 879
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-virtual {v0, v2, v3, p2}, Lorg/apache/http/protocol/HttpRequestExecutor;->postProcess(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 881
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    .line 882
    .local v8, "status":I
    const/16 v0, 0xc8

    if-ge v8, v0, :cond_2

    .line 883
    new-instance v0, Lorg/apache/http/HttpException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unexpected response to CONNECT request: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 887
    :cond_2
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-static {v0}, Lorg/apache/http/client/params/HttpClientParams;->isAuthenticating(Lorg/apache/http/params/HttpParams;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 888
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 890
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    iget-object v3, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    iget-object v4, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/http/impl/client/HttpAuthenticator;->authenticate(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 893
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    invoke-interface {v0, v2, p2}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 894
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v3, "Connection kept alive"

    invoke-interface {v0, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 896
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    .line 897
    .local v7, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v7}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    goto/16 :goto_0

    .line 899
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    :cond_3
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->close()V

    goto/16 :goto_0

    .line 910
    :cond_4
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v8

    .line 912
    const/16 v0, 0x12b

    if-le v8, v0, :cond_6

    .line 915
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    .line 916
    .restart local v7    # "entity":Lorg/apache/http/HttpEntity;
    if-eqz v7, :cond_5

    .line 917
    new-instance v0, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v0, v7}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {v2, v0}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 920
    :cond_5
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->close()V

    .line 921
    new-instance v0, Lorg/apache/http/impl/client/TunnelRefusedException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "CONNECT refused by proxy: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3, v2}, Lorg/apache/http/impl/client/TunnelRefusedException;-><init>(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V

    throw v0

    .line 925
    .end local v7    # "entity":Lorg/apache/http/HttpEntity;
    :cond_6
    iget-object v0, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v0}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V

    .line 931
    const/4 v0, 0x0

    return v0
.end method

.method protected determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;
    .locals 3
    .param p1, "targetHost"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    .line 762
    iget-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->routePlanner:Lorg/apache/http/conn/routing/HttpRoutePlanner;

    if-eqz p1, :cond_0

    .end local p1    # "targetHost":Lorg/apache/http/HttpHost;
    :goto_0
    invoke-interface {v1, p1, p2, p3}, Lorg/apache/http/conn/routing/HttpRoutePlanner;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v0

    return-object v0

    .restart local p1    # "targetHost":Lorg/apache/http/HttpHost;
    :cond_0
    invoke-interface {p2}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    const-string/jumbo v2, "http.default-host"

    invoke-interface {v0, v2}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/HttpHost;

    move-object p1, v0

    goto :goto_0
.end method

.method protected establishRoute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V
    .locals 8
    .param p1, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 781
    new-instance v2, Lorg/apache/http/conn/routing/BasicRouteDirector;

    invoke-direct {v2}, Lorg/apache/http/conn/routing/BasicRouteDirector;-><init>()V

    .line 784
    .local v2, "rowdy":Lorg/apache/http/conn/routing/HttpRouteDirector;
    :cond_0
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v5}, Lorg/apache/http/conn/ManagedClientConnection;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v0

    .line 785
    .local v0, "fact":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-interface {v2, p1, v0}, Lorg/apache/http/conn/routing/HttpRouteDirector;->nextStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I

    move-result v4

    .line 787
    .local v4, "step":I
    packed-switch v4, :pswitch_data_0

    .line 824
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Unknown step indicator "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " from RouteDirector."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 791
    :pswitch_0
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, p1, p2, v6}, Lorg/apache/http/conn/ManagedClientConnection;->open(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    .line 828
    :goto_0
    :pswitch_1
    if-gtz v4, :cond_0

    .line 830
    return-void

    .line 795
    :pswitch_2
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->createTunnelToTarget(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    .line 796
    .local v3, "secure":Z
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v6, "Tunnel to target created."

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 797
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, v3, v6}, Lorg/apache/http/conn/ManagedClientConnection;->tunnelTarget(ZLorg/apache/http/params/HttpParams;)V

    goto :goto_0

    .line 805
    .end local v3    # "secure":Z
    :pswitch_3
    invoke-virtual {v0}, Lorg/apache/http/conn/routing/HttpRoute;->getHopCount()I

    move-result v5

    add-int/lit8 v1, v5, -0x1

    .line 806
    .local v1, "hop":I
    invoke-virtual {p0, p1, v1, p2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->createTunnelToProxy(Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)Z

    move-result v3

    .line 807
    .restart local v3    # "secure":Z
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v6, "Tunnel to proxy created."

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 808
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-virtual {p1, v1}, Lorg/apache/http/conn/routing/HttpRoute;->getHopTarget(I)Lorg/apache/http/HttpHost;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, v6, v3, v7}, Lorg/apache/http/conn/ManagedClientConnection;->tunnelProxy(Lorg/apache/http/HttpHost;ZLorg/apache/http/params/HttpParams;)V

    goto :goto_0

    .line 814
    .end local v1    # "hop":I
    .end local v3    # "secure":Z
    :pswitch_4
    iget-object v5, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    iget-object v6, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    invoke-interface {v5, p2, v6}, Lorg/apache/http/conn/ManagedClientConnection;->layerProtocol(Lorg/apache/http/protocol/HttpContext;Lorg/apache/http/params/HttpParams;)V

    goto :goto_0

    .line 818
    :pswitch_5
    new-instance v5, Lorg/apache/http/HttpException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Unable to establish route: planned = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "; current = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 787
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_5
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public execute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    .locals 34
    .param p1, "targetHost"    # Lorg/apache/http/HttpHost;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 373
    const-string/jumbo v31, "http.auth.target-scope"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v32, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 374
    const-string/jumbo v31, "http.auth.proxy-scope"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v32, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 376
    move-object/from16 v25, p1

    .line 378
    .local v25, "target":Lorg/apache/http/HttpHost;
    move-object/from16 v15, p2

    .line 379
    .local v15, "orig":Lorg/apache/http/HttpRequest;
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/apache/http/impl/client/DefaultRequestDirector;->wrapRequest(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v17

    .line 380
    .local v17, "origWrapper":Lorg/apache/http/impl/client/RequestWrapper;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    move-object/from16 v31, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/RequestWrapper;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 381
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v17

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/impl/client/DefaultRequestDirector;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v16

    .line 383
    .local v16, "origRoute":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-virtual/range {v17 .. v17}, Lorg/apache/http/impl/client/RequestWrapper;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v31

    const-string/jumbo v32, "http.virtual-host"

    invoke-interface/range {v31 .. v32}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Lorg/apache/http/HttpHost;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    .line 386
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v31, v0

    if-eqz v31, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v31

    const/16 v32, -0x1

    move/from16 v0, v31

    move/from16 v1, v32

    if-ne v0, v1, :cond_0

    .line 387
    if-eqz v25, :cond_b

    move-object/from16 v12, v25

    .line 388
    .local v12, "host":Lorg/apache/http/HttpHost;
    :goto_0
    invoke-virtual {v12}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v18

    .line 389
    .local v18, "port":I
    const/16 v31, -0x1

    move/from16 v0, v18

    move/from16 v1, v31

    if-eq v0, v1, :cond_0

    .line 390
    new-instance v31, Lorg/apache/http/HttpHost;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    move/from16 v2, v18

    move-object/from16 v3, v33

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    .line 394
    .end local v12    # "host":Lorg/apache/http/HttpHost;
    .end local v18    # "port":I
    :cond_0
    new-instance v22, Lorg/apache/http/impl/client/RoutedRequest;

    move-object/from16 v0, v22

    move-object/from16 v1, v17

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/client/RoutedRequest;-><init>(Lorg/apache/http/impl/client/RequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 396
    .local v22, "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    const/16 v21, 0x0

    .line 397
    .local v21, "reuse":Z
    const/4 v5, 0x0

    .line 399
    .local v5, "done":Z
    const/16 v20, 0x0

    .line 400
    .local v20, "response":Lorg/apache/http/HttpResponse;
    :cond_1
    :goto_1
    if-nez v5, :cond_d

    .line 406
    :try_start_0
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/impl/client/RoutedRequest;->getRequest()Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v30

    .line 407
    .local v30, "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v23

    .line 408
    .local v23, "route":Lorg/apache/http/conn/routing/HttpRoute;
    const/16 v20, 0x0

    .line 411
    const-string/jumbo v31, "http.user-token"

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    invoke-interface {v0, v1}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v28

    .line 414
    .local v28, "userToken":Ljava/lang/Object;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    if-nez v31, :cond_3

    .line 415
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v23

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Lorg/apache/http/conn/ClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ClientConnectionRequest;

    move-result-object v4

    .line 417
    .local v4, "connRequest":Lorg/apache/http/conn/ClientConnectionRequest;
    instance-of v0, v15, Lorg/apache/http/client/methods/AbortableHttpRequest;

    move/from16 v31, v0

    if-eqz v31, :cond_2

    .line 418
    move-object v0, v15

    check-cast v0, Lorg/apache/http/client/methods/AbortableHttpRequest;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-interface {v0, v4}, Lorg/apache/http/client/methods/AbortableHttpRequest;->setConnectionRequest(Lorg/apache/http/conn/ClientConnectionRequest;)V

    .line 421
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    move-object/from16 v31, v0

    invoke-static/range {v31 .. v31}, Lorg/apache/http/client/params/HttpClientParams;->getConnectionManagerTimeout(Lorg/apache/http/params/HttpParams;)J
    :try_end_0
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_5

    move-result-wide v26

    .line 423
    .local v26, "timeout":J
    :try_start_1
    sget-object v31, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, v26

    move-object/from16 v2, v31

    invoke-interface {v4, v0, v1, v2}, Lorg/apache/http/conn/ClientConnectionRequest;->getConnection(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/conn/ManagedClientConnection;

    move-result-object v31

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_5

    .line 429
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    move-object/from16 v31, v0

    invoke-static/range {v31 .. v31}, Lorg/apache/http/params/HttpConnectionParams;->isStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;)Z

    move-result v31

    if-eqz v31, :cond_3

    .line 431
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->isOpen()Z

    move-result v31

    if-eqz v31, :cond_3

    .line 432
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    const-string/jumbo v32, "Stale connection check"

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 433
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->isStale()Z

    move-result v31

    if-eqz v31, :cond_3

    .line 434
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    const-string/jumbo v32, "Stale connection detected"

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->close()V

    .line 441
    .end local v4    # "connRequest":Lorg/apache/http/conn/ClientConnectionRequest;
    .end local v26    # "timeout":J
    :cond_3
    instance-of v0, v15, Lorg/apache/http/client/methods/AbortableHttpRequest;

    move/from16 v31, v0

    if-eqz v31, :cond_4

    .line 442
    move-object v0, v15

    check-cast v0, Lorg/apache/http/client/methods/AbortableHttpRequest;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v32, v0

    invoke-interface/range {v31 .. v32}, Lorg/apache/http/client/methods/AbortableHttpRequest;->setReleaseTrigger(Lorg/apache/http/conn/ConnectionReleaseTrigger;)V
    :try_end_2
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_5

    .line 446
    :cond_4
    :try_start_3
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->tryConnect(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/protocol/HttpContext;)V
    :try_end_3
    .catch Lorg/apache/http/impl/client/TunnelRefusedException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_5

    .line 455
    :try_start_4
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/impl/client/RequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object v29

    .line 456
    .local v29, "userinfo":Ljava/lang/String;
    if-eqz v29, :cond_5

    .line 457
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    new-instance v32, Lorg/apache/http/impl/auth/BasicScheme;

    invoke-direct/range {v32 .. v32}, Lorg/apache/http/impl/auth/BasicScheme;-><init>()V

    new-instance v33, Lorg/apache/http/auth/UsernamePasswordCredentials;

    move-object/from16 v0, v33

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v31 .. v33}, Lorg/apache/http/auth/AuthState;->update(Lorg/apache/http/auth/AuthScheme;Lorg/apache/http/auth/Credentials;)V

    .line 462
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v31, v0

    if-eqz v31, :cond_10

    .line 463
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    move-object/from16 v25, v0

    .line 470
    :cond_6
    :goto_2
    if-nez v25, :cond_7

    .line 471
    invoke-virtual/range {v23 .. v23}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v25

    .line 475
    :cond_7
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/impl/client/RequestWrapper;->resetHeaders()V

    .line 477
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->rewriteRequestURI(Lorg/apache/http/impl/client/RequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 480
    const-string/jumbo v31, "http.target_host"

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 481
    const-string/jumbo v31, "http.route"

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 482
    const-string/jumbo v31, "http.connection"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v32, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 485
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v32, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v30

    move-object/from16 v2, v32

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/protocol/HttpRequestExecutor;->preProcess(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 487
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lorg/apache/http/impl/client/DefaultRequestDirector;->tryExecute(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v20

    .line 488
    if-eqz v20, :cond_1

    .line 494
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->params:Lorg/apache/http/params/HttpParams;

    move-object/from16 v31, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v31

    invoke-interface {v0, v1}, Lorg/apache/http/HttpResponse;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 495
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->requestExec:Lorg/apache/http/protocol/HttpRequestExecutor;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->httpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    move-object/from16 v32, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    move-object/from16 v2, v32

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/protocol/HttpRequestExecutor;->postProcess(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v21

    .line 500
    if-eqz v21, :cond_9

    .line 502
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v20

    move-object/from16 v2, p3

    invoke-interface {v0, v1, v2}, Lorg/apache/http/conn/ConnectionKeepAliveStrategy;->getKeepAliveDuration(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)J

    move-result-wide v6

    .line 503
    .local v6, "duration":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v31

    if-eqz v31, :cond_8

    .line 505
    const-wide/16 v32, 0x0

    cmp-long v31, v6, v32

    if-lez v31, :cond_11

    .line 506
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v32, "for "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string/jumbo v32, " "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    sget-object v32, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    .line 510
    .local v24, "s":Ljava/lang/String;
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v33, "Connection can be kept alive "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 512
    .end local v24    # "s":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    sget-object v32, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    invoke-interface {v0, v6, v7, v1}, Lorg/apache/http/conn/ManagedClientConnection;->setIdleDuration(JLjava/util/concurrent/TimeUnit;)V

    .line 515
    .end local v6    # "duration":J
    :cond_9
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v20

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/impl/client/DefaultRequestDirector;->handleResponse(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/impl/client/RoutedRequest;

    move-result-object v11

    .line 516
    .local v11, "followup":Lorg/apache/http/impl/client/RoutedRequest;
    if-nez v11, :cond_12

    .line 517
    const/4 v5, 0x1

    .line 548
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    if-eqz v31, :cond_1

    .line 549
    if-nez v28, :cond_a

    .line 550
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, p3

    invoke-interface {v0, v1}, Lorg/apache/http/client/UserTokenHandler;->getUserToken(Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v28

    .line 551
    const-string/jumbo v31, "http.user-token"

    move-object/from16 v0, p3

    move-object/from16 v1, v31

    move-object/from16 v2, v28

    invoke-interface {v0, v1, v2}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 553
    :cond_a
    if-eqz v28, :cond_1

    .line 554
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v28

    invoke-interface {v0, v1}, Lorg/apache/http/conn/ManagedClientConnection;->setState(Ljava/lang/Object;)V
    :try_end_4
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_5

    goto/16 :goto_1

    .line 578
    .end local v11    # "followup":Lorg/apache/http/impl/client/RoutedRequest;
    .end local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v28    # "userToken":Ljava/lang/Object;
    .end local v29    # "userinfo":Ljava/lang/String;
    .end local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_0
    move-exception v10

    .line 579
    .local v10, "ex":Lorg/apache/http/impl/conn/ConnectionShutdownException;
    new-instance v14, Ljava/io/InterruptedIOException;

    const-string/jumbo v31, "Connection has been shut down"

    move-object/from16 v0, v31

    invoke-direct {v14, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 581
    .local v14, "ioex":Ljava/io/InterruptedIOException;
    invoke-virtual {v14, v10}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 582
    throw v14

    .line 387
    .end local v5    # "done":Z
    .end local v10    # "ex":Lorg/apache/http/impl/conn/ConnectionShutdownException;
    .end local v14    # "ioex":Ljava/io/InterruptedIOException;
    .end local v20    # "response":Lorg/apache/http/HttpResponse;
    .end local v21    # "reuse":Z
    .end local v22    # "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    :cond_b
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v12

    goto/16 :goto_0

    .line 424
    .restart local v4    # "connRequest":Lorg/apache/http/conn/ClientConnectionRequest;
    .restart local v5    # "done":Z
    .restart local v20    # "response":Lorg/apache/http/HttpResponse;
    .restart local v21    # "reuse":Z
    .restart local v22    # "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    .restart local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v26    # "timeout":J
    .restart local v28    # "userToken":Ljava/lang/Object;
    .restart local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_1
    move-exception v13

    .line 425
    .local v13, "interrupted":Ljava/lang/InterruptedException;
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Thread;->interrupt()V

    .line 426
    new-instance v31, Ljava/io/InterruptedIOException;

    invoke-direct/range {v31 .. v31}, Ljava/io/InterruptedIOException;-><init>()V

    throw v31
    :try_end_5
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_5

    .line 583
    .end local v4    # "connRequest":Lorg/apache/http/conn/ClientConnectionRequest;
    .end local v13    # "interrupted":Ljava/lang/InterruptedException;
    .end local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v26    # "timeout":J
    .end local v28    # "userToken":Ljava/lang/Object;
    .end local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_2
    move-exception v10

    .line 584
    .local v10, "ex":Lorg/apache/http/HttpException;
    invoke-direct/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->abortConnection()V

    .line 585
    throw v10

    .line 447
    .end local v10    # "ex":Lorg/apache/http/HttpException;
    .restart local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v28    # "userToken":Ljava/lang/Object;
    .restart local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_3
    move-exception v10

    .line 448
    .local v10, "ex":Lorg/apache/http/impl/client/TunnelRefusedException;
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v31

    if-eqz v31, :cond_c

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    invoke-virtual {v10}, Lorg/apache/http/impl/client/TunnelRefusedException;->getMessage()Ljava/lang/String;

    move-result-object v32

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 451
    :cond_c
    invoke-virtual {v10}, Lorg/apache/http/impl/client/TunnelRefusedException;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v20

    .line 562
    .end local v10    # "ex":Lorg/apache/http/impl/client/TunnelRefusedException;
    .end local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v28    # "userToken":Ljava/lang/Object;
    .end local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :cond_d
    if-eqz v20, :cond_e

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v31

    if-eqz v31, :cond_e

    invoke-interface/range {v20 .. v20}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v31

    if-nez v31, :cond_17

    .line 565
    :cond_e
    if-eqz v21, :cond_f

    .line 566
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V

    .line 568
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->releaseConnection()V

    .line 576
    :goto_5
    return-object v20

    .line 465
    .restart local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v28    # "userToken":Ljava/lang/Object;
    .restart local v29    # "userinfo":Ljava/lang/String;
    .restart local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :cond_10
    invoke-virtual/range {v30 .. v30}, Lorg/apache/http/impl/client/RequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v19

    .line 466
    .local v19, "requestURI":Ljava/net/URI;
    invoke-virtual/range {v19 .. v19}, Ljava/net/URI;->isAbsolute()Z

    move-result v31

    if-eqz v31, :cond_6

    .line 467
    invoke-static/range {v19 .. v19}, Lorg/apache/http/client/utils/URIUtils;->extractHost(Ljava/net/URI;)Lorg/apache/http/HttpHost;

    move-result-object v25

    goto/16 :goto_2

    .line 508
    .end local v19    # "requestURI":Ljava/net/URI;
    .restart local v6    # "duration":J
    :cond_11
    const-string/jumbo v24, "indefinitely"

    .restart local v24    # "s":Ljava/lang/String;
    goto/16 :goto_3

    .line 519
    .end local v6    # "duration":J
    .end local v24    # "s":Ljava/lang/String;
    .restart local v11    # "followup":Lorg/apache/http/impl/client/RoutedRequest;
    :cond_12
    if-eqz v21, :cond_15

    .line 521
    invoke-interface/range {v20 .. v20}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 522
    .local v8, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v8}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    .line 525
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->markReusable()V

    .line 542
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    :cond_13
    :goto_6
    invoke-virtual {v11}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v31

    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Lorg/apache/http/conn/routing/HttpRoute;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-nez v31, :cond_14

    .line 543
    invoke-virtual/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->releaseConnection()V

    .line 545
    :cond_14
    move-object/from16 v22, v11

    goto/16 :goto_4

    .line 527
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/conn/ManagedClientConnection;->close()V

    .line 528
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v31

    sget-object v32, Lorg/apache/http/auth/AuthProtocolState;->CHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual/range {v31 .. v32}, Lorg/apache/http/auth/AuthProtocolState;->compareTo(Ljava/lang/Enum;)I

    move-result v31

    if-lez v31, :cond_16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v31

    if-eqz v31, :cond_16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v31

    if-eqz v31, :cond_16

    .line 531
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    const-string/jumbo v32, "Resetting proxy auth state"

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 532
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 534
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v31

    sget-object v32, Lorg/apache/http/auth/AuthProtocolState;->CHALLENGED:Lorg/apache/http/auth/AuthProtocolState;

    invoke-virtual/range {v31 .. v32}, Lorg/apache/http/auth/AuthProtocolState;->compareTo(Ljava/lang/Enum;)I

    move-result v31

    if-lez v31, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v31

    if-eqz v31, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v31

    invoke-interface/range {v31 .. v31}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v31

    if-eqz v31, :cond_13

    .line 537
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v31, v0

    const-string/jumbo v32, "Resetting target auth state"

    invoke-interface/range {v31 .. v32}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 538
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/http/auth/AuthState;->reset()V
    :try_end_6
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_5

    goto/16 :goto_6

    .line 586
    .end local v11    # "followup":Lorg/apache/http/impl/client/RoutedRequest;
    .end local v23    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v28    # "userToken":Ljava/lang/Object;
    .end local v29    # "userinfo":Ljava/lang/String;
    .end local v30    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :catch_4
    move-exception v10

    .line 587
    .local v10, "ex":Ljava/io/IOException;
    invoke-direct/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->abortConnection()V

    .line 588
    throw v10

    .line 571
    .end local v10    # "ex":Ljava/io/IOException;
    :cond_17
    :try_start_7
    invoke-interface/range {v20 .. v20}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    .line 572
    .restart local v8    # "entity":Lorg/apache/http/HttpEntity;
    new-instance v9, Lorg/apache/http/conn/BasicManagedEntity;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move/from16 v1, v21

    invoke-direct {v9, v8, v0, v1}, Lorg/apache/http/conn/BasicManagedEntity;-><init>(Lorg/apache/http/HttpEntity;Lorg/apache/http/conn/ManagedClientConnection;Z)V

    .line 573
    .end local v8    # "entity":Lorg/apache/http/HttpEntity;
    .local v9, "entity":Lorg/apache/http/HttpEntity;
    move-object/from16 v0, v20

    invoke-interface {v0, v9}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_7
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Lorg/apache/http/HttpException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_5

    .line 589
    .end local v9    # "entity":Lorg/apache/http/HttpEntity;
    :catch_5
    move-exception v10

    .line 590
    .local v10, "ex":Ljava/lang/RuntimeException;
    invoke-direct/range {p0 .. p0}, Lorg/apache/http/impl/client/DefaultRequestDirector;->abortConnection()V

    .line 591
    throw v10
.end method

.method protected handleResponse(Lorg/apache/http/impl/client/RoutedRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/impl/client/RoutedRequest;
    .locals 29
    .param p1, "roureq"    # Lorg/apache/http/impl/client/RoutedRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1029
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v23

    .line 1030
    .local v23, "route":Lorg/apache/http/conn/routing/HttpRoute;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/impl/client/RoutedRequest;->getRequest()Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v22

    .line 1032
    .local v22, "request":Lorg/apache/http/impl/client/RequestWrapper;
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/impl/client/RequestWrapper;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v19

    .line 1034
    .local v19, "params":Lorg/apache/http/params/HttpParams;
    invoke-static/range {v19 .. v19}, Lorg/apache/http/client/params/HttpClientParams;->isAuthenticating(Lorg/apache/http/params/HttpParams;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1035
    const-string/jumbo v4, "http.target_host"

    move-object/from16 v0, p3

    invoke-interface {v0, v4}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/http/HttpHost;

    .line 1036
    .local v5, "target":Lorg/apache/http/HttpHost;
    if-nez v5, :cond_0

    .line 1037
    invoke-virtual/range {v23 .. v23}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v5

    .line 1039
    :cond_0
    invoke-virtual {v5}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v4

    if-gez v4, :cond_1

    .line 1040
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->connManager:Lorg/apache/http/conn/ClientConnectionManager;

    invoke-interface {v4}, Lorg/apache/http/conn/ClientConnectionManager;->getSchemeRegistry()Lorg/apache/http/conn/scheme/SchemeRegistry;

    move-result-object v4

    invoke-virtual {v4, v5}, Lorg/apache/http/conn/scheme/SchemeRegistry;->getScheme(Lorg/apache/http/HttpHost;)Lorg/apache/http/conn/scheme/Scheme;

    move-result-object v24

    .line 1041
    .local v24, "scheme":Lorg/apache/http/conn/scheme/Scheme;
    new-instance v25, Lorg/apache/http/HttpHost;

    invoke-virtual {v5}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v24 .. v24}, Lorg/apache/http/conn/scheme/Scheme;->getDefaultPort()I

    move-result v6

    invoke-virtual {v5}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v25

    invoke-direct {v0, v4, v6, v8}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .end local v5    # "target":Lorg/apache/http/HttpHost;
    .local v25, "target":Lorg/apache/http/HttpHost;
    move-object/from16 v5, v25

    .line 1044
    .end local v24    # "scheme":Lorg/apache/http/conn/scheme/Scheme;
    .end local v25    # "target":Lorg/apache/http/HttpHost;
    .restart local v5    # "target":Lorg/apache/http/HttpHost;
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v6, p2

    move-object/from16 v9, p3

    invoke-virtual/range {v4 .. v9}, Lorg/apache/http/impl/client/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v26

    .line 1047
    .local v26, "targetAuthRequested":Z
    invoke-virtual/range {v23 .. v23}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v7

    .line 1049
    .local v7, "proxy":Lorg/apache/http/HttpHost;
    if-nez v7, :cond_2

    .line 1050
    invoke-virtual/range {v23 .. v23}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v7

    .line 1052
    :cond_2
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v8, p2

    move-object/from16 v11, p3

    invoke-virtual/range {v6 .. v11}, Lorg/apache/http/impl/client/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v20

    .line 1055
    .local v20, "proxyAuthRequested":Z
    if-eqz v26, :cond_4

    .line 1056
    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    move-object v9, v5

    move-object/from16 v10, p2

    move-object/from16 v13, p3

    invoke-virtual/range {v8 .. v13}, Lorg/apache/http/impl/client/HttpAuthenticator;->authenticate(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1117
    .end local v5    # "target":Lorg/apache/http/HttpHost;
    .end local v7    # "proxy":Lorg/apache/http/HttpHost;
    .end local v20    # "proxyAuthRequested":Z
    .end local v26    # "targetAuthRequested":Z
    .end local p1    # "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    :cond_3
    :goto_0
    return-object p1

    .line 1062
    .restart local v5    # "target":Lorg/apache/http/HttpHost;
    .restart local v7    # "proxy":Lorg/apache/http/HttpHost;
    .restart local v20    # "proxyAuthRequested":Z
    .restart local v26    # "targetAuthRequested":Z
    .restart local p1    # "roureq":Lorg/apache/http/impl/client/RoutedRequest;
    :cond_4
    if-eqz v20, :cond_5

    .line 1063
    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->authenticator:Lorg/apache/http/impl/client/HttpAuthenticator;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    move-object/from16 v8, p2

    move-object/from16 v11, p3

    invoke-virtual/range {v6 .. v11}, Lorg/apache/http/impl/client/HttpAuthenticator;->authenticate(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 1071
    .end local v5    # "target":Lorg/apache/http/HttpHost;
    .end local v7    # "proxy":Lorg/apache/http/HttpHost;
    .end local v20    # "proxyAuthRequested":Z
    .end local v26    # "targetAuthRequested":Z
    :cond_5
    invoke-static/range {v19 .. v19}, Lorg/apache/http/client/params/HttpClientParams;->isRedirecting(Lorg/apache/http/params/HttpParams;)Z

    move-result v4

    if-eqz v4, :cond_a

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v4, v0, v1, v2}, Lorg/apache/http/client/RedirectStrategy;->isRedirected(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1074
    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectCount:I

    move-object/from16 v0, p0

    iget v6, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->maxRedirects:I

    if-lt v4, v6, :cond_6

    .line 1075
    new-instance v4, Lorg/apache/http/client/RedirectException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Maximum redirects ("

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget v8, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->maxRedirects:I

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, ") exceeded"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lorg/apache/http/client/RedirectException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1078
    :cond_6
    move-object/from16 v0, p0

    iget v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectCount:I

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, p0

    iput v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectCount:I

    .line 1081
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->virtualHost:Lorg/apache/http/HttpHost;

    .line 1083
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->redirectStrategy:Lorg/apache/http/client/RedirectStrategy;

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-interface {v4, v0, v1, v2}, Lorg/apache/http/client/RedirectStrategy;->getRedirect(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/client/methods/HttpUriRequest;

    move-result-object v21

    .line 1084
    .local v21, "redirect":Lorg/apache/http/client/methods/HttpUriRequest;
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/impl/client/RequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v18

    .line 1085
    .local v18, "orig":Lorg/apache/http/HttpRequest;
    invoke-interface/range {v18 .. v18}, Lorg/apache/http/HttpRequest;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-interface {v0, v4}, Lorg/apache/http/client/methods/HttpUriRequest;->setHeaders([Lorg/apache/http/Header;)V

    .line 1087
    invoke-interface/range {v21 .. v21}, Lorg/apache/http/client/methods/HttpUriRequest;->getURI()Ljava/net/URI;

    move-result-object v27

    .line 1088
    .local v27, "uri":Ljava/net/URI;
    invoke-static/range {v27 .. v27}, Lorg/apache/http/client/utils/URIUtils;->extractHost(Ljava/net/URI;)Lorg/apache/http/HttpHost;

    move-result-object v17

    .line 1089
    .local v17, "newTarget":Lorg/apache/http/HttpHost;
    if-nez v17, :cond_7

    .line 1090
    new-instance v4, Lorg/apache/http/ProtocolException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Redirect URI does not specify a valid host name: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v27

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1094
    :cond_7
    invoke-virtual/range {v23 .. v23}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v4

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lorg/apache/http/HttpHost;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 1095
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v6, "Resetting target auth state"

    invoke-interface {v4, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1096
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->targetAuthState:Lorg/apache/http/auth/AuthState;

    invoke-virtual {v4}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 1097
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    invoke-virtual {v4}, Lorg/apache/http/auth/AuthState;->getAuthScheme()Lorg/apache/http/auth/AuthScheme;

    move-result-object v14

    .line 1098
    .local v14, "authScheme":Lorg/apache/http/auth/AuthScheme;
    if-eqz v14, :cond_8

    invoke-interface {v14}, Lorg/apache/http/auth/AuthScheme;->isConnectionBased()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 1099
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v6, "Resetting proxy auth state"

    invoke-interface {v4, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 1100
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->proxyAuthState:Lorg/apache/http/auth/AuthState;

    invoke-virtual {v4}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 1104
    .end local v14    # "authScheme":Lorg/apache/http/auth/AuthScheme;
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/http/impl/client/DefaultRequestDirector;->wrapRequest(Lorg/apache/http/HttpRequest;)Lorg/apache/http/impl/client/RequestWrapper;

    move-result-object v28

    .line 1105
    .local v28, "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    move-object/from16 v0, v28

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/apache/http/impl/client/RequestWrapper;->setParams(Lorg/apache/http/params/HttpParams;)V

    .line 1107
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v28

    move-object/from16 v3, p3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/http/impl/client/DefaultRequestDirector;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v16

    .line 1108
    .local v16, "newRoute":Lorg/apache/http/conn/routing/HttpRoute;
    new-instance v15, Lorg/apache/http/impl/client/RoutedRequest;

    move-object/from16 v0, v28

    move-object/from16 v1, v16

    invoke-direct {v15, v0, v1}, Lorg/apache/http/impl/client/RoutedRequest;-><init>(Lorg/apache/http/impl/client/RequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 1110
    .local v15, "newRequest":Lorg/apache/http/impl/client/RoutedRequest;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1111
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Redirecting to \'"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v27

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "\' via "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v16

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_9
    move-object/from16 p1, v15

    .line 1114
    goto/16 :goto_0

    .line 1117
    .end local v15    # "newRequest":Lorg/apache/http/impl/client/RoutedRequest;
    .end local v16    # "newRoute":Lorg/apache/http/conn/routing/HttpRoute;
    .end local v17    # "newTarget":Lorg/apache/http/HttpHost;
    .end local v18    # "orig":Lorg/apache/http/HttpRequest;
    .end local v21    # "redirect":Lorg/apache/http/client/methods/HttpUriRequest;
    .end local v27    # "uri":Ljava/net/URI;
    .end local v28    # "wrapper":Lorg/apache/http/impl/client/RequestWrapper;
    :cond_a
    const/16 p1, 0x0

    goto/16 :goto_0
.end method

.method protected releaseConnection()V
    .locals 3

    .prologue
    .line 734
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    invoke-interface {v1}, Lorg/apache/http/conn/ManagedClientConnection;->releaseConnection()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 738
    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->managedConn:Lorg/apache/http/conn/ManagedClientConnection;

    .line 739
    return-void

    .line 735
    :catch_0
    move-exception v0

    .line 736
    .local v0, "ignored":Ljava/io/IOException;
    iget-object v1, p0, Lorg/apache/http/impl/client/DefaultRequestDirector;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "IOException releasing connection"

    invoke-interface {v1, v2, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected rewriteRequestURI(Lorg/apache/http/impl/client/RequestWrapper;Lorg/apache/http/conn/routing/HttpRoute;)V
    .locals 6
    .param p1, "request"    # Lorg/apache/http/impl/client/RequestWrapper;
    .param p2, "route"    # Lorg/apache/http/conn/routing/HttpRoute;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ProtocolException;
        }
    .end annotation

    .prologue
    .line 342
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/http/impl/client/RequestWrapper;->getURI()Ljava/net/URI;

    move-result-object v2

    .line 343
    .local v2, "uri":Ljava/net/URI;
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 345
    invoke-virtual {v2}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    if-nez v3, :cond_0

    .line 346
    invoke-virtual {p2}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v1

    .line 347
    .local v1, "target":Lorg/apache/http/HttpHost;
    const/4 v3, 0x1

    invoke-static {v2, v1, v3}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v2

    .line 359
    .end local v1    # "target":Lorg/apache/http/HttpHost;
    :goto_0
    invoke-virtual {p1, v2}, Lorg/apache/http/impl/client/RequestWrapper;->setURI(Ljava/net/URI;)V

    .line 365
    return-void

    .line 349
    :cond_0
    invoke-static {v2}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;

    move-result-object v2

    goto :goto_0

    .line 353
    :cond_1
    invoke-virtual {v2}, Ljava/net/URI;->isAbsolute()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 354
    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;Lorg/apache/http/HttpHost;Z)Ljava/net/URI;

    move-result-object v2

    goto :goto_0

    .line 356
    :cond_2
    invoke-static {v2}, Lorg/apache/http/client/utils/URIUtils;->rewriteURI(Ljava/net/URI;)Ljava/net/URI;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 361
    .end local v2    # "uri":Ljava/net/URI;
    :catch_0
    move-exception v0

    .line 362
    .local v0, "ex":Ljava/net/URISyntaxException;
    new-instance v3, Lorg/apache/http/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Invalid URI: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/http/impl/client/RequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/RequestLine;->getUri()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/http/ProtocolException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
