.class public Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "CheckSMSDeliveryStatusResponse.java"


# static fields
.field public static final DELIVERED:Ljava/lang/String; = "Delivered"

.field public static final FAILED:Ljava/lang/String; = "Failed"

.field public static final NOT_FOUND:Ljava/lang/String; = "NG"

.field public static final PENDING:Ljava/lang/String; = "Pending"


# instance fields
.field public resultcode:Ljava/lang/String;

.field public statusList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 15
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;->resultcode:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getResultcode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;->resultcode:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;",
            ">;"
        }
    .end annotation

    .prologue
    .line 27
    iget-object v0, p0, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;->statusList:Ljava/util/List;

    return-object v0
.end method

.method public setResultcode(Ljava/lang/String;)V
    .locals 0
    .param p1, "resultcode"    # Ljava/lang/String;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;->resultcode:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public setStatusList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "statusList":Ljava/util/List;, "Ljava/util/List<Lcom/pccw/mobile/server/entity/SMSDeliveryStatus;>;"
    iput-object p1, p0, Lcom/pccw/mobile/server/response/CheckSMSDeliveryStatusResponse;->statusList:Ljava/util/List;

    .line 32
    return-void
.end method
