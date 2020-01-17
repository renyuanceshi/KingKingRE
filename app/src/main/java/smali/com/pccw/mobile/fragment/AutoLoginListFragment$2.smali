.class Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;
.super Ljava/lang/Object;
.source "AutoLoginListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/fragment/AutoLoginListFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 162
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-virtual {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 163
    .local v1, "dialogBuilder":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-virtual {v2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const v3, 0x7f07006a

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 164
    const v2, 0x7f020436

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 165
    iget-object v2, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    const v3, 0x7f07006c

    .line 166
    invoke-virtual {v2, v3}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-static {v5}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->access$100(Lcom/pccw/mobile/fragment/AutoLoginListFragment;)Landroid/widget/TextView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 167
    const v2, 0x104000a

    new-instance v3, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;

    invoke-direct {v3, p0}, Lcom/pccw/mobile/fragment/AutoLoginListFragment$2$1;-><init>(Lcom/pccw/mobile/fragment/AutoLoginListFragment$2;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 202
    const/high16 v2, 0x1040000

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 204
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 205
    .local v0, "confirmDialog":Landroid/app/AlertDialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 207
    return-void
.end method
