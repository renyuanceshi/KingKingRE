.class public Lcom/pccw/dialog/AlertKKisOffDialog;
.super Lcom/pccw/dialog/KKDialog;
.source "AlertKKisOffDialog.java"


# instance fields
.field listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/pccw/dialog/KKDialog;-><init>()V

    .line 13
    sget-object v0, Lcom/pccw/dialog/EnumKKDialogType;->AlertKKisOffDialog:Lcom/pccw/dialog/EnumKKDialogType;

    iput-object v0, p0, Lcom/pccw/dialog/AlertKKisOffDialog;->dialogType:Lcom/pccw/dialog/EnumKKDialogType;

    .line 14
    return-void
.end method

.method private setNegativeButton()V
    .locals 3

    .prologue
    .line 46
    iget-object v0, p0, Lcom/pccw/dialog/AlertKKisOffDialog;->builder:Landroid/app/AlertDialog$Builder;

    const/high16 v1, 0x1040000

    new-instance v2, Lcom/pccw/dialog/AlertKKisOffDialog$2;

    invoke-direct {v2, p0}, Lcom/pccw/dialog/AlertKKisOffDialog$2;-><init>(Lcom/pccw/dialog/AlertKKisOffDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 57
    return-void
.end method

.method private setPositiveButton()V
    .locals 3

    .prologue
    .line 33
    iget-object v0, p0, Lcom/pccw/dialog/AlertKKisOffDialog;->builder:Landroid/app/AlertDialog$Builder;

    const v1, 0x104000a

    new-instance v2, Lcom/pccw/dialog/AlertKKisOffDialog$1;

    invoke-direct {v2, p0}, Lcom/pccw/dialog/AlertKKisOffDialog$1;-><init>(Lcom/pccw/dialog/AlertKKisOffDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 43
    return-void
.end method


# virtual methods
.method setButton()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/pccw/dialog/AlertKKisOffDialog;->setPositiveButton()V

    .line 29
    invoke-direct {p0}, Lcom/pccw/dialog/AlertKKisOffDialog;->setNegativeButton()V

    .line 30
    return-void
.end method

.method public setContent()V
    .locals 2

    .prologue
    .line 18
    iget-object v0, p0, Lcom/pccw/dialog/AlertKKisOffDialog;->builder:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f0701c8

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 19
    return-void
.end method

.method setListener(Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/pccw/dialog/AlertKKisOffDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    .line 24
    return-void
.end method
