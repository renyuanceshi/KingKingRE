.class public Lcom/pccw/mobile/server/response/SendSMSResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "SendSMSResponse.java"


# instance fields
.field public message:Ljava/lang/String;

.field public resultCode:Ljava/lang/String;

.field public serverMessageId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 8
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->resultCode:Ljava/lang/String;

    .line 9
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->message:Ljava/lang/String;

    .line 10
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->serverMessageId:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getResultCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->resultCode:Ljava/lang/String;

    return-object v0
.end method

.method public getServerMessageId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->serverMessageId:Ljava/lang/String;

    return-object v0
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->message:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public setResultCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "resultCode"    # Ljava/lang/String;

    .prologue
    .line 16
    iput-object p1, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->resultCode:Ljava/lang/String;

    .line 17
    return-void
.end method

.method public setServerMessageId(Ljava/lang/String;)V
    .locals 0
    .param p1, "serverMessageId"    # Ljava/lang/String;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/pccw/mobile/server/response/SendSMSResponse;->serverMessageId:Ljava/lang/String;

    .line 29
    return-void
.end method
