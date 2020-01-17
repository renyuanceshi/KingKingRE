.class Lcom/pccw/mobile/sip/CallLogFragment$2;
.super Ljava/lang/Object;
.source "CallLogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CallLogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/CallLogFragment;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/CallLogFragment;

    .prologue
    .line 455
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$2;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 459
    iget-object v0, p0, Lcom/pccw/mobile/sip/CallLogFragment$2;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/CallLogFragment;->access$500(Lcom/pccw/mobile/sip/CallLogFragment;I)V

    .line 460
    return-void
.end method
