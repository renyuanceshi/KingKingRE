.class Lcom/pccw/sms/NewSMSActivity$6;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/NewSMSActivity;->setViewAction()V
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

.field final synthetic this$0:Lcom/pccw/sms/NewSMSActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/NewSMSActivity;)V
    .locals 1
    .param p1, "this$0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 284
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 289
    const/4 v0, 0x1

    iput v0, p0, Lcom/pccw/sms/NewSMSActivity$6;->oldConcatCount:I

    .line 290
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v0}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/pccw/sms/util/ConcatUtil;->getMaxCharCountEn(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/pccw/sms/NewSMSActivity$6;->oldCharCount:I

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 6
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    const/4 v2, 0x1

    .line 319
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v1, Lcom/pccw/sms/NewSMSActivity;->sendBtn:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v3, v1}, Landroid/widget/ImageButton;->setEnabled(Z)V

    .line 321
    iget v1, p0, Lcom/pccw/sms/NewSMSActivity$6;->currentConcatCount:I

    iget v3, p0, Lcom/pccw/sms/NewSMSActivity$6;->maxConcatCount:I

    if-le v1, v3, :cond_0

    .line 322
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$6;->beforeStr:Ljava/lang/String;

    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$6;->addStr:Ljava/lang/String;

    iget v4, p0, Lcom/pccw/sms/NewSMSActivity$6;->oldConcatCount:I

    iget v5, p0, Lcom/pccw/sms/NewSMSActivity$6;->oldCharCount:I

    invoke-static {v1, p1, v3, v4, v5}, Lcom/pccw/sms/util/ConcatUtil;->getDeleteIndex(Ljava/lang/String;Landroid/text/Editable;Ljava/lang/String;II)I

    move-result v1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v3

    invoke-interface {p1, v1, v3}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    .line 323
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    const v4, 0x7f0700a5

    invoke-virtual {v3, v4}, Lcom/pccw/sms/NewSMSActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 325
    :cond_0
    iget v1, p0, Lcom/pccw/sms/NewSMSActivity$6;->currentCharCount:I

    iput v1, p0, Lcom/pccw/sms/NewSMSActivity$6;->oldCharCount:I

    .line 326
    iget v1, p0, Lcom/pccw/sms/NewSMSActivity$6;->currentConcatCount:I

    iput v1, p0, Lcom/pccw/sms/NewSMSActivity$6;->oldConcatCount:I

    .line 328
    return-void

    :cond_1
    move v1, v2

    .line 320
    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 313
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/pccw/sms/NewSMSActivity$6;->beforeStr:Ljava/lang/String;

    .line 314
    return-void
.end method

.method public declared-synchronized onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 7
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 296
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->beforeStr:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 297
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$6;->beforeStr:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->addStr:Ljava/lang/String;

    .line 299
    :cond_0
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v2, v2, Lcom/pccw/sms/NewSMSActivity;->sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

    invoke-virtual {v2}, Lcom/pccw/sms/emoji/EmojiEditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 300
    .local v0, "msg":Ljava/lang/String;
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v2}, Lcom/pccw/sms/NewSMSActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/pccw/sms/util/ConcatUtil;->getCharAndConcatCount(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/Integer;

    move-result-object v1

    .line 301
    .local v1, "res":[Ljava/lang/Integer;
    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->currentCharCount:I

    .line 302
    const/4 v2, 0x1

    aget-object v2, v1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->currentConcatCount:I

    .line 303
    const/4 v2, 0x2

    aget-object v2, v1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->maxLength:I

    .line 304
    const/4 v2, 0x3

    aget-object v2, v1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->maxConcatCount:I

    .line 305
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v2, v2, Lcom/pccw/sms/NewSMSActivity;->charCountTv:Landroid/widget/TextView;

    iget v3, p0, Lcom/pccw/sms/NewSMSActivity$6;->currentCharCount:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 306
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v2, v2, Lcom/pccw/sms/NewSMSActivity;->concatCountTv:Landroid/widget/TextView;

    iget v3, p0, Lcom/pccw/sms/NewSMSActivity$6;->currentConcatCount:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 307
    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$6;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v2, v2, Lcom/pccw/sms/NewSMSActivity;->sendEt:Lcom/pccw/sms/emoji/EmojiEditText;

    const/4 v3, 0x1

    new-array v3, v3, [Landroid/text/InputFilter;

    const/4 v4, 0x0

    new-instance v5, Landroid/text/InputFilter$LengthFilter;

    iget v6, p0, Lcom/pccw/sms/NewSMSActivity$6;->maxLength:I

    invoke-direct {v5, v6}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Lcom/pccw/sms/emoji/EmojiEditText;->setFilters([Landroid/text/InputFilter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 308
    monitor-exit p0

    return-void

    .line 296
    .end local v0    # "msg":Ljava/lang/String;
    .end local v1    # "res":[Ljava/lang/Integer;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
