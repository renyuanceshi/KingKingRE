.class Lcom/pccw/sms/ChatPageActivity$9;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->setViewAction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field addStr:Ljava/lang/String;

.field beforeStr:Ljava/lang/String;

.field currentCharCount:I

.field currentConcatCount:I

.field maxConcatCount:I

.field maxLength:I

.field oldCharCount:I

.field oldConcatCount:I

.field final synthetic this$0:Lcom/pccw/sms/ChatPageActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/ChatPageActivity;)V
    .locals 1
    .param p1, "this$0"    # Lcom/pccw/sms/ChatPageActivity;

    .prologue
    .line 601
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 607
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/sms/ChatPageActivity$9;->oldConcatCount:I

    .line 608
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v0}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/sms/util/ConcatUtil;->getMaxCharCountEn(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/pccw/sms/ChatPageActivity$9;->oldCharCount:I

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 6
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 614
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 615
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 616
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v2}, Lcom/pccw/sms/ChatPageActivity;->access$1602(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 617
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v3

    if-ne v3, v2, :cond_0

    .line 618
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v3, v3, Lcom/pccw/sms/ChatPageActivity;->LOG_TAG:Ljava/lang/String;

    const-string/jumbo v4, "set typing status"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 625
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v3, v3, Lcom/pccw/sms/ChatPageActivity;->sendMsgBtn:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_3

    :goto_1
    invoke-virtual {v3, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 627
    iget v1, p0, Lcom/pccw/sms/ChatPageActivity$9;->currentConcatCount:I

    iget v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->maxConcatCount:I

    if-le v1, v3, :cond_1

    .line 628
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$9;->beforeStr:Ljava/lang/String;

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->addStr:Ljava/lang/String;

    iget v4, p0, Lcom/pccw/sms/ChatPageActivity$9;->oldConcatCount:I

    iget v5, p0, Lcom/pccw/sms/ChatPageActivity$9;->oldCharCount:I

    invoke-static {v1, p1, v3, v4, v5}, Lcom/pccw/sms/util/ConcatUtil;->getDeleteIndex(Ljava/lang/String;Landroid/text/Editable;Ljava/lang/String;II)I

    move-result v1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-interface {p1, v1, v3}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 629
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const v4, 0x7f0700a5

    invoke-virtual {v3, v4}, Lcom/pccw/sms/ChatPageActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 631
    :cond_1
    iget v1, p0, Lcom/pccw/sms/ChatPageActivity$9;->currentCharCount:I

    iput v1, p0, Lcom/pccw/sms/ChatPageActivity$9;->oldCharCount:I

    .line 632
    iget v1, p0, Lcom/pccw/sms/ChatPageActivity$9;->currentConcatCount:I

    iput v1, p0, Lcom/pccw/sms/ChatPageActivity$9;->oldConcatCount:I

    .line 634
    return-void

    .line 621
    :cond_2
    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v3, v1}, Lcom/pccw/sms/ChatPageActivity;->access$1602(Lcom/pccw/sms/ChatPageActivity;Z)Z

    goto :goto_0

    :cond_3
    move v1, v2

    .line 625
    goto :goto_1
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 638
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/sms/ChatPageActivity$9;->beforeStr:Ljava/lang/String;

    .line 639
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 7
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 644
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 645
    .local v0, "msg":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->beforeStr:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 646
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->beforeStr:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->addStr:Ljava/lang/String;

    .line 648
    :cond_0
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-virtual {v2}, Lcom/pccw/sms/ChatPageActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/pccw/sms/util/ConcatUtil;->getCharAndConcatCount(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/Integer;

    move-result-object v1

    .line 649
    .local v1, "res":[Ljava/lang/Integer;
    aget-object v2, v1, v6

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->currentCharCount:I

    .line 650
    aget-object v2, v1, v4

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->currentConcatCount:I

    .line 651
    const/4 v2, 0x2

    aget-object v2, v1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->maxLength:I

    .line 652
    const/4 v2, 0x3

    aget-object v2, v1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->maxConcatCount:I

    .line 653
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->charCountTv:Landroid/widget/TextView;

    iget v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->currentCharCount:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 654
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->concatCountTv:Landroid/widget/TextView;

    iget v3, p0, Lcom/pccw/sms/ChatPageActivity$9;->currentConcatCount:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 655
    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$9;->this$0:Lcom/pccw/sms/ChatPageActivity;

    iget-object v2, v2, Lcom/pccw/sms/ChatPageActivity;->txt_msg:Landroid/widget/EditText;

    new-array v3, v4, [Landroid/text/InputFilter;

    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    iget v5, p0, Lcom/pccw/sms/ChatPageActivity$9;->maxLength:I

    invoke-direct {v4, v5}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v4, v3, v6

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 657
    return-void
.end method
