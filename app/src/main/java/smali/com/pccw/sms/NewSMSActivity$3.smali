.class Lcom/pccw/sms/NewSMSActivity$3;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


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
    .line 235
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$3;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    const/16 v1, 0x8

    .line 238
    if-nez p2, :cond_1

    .line 239
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$3;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v0}, Lcom/pccw/sms/NewSMSActivity;->access$000(Lcom/pccw/sms/NewSMSActivity;)V

    .line 240
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$3;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-static {v0}, Lcom/pccw/sms/NewSMSActivity;->access$100(Lcom/pccw/sms/NewSMSActivity;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$3;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    .line 249
    :goto_0
    return-void

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$3;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    goto :goto_0

    .line 247
    :cond_1
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$3;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    goto :goto_0
.end method
