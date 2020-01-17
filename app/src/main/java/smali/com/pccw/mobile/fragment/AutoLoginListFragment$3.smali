.class Lcom/pccw/mobile/fragment/AutoLoginListFragment$3;
.super Ljava/lang/Object;
.source "AutoLoginListFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 211
    iput-object p1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$3;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 214
    return-void
.end method
