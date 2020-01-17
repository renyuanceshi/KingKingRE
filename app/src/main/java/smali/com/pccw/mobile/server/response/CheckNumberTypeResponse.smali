.class public Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "CheckNumberTypeResponse.java"


# instance fields
.field public allowRS:Ljava/lang/String;

.field public allow_IDD:Ljava/lang/String;

.field public allowkk:Ljava/lang/String;

.field public brand:Ljava/lang/String;

.field public freeTrialNumberStatus:Ljava/lang/String;

.field public freeTrialPromotionStatus:Ljava/lang/String;

.field public freeTrialUrl_ch:Ljava/lang/String;

.field public freeTrialUrl_en:Ljava/lang/String;

.field public freeTrialVirtualNum:Ljava/lang/String;

.field public isFreeTrial:Ljava/lang/String;

.field public message:Ljava/lang/String;

.field public operator:Ljava/lang/String;

.field public purchaseUrl_ch:Ljava/lang/String;

.field public purchaseUrl_en:Ljava/lang/String;

.field public purchasedVirtualNumber:Ljava/lang/String;

.field public registeredFreeTrial:Ljava/lang/String;

.field public resultcode:Ljava/lang/String;

.field public simClass:Ljava/lang/String;

.field public simType:Ljava/lang/String;

.field public status:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 6
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->resultcode:Ljava/lang/String;

    .line 7
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simType:Ljava/lang/String;

    .line 8
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->operator:Ljava/lang/String;

    .line 9
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->brand:Ljava/lang/String;

    .line 10
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->simClass:Ljava/lang/String;

    .line 11
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->status:Ljava/lang/String;

    .line 12
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowRS:Ljava/lang/String;

    .line 13
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->message:Ljava/lang/String;

    .line 15
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allowkk:Ljava/lang/String;

    .line 17
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->allow_IDD:Ljava/lang/String;

    .line 18
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->isFreeTrial:Ljava/lang/String;

    .line 19
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->registeredFreeTrial:Ljava/lang/String;

    .line 20
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialVirtualNum:Ljava/lang/String;

    .line 21
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialNumberStatus:Ljava/lang/String;

    .line 22
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialPromotionStatus:Ljava/lang/String;

    .line 23
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->purchasedVirtualNumber:Ljava/lang/String;

    .line 25
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialUrl_ch:Ljava/lang/String;

    .line 26
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->freeTrialUrl_en:Ljava/lang/String;

    .line 27
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->purchaseUrl_ch:Ljava/lang/String;

    .line 28
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckNumberTypeResponse;->purchaseUrl_en:Ljava/lang/String;

    return-void
.end method
