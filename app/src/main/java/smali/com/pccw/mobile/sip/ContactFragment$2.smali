.class Lcom/pccw/mobile/sip/ContactFragment$2;
.super Ljava/lang/Object;
.source "ContactFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/ContactFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/ContactFragment;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/ContactFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/ContactFragment;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactFragment$2;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    .line 182
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$2;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/ContactFragment;->access$000(Lcom/pccw/mobile/sip/ContactFragment;I)V

    .line 183
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$2;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactFragment;->allTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 184
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$2;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    iget-object v0, v0, Lcom/pccw/mobile/sip/ContactFragment;->kkTextView:Lcom/pccw/android/common/widget/CenteredRadioImageButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/CenteredRadioImageButton;->setEnabled(Z)V

    .line 185
    return-void
.end method
