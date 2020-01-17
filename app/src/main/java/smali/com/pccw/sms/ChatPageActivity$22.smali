.class Lcom/pccw/sms/ChatPageActivity$22;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/ChatPageActivity;
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
    .line 1413
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$22;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 1415
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$22;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v0}, Lcom/pccw/sms/ChatPageActivity;->access$3300(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/RelativeLayout;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 1416
    iget-object v0, p0, Lcom/pccw/sms/ChatPageActivity$22;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/pccw/sms/ChatPageActivity$22;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v2}, Lcom/pccw/sms/ChatPageActivity;->access$3400(Lcom/pccw/sms/ChatPageActivity;)Landroid/widget/ProgressBar;

    move-result-object v2

    const/16 v3, 0x12c

    invoke-static {v0, v1, v2, v3}, Lcom/pccw/sms/ChatPageActivity;->access$3500(Lcom/pccw/sms/ChatPageActivity;ZLandroid/view/View;I)V

    .line 1417
    return-void
.end method
