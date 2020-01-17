.class public Lcom/pccw/sms/service/SendSMSService;
.super Ljava/lang/Object;
.source "SendSMSService.java"


# static fields
.field private static _instance:Lcom/pccw/sms/service/SendSMSService;


# instance fields
.field chatId:I

.field ctx:Landroid/content/Context;

.field listenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/sms/service/listener/ISendSMSServiceListener;",
            ">;"
        }
    .end annotation
.end field

.field messageItemService:Lcom/pccw/sms/service/MessageItemService;

.field recipientsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/pccw/sms/service/SendSMSService$1;

    invoke-direct {v0, p0}, Lcom/pccw/sms/service/SendSMSService$1;-><init>(Lcom/pccw/sms/service/SendSMSService;)V

    iput-object v0, p0, Lcom/pccw/sms/service/SendSMSService;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/pccw/sms/service/SendSMSService;->listenerList:Ljava/util/List;

    .line 59
    return-void
.end method

.method public static getInstance()Lcom/pccw/sms/service/SendSMSService;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/pccw/sms/service/SendSMSService;->_instance:Lcom/pccw/sms/service/SendSMSService;

    if-nez v0, :cond_0

    .line 64
    new-instance v0, Lcom/pccw/sms/service/SendSMSService;

    invoke-direct {v0}, Lcom/pccw/sms/service/SendSMSService;-><init>()V

    sput-object v0, Lcom/pccw/sms/service/SendSMSService;->_instance:Lcom/pccw/sms/service/SendSMSService;

    .line 65
    :cond_0
    sget-object v0, Lcom/pccw/sms/service/SendSMSService;->_instance:Lcom/pccw/sms/service/SendSMSService;

    return-object v0
.end method


# virtual methods
.method public addListener(Lcom/pccw/sms/service/listener/ISendSMSServiceListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/pccw/sms/service/SendSMSService;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    return-void
.end method

.method public removeListener(Lcom/pccw/sms/service/listener/ISendSMSServiceListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/pccw/sms/service/listener/ISendSMSServiceListener;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/pccw/sms/service/SendSMSService;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/pccw/sms/service/SendSMSService;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 76
    :cond_0
    return-void
.end method

.method public resendMessageWithId(IILandroid/content/Context;)V
    .locals 3
    .param p1, "messageId"    # I
    .param p2, "chatId"    # I
    .param p3, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/pccw/exception/NoNetworkException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-static {p3}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 91
    new-instance v1, Lcom/pccw/exception/NoNetworkException;

    const-string/jumbo v2, "Error:No Network"

    invoke-direct {v1, v2}, Lcom/pccw/exception/NoNetworkException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    :cond_0
    new-instance v0, Lcom/pccw/asynctask/ResendSMSAsyncTask;

    iget-object v1, p0, Lcom/pccw/sms/service/SendSMSService;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-direct {v0, p2, v1, p3}, Lcom/pccw/asynctask/ResendSMSAsyncTask;-><init>(ILcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;Landroid/content/Context;)V

    .line 95
    .local v0, "service":Lcom/pccw/asynctask/ResendSMSAsyncTask;
    invoke-virtual {v0, p1}, Lcom/pccw/asynctask/ResendSMSAsyncTask;->resendMessageWithMessageId(I)V

    .line 96
    return-void
.end method

.method public sendMessage(Ljava/lang/String;ILandroid/content/Context;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "chatId"    # I
    .param p3, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/pccw/exception/NoNetworkException;
        }
    .end annotation

    .prologue
    .line 80
    invoke-static {p3}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 81
    new-instance v1, Lcom/pccw/exception/NoNetworkException;

    const-string/jumbo v2, "Error:No Network"

    invoke-direct {v1, v2}, Lcom/pccw/exception/NoNetworkException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 84
    :cond_0
    new-instance v0, Lcom/pccw/asynctask/SendSMSAsyncTask;

    iget-object v1, p0, Lcom/pccw/sms/service/SendSMSService;->sendSMSAsyncTaskListener:Lcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;

    invoke-direct {v0, p2, v1, p3}, Lcom/pccw/asynctask/SendSMSAsyncTask;-><init>(ILcom/pccw/asynctask/listener/ISendSMSAsyncTaskListener;Landroid/content/Context;)V

    .line 85
    .local v0, "service":Lcom/pccw/asynctask/SendSMSAsyncTask;
    invoke-virtual {v0, p1}, Lcom/pccw/asynctask/SendSMSAsyncTask;->sendMessage(Ljava/lang/String;)V

    .line 86
    return-void
.end method
