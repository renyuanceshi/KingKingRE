.class Lcom/pccw/mobile/service/EchoClient$3;
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
.field final synthetic this$0:Lcom/pccw/mobile/service/EchoClient;

.field final synthetic val$dp:Ljava/net/DatagramPacket;

.field final synthetic val$s:Ljava/net/DatagramSocket;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/service/EchoClient;Ljava/net/DatagramSocket;Ljava/net/DatagramPacket;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/service/EchoClient;

    .prologue
    .line 181
    iput-object p1, p0, Lcom/pccw/mobile/service/EchoClient$3;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iput-object p2, p0, Lcom/pccw/mobile/service/EchoClient$3;->val$s:Ljava/net/DatagramSocket;

    iput-object p3, p0, Lcom/pccw/mobile/service/EchoClient$3;->val$dp:Ljava/net/DatagramPacket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v8, 0x0

    .line 185
    const-wide/16 v2, 0x0

    .line 186
    .local v2, "firstReceiveTime":J
    iget-object v7, p0, Lcom/pccw/mobile/service/EchoClient$3;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iput v8, v7, Lcom/pccw/mobile/service/EchoClient;->validPacket:I

    .line 187
    :cond_0
    :goto_0
    iget-object v7, p0, Lcom/pccw/mobile/service/EchoClient$3;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget-boolean v7, v7, Lcom/pccw/mobile/service/EchoClient;->contRun:Z

    if-eqz v7, :cond_2

    .line 191
    :try_start_0
    iget-object v7, p0, Lcom/pccw/mobile/service/EchoClient$3;->val$s:Ljava/net/DatagramSocket;

    iget-object v8, p0, Lcom/pccw/mobile/service/EchoClient$3;->val$dp:Ljava/net/DatagramPacket;

    invoke-virtual {v7, v8}, Ljava/net/DatagramSocket;->receive(Ljava/net/DatagramPacket;)V

    .line 194
    new-instance v6, Ljava/lang/String;

    iget-object v7, p0, Lcom/pccw/mobile/service/EchoClient$3;->val$dp:Ljava/net/DatagramPacket;

    invoke-virtual {v7}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v7

    const/16 v8, 0xc

    const/16 v9, 0x9

    invoke-direct {v6, v7, v8, v9}, Ljava/lang/String;-><init>([BII)V

    .line 206
    .local v6, "receiveString":Ljava/lang/String;
    const-string/jumbo v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 207
    .local v5, "receiveStrArr":[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v7, v5, v7

    const-string/jumbo v8, "="

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v7, v7, v8

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 208
    .local v1, "echoIdReceiveStr":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 210
    .local v0, "echoIdReceive":I
    sget v7, Lcom/pccw/mobile/util/PreCallQualityIndicator;->validEchoId:I

    if-ne v0, v7, :cond_0

    .line 211
    const/4 v7, 0x1

    aget-object v7, v5, v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 213
    .local v4, "receiveInt":I
    iget-object v7, p0, Lcom/pccw/mobile/service/EchoClient$3;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget-object v7, v7, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    aput-wide v8, v7, v4

    .line 215
    iget-object v7, p0, Lcom/pccw/mobile/service/EchoClient$3;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget v8, v7, Lcom/pccw/mobile/service/EchoClient;->validPacket:I

    add-int/lit8 v8, v8, 0x1

    iput v8, v7, Lcom/pccw/mobile/service/EchoClient;->validPacket:I

    .line 216
    const-wide/16 v8, 0x0

    cmp-long v7, v2, v8

    if-nez v7, :cond_1

    .line 217
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    goto :goto_0

    .line 222
    :cond_1
    iget-object v7, p0, Lcom/pccw/mobile/service/EchoClient$3;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget v7, v7, Lcom/pccw/mobile/service/EchoClient;->validPacket:I

    iget-object v8, p0, Lcom/pccw/mobile/service/EchoClient$3;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget v8, v8, Lcom/pccw/mobile/service/EchoClient;->retryTime:I

    if-lt v7, v8, :cond_3

    .line 231
    .end local v0    # "echoIdReceive":I
    .end local v1    # "echoIdReceiveStr":Ljava/lang/String;
    .end local v4    # "receiveInt":I
    .end local v5    # "receiveStrArr":[Ljava/lang/String;
    .end local v6    # "receiveString":Ljava/lang/String;
    :cond_2
    return-void

    .line 226
    .restart local v0    # "echoIdReceive":I
    .restart local v1    # "echoIdReceiveStr":Ljava/lang/String;
    .restart local v4    # "receiveInt":I
    .restart local v5    # "receiveStrArr":[Ljava/lang/String;
    .restart local v6    # "receiveString":Ljava/lang/String;
    :cond_3
    iget-object v7, p0, Lcom/pccw/mobile/service/EchoClient$3;->this$0:Lcom/pccw/mobile/service/EchoClient;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    sub-long/2addr v8, v2

    iput-wide v8, v7, Lcom/pccw/mobile/service/EchoClient;->elapsedTime:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 228
    .end local v0    # "echoIdReceive":I
    .end local v1    # "echoIdReceiveStr":Ljava/lang/String;
    .end local v4    # "receiveInt":I
    .end local v5    # "receiveStrArr":[Ljava/lang/String;
    .end local v6    # "receiveString":Ljava/lang/String;
    :catch_0
    move-exception v7

    goto :goto_0
.end method
