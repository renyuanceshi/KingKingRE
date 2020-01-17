.class Lcom/pccw/dialog/AlertSMSConsumeDialog$1;
.super Ljava/lang/Object;
.source "AlertSMSConsumeDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/dialog/AlertSMSConsumeDialog;->setPositiveButton()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;


# direct methods
.method constructor <init>(Lcom/pccw/dialog/AlertSMSConsumeDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/dialog/AlertSMSConsumeDialog;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$1;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 45
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$1;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    invoke-static {v0}, Lcom/pccw/dialog/AlertSMSConsumeDialog;->access$000(Lcom/pccw/dialog/AlertSMSConsumeDialog;)Landroid/widget/CheckBox;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$1;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/mobile/sip/ClientStateManager;->setSMSConsumeWarmingCheckBoxStatus(Landroid/content/Context;)Z

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$1;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    if-eqz v0, :cond_1

    .line 49
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$1;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    iget-object v1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$1;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    invoke-interface {v0, v1}, Lcom/pccw/dialog/listener/IKKDialogOnClickListener;->onClickKKDialogPositiveButton(Lcom/pccw/dialog/KKDialog;)V

    .line 51
    :cond_1
    return-void
.end method
