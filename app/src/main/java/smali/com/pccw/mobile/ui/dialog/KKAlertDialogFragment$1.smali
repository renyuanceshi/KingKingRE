.class Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$1;
.super Ljava/lang/Object;
.source "KKAlertDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;

.field final synthetic val$id:I


# direct methods
.method constructor <init>(Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$1;->this$0:Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;

    iput p2, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$1;->val$id:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$1;->this$0:Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;

    invoke-virtual {v0}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->getTargetFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$KKDialogResponses;

    iget v1, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$1;->val$id:I

    invoke-interface {v0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$KKDialogResponses;->doPositiveClick(I)V

    .line 94
    return-void
.end method
