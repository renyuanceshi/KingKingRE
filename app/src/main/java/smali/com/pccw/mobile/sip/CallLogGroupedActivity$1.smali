.class Lcom/pccw/mobile/sip/CallLogGroupedActivity$1;
.super Ljava/lang/Object;
.source "CallLogGroupedActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CallLogGroupedActivity;->makeVoiceCall(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

.field final synthetic val$doNotShowAgainBox:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Landroid/widget/CheckBox;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$1;->this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$1;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 241
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$1;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$1;->this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    .line 244
    invoke-virtual {v0}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 243
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 245
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "SHOW_IDD_CHARGE_MESSAGE"

    const/4 v2, 0x0

    .line 246
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 247
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 249
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 250
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogGroupedActivity$1;->this$0:Lcom/pccw/mobile/sip/CallLogGroupedActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/CallLogGroupedActivity;->access$000(Lcom/pccw/mobile/sip/CallLogGroupedActivity;Ljava/lang/String;)V

    .line 251
    return-void
.end method
