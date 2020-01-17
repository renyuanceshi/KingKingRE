.class Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$4;
.super Ljava/lang/Object;
.source "LinphoneActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

.field final synthetic val$doNotShowAgainBox:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;Landroid/widget/CheckBox;)V
    .locals 0
    .param p1, "this$2"    # Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    .prologue
    .line 939
    iput-object p1, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$4;->this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    iput-object p2, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$4;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 944
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$4;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 945
    iget-object v0, p0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1$4;->this$2:Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;

    iget-object v0, v0, Lorg/linphone/LinphoneActivity$LoginErrorWarningReceiver$1;->val$ctx:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "SHOW_DAYPASS_MESSAGE"

    const/4 v2, 0x0

    .line 946
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 947
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 949
    :cond_0
    invoke-static {}, Lcom/pccw/mobile/sip/service/MobileSipService;->getInstance()Lcom/pccw/mobile/sip/service/MobileSipService;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/pccw/mobile/sip/service/MobileSipService;->dayPassAlertOKClicked:Z

    .line 950
    invoke-static {}, Lorg/linphone/DailPadActivity;->getDailPad()Lorg/linphone/DailPadActivity;

    move-result-object v0

    invoke-virtual {v0}, Lorg/linphone/DailPadActivity;->contTurnOnRS()V

    .line 951
    return-void
.end method
