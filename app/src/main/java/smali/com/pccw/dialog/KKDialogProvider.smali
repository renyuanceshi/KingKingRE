.class public Lcom/pccw/dialog/KKDialogProvider;
.super Ljava/lang/Object;
.source "KKDialogProvider.java"


# instance fields
.field private activity:Landroid/app/Activity;

.field private builder:Lcom/pccw/dialog/KKDialogBuilder;


# direct methods
.method public constructor <init>(Lcom/pccw/dialog/KKDialogBuilder;Landroid/app/Activity;)V
    .locals 0
    .param p1, "builder"    # Lcom/pccw/dialog/KKDialogBuilder;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/pccw/dialog/KKDialogProvider;->builder:Lcom/pccw/dialog/KKDialogBuilder;

    .line 14
    iput-object p2, p0, Lcom/pccw/dialog/KKDialogProvider;->activity:Landroid/app/Activity;

    .line 15
    return-void
.end method


# virtual methods
.method public requestDialog(Lcom/pccw/dialog/EnumKKDialogType;Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)Lcom/pccw/dialog/KKDialog;
    .locals 2
    .param p1, "dialogType"    # Lcom/pccw/dialog/EnumKKDialogType;
    .param p2, "listener"    # Lcom/pccw/dialog/listener/IKKDialogOnClickListener;

    .prologue
    .line 19
    iget-object v1, p0, Lcom/pccw/dialog/KKDialogProvider;->builder:Lcom/pccw/dialog/KKDialogBuilder;

    invoke-virtual {v1, p1}, Lcom/pccw/dialog/KKDialogBuilder;->createDialog(Lcom/pccw/dialog/EnumKKDialogType;)Lcom/pccw/dialog/KKDialog;

    move-result-object v0

    .line 21
    .local v0, "dialog":Lcom/pccw/dialog/KKDialog;
    iget-object v1, p0, Lcom/pccw/dialog/KKDialogProvider;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/pccw/dialog/KKDialog;->init(Landroid/app/Activity;)V

    .line 22
    invoke-virtual {v0}, Lcom/pccw/dialog/KKDialog;->setTitle()V

    .line 23
    invoke-virtual {v0}, Lcom/pccw/dialog/KKDialog;->setContent()V

    .line 24
    invoke-virtual {v0, p2}, Lcom/pccw/dialog/KKDialog;->setListener(Lcom/pccw/dialog/listener/IKKDialogOnClickListener;)V

    .line 25
    invoke-virtual {v0}, Lcom/pccw/dialog/KKDialog;->setButton()V

    .line 27
    return-object v0
.end method
