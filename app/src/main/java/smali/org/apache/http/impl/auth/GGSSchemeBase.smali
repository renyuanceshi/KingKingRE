.class public abstract Lorg/apache/http/impl/auth/GGSSchemeBase;
.super Lorg/apache/http/impl/auth/AuthSchemeBase;
.source "GGSSchemeBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/impl/auth/GGSSchemeBase$1;,
        Lorg/apache/http/impl/auth/GGSSchemeBase$State;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final base64codec:Lorg/apache/commons/codec/binary/Base64;

.field private final log:Lorg/apache/commons/logging/Log;

.field private state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

.field private final stripPort:Z

.field private token:[B


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 85
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/GGSSchemeBase;-><init>(Z)V

    .line 86
    return-void
.end method

.method constructor <init>(Z)V
    .locals 2
    .param p1, "stripPort"    # Z

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/apache/http/impl/auth/AuthSchemeBase;-><init>()V

    .line 66
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->log:Lorg/apache/commons/logging/Log;

    .line 79
    new-instance v0, Lorg/apache/commons/codec/binary/Base64;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/commons/codec/binary/Base64;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->base64codec:Lorg/apache/commons/codec/binary/Base64;

    .line 80
    iput-boolean p1, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->stripPort:Z

    .line 81
    sget-object v0, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->UNINITIATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    iput-object v0, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    .line 82
    return-void
.end method


# virtual methods
.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;)Lorg/apache/http/Header;
    .locals 1
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 122
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/auth/GGSSchemeBase;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;
    .locals 9
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 130
    const-string/jumbo v6, "HTTP request"

    invoke-static {p2, v6}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 131
    sget-object v6, Lorg/apache/http/impl/auth/GGSSchemeBase$1;->$SwitchMap$org$apache$http$impl$auth$GGSSchemeBase$State:[I

    iget-object v7, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    invoke-virtual {v7}, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 195
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Illegal state: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 133
    :pswitch_0
    new-instance v6, Lorg/apache/http/auth/AuthenticationException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/impl/auth/GGSSchemeBase;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " authentication has not been initiated"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 135
    :pswitch_1
    new-instance v6, Lorg/apache/http/auth/AuthenticationException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/impl/auth/GGSSchemeBase;->getSchemeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " authentication has failed"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 138
    :pswitch_2
    :try_start_0
    const-string/jumbo v6, "http.route"

    invoke-interface {p3, v6}, Lorg/apache/http/protocol/HttpContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/http/conn/routing/HttpRoute;

    .line 139
    .local v4, "route":Lorg/apache/http/conn/routing/HttpRoute;
    if-nez v4, :cond_1

    .line 140
    new-instance v6, Lorg/apache/http/auth/AuthenticationException;

    const-string/jumbo v7, "Connection route is not available"

    invoke-direct {v6, v7}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Lorg/ietf/jgss/GSSException; {:try_start_0 .. :try_end_0} :catch_0

    .line 163
    .end local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :catch_0
    move-exception v2

    .line 164
    .local v2, "gsse":Lorg/ietf/jgss/GSSException;
    sget-object v6, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->FAILED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    iput-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    .line 165
    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v6

    const/16 v7, 0x9

    if-eq v6, v7, :cond_0

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_7

    .line 167
    :cond_0
    new-instance v6, Lorg/apache/http/auth/InvalidCredentialsException;

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Lorg/apache/http/auth/InvalidCredentialsException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 143
    .end local v2    # "gsse":Lorg/ietf/jgss/GSSException;
    .restart local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/GGSSchemeBase;->isProxy()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 144
    invoke-virtual {v4}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    .line 145
    .local v3, "host":Lorg/apache/http/HttpHost;
    if-nez v3, :cond_2

    .line 146
    invoke-virtual {v4}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    .line 152
    :cond_2
    :goto_0
    iget-boolean v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->stripPort:Z

    if-nez v6, :cond_6

    invoke-virtual {v3}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v6

    if-lez v6, :cond_6

    .line 153
    invoke-virtual {v3}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "authServer":Ljava/lang/String;
    :goto_1
    iget-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 159
    iget-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "init "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 161
    :cond_3
    iget-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->token:[B

    invoke-virtual {p0, v6, v0}, Lorg/apache/http/impl/auth/GGSSchemeBase;->generateToken([BLjava/lang/String;)[B

    move-result-object v6

    iput-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->token:[B

    .line 162
    sget-object v6, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->TOKEN_GENERATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    iput-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;
    :try_end_1
    .catch Lorg/ietf/jgss/GSSException; {:try_start_1 .. :try_end_1} :catch_0

    .line 181
    .end local v0    # "authServer":Ljava/lang/String;
    .end local v3    # "host":Lorg/apache/http/HttpHost;
    .end local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :pswitch_3
    new-instance v5, Ljava/lang/String;

    iget-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->base64codec:Lorg/apache/commons/codec/binary/Base64;

    iget-object v7, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->token:[B

    invoke-virtual {v6, v7}, Lorg/apache/commons/codec/binary/Base64;->encode([B)[B

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    .line 182
    .local v5, "tokenstr":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v6}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 183
    iget-object v6, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->log:Lorg/apache/commons/logging/Log;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Sending response \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "\' back to the auth server"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 185
    :cond_4
    new-instance v1, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v6, 0x20

    invoke-direct {v1, v6}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 186
    .local v1, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/GGSSchemeBase;->isProxy()Z

    move-result v6

    if-eqz v6, :cond_b

    .line 187
    const-string/jumbo v6, "Proxy-Authorization"

    invoke-virtual {v1, v6}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 191
    :goto_2
    const-string/jumbo v6, ": Negotiate "

    invoke-virtual {v1, v6}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 192
    invoke-virtual {v1, v5}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 193
    new-instance v6, Lorg/apache/http/message/BufferedHeader;

    invoke-direct {v6, v1}, Lorg/apache/http/message/BufferedHeader;-><init>(Lorg/apache/http/util/CharArrayBuffer;)V

    return-object v6

    .line 149
    .end local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .end local v5    # "tokenstr":Ljava/lang/String;
    .restart local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :cond_5
    :try_start_2
    invoke-virtual {v4}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    .restart local v3    # "host":Lorg/apache/http/HttpHost;
    goto/16 :goto_0

    .line 155
    :cond_6
    invoke-virtual {v3}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;
    :try_end_2
    .catch Lorg/ietf/jgss/GSSException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v0

    .restart local v0    # "authServer":Ljava/lang/String;
    goto/16 :goto_1

    .line 169
    .end local v0    # "authServer":Ljava/lang/String;
    .end local v3    # "host":Lorg/apache/http/HttpHost;
    .end local v4    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    .restart local v2    # "gsse":Lorg/ietf/jgss/GSSException;
    :cond_7
    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v6

    const/16 v7, 0xd

    if-ne v6, v7, :cond_8

    .line 170
    new-instance v6, Lorg/apache/http/auth/InvalidCredentialsException;

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Lorg/apache/http/auth/InvalidCredentialsException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 172
    :cond_8
    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v6

    const/16 v7, 0xa

    if-eq v6, v7, :cond_9

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v6

    const/16 v7, 0x13

    if-eq v6, v7, :cond_9

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMajor()I

    move-result v6

    const/16 v7, 0x14

    if-ne v6, v7, :cond_a

    .line 175
    :cond_9
    new-instance v6, Lorg/apache/http/auth/AuthenticationException;

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 178
    :cond_a
    new-instance v6, Lorg/apache/http/auth/AuthenticationException;

    invoke-virtual {v2}, Lorg/ietf/jgss/GSSException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/http/auth/AuthenticationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 189
    .end local v2    # "gsse":Lorg/ietf/jgss/GSSException;
    .restart local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    .restart local v5    # "tokenstr":Ljava/lang/String;
    :cond_b
    const-string/jumbo v6, "Authorization"

    invoke-virtual {v1, v6}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto :goto_2

    .line 131
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected generateGSSToken([BLorg/ietf/jgss/Oid;Ljava/lang/String;)[B
    .locals 8
    .param p1, "input"    # [B
    .param p2, "oid"    # Lorg/ietf/jgss/Oid;
    .param p3, "authServer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ietf/jgss/GSSException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 94
    move-object v3, p1

    .line 95
    .local v3, "token":[B
    if-nez v3, :cond_0

    .line 96
    new-array v3, v6, [B

    .line 98
    :cond_0
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/GGSSchemeBase;->getManager()Lorg/ietf/jgss/GSSManager;

    move-result-object v1

    .line 99
    .local v1, "manager":Lorg/ietf/jgss/GSSManager;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "HTTP@"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/ietf/jgss/GSSName;->NT_HOSTBASED_SERVICE:Lorg/ietf/jgss/Oid;

    invoke-virtual {v1, v4, v5}, Lorg/ietf/jgss/GSSManager;->createName(Ljava/lang/String;Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v2

    .line 100
    .local v2, "serverName":Lorg/ietf/jgss/GSSName;
    invoke-interface {v2, p2}, Lorg/ietf/jgss/GSSName;->canonicalize(Lorg/ietf/jgss/Oid;)Lorg/ietf/jgss/GSSName;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v1, v4, p2, v5, v6}, Lorg/ietf/jgss/GSSManager;->createContext(Lorg/ietf/jgss/GSSName;Lorg/ietf/jgss/Oid;Lorg/ietf/jgss/GSSCredential;I)Lorg/ietf/jgss/GSSContext;

    move-result-object v0

    .line 102
    .local v0, "gssContext":Lorg/ietf/jgss/GSSContext;
    invoke-interface {v0, v7}, Lorg/ietf/jgss/GSSContext;->requestMutualAuth(Z)V

    .line 103
    invoke-interface {v0, v7}, Lorg/ietf/jgss/GSSContext;->requestCredDeleg(Z)V

    .line 104
    array-length v4, v3

    invoke-interface {v0, v3, v6, v4}, Lorg/ietf/jgss/GSSContext;->initSecContext([BII)[B

    move-result-object v4

    return-object v4
.end method

.method protected abstract generateToken([BLjava/lang/String;)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/ietf/jgss/GSSException;
        }
    .end annotation
.end method

.method protected getManager()Lorg/ietf/jgss/GSSManager;
    .locals 1

    .prologue
    .line 89
    invoke-static {}, Lorg/ietf/jgss/GSSManager;->getInstance()Lorg/ietf/jgss/GSSManager;

    move-result-object v0

    return-object v0
.end method

.method public isComplete()Z
    .locals 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    sget-object v1, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->TOKEN_GENERATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    sget-object v1, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->FAILED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected parseChallenge(Lorg/apache/http/util/CharArrayBuffer;II)V
    .locals 4
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "beginIndex"    # I
    .param p3, "endIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 203
    invoke-virtual {p1, p2, p3}, Lorg/apache/http/util/CharArrayBuffer;->substringTrimmed(II)Ljava/lang/String;

    move-result-object v0

    .line 204
    .local v0, "challenge":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 205
    iget-object v1, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Received challenge \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\' from the auth server"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 207
    :cond_0
    iget-object v1, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    sget-object v2, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->UNINITIATED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    if-ne v1, v2, :cond_1

    .line 208
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lorg/apache/commons/codec/binary/Base64;->decodeBase64([B)[B

    move-result-object v1

    iput-object v1, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->token:[B

    .line 209
    sget-object v1, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->CHALLENGE_RECEIVED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    iput-object v1, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    .line 214
    :goto_0
    return-void

    .line 211
    :cond_1
    iget-object v1, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->log:Lorg/apache/commons/logging/Log;

    const-string/jumbo v2, "Authentication already attempted"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 212
    sget-object v1, Lorg/apache/http/impl/auth/GGSSchemeBase$State;->FAILED:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    iput-object v1, p0, Lorg/apache/http/impl/auth/GGSSchemeBase;->state:Lorg/apache/http/impl/auth/GGSSchemeBase$State;

    goto :goto_0
.end method
