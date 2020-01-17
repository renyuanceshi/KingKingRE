.class Lcom/pccw/sms/NewSMSActivity$10;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/NewSMSActivity;->promptDialog(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/NewSMSActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/NewSMSActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 581
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 583
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->removeTextView:Landroid/widget/TextView;

    if-eqz v3, :cond_0

    .line 584
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->removeTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v2

    .line 585
    .local v2, "removeTextViewtHeight":I
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->recipientLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getMeasuredHeight()I

    move-result v1

    .line 586
    .local v1, "recipientLayoutHeight":I
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->removeTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getId()I

    move-result v0

    .line 587
    .local v0, "recipientId":I
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    iget-object v4, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v4, v4, Lcom/pccw/sms/NewSMSActivity;->removeTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v4}, Lcom/pccw/sms/emoji/EmojiFlowLayout;->removeView(Landroid/view/View;)V

    .line 588
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v3}, Lcom/pccw/sms/NewSMSActivity;->access$100(Lcom/pccw/sms/NewSMSActivity;)Ljava/util/Map;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "remove numbers size = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v5}, Lcom/pccw/sms/NewSMSActivity;->access$100(Lcom/pccw/sms/NewSMSActivity;)Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/pccwmobile/common/utilities/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    invoke-virtual {v3}, Lcom/pccw/sms/emoji/EmojiFlowLayout;->getChildCount()I

    move-result v3

    if-nez v3, :cond_0

    .line 591
    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$10;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    .line 594
    .end local v0    # "recipientId":I
    .end local v1    # "recipientLayoutHeight":I
    .end local v2    # "removeTextViewtHeight":I
    :cond_0
    return-void
.end method
