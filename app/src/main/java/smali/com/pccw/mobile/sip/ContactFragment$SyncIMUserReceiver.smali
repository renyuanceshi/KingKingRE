.class public Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ContactFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/mobile/sip/ContactFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SyncIMUserReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/mobile/sip/ContactFragment;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/sip/ContactFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/mobile/sip/ContactFragment;

    .prologue
    .line 681
    iput-object p1, p0, Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 685
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.pccw.mobile.sip.intent.syncimuserfinish"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 687
    iget-object v0, p0, Lcom/pccw/mobile/sip/ContactFragment$SyncIMUserReceiver;->this$0:Lcom/pccw/mobile/sip/ContactFragment;

    invoke-virtual {v0}, Lcom/pccw/mobile/sip/ContactFragment;->updateIMNumberList()V

    .line 689
    :cond_0
    return-void
.end method
