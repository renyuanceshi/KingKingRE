.class Lcom/pccw/sms/ChatPageActivity$11;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


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
    .line 676
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$11;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 681
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$11;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$1700(Lcom/pccw/sms/ChatPageActivity;)I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 682
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$11;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 683
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$11;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$1800(Lcom/pccw/sms/ChatPageActivity;)V

    .line 684
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$11;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v0, v0, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 687
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$11;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$1500(Lcom/pccw/sms/ChatPageActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 688
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$11;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v0}, Lcom/pccw/sms/ChatPageActivity;->dismissDialog()V

    .line 690
    :cond_1
    const/4 v0, 0x0

    return v0
.end method
