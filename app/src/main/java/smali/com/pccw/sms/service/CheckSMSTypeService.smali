.class public Lcom/pccw/sms/service/CheckSMSTypeService;
.super Ljava/lang/Object;
.source "CheckSMSTypeService.java"


# instance fields
.field chatId:I

.field checkSMSServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

.field checkSMSTypeAsyncTaskListener:Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;

.field ctx:Landroid/content/Context;

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


# direct methods
.method public constructor <init>(Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;Landroid/content/Context;)V
    .locals 1
    .param p1, "checkSMSServiceListener"    # Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/pccw/sms/service/CheckSMSTypeService$1;

    invoke-direct {v0, p0}, Lcom/pccw/sms/service/CheckSMSTypeService$1;-><init>(Lcom/pccw/sms/service/CheckSMSTypeService;)V

    iput-object v0, p0, Lcom/pccw/sms/service/CheckSMSTypeService;->checkSMSTypeAsyncTaskListener:Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;

    .line 40
    iput-object p1, p0, Lcom/pccw/sms/service/CheckSMSTypeService;->checkSMSServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

    .line 41
    iput-object p2, p0, Lcom/pccw/sms/service/CheckSMSTypeService;->ctx:Landroid/content/Context;

    .line 42
    return-void
.end method


# virtual methods
.method public checkSMSType(Ljava/lang/String;)V
    .locals 3
    .param p1, "number"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/pccw/exception/NoNetworkException;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v1, p0, Lcom/pccw/sms/service/CheckSMSTypeService;->ctx:Landroid/content/Context;

    invoke-static {v1}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 47
    new-instance v1, Lcom/pccw/exception/NoNetworkException;

    const-string/jumbo v2, "Error:No Network"

    invoke-direct {v1, v2}, Lcom/pccw/exception/NoNetworkException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 50
    :cond_0
    new-instance v0, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;

    iget-object v1, p0, Lcom/pccw/sms/service/CheckSMSTypeService;->ctx:Landroid/content/Context;

    iget-object v2, p0, Lcom/pccw/sms/service/CheckSMSTypeService;->checkSMSTypeAsyncTaskListener:Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;

    invoke-direct {v0, v1, v2}, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;-><init>(Landroid/content/Context;Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;)V

    .line 51
    .local v0, "service":Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;
    invoke-virtual {v0, p1}, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->checkSMSType(Ljava/lang/String;)V

    .line 52
    return-void
.end method
