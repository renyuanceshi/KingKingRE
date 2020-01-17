.class Lcom/pccw/sms/ChatPageActivity$15;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/sms/ChatPageActivity;->enablePopUpView()V
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
    .line 881
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$15;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss()V
    .locals 2

    .prologue
    .line 884
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$15;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$600(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 885
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$15;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pccw/sms/ChatPageActivity;->access$1100(Lcom/pccw/sms/ChatPageActivity;Z)V

    .line 886
    return-void
.end method
