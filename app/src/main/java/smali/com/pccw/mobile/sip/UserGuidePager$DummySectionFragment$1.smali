.class Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment$1;
.super Ljava/lang/Object;
.source "UserGuidePager.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;

    invoke-virtual {v2}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lorg/linphone/LinphoneActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->startActivity(Landroid/content/Intent;)V

    .line 182
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment$1;->this$0:Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/UserGuidePager$DummySectionFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentActivity;->finish()V

    .line 184
    :cond_0
    return-void
.end method
