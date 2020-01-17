.class Lcom/pccw/sms/ChatPageActivity$3;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Lcom/pccw/sms/service/listener/ICheckSMSDeliveryStatusServiceListener;


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
    .line 264
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$3;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckStatusFail()V
    .locals 0

    .prologue
    .line 279
    return-void
.end method

.method public onStatusUpdated()V
    .locals 3

    .prologue
    .line 268
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$3;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/pccw/sms/ChatPageActivity;->access$002(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 269
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$3;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    .line 270
    .local v0, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    if-eqz v0, :cond_0

    .line 271
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$3;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$200(Lcom/pccw/sms/ChatPageActivity;)V

    .line 273
    :cond_0
    return-void
.end method
