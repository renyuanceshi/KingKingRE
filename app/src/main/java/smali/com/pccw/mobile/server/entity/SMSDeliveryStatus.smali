.class public Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;
.super Ljava/lang/Object;
.source "SMSDeliveryStatus.java"


# instance fields
.field messageId:Ljava/lang/String;

.field status:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMessageId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 8
    iget-object v0, p0, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;->messageId:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;->status:Ljava/lang/String;

    return-object v0
.end method

.method public setMessageId(Ljava/lang/String;)V
    .locals 0
    .param p1, "messageId"    # Ljava/lang/String;

    .prologue
    .line 12
    iput-object p1, p0, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;->messageId:Ljava/lang/String;

    .line 13
    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;->status:Ljava/lang/String;

    .line 21
    return-void
.end method
