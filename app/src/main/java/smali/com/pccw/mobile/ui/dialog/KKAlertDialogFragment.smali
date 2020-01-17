.class public Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "KKAlertDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$KKDialogResponses;
    }
.end annotation


# static fields
.field private static final KEY_DIALOG_ID:Ljava/lang/String; = "DIALOG_ID"


# instance fields
.field msg:Ljava/lang/String;

.field negativeBtnListener:Landroid/content/DialogInterface$OnClickListener;

.field negativeBtnText:Ljava/lang/String;

.field neutralBtnListener:Landroid/content/DialogInterface$OnClickListener;

.field neutralBtnText:Ljava/lang/String;

.field positiveBtnListener:Landroid/content/DialogInterface$OnClickListener;

.field positiveBtnText:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(I)Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;
    .locals 3
    .param p0, "id"    # I

    .prologue
    .line 34
    new-instance v0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;

    invoke-direct {v0}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;-><init>()V

    .line 35
    .local v0, "alertDialogFragment":Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 36
    .local v1, "arguments":Landroid/os/Bundle;
    const-string/jumbo v2, "DIALOG_ID"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 37
    invoke-virtual {v0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 38
    return-object v0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 81
    invoke-virtual {p0}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "DIALOG_ID"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 83
    .local v1, "id":I
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 85
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const v2, 0x7f07006a

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 86
    iget-object v2, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->msg:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 87
    iget-object v2, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->positiveBtnText:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 88
    iget-object v2, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->positiveBtnText:Ljava/lang/String;

    new-instance v3, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$1;

    invoke-direct {v3, p0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$1;-><init>(Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;I)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 97
    :cond_0
    iget-object v2, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->negativeBtnText:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 98
    iget-object v2, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->negativeBtnText:Ljava/lang/String;

    new-instance v3, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$2;

    invoke-direct {v3, p0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$2;-><init>(Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;I)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 107
    :cond_1
    iget-object v2, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->neutralBtnText:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 108
    iget-object v2, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->negativeBtnText:Ljava/lang/String;

    new-instance v3, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$3;

    invoke-direct {v3, p0, v1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment$3;-><init>(Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;I)V

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 118
    :cond_2
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    return-object v2
.end method

.method public setMessage(I)V
    .locals 1
    .param p1, "textId"    # I

    .prologue
    .line 42
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->msg:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->msg:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setNegativeButton(I)V
    .locals 1
    .param p1, "textId"    # I

    .prologue
    .line 58
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->negativeBtnText:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public setNegativeButton(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->negativeBtnText:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setNeutralButton(I)V
    .locals 1
    .param p1, "textId"    # I

    .prologue
    .line 66
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->neutralBtnText:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setNeutralButton(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->neutralBtnText:Ljava/lang/String;

    .line 71
    return-void
.end method

.method public setPositiveButton(I)V
    .locals 1
    .param p1, "textId"    # I

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->positiveBtnText:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public setPositiveButton(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/pccw/mobile/ui/dialog/KKAlertDialogFragment;->positiveBtnText:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setStyle(II)V
    .locals 0
    .param p1, "style"    # I
    .param p2, "theme"    # I

    .prologue
    .line 75
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    .line 76
    return-void
.end method
