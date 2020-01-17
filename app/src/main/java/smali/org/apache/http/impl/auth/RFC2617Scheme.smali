.class public abstract Lorg/apache/http/impl/auth/RFC2617Scheme;
.super Lorg/apache/http/impl/auth/AuthSchemeBase;
.source "RFC2617Scheme.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final credentialsCharset:Ljava/nio/charset/Charset;

.field private final params:Ljava/util/Map;
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
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 85
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0}, Lorg/apache/http/impl/auth/RFC2617Scheme;-><init>(Ljava/nio/charset/Charset;)V

    .line 86
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "credentialsCharset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/apache/http/impl/auth/AuthSchemeBase;-><init>()V

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    .line 81
    if-eqz p1, :cond_0

    .end local p1    # "credentialsCharset":Ljava/nio/charset/Charset;
    :goto_0
    iput-object p1, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->credentialsCharset:Ljava/nio/charset/Charset;

    .line 82
    return-void

    .line 81
    .restart local p1    # "credentialsCharset":Ljava/nio/charset/Charset;
    :cond_0
    sget-object p1, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    goto :goto_0
.end method

.method public constructor <init>(Lorg/apache/http/auth/ChallengeState;)V
    .locals 1
    .param p1, "challengeState"    # Lorg/apache/http/auth/ChallengeState;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lorg/apache/http/impl/auth/AuthSchemeBase;-><init>(Lorg/apache/http/auth/ChallengeState;)V

    .line 71
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    .line 72
    sget-object v0, Lorg/apache/http/Consts;->ASCII:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->credentialsCharset:Ljava/nio/charset/Charset;

    .line 73
    return-void
.end method


# virtual methods
.method getCredentialsCharset(Lorg/apache/http/HttpRequest;)Ljava/lang/String;
    .locals 3
    .param p1, "request"    # Lorg/apache/http/HttpRequest;

    .prologue
    .line 97
    invoke-interface {p1}, Lorg/apache/http/HttpRequest;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v1

    const-string/jumbo v2, "http.auth.credential-charset"

    invoke-interface {v1, v2}, Lorg/apache/http/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 98
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 99
    invoke-virtual {p0}, Lorg/apache/http/impl/auth/RFC2617Scheme;->getCredentialsCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    .line 101
    :cond_0
    return-object v0
.end method

.method public getCredentialsCharset()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->credentialsCharset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 136
    if-nez p1, :cond_0

    .line 137
    const/4 v0, 0x0

    .line 139
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method

.method protected getParameters()Ljava/util/Map;
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
    .line 125
    iget-object v0, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    return-object v0
.end method

.method public getRealm()Ljava/lang/String;
    .locals 1

    .prologue
    .line 148
    const-string/jumbo v0, "realm"

    invoke-virtual {p0, v0}, Lorg/apache/http/impl/auth/RFC2617Scheme;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected parseChallenge(Lorg/apache/http/util/CharArrayBuffer;II)V
    .locals 10
    .param p1, "buffer"    # Lorg/apache/http/util/CharArrayBuffer;
    .param p2, "pos"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/auth/MalformedChallengeException;
        }
    .end annotation

    .prologue
    .line 107
    sget-object v6, Lorg/apache/http/message/BasicHeaderValueParser;->INSTANCE:Lorg/apache/http/message/BasicHeaderValueParser;

    .line 108
    .local v6, "parser":Lorg/apache/http/message/HeaderValueParser;
    new-instance v1, Lorg/apache/http/message/ParserCursor;

    invoke-virtual {p1}, Lorg/apache/http/util/CharArrayBuffer;->length()I

    move-result v7

    invoke-direct {v1, p2, v7}, Lorg/apache/http/message/ParserCursor;-><init>(II)V

    .line 109
    .local v1, "cursor":Lorg/apache/http/message/ParserCursor;
    invoke-interface {v6, p1, v1}, Lorg/apache/http/message/HeaderValueParser;->parseElements(Lorg/apache/http/util/CharArrayBuffer;Lorg/apache/http/message/ParserCursor;)[Lorg/apache/http/HeaderElement;

    move-result-object v3

    .line 110
    .local v3, "elements":[Lorg/apache/http/HeaderElement;
    array-length v7, v3

    if-nez v7, :cond_0

    .line 111
    new-instance v7, Lorg/apache/http/auth/MalformedChallengeException;

    const-string/jumbo v8, "Authentication challenge is empty"

    invoke-direct {v7, v8}, Lorg/apache/http/auth/MalformedChallengeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 113
    :cond_0
    iget-object v7, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->clear()V

    .line 114
    move-object v0, v3

    .local v0, "arr$":[Lorg/apache/http/HeaderElement;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v2, v0, v4

    .line 115
    .local v2, "element":Lorg/apache/http/HeaderElement;
    iget-object v7, p0, Lorg/apache/http/impl/auth/RFC2617Scheme;->params:Ljava/util/Map;

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2}, Lorg/apache/http/HeaderElement;->getValue()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 117
    .end local v2    # "element":Lorg/apache/http/HeaderElement;
    :cond_1
    return-void
.end method
