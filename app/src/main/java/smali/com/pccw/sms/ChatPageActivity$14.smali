.class Lcom/pccw/sms/ChatPageActivity$14;
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
    .line 726
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 14
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v9, 0x0

    const/4 v13, 0x1

    .line 731
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v10}, Lcom/pccw/sms/ChatPageActivity;->access$100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v6

    .line 732
    .local v6, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    invoke-virtual {v6}, Lcom/pccw/sms/bean/ChatPageListView;->getCurrentPage()I

    move-result v5

    .line 733
    .local v5, "recentPage":I
    add-int/lit8 v0, v5, 0x1

    .line 734
    .local v0, "currentPage":I
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->LOG_TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "recent page="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 737
    const-string/jumbo v10, "individual"

    iget-object v11, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v11, v11, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v11}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v10}, Lcom/pccw/sms/ChatPageActivity;->access$2000(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 738
    const-string/jumbo v10, "KKIM"

    const-string/jumbo v11, "merge with the call log."

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 739
    if-ne v5, v13, :cond_0

    .line 740
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v11, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v11}, Lcom/pccw/sms/ChatPageActivity;->access$2100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/service/CallLogIMService;

    move-result-object v11

    iget-object v12, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v12, v12, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v11, v12, v13}, Lcom/pccw/sms/service/CallLogIMService;->getChatPageData(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v11

    iput-object v11, v10, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    .line 742
    :cond_0
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v10}, Lcom/pccw/sms/ChatPageActivity;->access$2100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/service/CallLogIMService;

    move-result-object v10

    iget-object v11, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v11, v11, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v10, v11, v0}, Lcom/pccw/sms/service/CallLogIMService;->getChatPageData(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v4

    .line 754
    .local v4, "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    :goto_0
    invoke-virtual {v6, v0}, Lcom/pccw/sms/bean/ChatPageListView;->setCurrentPage(I)V

    .line 755
    invoke-static {}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->getInstance()Lcom/pccw/sms/singleton/ChatPageLayoutInstance;

    move-result-object v10

    invoke-virtual {v10, v6}, Lcom/pccw/sms/singleton/ChatPageLayoutInstance;->init(Lcom/pccw/sms/bean/ChatPageListView;)V

    .line 757
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v10, v13}, Lcom/pccw/sms/ChatPageActivity;->access$2302(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 759
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-static {v10, v11}, Lcom/pccw/sms/ChatPageActivity;->access$2400(Lcom/pccw/sms/ChatPageActivity;I)V

    .line 760
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 761
    .local v3, "newItemSize":I
    if-eqz v3, :cond_2

    .line 762
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v10}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v10

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v11

    add-int v2, v10, v11

    .line 763
    .local v2, "index":I
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v10, v9}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 764
    .local v8, "view":Landroid/view/View;
    if-nez v8, :cond_5

    move v7, v9

    .line 766
    .local v7, "top":I
    :goto_1
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 767
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iput-object v4, v10, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    .line 768
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v11, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v11, v11, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v11}, Lcom/pccw/database/entity/ChatPageInfo;->getChatType()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/pccw/sms/adapter/MessageAdapter;->setChatType(Ljava/lang/String;)V

    .line 769
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    iget-object v11, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v11, v11, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    invoke-virtual {v10, v11}, Lcom/pccw/sms/adapter/MessageAdapter;->updateMessageList(Ljava/util/List;)V

    .line 770
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v10}, Lcom/pccw/sms/adapter/MessageAdapter;->notifyDataSetChanged()V

    .line 771
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v6, v10}, Lcom/pccw/sms/bean/ChatPageListView;->setMessageAdapter(Lcom/pccw/sms/adapter/MessageAdapter;)V

    .line 772
    const/16 v10, 0x14

    if-eq v3, v10, :cond_1

    if-le v3, v13, :cond_2

    .line 774
    :cond_1
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v10, v2, v7}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 775
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v10, v9}, Lcom/pccw/sms/adapter/MessageAdapter;->setTemporaryMessageHeader(Z)V

    .line 776
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v10, v2}, Lcom/pccw/sms/adapter/MessageAdapter;->getMessageIdByPosition(I)I

    move-result v1

    .line 777
    .local v1, "firstVisibleMessageId":I
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    invoke-virtual {v10}, Lcom/pccw/sms/adapter/MessageAdapter;->getUnreadMessageId()I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_6

    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->messageAdapter:Lcom/pccw/sms/adapter/MessageAdapter;

    .line 778
    invoke-virtual {v10}, Lcom/pccw/sms/adapter/MessageAdapter;->getUnreadMessageId()I

    move-result v10

    if-le v1, v10, :cond_6

    .line 779
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v10, v10, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v9}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 799
    .end local v1    # "firstVisibleMessageId":I
    .end local v2    # "index":I
    .end local v7    # "top":I
    .end local v8    # "view":Landroid/view/View;
    :cond_2
    :goto_2
    return-void

    .line 746
    .end local v3    # "newItemSize":I
    .end local v4    # "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    :cond_3
    const-string/jumbo v10, "KKIM"

    const-string/jumbo v11, "Only list the chat record"

    invoke-static {v10, v11}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    if-ne v5, v13, :cond_4

    .line 748
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v11, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v11}, Lcom/pccw/sms/ChatPageActivity;->access$2200(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/service/MessageItemService;

    move-result-object v11

    iget-object v12, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v12, v12, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v11, v12, v13}, Lcom/pccw/sms/service/MessageItemService;->getMessageItem(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v11

    iput-object v11, v10, Lcom/pccw/sms/ChatPageActivity;->items:Ljava/util/ArrayList;

    .line 750
    :cond_4
    iget-object v10, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v10}, Lcom/pccw/sms/ChatPageActivity;->access$2200(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/service/MessageItemService;

    move-result-object v10

    iget-object v11, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v11, v11, Lcom/pccw/sms/ChatPageActivity;->chatPageInfo:Lcom/pccw/database/entity/ChatPageInfo;

    invoke-virtual {v10, v11, v0}, Lcom/pccw/sms/service/MessageItemService;->getMessageItem(Lcom/pccw/database/entity/ChatPageInfo;I)Ljava/util/ArrayList;

    move-result-object v4

    .restart local v4    # "newItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/pccw/sms/bean/MessageItem;>;"
    goto/16 :goto_0

    .line 764
    .restart local v2    # "index":I
    .restart local v3    # "newItemSize":I
    .restart local v8    # "view":Landroid/view/View;
    :cond_5
    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v7

    goto/16 :goto_1

    .line 781
    .restart local v1    # "firstVisibleMessageId":I
    .restart local v7    # "top":I
    :cond_6
    iget-object v9, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v9, v9, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    invoke-virtual {v9}, Landroid/widget/LinearLayout;->isShown()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 782
    iget-object v9, p0, Lcom/pccw/sms/ChatPageActivity$14;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v9, v9, Lcom/pccw/sms/ChatPageActivity;->topUnreadNotice:Landroid/widget/LinearLayout;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_2
.end method
