.class Lcom/pccw/sms/service/CheckSMSTypeService$1;
.super Ljava/lang/Object;
.source "CheckSMSTypeService.java"

# interfaces
.implements Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/pccw/sms/service/CheckSMSTypeService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/pccw/sms/service/CheckSMSTypeService;


# direct methods
.method constructor <init>(Lcom/pccw/sms/service/CheckSMSTypeService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/pccw/sms/service/CheckSMSTypeService;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/pccw/sms/service/CheckSMSTypeService$1;->this$0:Lcom/pccw/sms/service/CheckSMSTypeService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckFail()V
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/pccw/sms/service/CheckSMSTypeService$1;->this$0:Lcom/pccw/sms/service/CheckSMSTypeService;

    iget-object v0, v0, Lcom/pccw/sms/service/CheckSMSTypeService;->checkSMSServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

    invoke-interface {v0}, Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;->onCheckFail()V

    .line 34
    return-void
.end method

.method public onCheckSuccess(Ljava/util/List;)V
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
    .line 27
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/sip/SMSType;>;"
    iget-object v0, p0, Lcom/pccw/sms/service/CheckSMSTypeService$1;->this$0:Lcom/pccw/sms/service/CheckSMSTypeService;

    iget-object v0, v0, Lcom/pccw/sms/service/CheckSMSTypeService;->checkSMSServiceListener:Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;

    invoke-interface {v0, p1}, Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;->onCheckSuccess(Ljava/util/List;)V

    .line 29
    return-void
.end method
