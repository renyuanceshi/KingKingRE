.class Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;
.super Ljava/lang/Object;
.source "EditTextViewWithNumberCount.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;


# direct methods
.method constructor <init>(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 111
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 107
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 88
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "text":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$000(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v0, v2, v3

    .line 90
    .local v0, "charCount":I
    iget-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$100(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Landroid/widget/TextView;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    if-eqz v0, :cond_1

    .line 93
    iget-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$100(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v3}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$200(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b0077

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    :goto_0
    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    iget-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$000(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)I

    move-result v2

    if-ne v0, v2, :cond_2

    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v3, v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->setFieldValid(Z)V

    .line 100
    iget-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$300(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 101
    iget-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$300(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-virtual {v3}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->isFieldValid()Z

    move-result v3

    invoke-interface {v2, v3}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$TextValidationWatcher;->onValidation(Z)V

    .line 102
    :cond_0
    return-void

    .line 95
    :cond_1
    iget-object v2, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v2}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$100(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount$1;->this$0:Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;

    invoke-static {v3}, Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;->access$200(Lcom/pccw/android/common/widget/EditTextViewWithNumberCount;)Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b000e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 98
    :cond_2
    const/4 v2, 0x1

    goto :goto_1
.end method
