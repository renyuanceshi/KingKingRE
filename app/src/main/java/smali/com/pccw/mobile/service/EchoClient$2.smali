.class Lcom/pccw/mobile/service/EchoClient$2;
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

.field final synthetic val$s:Ljava/net/DatagramSocket;

.field final synthetic val$timerThread:Ljava/lang/Thread;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/service/EchoClient;Ljava/net/DatagramSocket;Ljava/lang/Thread;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/service/EchoClient;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/pccw/mobile/service/EchoClient$2;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iput-object p2, p0, Lcom/pccw/mobile/service/EchoClient$2;->val$s:Ljava/net/DatagramSocket;

    iput-object p3, p0, Lcom/pccw/mobile/service/EchoClient$2;->val$timerThread:Ljava/lang/Thread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 97
    const-string/jumbo v6, ""

    .line 98
    .local v6, "outString":Ljava/lang/String;
    :goto_0
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v12, 0x3e

    if-ge v11, v12, :cond_0

    .line 106
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, "a"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 108
    :cond_0
    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 109
    .local v0, "bufOut":[B
    new-instance v5, Ljava/net/DatagramPacket;

    array-length v11, v0

    iget-object v12, p0, Lcom/pccw/mobile/service/EchoClient$2;->this$0:Lcom/pccw/mobile/service/EchoClient;

    invoke-static {v12}, Lcom/pccw/mobile/service/EchoClient;->access$000(Lcom/pccw/mobile/service/EchoClient;)Ljava/net/InetAddress;

    move-result-object v12

    iget-object v13, p0, Lcom/pccw/mobile/service/EchoClient$2;->this$0:Lcom/pccw/mobile/service/EchoClient;

    invoke-static {v13}, Lcom/pccw/mobile/service/EchoClient;->access$100(Lcom/pccw/mobile/service/EchoClient;)I

    move-result v13

    invoke-direct {v5, v0, v11, v12, v13}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 110
    .local v5, "out":Ljava/net/DatagramPacket;
    const/16 v9, 0x8c0

    .line 113
    .local v9, "timeStampBase":I
    const-string/jumbo v10, ""

    .line 114
    .local v10, "timeStampHex":Ljava/lang/String;
    const-string/jumbo v7, ""

    .line 116
    .local v7, "seqHexStr":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    iget-object v11, p0, Lcom/pccw/mobile/service/EchoClient$2;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget v11, v11, Lcom/pccw/mobile/service/EchoClient;->retryTime:I

    if-ge v3, v11, :cond_5

    .line 117
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "countStr":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "id="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/pccw/mobile/service/EchoClient$2;->this$0:Lcom/pccw/mobile/service/EchoClient;

    invoke-static {v12}, Lcom/pccw/mobile/service/EchoClient;->access$200(Lcom/pccw/mobile/service/EchoClient;)I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ";"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ";"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/pccw/mobile/service/EchoClient$2;->this$0:Lcom/pccw/mobile/service/EchoClient;

    invoke-static {v12}, Lcom/pccw/mobile/service/EchoClient;->access$300(Lcom/pccw/mobile/service/EchoClient;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ";"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "inputStr":Ljava/lang/String;
    mul-int/lit16 v11, v3, 0xf0

    add-int v8, v9, v11

    .line 127
    .local v8, "timeStamp":I
    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v10

    .line 128
    :goto_2
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v12, 0x8

    if-ge v11, v12, :cond_1

    .line 129
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "0"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_2

    .line 134
    :cond_1
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v7

    .line 135
    :goto_3
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    const/4 v12, 0x4

    if-ge v11, v12, :cond_2

    .line 136
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "0"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_3

    .line 141
    :cond_2
    :goto_4
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v11

    const/16 v12, 0x32

    if-ge v11, v12, :cond_3

    .line 145
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, "a"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    .line 147
    :cond_3
    iget-object v11, p0, Lcom/pccw/mobile/service/EchoClient$2;->this$0:Lcom/pccw/mobile/service/EchoClient;

    invoke-virtual {v11, v4}, Lcom/pccw/mobile/service/EchoClient;->StringToHex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 153
    .local v2, "detailHex":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "8064"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, "7b0418e4"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 155
    invoke-static {v6}, Lcom/pccw/mobile/service/EchoClient;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v0

    .line 156
    invoke-virtual {v5, v0}, Ljava/net/DatagramPacket;->setData([B)V

    .line 159
    :try_start_0
    iget-object v11, p0, Lcom/pccw/mobile/service/EchoClient$2;->val$s:Ljava/net/DatagramSocket;

    invoke-virtual {v11, v5}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    .line 160
    iget-object v11, p0, Lcom/pccw/mobile/service/EchoClient$2;->this$0:Lcom/pccw/mobile/service/EchoClient;

    iget-object v11, v11, Lcom/pccw/mobile/service/EchoClient;->sendTimeArr:[J

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    aput-wide v12, v11, v3

    .line 161
    if-nez v3, :cond_4

    .line 162
    iget-object v11, p0, Lcom/pccw/mobile/service/EchoClient$2;->val$timerThread:Ljava/lang/Thread;

    invoke-virtual {v11}, Ljava/lang/Thread;->start()V

    .line 164
    :cond_4
    const-wide/16 v12, 0x1e

    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 178
    .end local v1    # "countStr":Ljava/lang/String;
    .end local v2    # "detailHex":Ljava/lang/String;
    .end local v4    # "inputStr":Ljava/lang/String;
    .end local v8    # "timeStamp":I
    :cond_5
    return-void

    .line 171
    .restart local v1    # "countStr":Ljava/lang/String;
    .restart local v2    # "detailHex":Ljava/lang/String;
    .restart local v4    # "inputStr":Ljava/lang/String;
    .restart local v8    # "timeStamp":I
    :catch_0
    move-exception v11

    goto :goto_5

    .line 165
    :catch_1
    move-exception v11

    goto :goto_5
.end method
