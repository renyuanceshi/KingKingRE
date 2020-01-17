.class Lcom/pccw/mobile/service/EchoClient$1;
.super Ljava/lang/Object;
.source "EchoClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/service/EchoClient;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field counting:Z

.field startTime:J

.field final synthetic this$0:Lcom/pccw/mobile/service/EchoClient;

.field timeLimit:J

.field final synthetic val$s:Ljava/net/DatagramSocket;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/service/EchoClient;Ljava/net/DatagramSocket;)V
    .locals 2
    .param p1, "this$0"    # Lcom/pccw/mobile/service/EchoClient;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/pccw/mobile/service/EchoClient$1;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iput-object p2, p0, Lcom/pccw/mobile/service/EchoClient$1;->val$s:Ljava/net/DatagramSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/pccw/mobile/service/EchoClient$1;->startTime:J

    .line 62
    const-wide v0, 0x12a05f200L

    iput-wide v0, p0, Lcom/pccw/mobile/service/EchoClient$1;->timeLimit:J

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pccw/mobile/service/EchoClient$1;->counting:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 67
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/pccw/mobile/service/EchoClient$1;->counting:Z

    if-eqz v1, :cond_2

    .line 69
    const-wide/16 v2, 0x9ce

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/pccw/mobile/service/EchoClient$1;->startTime:J

    sub-long/2addr v2, v4

    iget-wide v4, p0, Lcom/pccw/mobile/service/EchoClient$1;->timeLimit:J

    cmp-long v1, v2, v4

    if-ltz v1, :cond_0

    .line 75
    iput-boolean v6, p0, Lcom/pccw/mobile/service/EchoClient$1;->counting:Z

    .line 76
    iget-object v1, p0, Lcom/pccw/mobile/service/EchoClient$1;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iput-boolean v6, v1, Lcom/pccw/mobile/service/EchoClient;->contRun:Z

    .line 77
    iget-object v1, p0, Lcom/pccw/mobile/service/EchoClient$1;->val$s:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->isClosed()Z

    move-result v1

    if-nez v1, :cond_1

    .line 78
    iget-object v1, p0, Lcom/pccw/mobile/service/EchoClient$1;->val$s:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->close()V

    .line 84
    :cond_1
    iget-object v1, p0, Lcom/pccw/mobile/service/EchoClient$1;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget-object v1, v1, Lcom/pccw/mobile/service/EchoClient;->receiveThread:Ljava/lang/Thread;

    if-eqz v1, :cond_0

    .line 85
    iget-object v1, p0, Lcom/pccw/mobile/service/EchoClient$1;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget-object v1, v1, Lcom/pccw/mobile/service/EchoClient;->receiveThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 86
    iget-object v1, p0, Lcom/pccw/mobile/service/EchoClient$1;->this$0:Lcom/pccw/mobile/service/EchoClient;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/pccw/mobile/service/EchoClient;->receiveThread:Ljava/lang/Thread;

    goto :goto_0

    .line 70
    :catch_0
    move-exception v0

    .line 71
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 90
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    return-void
.end method
