.class final Lcom/pccw/mobile/util/ErrorMsgUtil$1;
.super Ljava/lang/Object;
.source "ErrorMsgUtil.java"

# interfaces
.implements Lcom/pccw/mobile/server/api/ApiResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/pccw/mobile/util/ErrorMsgUtil;->isOversea(Landroid/content/Context;)Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponseFailed()V
    .locals 1

    .prologue
    .line 109
    sget-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->FAIL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    sput-object v0, Lcom/pccw/mobile/util/ErrorMsgUtil;->oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    .line 110
    return-void
.end method

.method public onResponseSuccess(Lcom/pccw/mobile/server/api/ApiResponse;)V
    .locals 2
    .param p1, "response"    # Lcom/pccw/mobile/server/api/ApiResponse;

    .prologue
    .line 92
    move-object v0, p1

    check-cast v0, Lcom/pccw/mobile/server/response/CheckLocationResponse;

    .line 98
    .local v0, "res":Lcom/pccw/mobile/server/response/CheckLocationResponse;
    iget-object v1, v0, Lcom/pccw/mobile/server/response/CheckLocationResponse;->isHK:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 99
    sget-object v1, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->LOCAL:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    sput-object v1, Lcom/pccw/mobile/util/ErrorMsgUtil;->oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    .line 103
    :goto_0
    return-void

    .line 101
    :cond_0
    sget-object v1, Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;->OVERSEA:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    sput-object v1, Lcom/pccw/mobile/util/ErrorMsgUtil;->oversea:Lcom/pccw/mobile/util/ErrorMsgUtil$CheckOverseaResult;

    goto :goto_0
.end method
