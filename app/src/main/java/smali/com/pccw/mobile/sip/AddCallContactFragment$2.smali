.class Lcom/pccw/mobile/sip/AddCallContactFragment$2;
.super Ljava/lang/Object;
.source "AddCallContactFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/AddCallContactFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/AddCallContactFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/AddCallContactFragment;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$2;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$2;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$000(Lcom/pccw/mobile/sip/AddCallContactFragment;I)V

    .line 159
    return-void
.end method
