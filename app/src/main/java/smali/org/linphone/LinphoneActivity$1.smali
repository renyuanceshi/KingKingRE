.class Lorg/linphone/LinphoneActivity$1;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneActivity;->startProxymitySensor()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/LinphoneActivity;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneActivity;

    .prologue
    .line 617
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$1;->this$0:Lorg/linphone/LinphoneActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 636
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 7
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v6, 0x0

    .line 619
    iget-wide v2, p1, Landroid/hardware/SensorEvent;->timestamp:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 633
    :goto_0
    return-void

    .line 625
    :cond_0
    const/high16 v0, 0x40a00000    # 5.0f

    .line 626
    .local v0, "PROXIMITY_THRESHOLD":F
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v2, v6

    .line 627
    .local v1, "distance":F
    float-to-double v2, v1

    const-wide/16 v4, 0x0

    cmpl-double v2, v2, v4

    if-ltz v2, :cond_1

    const/high16 v2, 0x40a00000    # 5.0f

    cmpg-float v2, v1, v2

    if-gez v2, :cond_1

    iget-object v2, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    .line 628
    invoke-virtual {v2}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v2

    cmpg-float v2, v1, v2

    if-gez v2, :cond_1

    .line 629
    invoke-static {}, Lorg/linphone/LinphoneActivity;->instance()Lorg/linphone/LinphoneActivity;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/linphone/LinphoneActivity;->hideScreen(Z)V

    goto :goto_0

    .line 631
    :cond_1
    invoke-static {}, Lorg/linphone/LinphoneActivity;->instance()Lorg/linphone/LinphoneActivity;

    move-result-object v2

    invoke-virtual {v2, v6}, Lorg/linphone/LinphoneActivity;->hideScreen(Z)V

    goto :goto_0
.end method
