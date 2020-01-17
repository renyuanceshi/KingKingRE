.class public abstract Lcom/pccw/dialog/KKDialog;
.super Ljava/lang/Object;
.source "KKDialog.java"


# instance fields
.field activity:Landroid/app/Activity;

.field args:Landroid/os/Bundle;

.field builder:Landroid/app/AlertDialog$Builder;

.field dialogType:Lcom/pccw/dialog/EnumKKDialogType;

.field tag:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getArguments()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/pccw/dialog/KKDialog;->args:Landroid/os/Bundle;

    return-object v0
.end method

.method public getDialogType()Lcom/pccw/dialog/EnumKKDialogType;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/pccw/dialog/KKDialog;->dialogType:Lcom/pccw/dialog/EnumKKDialogType;

    return-object v0
.end method

.method public getTag()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lcom/pccw/dialog/KKDialog;->tag:I

    return v0
.end method

.method init(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 19
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/pccw/dialog/KKDialog;->builder:Landroid/app/AlertDialog$Builder;

    .line 20
    iput-object p1, p0, Lcom/pccw/dialog/KKDialog;->activity:Landroid/app/Activity;

    .line 21
    return-void
.end method

.method public setArguments(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "args"    # Landroid/os/Bundle;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/pccw/dialog/KKDialog;->args:Landroid/os/Bundle;

    .line 54
    return-void
.end method

.method abstract setButton()V
.end method

.method abstract setContent()V
.end method

.method abstract setListener(Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)V
.end method

.method public setTag(I)V
    .locals 0
    .param p1, "tag"    # I

    .prologue
    .line 41
    iput p1, p0, Lcom/pccw/dialog/KKDialog;->tag:I

    .line 42
    return-void
.end method

.method setTitle()V
    .locals 2

    .prologue
    .line 24
    iget-object v0, p0, Lcom/pccw/dialog/KKDialog;->builder:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f07006a

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 25
    iget-object v0, p0, Lcom/pccw/dialog/KKDialog;->builder:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f020436

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 26
    return-void
.end method

.method public show()V
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/pccw/dialog/KKDialog;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 34
    return-void
.end method
