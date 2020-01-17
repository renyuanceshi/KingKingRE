.class public Lde/timroes/axmlrpc/CookieManager;
.super Ljava/lang/Object;
.source "CookieManager.java"


# static fields
.field private static final COOKIE:Ljava/lang/String; = "Cookie"

.field private static final SET_COOKIE:Ljava/lang/String; = "Set-Cookie"


# instance fields
.field private cookies:Ljava/util/Map;
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

.field private flags:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "flags"    # I

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lde/timroes/axmlrpc/CookieManager;->cookies:Ljava/util/Map;

    .line 28
    iput p1, p0, Lde/timroes/axmlrpc/CookieManager;->flags:I

    .line 29
    return-void
.end method


# virtual methods
.method public clearCookies()V
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lde/timroes/axmlrpc/CookieManager;->cookies:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 36
    return-void
.end method

.method public readCookies(Ljava/net/HttpURLConnection;)V
    .locals 8
    .param p1, "http"    # Ljava/net/HttpURLConnection;

    .prologue
    const/4 v7, 0x0

    .line 47
    iget v4, p0, Lde/timroes/axmlrpc/CookieManager;->flags:I

    and-int/lit8 v4, v4, 0x4

    if-nez v4, :cond_1

    .line 64
    :cond_0
    return-void

    .line 54
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 55
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->getHeaderFieldKey(I)Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, "key":Ljava/lang/String;
    if-eqz v2, :cond_2

    const-string/jumbo v4, "Set-Cookie"

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 57
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->getHeaderField(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    aget-object v0, v4, v7

    .line 58
    .local v0, "cookie":Ljava/lang/String;
    const-string/jumbo v4, "="

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 59
    .local v3, "split":[Ljava/lang/String;
    array-length v4, v3

    const/4 v5, 0x2

    if-lt v4, v5, :cond_2

    .line 60
    iget-object v4, p0, Lde/timroes/axmlrpc/CookieManager;->cookies:Ljava/util/Map;

    aget-object v5, v3, v7

    const/4 v6, 0x1

    aget-object v6, v3, v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .end local v0    # "cookie":Ljava/lang/String;
    .end local v3    # "split":[Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public setCookies(Ljava/net/HttpURLConnection;)V
    .locals 5
    .param p1, "http"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 75
    iget v3, p0, Lde/timroes/axmlrpc/CookieManager;->flags:I

    and-int/lit8 v3, v3, 0x4

    if-nez v3, :cond_0

    .line 84
    :goto_0
    return-void

    .line 78
    :cond_0
    const-string/jumbo v0, ""

    .line 79
    .local v0, "concat":Ljava/lang/String;
    iget-object v3, p0, Lde/timroes/axmlrpc/CookieManager;->cookies:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 80
    .local v1, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 82
    .end local v1    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    const-string/jumbo v3, "Cookie"

    invoke-virtual {p1, v3, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
