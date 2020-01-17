.class public Lcom/pccw/dialog/AlertSMSConsumeDialog;
.super Lcom/pccw/dialog/KKDialog;
.source "AlertSMSConsumeDialog.java"


# instance fields
.field listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

.field private notShowSMSConsumeWarmingAgainCkeckBox:Landroid/widget/CheckBox;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/pccw/dialog/KKDialog;-><init>()V

    .line 18
    sget-object v0, Lcom/pccw/dialog/EnumKKDialogType;->AlertSMSConsumeDialog:Lcom/pccw/dialog/EnumKKDialogType;

    iput-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->dialogType:Lcom/pccw/dialog/EnumKKDialogType;

    .line 19
    return-void
.end method

.method static synthetic access$000(Lcom/pccw/dialog/AlertSMSConsumeDialog;)Landroid/widget/CheckBox;
    .locals 1
    .param p0, "x0"    # Lcom/pccw/dialog/AlertSMSConsumeDialog;

    .prologue
    .line 11
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->notShowSMSConsumeWarmingAgainCkeckBox:Landroid/widget/CheckBox;

    return-object v0
.end method

.method private setNegativeButton()V
    .locals 3

    .prologue
    .line 57
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->builder:Landroid/app/AlertDialog$Builder;

    const/high16 v1, 0x1040000

    new-instance v2, Lcom/pccw/dialog/AlertSMSConsumeDialog$2;

    invoke-direct {v2, p0}, Lcom/pccw/dialog/AlertSMSConsumeDialog$2;-><init>(Lcom/pccw/dialog/AlertSMSConsumeDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 68
    return-void
.end method

.method private setPositiveButton()V
    .locals 3

    .prologue
    .line 41
    iget-object v0, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->builder:Landroid/app/AlertDialog$Builder;

    const v1, 0x104000a

    new-instance v2, Lcom/pccw/dialog/AlertSMSConsumeDialog$1;

    invoke-direct {v2, p0}, Lcom/pccw/dialog/AlertSMSConsumeDialog$1;-><init>(Lcom/pccw/dialog/AlertSMSConsumeDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 54
    return-void
.end method


# virtual methods
.method setButton()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/pccw/dialog/AlertSMSConsumeDialog;->setPositiveButton()V

    .line 37
    invoke-direct {p0}, Lcom/pccw/dialog/AlertSMSConsumeDialog;->setNegativeButton()V

    .line 38
    return-void
.end method

.method public setContent()V
    .locals 4

    .prologue
    .line 23
    iget-object v1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f04003c

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 24
    .local v0, "textEntryView":Landroid/view/View;
    const v1, 0x7f0e0116

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->notShowSMSConsumeWarmingAgainCkeckBox:Landroid/widget/CheckBox;

    .line 25
    iget-object v1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->builder:Landroid/app/AlertDialog$Builder;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 26
    iget-object v1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->builder:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 27
    return-void
.end method

.method setListener(Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/pccw/dialog/AlertSMSConsumeDialog;->listener:Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    .line 32
    return-void
.end method
