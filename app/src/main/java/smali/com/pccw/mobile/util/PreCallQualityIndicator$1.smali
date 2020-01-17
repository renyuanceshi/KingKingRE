.class Lcom/pccw/mobile/util/PreCallQualityIndicator$1;
.super Ljava/util/TimerTask;
.source "PreCallQualityIndicator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/util/PreCallQualityIndicator;->startPreCallQI()V
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
    .line 61
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-static {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->access$000(Lcom/pccw/mobile/util/PreCallQualityIndicator;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;

    invoke-direct {v1, p0}, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;-><init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 101
    return-void
.end method
