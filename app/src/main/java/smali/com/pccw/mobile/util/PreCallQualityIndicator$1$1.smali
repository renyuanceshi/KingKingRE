.class Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;
.super Ljava/lang/Object;
.source "PreCallQualityIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    iget-boolean v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->keepLoopingIndicator:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    iget-boolean v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->isUpdateIndiThreadWorking:Z

    if-eqz v0, :cond_1

    .line 98
    :cond_0
    :goto_0
    return-void

    .line 76
    :cond_1
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator;->isUpdateIndiThreadWorking:Z

    .line 81
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    iget-object v1, v1, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    iget-object v1, v1, Lcom/pccw/mobile/util/PreCallQualityIndicator;->ctx:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/service/MobileSipService;->isNetworkAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 82
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1$1;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1$1;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 91
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$100(Lcom/pccw/mobile/util/PreCallQualityIndicator;)V

    goto :goto_0

    .line 96
    :cond_2
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$200(Lcom/pccw/mobile/util/PreCallQualityIndicator;)V

    goto :goto_0
.end method
