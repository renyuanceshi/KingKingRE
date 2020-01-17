.class Lcom/pccw/sms/ChatPageActivity$12;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->setViewAction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/ChatPageActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 698
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$12;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 701
    const/4 v0, 0x0

    .line 702
    .local v0, "i":Landroid/content/Intent;
    const-string/jumbo v1, "group"

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$12;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 703
    new-instance v0, Landroid/content/Intent;

    .end local v0    # "i":Landroid/content/Intent;
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$12;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/pccw/sms/GroupInfoActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 706
    .restart local v0    # "i":Landroid/content/Intent;
    :cond_0
    new-instance v0, Landroid/content/Intent;

    .end local v0    # "i":Landroid/content/Intent;
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$12;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/pccw/sms/GroupInfoActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 708
    .restart local v0    # "i":Landroid/content/Intent;
    if-eqz v0, :cond_1

    .line 709
    const-string/jumbo v1, "recipient"

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$12;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v2}, Lcom/pccw/database/entity/ChatPageInfo;->getRecipient()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 710
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$12;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v1, v0}, Lcom/pccw/sms/ChatPageActivity;->startActivity(Landroid/content/Intent;)V

    .line 712
    :cond_1
    return-void
.end method
