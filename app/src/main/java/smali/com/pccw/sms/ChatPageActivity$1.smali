.class Lcom/pccw/sms/ChatPageActivity$1;
.super Ljava/lang/Object;
.source "ChatPageActivity.java"

# interfaces
.implements Lcom/pccw/sms/service/listener/ISendSMSServiceListener;


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
    .line 191
    iput-object p1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBeforeSend(I)V
    .locals 0
    .param p1, "messageId"    # I

    .prologue
    .line 223
    return-void
.end method

.method public onSendFail()V
    .locals 3

    .prologue
    .line 213
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/pccw/sms/ChatPageActivity;->access$002(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 214
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    .line 215
    .local v0, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    if-eqz v0, :cond_0

    .line 216
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$200(Lcom/pccw/sms/ChatPageActivity;)V

    .line 218
    :cond_0
    return-void
.end method

.method public onSendSuccess(I)V
    .locals 3
    .param p1, "messageId"    # I

    .prologue
    .line 204
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/pccw/sms/ChatPageActivity;->access$002(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 205
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    .line 206
    .local v0, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    if-eqz v0, :cond_0

    .line 207
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$200(Lcom/pccw/sms/ChatPageActivity;)V

    .line 209
    :cond_0
    return-void
.end method

.method public onSending(I)V
    .locals 3
    .param p1, "messageId"    # I

    .prologue
    .line 195
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/pccw/sms/ChatPageActivity;->access$002(Lcom/pccw/sms/ChatPageActivity;Z)Z

    .line 196
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$100(Lcom/pccw/sms/ChatPageActivity;)Lcom/pccw/sms/bean/ChatPageListView;

    move-result-object v0

    .line 197
    .local v0, "theChatPageListView":Lcom/pccw/sms/bean/ChatPageListView;
    if-eqz v0, :cond_0

    .line 198
    iget-object v1, p0, Lcom/pccw/sms/ChatPageActivity$1;->this$0:Lcom/pccw/sms/ChatPageActivity;

    invoke-static {v1}, Lcom/pccw/sms/ChatPageActivity;->access$200(Lcom/pccw/sms/ChatPageActivity;)V

    .line 200
    :cond_0
    return-void
.end method
