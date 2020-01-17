.class public Lorg/apache/http/impl/cookie/BrowserCompatVersionAttributeHandler;
.super Lorg/apache/http/impl/cookie/AbstractCookieAttributeHandler;
.source "BrowserCompatVersionAttributeHandler.java"


# annotations
.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/http/impl/cookie/AbstractCookieAttributeHandler;-><init>()V

    .line 46
    return-void
.end method


# virtual methods
.method public parse(Lorg/apache/http/cookie/SetCookie;Ljava/lang/String;)V
    .locals 3
    .param p1, "cookie"    # Lorg/apache/http/cookie/SetCookie;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/cookie/MalformedCookieException;
        }
    .end annotation

    .prologue
    .line 53
    const-string/jumbo v1, "Cookie"

    invoke-static {p1, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 54
    if-nez p2, :cond_0

    .line 55
    new-instance v1, Lorg/apache/http/cookie/MalformedCookieException;

    const-string/jumbo v2, "Missing value for version attribute"

    invoke-direct {v1, v2}, Lorg/apache/http/cookie/MalformedCookieException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 57
    :cond_0
    const/4 v0, 0x0

    .line 59
    .local v0, "version":I
    :try_start_0
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 63
    :goto_0
    invoke-interface {p1, v0}, Lorg/apache/http/cookie/SetCookie;->setVersion(I)V

    .line 64
    return-void

    .line 60
    :catch_0
    move-exception v1

    goto :goto_0
.end method
