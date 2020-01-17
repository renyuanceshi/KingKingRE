.class Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;
.super Ljava/lang/Object;
.source "EnhancedPrepaidRegistrationActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->afterApiRequest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

.field final synthetic val$errMsg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    .prologue
    .line 462
    iput-object p1, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    iput-object p2, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;->val$errMsg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 465
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 467
    .local v1, "errorDialogBuilder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f020436

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07006a

    .line 468
    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;->val$errMsg:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 469
    const v2, 0x104000a

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 470
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 471
    .local v0, "errorDialog":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 475
    iget-object v2, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$000(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setEnabled(Z)V

    .line 476
    iget-object v2, p0, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity$3;->this$0:Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;

    invoke-static {v2}, Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;->access$400(Lcom/pccw/mobile/sip/EnhancedPrepaidRegistrationActivity;)Landroid/widget/Button;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setEnabled(Z)V

    .line 477
    return-void
.end method
