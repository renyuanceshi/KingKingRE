.class Lcom/pccw/sms/ChatPageActivity$20;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->autoScrollDown()V
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
    .line 1360
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$20;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 1363
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$20;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    invoke-virtual {v2, v4}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1364
    .local v1, "v":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 1365
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 1366
    .local v0, "bottom":I
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$20;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->mListView:Landroid/widget/ListView;

    const/16 v3, 0x1f4

    invoke-virtual {v2, v0, v3}, Landroid/widget/ListView;->smoothScrollBy(II)V

    .line 1367
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$20;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v2, v4}, Lcom/pccw/sms/ChatPageActivity;->access$3102(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 1369
    .end local v0    # "bottom":I
    :cond_0
    return-void
.end method
