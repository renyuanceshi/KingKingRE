.class Lcom/pccw/mobile/sip/AddCallContactFragment$3;
.super Ljava/lang/Object;
.source "AddCallContactFragment.java"

# interfaces
.implements Landroid/support/v7/widget/SearchView$OnQueryTextListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/AddCallContactFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
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
    .line 479
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$3;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryTextChange(Ljava/lang/String;)Z
    .locals 1
    .param p1, "newText"    # Ljava/lang/String;

    .prologue
    .line 483
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$3;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-static {v0, p1}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$400(Lcom/pccw/mobile/sip/AddCallContactFragment;Ljava/lang/String;)V

    .line 484
    const/4 v0, 0x1

    return v0
.end method

.method public onQueryTextSubmit(Ljava/lang/String;)Z
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 489
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$3;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-static {v0}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$500(Lcom/pccw/mobile/sip/AddCallContactFragment;)Landroid/support/v7/widget/SearchView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->clearFocus()V

    .line 490
    const/4 v0, 0x1

    return v0
.end method
