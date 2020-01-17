.class Lcom/pccw/dialog/AlertSMSConsumeDialog$2;
.super Ljava/lang/Object;
.source "AlertSMSConsumeDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/dialog/AlertSMSConsumeDialog;->setNegativeButton()V
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
    .line 57
    iput-object p1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$2;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 61
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$2;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$2;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    iget-object v1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog$2;->this$0:Lcom/pccw/dialog/AlertSMSConsumeDialog;

    invoke-interface {v0, v1}, Lcom/pccw/dialog/listener/IKKDialogOnClickListener;->onClickKKDialogNegativeButton(Lcom/pccw/dialog/KKDialog;)V

    .line 64
    :cond_0
    return-void
.end method
