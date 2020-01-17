.class Lcom/pccw/mobile/util/PreCallQualityIndicator$2;
.super Ljava/lang/Object;
.source "PreCallQualityIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/util/PreCallQualityIndicator;->checkNetworkQualityPauseTime()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/util/PreCallQualityIndicator;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/util/PreCallQualityIndicator;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$2;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 143
    const/4 v1, 0x5

    .line 144
    .local v1, "uiThreadStopSecond":I
    int-to-double v8, v1

    const-wide v10, 0x41cdcd6500000000L    # 1.0E9

    mul-double/2addr v8, v10

    double-to-long v6, v8

    .line 145
    .local v6, "uiUpdateLimitTime":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 147
    .local v4, "uiStartUpdateTime":J
    :cond_0
    :goto_0
    iget-object v8, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$2;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v8}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$300(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Ljava/lang/Thread;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 149
    const-wide/16 v8, 0x3e8

    :try_start_0
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    :goto_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    sub-long v2, v8, v4

    .line 156
    .local v2, "uiLoopTime":J
    cmp-long v8, v2, v6

    if-ltz v8, :cond_0

    .line 158
    iget-object v8, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$2;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v8}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$300(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Ljava/lang/Thread;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 159
    iget-object v8, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$2;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v8}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$300(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->interrupt()V

    .line 160
    iget-object v8, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$2;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    const/4 v9, 0x0

    invoke-static {v8, v9}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$302(Lcom/pccw/mobile/util/PreCallQualityIndicator;Ljava/lang/Thread;)Ljava/lang/Thread;

    .line 162
    :cond_1
    iget-object v8, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$2;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    const/4 v9, 0x0

    iput-boolean v9, v8, Lcom/pccw/mobile/util/PreCallQualityIndicator;->isUpdateIndiThreadWorking:Z

    goto :goto_0

    .line 150
    .end local v2    # "uiLoopTime":J
    :catch_0
    move-exception v0

    .line 152
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 166
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_2
    return-void
.end method
