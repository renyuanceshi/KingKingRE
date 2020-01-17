.class Lcom/pccw/sms/service/SendSMSService$1;
.super Ljava/lang/Object;
.source "SendSMSService.java"

# interfaces
.implements Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/service/SendSMSService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/service/SendSMSService;


# direct methods
.method constructor <init>(Lcom/pccw/sms/service/SendSMSService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/service/SendSMSService;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/pccw/sms/service/SendSMSService$1;->this$0:Lcom/pccw/sms/service/SendSMSService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBeforeSend(I)V
    .locals 3
    .param p1, "messageId"    # I

    .prologue
    .line 48
    iget-object v1, p0, Lcom/pccw/sms/service/SendSMSService$1;->this$0:Lcom/pccw/sms/service/SendSMSService;

    iget-object v1, v1, Lcom/pccw/sms/service/SendSMSService;->listenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    .line 49
    .local v0, "listener":Lcom/pccw/sms/service/listener/ISendSMSServiceListener;
    invoke-interface {v0, p1}, Lcom/pccw/sms/service/listener/ISendSMSServiceListener;->onBeforeSend(I)V

    goto :goto_0

    .line 51
    .end local v0    # "listener":Lcom/pccw/sms/service/listener/ISendSMSServiceListener;
    :cond_0
    return-void
.end method

.method public onSendFail()V
    .locals 3

    .prologue
    .line 41
    iget-object v1, p0, Lcom/pccw/sms/service/SendSMSService$1;->this$0:Lcom/pccw/sms/service/SendSMSService;

    iget-object v1, v1, Lcom/pccw/sms/service/SendSMSService;->listenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    .line 42
    .local v0, "listener":Lcom/pccw/sms/service/listener/ISendSMSServiceListener;
    invoke-interface {v0}, Lcom/pccw/sms/service/listener/ISendSMSServiceListener;->onSendFail()V

    goto :goto_0

    .line 44
    .end local v0    # "listener":Lcom/pccw/sms/service/listener/ISendSMSServiceListener;
    :cond_0
    return-void
.end method

.method public onSendSuccess(I)V
    .locals 3
    .param p1, "messageId"    # I

    .prologue
    .line 34
    iget-object v1, p0, Lcom/pccw/sms/service/SendSMSService$1;->this$0:Lcom/pccw/sms/service/SendSMSService;

    iget-object v1, v1, Lcom/pccw/sms/service/SendSMSService;->listenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    .line 35
    .local v0, "listener":Lcom/pccw/sms/service/listener/ISendSMSServiceListener;
    invoke-interface {v0, p1}, Lcom/pccw/sms/service/listener/ISendSMSServiceListener;->onSendSuccess(I)V

    goto :goto_0

    .line 37
    .end local v0    # "listener":Lcom/pccw/sms/service/listener/ISendSMSServiceListener;
    :cond_0
    return-void
.end method

.method public onSending(I)V
    .locals 3
    .param p1, "messageId"    # I

    .prologue
    .line 27
    iget-object v1, p0, Lcom/pccw/sms/service/SendSMSService$1;->this$0:Lcom/pccw/sms/service/SendSMSService;

    iget-object v1, v1, Lcom/pccw/sms/service/SendSMSService;->listenerList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    .line 28
    .local v0, "listener":Lcom/pccw/sms/service/listener/ISendSMSServiceListener;
    invoke-interface {v0, p1}, Lcom/pccw/sms/service/listener/ISendSMSServiceListener;->onSending(I)V

    goto :goto_0

    .line 30
    .end local v0    # "listener":Lcom/pccw/sms/service/listener/ISendSMSServiceListener;
    :cond_0
    return-void
.end method
