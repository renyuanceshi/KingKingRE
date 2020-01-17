.class public Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "CheckPrepaidBalanceResponse.java"


# instance fields
.field public balance:Ljava/lang/String;

.field public current_date_time:Ljava/lang/String;

.field public lower_than_threshold:Ljava/lang/String;

.field public resultcode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 7
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;->resultcode:Ljava/lang/String;

    .line 8
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;->lower_than_threshold:Ljava/lang/String;

    .line 9
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;->current_date_time:Ljava/lang/String;

    .line 10
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckPrepaidBalanceResponse;->balance:Ljava/lang/String;

    return-void
.end method
