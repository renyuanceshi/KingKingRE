.class Lcom/pccw/mobile/sip/ContactFragment$3;
.super Ljava/lang/Object;
.source "ContactFragment.java"

# interfaces
.implements Landroid/support/v7/widget/SearchView$OnQueryTextListener;


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
    .line 530
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactFragment$3;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 1
    .param p1, "newText"    # Ljava/lang/String;

    .prologue
    .line 534
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$3;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-static {v0, p1}, Lcom/pccw/mobile/sip/ContactFragment;->access$400(Lcom/pccw/mobile/sip/ContactFragment;Ljava/lang/String;)V

    .line 535
    const/4 v0, 0x1

    return v0
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 540
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$3;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/ContactFragment;->access$500(Lcom/pccw/mobile/sip/ContactFragment;)Landroid/support/v7/widget/SearchView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->clearFocus()V

    .line 541
    const/4 v0, 0x1

    return v0
.end method
