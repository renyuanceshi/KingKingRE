.class Lcom/pccw/mobile/fragment/AutoLoginListFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "AutoLoginListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/fragment/AutoLoginListFragment;
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
    .line 56
    iput-object p1, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$1;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/pccw/mobile/fragment/AutoLoginListFragment$1;->this$0:Lcom/pccw/mobile/fragment/AutoLoginListFragment;

    invoke-static {v0, p2}, Lcom/pccw/mobile/fragment/AutoLoginListFragment;->access$000(Lcom/pccw/mobile/fragment/AutoLoginListFragment;Landroid/content/Intent;)V

    .line 60
    return-void
.end method
