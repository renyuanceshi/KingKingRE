.class Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1$1;
.super Ljava/lang/Object;
.source "PreCallQualityIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;)V
    .locals 0
    .param p1, "this$2"    # Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1$1;->this$2:Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1$1;->this$2:Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1$1;->this$1:Lcom/pccw/mobile/util/PreCallQualityIndicator$1;

    iget-object v0, v0, Lcom/pccw/mobile/util/PreCallQualityIndicator$1;->this$0:Lcom/pccw/mobile/util/PreCallQualityIndicator;

    invoke-virtual {v0}, Lcom/pccw/mobile/util/PreCallQualityIndicator;->restoreNetworkIndiToDefault()V

    .line 86
    return-void
.end method
