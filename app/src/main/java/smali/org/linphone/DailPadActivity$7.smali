.class Lorg/linphone/DailPadActivity$7;
.super Ljava/lang/Object;
.source "DailPadActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivity;->performCall(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivity;

.field final synthetic val$doNotShowAgainBox:Landroid/widget/CheckBox;

.field final synthetic val$videoEnable:Z


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivity;Landroid/widget/CheckBox;Z)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivity;

    .prologue
    .line 833
    iput-object p1, p0, Lorg/linphone/DailPadActivity$7;->this$0:Lorg/linphone/DailPadActivity;

    iput-object p2, p0, Lorg/linphone/DailPadActivity$7;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    iput-boolean p3, p0, Lorg/linphone/DailPadActivity$7;->val$videoEnable:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 836
    iget-object v0, p0, Lorg/linphone/DailPadActivity$7;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 837
    iget-object v0, p0, Lorg/linphone/DailPadActivity$7;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v0, v0, Lorg/linphone/DailPadActivity;->ctx:Landroid/content/Context;

    .line 838
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 839
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "SHOW_IDD_CHARGE_MESSAGE"

    const/4 v2, 0x0

    .line 840
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 841
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 843
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 844
    iget-object v0, p0, Lorg/linphone/DailPadActivity$7;->this$0:Lorg/linphone/DailPadActivity;

    iget-object v1, p0, Lorg/linphone/DailPadActivity$7;->this$0:Lorg/linphone/DailPadActivity;

    .line 845
    invoke-static {v1}, Lorg/linphone/DailPadActivity;->access$300(Lorg/linphone/DailPadActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 846
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lorg/linphone/DailPadActivity$7;->val$videoEnable:Z

    .line 844
    invoke-static {v0, v1, v2}, Lorg/linphone/DailPadActivity;->access$1000(Lorg/linphone/DailPadActivity;Ljava/lang/String;Z)V

    .line 847
    return-void
.end method
