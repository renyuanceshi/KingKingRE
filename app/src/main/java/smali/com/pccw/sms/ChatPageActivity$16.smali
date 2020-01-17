.class Lcom/pccw/sms/ChatPageActivity$16;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->checkKeyboardHeight(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/ChatPageActivity;

.field final synthetic val$parentLayout:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/pccw/sms/ChatPageActivity;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 893
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iput-object p2, p0, Lcom/pccw/sms/ChatPageActivity$16;->val$parentLayout:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 7

    .prologue
    const/16 v4, 0x32

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 898
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 899
    .local v1, "r":Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->val$parentLayout:Landroid/view/View;

    invoke-virtual {v3, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 901
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->val$parentLayout:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 902
    .local v2, "screenHeight":I
    iget v3, v1, Landroid/graphics/Rect;->bottom:I

    sub-int v0, v2, v3

    .line 904
    .local v0, "heightDifference":I
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget v3, v3, Lcom/pccw/sms/ChatPageActivity;->previousHeightDiffrence:I

    sub-int/2addr v3, v0

    if-gez v3, :cond_1

    .line 934
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iput v0, v3, Lcom/pccw/sms/ChatPageActivity;->previousHeightDiffrence:I

    .line 935
    const/16 v3, 0x64

    if-le v0, v3, :cond_7

    .line 936
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 938
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v6}, Lcom/pccw/sms/ChatPageActivity;->access$002(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 943
    :goto_1
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v6}, Lcom/pccw/sms/ChatPageActivity;->access$502(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 949
    :goto_2
    return-void

    .line 907
    :cond_1
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget v3, v3, Lcom/pccw/sms/ChatPageActivity;->previousHeightDiffrence:I

    sub-int/2addr v3, v0

    if-gez v3, :cond_2

    .line 909
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v6}, Lcom/pccw/sms/ChatPageActivity;->access$2502(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 910
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v0}, Lcom/pccw/sms/ChatPageActivity;->access$2600(Lcom/pccw/sms/ChatPageActivity;I)V

    .line 911
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$2700(Lcom/pccw/sms/ChatPageActivity;)V

    goto :goto_0

    .line 913
    :cond_2
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$2500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v3

    if-eqz v3, :cond_3

    if-eqz v0, :cond_3

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget v3, v3, Lcom/pccw/sms/ChatPageActivity;->previousHeightDiffrence:I

    sub-int/2addr v3, v0

    if-le v3, v4, :cond_3

    .line 915
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v5}, Lcom/pccw/sms/ChatPageActivity;->access$2502(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 916
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v0}, Lcom/pccw/sms/ChatPageActivity;->access$2600(Lcom/pccw/sms/ChatPageActivity;I)V

    .line 917
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$2700(Lcom/pccw/sms/ChatPageActivity;)V

    goto :goto_0

    .line 919
    :cond_3
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$2500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget v3, v3, Lcom/pccw/sms/ChatPageActivity;->previousHeightDiffrence:I

    sub-int/2addr v3, v0

    if-le v3, v4, :cond_4

    .line 921
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v5}, Lcom/pccw/sms/ChatPageActivity;->access$2502(Lcom/pccw/sms/ChatPageActivity;Z)Z

    goto :goto_0

    .line 923
    :cond_4
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$2500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget v3, v3, Lcom/pccw/sms/ChatPageActivity;->previousHeightDiffrence:I

    sub-int/2addr v3, v0

    if-nez v3, :cond_5

    .line 925
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v0}, Lcom/pccw/sms/ChatPageActivity;->access$2600(Lcom/pccw/sms/ChatPageActivity;I)V

    .line 926
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$2700(Lcom/pccw/sms/ChatPageActivity;)V

    goto/16 :goto_0

    .line 928
    :cond_5
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget v3, v3, Lcom/pccw/sms/ChatPageActivity;->previousHeightDiffrence:I

    sub-int/2addr v3, v0

    if-le v3, v4, :cond_0

    .line 930
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$600(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/FrameLayout;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 931
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$400(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/PopupWindow;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/PopupWindow;->dismiss()V

    goto/16 :goto_0

    .line 940
    :cond_6
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v5}, Lcom/pccw/sms/ChatPageActivity;->access$002(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 941
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3}, Lcom/pccw/sms/ChatPageActivity;->access$800(Lcom/pccw/sms/ChatPageActivity;)V

    goto/16 :goto_1

    .line 946
    :cond_7
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$16;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v5}, Lcom/pccw/sms/ChatPageActivity;->access$502(Lcom/pccw/sms/ChatPageActivity;Z)Z

    goto/16 :goto_2
.end method
