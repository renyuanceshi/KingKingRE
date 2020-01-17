.class Lcom/pccw/sms/NewSMSActivity$2;
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
.field final synthetic this$0:Lcom/pccw/sms/NewSMSActivity;


# direct methods
.method constructor <init>(Lcom/pccw/sms/NewSMSActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/NewSMSActivity;

    .prologue
    .line 207
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$2;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 233
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 228
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 5
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v4, 0x0

    .line 211
    add-int v1, p2, p4

    if-lez v1, :cond_1

    .line 212
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$2;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v1, v1, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    .line 218
    :cond_0
    :goto_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 219
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v1, "SEARCH_KEY"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/pccw/sms/NewSMSActivity$2;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v3, v3, Lcom/pccw/sms/NewSMSActivity;->addEt:Lcom/pccw/sms/emoji/EmojiEditText;

    invoke-virtual {v3}, Lcom/pccw/sms/emoji/EmojiEditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "%"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$2;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v1}, Lcom/pccw/sms/NewSMSActivity;->getSupportLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    iget-object v2, p0, Lcom/pccw/sms/NewSMSActivity$2;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-virtual {v1, v4, v0, v2}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    .line 222
    return-void

    .line 214
    .end local v0    # "bundle":Landroid/os/Bundle;
    :cond_1
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$2;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v1, v1, Lcom/pccw/sms/NewSMSActivity;->viewGroup:Lcom/pccw/sms/emoji/EmojiFlowLayout;

    invoke-virtual {v1}, Lcom/pccw/sms/emoji/EmojiFlowLayout;->getChildCount()I

    move-result v1

    if-eqz v1, :cond_0

    .line 215
    iget-object v1, p0, Lcom/pccw/sms/NewSMSActivity$2;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v1, v1, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    invoke-virtual {v1, v4}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    goto :goto_0
.end method
