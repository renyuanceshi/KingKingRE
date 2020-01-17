.class public Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;
.super Landroid/os/AsyncTask;
.source "CheckSMSTypeAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/util/List",
        "<",
        "Lcom/pccw/mobile/sip/SMSType;",
        ">;>;"
    }
.end annotation


# instance fields
.field checkSMSTypeAsyncTaskListener:Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;

.field ctx:Landroid/content/Context;

.field sender:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "checkSMSTypeListenter"    # Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->ctx:Landroid/content/Context;

    .line 24
    iput-object p2, p0, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->checkSMSTypeAsyncTaskListener:Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;

    .line 25
    return-void
.end method


# virtual methods
.method public checkSMSType(Ljava/lang/String;)V
    .locals 2
    .param p1, "number"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/pccw/exception/NoNetworkException;
        }
    .end annotation

    .prologue
    .line 28
    iget-object v0, p0, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->ctx:Landroid/content/Context;

    invoke-static {v0}, Lcom/pccw/mobile/sip/util/NetworkUtils;->isWifiAvailable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/pccw/exception/NoNetworkException;

    const-string/jumbo v1, "Error:No Network"

    invoke-direct {v0, v1}, Lcom/pccw/exception/NoNetworkException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 33
    return-void
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 15
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->doInBackground([Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .param p1, "numbers"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 38
    new-instance v0, Lcom/pccw/mobile/sip/service/SMSTypeService;

    iget-object v2, p0, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->ctx:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/pccw/mobile/sip/service/SMSTypeService;-><init>(Landroid/content/Context;)V

    .line 40
    .local v0, "smstypeService":Lcom/pccw/mobile/sip/service/SMSTypeService;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .local v1, "typesList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v0, v2}, Lcom/pccw/mobile/sip/service/SMSTypeService;->getSMSTypeList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 43
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    .end local v1    # "typesList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    :cond_0
    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 15
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    if-eqz p1, :cond_0

    .line 49
    iget-object v0, p0, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->checkSMSTypeAsyncTaskListener:Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;

    invoke-interface {v0, p1}, Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;->onCheckSuccess(Ljava/util/List;)V

    .line 53
    :goto_0
    return-void

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/pccw/asynctask/CheckSMSTypeAsyncTask;->checkSMSTypeAsyncTaskListener:Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;

    invoke-interface {v0}, Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;->onCheckFail()V

    goto :goto_0
.end method
