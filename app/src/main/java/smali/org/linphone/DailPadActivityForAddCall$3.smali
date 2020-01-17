.class Lorg/linphone/DailPadActivityForAddCall$3;
.super Ljava/lang/Object;
.source "DailPadActivityForAddCall.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/linphone/DailPadActivityForAddCall;->performCall()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/linphone/DailPadActivityForAddCall;

.field final synthetic val$doNotShowAgainBox:Landroid/widget/CheckBox;


# direct methods
.method constructor <init>(Lorg/linphone/DailPadActivityForAddCall;Landroid/widget/CheckBox;)V
    .locals 0
    .param p1, "this$0"    # Lorg/linphone/DailPadActivityForAddCall;

    .prologue
    .line 523
    iput-object p1, p0, Lorg/linphone/DailPadActivityForAddCall$3;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    iput-object p2, p0, Lorg/linphone/DailPadActivityForAddCall$3;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 526
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall$3;->val$doNotShowAgainBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 527
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall$3;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    iget-object v0, v0, Lorg/linphone/DailPadActivityForAddCall;->ctx:Landroid/content/Context;

    .line 528
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 529
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "SHOW_IDD_CHARGE_MESSAGE"

    const/4 v2, 0x0

    .line 530
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 531
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 533
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 534
    iget-object v0, p0, Lorg/linphone/DailPadActivityForAddCall$3;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    iget-object v1, p0, Lorg/linphone/DailPadActivityForAddCall$3;->this$0:Lorg/linphone/DailPadActivityForAddCall;

    .line 535
    invoke-static {v1}, Lorg/linphone/DailPadActivityForAddCall;->access$200(Lorg/linphone/DailPadActivityForAddCall;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    .line 536
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 534
    invoke-static {v0, v1}, Lorg/linphone/DailPadActivityForAddCall;->access$300(Lorg/linphone/DailPadActivityForAddCall;Ljava/lang/String;)V

    .line 537
    return-void
.end method
