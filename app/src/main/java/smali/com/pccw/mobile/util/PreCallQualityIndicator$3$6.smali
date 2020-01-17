.class Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;
.super Ljava/lang/Object;
.source "PreCallQualityIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->setTextNetworkQualitySummary(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

.field final synthetic val$displayText:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$3;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    .prologue
    .line 513
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iput-object p2, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;->val$displayText:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 516
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 517
    .local v0, "msg":Landroid/os/Message;
    const/16 v1, 0x3e8

    iput v1, v0, Landroid/os/Message;->what:I

    .line 520
    iget-object v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;->val$displayText:Ljava/lang/String;

    const-string/jumbo v2, "GOOD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 521
    const-string/jumbo v1, "GOOD"

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 530
    :goto_0
    iget-object v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$3;

    iget-object v1, v1, Lcom/pccw/mobile/util/PreCallQualityIndicator$3;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v1}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$1000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 531
    return-void

    .line 522
    :cond_0
    iget-object v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;->val$displayText:Ljava/lang/String;

    const-string/jumbo v2, "FAIR"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 523
    const-string/jumbo v1, "FAIR"

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    goto :goto_0

    .line 524
    :cond_1
    iget-object v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$3$6;->val$displayText:Ljava/lang/String;

    const-string/jumbo v2, "BAD"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 525
    const-string/jumbo v1, "BAD"

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    goto :goto_0

    .line 527
    :cond_2
    const-string/jumbo v1, "UNKNOWN"

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    goto :goto_0
.end method
