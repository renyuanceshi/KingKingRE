.class Lcom/pccw/sms/NewSMSActivity$9;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/NewSMSActivity;->addRecipientTextView(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/NewSMSActivity;

.field final synthetic val$contactName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/pccw/sms/NewSMSActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 522
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iput-object p2, p0, Lcom/pccw/sms/NewSMSActivity$9;->val$contactName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 525
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    check-cast p1, Landroid/widget/TextView;

    .end local p1    # "v":Landroid/view/View;
    iput-object p1, v2, Lcom/pccw/sms/NewSMSActivity;->removeTextView:Landroid/widget/TextView;

    .line 526
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->removeTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/pccw/sms/NewSMSActivity;->access$402(Lcom/pccw/sms/NewSMSActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 528
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$9;->val$contactName:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 529
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v2, v2, Lcom/pccw/sms/NewSMSActivity;->removeTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getId()I

    move-result v0

    .line 530
    .local v0, "id":I
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v2}, Lcom/pccw/sms/NewSMSActivity;->access$100(Lcom/pccw/sms/NewSMSActivity;)Ljava/util/Map;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 531
    .local v1, "number":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v4}, Lcom/pccw/sms/NewSMSActivity;->access$400(Lcom/pccw/sms/NewSMSActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/pccw/sms/NewSMSActivity;->access$402(Lcom/pccw/sms/NewSMSActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 533
    .end local v0    # "id":I
    .end local v1    # "number":Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$9;->this$0:Lcom/pccw/sms/NewSMSActivity;

    const/4 v3, 0x2

    invoke-static {v2, v3}, Lcom/pccw/sms/NewSMSActivity;->access$500(Lcom/pccw/sms/NewSMSActivity;I)V

    .line 534
    return-void
.end method
