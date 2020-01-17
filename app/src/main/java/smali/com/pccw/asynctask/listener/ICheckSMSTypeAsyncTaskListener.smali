.class public interface abstract Lcom/pccw/asynctask/listener/ICheckSMSTypeAsyncTaskListener;
.super Ljava/lang/Object;
.source "ICheckSMSTypeAsyncTaskListener.java"


# virtual methods
.method public abstract onCheckFail()V
.end method

.method public abstract onCheckSuccess(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/sip/SMSType;",
            ">;)V"
        }
    .end annotation
.end method
