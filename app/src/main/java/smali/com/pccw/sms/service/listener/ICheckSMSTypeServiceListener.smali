.class public interface abstract Lcom/pccw/sms/service/listener/ICheckSMSTypeServiceListener;
.super Ljava/lang/Object;
.source "ICheckSMSTypeServiceListener.java"


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
