.class public Lcom/pccw/asynctask/result/SendSMSAsyncResult;
.super Ljava/lang/Object;
.source "SendSMSAsyncResult.java"


# instance fields
.field public messageId:I

.field public resp:Lcom/pccw/mobile/server/response/SendSMSResponse;


# direct methods
.method public constructor <init>(Lcom/pccw/mobile/server/response/SendSMSResponse;I)V
    .locals 0
    .param p1, "resp"    # Lcom/pccw/mobile/server/response/SendSMSResponse;
    .param p2, "messageId"    # I

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->resp:Lcom/pccw/mobile/server/response/SendSMSResponse;

    .line 13
    iput p2, p0, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->messageId:I

    .line 14
    return-void
.end method


# virtual methods
.method public getMessageId()I
    .locals 1

    .prologue
    .line 17
    iget v0, p0, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->messageId:I

    return v0
.end method

.method public getResp()Lcom/pccw/mobile/server/response/SendSMSResponse;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->resp:Lcom/pccw/mobile/server/response/SendSMSResponse;

    return-object v0
.end method

.method public setMessageId(I)V
    .locals 0
    .param p1, "messageId"    # I

    .prologue
    .line 21
    iput p1, p0, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->messageId:I

    .line 22
    return-void
.end method

.method public setResp(Lcom/pccw/mobile/server/response/SendSMSResponse;)V
    .locals 0
    .param p1, "resp"    # Lcom/pccw/mobile/server/response/SendSMSResponse;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/pccw/asynctask/result/SendSMSAsyncResult;->resp:Lcom/pccw/mobile/server/response/SendSMSResponse;

    .line 30
    return-void
.end method
