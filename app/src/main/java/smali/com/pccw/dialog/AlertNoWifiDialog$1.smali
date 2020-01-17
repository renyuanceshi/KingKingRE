.class Lcom/pccw/dialog/AlertNoWifiDialog$1;
.super Ljava/lang/Object;
.source "AlertNoWifiDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/dialog/AlertNoWifiDialog;->setPositiveButton()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/dialog/AlertNoWifiDialog;


# direct methods
.method constructor <init>(Lcom/pccw/dialog/AlertNoWifiDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/dialog/AlertNoWifiDialog;

    .prologue
    .line 33
    iput-object p1, p0, Lcom/pccw/dialog/AlertNoWifiDialog$1;->this$0:Lcom/pccw/dialog/AlertNoWifiDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 37
    iget-object v0, p0, Lcom/pccw/dialog/AlertNoWifiDialog$1;->this$0:Lcom/pccw/dialog/AlertNoWifiDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertNoWifiDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/pccw/dialog/AlertNoWifiDialog$1;->this$0:Lcom/pccw/dialog/AlertNoWifiDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertNoWifiDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    iget-object v1, p0, Lcom/pccw/dialog/AlertNoWifiDialog$1;->this$0:Lcom/pccw/dialog/AlertNoWifiDialog;

    invoke-interface {v0, v1}, Lcom/pccw/dialog/listener/IKKDialogOnClickListener;->onClickKKDialogPositiveButton(Lcom/pccw/dialog/KKDialog;)V

    .line 40
    :cond_0
    return-void
.end method
