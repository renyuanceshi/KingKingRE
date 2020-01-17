.class Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;
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
    .line 359
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 362
    iget-object v5, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v5, v5, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v5}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v5

    iget v5, v5, Lcom/pccw/mobile/service/EchoClient;->validPacket:I

    if-nez v5, :cond_0

    .line 363
    iget-object v5, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v5, v5, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v5}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$400(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/pref/EchoServerPref;

    move-result-object v5

    invoke-virtual {v5}, Lcom/pccw/pref/EchoServerPref;->getValidEchoServerHost()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "HOST_1"

    .line 364
    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 369
    iget-object v5, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v5, v5, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v5}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$400(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/pref/EchoServerPref;

    move-result-object v5

    const-string/jumbo v6, "HOST_2"

    invoke-virtual {v5, v6}, Lcom/pccw/pref/EchoServerPref;->setValidEchoServerHost(Ljava/lang/String;)V

    .line 380
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v6, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v6, v6, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v6}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v6

    iget-object v6, v6, Lcom/pccw/mobile/service/EchoClient;->sendTimeArr:[J

    iget-object v7, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v7, v7, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .line 381
    invoke-static {v7}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v7

    iget-object v7, v7, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v9, v9, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .line 382
    invoke-static {v9}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v9

    iget-object v9, v9, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    array-length v9, v9

    add-int/lit8 v9, v9, -0x1

    .line 380
    invoke-static {v5, v6, v7, v8, v9}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->access$800(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;[J[JII)D

    move-result-wide v0

    .line 386
    .local v0, "avgLatency":D
    iget-object v5, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v6, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v6, v6, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v6}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$500(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/mobile/service/EchoClient;

    move-result-object v6

    iget-object v6, v6, Lcom/pccw/mobile/service/EchoClient;->receiveTimeArr:[J

    invoke-static {v5, v6}, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->access$900(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;[J)[I

    move-result-object v4

    .line 388
    .local v4, "validPacketSection":[I
    const-string/jumbo v3, ""

    .line 389
    .local v3, "outStr":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "l":I
    :goto_1
    array-length v5, v4

    if-ge v2, v5, :cond_3

    .line 390
    const/4 v5, 0x4

    if-eq v2, v5, :cond_2

    .line 391
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v6, v4, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 389
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 370
    .end local v0    # "avgLatency":D
    .end local v2    # "l":I
    .end local v3    # "outStr":Ljava/lang/String;
    .end local v4    # "validPacketSection":[I
    :cond_1
    iget-object v5, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v5, v5, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v5}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$400(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/pref/EchoServerPref;

    move-result-object v5

    invoke-virtual {v5}, Lcom/pccw/pref/EchoServerPref;->getValidEchoServerHost()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "HOST_2"

    .line 371
    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 375
    iget-object v5, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$3;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v5, v5, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v5}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$400(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Lcom/pccw/pref/EchoServerPref;

    move-result-object v5

    const-string/jumbo v6, "HOST_1"

    invoke-virtual {v5, v6}, Lcom/pccw/pref/EchoServerPref;->setValidEchoServerHost(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 393
    .restart local v0    # "avgLatency":D
    .restart local v2    # "l":I
    .restart local v3    # "outStr":Ljava/lang/String;
    .restart local v4    # "validPacketSection":[I
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget v6, v4, v2

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 397
    :cond_3
    return-void
.end method
