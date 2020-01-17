.class Lcom/pccw/sms/NewSMSActivity$1;
.super Ljava/lang/Object;
.source "NewSMSActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 199
    iput-object p1, p0, Lcom/pccw/sms/NewSMSActivity$1;->this$0:Lcom/pccw/sms/NewSMSActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 203
    iget-object v0, p0, Lcom/pccw/sms/NewSMSActivity$1;->this$0:Lcom/pccw/sms/NewSMSActivity;

    iget-object v0, v0, Lcom/pccw/sms/NewSMSActivity;->recipientScroll:Lcom/pccw/android/common/widget/AddRecipientsScrollView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/pccw/android/common/widget/AddRecipientsScrollView;->setVisibility(I)V

    .line 205
    return-void
.end method
