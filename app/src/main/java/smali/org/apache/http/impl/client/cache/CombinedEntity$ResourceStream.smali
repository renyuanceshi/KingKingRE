.class Lorg/apache/http/impl/client/cache/CombinedEntity$ResourceStream;
.super Ljava/io/FilterInputStream;
.source "CombinedEntity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/client/cache/CombinedEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ResourceStream"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/impl/client/cache/CombinedEntity;


# direct methods
.method protected constructor <init>(Lorg/apache/http/impl/client/cache/CombinedEntity;Ljava/io/InputStream;)V
    .locals 0
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/apache/http/impl/client/cache/CombinedEntity$ResourceStream;->this$0:Lorg/apache/http/impl/client/cache/CombinedEntity;

    .line 90
    invoke-direct {p0, p2}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 91
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    :try_start_0
    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    iget-object v0, p0, Lorg/apache/http/impl/client/cache/CombinedEntity$ResourceStream;->this$0:Lorg/apache/http/impl/client/cache/CombinedEntity;

    invoke-static {v0}, Lorg/apache/http/impl/client/cache/CombinedEntity;->access$000(Lorg/apache/http/impl/client/cache/CombinedEntity;)V

    .line 100
    return-void

    .line 98
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/http/impl/client/cache/CombinedEntity$ResourceStream;->this$0:Lorg/apache/http/impl/client/cache/CombinedEntity;

    invoke-static {v1}, Lorg/apache/http/impl/client/cache/CombinedEntity;->access$000(Lorg/apache/http/impl/client/cache/CombinedEntity;)V

    throw v0
.end method
