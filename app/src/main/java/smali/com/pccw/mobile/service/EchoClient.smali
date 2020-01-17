.class public Lcom/pccw/mobile/service/EchoClient;
.super Ljava/lang/Object;
.source "EchoClient.java"


# instance fields
.field contRun:Z

.field private csNum:Ljava/lang/String;

.field private echoId:I

.field public elapsedTime:J

.field private host:Ljava/net/InetAddress;

.field private port:I

.field receiveThread:Ljava/lang/Thread;

.field public receiveTimeArr:[J

.field public retryTime:I

.field sendThread:Ljava/lang/Thread;

.field public sendTimeArr:[J

.field public validPacket:I


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;IILjava/lang/String;)V
    .locals 4
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "echoId"    # I
    .param p4, "csNum"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput v2, p0, Lcom/pccw/mobile/service/EchoClient;->validPacket:I

    .line 23
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/pccw/mobile/service/EchoClient;->elapsedTime:J

    .line 24
    const/16 v0, 0x64

    iput v0, p0, Lcom/pccw/mobile/service/EchoClient;->retryTime:I

    .line 25
    iget v0, p0, Lcom/pccw/mobile/service/EchoClient;->retryTime:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/pccw/mobile/service/EchoClient;->sendTimeArr:[J

    .line 26
    iget v0, p0, Lcom/pccw/mobile/service/EchoClient;->retryTime:I

    new-array v0, v0, [J

    iput-object v0, p0, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    .line 28
    iput-boolean v2, p0, Lcom/pccw/mobile/service/EchoClient;->contRun:Z

    .line 30
    iput-object v3, p0, Lcom/pccw/mobile/service/EchoClient;->receiveThread:Ljava/lang/Thread;

    .line 31
    iput-object v3, p0, Lcom/pccw/mobile/service/EchoClient;->sendThread:Ljava/lang/Thread;

    .line 34
    iput-object p1, p0, Lcom/pccw/mobile/service/EchoClient;->host:Ljava/net/InetAddress;

    .line 35
    iput p2, p0, Lcom/pccw/mobile/service/EchoClient;->port:I

    .line 36
    iput p3, p0, Lcom/pccw/mobile/service/EchoClient;->echoId:I

    .line 37
    iput-object p4, p0, Lcom/pccw/mobile/service/EchoClient;->csNum:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public static HexToString(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p0, "hex"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x10

    .line 257
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 258
    .local v5, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    .line 259
    .local v3, "hexData":[C
    const/4 v0, 0x0

    .local v0, "count":I
    :goto_0
    array-length v6, v3

    add-int/lit8 v6, v6, -0x1

    if-ge v0, v6, :cond_0

    .line 260
    aget-char v6, v3, v0

    invoke-static {v6, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v2

    .line 261
    .local v2, "firstDigit":I
    add-int/lit8 v6, v0, 0x1

    aget-char v6, v3, v6

    invoke-static {v6, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    .line 262
    .local v4, "lastDigit":I
    mul-int/lit8 v6, v2, 0x10

    add-int v1, v6, v4

    .line 263
    .local v1, "decimal":I
    int-to-char v6, v1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 259
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 265
    .end local v1    # "decimal":I
    .end local v2    # "firstDigit":I
    .end local v4    # "lastDigit":I
    :cond_0
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method static synthetic access$000(Lcom/pccw/mobile/service/EchoClient;)Ljava/net/InetAddress;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/service/EchoClient;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/pccw/mobile/service/EchoClient;->host:Ljava/net/InetAddress;

    return-object v0
.end method

.method static synthetic access$100(Lcom/pccw/mobile/service/EchoClient;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/service/EchoClient;

    .prologue
    .line 15
    iget v0, p0, Lcom/pccw/mobile/service/EchoClient;->port:I

    return v0
.end method

.method static synthetic access$200(Lcom/pccw/mobile/service/EchoClient;)I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/service/EchoClient;

    .prologue
    .line 15
    iget v0, p0, Lcom/pccw/mobile/service/EchoClient;->echoId:I

    return v0
.end method

.method static synthetic access$300(Lcom/pccw/mobile/service/EchoClient;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/service/EchoClient;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/pccw/mobile/service/EchoClient;->csNum:Ljava/lang/String;

    return-object v0
.end method

.method public static hexStringToByteArray(Ljava/lang/String;)[B
    .locals 7
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x10

    .line 243
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 244
    .local v2, "len":I
    div-int/lit8 v3, v2, 0x2

    new-array v0, v3, [B

    .line 245
    .local v0, "data":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 246
    div-int/lit8 v3, v1, 0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v1, 0x1

    .line 247
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 246
    invoke-static {v5, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v5

    add-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v0, v3

    .line 245
    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    .line 249
    :cond_0
    return-object v0
.end method


# virtual methods
.method public StringToHex(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "arg"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    .line 253
    const-string/jumbo v0, "%040x"

    new-array v1, v5, [Ljava/lang/Object;

    const/4 v2, 0x0

    new-instance v3, Ljava/math/BigInteger;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    invoke-direct {v3, v5, v4}, Ljava/math/BigInteger;-><init>(I[B)V

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 8

    .prologue
    .line 49
    :try_start_0
    new-instance v3, Ljava/net/DatagramSocket;

    invoke-direct {v3}, Ljava/net/DatagramSocket;-><init>()V

    .line 51
    .local v3, "s":Ljava/net/DatagramSocket;
    const/16 v5, 0x2710

    new-array v0, v5, [B

    .line 52
    .local v0, "buf":[B
    new-instance v1, Ljava/net/DatagramPacket;

    array-length v5, v0

    invoke-direct {v1, v0, v5}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 54
    .local v1, "dp":Ljava/net/DatagramPacket;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v5, p0, Lcom/pccw/mobile/service/EchoClient;->retryTime:I

    if-ge v2, v5, :cond_0

    .line 55
    iget-object v5, p0, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    const-wide/16 v6, 0x0

    aput-wide v6, v5, v2

    .line 54
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 58
    :cond_0
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/pccw/mobile/service/EchoClient;->contRun:Z

    .line 60
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/pccw/mobile/service/EchoClient$1;

    invoke-direct {v5, p0, v3}, Lcom/pccw/mobile/service/EchoClient$1;-><init>(Lcom/pccw/mobile/service/EchoClient;Ljava/net/DatagramSocket;)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 93
    .local v4, "timerThread":Ljava/lang/Thread;
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lcom/pccw/mobile/service/EchoClient$2;

    invoke-direct {v6, p0, v3, v4}, Lcom/pccw/mobile/service/EchoClient$2;-><init>(Lcom/pccw/mobile/service/EchoClient;Ljava/net/DatagramSocket;Ljava/lang/Thread;)V

    invoke-direct {v5, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v5, p0, Lcom/pccw/mobile/service/EchoClient;->sendThread:Ljava/lang/Thread;

    .line 181
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lcom/pccw/mobile/service/EchoClient$3;

    invoke-direct {v6, p0, v3, v1}, Lcom/pccw/mobile/service/EchoClient$3;-><init>(Lcom/pccw/mobile/service/EchoClient;Ljava/net/DatagramSocket;Ljava/net/DatagramPacket;)V

    invoke-direct {v5, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v5, p0, Lcom/pccw/mobile/service/EchoClient;->receiveThread:Ljava/lang/Thread;

    .line 234
    iget-object v5, p0, Lcom/pccw/mobile/service/EchoClient;->receiveThread:Ljava/lang/Thread;

    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 235
    const-wide/16 v6, 0x64

    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V

    .line 236
    iget-object v5, p0, Lcom/pccw/mobile/service/EchoClient;->sendThread:Ljava/lang/Thread;

    invoke-virtual {v5}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 240
    .end local v0    # "buf":[B
    .end local v1    # "dp":Ljava/net/DatagramPacket;
    .end local v2    # "i":I
    .end local v3    # "s":Ljava/net/DatagramSocket;
    .end local v4    # "timerThread":Ljava/lang/Thread;
    :goto_1
    return-void

    .line 237
    :catch_0
    move-exception v5

    goto :goto_1
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pccw/mobile/service/EchoClient;->contRun:Z

    .line 42
    iget-object v0, p0, Lcom/pccw/mobile/service/EchoClient;->receiveThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/pccw/mobile/service/EchoClient;->receiveThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 45
    :cond_0
    return-void
.end method
