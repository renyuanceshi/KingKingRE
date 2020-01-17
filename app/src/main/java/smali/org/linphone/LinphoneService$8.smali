.class Lorg/linphone/LinphoneService$8;
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

.field final synthetic val$delay_ms:I

.field final synthetic val$pref:Landroid/preference/CheckBoxPreference;

.field final synthetic val$status:Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneService;Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;Landroid/preference/CheckBoxPreference;I)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/LinphoneService;

    .prologue
    .line 1511
    iput-object p1, p0, Lorg/linphone/LinphoneService$8;->this$0:Lorg/linphone/LinphoneService;

    iput-object p2, p0, Lorg/linphone/LinphoneService$8;->val$status:Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;

    iput-object p3, p0, Lorg/linphone/LinphoneService$8;->val$pref:Landroid/preference/CheckBoxPreference;

    iput p4, p0, Lorg/linphone/LinphoneService$8;->val$delay_ms:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1513
    iget-object v0, p0, Lorg/linphone/LinphoneService$8;->val$status:Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;

    sget-object v1, Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;->Done:Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;

    if-ne v0, v1, :cond_1

    .line 1514
    iget-object v0, p0, Lorg/linphone/LinphoneService$8;->val$pref:Landroid/preference/CheckBoxPreference;

    iget-object v1, p0, Lorg/linphone/LinphoneService$8;->this$0:Lorg/linphone/LinphoneService;

    const v2, 0x7f070245

    invoke-virtual {v1, v2}, Lorg/linphone/LinphoneService;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v2, v5, [Ljava/lang/Object;

    iget v3, p0, Lorg/linphone/LinphoneService$8;->val$delay_ms:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1515
    iget-object v0, p0, Lorg/linphone/LinphoneService$8;->val$pref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 1521
    :cond_0
    :goto_0
    return-void

    .line 1517
    :cond_1
    iget-object v0, p0, Lorg/linphone/LinphoneService$8;->val$status:Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;

    sget-object v1, Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;->Failed:Lorg/linphone/core/LinphoneCore$EcCalibratorStatus;

    if-ne v0, v1, :cond_0

    .line 1518
    iget-object v0, p0, Lorg/linphone/LinphoneService$8;->val$pref:Landroid/preference/CheckBoxPreference;

    const v1, 0x7f070247

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setSummary(I)V

    .line 1519
    iget-object v0, p0, Lorg/linphone/LinphoneService$8;->val$pref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0
.end method
