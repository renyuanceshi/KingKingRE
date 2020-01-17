.class Lcom/pccw/sms/ChatPageActivity$17;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->scrollMyListViewToBottom()V
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
    .line 997
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 1000
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    if-eqz v1, :cond_0

    .line 1001
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v1}, Lcom/pccw/sms/adapter/MessageAdapter;->getCount()I

    move-result v0

    .line 1002
    .local v0, "listViewRow":I
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$2800(Lcom/pccw/sms/ChatPageActivity;)I

    move-result v1

    if-eq v1, v3, :cond_3

    .line 1003
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v2}, Lcom/pccw/sms/ChatPageActivity;->access$2800(Lcom/pccw/sms/ChatPageActivity;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/pccw/sms/adapter/MessageAdapter;->setUnreadMessageId(I)V

    .line 1004
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1005
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$2800(Lcom/pccw/sms/ChatPageActivity;)I

    move-result v1

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v2}, Lcom/pccw/sms/adapter/MessageAdapter;->getTopMessageId()I

    move-result v2

    if-le v1, v2, :cond_1

    .line 1007
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v2}, Lcom/pccw/sms/ChatPageActivity;->access$2800(Lcom/pccw/sms/ChatPageActivity;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/pccw/sms/adapter/MessageAdapter;->getPositionByMessageId(I)I

    move-result v0

    .line 1008
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iput-boolean v4, v1, Lcom/pccw/sms/ChatPageActivity;->isAllRead:Z

    .line 1018
    :goto_0
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v1}, Lcom/pccw/sms/adapter/MessageAdapter;->notifyDataSetChanged()V

    .line 1019
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setSelection(I)V

    .line 1020
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1, v3}, Lcom/pccw/sms/ChatPageActivity;->access$2802(Lcom/pccw/sms/ChatPageActivity;I)I

    .line 1031
    .end local v0    # "listViewRow":I
    :cond_0
    :goto_1
    return-void

    .line 1009
    .restart local v0    # "listViewRow":I
    :cond_1
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$2800(Lcom/pccw/sms/ChatPageActivity;)I

    move-result v1

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v2}, Lcom/pccw/sms/adapter/MessageAdapter;->getTopMessageId()I

    move-result v2

    if-ne v1, v2, :cond_2

    .line 1011
    const/4 v0, -0x1

    .line 1012
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iput-boolean v4, v1, Lcom/pccw/sms/ChatPageActivity;->isAllRead:Z

    goto :goto_0

    .line 1015
    :cond_2
    const/4 v0, -0x1

    .line 1016
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v1, v4}, Lcom/pccw/sms/adapter/MessageAdapter;->setTemporaryMessageHeader(Z)V

    goto :goto_0

    .line 1022
    :cond_3
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-boolean v1, v1, Lcom/pccw/sms/ChatPageActivity;->isAllRead:Z

    if-eqz v1, :cond_5

    .line 1023
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v1, v3}, Lcom/pccw/sms/adapter/MessageAdapter;->setUnreadMessageId(I)V

    .line 1028
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setSelection(I)V

    goto :goto_1

    .line 1024
    :cond_5
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v1}, Lcom/pccw/sms/adapter/MessageAdapter;->getUnreadMessageId()I

    move-result v1

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    .line 1025
    invoke-virtual {v1}, Lcom/pccw/sms/adapter/MessageAdapter;->getTopMessageId()I

    move-result v1

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v2}, Lcom/pccw/sms/adapter/MessageAdapter;->getUnreadMessageId()I

    move-result v2

    if-le v1, v2, :cond_4

    .line 1026
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$17;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v1, v1, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v1, v4}, Lcom/pccw/sms/adapter/MessageAdapter;->setTemporaryMessageHeader(Z)V

    goto :goto_2
.end method
