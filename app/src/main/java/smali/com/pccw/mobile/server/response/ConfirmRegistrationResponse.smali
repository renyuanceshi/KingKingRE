.class public Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;
.super Lcom/pccw/mobile/server/api/ApiResponse;
.source "ConfirmRegistrationResponse.java"


# instance fields
.field public activateFirstTime:Ljava/lang/String;

.field public message:Ljava/lang/String;

.field public resultcode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/pccw/mobile/server/api/ApiResponse;-><init>()V

    .line 8
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->resultcode:Ljava/lang/String;

    .line 9
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->message:Ljava/lang/String;

    .line 10
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pccw/mobile/server/response/ConfirmRegistrationResponse;->activateFirstTime:Ljava/lang/String;

    return-void
.end method
