.class Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;
.super Ljava/lang/Object;
.source "PreCallQualityIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    .prologue
    .line 246
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .prologue
    .line 249
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v9, v9, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v9}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v9

    iget v9, v9, Lcom/pccw/mobile/service/EchoClient;->validPacket:I

    int-to-double v10, v9

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v9, v9, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v9}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v9

    iget v9, v9, Lcom/pccw/mobile/service/EchoClient;->retryTime:I

    int-to-double v12, v9

    div-double/2addr v10, v12

    const-wide/high16 v12, 0x4059000000000000L    # 100.0

    mul-double v6, v10, v12

    .line 250
    .local v6, "validPackPercent":D
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "%.1f"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    .line 251
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "%"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 252
    .local v8, "validPackPercentStr":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "%.2f"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v13, v13, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .line 253
    invoke-static {v13}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v13

    iget-wide v14, v13, Lcom/pccw/mobile/service/EchoClient;->elapsedTime:J

    long-to-double v14, v14

    const-wide v16, 0x41cdcd6500000000L    # 1.0E9

    div-double v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    aput-object v13, v11, v12

    .line 252
    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "s"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 254
    .local v2, "elapsedTimeStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v10, v10, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v10}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v10

    iget-object v10, v10, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v11, v11, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .line 255
    invoke-static {v11}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v11

    iget-object v11, v11, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    array-length v11, v11

    .line 254
    invoke-static {v9, v10, v11}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->access$700(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;[JI)J

    move-result-wide v10

    long-to-double v10, v10

    const-wide v12, 0x412e848000000000L    # 1000000.0

    div-double v4, v10, v12

    .line 256
    .local v4, "jitterTime":D
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "%.1f"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "ms"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 257
    .local v3, "jitterTimeStr":Ljava/lang/String;
    const-wide v10, 0x3fb999999999999aL    # 0.1

    cmpg-double v9, v4, v10

    if-ltz v9, :cond_0

    const-wide/high16 v10, 0x3ff0000000000000L    # 1.0

    cmpg-double v9, v6, v10

    if-gtz v9, :cond_1

    .line 258
    :cond_0
    const-string/jumbo v3, "---ms"

    .line 262
    :cond_1
    return-void
.end method
