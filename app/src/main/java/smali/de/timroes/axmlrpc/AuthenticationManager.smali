.class public Lde/timroes/axmlrpc/AuthenticationManager;
.super Ljava/lang/Object;
.source "AuthenticationManager.java"


# instance fields
.field private pass:Ljava/lang/String;

.field private user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setAuthData(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lde/timroes/axmlrpc/AuthenticationManager;->user:Ljava/lang/String;

    .line 25
    iput-object p2, p0, Lde/timroes/axmlrpc/AuthenticationManager;->pass:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public setAuthentication(Ljava/net/HttpURLConnection;)V
    .locals 4
    .param p1, "http"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 35
    iget-object v1, p0, Lde/timroes/axmlrpc/AuthenticationManager;->user:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lde/timroes/axmlrpc/AuthenticationManager;->pass:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lde/timroes/axmlrpc/AuthenticationManager;->user:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lde/timroes/axmlrpc/AuthenticationManager;->pass:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_1

    .line 44
    :cond_0
    :goto_0
    return-void

    .line 40
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lde/timroes/axmlrpc/AuthenticationManager;->user:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/timroes/axmlrpc/AuthenticationManager;->pass:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/timroes/base64/Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, "base64login":Ljava/lang/String;
    const-string/jumbo v1, "Authorization"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Basic "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
