.class Lcom/pccw/dialog/AlertKKisOffDialog$2;
.super Ljava/lang/Object;
.source "AlertKKisOffDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/dialog/AlertKKisOffDialog;->setNegativeButton()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/dialog/AlertKKisOffDialog;


# direct methods
.method constructor <init>(Lcom/pccw/dialog/AlertKKisOffDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/dialog/AlertKKisOffDialog;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/pccw/dialog/AlertKKisOffDialog$2;->this$0:Lcom/pccw/dialog/AlertKKisOffDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 50
    iget-object v0, p0, Lcom/pccw/dialog/AlertKKisOffDialog$2;->this$0:Lcom/pccw/dialog/AlertKKisOffDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertKKisOffDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/pccw/dialog/AlertKKisOffDialog$2;->this$0:Lcom/pccw/dialog/AlertKKisOffDialog;

    iget-object v0, v0, Lcom/pccw/dialog/AlertKKisOffDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    iget-object v1, p0, Lcom/pccw/dialog/AlertKKisOffDialog$2;->this$0:Lcom/pccw/dialog/AlertKKisOffDialog;

    invoke-interface {v0, v1}, Lcom/pccw/dialog/listener/IKKDialogOnClickListener;->onClickKKDialogNegativeButton(Lcom/pccw/dialog/KKDialog;)V

    .line 53
    :cond_0
    return-void
.end method
