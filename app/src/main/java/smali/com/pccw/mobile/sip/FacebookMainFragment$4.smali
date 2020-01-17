.class Lcom/pccw/mobile/sip/FacebookMainFragment$4;
.super Ljava/lang/Object;
.source "FacebookMainFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/FacebookMainFragment;->onCreateNoWiFiDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/FacebookMainFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/FacebookMainFragment;

    .prologue
    .line 751
    iput-object p1, p0, Lcom/pccw/mobile/sip/FacebookMainFragment$4;->this$0:Lcom/pccw/mobile/sip/FacebookMainFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 753
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 754
    return-void
.end method
