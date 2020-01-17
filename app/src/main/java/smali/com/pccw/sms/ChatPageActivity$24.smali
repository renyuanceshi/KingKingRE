.class Lcom/pccw/sms/ChatPageActivity$24;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->makeVoiceCall(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/ChatPageActivity;

.field final synthetic val$doNotShowAgainBox:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/pccw/sms/ChatPageActivity;Landroid/widget/CheckBox;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 1505
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$24;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iput-object p2, p0, Lcom/pccw/sms/ChatPageActivity$24;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1508
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$24;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1509
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$24;->this$0:Lcom/pccw/sms/ChatPageActivity;

    .line 1511
    invoke-virtual {v0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 1510
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1512
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "SHOW_IDD_CHARGE_MESSAGE"

    const/4 v2, 0x0

    .line 1513
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1514
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 1516
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 1517
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$24;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$3700(Lcom/pccw/sms/ChatPageActivity;Ljava/lang/String;)V

    .line 1518
    return-void
.end method
