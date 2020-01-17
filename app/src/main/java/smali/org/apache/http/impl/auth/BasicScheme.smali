.class public Lorg/apache/http/impl/auth/BasicScheme;
.super Lorg/apache/http/impl/auth/RFC2617Scheme;
.source "BasicScheme.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final base64codec:Lorg/apache/commons/codec/binary/Base64;

.field private complete:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 84
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/BasicScheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .locals 2
    .param p1, "credentialsCharset"    # Ljava/nio/charset/Charset;

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/RFC2617Scheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 65
    new-instance v0, Lorg/apache/commons/codec/binary/Base64;

    invoke-direct {v0, v1}, Lorg/apache/commons/codec/binary/Base64;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/auth/BasicScheme;->base64codec:Lorg/apache/commons/codec/binary/Base64;

    .line 66
    iput-boolean v1, p0, Lorg/apache/http/impl/auth/BasicScheme;->complete:Z

    .line 67
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/auth/ChallengeState;)V
    .locals 2
    .param p1, "challengeState"    # Lorg/apache/http/auth/ChallengeState;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/RFC2617Scheme;-><init>(Lorg/apache/http/auth/ChallengeState;)V

    .line 80
    new-instance v0, Lorg/apache/commons/codec/binary/Base64;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/commons/codec/binary/Base64;-><init>(I)V

    iput-object v0, p0, Lorg/apache/http/impl/auth/BasicScheme;->base64codec:Lorg/apache/commons/codec/binary/Base64;

    .line 81
    return-void
.end method

.method public static authenticate(Lorg/apache/http/auth/Credentials;Ljava/lang/String;Z)Lorg/apache/http/Header;
    .locals 5
    .param p0, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p1, "charset"    # Ljava/lang/String;
    .param p2, "proxy"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 196
    const-string/jumbo v3, "Credentials"

    invoke-static {p0, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 197
    const-string/jumbo v3, "charset"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 199
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    .local v2, "tmp":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Lorg/apache/http/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-interface {p0}, Lorg/apache/http/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "null"

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p1}, Lorg/apache/http/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v3

    invoke-static {v3, v4}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([BZ)[B

    move-result-object v0

    .line 207
    .local v0, "base64password":[B
    new-instance v1, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v3, 0x20

    invoke-direct {v1, v3}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 208
    .local v1, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    if-eqz p2, :cond_1

    .line 209
    const-string/jumbo v3, "Proxy-Authorization"

    invoke-virtual {v1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 213
    :goto_1
    const-string/jumbo v3, ": Basic "

    invoke-virtual {v1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 214
    array-length v3, v0

    invoke-virtual {v1, v0, v4, v3}, Lorg/apache/http/util/CharArrayBuffer;->append([BII)V

    .line 216
    new-instance v3, Lorg/apache/http/message/BufferedHeader;

    invoke-direct {v3, v1}, Lorg/apache/http/message/BufferedHeader;-><init>(Lorg/apache/http/util/CharArrayBuffer;)V

    return-object v3

    .line 202
    .end local v0    # "base64password":[B
    .end local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :cond_0
    invoke-interface {p0}, Lorg/apache/http/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 211
    .restart local v0    # "base64password":[B
    .restart local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :cond_1
    const-string/jumbo v3, "Authorization"

    invoke-virtual {v1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto :goto_1
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
    .line 137
    new-instance v0, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v0}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/http/impl/auth/BasicScheme;->authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;

    move-result-object v0

    return-object v0
.end method

.method public authenticate(Lorg/apache/http/auth/Credentials;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/Header;
    .locals 6
    .param p1, "credentials"    # Lorg/apache/http/auth/Credentials;
    .param p2, "request"    # Lorg/apache/http/HttpRequest;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/AuthenticationException;
        }
    .end annotation

    .prologue
    .line 158
    const-string/jumbo v3, "Credentials"

    invoke-static {p1, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    const-string/jumbo v3, "HTTP request"

    invoke-static {p2, v3}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 160
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .local v2, "tmp":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Lorg/apache/http/auth/Credentials;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    invoke-interface {p1}, Lorg/apache/http/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "null"

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    iget-object v3, p0, Lorg/apache/http/impl/auth/BasicScheme;->base64codec:Lorg/apache/commons/codec/binary/Base64;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, p2}, Lorg/apache/http/impl/auth/BasicScheme;->getCredentialsCharset(Lorg/apache/http/HttpRequest;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/http/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/commons/codec/binary/Base64;->encode([B)[B

    move-result-object v0

    .line 168
    .local v0, "base64password":[B
    new-instance v1, Lorg/apache/http/util/CharArrayBuffer;

    const/16 v3, 0x20

    invoke-direct {v1, v3}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    .line 169
    .local v1, "buffer":Lorg/apache/http/util/CharArrayBuffer;
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/BasicScheme;->isProxy()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 170
    const-string/jumbo v3, "Proxy-Authorization"

    invoke-virtual {v1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 174
    :goto_1
    const-string/jumbo v3, ": Basic "

    invoke-virtual {v1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    .line 175
    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {v1, v0, v3, v4}, Lorg/apache/http/util/CharArrayBuffer;->append([BII)V

    .line 177
    new-instance v3, Lorg/apache/http/message/BufferedHeader;

    invoke-direct {v3, v1}, Lorg/apache/http/message/BufferedHeader;-><init>(Lorg/apache/http/util/CharArrayBuffer;)V

    return-object v3

    .line 163
    .end local v0    # "base64password":[B
    .end local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :cond_0
    invoke-interface {p1}, Lorg/apache/http/auth/Credentials;->getPassword()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 172
    .restart local v0    # "base64password":[B
    .restart local v1    # "buffer":Lorg/apache/http/util/CharArrayBuffer;
    :cond_1
    const-string/jumbo v3, "Authorization"

    invoke-virtual {v1, v3}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public getSchemeName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    const-string/jumbo v0, "basic"

    return-object v0
.end method

.method public isComplete()Z
    .locals 1

    .prologue
    .line 118
    iget-boolean v0, p0, Lorg/apache/http/impl/auth/BasicScheme;->complete:Z

    return v0
.end method

.method public isConnectionBased()Z
    .locals 1

    .prologue
    .line 127
    const/4 v0, 0x0

    return v0
.end method

.method public processChallenge(Lorg/apache/http/Header;)V
    .locals 1
    .param p1, "header"    # Lorg/apache/http/Header;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-super {p0, p1}, Lorg/apache/http/impl/auth/RFC2617Scheme;->processChallenge(Lorg/apache/http/Header;)V

    .line 108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/auth/BasicScheme;->complete:Z

    .line 109
    return-void
.end method
