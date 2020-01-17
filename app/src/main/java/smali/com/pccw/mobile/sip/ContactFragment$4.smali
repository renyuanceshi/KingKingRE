.class Lcom/pccw/mobile/sip/ContactFragment$4;
.super Ljava/lang/Object;
.source "ContactFragment.java"

# interfaces
.implements Landroid/support/v7/widget/SearchView$OnCloseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/ContactFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
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
    .line 545
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactFragment$4;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 2

    .prologue
    .line 549
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$4;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    const-string/jumbo v1, ""

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/ContactFragment;->access$400(Lcom/pccw/mobile/sip/ContactFragment;Ljava/lang/String;)V

    .line 550
    const/4 v0, 0x0

    return v0
.end method
