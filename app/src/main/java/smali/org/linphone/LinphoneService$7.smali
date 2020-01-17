.class Lorg/linphone/LinphoneService$7;
.super Ljava/lang/Object;
.source "LinphoneService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneService;->ecCalibrationStatus(Lorg/linphone/core/LinphoneCore;Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;ILjava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneService;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneService;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 1497
    iput-object p1, p0, Lorg/linphone/LinphoneService$7;->this$0:Lorg/linphone/LinphoneService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1501
    iget-object v0, p0, Lorg/linphone/LinphoneService$7;->this$0:Lorg/linphone/LinphoneService;

    const-string/jumbo v1, "Calibration failed"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1502
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1503
    return-void
.end method
