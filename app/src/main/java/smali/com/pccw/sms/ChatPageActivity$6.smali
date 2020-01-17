.class Lcom/pccw/sms/ChatPageActivity$6;
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
    .line 541
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 546
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$400(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/PopupWindow;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_1

    .line 548
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v0, v0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 549
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 550
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$600(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 551
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0, v4}, Lcom/pccw/sms/ChatPageActivity;->access$702(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 560
    :goto_0
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0, v4}, Lcom/pccw/sms/ChatPageActivity;->access$1100(Lcom/pccw/sms/ChatPageActivity;Z)V

    .line 565
    :goto_1
    return-void

    .line 553
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$600(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 554
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0, v3}, Lcom/pccw/sms/ChatPageActivity;->access$002(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 555
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$800(Lcom/pccw/sms/ChatPageActivity;)V

    .line 556
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$400(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/PopupWindow;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$900(Lcom/pccw/sms/ChatPageActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 557
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$400(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/PopupWindow;

    move-result-object v0

    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$1000(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/LinearLayout;

    move-result-object v1

    const/16 v2, 0x50

    invoke-virtual {v0, v1, v2, v3, v3}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 558
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v0}, Lcom/pccw/sms/ChatPageActivity;->showDialog()V

    goto :goto_0

    .line 562
    :cond_1
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$6;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v0}, Lcom/pccw/sms/ChatPageActivity;->dismissDialog()V

    goto :goto_1
.end method
