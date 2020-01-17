.class Lcom/pccw/mobile/util/PreCallQualityIndicator$3;
.super Ljava/lang/Object;
.source "PreCallQualityIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetworkQuality()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

.field final synthetic val$host_1:Ljava/lang/String;

.field final synthetic val$host_2:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/util/PreCallQualityIndicator;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 193
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    iput-object p2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->val$host_1:Ljava/lang/String;

    iput-object p3, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->val$host_2:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$700(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;[JI)J
    .locals 2
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator$3;
    .param p1, "x1"    # [J
    .param p2, "x2"    # I

    .prologue
    .line 193
    invoke-direct {p0, p1, p2}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->jitter([JI)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$800(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;[J[JII)D
    .locals 2
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator$3;
    .param p1, "x1"    # [J
    .param p2, "x2"    # [J
    .param p3, "x3"    # I
    .param p4, "x4"    # I

    .prologue
    .line 193
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->latency([J[JII)D

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$900(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;[J)[I
    .locals 1
    .param p0, "x0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator$3;
    .param p1, "x1"    # [J

    .prologue
    .line 193
    invoke-direct {p0, p1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->calcValidPacketPerSection([J)[I

    move-result-object v0

    return-object v0
.end method

.method private calcSectionSummary(I[I[J[J)[I
    .locals 14
    .param p1, "calcSection"    # I
    .param p2, "validPacketSection"    # [I
    .param p3, "sendPacketTimeArr"    # [J
    .param p4, "receivedPacketTimeArr"    # [J

    .prologue
    .line 474
    const/4 v9, 0x5

    new-array v2, v9, [I

    .line 476
    .local v2, "QUAL_SUMMARY":[I
    const/4 v3, 0x0

    .local v3, "a":I
    :goto_0
    array-length v9, v2

    if-ge v3, v9, :cond_0

    .line 477
    const/4 v9, 0x2

    aput v9, v2, v3

    .line 476
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 486
    :cond_0
    const/4 v3, 0x0

    :goto_1
    if-ge v3, p1, :cond_4

    .line 487
    aget v8, p2, v3

    .line 489
    .local v8, "packet":I
    add-int/lit8 v9, v3, 0x1

    mul-int/lit8 v9, v9, 0x14

    move-object/from16 v0, p4

    invoke-direct {p0, v0, v9}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->jitter([JI)J

    move-result-wide v10

    long-to-double v10, v10

    const-wide v12, 0x412e848000000000L    # 1000000.0

    div-double v4, v10, v12

    .line 491
    .local v4, "jitter":D
    mul-int/lit8 v9, v3, 0x14

    add-int/lit8 v10, v3, 0x1

    mul-int/lit8 v10, v10, 0x14

    add-int/lit8 v10, v10, -0x1

    move-object/from16 v0, p3

    move-object/from16 v1, p4

    invoke-direct {p0, v0, v1, v9, v10}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->latency([J[JII)D

    move-result-wide v6

    .line 494
    .local v6, "latency":D
    const/16 v9, 0xa

    if-le v8, v9, :cond_1

    const-wide/high16 v10, 0x4049000000000000L    # 50.0

    cmpl-double v9, v4, v10

    if-gez v9, :cond_1

    const-wide v10, 0x408f400000000000L    # 1000.0

    cmpl-double v9, v6, v10

    if-ltz v9, :cond_2

    .line 495
    :cond_1
    const/4 v9, 0x2

    aput v9, v2, v3

    .line 486
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 496
    :cond_2
    const/16 v9, 0x10

    if-lt v8, v9, :cond_3

    const-wide/high16 v10, 0x4039000000000000L    # 25.0

    cmpg-double v9, v4, v10

    if-gtz v9, :cond_3

    const-wide/high16 v10, 0x4079000000000000L    # 400.0

    cmpg-double v9, v6, v10

    if-gtz v9, :cond_3

    .line 497
    const/4 v9, 0x0

    aput v9, v2, v3

    goto :goto_2

    .line 499
    :cond_3
    const/4 v9, 0x1

    aput v9, v2, v3

    goto :goto_2

    .line 503
    .end local v4    # "jitter":D
    .end local v6    # "latency":D
    .end local v8    # "packet":I
    :cond_4
    return-object v2
.end method

.method private calcValidPacketPerSection([J)[I
    .locals 9
    .param p1, "receivedPacketTimeArr"    # [J

    .prologue
    const/4 v8, 0x0

    .line 435
    const/4 v3, 0x5

    new-array v2, v3, [I

    .line 436
    .local v2, "validPacketSection":[I
    const/4 v1, 0x0

    .local v1, "l":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 437
    aput v8, v2, v1

    .line 436
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 440
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, p1

    if-ge v0, v3, :cond_6

    .line 441
    aget-wide v4, p1, v0

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-eqz v3, :cond_1

    .line 442
    const/16 v3, 0x13

    if-gt v0, v3, :cond_2

    .line 443
    aget v3, v2, v8

    add-int/lit8 v3, v3, 0x1

    aput v3, v2, v8

    .line 440
    :cond_1
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 444
    :cond_2
    const/16 v3, 0x27

    if-gt v0, v3, :cond_3

    .line 445
    const/4 v3, 0x1

    aget v4, v2, v3

    add-int/lit8 v4, v4, 0x1

    aput v4, v2, v3

    goto :goto_2

    .line 446
    :cond_3
    const/16 v3, 0x3b

    if-gt v0, v3, :cond_4

    .line 447
    const/4 v3, 0x2

    aget v4, v2, v3

    add-int/lit8 v4, v4, 0x1

    aput v4, v2, v3

    goto :goto_2

    .line 448
    :cond_4
    const/16 v3, 0x4f

    if-gt v0, v3, :cond_5

    .line 449
    const/4 v3, 0x3

    aget v4, v2, v3

    add-int/lit8 v4, v4, 0x1

    aput v4, v2, v3

    goto :goto_2

    .line 451
    :cond_5
    const/4 v3, 0x4

    aget v4, v2, v3

    add-int/lit8 v4, v4, 0x1

    aput v4, v2, v3

    goto :goto_2

    .line 456
    :cond_6
    return-object v2
.end method

.method private jitter([JI)J
    .locals 16
    .param p1, "receivedPacketTimeArr"    # [J
    .param p2, "includeCount"    # I

    .prologue
    .line 572
    const-wide/16 v8, 0x0

    .line 573
    .local v8, "prevJitter":J
    const/4 v7, 0x0

    .line 574
    .local v7, "prevValidPacket":I
    const-wide/16 v2, 0x0

    .line 575
    .local v2, "currentJitter":J
    const/4 v6, 0x0

    .line 576
    .local v6, "i":I
    :goto_0
    move/from16 v0, p2

    if-ge v6, v0, :cond_3

    .line 577
    aget-wide v10, p1, v6

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-nez v10, :cond_0

    .line 578
    add-int/lit8 v6, v6, 0x1

    .line 579
    goto :goto_0

    .line 581
    :cond_0
    aget-wide v10, p1, v7

    const-wide/16 v12, 0x0

    cmp-long v10, v10, v12

    if-eqz v10, :cond_1

    sub-int v10, v6, v7

    if-nez v10, :cond_2

    .line 582
    :cond_1
    const-wide/16 v2, 0x0

    .line 590
    :goto_1
    move-wide v8, v2

    .line 591
    move v7, v6

    .line 592
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 584
    :cond_2
    aget-wide v10, p1, v6

    aget-wide v12, p1, v7

    sub-long/2addr v10, v12

    sub-int v12, v6, v7

    int-to-double v12, v12

    const-wide v14, 0x417c9c3800000000L    # 3.0E7

    mul-double/2addr v12, v14

    double-to-long v12, v12

    sub-long/2addr v10, v12

    .line 585
    invoke-static {v10, v11}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    .line 587
    .local v4, "delayTime":J
    sub-int v10, v6, v7

    int-to-long v10, v10

    div-long/2addr v4, v10

    .line 588
    sub-long v10, v4, v8

    const-wide/16 v12, 0x10

    div-long/2addr v10, v12

    add-long v2, v8, v10

    goto :goto_1

    .line 594
    .end local v4    # "delayTime":J
    :cond_3
    return-wide v2
.end method

.method private latency([J[JII)D
    .locals 14
    .param p1, "sendPacketTimeArr"    # [J
    .param p2, "receivedPacketTimeArr"    # [J
    .param p3, "startPacket"    # I
    .param p4, "endPacket"    # I

    .prologue
    .line 547
    const-wide/16 v8, 0x0

    .line 548
    .local v8, "totalLatency":D
    const/4 v5, 0x0

    .line 549
    .local v5, "validLatency":I
    move/from16 v4, p3

    .local v4, "c":I
    :goto_0
    move/from16 v0, p4

    if-gt v4, v0, :cond_1

    .line 550
    aget-wide v10, p2, v4

    aget-wide v12, p1, v4

    sub-long/2addr v10, v12

    long-to-double v10, v10

    const-wide v12, 0x412e848000000000L    # 1000000.0

    div-double v6, v10, v12

    .line 552
    .local v6, "latency":D
    const-wide/16 v10, 0x0

    cmpl-double v10, v6, v10

    if-lez v10, :cond_0

    .line 553
    add-double/2addr v8, v6

    .line 554
    add-int/lit8 v5, v5, 0x1

    .line 549
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 557
    .end local v6    # "latency":D
    :cond_1
    int-to-double v10, v5

    div-double v2, v8, v10

    .line 558
    .local v2, "avgLatency":D
    return-wide v2
.end method

.method private setTextNetworkQualitySummary(Ljava/lang/String;)V
    .locals 2
    .param p1, "displayText"    # Ljava/lang/String;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;

    invoke-direct {v1, p0, p1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 533
    return-void
.end method


# virtual methods
.method public run()V
    .locals 34

    .prologue
    .line 199
    const/4 v12, 0x0

    .line 201
    .local v12, "echoHostIP":Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$400(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/pref/EchoServerPref;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/pccw/pref/EchoServerPref;->getValidEchoServerHost()Ljava/lang/String;

    move-result-object v16

    .line 202
    .local v16, "lastValidEchoServerHost":Ljava/lang/String;
    const-string/jumbo v30, "HOST_1"

    move-object/from16 v0, v16

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_6

    const-string/jumbo v30, "HOST_2"

    .line 203
    move-object/from16 v0, v16

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v30

    if-nez v30, :cond_6

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$400(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/pref/EchoServerPref;

    move-result-object v30

    const-string/jumbo v31, "HOST_1"

    invoke-virtual/range {v30 .. v31}, Lcom/pccw/pref/EchoServerPref;->setValidEchoServerHost(Ljava/lang/String;)V

    .line 205
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->val$host_1:Ljava/lang/String;

    .line 225
    :cond_0
    :goto_0
    invoke-static {v12}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v15

    .line 226
    .local v15, "host":Ljava/net/InetAddress;
    const/16 v17, 0x2710

    .line 227
    .local v17, "port":I
    sget v30, Lcom/pccw/mobile/util/PreCallQualityIndicator;->validEchoId:I

    add-int/lit8 v30, v30, 0x1

    sput v30, Lcom/pccw/mobile/util/PreCallQualityIndicator;->validEchoId:I

    .line 228
    sget v30, Lcom/pccw/mobile/util/PreCallQualityIndicator;->validEchoId:I

    const/16 v31, 0xa

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_1

    .line 229
    const/16 v30, 0x0

    sput v30, Lcom/pccw/mobile/util/PreCallQualityIndicator;->validEchoId:I

    .line 232
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->ctx:Landroid/content/Context;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/sip/ClientStateManager;->getEncryptedPccwImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    .line 233
    .local v10, "csNum":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    new-instance v31, Lcom/pccw/mobile/service/EchoClient;

    sget v32, Lcom/pccw/mobile/util/PreCallQualityIndicator;->validEchoId:I

    move-object/from16 v0, v31

    move/from16 v1, v17

    move/from16 v2, v32

    invoke-direct {v0, v15, v1, v2, v10}, Lcom/pccw/mobile/service/EchoClient;-><init>(Ljava/net/InetAddress;IILjava/lang/String;)V

    invoke-static/range {v30 .. v31}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$502(Lcom/pccw/mobile/util/PreCallQualityIndicator;Lcom/pccw/mobile/service/EchoClient;)Lcom/pccw/mobile/service/EchoClient;

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lcom/pccw/mobile/service/EchoClient;->run()V

    .line 236
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v24

    .line 237
    .local v24, "uiStartUpdateTime":J
    const/16 v26, 0x5

    .line 238
    .local v26, "uiThreadStopSecond":I
    move/from16 v0, v26

    int-to-double v0, v0

    move-wide/from16 v30, v0

    const-wide v32, 0x41cdcd6500000000L    # 1.0E9

    mul-double v30, v30, v32

    move-wide/from16 v0, v30

    double-to-long v0, v0

    move-wide/from16 v28, v0

    .line 239
    .local v28, "uiUpdateLimitTime":J
    move/from16 v0, v26

    int-to-double v0, v0

    move-wide/from16 v30, v0

    const-wide v32, 0x41cdcd6500000000L    # 1.0E9

    mul-double v30, v30, v32

    move-wide/from16 v0, v30

    double-to-long v0, v0

    move-wide/from16 v20, v0

    .line 240
    .local v20, "uiAllowReclickTime":J
    const/4 v8, 0x0

    .line 241
    .local v8, "allowReclick":Z
    const/16 v19, 0x1

    .line 243
    .local v19, "uiRefreshTime":I
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$600(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Ljava/lang/Thread;

    move-result-object v30

    if-eqz v30, :cond_5

    .line 244
    const-wide/16 v30, 0x64

    invoke-static/range {v30 .. v31}, Ljava/lang/Thread;->sleep(J)V

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v30

    new-instance v31, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;)V

    invoke-virtual/range {v30 .. v31}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 265
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v30

    sub-long v22, v30, v24

    .line 266
    .local v22, "uiLoopTime":J
    cmp-long v30, v22, v20

    if-ltz v30, :cond_3

    if-nez v8, :cond_3

    .line 271
    const/4 v8, 0x1

    .line 273
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v30

    new-instance v31, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$2;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$2;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;)V

    invoke-virtual/range {v30 .. v31}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 284
    :cond_3
    move/from16 v0, v19

    int-to-double v0, v0

    move-wide/from16 v30, v0

    const-wide v32, 0x41cdcd6500000000L    # 1.0E9

    mul-double v30, v30, v32

    move-wide/from16 v0, v30

    double-to-long v0, v0

    move-wide/from16 v30, v0

    cmp-long v30, v22, v30

    if-ltz v30, :cond_4

    .line 287
    const/16 v30, 0x2

    move/from16 v0, v19

    move/from16 v1, v30

    if-eq v0, v1, :cond_8

    move/from16 v0, v19

    move/from16 v1, v26

    if-eq v0, v1, :cond_8

    .line 288
    add-int/lit8 v19, v19, 0x1

    .line 353
    :cond_4
    :goto_2
    cmp-long v30, v22, v28

    if-ltz v30, :cond_2

    .line 356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$600(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Ljava/lang/Thread;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Thread;->interrupt()V

    .line 357
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-static/range {v30 .. v31}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$602(Lcom/pccw/mobile/util/PreCallQualityIndicator;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v30

    new-instance v31, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;)V

    invoke-virtual/range {v30 .. v31}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 399
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput-boolean v0, v1, Lcom/pccw/mobile/util/PreCallQualityIndicator;->isUpdateIndiThreadWorking:Z
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto/16 :goto_1

    .line 402
    .end local v8    # "allowReclick":Z
    .end local v10    # "csNum":Ljava/lang/String;
    .end local v15    # "host":Ljava/net/InetAddress;
    .end local v16    # "lastValidEchoServerHost":Ljava/lang/String;
    .end local v17    # "port":I
    .end local v19    # "uiRefreshTime":I
    .end local v20    # "uiAllowReclickTime":J
    .end local v22    # "uiLoopTime":J
    .end local v24    # "uiStartUpdateTime":J
    .end local v26    # "uiThreadStopSecond":I
    .end local v28    # "uiUpdateLimitTime":J
    :catch_0
    move-exception v11

    .line 403
    .local v11, "e":Ljava/net/UnknownHostException;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v30

    new-instance v31, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$4;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$4;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;)V

    invoke-virtual/range {v30 .. v31}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 423
    .end local v11    # "e":Ljava/net/UnknownHostException;
    :cond_5
    :goto_3
    return-void

    .line 209
    .restart local v16    # "lastValidEchoServerHost":Ljava/lang/String;
    :cond_6
    :try_start_1
    const-string/jumbo v30, "HOST_1"

    move-object/from16 v0, v16

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v30

    if-eqz v30, :cond_7

    .line 210
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->val$host_1:Ljava/lang/String;

    goto/16 :goto_0

    .line 214
    :cond_7
    const-string/jumbo v30, "HOST_2"

    move-object/from16 v0, v16

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v30

    if-eqz v30, :cond_0

    .line 215
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->val$host_2:Ljava/lang/String;

    goto/16 :goto_0

    .line 290
    .restart local v8    # "allowReclick":Z
    .restart local v10    # "csNum":Ljava/lang/String;
    .restart local v15    # "host":Ljava/net/InetAddress;
    .restart local v17    # "port":I
    .restart local v19    # "uiRefreshTime":I
    .restart local v20    # "uiAllowReclickTime":J
    .restart local v22    # "uiLoopTime":J
    .restart local v24    # "uiStartUpdateTime":J
    .restart local v26    # "uiThreadStopSecond":I
    .restart local v28    # "uiUpdateLimitTime":J
    :cond_8
    const/16 v18, 0x0

    .line 291
    .local v18, "refreshCount":I
    const/16 v30, 0x2

    move/from16 v0, v19

    move/from16 v1, v30

    if-ne v0, v1, :cond_a

    .line 292
    const/16 v18, 0x1

    .line 297
    :cond_9
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v30

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->calcValidPacketPerSection([J)[I

    move-result-object v27

    .line 298
    .local v27, "validPacketSection":[I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    .line 299
    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v30

    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/pccw/mobile/service/EchoClient;->sendTimeArr:[J

    move-object/from16 v30, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v31, v0

    .line 300
    invoke-static/range {v31 .. v31}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v31

    move-object/from16 v0, v31

    iget-object v0, v0, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    move-object/from16 v31, v0

    .line 298
    move-object/from16 v0, p0

    move/from16 v1, v18

    move-object/from16 v2, v27

    move-object/from16 v3, v30

    move-object/from16 v4, v31

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->calcSectionSummary(I[I[J[J)[I

    move-result-object v6

    .line 302
    .local v6, "QUAL_SUMMARY":[I
    const/4 v9, 0x0

    .line 303
    .local v9, "badCount":I
    const/4 v13, 0x0

    .line 304
    .local v13, "fairCount":I
    const/4 v14, 0x0

    .line 308
    .local v14, "goodCount":I
    const/4 v7, 0x0

    .local v7, "a":I
    :goto_5
    move/from16 v0, v18

    if-ge v7, v0, :cond_d

    .line 309
    aget v30, v6, v7

    if-nez v30, :cond_b

    .line 311
    add-int/lit8 v14, v14, 0x1

    .line 308
    :goto_6
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 293
    .end local v6    # "QUAL_SUMMARY":[I
    .end local v7    # "a":I
    .end local v9    # "badCount":I
    .end local v13    # "fairCount":I
    .end local v14    # "goodCount":I
    .end local v27    # "validPacketSection":[I
    :cond_a
    move/from16 v0, v19

    move/from16 v1, v26

    if-ne v0, v1, :cond_9

    .line 294
    const/16 v18, 0x5

    goto :goto_4

    .line 312
    .restart local v6    # "QUAL_SUMMARY":[I
    .restart local v7    # "a":I
    .restart local v9    # "badCount":I
    .restart local v13    # "fairCount":I
    .restart local v14    # "goodCount":I
    .restart local v27    # "validPacketSection":[I
    :cond_b
    aget v30, v6, v7

    const/16 v31, 0x1

    move/from16 v0, v30

    move/from16 v1, v31

    if-ne v0, v1, :cond_c

    .line 314
    add-int/lit8 v13, v13, 0x1

    goto :goto_6

    .line 317
    :cond_c
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 325
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v30

    move-object/from16 v0, v30

    iget v0, v0, Lcom/pccw/mobile/service/EchoClient;->validPacket:I

    move/from16 v30, v0

    if-nez v30, :cond_f

    .line 327
    const-string/jumbo v30, "Error"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V

    .line 348
    :cond_e
    :goto_7
    add-int/lit8 v19, v19, 0x1

    goto/16 :goto_2

    .line 328
    :cond_f
    const/16 v30, 0x3

    move/from16 v0, v30

    if-lt v9, v0, :cond_10

    .line 329
    const-string/jumbo v30, "BAD"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_7

    .line 412
    .end local v6    # "QUAL_SUMMARY":[I
    .end local v7    # "a":I
    .end local v8    # "allowReclick":Z
    .end local v9    # "badCount":I
    .end local v10    # "csNum":Ljava/lang/String;
    .end local v13    # "fairCount":I
    .end local v14    # "goodCount":I
    .end local v15    # "host":Ljava/net/InetAddress;
    .end local v16    # "lastValidEchoServerHost":Ljava/lang/String;
    .end local v17    # "port":I
    .end local v18    # "refreshCount":I
    .end local v19    # "uiRefreshTime":I
    .end local v20    # "uiAllowReclickTime":J
    .end local v22    # "uiLoopTime":J
    .end local v24    # "uiStartUpdateTime":J
    .end local v26    # "uiThreadStopSecond":I
    .end local v27    # "validPacketSection":[I
    .end local v28    # "uiUpdateLimitTime":J
    :catch_1
    move-exception v11

    .line 413
    .local v11, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    move-object/from16 v30, v0

    invoke-static/range {v30 .. v30}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v30

    new-instance v31, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$5;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$5;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;)V

    invoke-virtual/range {v30 .. v31}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_3

    .line 330
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v6    # "QUAL_SUMMARY":[I
    .restart local v7    # "a":I
    .restart local v8    # "allowReclick":Z
    .restart local v9    # "badCount":I
    .restart local v10    # "csNum":Ljava/lang/String;
    .restart local v13    # "fairCount":I
    .restart local v14    # "goodCount":I
    .restart local v15    # "host":Ljava/net/InetAddress;
    .restart local v16    # "lastValidEchoServerHost":Ljava/lang/String;
    .restart local v17    # "port":I
    .restart local v18    # "refreshCount":I
    .restart local v19    # "uiRefreshTime":I
    .restart local v20    # "uiAllowReclickTime":J
    .restart local v22    # "uiLoopTime":J
    .restart local v24    # "uiStartUpdateTime":J
    .restart local v26    # "uiThreadStopSecond":I
    .restart local v27    # "validPacketSection":[I
    .restart local v28    # "uiUpdateLimitTime":J
    :cond_10
    const/16 v30, 0x3

    move/from16 v0, v30

    if-lt v13, v0, :cond_11

    .line 331
    :try_start_2
    const-string/jumbo v30, "FAIR"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V

    goto :goto_7

    .line 332
    :cond_11
    const/16 v30, 0x3

    move/from16 v0, v30

    if-lt v14, v0, :cond_12

    .line 333
    const-string/jumbo v30, "GOOD"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V

    goto :goto_7

    .line 334
    :cond_12
    const/16 v30, 0x2

    move/from16 v0, v30

    if-lt v9, v0, :cond_13

    .line 335
    const-string/jumbo v30, "BAD"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V

    goto :goto_7

    .line 336
    :cond_13
    const/16 v30, 0x2

    move/from16 v0, v30

    if-lt v13, v0, :cond_14

    .line 337
    const-string/jumbo v30, "FAIR"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V

    goto :goto_7

    .line 338
    :cond_14
    const/16 v30, 0x2

    move/from16 v0, v30

    if-lt v14, v0, :cond_15

    .line 339
    const-string/jumbo v30, "GOOD"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 340
    :cond_15
    const/16 v30, 0x1

    move/from16 v0, v30

    if-lt v9, v0, :cond_16

    .line 341
    const-string/jumbo v30, "BAD"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 342
    :cond_16
    const/16 v30, 0x1

    move/from16 v0, v30

    if-lt v13, v0, :cond_17

    .line 343
    const-string/jumbo v30, "FAIR"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V

    goto/16 :goto_7

    .line 344
    :cond_17
    const/16 v30, 0x1

    move/from16 v0, v30

    if-lt v14, v0, :cond_e

    .line 345
    const-string/jumbo v30, "GOOD"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_7
.end method
