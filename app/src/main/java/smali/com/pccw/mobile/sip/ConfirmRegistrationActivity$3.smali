.class Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;
.super Ljava/lang/Object;
.source "ConfirmRegistrationActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->afterApiRequest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

.field final synthetic val$errMsg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    .prologue
    .line 313
    iput-object p1, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    iput-object p2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;->val$errMsg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 316
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 318
    .local v1, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f020436

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07006a

    .line 319
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;->val$errMsg:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 321
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 324
    .local v0, "errorDialog":Landroid/app/AlertDialog;
    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->access$300(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 325
    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->access$400(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 326
    iget-object v2, p0, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;->access$500(Lcom/pccw/mobile/sip/ConfirmRegistrationActivity;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 328
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 329
    return-void
.end method
