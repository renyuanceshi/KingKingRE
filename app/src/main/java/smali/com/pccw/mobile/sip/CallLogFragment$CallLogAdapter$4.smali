.class Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;
.super Ljava/lang/Object;
.source "CallLogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

.field final synthetic val$chatid:Ljava/lang/String;

.field final synthetic val$chatnumber:Ljava/lang/String;

.field final synthetic val$contactName:Ljava/lang/String;

.field final synthetic val$entryType:Ljava/lang/String;

.field final synthetic val$nickname:Ljava/lang/String;

.field final synthetic val$number:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    .prologue
    .line 1459
    iput-object p1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iput-object p2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$chatid:Ljava/lang/String;

    iput-object p3, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$entryType:Ljava/lang/String;

    iput-object p4, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$number:Ljava/lang/String;

    iput-object p5, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$chatnumber:Ljava/lang/String;

    iput-object p6, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$nickname:Ljava/lang/String;

    iput-object p7, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$contactName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1463
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$chatid:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$entryType:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1466
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1467
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "recipient"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$chatnumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1468
    const-string/jumbo v1, "chatId"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$chatid:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1469
    const-string/jumbo v1, "chatType"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$entryType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1470
    const-string/jumbo v1, "username"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$chatnumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1471
    const-string/jumbo v1, "nickname"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$contactName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1472
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v1, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    .line 1484
    :goto_0
    return-void

    .line 1474
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-static {}, Lcom/pccw/mobile/sip/CallLogFragment;->access$200()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1477
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v1, "chatId"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1478
    const-string/jumbo v1, "username"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$chatnumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1479
    const-string/jumbo v1, "nickname"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$contactName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1480
    const-string/jumbo v1, "chatType"

    const-string/jumbo v2, "individual"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1481
    const-string/jumbo v1, "recipient"

    iget-object v2, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->val$chatnumber:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1482
    iget-object v1, p0, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter$4;->this$1:Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;

    iget-object v1, v1, Lcom/pccw/mobile/sip/CallLogFragment$CallLogAdapter;->this$0:Lcom/pccw/mobile/sip/CallLogFragment;

    invoke-virtual {v1, v0}, Lcom/pccw/mobile/sip/CallLogFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
