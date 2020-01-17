.class Lcom/pccw/mobile/sip/AddCallContactFragment$4;
.super Ljava/lang/Object;
.source "AddCallContactFragment.java"

# interfaces
.implements Landroid/support/v7/widget/SearchView$OnCloseListener;


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
    .line 494
    iput-object p1, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$4;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()Z
    .locals 2

    .prologue
    .line 498
    iget-object v0, p0, Lcom/pccw/mobile/sip/AddCallContactFragment$4;->this$0:Lcom/pccw/mobile/sip/AddCallContactFragment;

    const-string/jumbo v1, ""

    invoke-static {v0, v1}, Lcom/pccw/mobile/sip/AddCallContactFragment;->access$400(Lcom/pccw/mobile/sip/AddCallContactFragment;Ljava/lang/String;)V

    .line 499
    const/4 v0, 0x0

    return v0
.end method
