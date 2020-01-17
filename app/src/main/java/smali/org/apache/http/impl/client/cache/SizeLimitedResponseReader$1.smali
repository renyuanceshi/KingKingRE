.class Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader$1;
.super Lorg/apache/http/impl/client/cache/ResponseProxyHandler;
.source "SizeLimitedResponseReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->getReconstructedResponse()Lorg/apache/http/client/methods/CloseableHttpResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;


# direct methods
.method constructor <init>(Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;Lorg/apache/http/HttpResponse;)V
    .locals 0
    .param p2, "x0"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 140
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader$1;->this$0:Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;

    invoke-direct {p0, p2}, Lorg/apache/http/impl/client/cache/ResponseProxyHandler;-><init>(Lorg/apache/http/HttpResponse;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader$1;->this$0:Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;

    invoke-static {v0}, Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;->access$000(Lorg/apache/http/impl/client/cache/SizeLimitedResponseReader;)Lorg/apache/http/client/methods/CloseableHttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/client/methods/CloseableHttpResponse;->close()V

    .line 145
    return-void
.end method
